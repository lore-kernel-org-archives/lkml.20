Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EC033ADAC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425988; cv=none; b=hIkQf4jdQ4p2X9ym4TRoZj5mMOKE+r3uspaMgCu/EVzw2nsdni6tgheRSMp7ilP1a9R/3IkTtYbyuCx5W6j2AYppdZn0prRe/dk5+iUG1kilbcMLoZSZfi+vmZKysIDxLawpzbfcaMhctyp1kaAD3RmHrP20w9Kg2MsF6TKhCds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425988; c=relaxed/simple;
	bh=ZLeGGfX3l9FH1EvGtezq/Vp2+M0cZAbfU9CYCZrZg5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ka4MNoIKunVJZDyRV6A99A5cCH1PBf+8kwRQj6ddyHuyu8+KSFqeTZ5Xd0pY45tOMDhbARW+7WJnIZdRIVnwRP2kc/9NLdzaD/vseM8eDJoqTuX1k0qu8NkGDJHa990kUzV5fAu4/JSJSpAqC6+yIBU60Mok7x4F7VsWy8uIbM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=B3dJ5Ltq; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="B3dJ5Ltq"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [186.210.91.235])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id E2BD01201E8;
	Mon, 14 Sep 2026 19:36:22 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1789425385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K3lsqpBcFz0sjXOjdlKfH3Q60LvsMjq7U+Vz+WlBi+c=;
	b=B3dJ5Ltq0S8yPQ7j2J9RBwpuEAAGuU1iIiHyFfeea1C9/IvAwVX0Dlu1AgtqOWm/HSnxnK
	HR5uUzJ3QMOk2Etp3uL5SRwCcOcvY9nAhyQxwJSxbpQ9TmfKnueNIN4lEgDLxp0Vgg+xpw
	DRC/gWz/ruwt9tQq/rBuNCjWWsil5NyifklVPlkQPMdTRSqepnvnn8jxj65uLhAHubUDMU
	RTDYNhjNIbq24orFBRtPeH1l4V82lmj0xdatmtdACc7EVVj6IfbxR6EVZz2tck/8EGDEG6
	tVJPpTbnTEdfNUuH0x/byJ/ZiOqTqtPxKh02KWw25rLKG+qtOJqD7nl91VZsaQ==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: gregkh@linuxfoundation.org
Cc: gawindlin@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Subject: [PATCH] staging: rtl8723bs: use bool for rtw_endofpktfile
Date: Mon, 14 Sep 2026 19:36:19 -0300
Message-ID: <20260914223620.145302-1-matheus.aalmeida@inf.ufrgs.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_endofpktfile() returns only true or false. Use bool as its return
type to accurately describe the function's behavior.

Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
 drivers/staging/rtl8723bs/include/xmit_osdep.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 85c42fa06..9027abbd8 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -35,7 +35,7 @@ void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitb
 unsigned int rtw_remainder_len(struct pkt_file *pfile);
 void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
 int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen);
-signed int rtw_endofpktfile(struct pkt_file *pfile);
+bool rtw_endofpktfile(struct pkt_file *pfile);
 
 void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
 void rtw_os_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe);
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 3b6029c20..87226b6b7 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -43,7 +43,7 @@ int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen)
 	return rlen;
 }
 
-signed int rtw_endofpktfile(struct pkt_file *pfile)
+bool rtw_endofpktfile(struct pkt_file *pfile)
 {
 	if (pfile->pkt_len == 0)
 		return true;
-- 
2.43.0

