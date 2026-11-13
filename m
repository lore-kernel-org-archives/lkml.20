Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531384;
	b=4NdKfWCbcypyFvNzc6nJtgr5Ej2nFF9Q6MQpYOfkFT6lL6qb9fwmQlcQlvkh9ifH4Fv+
	 z1AFYbvTtz/C9r+pCr+kS13NBmjBfy0NX2xNXEg/XG/RanqtN05CBjIaPW98xqZ5ob6ML
	 qColrTv2qIb3DUjUocCwoVuN+WOYnyzHYHmwLd0VRH0RyWA3NSTFRUUYSYDcYMkkOTVu/
	 2n2Fd4X4rFV/8/T0GP6wk5fXTek8D9ozfNuhjXbY8X6DaNdEiYTMRL5mRdsSIVlxmeUD/
	 q4HLmlT78gxqFwtiYTcUhiJuCSVqKE0bW4g1cNrgHeejQrCSfL3dFTXWtyAMmVQ8Dng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CtRGBfCvPjk6NMUwk6EELxmj4aN2F/fvH5mMHwm0bys=;
	b=G1A4zKS77dEM6A+V15lURus8XQjGHAdTZbzbCtrkQktWqHuPU4xRw5FmiUb8sqGo/9dl
	 t8+IdBgNkYqPn9uteir/smTqdphFjI27hGKOnngIkI3Z1KszwnElFwescL8dgI1ICGKLx
	 ybFyTFrhNanZ33ZDzwi3Q/OwLxLSvCXjKRjN2bnTwMoxgTSE64sK73VK/oZrx8Lle/deY
	 b0pe3Zs6VTlnxi5XlJhK6mH2AcEnzW/+fKrGpsI9TsRRLUDuOd3VhW9HcED5U5Ua/k6+P
	 uzItHfGHY2cKkhstwNczvrWOxOUpL3RX+PI8W56SG7jxAUfdg8MmvoP6TGqVj8OiEOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jU4YwV6e;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62754606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62754606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jU4YwV6e
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b1535be329so354831a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531383; x=1795136183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtRGBfCvPjk6NMUwk6EELxmj4aN2F/fvH5mMHwm0bys=;
        b=jU4YwV6etKf8umE12U/D8ulvXvMFFk+wVQjTZKhg8yB4tuEr3cGD/RHs+s18XN4nyu
         UXTkAeqNrsRPCSx3BsOQeMLuDMG6sfaH8eC6QKINMRcr1epCtDlf7GvhmxBIsXHzTk9+
         tImPdyFkqB+PRDhwRTRqFlS90dCTQVr+Wnwa7aHZeyQNlf308fXtlTo6nPOHJXBDjEet
         WVz/KepZuzbdjes+qitSxLKPRufrachLMbALur0VTLDmuS2wrvvJQEgyE3ISSPHjUow2
         r93LC7GxvaRl4LiLzmwAdutBqGLclM8zhIIdfxdKbg2Rsyx0me4Jh/Mk761IQ+VxPknj
         BbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531383; x=1795136183;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtRGBfCvPjk6NMUwk6EELxmj4aN2F/fvH5mMHwm0bys=;
        b=qTB+FdPZB4ClUTF9fB066imUjsMoPePB1+GmDYj9dCxwMJRE3NPyHGvpNXo1O6idi4
         8pfm7jddtw7BARum7JqAm2h5jQNhhb5KmR3ShZ/GACWWjQLZcoo3LdUvU9HDqLS/o6nr
         1pat+OQKU9HMe6izMJ8K8Aeim9RNiUuuMPBJhI7am3FJEWqCjrnF5pghtoYIN/US6OnF
         zk2WFqU5YXGfVLcklDL+ZwWl6lclabdlAkb0AHgY7hKfx/0lRq5BI48j6nIgOIwLwysA
         PeUGpb2OV3LsMCD1ik2mfnUfpFZA4CHWbssr0WJvrM0ZA1hUQ3YcXCPXYme71d3Rj7JK
         1Q+g==
X-Forwarded-Encrypted: i=1; AL+hErGmA5FB6c/OABDLDatVa1BpXEJZEvfztOOUPQ/4TrFWP0oeQK1UFy1FFE3EfPo69LyFgoNu4TVo2ZXyhKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z806vIp2nPvWKBfzC0iz4LAuUqc5G8qlzK46JcXpwX32Ew/roBL
	lieYcaAmGhONOidrK+xnHSMusqoAr1JxpKXAJlM+NIkH918lQBzXUQKV
X-Gm-Gg: AYBFou0pj+3hA3RI4v/Eudrg/EMivtZRXx1wNn3LwwxfokbZsUbhKFubkx07s23syrC
	szfOgVtxA77uskIv+ahp5wdwhmBSbWrHCImopVE0xZbW0y6au39NKFHOfyZvMKtOYrTRwAKdHcR
	xQTTkMvmDHjqJwNisCdyN6Cz1vYY7FeITL4rfRJg8E9orN24IPGcz11FPrR2zuSUJ5W4UTPrMh9
	8I33OAeX79ys2o/0mmSLIZfoMjBUxsNjeDwmOtwuR6I6yUYrtCh2YirJJM/kMxY2eqU+t69sixe
	payvBX3dY+Mi92v3N7xig6/Fx6jMg01M+gAf1e//8NeLKOlnR3oynVTgzysdMm1eG76E9GDmXLC
	+aOinLi17BhGHHa5oju/RQ1CmqQadvNMDplJljF+wAhwg9R6gTpW02XWYGqVzurJyIA4li+FO3E
	5ckewUNCHnWl2qRVxqG4NFsugqwC4cdzNwzw+bdhNjPTUYKCuRGpLrzLrbDt1Q733Bv0RULGaFu
	++CaX/cEWxl8N7Hv4X3r6YEMKhCVnQ5SRD5tkSPKStxhcfB/GoL5eXZKVdJfYPr9OudVk5+gcys
	s6MWiY2KtcqZaw1S/Q3WDpnHcB2piBxJxSvly9M0ensYItX3ehbg67o3ob4JaCNwzinSVSEEKNw
	fVHhAd4O7KHd9+gUhVZ7IVKLU00J1JR8FmW5brLS6bjT13HCDZ7Irg2B7qUS5bsCtpb889/VF7a
	DllQXvYZvQFcNLTMxZkChm9Q4YaxyyG+sKtg2CjmyZ2/fhtUGqbVb8Mc11yMIZ3zuClQKOQBFD8
	GN63NVwB0jhSiOnS1U3NBri
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr619305a91.16.1794531383375;
        Thu, 12 Nov 2026 16:56:23 -0800 (PST)
Received: from lenovo.localdomain (42-155-215-210.ipv4.nexon.net.au. [210.215.155.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c86asm2351735ad.23.2026.11.12.16.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:56:22 -0800 (PST)
From: Miro Kropacek <miro.kropacek@gmail.com>
To: deller@gmx.de
Cc: geert@linux-m68k.org,
	schmitzmic@gmail.com,
	lilinmao@kylinos.cn,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Miro Kropacek <miro.kropacek@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fbdev: atafb: Restrict SuperVidel handling to the Falcon
Date: Fri, 13 Nov 2026 10:56:16 +1000
Message-ID: <20261113005616.402721-1-miro.kropacek@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A framebuffer at 0xa0000000 or above is taken as being in SuperVidel
RAM. A TT with a VME graphics card such as the Nova has its framebuffer
there too, so in 8bpp it gets the Falcon palette registers instead of
the card's VGA DAC, and in 8, 16 and 32bpp the SuperBlitter, which it
does not have.

The SuperVidel exists only for the Falcon, so check for the Falcon video
hardware as well.

Fixes: 51df976c3268 ("fbdev: atafb: Add support for further video bit depths on atafb:external")
Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's SuperBlitter")
Cc: stable@vger.kernel.org
Reported-by: Christian Zietz <czietz@gmx.net>
Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
---
 drivers/video/fbdev/atafb.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index c32576cb1720..5d9265caa9ab 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2065,6 +2065,15 @@ static void st_ovsc_switch(void)
 
 #ifdef ATAFB_EXT
 
+/*
+ * Only a Falcon can have a SuperVidel; a TT with a VME graphics card can
+ * have its framebuffer in the same address range.
+ */
+static bool ext_is_supervidel(void)
+{
+	return ATARIHW_PRESENT(VIDEL_SHIFTER) && external_addr >= 0xa0000000;
+}
+
 static int ext_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 {
 	strcpy(fix->id, "Unknown Extern");
@@ -2083,8 +2092,7 @@ static int ext_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 		 * SuperVidel 8bpp chunky (fb in SV RAM) uses the Falcon palette
 		 */
 		int visual = (external_vgaiobase ||
-			      (external_depth == 8 &&
-			       external_addr >= 0xa0000000)) ?
+			      (external_depth == 8 && ext_is_supervidel())) ?
 					 FB_VISUAL_PSEUDOCOLOR :
 					 FB_VISUAL_STATIC_PSEUDOCOLOR;
 		switch (external_pmode) {
@@ -2181,7 +2189,7 @@ static int ext_encode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
 		var->transp.offset = 24;
 		var->transp.length = 8;
 	} else if (external_pmode == FB_TYPE_PACKED_PIXELS &&
-		   external_depth == 8 && external_addr >= 0xa0000000) {
+		   external_depth == 8 && ext_is_supervidel()) {
 		/* SuperVidel 8bpp chunky: palette has 8 bits per channel.
 		 * Without this, fb_get_color_depth() sees length 0 and
 		 * fbcon falls back to its 2-color palette — the console
@@ -2245,7 +2253,7 @@ static int ext_setcolreg(unsigned int regno, unsigned int red,
 		return 0;
 	}
 	if (external_pmode == FB_TYPE_PACKED_PIXELS && external_depth == 8 &&
-	    external_addr >= 0xa0000000) {
+	    ext_is_supervidel()) {
 		/* SuperVidel native 8bpp chunky scans out via the Falcon
 		 * palette registers, honoring all 8 bits per channel
 		 */
@@ -3336,7 +3344,7 @@ static int __init atafb_probe(struct platform_device *pdev)
 		memset (screen_base, 0, external_len);
 
 		/* framebuffer in SV RAM: enable the SuperBlitter */
-		if (external_addr >= 0xa0000000 &&
+		if (ext_is_supervidel() &&
 		    ((external_pmode == FB_TYPE_PACKED_PIXELS &&
 		      external_depth == 8) ||
 		     (external_pmode == -1 &&
-- 
2.43.0

