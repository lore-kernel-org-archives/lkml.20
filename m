Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB543CE6A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083715; cv=none; b=ilbYxoWxDJk6Hy6gE/tOXXUUO+k5bxWGmpuDxo+5i4q3pvtYdxzczlBRjNxqvpCClR+HIu0p0LDTsaMAmxIaemqz3F3zu60gYIE/6ua0uiOMxMRMw56pc2oKvM2vniUlfC2lshi1qd8CKyKojXwwZaE89yf1TC5oiPVtBrKvGFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083715; c=relaxed/simple;
	bh=xCUiIr5EskgNmS8vCVmRU0QGH9yOZ9MWRCiiIOcxeqo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KHb5RgnOaa+2RbflnZWWXgcag0rpxYzZuqAc6TiYuIvTGETy8WkTvIwNTCCkcFFDLyYUlIn1GX0UEhGHNpBGf9fgRwNs+l7iRyvJcdXB9f8/t1+5VFrf9jPlT32bnC3SO/3h7ZsJWTQ5CsCi8nn2GO/u/9Xkd78Q9SELC+FN8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=f0/9aVjw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="f0/9aVjw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so23044445e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790083712; x=1790688512; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lZNjlC/+ZO9O6oGCVqCRDGRskcv8+56l0c98g5Ml19Y=;
        b=f0/9aVjww9/Mi61031F6eWOBaUsUQaoxQZk/9CxZ09ym6BJmsIAt3CMP3twiqAIvMi
         FXxEcg5iuxoYdDvgr3T2nJLjeSQkNj+JY91E9KzvQZf1emp4s2TS++x4ItLlIvlbwMup
         qONuelVaIpqCm5TgwEyrWpgj6hfqEUVj6E6bpQv/c8uIGB61URnxaQXmiOlwJEYwgWJm
         UNS71Ay7hYTMsWBesQxCSEeq/HAgH8SbSFZP69KRLX36xyjDZ/gNAzdddUlLU2AMjJOY
         gSmA5/AO+Uk6UghrzzhicyMJprzq9Ob8H2EWQ5t/FN9AarzrOyk9yqLJ8qi+uCEmTSr1
         3ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083712; x=1790688512;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZNjlC/+ZO9O6oGCVqCRDGRskcv8+56l0c98g5Ml19Y=;
        b=ThcGb0QbIMwXqysmNjPjGh21GgzG8tsnDaEd6JmP5t0OSChW3aIQOYPQ3y9D0wxM7d
         6E6Ms5bs4Jwa0DJUiy72s/2M3sofjiUykjMaNyXgd9ecdcJAn4eWlnmJhsD26CVqzRJo
         Wd7AXScd8YzPnWTUOSTGD04Zqei8IcGqLo5P8b3XoTbk4kwigMurcDXHUM9p1cyaZ1RI
         h/DAlmaBp/KF8SMDHXkqlCVvJMesjYt+osBFgWTg+sVk1s6qjRA50ZayCiw8LQcLqJvZ
         bDiel7yX0LeYk1WN9Udrc2QWvG5G/+R+gnivHGy4fWQDH3bq6j3ApmRncJfI79Wfi6q8
         6KsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuMqWqSCK9CmIRi8nLqOemjpAd45JUP5d+CkMZLo4BemNHCMFrNqRm/Ojb++P8Romc3rrymbkhFtn+WUY=@vger.kernel.org
X-Gm-Message-State: AFuF++nxWkG1oRu0+YEodqg+OlGG1VSMGZI/fAmudPAimI//M0jvYpLl
	PimvKaTooV1Ov2FNwkBL3knp0fBRX3u8zwFPkAEiv1QDpjpPp5rYbY6sHDMOSfCt4I8=
X-Gm-Gg: AYBFou2Y8l6F8EfMKo+R472LvsYEuPfBulm3JN1azSS5axcZgEvwc7suO7r6/mWa6Cp
	cTk0gffL7JQIckyiPfBrXjXCpBQN/gcud5t4NUBDAp5Wl7vi25J0ISGdcWi19kJFdQQoHhHTyUi
	SiOgNMq2d09JIEzWNDxm5WmQTZIpnY1ove56siJm2CJzQumKwrba1F1zXhJoblsqOGhbPO2ViWq
	LIFgdV369vT1e1E7vJqVY3mfeGms+5kuPWGrtN5o0go4J+dka8Nuevm6qkwwWOqw1UuLA2ktd9f
	rH2pDtBkgMOD3iOUxZ4pJL/3imczuM0Xykibglw/2VniLWFlr3s9TzBkIEFSU5IYfW+b7fK7w1G
	E7EOi8avUAeKvjhLKelMeno4FZZOH7SkpbYWFsrULqkG6y3Dq7UGfVy8OfklE1+FlWyrPMT43bm
	d60jFaPjK14Aig9ZaGr6YFX5mbUdnqJsd4xGoxfsgLxXpon5mmxb+NF+bPsEG1DSxADx29uJ15/
	XmVooTAgiLC7Kw=
X-Received: by 2002:a05:600c:314a:b0:49f:ce73:7aa with SMTP id 5b1f17b1804b1-49fce730865mr142999245e9.35.1790083712062;
        Tue, 22 Sep 2026 06:28:32 -0700 (PDT)
Received: from white-mocha.local ([2a01:599:842:c46f:7b1d:31f2:7a17:2f4c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8ce2623sm98226175e9.13.2026.09.22.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
 billy_tsai@aspeedtech.com, andrew@lunn.ch, tan.siewert@9elements.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
 <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
Date: Tue, 22 Sep 2026 15:28:19 +0200
Message-Id: <179008369971.83584.9572254757332285883.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790083701; l=1759;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=xCUiIr5EskgNmS8vCVmRU0QGH9yOZ9MWRCiiIOcxeqo=;
 b=ULILOtcbZnS4GYuH+KUA3n6tP0aNNnEcrdkLC88RnSQcm8yJEzrtKY85Upx9eCV9NuLq05VSE
 ISHdQHepC1gB+65oLajN7pZjrTmD2SUiJrvhRvKx2j57FFgFm8qPNJC
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

> Add the device tree for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> Describe the BMC memory, SPI NOR flash layout, UART console,
> GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> connected to an RTL8211F Ethernet PHY.
> 
> Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
> 
> Configure MAC0 to use the RTL8211F in RGMII-ID mode.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>

*snip*

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000000..a4e384588a54
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

*snip*

> +&gpio0 {
> +	gpio-line-names =
> +		/* A0-A7 */	"","","","","","","","",
> +		/* B0-B7 */	"","","","","","","","",
> +		/* C0-C7 */	"","","","","","","","",
> +		/* D0-D7 */	"","","","","","","","",
> +		/* E0-E7 */	"","","","","","","","",
> +		/* F0-F7 */	"","","","","","","","",
> +		/* G0-G7 */	"","","","","","","","",
> +		/* H0-H7 */	"","","","","","","","",
> +		/* I0-I7 */	"","","","","","","","",
> +		/* J0-J7 */	"","","","","","","","",
> +		/* K0-K7 */	"","","","","","","","",
> +		/* L0-L7 */	"","","","","","","","",
> +		/* M0-M7 */	"","","","","","","","",
> +		/* N0-N7 */	"","","","","","","","",
> +		/* O0-O7 */	"","","","","","","","",
> +		/* P0-P7 */	"button-reset-n","control-reset-n",
> +		"button-power-n","control-power-n",
> +		"button-nmi-n","control-nmi-n",
> +		"","",

Nit: indentation.

Other than that:

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>
