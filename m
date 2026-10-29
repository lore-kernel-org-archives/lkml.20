Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253510;
	b=BZgBTsthk/vF8Q8i+6KbxhWCLDyh2Og/znRXZRAn4nNu7TIyO1B6AR8W2uGXzcMlz5zH
	 vukmc4XRf9D7quGoUEkGmWRHNJt5Pb9SDJqQ8ODwmeAlTb0DpB3c5NW8ZuqmnJnH9BP1N
	 sa0cKqaS49bWbsQrUQy7G46+tioBsloeBne0o82L1LcxAQLfJ8ROrF/d/iDcghbTb7YhI
	 l9sBhecMYQdV4fIwBpaEyzjc9OEPPyh0gw5Wf+ifUE3eczXxYHitLUDoYJA3ogJDX/rb/
	 Rjn/uvLXMtCQ2RQI84GnPOtDoD36JymIeFyHgJre83qzHDeSDuWdppRLabboEtx43OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uccmeCHaHJdMWir67NKZcEGmBbvnIupxOj2VL9Ao9Ls=;
	b=ERgGb8iFbAtaARWTQ5w0s0vc+aqI4XbYlkVntzZ5AmgTyfHNVIGuCH6mNU8G01ae8ciZ
	 SZDSL7KXZx8SJRg1XsTXPXL4B27W/ATBWSOIC2olDePAUFGpgVvHzZyynGUZqEmDAN+kg
	 MF1djQFF8SS0HEMvOoBuOdZ1c6qsQ/AI8fvuRIygk0+jtH2s62q/OP1NAUd5AYeWIfG+a
	 ptk4hBrwO+bGJlDp3mhfdUiOdm4pyzUT/wFrBeaOd47y6c3zCcmgPHDWESxNmiD6dfxxF
	 J9zPkZRbuC7+cNkZGdmdseE+QoUNbIgZhSkqeb/Azj4Yc6YX3yVY8v6CtrtIwol6T/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b="gxFdJpr/";
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EDD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00EDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=gxFdJpr/
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id A3F0714C2D6;
	Thu, 29 Oct 2026 06:58:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1793253506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uccmeCHaHJdMWir67NKZcEGmBbvnIupxOj2VL9Ao9Ls=;
	b=gxFdJpr/0LBsrQYke7wZ6t4B2VNnOwI0omJ147Z0+pdSwNm44kqk/YxP5STLT/xM6g7eUj
	QhCDnx/OXQbZbhrpEpKq6hlADsraoxbTw+kAsi17u7qWjlg0o0sp1ej/L62ImdjRhdQK3T
	0fwmP1D5v9IuqFSfgGKFJOKOPE8pUXp+omMmIDqx1BIeHeigXxvHuApuAUGTXpaFuezW/G
	/UcvGhLwF4hQf0lT8Rjm6/8bzuoME+8+uQ3/hFVm4SRuSUAW1FqYgeHcOO1z5sdMS33FzV
	vOwn75RlmYCTlFDGRop3qDaLoBwGP5q58SnInH+gx7nmVrC1fGbsPJccffg2oA==
Received: from gaia.codewreck.org (localhost.lan [127.0.0.1])
	by gaia.codewreck.org (OpenSMTPD) with ESMTP id 51c5776a;
	Thu, 29 Oct 2026 05:58:22 +0000 (UTC)
From: Dominique Martinet <asmadeus@codewreck.org>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Cc: Hui Peng <benquike@gmail.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] 9p: reject RERROR/RLERROR with zero errcode
Date: Thu, 29 Oct 2026 05:58:00 +0000
Message-ID: <20261029055801.3-1-asmadeus@codewreck.org>
X-Mailer: git-send-email 2.54.0
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

From: Hui Peng <benquike@gmail.com>

In p9_check_errors() (net/9p/client.c), a malicious or buggy 9p server
returning P9_RERROR or P9_RLERROR with ecode == 0 causes
p9_check_errors() to return 0 (success) while leaving the unparsed
response payload as if the expected reply message type succeeded.

Map ecode == 0 on RERROR / RLERROR to -EPROTO.

Link: https://lore.kernel.org/all/20260919221734.3708000-1-benquike@gmail.com/
Signed-off-by: Hui Peng <benquike@gmail.com>
---
This is a resend of the other half of that commit, since the original
author never bothered to do it.
It's valid enough to be worth the 5 minutes to resend it...

I kept their commit message & code verbatim so kept them author

 net/9p/client.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/9p/client.c b/net/9p/client.c
index ef64546c6d52..e63e8c2a853d 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -448,6 +448,9 @@ static int p9_check_errors(struct p9_client *c, struct p9_req_t *req)
 		p9_debug(P9_DEBUG_9P, "<<< RLERROR (%d)\n", -ecode);
 	}
 
+	if (!err)
+		err = -EPROTO;
+
 	return err;
 
 out_err:
-- 
2.56.0

