Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870463;
	b=qX9Eg6RW6koIPNf1LSpZqcZpWp74eWrfk1trZodEF7/bY7CN5ytU18CQzM/vtYjzJOsj
	 DaHq/nhj4UFfH1RLIJjj6thL8MSBYfDrOcl/ktkeE4cWuyzxnVh2/ZoHj+xtKAaDLJwQP
	 v9U5R0eA6eDZ9Wv+lKLjPlHFsZ90yqTbNqUiCBWpePcbbBFA7yX/G/OYfzP6nLBNpaeO/
	 nnTdEIPs4CfVFAWVY+58VRmbWJkPIevQ+Jmwirsxtrny+e45lpQZSeoIWGIr0UFJoz+V6
	 6Diu3JcZVIfPXEqOhOS8A2mUdlTO+3oJ0WJ0B0CIpZL6J17fQqsHvUPvF0KXMOZFpsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870463;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Wst+LDRzcSVTFePzkpCfXygrywKuV6vnyIhVCYwr1YM=;
	b=jrkGzVcz5rHBjXr0T8OfOBgWPZu4F8/ocvCEP0B8idw2JHIR/cYMOagc7sYb751bNZxn
	 cRqz2Arq4WAfulrr6hCiszUs4Nj8cQKrhTV9jOE4lVkQRTPWOIuxJtlFQOz+MI7+j8bJy
	 GTkF5qiNdy8cTLLwJbisJH8AI1U4dgUBdOKIOMlTASwtCVrzgTpIYR/qF91wDZpj9qhR5
	 Ni4/sH2C9dQadwFLzUDffW56GujmfySbv3YSwFkwhdiJBQkDumZ2WSoJktFmxXZL+P3MR
	 VL3TP0Ko4T8n3lQj1GIxfwqnTv/TMeDuewNHIx9XCEMSUxLLa4lKU6Sb4UW50QCGNyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y1aVRoSW;
	arc=none smtp.remote-ip=209.85.221.228
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578CD606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578CD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y1aVRoSW
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so4368379e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870462; x=1795475262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wst+LDRzcSVTFePzkpCfXygrywKuV6vnyIhVCYwr1YM=;
        b=PQ4WzHTqslDb0PEFzXsSbQTHB88r582Pph/Mo27bLu2Zt5TpiiH9xNiR6XNl9Vin4t
         nn5gi9shjzK9nN9ej7ejKZudJ3RqneEFo0MZwuiQngCAUsQIWobyRxK9FCLGGsOJJc1N
         qXUueaGP7j5J2pCYlGE+FMdxYKhxnrbsLQwKKNO8OZ90blX/H6MMVkt7bkn0vbCE/jai
         nBY3t++ySd+5mJ1AVWlu0i5n5zXOA6oTpqiGOrsRx6A+1McHB8qRWT0+e8BsTVaaDF3+
         XEcFYDzE4vGNqKjSA2SYaoLXY46hGTkeyE9ZIjaT76Yl+mS8Y6P3fg45Z3Cm9xrTOj16
         SUzg==
X-Forwarded-Encrypted: i=1; AL+hErFKrsfXEvHgt/dScdiEeD768mDa66UeW9/TNc9T+dY9+iIuVeVSxOm3syg9FtHux0DNZZC1OTE70sKUi+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AF7hx2E7E4yeMp+FvMQxGtkXXFGlNuVzT1AUGB7Y7IHuWCJ+x
	ofnusee2h+VzQxIl1iafbXU0L5ZxaDDF1st87EbOkg3QFfRnz7u8cs/PYqBITUEgOXeAYKsAAeF
	AF3rHUYNg68sSU8FnBuUuyln5UfW7zysB6o5b40MTjvxAZ/NDS1HIBzYWe97lXpsVr+bWe50ZNS
	8jfqhSBwDH+gB3R6jpUO2/xNJ3JMF9zuBiqvkeVEE69EOXm7Ar7DgoAwIEvsCJKwx7no3cbRO7a
	ZPJmn0xfNJvxTRu/sg095df
X-Gm-Gg: AYBFou2xaMquesRWsb9LLAFMNT+4X4I+zwKHx0Pa0cjJN1W9QGR6PW3jr67GqdERtvU
	MGbKzE5LTdNXp7laDOPr2oLVsvF61XFce/bjv4rg80ZznlipRSAr45POv9BjkNv6848XiSB2G0S
	CAKGDwOPyBbOdxGVrdrafLHJKzLrWS262EAbxDbAhV+KgJo9HE0kK5adC255gKUx3aNqzfGpzjV
	F7G5kZXALMIEgU/uZPESwdiafNIytFt1YhZHU4Dn59KCAVhXO3pMpm8xw4mYOkqSy/+dZ3QhFWv
	J662zjaFWQiN3vEL6UMe/WTkJa5V2PL7ntYtCYlDE0pketpQet2AKeu65V9YeyeeXZTmzHEp7QB
	Q4jh7+JXrGHLMxPTL00V3YhQ5tnGofjObfuWeelUr60uH5xI+SPYVldV4PADzpfekWgdnDkaYhg
	ROA8h7GSjm+7G/aTgOpoaIP5brs3IVUc6Get+Af/nJ
X-Received: by 2002:a67:e7c1:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d64d468432mr4531647137.1.1794870462328;
        Mon, 16 Nov 2026 15:07:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d69df6ff00sm12938137.27.2026.11.16.15.07.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2499889eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870461; x=1795475261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wst+LDRzcSVTFePzkpCfXygrywKuV6vnyIhVCYwr1YM=;
        b=Y1aVRoSWpidXZCftNIebi+dCwEd+4KobpnVtHAFpTFuNyFg0wbWuxmTbDnuVIo4dXB
         AmNWblLmoyHKsYVe/mIM5RiYMAVK2PsBho2TUEc3hBf7eaVRcQutgIvdpnoxGqWyQDLX
         b5ye9NQ4994n1ZE6B6BtukmC8qjggruXTRHVA=
X-Forwarded-Encrypted: i=1; AL+hErGVSHP0X8rgTMk2yosAGg+DmgGOZuCFbgwT91ZtZWT1SgGqMtcdZ4AqY3KO7ztJI70s97tMX7tACAtsT6U=@vger.kernel.org
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr12357840eec.26.1794870461025;
        Mon, 16 Nov 2026 15:07:41 -0800 (PST)
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr12357825eec.26.1794870460396;
        Mon, 16 Nov 2026 15:07:40 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm36874961eec.29.2026.11.16.15.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:07:37 -0800 (PST)
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
Subject: Re: [PATCH v4 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Mon, 16 Nov 2026 15:07:36 -0800
Message-ID: <20261116230736.1490551-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-7-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com> <20261029212513.4126083-7-florian.fainelli@broadcom.com>
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

On Thu, 29 Oct 2026 14:25:13 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> Commit 77416ab35f57 ("ARM: dts: NSP: Disable AHCI controller for HR NSP
> boards") disabled AHCI after reports of boot hangs. Both SATA PHYs
> remain enabled, but the disabled controller leaves the eSATA ports
> unavailable.
> 
> With explicit IDM clock/reset setup and the corrected shared PHY
> register aperture in place, enable the controller on BCM958625HR.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
