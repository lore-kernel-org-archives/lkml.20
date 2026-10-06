Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2349E14D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302580; cv=none; b=dknbJHleUxHuvTmZOqF4e7acuh7Ncc8LN8bwJFF9Yv9FQiKax/NvfEco/THPZolOmNsc7PSqC0pO4S8oC9jMVAAGHgVM/fzIFGoPhSEPL8I727owVGerH37UQMovUJLLXNknPDcUOJOxzdApxZ8zomXPO+aaFX2C61Lw9Ceqd00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302580; c=relaxed/simple;
	bh=Ft5tajPF6rdyfGUW0BWFsN32iOQqo1FkzC57Z7wFY/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Btj/DFaFGWX4TBM1JdZOYnjEsnVDDViZG53SLsA6gdmlU+yl0Tt5PdmdfTyu1GUenc4+dFaO2YJwSlAjWgesDUrtERiAgt0jHPohJFmtYEis0g4cCI1DahqYZ/Z8flemL2SMmCzEVqloNDuLwPGyWxwOXuKjZeLYpiCDR9oQZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=fnzCrYJ0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="fnzCrYJ0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so8208875e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302577; x=1791907377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=fnzCrYJ0bWH/cTkJrT3ILae8a4hgqidYJuaNshNoiwsP7tvsMUgs3rC0qAY6oj5oa3
         +Ff8xnl6qI2b53EXBjkFmGwz16Xq5XLciGiY5dQSpuomQ9y4bSXHP0ds52y2KWMDHwLL
         jR0c5yZtG5xg5YS3N3mxhCmwSHiJG/t0RusvBHuA3NZYMC9I4XtYjfLg+X1Nj515lihe
         071VsMZWFb5G14K+Ytkf0wXX3pHub4dItMa7r0IZpSJgObW7td4m+WjulC3sdUNIjV0f
         dJP02fp9qYKHw09RcZFtnP+VZOVQrOPUPuJfvTnm3HD3SL8SpzH5UmQNW9RCWlASPwq2
         Biqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302577; x=1791907377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=ySzs5WpHQ2sSccu8QP55eAOJtUwNJEQXIP38I5QQxT1Dka89SEJ489+8RECkOy9cgH
         PWNiUiK7O2fo7swAtzlwyCLf2BiuXT4k6CcAXn3PUAcFQapbBqSAP/6I+Ro9qJaWNq9l
         Bia9/xW2tlcUjQBK+/71BbQtVKsrtAj8GusdHWbkPRRepkzDKbhaCnyqiJ1/cWxQ8mv6
         itYLtZTcjlhwQUX/NgmM3wBDjLeMJG2T4DfT3yDIU8luz8UtilHqS8ylCiSCebQ+ok9M
         oP5etewaoVlB9DxedeG78XrgHMPWw/L+b8HXTXaSN8McpLV+Ljkz1Ju/Ucoyag2+uie8
         pqEw==
X-Forwarded-Encrypted: i=1; AKwUvBwlD+IkbEYRfxgCY7jddRbxfUhHiSZTpMjPvTc56zHDqDWRXOPWqVKzIKNshqhdbWBvfAz3oU7t3KPBYDk=@vger.kernel.org
X-Gm-Message-State: AFuF++noqbRO3wh0fBq8S7qCmHHhe+jVtXDXa68txXKjdsUdRoZiiJi/
	geGPGUCw1jEwOCRhxRVSJgif8wYZFll8mgW6nE2HwmSJmyqjlvguAksoUgJb5D9kjI4=
X-Gm-Gg: AYBFou13anx1DoFmAAc4yCz8KWCexkltQAszYFsCTPH27Q4XHZQG4GMzVR4XI95BCJD
	Vta83Jro7AxzIbqaWVfbfMICQ1YZnPv5QT1u5oKe5X4PebH8u6KcSqsDYfgIIvtV5j7egH+lo2c
	QtuPO+rQuJ7Si44p4Hblz45zd5dnz/0gJatcNZCXJgqgVx7kx3ydCLFnb7iCooJvsjz/qxGNaR5
	rnHhwe6LwPTrjKMCvDv6izz8y4/8U+uiwvalFE07WecwkbVxdpMBeZACIpa+HdMtzztpQILEAks
	06mH86rEKpb+zsEyuNxkhtuKuRSXwxbzR+JOTn+mZve3r2OMjfbFxTMRBvB3HNf8aM1C+Rs17nT
	TMjtA6TBrFcNeg5ISiqLgMGrKOKIFrfGQB8rBwTHScHmjdGsNA6oGqd2FMwPPpdMhJSrN14pU6E
	QTrUEKibE3RRuqTmGHJ/DQ3MbAZoVZ9kgWaq636mo1wS5NufJxnVdbbyQlSBZh2UZtUlbvP4pAh
	QbDFhSiEevpQ1kiIBSgDo3TZJSfKg==
X-Received: by 2002:a05:600c:5617:b0:4a1:78dd:dd28 with SMTP id 5b1f17b1804b1-4a17b55428bmr21165335e9.27.1791302577573;
        Tue, 06 Oct 2026 09:02:57 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:02:57 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:39 +0400
Subject: [PATCH v3 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-1-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Ft5tajPF6rdyfGUW0BWFsN32iOQqo1FkzC57Z7wFY/o=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV79Nion2T8ozWixZ/6da5aiGbrB0uVbZLWDY+xuT
 90xjzmiYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+sYCR4av2HxfXQ6l3JgmdT1Hc82R+Kv/C/vWRT4MbQ7YwVHyyq2X4Z854eqJ
 ndfnFiB6vAtOdWaY3355/PzPo79LmjUveR88/xQcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
when they find 0xef08a53c in the register they take the boot mode from.
Add the magic under the name U-Boot already uses for it, so that boards
able to request it can do so symbolically.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 include/dt-bindings/soc/rockchip,boot-mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/soc/rockchip,boot-mode.h b/include/dt-bindings/soc/rockchip,boot-mode.h
index 4b0914c0989d..88684f4184df 100644
--- a/include/dt-bindings/soc/rockchip,boot-mode.h
+++ b/include/dt-bindings/soc/rockchip,boot-mode.h
@@ -12,5 +12,7 @@
 #define BOOT_RECOVERY		(REBOOT_FLAG + 3)
  /* enter fastboot mode */
 #define BOOT_FASTBOOT		(REBOOT_FLAG + 9)
+/* enter boot ROM usb download (maskrom) mode */
+#define BOOT_BROM_DOWNLOAD	0xEF08A53C
 
 #endif

-- 
2.55.0

