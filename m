Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845069;
	b=4W3VvvbNJOKqM4nWUflcX2xSpzB5yC3NuXAIEf2+5VQQlO0tmBmsi+eZT7kuH4kn+JYb
	 9ueXpD4vcu1J2cIKa3ozVwv9Ku3TpGZeduXm2OSjDd/WVaICpAHcCX+39Hik/bVFBPfQO
	 iqeYs3T5xJeQoS15BnEWGdWBIvdDzLAeKJ10C6FPfdq2Rflhv4dqJPMZkQlLQmpk/XIaB
	 v26eCkNaaoNUGi9ILIXb4oHCYq/3TLa+5xnN5zWTg9JjUL1aH9Fpqlevbk3OaS0UK9vdJ
	 jDkMlDM7VR7SP2VYen1yapmz/1KPYmXN9jybWwA9sYMI/JcNq0duYXfe+OQ3tUFAA8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oudFixRtaDN0mNTqiDXHYqi9yn0CpLULW9SIu8yrdcs=;
	b=ER2gIls9Ha8y0AYjJZMlapXtYI0jyOTJBV/plllEGry1a9xRpwW+sagzvRNzMnyhvYf2
	 OkKIsklduyNc/6YfslTh3tW7iNuHR1ZHU8V4nIS8JGUf/S7+Vl4LNZoUR5m+oROlKdmJu
	 vamsDjoykW07yAxSA++d0hSQh9mnjdZVBmLHJ6BBgZ17P5Alj/pyA1+fCSSBp9nUDFg7e
	 Q4KNT0yI7f0nc9Rv7Zg160xrbSRR3zCLnfowBbqOUnD1Gs77wTSmlUbUu5+S4Y/Wt31aR
	 cMvqPTqoKkgr2zRZ0r6UH9NGoITBi34n7NWSBzxjMIA3r+DWIywY/YT1v1Vx16dz9Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yF9KxRZ7;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BB9606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26BB9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yF9KxRZ7
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so28836125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845067; x=1795449867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oudFixRtaDN0mNTqiDXHYqi9yn0CpLULW9SIu8yrdcs=;
        b=yF9KxRZ74V14Ex+oBh1l7en/55NNZQlkrqjVk9oM7FwO54h/Kx4RYp/fIeXUxhcF5l
         EFS1LQBh+tSXYPrKvtqw0a7V/8BW5wnA6KI/j3ikmxmMs5p2OSdwzo+v9NO9l95Qokgr
         mBjcxKeqOnNPZszVOlL6A+oPdQVhpVMWxRcr2cox7vsrySovrrBjSi7K29RbStcIN4qT
         kzQqass0uylTYUua0+9TRjfRizJf9X0LB6ZcLR9thg5EbAbzttfGBAYPDTK/cd8jVJtO
         ek0LqiE2U69e8KuhPyqGXmQ0Fe2loBLnOVtEcqrrTZFkR344UE4rRUE/+ofZssBlKHkd
         80qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845067; x=1795449867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oudFixRtaDN0mNTqiDXHYqi9yn0CpLULW9SIu8yrdcs=;
        b=D5FP+ZUiPjava8rNCayLUjOGbwv4WReMG23Lbub5uV26eS1c76O9GSPXam2UMrJzuf
         P9jk/x+5XNLdPhLSpz9xAHelhVCVkmck8he0yj2kjemFbCeQJc1HhAz6kgU3t8Gw84Tq
         ett7/9pc/7d8+65/bfxhSDsEWv+WS/X58Wq2gRCgTNpdjSOEHtEGkSatMU3a3SAcEdLx
         C7pUJ/E4RbY3CLkdaYQyGUyayS1EoTQxlwUkeRTF9l4RyWRE4ibUw2VHj+L/vyaoSgKf
         Pqpq+alc9qqIDc0rs/S+IFPrw0I8gN4hy2ZxqsIxQgD01ND4af6MOlyDcQpm+jQs1M6X
         RYAw==
X-Forwarded-Encrypted: i=1; AL+hErH2mAM3dGgrFbd3XLpVG8iwAQ/j7In5yt4t8tosqlmPAQg1RYGkd4EKJXztR0xpfa5Tmg1iHvgGvWdWs9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HPtZ8xgUC9FaOCursNboIxTGAGJ/33eHM69qFTfhzdLqKT3p8
	y19CKr6ak3/mQbooT3ICFAWLTSczrtB3JmbHZ1wd1XXVEv6LlF7+aEPp
X-Gm-Gg: AYBFou22TTb82IN4iRsM4rE7xWERT1GDi3xEHAJe3aR77GizD0wX+ojUNEQKAmw2Vg/
	aoxxmfviO5haIaI+SrP0+ycU877OpZpgE3g+un44GGfEd7sMwUzZVCcC5hmoS8zjfs5fF+Vqwcs
	80xx0LPos9jP5NpKnD7jp++APucEG4wCjnmjoDifUkRmWjZEtq5uLTEEBDnliyLaNS6QR3umYyX
	TrfOsa5Uqak39CFmEDfVcRTqbMjwyGmNFHifo4hInh/cMw0J2Rawt8HBN+5q3UuDqaDgBoOcKCq
	Yxn1NkZuS83Qp+hEpG6QiOXzG+VKJtQFos9vP+wGbZHvACafOhRImZkxlYfE/dnT0k9KrHLnIyW
	Q1xIP6Ir4tytBljjAA3tqq0Sc63eJWR0SSYWAjnIfdx59QijlLP0ccw0yeZ1YzZiVK+EIPMQpkn
	1KSQvhWaAn39jz21SXragYSY0iyHHbji1F/PMhmvsPxubmJaS+pOMEWHrnoQzaGrwPr4YMN9/zO
	Jrk2ArA1kIkthVZxrN1AVIB59M0vAOVBaGNxYX14Uyr1+xnrbXmx53SFzKyxv29cx5yRXxIorQ4
	K5sR4qG6+z4nnnz2h93vFQCQVQQw0b9f7530BibLfCf4Q/b9aveiPRU+PVbp5CSQwKWMevacYRO
	5omEf1HoctWIzmwlLUYKyo/hk1Maluujiyx/tmqo/uSDZmKiLzpRzRUuRrjcJZ9Np9/n5l7Zp9I
	93ruUmW4Ws3qLHXhi3fBz8lc8TIEI4p1yYPM9R9CRmi3ARxcx5P+JFAU9zXUlC7C2dsQ6FbRxt/
	koKdAsA5QC7dSIK9WRUrRAGfIBMy2R7K7LYscVZbUNmIsBdtwU2lGVt
X-Received: by 2002:a05:600c:4e8c:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb60ba4a70mr164125695e9.26.1794845067477;
        Mon, 16 Nov 2026 08:04:27 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm271456895e9.3.2026.11.16.08.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:04:26 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2] Input: axp20x-pek - support the AXP313A power key
Date: Mon, 16 Nov 2026 17:04:23 +0100
Message-ID: <20261116160423.39752-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115150903.16855-1-jernej.skrabec@gmail.com>
References: <20261115150903.16855-1-jernej.skrabec@gmail.com>
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

The AXP313A MFD cell is registered as "axp313a-pek", which this driver
doesn't match, so the power key doesn't work on boards with this PMIC.

Match it as well. The AXP313A has no AXP20X_PEK_KEY register, so leave
its driver_data empty and hide the startup and shutdown attributes on
PMICs without timing info.

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- Drop empty axp313a_info and check for NULL info instead (Dmitry)
- Collect Chen-Yu's Acked-by
- Link to v1: https://lore.kernel.org/linux-input/20261115150903.16855-1-jernej.skrabec@gmail.com/

 drivers/input/misc/axp20x-pek.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index c34e002258ee..040aec5f9e4c 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -193,7 +193,20 @@ static struct attribute *axp20x_attrs[] = {
 	&dev_attr_shutdown.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(axp20x);
+
+static umode_t axp20x_attr_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int n)
+{
+	struct axp20x_pek *axp20x_pek = dev_get_drvdata(kobj_to_dev(kobj));
+
+	return axp20x_pek->info ? attr->mode : 0;
+}
+
+static const struct attribute_group axp20x_group = {
+	.attrs = axp20x_attrs,
+	.is_visible = axp20x_attr_is_visible,
+};
+__ATTRIBUTE_GROUPS(axp20x);
 
 static irqreturn_t axp20x_pek_irq(int irq, void *pwr)
 {
@@ -392,6 +405,10 @@ static const struct platform_device_id axp_pek_id_match[] = {
 		.name = "axp221-pek",
 		.driver_data = (kernel_ulong_t)&axp221_info,
 	},
+	{
+		/* No AXP20X_PEK_KEY register, so no timing controls. */
+		.name = "axp313a-pek",
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, axp_pek_id_match);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

