Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100297;
	b=P385mO0vJFXehUKcwKiKn4xxbKeIpjX8MovY/sBQkbY1U6nyR1VcNe7xFUbehTuEX59n
	 Bc5IGmqYr5uSuGCpBoN394sMjJfHWYG5EqlGgomR9JJ1TOR36EWyZ3N8gOrb9jEHB4PwE
	 XlyXyurJElMI1D/8d5jc/i7uBoFc8n+OjgSWqBrlSmjjBrEu+40LsuDI1l03t8jJ2elnT
	 GHOun+P2xr9DN88rOejQrqp1QXTRQ4gDp2oEr3iyDbTGP4dVMKwDHdfCPUTU4jg5blquL
	 eEQrXkAeO1IJpYyZlHLgQ7tuSZ0BcUsNvi+/otw/P37sfHj1pDjE/QblLm6NSezPJPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100297;
	h=DMARC-Filter:DKIM-Signature:Date:X-sib-id:Cc:Message-Id:
	 List-Unsubscribe-Post:Feedback-ID:To:Subject:Origin-messageId:From:
	 List-Unsubscribe:X-CSA-Complaints:X-Mailin-EID:X-Mailer:Mime-Version:
	 Content-Transfer-Encoding;
	bh=sZfzNXh4BND9cCS6sfS5q9SmaLVYUprSC4+0dzXm2Xo=;
	b=y9WoK24KUcaDQKTRI798+oemHK28MiHAx6CF8ONWWFqnEBnL2ZG4lNIw/Pa5JC3JKZCI
	 MLUzyTkJxYUcri81hqOFLWNbC54DBChfA0oyM2JDRcPqmtkgGNHtyIAssvpFuEhMDVl8W
	 bxVh/zzoTuIehowOe7YN+g4/1mxe4I6lwOnCzNzwQ2I0kz/NshQuSfp1NnJIc1gx+g7Mk
	 bOWDVkjKRJw8I4Tn1m/zUvB4NPrIJVRFkaGwXYGvFUgDpwavyiw9+vLXUagEdgpGN6GOe
	 sxh8RewLQJ8R413FUh/O5KMlalDD83snWWUs72K05EIx19LbJpntqHvIhPg5EkzMK/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gy.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=VHSD3NwN;
	arc=none smtp.remote-ip=77.32.148.25
Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBB4606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBB4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=VHSD3NwN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=sZfzNXh4BND9cCS6sfS5q9SmaLVYUprSC4+0dzXm2Xo=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=VHSD3NwNbc48NiJY0N9vLbp4stGE25MbXdBTxSez3iDvLK2EvaVZ6gZtepmzwV6SeCnPD36Wc6OG
        affDJ66NXpVIGbQn9ME8bRuEMGaGEzj8Y5dxuvdMhmnoY/yPDu3omkS3UTS+kk4LH9mRDbiXJlBY
        QGRZjRm2FsO+oH6MvBGppGF6Cqti2P+SStmZUz8fuYTPJySCFI8/Qe0YRjGoG+1o+r3E/UJ3LqG8
        jharV8dzSy3D5l3ZZugplenRX7NBqtaDTnrWwXDig+KD4ogZiCOczmcxGYPyIYaT2km0cIxeCVPh
        zwgulj/FVtvkiIa9+WRD+rMNGL7zzKvO98Uh6Q==
Date: Sat,  7 Nov 2026 17:11:31 -0800
X-sib-id: o6pEpaboJ4m3AmXEEX-xdeQQnJevBjBWXeFrDn6COIsKHO7WnGNFXGa3RuQF3MBdUwXk-xSXmRzu49_x7evfBbXy2jnXIHvSXRNUuYHeKvc5YJWhuQcewkAfymprkw6O0pP1LQ6vFiHp2vHj4FcZk_yKWc9NL63S2BOPdgqrMsc3Ys_mlnLj7nVy4w
Cc: <linux-fbdev@vger.kernel.org>,  <linux-staging@lists.linux.dev>,  <linux-kernel@vger.kernel.org>,  "DelaySystem" <delaysystem@tubot.lat>
Message-Id: <20261108011131.1124831-1-DelaySystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.25:11287567_-1:11287567:Sendinblue
To: <sudipm.mukherjee@gmail.com>,<teddy.wang@siliconmotion.com>,<gregkh@linuxfoundation.org>
Subject: [PATCH v2] staging: sm750fb: fix remaining spelling mistakes in readme
Origin-messageId: <20261108011131.1124831-1-DelaySystem@tubot.lat>
From: "DelaySystem" <DelaySystem@tubot.lat>
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDczOTMwODc4fmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmd%2BPDIwMjYxMTA4MDExMTMxLjExMjQ4MzEtMS1EZWxheVN5c3RlbUB0dWJvdC5sYXQ%2Bfmd5LmQuc2VuZGVyLXNpYi5jb20%3D
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fix two spelling mistakes in the driver readme:

"Silicon MOtion" -> "Silicon Motion"
"otherparm" -> "otherparam" (matching the example above it)

Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
v2: resend in plain text via git send-email; v1 was corrupted by the
webmail send path (HTML part, whitespace mangled).

Note: this complements Hussain Sitamouwala's unmerged patch
<20261104112629.180890-1-husainsitamuwala21@gmail.com>, which fixes
"defaulty" and "althernative" in this same file. The two patches touch
different lines and do not conflict.

 drivers/staging/sm750fb/readme | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/readme b/drivers/staging/sm750fb/readm=
e
index cfa45958b9d2..dd8ba1a85695 100644
--- a/drivers/staging/sm750fb/readme
+++ b/drivers/staging/sm750fb/readme
@@ -1,5 +1,5 @@
 Introduction:
-	SM750 of Silicon MOtion is pci express display controller device.
+	SM750 of Silicon Motion is pci express display controller device.
 	The SM750 embedded graphics features include:
 	- dual display
 	- 2D acceleration
@@ -27,7 +27,7 @@ About the kernel module parameter of driver:
 		ahead of parameters,so,it looks like:
 		video=3Dsm750fb:noaccel,1280x1024@60,otherparam,etc...
 		it equal to modular method with below command:
-		insmod ./sm750fb.ko g_option=3D"noaccel:1280x1024@60:otherparm:etc..."
+		insmod ./sm750fb.ko g_option=3D"noaccel:1280x1024@60:otherparam:etc..."
=20
 	2) if you put 800x600 into the parameter without bpp and
 		refresh rate, kernel driver will defaulty use 16bpp and 60hz
--=20
2.34.1


