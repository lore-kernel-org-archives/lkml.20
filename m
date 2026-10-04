Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C5A3B47D5
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116915; cv=none; b=RLWDfuJhwWP9ikuxsudhSVJIlkd65ZVw7eANjeHGE/05aVwyoZM/wtTNBrPKmlYjoPiEHskBotx1pM8svAPje7Fn762ScS2QRokuWrTAYu2+fW/ujdDoVi7qmzYk+z0VwTNLnigE40UScZyVuHenUhWxAT8RAnqRw14KZGkarNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116915; c=relaxed/simple;
	bh=f2x68Pd7As1GqZKJQOjAKYNZhM/BwR7nOPBdxDi+i8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXJUiDxtXC1WGWm6IfFA0EaOKNluLK4azgfcRM0PUtaqWJEQqdVlhB6H+DaIwRfh++ukbKtOG6Qou34W30/qP5fCrk2Z7VzQ76rjh5u0DHkLHMzYXLOlbcYLZbQNPhpbwsAWhJampJdc3SPZ00mxTs/COO+vbaBvxfl97f1itoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=X1oHkXKS; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="X1oHkXKS"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-67583c777abso460492d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116913; x=1791721713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vxCHe50qu0ZSP0ZUfgyqzcneNtbGphUCpsLuMQGyLs=;
        b=FZpyAM2B4B63xss3L45SuqA2eTJtNgfpSyRWe6KO/kR+FJ9segP36FVrmew6tO/5bw
         wikZkTGzRUjdV87aRzkbiUEen5zwwFqgSUiyDBknJpo1j0X/I1IOR9qci1pHCyf1m6F8
         ohZja+lM4+bnolUJoHxjqnv972giCVU+jsGc8jShQpBxLItVw0yxWeNEXQlra50raodI
         ME3BCTJDccYqcPKg5JILdBtBijjX9VrnVnuJkYtw+mVoVeX70UUjZPZgi2vhQDc7gLbH
         iv7a+UgHHQ2WvqoRguH+XZmd1kts1/7btwFVQj0lmcct178D7Ne4GEzC3DQhoTLdiiR6
         uS3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxr6h6JWBDdsiTG1Qt2oXpOB8jjstb0zkaoqn16VBDm5ZPtrQS+TtLilFiRRenQnU6dqsqLcsuzq0bc4LQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWlX9oDMBn5zAnOL7SgZhEB29nesagGAnrBmcRY13u35eKykth
	OGvcHWhULsfW897i6cKYWRywWOjaNDWDdXtwPN0dnr6Ez+1kOo6O0UqPH7Psrk3YZ7MwJIbYIJi
	Pz5ZQzzswVhzTRbb6sESR0Jq/4CQZgt3BA39fEO5dzFzxRznrhqUFVJ12OQY2QzkD3ZpJFrP6d5
	agSFKdE68holEy4WQ0T2CkIKmMq6HpIPEBZjmeFSTQJg2b3k1IsQhaM8h4XTygx5ohsiuttsKE+
	Off24zQZj5vdaZy/iMkqZJ/oA==
X-Gm-Gg: AYBFou37roaVgw0Ct7iDSFiTlE3ALahttswH6GlPeqvpRnixZz+kYcDPCrykCvKDRf3
	Q5XKJZx/UKIhoxjD6lX0wiLFSAbLf1zZEMSKPjzdRjeGdoR1P7Id+xzqVvgsKXh89q9jC6Jk+EF
	zUfAN9SpSmVEdQhtPhjs7nPXeDEdxU8rMBfVE2xbFtCPq97fKrtRIQjFCbyuMJPfsDpCvtvHlz0
	CfOKT0yFvG5od4t4+ooOz5DKFRhEzCAGTX24UGa97EzOJxEhRk918pGjYdzcxUeWLPmGLs0F1MD
	ylmh7bbtnWaAjz4DQ84BfIiF5xxmJ7cLD6nE1obABFM78nKNDXfF5EfQ9pnHdmo8pzfXT5VNgdl
	qGbmO3Xd2j+U+hYdmIu3oymmqlaD/8wAh12j20YaNkqozzhOhfrcfXx8JaG4W61Ku8FYqSqrl+T
	HDcTqKdWe5AucpWlA1QpfHhYYdF4MTth7FJncXBMB+ig==
X-Received: by 2002:a05:690e:4854:20b0:672:e21d:30af with SMTP id 956f58d0204a3-677abe93b87mr2165519d50.5.1791116913325;
        Sun, 04 Oct 2026 05:28:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-677c1ae9885sm770892d50.5.2026.10.04.05.28.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:28:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34e676375d9so975854eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791116911; x=1791721711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5vxCHe50qu0ZSP0ZUfgyqzcneNtbGphUCpsLuMQGyLs=;
        b=X1oHkXKSLckgpGA55a2xY9GUl1OHSH8mE1S2DahxzNLba4xIA2XlIkaIFY7bC/nAhv
         wSkl3xy/mptMU6tLDOfrU1MvUoZbuTxLdwXE86/I3gwpmE+4xSOWQZVtiDq5AL6/OCV2
         YugwicfaVV3sTlN+VLTVnYwK+CrJXoqojEsAc=
X-Forwarded-Encrypted: i=1; AKwUvBzwm+23EnyHfWCGGYHLjEooysmVBLd0mAIEHG74XTrAHYf2Odz7miZiCqNK8U8MZNjNvtwGnJ/hJVkCQbs=@vger.kernel.org
X-Received: by 2002:a05:7300:d08a:b0:339:851c:4c1 with SMTP id 5a478bee46e88-34db6bfe0e0mr12512303eec.18.1791116910764;
        Sun, 04 Oct 2026 05:28:30 -0700 (PDT)
X-Received: by 2002:a05:7300:d08a:b0:339:851c:4c1 with SMTP id 5a478bee46e88-34db6bfe0e0mr12512267eec.18.1791116910074;
        Sun, 04 Oct 2026 05:28:30 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351271847fbsm7734182eec.15.2026.10.04.05.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:28:29 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Aditya Garg <gargaditya08@live.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: brcmfmac: handle missing D3 ACK on BCM4377 T2 Macs
Date: Sun,  4 Oct 2026 05:28:24 -0700
Message-ID: <20261004122824.1390579-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001085308.1688049-1-dev@deq.rocks>
References: <20261001085308.1688049-1-dev@deq.rocks>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 1 Oct 2026 10:53:08 +0200, Andre Eikmeyer wrote:
> BCM4377 on the affected T2 Macs does not acknowledge HOST_D3_INFORM.
> The current PCIe suspend callback treats this as fatal and aborts system
> suspend.
> 
> When this happens on BCM4377, mask the mailbox interrupt, preserve the
> bus-down state, and let generic PCI/ACPI suspend proceed. On resume the
> existing recovery path tears down and probes the device again instead of
> relying on a D0 mailbox transaction.
> 
> Tested-on: MacBookAir9,1, MacBookPro15,4, MacBookPro16,3
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks for the patch. However, an earlier patch from Sebastian Reichel
already addresses this issue generically: "[wireless-next,v2] wifi: brcmfmac:
Improve D3 substate entering timeout handling" [1].

That patch makes the D3 ACK timeout non-fatal whenever Wake-on-WLAN is not
enabled, which covers BCM4377 as well and avoids the need for chip-specific
workarounds. I have accepted Sebastian's patch, so this one is superseded.

[1] https://lore.kernel.org/linux-wireless/20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com/

Regards,
Arend
