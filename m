Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780357;
	b=BBeDtZnLwdasU9mwnwhz+OEcsCHrcTI9weLpL69kd7EBYjyT9Y0o24GVYGYHMjJlv+uv
	 MZZu3q/zTUugIb5dmDZjPG50XDHgaWkRh8in04yOV+lxE+nw+0iMGFEVP2CwL707Nmm9e
	 b7g3zWqUg6tWz33KarfEIxLtUPr8SZRJM7BWlj86cLF775LWQEq/YDn0CRS2aJME1qYGg
	 CTzaodVAYw6/qxrY/YsEeCKynHcXbwiJCnU5hOkgbXcD/16ThFlknQOmEorhNpDHIa6OH
	 KiasysroobLE979QOUQ0CTPwxyXA10H03jvUHsQesXAkPvYVpPm+uxX5kPgGXCin8pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780357;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DRomMyMPrRWlOAYAGPu7tvN+fhaYoqbxpR/jJJoldWA=;
	b=xw+j96+UnhKd78HqgfP9zETf92nKrzYd8h0Zmmu5UFnqzUPRapqSr1SAGWJmDqOorujc
	 SWWZUsSujwDK/k8TVIjDzg/lvVP8H+eDKu54LzFHDlJeVUPC5PU0G6QmCIXmL96YE25US
	 gYYc9BwjtJRUO89fetDAMA39Zk5pCCWrVusGq0qNsh1PM8h/GvJ84O3jAwepebRGWbYcD
	 jNiAF6bCAdBT3SLtZwgXwjdBoQchL0qMwBZagtTWSsbPF7B46b6LfWSg1ZBZdDQu4WwWZ
	 iuSzCXy5qtOF/zZazdOcb6mTMUki6fyz9tLRmTkz3GlAiOSwkvCtDiyRYDG4BVGdyuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Xk72a7Su;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCC0606A33B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCC0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Xk72a7Su
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Xk72a7SuM96yT2HyztB6fjHRj+9F3PJbZJSGKWqnigwCbmMsps7bN/Bx1FI7spUdpPU733anRCMNp
	 PATQRw8ZMO7z9kGU1C2DEu1CbBXtFpKRcCeKy4pjaqY0KWq8PIePIU6MR+A+7LAs7Up9bYXvQs7y+f
	 FmeoerzYaKRvpHvc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96aeaea7e17c-a10e4;
	Wed, 04 Nov 2026 16:19:13 +0800 (CST)
X-RM-TRANSID:2ee96aeaea7e17c-a10e4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100250 (unknown[36.137.216.21])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76aeaea7a6a7-1a9dc;
	Wed, 04 Nov 2026 16:19:13 +0800 (CST)
X-RM-TRANSID:2ee76aeaea7a6a7-1a9dc
From: Gu Bin <gubin@cmss.chinamobile.com>
To: mst@redhat.com
Cc: jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/virtio/virtio-trace: fix swapped read/write label in path error
Date: Wed,  4 Nov 2026 16:19:02 +0800
Message-ID: <20261104081903.1834-1-gubin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make_path() builds the path whose direction is given by
this_is_write_path, but the pr_err() labels it with the opposite
direction: "read" when building the write path and "write" when
building the read path, pointing the user at the wrong side when
path generation fails. This is a cosmetic fix: only the error
message text is wrong, the path construction logic is unaffected.

Swap the literals so the message matches the attempted path.

Fixes: 108fc82596e3 ("tools: Add guest trace agent as a user tool")
Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
---
 tools/virtio/virtio-trace/trace-agent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtio/virtio-trace/trace-agent.c b/tools/virtio/virtio-trace/trace-agent.c
index 7e2d9bbf0b84..555521fc8bfd 100644
--- a/tools/virtio/virtio-trace/trace-agent.c
+++ b/tools/virtio/virtio-trace/trace-agent.c
@@ -130,7 +130,7 @@ static const char *make_path(int cpu_num, bool this_is_write_path)
 
 	if (ret <= 0) {
 		pr_err("Failed to generate %s path(CPU#%d):%d\n",
-			this_is_write_path ? "read" : "write", cpu_num, ret);
+			this_is_write_path ? "write" : "read", cpu_num, ret);
 		goto error;
 	}
 
-- 
2.55.0.windows.3



