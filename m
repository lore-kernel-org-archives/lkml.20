Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99393E49D2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090601; cv=none; b=ZzOx+nJRAKCOgTMdL5WPhzgPUxCnpZjEsfHHoahqW2FgT6sIalqTXssRWgaWhuOUt2IYX6BDetVM7Y/ktOHQSY6oplfKLgUq5HQz4TgfxB1xL5GWKnE63piPAJKsK7xpmunSzWJ+HYNsXBnqNOhKNonmFOjtzpiOw/IUiCjAWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090601; c=relaxed/simple;
	bh=F1nPu9wpy2HTwHGav8g9uO8FI0WZgezRY+zItOCC26M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dezwLYuOseETos+7Ccy7SQfV8RAgbIVdkgyljXns/WtNpvjXYARL8gigEKixLUe+DzKrUnfw+7sZWE14JlBZ8OH0E7dwgBy3VLegJSfLO34fPztxO577ElrLPkbXgyTST0XbQjIKVLreLVPqnsjqeIgOHJR3zIavP4drTTkKLSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxUcDARx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxUcDARx"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso21764385e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090596; x=1792695396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ni61b90g9iD83/OZasQVP93JejUptEHkbkJ81F72Nc=;
        b=mxUcDARxmwAdwf/DN1CGDrEyUZ2vHXbz5Wixbot7RiY9SBqbjnY+D6V/LMDtn2vdon
         f4SpfdqOhBRYf/OV2XAue3OdLm4opyz51hC0Ms7Et2b5jpRHu4BU3H1owFYmuZv6SuOS
         jF0X0xQfLYM9Ddi743WQkkRA/4Vvq1cKEagSw52SHyzGMB7qnP++oILjGisPPNxOEVVi
         OGSmTDomjEX/vXj7/QBGRtJ1Op4GVvNKYIUiKtERnZc5G7YOKnqmB0tWBDFq5Z6fmecR
         8TwsJotRi4Ydt3WOruVb/ontxNL2lfAVV8qQq9TPcjNKFH1aYRkDY+aDbiZ1/xXNLWek
         NyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090596; x=1792695396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ni61b90g9iD83/OZasQVP93JejUptEHkbkJ81F72Nc=;
        b=GjVuoeKw0oODjXOugTuGMeJveX7X7JjEi+IVbe7H3VuZ+0P3vBw7+F2zR4QP4G5b63
         riUloAe/Evbr/jSLCI1X4xqxKrnNhVlrkxqHjp0mPXxTOxRDoUnDaUrfIr6tESA3lXUj
         588l0ccW9uA+tzBBZAIqdiwy0iuEI91JVVhJ0iDXTpPJDLGc/9FyHh8yL00tDm4VuYuy
         A2S9N1SGl74tX+MvQ6OQ/Hid4brYCTBckhuGbCQGrE1/YREPPYqNZMyZVeyifCiqjX90
         AFKsaYv+VqbtBYPSKWhryDSvx02TwMhdhgJlXpebtdo3+5Oa5Zv6LZdjKY5/YVszguL8
         OHxA==
X-Forwarded-Encrypted: i=1; AKwUvBxTI5eYg4Oo07slkebQAnHrbrI3zkiwZ4VyGZTAgVpJruIcvB3jb6m+mC8KkjfLVpEBL1KkYnSTnO9JVX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1mo3dMDjRWFlJPy60x6edFSTJgnOCrbgtapSS8bpdaf1w3ASa
	IW9cO0ets3STcPzxpdHiN4IBTW4MNCMPRrk2wjD1QvhZH96YUdtl5qRM
X-Gm-Gg: AYBFou3H98FCJyvbJzcJz2wnN7tWQ/CM0IWIeHwT66+JpVrNQZKjnYMfGSKg3tNrqPl
	LxiVqE65Hnty7sbZbQ+t9/r5rM4YN7iu36MJmghAUosM3d6Ok2K7pDjpdnelgmF7q+0to60Uevi
	0ItHGZrwtjpOoJg9yzW1kZ0PGH8RFsB62a17RMZeWqS1/Hm6oJjcn3xYO8N6kpFYe9W6WUAvCx4
	wDZskT0tbNw8laDd8u+WbqMi4rEmd+6Up4NPtartg40V6dfJYAfuaNg+5gnrQSqxSkK9FVR3+l7
	F+hz16T6J1q8UKABx9i/yPlU4/4CcaSYlq0HDRcLr9SmgPigphyeNci2OV9lZwgZJhkVVqdOkUj
	O+LvcMDPC+FcpGLueJ4nEWNQgJbVMMArmNZHSjJCEfz7bT4m94/zEcpmjYJmxwhDjTK0X3CVPOP
	vfEl12lP+YKx2NyinTCWHXM7GxvXWhJTbT5TwxVuTcEBm/t1pkdAuTek2BmAjauUhltj23SCfVa
	t0/JWYc8GXM2VzxG1QvKIAEF5tff8q7ChAXRHT3Fw==
X-Received: by 2002:a05:600c:3f16:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a18e44395bmr399234465e9.4.1792090595555;
        Thu, 15 Oct 2026 11:56:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 20:56:06 +0200
Subject: [PATCH RFC 2/2] riscv: dts: spacemit: k1-orangepi-rv2: enable GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-orangepi-gpu-v1-2-03566a615660@gmail.com>
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Enable the PowerVR Rogue GPU on the OrangePi RV2 board by setting the
GPU device node status to "okay".

The GPU will use the clock, reset, and power management resources
defined in the k1.dtsi SoC device tree.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..cc375dd1a77d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -384,3 +384,7 @@ &sdhci0 {
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&gpu {
+	status = "okay";
+};

-- 
2.56.0

