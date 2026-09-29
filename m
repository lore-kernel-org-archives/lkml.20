Received: from outbound.qs.icloud.com (qs-2001a-snip4-11.eps.apple.com [57.103.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23E13DE43D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.87.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703544; cv=none; b=hbNIwdFqGgxTDy8nZOlfTzfaGJmrbyNLajuvrYhpE/66zUrfgEbUq4x4GG6fyKPJ3AkNL/Q2vlHWZip2AAPSRxPYSOeLcXg5YKNYnLOMhPK9VkACWs8MEhWCcQ/MqI12Yv6SxK64WSD/PTu4guhIDnuOb0ny4/AGPF4Q5H3C3jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703544; c=relaxed/simple;
	bh=op41yqBeRkLFSbpXWAmHnv7+OKhVkWGHoLK8R0osExs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K8HgG5mbdtaqQTUBA01bW19MNwCuIza1LH3EbHPP6uzfHBgJlHqdMiQiBmiLCglba3WdjcWwioIG3oaJNKSNDn8ajrzkppyfmzQH9WoDS6fPcuEipKdxIkgp+w0BasaFjQo7QT7Rmzte4SYPHkQflSpdO01dYIZEfH2DbUaoLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=khGjy66E; arc=none smtp.client-ip=57.103.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="khGjy66E"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-0 (Postfix) with ESMTPS id 5BAAB18008B0;
	Tue, 29 Sep 2026 17:38:59 +0000 (UTC)
X-ICL-RepId: 01a0ee3f-9436-7732-ba5a-391238524bc7
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQBJHV8GXBxBAEwdWA9LVxQEHV0EUAZTLwhLBC1eCF4fTBwdDlgGEhZdRVoOWwRHFBcbXAAXGVFNDFhbCFsEDx9MDFECQgVWXkgLHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBBFQAVgeVl5aF15NWgJWTQVKA18BWwtCAEkEXg9YAV4ISAZfB1MfQRQdXQRQBlMvCEsELV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790703541; x=1793295541; bh=nnpD3jTknghAubi8Yp4bF/1rEMY8WAPfjQcRgWIcmsw=; h=From:To:Subject:Date:Message-Id:MIME-Version:x-icloud-hme; b=khGjy66Ejp7yb6f8i5y2jeggZ7nVskZIBxMCkN2t4kgm4bEBDkrPh7eDRe5C+HF3fkiPJLHS7J/VsJBSOWvUBUNlhYUHJvFjyizbfzSwlXz/ujLjDjEqYaiAiC4TxZmFSYUh5I6FfwqTzEWRSA9w1kQs5sHYd2LftVTNJxPSLpp6JOvnFqeGOs+uYOdmuN3xtrus5rEGFcRuC8P556TwGsnZl3dLTisDmHvriACVAWFGsOd+q/QekyOOjOKPGGVzlY7JBXbDs9EVvorl9qS0qePyOd6d328Zspsk9+NrhZIPOX6Msn0gNAdNO1bCmEuFhS0z57d+M/6hgPTHqGDZxA==
Received: from enigma-sb.sigma.sbrf.ru (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-0 (Postfix) with ESMTPSA id D2D7C1824EDB;
	Tue, 29 Sep 2026 17:38:57 +0000 (UTC)
From: enigma_137@icloud.com
To: oneukum@suse.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drobyshev Vladimir <enigma_137@icloud.com>
Subject: [PATCH] USB: cdc-acm: add VeriFone VX820 device ID
Date: Tue, 29 Sep 2026 20:38:33 +0300
Message-Id: <20260929173833.105208-1-enigma_137@icloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kKLbXC0vzaC9bXMXKwQwppwHLrwvot4Z
X-Authority-Info-Out: v=2.4 cv=bYZmkePB c=1 sm=1 tr=0 ts=6abbf7b3
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10
 a=lVibkWGspjAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=r_hI2IQ-vy3Bew-0D5oA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3MCBTYWx0ZWRfX6S+XgnJrXQ/k
 5rl9ShLlw4UiG6pk4XRJmqUAD5aLfbOXkCAih9frROcqfXwqp1/TQW7nFisX1VYy1i4pM7egmby
 kOzi4wGmWWueKNRzMXmcZy/cmF7SzUE0815xCZx1UTczBvBlFvTbm8relMFLybHQxOxExFTkNYB
 XUb23D2zJGOhGN6rZr7qsh0flCWKcSmnKGBlcWzl1FrlzYff9bOR6JeFTZy3m0Fqh4AssVcRpus
 ZQ3mDkEEUN9+UGMN3eboBR2ITcE0MC+Zjt3t6K2jhYAR4agYBUOInfSp06o5IAunQFeQq6nDih6
 vmemVgoLn4l6cXQIpAZgwxvFOpUQyT2Hi0TyVgxtdw+7anAbu/wLiLnT7Pqnho=
X-Proofpoint-GUID: kKLbXC0vzaC9bXMXKwQwppwHLrwvot4Z
X-JNJ: AAAAAAABPu3+0ibcdFtZPeHsa+RzNnuaK+w1MBW92WngqXf8f7uGBsvdNpRqzUOD3MuwVyaTUnwfz6CganU4lnMdBkixIpwR4iSjG0fmDQiK+dMWPDMdnAJG0fpJZW6t5D7e2ISQApFsGJx9ashTP3rSxKeEgrWhMhyMOhKwB9tA8ckJt4rk/a8zMx5IflhaA8SlyEQKWWdH6LhyHw53kWtzSnSC8lFr68fOyNhn3n1CxEr47yWDnHfDzqPZz1wNYjFLhFw88aKAH1Kp0P4D4grE8uoLzsH72qv6rjAFfk7GhTpsqN64NMEkBfIg+sw+7FchNRuJhxYUCA01daMR/BQIvlRFVtEq2J0aZXVGhUT8xkFAJtalZE0IFmRBHK7INPPxIADJOo0NG4BO1H84d1YOyEi/48ZQLjXEMHi/ubNN57zILgWYvP2jCoblh6qN7zTP9ztOJnlWDxSJCKvHacJKypy5tayprKrygJSv8jD1vZhTjOVJtMcx4l4vvznzHmR6WD53Ks40fliDuYhb6uc2J9YO14Y/aLP79Ir7bw3qn/pACFF2c/gdfIj4el2htLzi3Vkr1W3zLUQG56T31EyYUTOHN9nHbKQhz5lV2z8jR+cfHDpLLLrEhTiYrdBBInIiF2YoVLikDXJO3rU91ixO4rqUxKlJhfZbvtV3323G6A4E3UTMKmmy/4R1SdkzdsD1OELF1GgKnsqeVRtgSej59No2vF32ADqg8EAOB18lZ5JCseBbSHZ4kJpAGfOumy024ISXS3DDe6wgnzZrGfPQ3BfYHsSX5f2ofEy/L49TawVW0d9tktX/mv1x100yZOIGjZbtdKdy0ZD0Sae0Pz8eo2YXtNqTvTEE6JBXF9MFrAPhHk/odqjTxxIFjykT1covgcGWQCFIdmtSJETIbuTlUp/t2ljlQ5DG6EE+CsSrHA2r6kFPcDSqkfxSI6JoBJAJ8w7q/eurRTf8UY6aOTs5OqBPJua
 3uHk/7N71h5rd0x2q04r5RNbX6SQhufUs+/OwSc1r18I4m1x//xRodgkXicDfcVItJ4tZQuFrvd+3NNeRxpIN8x6z6y0b1ZVfkZN2BOroKGX5LK+Tv4w8nXPqb6oWFwya9UC6Od2/ZXzQx/Te/IFmaYIqvMTx

From: Drobyshev Vladimir <enigma_137@icloud.com>

Add USB ID 11ca:0219 for the VeriFone VX820 to the cdc-acm device
table and apply the SINGLE_RX_URB quirk.

Signed-off-by: Drobyshev Vladimir <enigma_137@icloud.com>
---
 drivers/usb/class/cdc-acm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 7bc5329fa3ed..dc12f9ca93f7 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1813,6 +1813,9 @@ static const struct usb_device_id acm_ids[] = {
 	{ USB_DEVICE(0x11ca, 0x0201), /* VeriFone Mx870 Gadget Serial */
 	.driver_info = SINGLE_RX_URB,
 	},
+	{ USB_DEVICE(0x11ca, 0x0219), /* VeriFone Vx820 Gadget Serial */
+	.driver_info = SINGLE_RX_URB,
+	},
 	{ USB_DEVICE(0x1901, 0x0006), /* GE Healthcare Patient Monitor UI Controller */
 	.driver_info = DISABLE_ECHO, /* DISABLE ECHO in termios flag */
 	},
-- 
2.34.1

