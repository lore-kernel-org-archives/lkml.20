Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715505;
	b=u+m+K69nxLDM7s1tlgwb9fgzWWeHgNBJFkQrl612XexbMAnFbhH1q3a6WHH8ciyc/vYs
	 NmFSDDUfvxeBsInWzwUP+7SO/Ohxx+a1GQc7wIsrVsPvnFoTcRdh9TXXvfK4D5J3024Ly
	 cqV9q2BWQPEUv4aW1+PwelLjWGjP1ZUBcCsUcnXx4ab2v2zZCo14PnnMWReKWp5ItaVqO
	 JVk8i59p/Yy63Ex7jnvAc4Eqk8X3rylaEGcYx485KsdZfReVj6u8X400jVSx+JWPOTuEX
	 h6LRjfYOBbEpCvi69UzQMttitMtapWcQwQJrAE6xQyBiXRrurVE1p2j/Ehi8c8ETsQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715505;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=QGJS0xA4UG3gjAut3YXPP6CF0QIi5XAEzRgdpLOQd8U=;
	b=UTzKVH0/A/wGt5EYzCaLHoHez2aSlioKAQRsz4BxH3Cz1wfLfpZfXWnhtEpeX7ZHIB3a
	 u+UyoZK5gKSSRhQMr3j8Udh7T7wYT/GKfltyoT3fjRd/Q2aOrDb231KKh+Hvc5kJSmOAv
	 5d48on+Xn6n7TaNykgrsCl6Ql7f/P80B3Y9FCF+CVXF07y3LPbZF83SepNsjque2tLjRp
	 8IjoB2p2lc2F2K6+pRwugK5v9H4yhoFpTitfoDXaACEyLuOUhJ/icRWPW8qg7Mbi7wsUW
	 j7R8WGnnwdSzZsZH/XyFN2XNq5BaPkYPiGFTr+3Qt+2rt66RCm/7lGO6EY0pXQITxDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=kbpySlvf;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76604606A324;
	Tue,  3 Nov 2026 14:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76604606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=kbpySlvf
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jJrJr3CJTz8v6V;
	Tue, 03 Nov 2026 15:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793715500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QGJS0xA4UG3gjAut3YXPP6CF0QIi5XAEzRgdpLOQd8U=;
	b=kbpySlvfYFTCXG2I11XSYcLfZC5KQxqyeG0s2k4x63SlPYhojzGTOUh6BxEsYKJvVIO0Ah
	ld4hqeUojHurnSqrXc+bptrz8/kA714dD4Nh5oHA1JIBoDt0y9ws4PqeCqdCJZ9rESXWSS
	iOP+xLTcMvT/TKU1uv+p5Gp/rlFw63BUtYTTyUrnNp5CD97VLHixTcg9pW2j7chRNJ94uY
	GofnSkE2DNTT/X1XFcbiQmv7WxVFSStDLWudeH2FhipCmlFV29MSTQfi1gw07pmXZOWupa
	Og6PWwwJzg+hgHoDTOSnR8Y2TORh2SXpI5pZjkEfLl5dxTt+Mu165cKyc7KFkw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] scsi: docs: aic: Fix brackets
Date: Tue,  3 Nov 2026 15:16:12 +0100
Message-ID: <20261103141612.118685-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.55.0
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
X-MBO-RS-ID: 4a3e52096a0d85530c0
X-MBO-RS-META: 95whbgnw6c6wgk3wqmppfkfor6yre5qx

Add missing '}' to lines of code.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
First sent:
 https://lore.kernel.org/all/20260916123458.314458-10-manuelebnerli@mailbox.org/
---
 Documentation/scsi/aic79xx.rst | 2 +-
 Documentation/scsi/aic7xxx.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/scsi/aic79xx.rst b/Documentation/scsi/aic79xx.rst
index 071ff5111..ba5299cb9 100644
--- a/Documentation/scsi/aic79xx.rst
+++ b/Documentation/scsi/aic79xx.rst
@@ -292,7 +292,7 @@ tag_info:{{value[,value...]}[,{value[,value...]}...]}
 
 	::
 
-	    tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}
+	    tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}}
 
 	On Controller 0
 
diff --git a/Documentation/scsi/aic7xxx.rst b/Documentation/scsi/aic7xxx.rst
index bad0e5567..117cd55fd 100644
--- a/Documentation/scsi/aic7xxx.rst
+++ b/Documentation/scsi/aic7xxx.rst
@@ -308,7 +308,7 @@ tag_info:{{value[,value...]}[,{value[,value...]}...]}
 
 	    ::
 
-	        tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}
+	        tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}}
 
 	    On Controller 0:
 
-- 
2.55.0

