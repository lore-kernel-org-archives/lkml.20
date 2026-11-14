Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679016;
	b=QuqeialJigfC3OOeaG+PCP2Jml04gF7b2F6GhTn41L7tEidohpsuwP/sBacWGC3e8WHL
	 UYaPfAnCMi/kjisx7we4KIVpr47qs8iveluyG8wNr1H5cSnvCNbyU0496wCSAg37hNug7
	 f7+72lYwuXzcbQx7GCKfs/tx0LS4CvCkkGIB9VnEUqoSMdfPV8fUx6E9YYmWwxgGIPXW0
	 sxxKXVS+rJ2m1sdIewzZHQUKSpzS2IlEcpvGg+JlhT5mGchhrPgW1e/RQu0NVOJ7ir/is
	 jsu9u2cPWgmQ78f0TH8BY2gjIQC4+bA+fDuIE6izUKy9xQovK5VLCHZJ9eVogPzjJdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pXqm1o11ElV0Ndq1bicxgprmqaYAYKEl+LsqCcEbzPs=;
	b=R3SIr7aSwqlhfg1fNLiiYhlbykYui/OMA8U3HJf3fT3UWmgF1wU7HZaxHSvOXJbAF6a1
	 bUQuUucLViZ86K2P6qJOzPrrXNf1fP9x9Pna11UJQYVvXYiL1cQqLWiTWUdtNxDOT1YlO
	 vNVr4RU8ZFIcwvr9RAFFaZLwhuYtFdxtUQ6c3F5TEaz2bDXXWblsiaQLyXEfam4YJktal
	 ckZ9A/EqlOHqFl7pm9+k5PSXsdlTVsH4WPE2Bg5PhLPBEm825dKaYtDklbo1iqo9N/ZrI
	 4P3f+daLfx52RDV6Q6QaSewn1/UCVFOxdRVdVsEo4wEQiWQ8PktGlCULomixEl7xuTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGw4tmo9;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5217606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5217606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGw4tmo9
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b1a38a5088so617995a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679015; x=1795283815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXqm1o11ElV0Ndq1bicxgprmqaYAYKEl+LsqCcEbzPs=;
        b=dGw4tmo9z+t76UAJs1CPliunMuLwtHk7Ox14ZM/dtk3Hx/Hd8X6ZX5FrT+EpM1JckQ
         IPwMVUb5ioQmiV0EGAleMkifei/jmqEWDUvtweUZWM47iaFQbCs6nAoB9/lA91K+P4Xx
         a5eicwntQdaAv7r9cqukiwM57kwo5Zx50GOu5JChOqA+U9P2CFbKgR0nNzFnw7usUtVH
         vxbgtMLNRihV0HLwJpIb/0r/Jlejh4IS3jcDheSiNvWGH87KWu9hyQ+1yiPL+cHfJgM8
         mDtgppq85xKtHCrjzO5cdqP51BbfJyv3MoD06Ss23/vhOUAF5GZyYdjDlqoCf4R9Z9fq
         BzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679015; x=1795283815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXqm1o11ElV0Ndq1bicxgprmqaYAYKEl+LsqCcEbzPs=;
        b=qrLk2T0EusPhQ/5A3DPfudL9NLXW8Q8D49UdvJSKE5AqBYxyZ3DhKnW3PP+w9rf/hg
         E9D7kfqmI9jV4PJCyI/eWgEgcU7QDpR8LEcMnZlY/rXF48lMKNfY9op2SnlWW9BVa4dc
         hldPjbyhMW8QbpXPflLUqlNL23TnpjujYQFEwDpERBIQ+7gzajnuATFZ9K74U3mhDzFG
         DJImtFgWHM5JHGx41vcpKBXqPX7Ehg+DxQ/QI3w/OIN+uNPWmkOLIAvol8OmTWo+NuWL
         98jPE5XvS8kHcX0mJWlE8pYSEqQZviUXTyRWDlNfyCowX5CNrKRkXs0GhZpzpmmKwC5V
         La3g==
X-Forwarded-Encrypted: i=1; AL+hErEOVGAxNw6fJ6QW6Gcz+7GRqKxczCLiLlEu0TA9VFRj3cGW09LXPbA4cqum3F0gw5UnOfUw0d037VdQdJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z85TDmVkW3UpfrJlKY8mCuaollrGPiso+9Y2GRPlkU/qsK3w4ey
	6ivmZYP83TY/vP10yzxOa7VpGL8kROkLgJGfc7O89bM3l76GGlgB5l/F
X-Gm-Gg: AYBFou2aLmjuYFGr9qncCZDIcMWaIf8JqLEqHs4MH3Zi1ZmaGepOpm+e5SabHVuu1mB
	sb9SV0TQbrH9wzZVlCe5gxsa+J3/7hGW36TJC7E9BEJGhzn9n6w7uJUwM1skw37k5/M2Sa8y3z2
	z6EpERdWMJJpEDvrVWtXJxBRmpWzZQDAJCZP6o9ybMutp596KnDswRwbBDwEg5DIuGzuX4OhHli
	dwgTJXsuvDI2ZadUQlPSEm91B0CibSZQdIkRidOjgvzbtg1Bt1LqYeeHvR8S92fTJMAZVslujxe
	+TKj+/OtzBVpCA647zSzwAXAHbiNpT1UoQ2n9fdg6oLICM/YtjXj9ccczfcSDedAyp9DrGVSyV4
	KvmMkq3SDTn9kLiXWpjBCyIUhsrUSBXWjjK5vXd9HPDT3MfyEu55KRNsD4PSiqxU3yROnLv6Jd3
	Prpr4om+/cMA7Z07veIIgFxwjrjaTJxjHyKNG5idaf54g0fZoR4MemMOUPJJgUOEjYxkqQd5oJy
	91hDzR+K1LqsHRVXEFmC4ANwgP3NGeQ1TD7TO12gOjqGjY+B/UCdRSGmPuaGIToxg6e86IqpRQF
	qM5moqCw0Ep7TUhOKOoYmkHXFJnQMtp4Cmj+EbplJxjXBFyhEQ==
X-Received: by 2002:a17:90b:2e83:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3b1b0a1f097mr6398191a91.12.1794679015270;
        Sat, 14 Nov 2026 09:56:55 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:56:54 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 4/7] platform/x86: thinkpad_acpi: Detect auto-mode capability via MLCG
Date: Sun, 15 Nov 2026 01:48:11 +0800
Message-ID: <20261114174814.62153-5-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
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

The upper bits of the MLCG return value carry capability information.
Bit 20 indicates whether the EC supports the auto mode of the keyboard
backlight (0 = manual levels only, 1 = auto mode available), as defined
by the firmware.

Record it in tp_features.kbdlight_auto, in preparation for using it to
gate the auto-mode trigger registration and the LED suspend/resume
skipping in subsequent changes.

Link: https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_42j4cXsXZQ@mail.gmail.com
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 657a19d11..681b340a1 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -363,6 +363,7 @@ static struct {
 		TP_HOTKEY_TABLET_USES_GMMS,
 	} hotkey_tablet;
 	u32 kbdlight:1;
+	u32 kbdlight_auto:1;
 	u32 light:1;
 	u32 light_status:1;
 	u32 bright_acpimode:1;
@@ -5161,6 +5162,13 @@ static bool kbdlight_is_supported(void)
 	}
 
 	vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status);
+
+	/*
+	 * MLCG bit 20 indicates auto mode support: 0 = manual levels only,
+	 * 1 = auto mode available (per the firmware definition).
+	 */
+	tp_features.kbdlight_auto = !!(status & BIT(20));
+
 	/*
 	 * Guessed test for keyboard backlight:
 	 *
-- 
2.56.1

