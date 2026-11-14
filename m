Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627112;
	b=Ioi6Ja3/E7/fVKPAsOTvUgqPeQDyZbOIKRuZEYXdEHLFt9nlws1CAKF22qrgOXdPTIpn
	 iRfN0ZVLbdj4Y1sf+h66154D16FiB/XQ/DET4GzzCuZvyrQjxepFQbCJUOr2C3bNWINGx
	 Ql8Od0VCRH5MCytXI+a+tElZTtND1IIr3K8NOAHRmbpGN3PYMLmPoHb2USLEH3CHoWcn/
	 oxDt9MnWsdREjfSUKxDvHWPVdtsoCrgJT0jpbPb7gALrPjD+3Eiq/oE1RRa3YhuqdO9mQ
	 EWU3ZkoOnoGCADf8LB+PtNlyn9VKilvAvzripC1izo50blzMFbKeVM/1FkqFJNDdWCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627112;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uDXGjtYZFeroFxSXYLMZqZjQ3eUeUraVZ8Yi3Xsfuic=;
	b=MC1ttRNO7XWjEqznArq1gam8Jw+ANmU++UavEu1gn0mO2V7u+gMvfet68ZqUsHgUIkQF
	 +5sy1kAMSfE60r640555JAZm+W9Di6XtCOsUnq6zZaOFArFyrj5ufr1hyKYCoujsTiAj0
	 0/yR44iFNsSk9UZN0vM7C2V15GSrHDDBDNYjl82+VYH2e0aklyIKrx9eumxllr1p7qoCd
	 Fjhues08IZ87PGyDNNcLuFbld9xq1tN6nj1RJx3cK33FqJc8m2+3XRldowaQo3JhF4SFh
	 +WtB16x1HjSAU0zkCFoHhGoD5rFrNK9vmI1SRqTNuXDZKbPHIJYNzWIcbfAgstM9yEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="LSO4/5uQ";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D594C606A891
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D594C606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LSO4/5uQ
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb628232d2so1751348a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627109; x=1795231909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDXGjtYZFeroFxSXYLMZqZjQ3eUeUraVZ8Yi3Xsfuic=;
        b=sFmltb5NYTsbw/2qI3x1R/eMRn2TxyRGFH331OdtiW+jahZBqNsATJS+TlQryJ75/3
         wIkViKIOQfRLGUVwgmLesC8NnYXatayRCyrY3EmLCQ1O4z5iVSijmDB1Wxmdgv82XAd3
         Ya3au2Mriz4qwTFdRgPmjq+V3RSm2wKclh10m6+cKcv/4UtdQJFY80L6uGNy5XU4Fz5D
         axlPSLQ/kqgNkHIs43tPxYZa25bDv5DGEvnpmvvSLtlQN3Yy058OQQ4U++m0LT7MdLe+
         Chx20DI5z0t+YLbiA2bef3qORltKz9AnD0bYfBFDWqqakYQ/yzI+nmLJm3gq5PgMmE78
         bIFg==
X-Forwarded-Encrypted: i=1; AL+hErEGwiyZr21oWk1zwXzjOnv03N4illDSu86+7aHQxuI8/A4QfemirJ+KRS8K3rLSfyDismn8q7o2YRR3CdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0DBzKyuc8QJvx3YYJxtq/6FthFSmXO5tJPmOeXxLtQjQE7V/8
	T4dAsd+hW4Pwi3iGNfn2xvBWjMNEcdiFiJEz9C4ryjYRkvFdNSHqr6+sZsO494dM/4G9S/K2ZtR
	/5PvsbHzZsLpqrwEKl5olCQTzh8LGa+njfZmw+0pnLwPgOCec3C9WqdYPgPYR3AZpyRO79fwrKR
	g8qMFS/xuFlw3k0p2jqH/kcZ5Viwre9I7dL/BE7p/ab5WIX8AXkedLCJOG5T7rrZnxzXdR87zju
	Gd4WItDG5FVGq/fVQH3BY0u
X-Gm-Gg: AYBFou3utSARpZV952ts9X8GnQnR+dcbwVJ4rzQ4/g/h0nHeJLthFHZeWpZiS7Ltmbb
	T7M5ZkIUAv21gvhDQ8N9vVN2LBQymM5otjWrAbSOyBQlutnUa8cLEaznaCH4BmgIzvWZxf09Np3
	rOcNViMEUxhRC2ALg2XNYmrkS0n9Qj3UeWKkEygxOePPQOkmfAsnAilJmeL5mesCsuRdOjRq1cK
	IiDwsi1AL2royB7XE0/IKyHbpxhWItWINjNXMnc/PdGiOZx+M2usrLQQy+9ELsp2UaYKAS+Wozt
	TJNI2B7Wsgr2HekKWzcKDWmLKNHzmCgYbN9+g04hM38WHjgIb5L6Fug3bNG1pjJltSEqjFbDDXK
	RILZtKmMJ37Qt9S79So0OZwfTyXQmzRj4yMOQVCwVOBXlcHhgu6UFedCCRa1RHMz/tr8b40MsP7
	LkaPWx6kI1VPZycJMvY8GOM1OWe+7jQkJusd9QPoP8
X-Received: by 2002:a17:90b:2c8d:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b1b0d8a4d0mr4654425a91.64.1794627109143;
        Fri, 13 Nov 2026 19:31:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0af1sm8868307a91.3.2026.11.13.19.31.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:31:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ee1ed68286so9267475ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627107; x=1795231907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDXGjtYZFeroFxSXYLMZqZjQ3eUeUraVZ8Yi3Xsfuic=;
        b=LSO4/5uQ5HqCwvED4RQaC4OLT3swfTCH775IXZUSrPX/1T6HYAp/yQXupokaoYVklV
         KED3eYi+TplXAyhsrTtzs1UsMeuxGosVmCvfD9XNUxDW4NoIFX5j6TCNJusR9xOZdVoD
         dyMz6KJQoBX7WZ1t2bIIq88L2ztrRRtczBhmY=
X-Forwarded-Encrypted: i=1; AL+hErE8+m9R/3mdfvVEkKH61Cg6oWAB2TLL/n9l1oNkw7XT8HVPlswoaHAs5qNjfW1wVlzP+7l3Hd3tWmHxBPU=@vger.kernel.org
X-Received: by 2002:a17:903:1aab:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ee0ddb1fc5mr48907095ad.25.1794627107455;
        Fri, 13 Nov 2026 19:31:47 -0800 (PST)
X-Received: by 2002:a17:903:1aab:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ee0ddb1fc5mr48906795ad.25.1794627107044;
        Fri, 13 Nov 2026 19:31:47 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75b489sm17051065ad.18.2026.11.13.19.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:31:45 -0800 (PST)
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm: dts: broadcom: bcm2835: Add reboot modes to firmware node
Date: Fri, 13 Nov 2026 19:31:43 -0800
Message-ID: <20261114033143.875897-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-5-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-5-56f680ef4734@linutronix.de>
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

On Tue, 10 Nov 2026 14:00:15 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
> this mode and normal boot mode to the node.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
