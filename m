Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675421;
	b=N4p/PYMF+xhNs4PwDMrBVOTxj9Q1oPNovY4qHFsczLNIsAIxjUMKBH7ky32QX+AsEQy/
	 TkGMnPkf0BwjtsxyEV0bnByTrnXFlSGwLot0pYRJqWM2IvUexPWKnKTKFpTJq9LROhmQh
	 KexSrLM4VrMqjbt5CQHxSsY6FJzX1nlCYm6uVHvN34eSJU7pUWpXS8s06WeAV/ASfSGx1
	 rL2ZHo9zhyjT/D1yfgtGXtzSw+L9J6luKHiEm/kSphA1eE+JbyOCNRRFHu9nsW4COucz0
	 PVyjRtM1dd16oSPpx+bgYed/lUs819UQ1emXcUPMDTox12ZunCOV3MVZjqP/HfRaHGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hwW91wndLuqmXdmH58Ipy3n3ObSBB2CleHsObv0MDqE=;
	b=xHqU+KNgGEyLqvFAxAnvWYS3h4LLJ9zzVwzRax0hWgxg3oZ1pTBkiUAEUwl9M/rzmFRm
	 9zXsp+lyUb0FB0VyQpG1nSW3tefJ/0fJ5lnoTc5YskEbI3N14+baQRqptMV0atiefrr6+
	 iOTzplAbWwmn9mWfjXIc6EnHqdRnlnF3cm6JjrsDnZAQyfMIjq3GrqD6Zl1U5Y8avpsxe
	 HCk9VI3uZLn6zJcq7Ut3oy4AiIicw7p/4qeXPhwwv4P/fd0cX2zbmKiFpH2O4mjVAIJzR
	 eJ+SaxelP6oTZekA5ef9v1IVIWAjucldi/BSQYJqwJ7iBuREbOG4Z0bDwo6vdrZHk6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Snpcfxgl;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32590606A8B0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32590606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Snpcfxgl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so2941271e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675419; x=1795280219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwW91wndLuqmXdmH58Ipy3n3ObSBB2CleHsObv0MDqE=;
        b=SnpcfxglsniPDRzdFJS4kcAxpZzmUAUvsq1ATeIqnIqcjr9nL1TZC0yNAaipGBMaz5
         CPE6g7j/IwYCzu7y3HE4bz2eU2jIFUdTqgNm/NbrRu4KLo5A5QNCstYh2FMGxPUcBLu7
         DNHkd4TPfLzApQz80lEF9C52eUbU4mKfTW9+iE6H7baCk0zFQH+3YoSxHToS/c5/3rMh
         wo2grcE0WMpKdBaVAv3/h30MSFo45kOVRSF5g1pDfWzwSW43oWBRhasZ86kkI9dQlHdV
         0CaU+z8+FoEhYoKyZiIUlXOB90jX8gPAG04axIEht88mlAQxkIFK/KtQhyrBYJgSCeE7
         PidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675419; x=1795280219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwW91wndLuqmXdmH58Ipy3n3ObSBB2CleHsObv0MDqE=;
        b=PUs1Z5jZVrD6mf7zTgujPYf3xUerCvEtvIQv0q76eAKj6zEilcp83QCybI4oyH1Iyh
         2AzqeCgJOnxrwpkVhSDFIqNUgs5jh8PZtTQcxYddSJBERQtkOoTMBsQiekr8/H9tZbx0
         750oydeuCDlK6dRLH9j/gZjuA9abcD1oqUAwesKNKssHIe8idw1md1afXoHsv3j+H0s3
         McjTaPFpflfllwVN4ARp2AE8ar7o7nurt0Oj8ukahEXtXNFF04HMUjuKaCaqD+pqBSmM
         weT3zKTDqvjpRX4j3KDYgeV9Oq/i10AFbRVWiHv/EWQDCnSDtTllL3nm9Ow7M10cpTHk
         3hAg==
X-Gm-Message-State: APuU4Z/4ROHZLVkfyHfOPQGdAXyh6harCH8LO/Pxz+HYhRuV2OhfenR9
	zQL12fg35/XVH5+pwStRNQGyQ/d0MQDlaHNjEvqEcjgb6sXUSAt189Vr
X-Gm-Gg: AYBFou3vfOa2nHSzCkKiRLWr6j4UlXA8x3V7eg1ChSe5ZKghRzyWeSDhqYf2CBr7+VI
	VkvIfB8QbmsR0UEm3mbyD2aLzi6hKGoimBUyxjF/+C721fjcder27O8pGIb8UGKWQxaG25UHxIe
	XRExmz72ywCeUSQKHXr5djNzS43zmjgm0H+55dzArRXsVp7mTWH2K2VVeaev90yG3dQu2jtoL+c
	NP/DoacBqZi4gTpFeqIxYHXEB3wXbS6IMRVYEqeO+pE8hG3I5GxW0l+TcbtSjIfgmaIUX5Rr8mJ
	M4dplUlVCfIDmFKXCkX9RcRtDphC3CqU7KeRKifB+YIHmp2DmqNhITF3T8HdN4sXgjpaVZmJkK+
	zdNdfIAm17I3f4cY80CPPpQge25OZZ1ujBmn+C16izZodp9iC4uWwP7NQBxXyERFsXMfil3nUGU
	fMhoKoTGMmYacnRb3pGjNBomm6/uX8HEhve7DhOq6EQJ9sqb0ft56eIvE/qhR8er0N+Efx+KI2c
	V9y4rvEFm6SggvBt/9JZnBAtLbaAGpeJusfrE02xT0SzBo0Fw9MWo8PNLKofZBb1Q0rZbro0E25
	Ta7nNjN/UmU9zOfYAoE8rytLxy/QboMEDSOo0vGEHwYRSpDAJzanuQrQ+Gu25VzuSkUJTOvLSdW
	HwL8Hen5Cww==
X-Received: by 2002:a05:6512:3d0f:b0:5c1:5457:a147 with SMTP id 2adb3069b0e04-5c164eb81bemr2979307e87.32.1794675419237;
        Sat, 14 Nov 2026 08:56:59 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:58 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 08/14] drivers: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:48 +0400
Message-ID: <20261114165612.368785-9-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
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

