Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626846;
	b=qv75bSVz26pZkMEWH8dXAlN6qcKtOaKHpvWdTBBWXyzOp0RWhYN1FznzGX1+aBUpEv2N
	 NCCC1T6sBy41+h++JX0S2k1Iu6LS/SRL5ym4c9y3hgHyRlMqlVoBN67lE1FzQgpkjCoPD
	 Ws4OIfLN5vGPUMBFiUDEDPOJ4FhH0hfQSE4hdEBS9p6DGRlDRwsq6nJF7lUY4ShbPqHWi
	 /dDT2TWXsPhgMxSpcYATM9mPpQks6ssc42rAkzXMf9HTzbr24hN4rnEE65vDOaatChKJn
	 8yMKGuajGlNyQFpKfb1a8lvIgDt21OLHkdDSxlHIAIFb76S772XnG2qLbltgcHPJV/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626846;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=V7KZLQR5brjOUIbxEs4zMrl+yMEzeUF8saSJp6bGvXw=;
	b=QrNbrvWmz7C14ja0A9NuHAssRl4ZRR+i+gZ5BjQ5tmzHjCrE2NZcLHJ+LsA86i/KRzCG
	 1CLqTadgsYs3eEljpq+IwW3SKcgi7A1ixoNc3jhwgI/uQ0PSpy2Hw3HwWab6fjD7v1Bw8
	 vNIDXyA0ELK5IwwHaekKx0JeBKDFLQWX3f1F7qiP+75/5ugDbmOgLw23xRTxN7+smy9uS
	 VA2+hBsk4YA4Mfl2k3CiS7XAAZjfEBPebBasVdyUDMTPW+77foP3bZ/CQtNGW8OlVucLg
	 DJLRtUd4vDPpO3LdFMNgG+EAy3ytO+tJSKane5KHMiONuxPd9RCY725b8bF8owoxr7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HUsTsgB7;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4990B606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4990B606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HUsTsgB7
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso866924a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626845; x=1795231645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7KZLQR5brjOUIbxEs4zMrl+yMEzeUF8saSJp6bGvXw=;
        b=XPMKS1LnBLQap5m22a/s5mQexCxZyijO8tlWPNVve3HDbk45wuFM8sHWAe5zuoRm4y
         fS+vX463HFxX3ML70B23oTA7NocKq5Uo5eyiUCEAJazJFeVSOVzWHrCyRXrCGThA/Bhp
         jCHSF//zBQP/96qRT5CtY3VJ1LlOATVDGzhDJ7jkYj7Mj1Vk1mKhmUxkmOMS3N9oXURw
         kb202mKFZ6cdZ4JjF5h3KmSJ+3fcqpj8b3B8hJ68/bY4ZLgPOWzLhpsReRVqlkylpyxX
         bGARghYlcNwRfTdQfp8kn9TA71kk+wNene2flUnsy7SYli2vjMFqFKm7hyf8gGXMQgA5
         TnBQ==
X-Forwarded-Encrypted: i=1; AL+hErGiuBsGiihKAqY2KANI9iQHJzyRLPU1xqup6OoFe4W5z5rD/zafdicsj83klybUMk8MXFyG2+sSPusxb6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V5skCWSdbebvTSkt0lX31WkxwfRmwgzcvtTRXr4bzQGUNvhFE
	Dv57xvTCwN1w6Z/3yPsAbZEcSBVeKYXXEYDnEe/dhYBteou4hJaztLizfOJXcIDhXJfZbRP9rVM
	LY5sOEVjeIZa5ml4KdfaUUoWqsvnUJjxX0v1upRxgAYgN5UgVm4qIzZUuathPLoOLBc/nSWmX5k
	fHieORQcDOtC/sp43T+fL8gzk0qgk6xwcI25GZ+q+GhVhzSwby7JqK37X0DbKLSN+v61FHWARx3
	3/7Fi9L6nzEbWHy1Eh76S8M
X-Gm-Gg: AYBFou0zH1SL4Xsik4nGzwut3MEW4q2h/tnhoTmJfVRJb+OXN5dHvUGM493xgKJmQhW
	9QRpCV1lPMrTh18NPfXz0HVJbCfAJy3mISt2xKvRVyaBosv8FoRtpmrDt4QFUXzEhk7p1cT7lLL
	6hN61PO1Zlo2XJMNUnBLPQaRuhg919tXnxVioofrjoWjf4SyoUjeTlL2932eKDKpwH+iEmTgoAW
	r3Uox3GTiutUMDzrujA8PwJ01uXlth7fF4xLPBfLJYgK79GBR3B45eggrYKo9o4V5LUfcYTa+8x
	9Ip06t9gXzV1hGZuRPD6z8RKzdklfbIsn42ALiPWSDHg8OwI3MxJYlNCpfFT4LdLVH4AelLJHDE
	wN8EUGKc6cfWoAeEsxpuT0iKecuaRa49oY6HEd3Crw8QC/zb/dnlx2+gneas7c/tdoJqIRePPJc
	yCD8RznxGQ4UrEJSPr7klk2Wts0o4or06K9NnLzxmZqKk=
X-Received: by 2002:a17:90b:11d8:b0:3b1:ba59:56a1 with SMTP id 98e67ed59e1d1-3b1ba5957b8mr2392556a91.39.1794626844590;
        Fri, 13 Nov 2026 19:27:24 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3abbe1asm3284284a91.5.2026.11.13.19.27.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:27:24 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so1658582eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626843; x=1795231643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7KZLQR5brjOUIbxEs4zMrl+yMEzeUF8saSJp6bGvXw=;
        b=HUsTsgB7MDdLyo2Sl2kxHXmLWXkUIHCdsvMHsa8bLjWvywDTosyXi8fJrvk0e7D4cv
         NTnzgXRJF2bYsUBom9QDymjbpy5oamK7CjcNQgzVA6SUaXhPTQglqcdIla+mPMXTpCAD
         qi4nd7E95pisUxvmOAx8hfgBiDrjBRIhWMEKE=
X-Forwarded-Encrypted: i=1; AL+hErEBDxoVLgnHwRCI0fLdiL35e+DuJRWhm1BLeFznVIQS1Wfz+TYp6HAKmnkSMiEfQX1JjoSqs9l87w8qvs4=@vger.kernel.org
X-Received: by 2002:a05:7301:db0b:b0:36f:4354:608 with SMTP id 5a478bee46e88-37967cdd5e9mr3851046eec.37.1794626842673;
        Fri, 13 Nov 2026 19:27:22 -0800 (PST)
X-Received: by 2002:a05:7301:db0b:b0:36f:4354:608 with SMTP id 5a478bee46e88-37967cdd5e9mr3851008eec.37.1794626842041;
        Fri, 13 Nov 2026 19:27:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm12186736eec.7.2026.11.13.19.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:27:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/5] dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
Date: Fri, 13 Nov 2026 19:27:20 -0800
Message-ID: <20261114032720.874249-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-2-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-2-56f680ef4734@linutronix.de>
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 10 Nov 2026 14:00:12 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi firmware allows to set a reboot mode called tryboot
> that allows to try booting from a different partition to allow updating
> of the boot partition. Allow reboot mode properties by referencing the
> reboot-mode schema. The firmware allows a 32bit value to be sent as
> reboot flag so restrict the maxItems to 1.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
