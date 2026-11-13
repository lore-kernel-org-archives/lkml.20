Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528931;
	b=e1n3UrjTq9284e8/PJI7v67ZO0aRaoJmYdTkhSkl09n7yTOeMDG8J/eO+JU5Ktfo6hj8
	 oh1pOGS9GijxvwlwzZBtBFjUvmImq8SWM8hVHCbmd7oi4Cc9+mqRMLHyIHx2xVW2q+csu
	 8H7lJ9deAguFDAhuDgJkVsDjhs866/vACkxgeibR65kdUNYgz6V+nmPKAfA2XlwjZgOxC
	 xfcY3deHhSKpYOauiVNEHKMsCg7GItJalpN6I0PVT/HwgkzdruJ7zNJguufTeLVm1wdI/
	 wqlKWov7LIp1lnkZOn1zgZtQO4xJN1Jd8jBlTBxvskKRa2JjwjGLAMRSGHlQMK5hM1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=+fBTBJUogUr0q8A2FwQDwdGJIV6Uuz+g3xyvvYRXmAA=;
	b=uwb0x5gEOmo0lZffUEeaKcJWYxE+51y0MUbghlhxqANlRf42nfIi383dQ3K4J9P0k9Oq
	 6Z86bzugVLne2jiY00NXmrxPvlB7YeIxV4nyi0U5aS1HK2hxC6sHdFSoguj/w7KWSNskI
	 S+eTZyDiKsw3992sBI7oH1MwzxXaiwvZmvWno08OXPC09RNwruUNxmSwB6TuVXpKU7beZ
	 WSHXtoD7znmETEOeDdBiJaYZKqt4JKLT/qFYbRG/E8pDnDXBq3jjtu6PQv5FemqvJG07n
	 RuP77mGrubb24FPjoQ94Hz7H/xPVn5okNa/9Z8I6MIMYIjpJsMvmXFNvnJtjJMHvtOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GKbx7H+7;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F869606A894
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F869606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GKbx7H+7
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so591555e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528929; x=1795133729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fBTBJUogUr0q8A2FwQDwdGJIV6Uuz+g3xyvvYRXmAA=;
        b=GKbx7H+7kZsOSLibdh6+G4txCx8NtnGXTXukUm+t0boCr4cmE824CXml89JOAIXc1c
         2sWrFRL/kKLvXGvc8L3zrsw54o7zgNgfxCvuSm6p7MDhVFEaU9uwXOwDAqdV/gAvAKzv
         iInb7PU47r+ztn5S0o1t4DyFowmjKgAhqtO1bqw5Pk/MAeWjv871K1JdKTknTbAud11q
         SbbEtWxyJm+8/6OEVHp+/JmNfPmOO23Ofkjns24RdF4EslOYsgwwtqvtqbzzNZYE321+
         ++3RxKi8XpqGJJnsOdOIcshZR4BkLftVooyJpb44Fwn3SiSQBvWzD2rwAw8S9K5CuPWp
         p9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528929; x=1795133729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fBTBJUogUr0q8A2FwQDwdGJIV6Uuz+g3xyvvYRXmAA=;
        b=vk1cNVkTSWBuvWtOwTxKPgirlb0Cyb9dO1tTy7UZNLVp5djcn/0Y/EFmS+Qq247I2D
         M574lrjWfV3uJ8ycBxVZXUf3XQsOq+8SDoVN23Tb/dV7nSaIziH72h7xShIKmMOlS0tQ
         Y4JYnxpXTX6MEsb822+5maiqcHOLi9OkkVqoRMpmEGHKA73EFZMXY/MJxXJlmlP0xHiv
         mJ48Fo/kZqG8hJvnXAy1CIZpXuQVsCiJFfhb76GMEcrhnWPDlh1Nd83hJdEQreJLcl4v
         8cJFqRKZ5IhGRvd/FlAbRDnVBo1gCj+lJEK0hemJCB12e77uvnQDhhKdH+j6I6edbsK5
         pCbw==
X-Gm-Message-State: APuU4Z82Gfr+o2NuEvmbCxPEmdGsddQYDr5maDju6ZBxRYABOYzZRqQw
	U/kijh6H8xj55kqaYRHZDP+wb+IycU4ojJxVWl+71GeVXrZzBwopZ1/A
X-Gm-Gg: AYBFou1xrBkMuH5xCQYR5AJT+wB5N+/7m6MryEJn0f2gt6iPwpQYKduJb/lvpnqkOoz
	0OqyjA/TdmM/9pNT/sk6/HUFm+VLWva1K+cSGf/2Ef5vWSl4elzZ35fNov9+cS6zr3z0dJAyx55
	GGmAVZzsHA6jSpAK38eD70VN1Ty2HNhL/mlzpAg5A4a4+4qx9hkLlAMtoodD9qb74YJPctHG7HJ
	4L6H5zeuhnidnSDmuN08cNRT76TlGVJfZziyjsMUM47zvmVqf2qMOCI2BjX004Ul+k8rf6rm9wU
	rzQsG2G2+H6W//Oc80/Cn3ra1p2g+1Y6IREh51BDdSL4wMrPMYrCDPv/dmMSTf8ywP6vjDNKJ1k
	HoY+KsDNhFiDUMLRC75OfRzMNZlllhjJDqBTfrejwi7O0LoMAjfCEkRZGbLw1kUxHB92O4w+yMe
	CCIlfH/INkRdBOwx+pM0jx/FqIRRHSoHOexB0WAHXGfw2oudIgOad3XayDrH4LkpHkLAlB8RM32
	TZIPxXrb/6mV+tBK01GcGt2EQ3Nz8yDS23w5oWfDl2vHXde5C47YmHsI8/kXihDNKPCX6xpuBsT
	0QhL2t+iGSyN5Zd0xSs2t9kydhXQVhsCSqdOi3WAtdOzck9Uyrpx07NORUGzB7aRzdpgB1jV8rP
	VDf5a0M6t6A==
X-Received: by 2002:a05:6512:668d:20b0:5c1:56f2:fdb0 with SMTP id 2adb3069b0e04-5c1709ca3e4mr259536e87.34.1794528929374;
        Thu, 12 Nov 2026 16:15:29 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:28 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/10] drivers: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:14 +0400
Message-ID: <20261113001432.128201-9-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 drivers/soc/bcm/brcmstb/pm/pm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/bcm/brcmstb/pm/pm.h b/drivers/soc/bcm/brcmstb/pm/pm.h
index 17f7a06a7..041b7ae96 100644
--- a/drivers/soc/bcm/brcmstb/pm/pm.h
+++ b/drivers/soc/bcm/brcmstb/pm/pm.h
@@ -64,14 +64,14 @@
 
 #ifndef CONFIG_MIPS
 extern const unsigned long brcmstb_pm_do_s2_sz;
-extern asmlinkage int brcmstb_pm_do_s2(void __iomem *aon_ctrl_base,
+asmlinkage int brcmstb_pm_do_s2(void __iomem *aon_ctrl_base,
 		void __iomem *ddr_phy_pll_status);
 #else
 /* s2 asm */
-extern asmlinkage int brcm_pm_do_s2(u32 *s2_params);
+asmlinkage int brcm_pm_do_s2(u32 *s2_params);
 
 /* s3 asm */
-extern asmlinkage int brcm_pm_do_s3(void __iomem *aon_ctrl_base,
+asmlinkage int brcm_pm_do_s3(void __iomem *aon_ctrl_base,
 		int dcache_linesz);
 extern int s3_reentry;
 #endif /* CONFIG_MIPS */
-- 
2.56.1

