Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870442;
	b=HAT7/YOTyjS7YC3T3h9lS+7YhvlRc1s3fVJIrTpkpF3V2OHzAsT82wqSezfVyMKEz7D9
	 L0kqW+B8bhr0w4S7cmUaLafeqylVdIAhhMyCR2DGFxQ5ZysJXjPPG72K9ik7rXzX36qeP
	 jEVCgZDd37XTKrQGr4Ty6wrjwGCJe+hT5MP9DQ3PLp+7MxRxoaSEmBlkLkWlbnmAiT8kE
	 dD0DxLGz6sGDGn239iQ1E5SG60iFoYIg7VcfjlwGTFyMKSNxvXF3rxd7PFUFO6YEItJ/1
	 FCALgNczGqMtY8uxJe+54wboEJfGbuTyjmT0+VEgm/YoImmAoPjuURh+i+prAzPiAlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870442;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=d7QIkQGcuhgCwpwukZfMYl/m0eNiW9yDpQCv/4z6USA=;
	b=ml2pzfT/01ipZty5eKKY/5KJLuNFUv6WlpH0fQzuosNmvqn2TcvBsLdFoaEQsnyKRte3
	 t1R3eBz3haF0soj91xygqLK8z0+xT2J6FIZJD9TbBcgc+IoQkPWdlQWTOZwFdrjNyo2ZJ
	 i9KyyPvhymDH57/yZr1fa6WQmtV1AVCgajdpKIkqHcK+B+4tOjgohcgeayzB0fOvrxmzm
	 JUeZ9I4WXuzfMEjaGHLyxG3Sf5VD/Psr+G/upHcm6yzT0G/CD+FraTylNVR/5kIumwP9b
	 DeT+vPkJgsyfLtTtPdGG04ZSEasXPIu4bctr/XC4Dk208740mXZPa5AM9ba0OX/ZuiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VaeBDszm;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEB860A263D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAEB860A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VaeBDszm
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso1886928a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870441; x=1795475241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7QIkQGcuhgCwpwukZfMYl/m0eNiW9yDpQCv/4z6USA=;
        b=2n5L2pd8FtyBrZ7gSYqOy/2Wg3L2Rp6/HlDGfGYNwbKfTbzktULdQQD2NGhP0S3D7Q
         gPSn8we/EhswxL+62vpdyjg0VUDc8x0cmkKiIn+y8pozNxz69yee76Gj+m6Ie5SUwjWA
         RyQmuCFSkINvIbVfT85nRmVJH+ERLlr1dX6+4V0c2Lr36mB0eJCxVNoPwqrESydN5IfB
         6db/WIck6VV0iHIQW8zwU1rIjP262gzYa6QNZvxcvxIiHYMBK5p57OTFSB/NON/mV2NC
         0GK5LgfgwD+YJsHQiigMrgcy3yJelj8fnxuVx91Awl/sJcuHu6oUIpisD8FTN0a1lfYw
         C7+Q==
X-Forwarded-Encrypted: i=1; AL+hErFb9QS8sWS4/P0ZWVcaHv2OiZNplQSs02jbCoWEmhgPNelyYymgTHuC9dF/oMSIrHsZgBDpV+iGoNHmrJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WKXAF+ew0CuvcUrydyRkrJCwRRBI00GvWFJk8vNXgGE+Ua0Cl
	ACaGpcfLhck7aFCwFsay6KD9V2+sQBpubWzNTZfTr1OamufxSAeD5aem2dwhT3sUiRwpFJ0AYad
	IK0b6DSdmENVjKK2kwELac2iakqpzSV8C0msLkbtWXKb6cms/JsEGyQOl0ueGORH3MbYD4Kgbi6
	7OI8ybZ4orAx9LfzPkyONi6Qutd8RQA1cT1wKbabGSSuv3le/p42/s046fVlMnzzFmg+gpHoIWj
	pvxdwUlMBkwJcMdwMtBQZ6f
X-Gm-Gg: AZFdTZdNg8M6dMZHgaHGyylNU4M8/dIed/9DS9ZQzUovTgqUVhARbAH7F9Rfhk7OGZI
	6mh4vnmPUSrFQhmOLqpG8x56RCn5KH2OyqgL9SH+Y/vkGYc9RWs+jm+AkAX05zfbgXha89ShUB2
	aK8kIfTYfX3Af4f+FNVZuQk62mF1l1kKR2CAdZHs8cfAOT++yFd/nkCSNc2f3+BYEbAF26GxUc4
	SUVgpw9a2J2p5Y8DAdVuqWSsq9xj9qKb7QRmcEp+TH52o/HsFdkDJSG4LufJfvz3cCDoDssTZHh
	UtW4mR1cUOzIT+Xm18Fa9AAAcS2STUlVFsj2npg/l2QT0RLUVj7+r04+nuu/hH0ORJtB8j2I3KW
	FeHfUPTthlrpczAgkTDSAsS+nxkSPPSnj+sfIpHoDsAUDFyi8ApAMJx2R3UYYVHk6Ce25Yo/BRG
	r0Vo3s8sL4tn3tVIXU9Pzeaf0Y2y/xAFGGzFqEN0qo
X-Received: by 2002:a17:90b:2b87:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b1b07e9026mr9814721a91.6.1794870440694;
        Mon, 16 Nov 2026 15:07:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a17086sm6443491a91.3.2026.11.16.15.07.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b238436265so2206887c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870439; x=1795475239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7QIkQGcuhgCwpwukZfMYl/m0eNiW9yDpQCv/4z6USA=;
        b=VaeBDszmKHnDGk/R7SIAlVzIe1CwFTI9g1YhyDFwB38Ltud2DWD/tmVEPlcnj7gASe
         qxAqxciVVs4SXBKHt0SNl7h+oDdu/WV+ODf2bkd5biR1stNy+FZvaLSH7yDuBLcViTol
         3eDG7iAP7ru1wX21Ti/DrLRLEcg37bP6BGA3I=
X-Forwarded-Encrypted: i=1; AL+hErHE7TXYFxN6iLqirP4AlYHsHKG7qnj3Ki6BM//b9wTL+OiiyNUIEK99ASBzxedO0s6MqH40VBHbpTfmUEQ=@vger.kernel.org
X-Received: by 2002:a05:701a:8458:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b522fb84d4mr6306508c88.16.1794870438546;
        Mon, 16 Nov 2026 15:07:18 -0800 (PST)
X-Received: by 2002:a05:701a:8458:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b522fb84d4mr6306480c88.16.1794870437878;
        Mon, 16 Nov 2026 15:07:17 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm50516401c88.9.2026.11.16.15.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:07:17 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v4 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Mon, 16 Nov 2026 15:07:15 -0800
Message-ID: <20261116230715.1489712-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-5-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com> <20261029212513.4126083-5-florian.fainelli@broadcom.com>
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

On Thu, 29 Oct 2026 14:25:11 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> The NSP SATA description omits the IDM block at 0x1811e000, leaving the
> interface clock and core reset dependent on firmware initialization.
> 
> Supply the IDM as the third controller register region so ahci_brcm can
> perform the downstream clock/reset sequence. Extend the AXI bus range to
> cover the complete IDM aperture.
> 
> Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
