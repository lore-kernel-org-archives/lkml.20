Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743928;
	b=0lIGJf+OFOGPotqeLP9AH4zwl0HwSryFECyYubxoWxo4swI8a1h2q9w6jzu9TOZh33TY
	 QEHkZ8cC4xgsXd5ljheDn0lATNBZ7oXClStQvAvNp2pWs90pCerg3eskiS+O/mku5aTAi
	 LRS8IK6Ei4TAmOAawfPbWy3NRNhI2T/YpJKdeIllIwBv25yEkJL8Y85cpbsBbTtgG7VbA
	 1YFz5FDMy0vckx7ak475DSqVylG8015BdLot2S054Kk3r+nSrdl5nmfpBSpsUD9AnEeg/
	 RwL4vy3a2MpC/bxc0Q6yN1lBbo5GkV5+YcJCuzE0X8JC0HBmtIXZMl4UsMg3GZrV/CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zhleLxlgO/8KkinCeUWj94TJDi+jMt0bo+ONkONjbbs=;
	b=qpN+sJzmXC9SqairBcICiJ3WFvXxuFw7qln9aqmOkIRdomgMCzatHQNAk+/Dq7U3DiJ+
	 xpcI1xeQsEqpRMWn2+FhAKnVn0L+x0xQHbzZJmjoLwqaNClJZre9ySrF235nwfxbIfuYK
	 W9/LlWaxm0tXh/EF/+4dSMvEfJR2+Lz1mTAvc1arj5stPrIcGlHL+p9FY9IM7JGlmMwaP
	 G9oBx+Vs5JVZLpVIauBk5mHcv/6VYkmlhSHew0Zg1muf6j7jyCGrdt2floHgF2MfXElLS
	 Ls3QxoSd0hf1L+GrMM1Kd/fmDuRR1TDyLZ/3XcSUwug2mZn2eT8q5VPB+6lQrlOAzaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNQaeexo;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64807606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64807606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNQaeexo
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-930c0f9c1b1so12102785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793743927; x=1794348727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhleLxlgO/8KkinCeUWj94TJDi+jMt0bo+ONkONjbbs=;
        b=dNQaeexo070rGE4C/67h8WZNf6wxbBnzJmOcC528E3v+1GzJUyNnnBFGW4h6hMrHL/
         9YGIZ1lILzlQG4oQsYxFCFML66YMizEVunqW3ESxUpYwqUusW2LzsEMkfJpl9m3wO4EX
         aTN9DykuxDO4cPmqcPJm1J6EtKY+nmY5/UOFEYsw4tlESAmrffp444CWT+0l4Dg1qkc3
         9k2qtypqc7jXlOqJu5vCvsHGoUTxZFd+IQ1aUfw15RNA0Etohudj3DLnTETyoG1ofF4x
         3Kd32c7tTl/e7zsbAXSW78J5JRhZU4boOkyGaVMdl5r3FUBd3PI0NjU8R4zFitaRoB4F
         z5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743927; x=1794348727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhleLxlgO/8KkinCeUWj94TJDi+jMt0bo+ONkONjbbs=;
        b=g0DYjN5SEAIctfGspCzMyTP2T7B2QaMch4dTnyTfOs+mI315fOUGh/K7/2bBrk6IMV
         MN+YGIDUjz1/Qj+ZDGh4L0VAjxr1hDxgkSozSRipopxK5E4eZ8fkNNt4vzI0GqEbukcU
         2Z7GsfCl2PcNRdiG+bf/W4a21ubbAoZmzhJstMGeO4MyLNBELzmlB3njOH6D27CfPKrc
         sgSnnmwTeGnaJy5niqVbqKyJ+FtQn7A5x5aGLOL86p8s84hDwZn+czGjj+ElgzIt42VL
         6DCUOOffVm9P/Lykt/HMqVm5gmG4tP/tPMbW3uOtsQqVJHHAvXwXFzwPUNta4/Ymb3OM
         v5hg==
X-Forwarded-Encrypted: i=1; AKwUvBwVivMSplA7/IuN0OA5328+REEyANbBfR4ORnmlEJ8FYvL+ciBoeu3JmouE8eUQ6AJepjQl3Y1RKxg+si8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DjkUKjggOtqkzaIh7huAnbnivNWjSTNYnTejvA5Aodowj9yf6
	7KzEBd3EXlSUc3EofG2ja1g1JplTZQZ47dJy9c+2xHrYd6h+lcFj5TJaVdozHmf/U/kPUQ==
X-Gm-Gg: AYBFou2WOmT8s+6EN0ehlGs9T3P074lmh86Ce9ydOBMOeUVI3nhh44mQR89W0HmjXdl
	UGh2+wfPFLmU64zAxaNo4ErXNbOYILW2OLEnFn7f1vM2GCzbMLAffi/aWLAF5WJ3K0HPvTFvakb
	DsN4JhR6kyFOIu3y4y4Bo0LwTn0OMhefpq6CnemHCCMJcHkvQcbn/+vktNvJ25Uz/r1vu5psnBb
	mVsrX3FhorswsMq/rqUI3IlE/WNif+SKPF9JRNSBGdKKP9G9yzGgELaH7fTIheiD2xHGDtu1tLF
	37sOboBX59U4UBHdQDhKzGYnGkWBgANhdtfRT1odJ1J7CKTo7/NMcIXCnyeLDCbHeD3UERX/BBI
	o1uKLdTxt/u1upToChc2dGKGeoML4z0M04fklaNhktXBPuAXTEutaO5IkikszazkHpaEpfZugAQ
	siKSbWQtbFPpC7MdyHPMWftugA3bcgibi0Fxh6lMmyYrAqpeGbCFpS3gZv70erHgKJ53by0aXsF
	KbBLESHkcnrWPACzNnffVx/6frf0g+ccwMjD0isuVGkeOaPzujFr1BGudumH7BDOUAIVdNqzOGz
	vYk6SON64OI2pnAFDFXtU9DrSNpXk819o8gJUXsSUMSG0KZxciOTBiEYpN5Lrs709RXVP714qgV
	wgA6i8RC3Mkw5SAqYMKOFhpiJhcGC0GsZZ2I=
X-Received: by 2002:a05:620a:2805:b0:93b:d79a:c463 with SMTP id af79cd13be357-944216db682mr2344562985a.59.1793743927168;
        Tue, 03 Nov 2026 14:12:07 -0800 (PST)
Received: from codespaces-be20d5.ynsnsb35uh3ubhr4tvarlepncd.bx.internal.cloudapp.net ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4844be4sm39276485a.29.2026.11.03.14.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:12:06 -0800 (PST)
From: Eileen Blessing Kabi <kabiblessing5@gmail.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eileen Blessing Kabi <kabiblessing5@gmail.com>
Subject: [PATCH] staging: fbtft: fix spelling mistake "writte" -> "written"
Date: Tue,  3 Nov 2026 22:11:41 +0000
Message-ID: <20261103221142.45100-1-kabiblessing5@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Fix the spelling of "written" in the write_vmem() kernel-doc comment.

Found with codespell.

Signed-off-by: Eileen Blessing Kabi <kabiblessing5@gmail.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 861a15414..c4db681eb 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -221,7 +221,7 @@ static int init_display(struct fbtft_par *par)
  * write_vmem() - write data to display.
  * @par: FBTFT parameter object.
  * @offset: offset from screen_buffer.
- * @len: the length of data to be writte.
+ * @len: the length of data to be written.
  *
  * Return: 0 on success, or a negative error code otherwise.
  */
-- 
2.56.0

