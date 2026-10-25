Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792931180;
	b=NTO9EXjs6pjB1NfeCF+ywHDAwZRt/ceiQ/jv2RCgXuYSA2wEIfiKUdj3mjJtQTWsmUcf
	 QfNfyajv9S91FI2mXeEO1Me7/1ZvpCYY9uKHgsraU/MTzjWZAZiGzq5m/1jiXw4tbSNMP
	 sMnkxoAqEnVZZonP8yzZcX3H3yxDQKuZby0Ix2IMyngo5YHWkQWahyAd2nTO5/Fs1r8xQ
	 lwacCWScSDSWLkVrJZ2X2dsRs65wOWANEcIRJdWxoTx5jrs5BAaQb4ccSJFcIWQfoFSxS
	 fJ9u4X9k9LjX13dfurgwHS8rPmQNHZSxUWtrbE+Ou002FAYHq3/wwYRpJzlhCVxXM5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jufQttOKS5p8h7UvGh24c7CdZP0e0JDC2zgLNdpUMHw=;
	b=qRbsjZ6pRjW3CvQAVw9h8Q/ZZsh6LX5ujBUezWFIqB09kojgUYwOzjHynT32WwDj1W3F
	 uB6GA706vJz31vwhroXHIFVG4WAOqMNEM/0G4ywViA1MBQNYgvlT0iULELceYfaHCeuH7
	 7yaHLKn+me51Ka41zcODCaKcUB9eyPB36LwikUPIsz9gg9vFSy4ni2sahHYHstrApy2Ek
	 cxAs+ujlKotL0TZvnQ8qliaj6TO5lQRQHcUQeGMWKSJnuUBrZd0NkPmNva1rEfxuMJZsY
	 3dxy2XjhkEjCHmKR2n/8O2ryx7XIQuhVOms92ZwA2eKBe9tBPStJbZIcqntwmHPXnJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNWGSQgh;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA00606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA00606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNWGSQgh
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b060ec084so1281111f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792931179; x=1793535979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jufQttOKS5p8h7UvGh24c7CdZP0e0JDC2zgLNdpUMHw=;
        b=qNWGSQghk8gVbQ5OHWfF9WMkT8FoueMiyZBC4NsoAEyvmMg+L7r6wyISzm4lHBaHhm
         TfARi9A+ZKYlnnvGGR17s6dF2o54E8g6MZ/vAlwbyTQkYrvV6z4nsMdY702HB4dm06cY
         AYOj1XY2ytSOMU3rg6C5jlv3IA0gcwa68k12Kb6HPkMYqXookA4WMhW4vsSCL/lAXqOL
         0n4LtjdXHZylNRBoUZ5CkstXEeAxoNq68H880EUNIfkjgME0lkGdNkRxvtkcuVPhmfQN
         PmyWVB3Xo/kG18PSV1YDaQsy0TqS69VfOxLFocetC9ND5DekshRwkirZkprGLJTlLjYl
         auow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792931179; x=1793535979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jufQttOKS5p8h7UvGh24c7CdZP0e0JDC2zgLNdpUMHw=;
        b=ldXfSoFq/6Cn0xTIJdarawbfhWYmru5B6JYFzAaoGLHxcpvuTc/a+pu6xcj/36wz6Y
         WQHtExD6nAV6h7SHwjzI+2ydn9Drx9djLc22vBN+yW50tB+THEdAI4za1+B4Zdgi5UIu
         ih9TOfn9KQIG35fegMdmY/yGqwvTN7rKJGoWt23dBLUCh6wjaqA41vwoSqaClQWDOMNy
         y+PQ9qAksAS3UpJNIqx5QWABUK0QucE7asBJ8EQsJvEyz8v1+THA52twONpIru/7ME1E
         ork8/7CxJHqHv+Vg/Hn3HiphOj9A4ovOh8qXKwGTJNhPb2cQV9zIFnzyMBsFI0yMfc1O
         jbog==
X-Forwarded-Encrypted: i=1; AKwUvBxwuswySYXdkkieAIHRJPJ6q9ko3iSbGuVGj7ITl2fssBcqezMA1HCW0j3qwfZcP08Lb3EYeD1vh265RaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqrwULM8gZeplYschL+5KZ6FWwCCwZbgFyw5hBTK3+YiHE4K/f
	0uytjO8lX9mZO0dAlBa/rKHg8OAG8zWnKzDVAY830I28lyxIc4gHqc2dVA6y6AZH
X-Gm-Gg: AYBFou1ZaNTgJbT3exDQlIQ7iaTcBczQt1TlIW6twrprSlyPgS86OpJSoAX0jwFs4iP
	sZC4tf9b1aZpPn/POYL2NJEr76U9ghdNO/pEM9np6sFrHoKZKEGVTxMHjLzDmCOV5zyr6h0vegt
	sxoK+iwL54DZr1qO1Xcc/FlUjeGxbQ0tlC8MsCnOzu+nyGTXBwu06p9KBnF7XpuEH/heTXG5RVC
	Kn26A0clEY9HgupLHHASGRSnIRimqHAFSHizuDF5EFZM0Eb9H0aCecK6sPXLddpXPxE10BjYL1I
	5APRgKPIaZoMMkMs0gPxKiYwJ3/QGIdfegzHJ62hF1tvwjdSg5tHCqOZOmzsrDr42W1gemOivBf
	r7rVxdsb8rorOlHS+e+LJ74FMRnUhTq8FdxIGS3s5UXZ4NNRuxRbONC77ZJylkH+1OAn3YO8qvY
	QXtrINV2MQLKb2yY9cZn+Lat90IGMZdqsS3YDPLp9umf44xqwAvRvsL18aH3zG4M+f/ihjBvzGD
	ie7IGfUPlWMo/0ffN+kLGKJVa/3u1Ogitbwgci8yGT/AKCJ1ZWKN2k5rQdq8GTTohOzmvXODSTj
	YyuKZ771dtq/qFxuKw==
X-Received: by 2002:a05:6000:1843:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-48e3eb8b2a1mr7255770f8f.14.1792931178772;
        Sun, 25 Oct 2026 05:26:18 -0700 (PDT)
Received: from Ubuntu-vm ([115.186.50.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm9403851f8f.43.2026.10.25.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:26:17 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary goto
Date: Sun, 25 Oct 2026 12:25:04 +0000
Message-ID: <20261025122504.8404-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The goto exit statement jumps to the next statement, so it has no
effect. Remove it and the now-unnecessary label, and simplify the
conditional block.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 6f4bdad00f60..c2d0cd314b81 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -2005,12 +2005,9 @@ static int recv_func_prehandle(struct adapter *padapter, union recv_frame *rfram
 
 	/* check the frame crtl field and decache */
 	ret = validate_recv_frame(padapter, rframe);
-	if (ret != _SUCCESS) {
+	if (ret != _SUCCESS)
 		rtw_free_recvframe(rframe, pfree_recv_queue);/* free this recv_frame */
-		goto exit;
-	}
 
-exit:
 	return ret;
 }
 
-- 
2.53.0

