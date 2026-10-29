Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309142;
	b=f4j8IG8ppyedtpVR8rBN8zg0sbMzOL+g3NU5AjKZT42dqBN5QLWfZUAD1XFkH6r3uDLs
	 JlKP6SKMgNwZYQtDs+ATLwUqZzv1wn1QHkDcp1bDNgRDlY62wSRETIZgZOR63m1ognwX4
	 mK4y9U0XhK6n6TV0xhJw7Moqr3KJGaac3im1nZXKDxW+k5Wncf+z57zL3OPtmEJx+a4Ph
	 9WSy0/7s7GAd511l4PZy9Z30cdwa4x3/NmePkHF1mzQsC4Epjtffxfz2gBHcdeG6uPw59
	 YhKPMf8ylkaYwYwRHXZ/F/RukLxz1h/3HCqAviFpUQL560JpodxNNqvWQoqu7UUJrAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309142;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
	b=09a8d7CSdfqRGP1NgHnnRkffDgebUQRAhX9HjM7a0jrUJe50bNDbkSUzh5vpTV7zL9oh
	 AmKcpr38KQuZIJHFHJ3YwDvdOR+E1NUyu5ENoxxS7uog1rh8rnoEUjQPHKv9npvdjtCkN
	 a8AVuqW9Az6hvZkJr2p2R/F/fJRSAUjAEFsaO7MAIaPOZFglEWk/qLPm4v80wW0HX0lrh
	 eLNmdtS3cbKSdlx3HwDt3aSPHirmcT31D8nvAD1VdVIua7YROgm9yTshGj4Fiqp7rB8xz
	 nzKEgXv4bUrDNKAQtr4px8bTZ8Wg9KIuvMI5mzp/u+mqMi536jZ32uFv8sDp8Dw4I+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WUvQjBbA;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021FD606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021FD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WUvQjBbA
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso17259a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309141; x=1793913941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=QpUwA4Ep415MqgEn82ArqohKc+5WLgatKQSQaT3yWZl5HyBi/1WwFeSVcYAsR4Xlc5
         RbP9sn7iK7GSw/lQhxVGJyGY+GP9mcOwaoO6FplnGh6Nj9Wjehz6PgdeGLwaRsW8UuGc
         hO/uGI7j2xtlaAVB4bi5qDXDtOBWipAPsgsCwPn4nGMkS279GF8IvT58T4/3aoCUi24y
         CBNHgAhsA/yfpEG+zlJGKs3y8PLqbkpj0NaHCiSuGGh3ke8bKs65dB/xr7ec4xQpCU5y
         dyP5n7uNl0OgEKnW4QnMvz9g1iu3qSdiqGAK779/5KI1d1U3ck2oCtwlLj/rVmA9Ssnb
         iTxw==
X-Gm-Message-State: AFq9FYKx4Esn0Nc5e9l6QGtlgSZvtuhbuOlqHYBfWJs91MfehfmqSNSG
	OKw6C+22YuVXaRBlK6RvCkRsGLeVhYke0B4RrIwYCuY9LZB6/x0RhaUnD6OfckdT6z0eSWh05eD
	Hd3RujgIqxSNa/6ehkos25Iz1b/EHyCQ+ezIWIgELARUNzjhv64QWTYsw8oFggHze/bfCSzBx+s
	TZ0wEm0T4fLH+4xAR6O/FAzNTYELHdtTtKrs5khifW/wvgZUT0F0V8+Zn7tqSZKACs5sSyTOyYy
	2UibNezP+4E0+Ug2ZlztqqrMJA=
X-Gm-Gg: AYBFou06RxKXvB9tSg12k3gmw+CR77z4IETBzL4tbTyqhGogyJGM2mJGRCEMw6WBqpf
	vntKu/1BEe/IcGDGeR7m9HJoco5b+NZAq1T5LAqb+hnvonz9eDmKlf4KMYmtubGXN/3kCj6wpoi
	3ki+XDpo2b+ZvwswzkTYAkjQ7H/aXoWMN14F1aO+kGJz+iIVWIId9Gyg3GGZjs1uvPF0VDY0UvE
	NfQLp0UlTO98sA/W4oag6zOCyJjEg5CXNY8WBMTM18iFNSwp04FNrrMIKsp6DPIGJgEY+lTx+W5
	s8uazzET00e7X8JSG5mzfkk2NAKmokb8Kn5d6Uioqu1Dpt6r3mnZfr15sWfMD+f7yoVv9F0o3gk
	88hUKi0UHT68aX1XZS7UlSslN6IXH3b+jF0cPXOEisNrqF4UjMyxg3kSc1B2iJsedzdXC0NGWq9
	jyqtopeOkF9yJkxYrZYwxMqmCMCU8XOIcxB8mfjyY+
X-Received: by 2002:a05:6a21:e0a7:b0:3e2:7882:f14d with SMTP id adf61e73a8af0-3e928acdf65mr497483637.70.1793309141388;
        Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8a989dceb11sm29777b3a.0.2026.10.29.14.25.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c75523074so1868846d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309139; x=1793913939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=WUvQjBbAg4yqi9P7UGCdvrxfdHIKMQMOWf90VpYxh6JjrSAdqAz7Jrjkdzk9Vcgpa7
         dzCdjhmcSqaYsEhR7PL4PuFyNRBQmbfkNOWYw5mmJxv3+a3wJddLsG6nD+lzePjD9kUj
         N0FwnX+JWSs5+tT9M9WconiPGTD4ir+cWu1D8=
X-Received: by 2002:a05:6214:5f10:b0:91b:8296:3b88 with SMTP id 6a1803df08f44-91ca4ae90b0mr3372436d6.15.1793309138859;
        Thu, 29 Oct 2026 14:25:38 -0700 (PDT)
X-Received: by 2002:a05:6214:5f10:b0:91b:8296:3b88 with SMTP id 6a1803df08f44-91ca4ae90b0mr3371906d6.15.1793309138161;
        Thu, 29 Oct 2026 14:25:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:37 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Thu, 29 Oct 2026 14:25:12 -0700
Message-ID: <20261029212513.4126083-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The AHCI controller on BCM958625HR fails with the dma-coherent property
inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
FIS command, subsequent engine resets fail, and the disk is not detected.

AHCI allocates its command tables and received-FIS buffers with the DMA
API. Declaring the controller coherent bypasses the cache handling that
these buffers require on this board. Removing the property restores
hard disk detection and operation, as confirmed with a diagnostic DTB
that changed only this property.

Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.

Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index a9b6aa04d573..53acae385822 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -182,6 +182,10 @@ partition@700000 {
 	};
 };
 
+&sata {
+	/delete-property/ dma-coherent;
+};
+
 &sata_phy0 {
 	status = "okay";
 };
-- 
2.53.0

