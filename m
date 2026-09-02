Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17DE306764
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788316850; cv=none; b=UXdn1ykOH2i1cA7TlCNuCiXs8T0z3InXyelM/lXZY4Yxle+3eFQk2CP40sW3IyfkwAjRcmehtB6NeEGSKONee5va+0vhjRgfVDh0rjzilAqDkS7S2WZ0iYpCCTsd2vofh53jlYUwnaB1U4hOK5e7JOzlmNLrbhU3RbSI4oBC+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788316850; c=relaxed/simple;
	bh=L/HTRAdQbuBHVGqJMmGJykPlsiy91lYm8QcdCRO404s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4Y26qxvc3FOZ+QZbob2Nsk9dml6sIbjN1r0dRNFS0lkGiTrZFrb84GwQ2/fHgNmeK4T3FfCoAdhqpbJexWG121JyEeBENk9n0oUwBZAmbBk1Wu33/Q7bUWGnZ6STHINLWmO9sun7ph074sKDvZOY9J7jENmwBX7diOG50PXLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: af276d46a67711f19a56ed5b684f684d-20260902
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1ecb4081-29e4-40a6-8704-8953cd14db71,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:b15e125e81ed96025580b4375cd8b8e0,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: af276d46a67711f19a56ed5b684f684d-20260902
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 511451335; Wed, 02 Sep 2026 10:40:39 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] tools/firewire: nosy-dump: fix input file handle leak
Date: Wed,  2 Sep 2026 10:39:13 +0800
Message-ID: <20260902023914.959-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The input file handle opened via the --input option is leaked on
multiple exit paths:

1. When fopen() for the output file fails, the already-opened input
   handle is not closed before returning.

2. When fread() reaches EOF while reading from the input file, the
   main loop returns directly, bypassing the cleanup section entirely.

3. On normal exit (e.g., SIGINT), the cleanup section closes output
   and fd but never closes input.

Fix this by closing the input handle on the output-fopen error path
and in the cleanup section, and by changing the fread EOF early return
to a break so that the cleanup section runs.

Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/firewire/nosy-dump.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/firewire/nosy-dump.c b/tools/firewire/nosy-dump.c
index 9cc8626a7e94..7ddb50521c29 100644
--- a/tools/firewire/nosy-dump.c
+++ b/tools/firewire/nosy-dump.c
@@ -947,6 +947,8 @@ int main(int argc, const char *argv[])
 		output = fopen(option_output, "w");
 		if (output == NULL) {
 			fprintf(stderr, "Could not open %s, %m\n", option_output);
+			if (input != NULL)
+				fclose(input);
 			return -1;
 		}
 	}
@@ -973,7 +975,7 @@ int main(int argc, const char *argv[])
 	while (run) {
 		if (input != NULL) {
 			if (fread(&length, sizeof length, 1, input) != 1)
-				return 0;
+				break;
 			fread(buf, 1, length, input);
 		} else {
 			poll(pollfds, 2, -1);
@@ -1014,6 +1016,9 @@ int main(int argc, const char *argv[])
 	if (output != NULL)
 		fclose(output);

+	if (input != NULL)
+		fclose(input);
+
 	if (fd >= 0)
 		close(fd);

--
2.45.2

