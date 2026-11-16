Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861452;
	b=JkawQzFS293AikVV4Odn0GA5/4TUO4wOCQYBXyhzEHJRDdaRuSFrPk2sWdrvC0dxzi+L
	 TXbtpZhQjofbPqnvK57Ac59Ok+2cJHUzozW4I4zSQPjdz8Zbh45x9AVtavRq2DD6tUsrn
	 9rz86GSLivAMGY2c6LFkwSwS6URBgyZ30QIdhJDFxgaA0oCXGdfV2QsI23803DVucLsrg
	 E7xh77xTrafs+Mcb73gZdVqtSYa1nr8P///4UjQooTOts3NEHS8NIry0DjpB42Z6WK640
	 c1PM52kQAXVonQiH3w4Dt1YYizRLrhIfxaiipLOrANdLwupWNZT9IFAjwpc/2WbKSEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861452;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VcYLEFTuS/CxISuzLJytuhqoKhiwpr1cSbsDlYOThBI=;
	b=RSMsVe/yKCMJW1CKrpOSRL8Hq3woe5vIGI7n+CQiKJg1GrKQ4sQX0RboyoJAJShGIfZf
	 gcA91+pfgL61HmToOM8kQ92OSS0As/PWrToGVtLxesDoz2TIPwNbvcrvRkdkPTGHqNK1n
	 ZUvr40MQryCjlzEtuWPWm/1/sSd4pOCK5CITD6cxdEPQszIwbb3uZbXsPTiTXbch380/y
	 zLqF+ahUkFRzzBTL2jAPPwdvLWftzdnIFo1yfaq6S3fjDPxTvKJweebq+xN65G37uP/I3
	 4lrQbD3qWiI0y1EBe8r3nNEX7DM2EvbbQQlcLxeWmV7ROOH2o311DHP9sZgLYVno4Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OqIUbSDy;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15867606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15867606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OqIUbSDy
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1553806a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861450; x=1795466250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcYLEFTuS/CxISuzLJytuhqoKhiwpr1cSbsDlYOThBI=;
        b=hGqxQ6g8yNx7pseOzT85VoY/oFaalnTub8fQpVjlGSYjn8pcGGADWtCnpXRHVlRVXU
         4SozMKa1kV/11GG3mTJ49h5ll/YrHHHthNjSstOTCYAGfTK8ltXpHWV2zkORziCes9Aa
         RV09T0gQOg3jrjuazBtadCS9jLiqqfNc8IN4XplPXp8HPj3L3C97yWz3/XVwXIEErUMY
         yipNxHS1ymfHSM6mSgZpRvi1kVO/V8GZMBfIXhmWJDxU80uq0TGwA/EEtGpARZtD/Hhx
         8Vc2B4nm7iUV9ofd39MfeVRHaaJJ3EoxGI9/hhKAwKtwy4CFYUvW7dZ4gNJ6/BSEDSeY
         JXDg==
X-Forwarded-Encrypted: i=1; AL+hErGine/Q0UAWxlSbLY8RPIf9w7G6zPZa1KMhkyaodNynRIRSDZyQ5rz2hrp5YLzO4Vijoq7qPQ1IGfb0lIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KAr3ZbDxRrQBtT3OOTL9fvty7GXHx5i/zxrEL4q8BXhZcxtbZ
	TBJB063sIXVXLtEfOxhYZCPikeCFGj9uVdKckTc4J441dvyDYzjFoGcUSWiMhKOAkVOcFhIlgbK
	kCBe4ovc+QNGF51LnG8yXj32Zmb8OqkQSLNls4Q+7TOVstb2jnUv5tbgkWCSQ/uhIy/wk/Z1fYD
	7y42LLP7PCN/mLOafx+SJLuklIwv9CE0oDSlRKC53UtcHjj2AaxEPLn/4l+euOPuFGnjBCozul1
	lyKciu0R8ES41/AOGQQKWE=
X-Gm-Gg: AZFdTZdzcLbs8DfZMHyXfx/Sa+Y9RTNJFqxZVOPENNozB4+SC0NtDwwXUZXwfKofEo5
	zOU8/cnaVpWyFqqIKLC0KW/+tONk0pi7ibFKoGAy8iAK5baHLvGk+v2hx8JxMARrkrMwCChkfK6
	ClHQlUTtegSzGrMnILAwTjVeOLcfpg1F4E65QTAPmbQzWWt6rLB4ZgHrFay4+UgBQdOaYBdkT3O
	SSM1hKSpRvy7uvaO8sos1RbwgW1YpMsxHFrSpugJuRb5OnKD1+tMuuVLh7qJZxc7kkciP9tqDBb
	4R8gnGvV/XAcMkp5Fj8uG06uLCJZYhGDeQXQ66Cd/B0dp4xihLeDEKaeaZM8hrQU9PV2KsaBG43
	6ebTGc2fMIcYFacp3/Iuzf8gqJ2L8pERgm9onJ05llHPMzWCbV4Mcjbs4SwwiEXOqumCfignWSy
	mZGBS9gf4dyC1e8kr4VzCKpV4f/VUDXyNmJMXpi60Yzg==
X-Received: by 2002:a17:90a:c88b:b0:3ac:7449:40b4 with SMTP id 98e67ed59e1d1-3b1b0b5316cmr11695222a91.45.1794861450205;
        Mon, 16 Nov 2026 12:37:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abf029a5sm342249a91.5.2026.11.16.12.37.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so4674331eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861448; x=1795466248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VcYLEFTuS/CxISuzLJytuhqoKhiwpr1cSbsDlYOThBI=;
        b=OqIUbSDyZQzymQHyJc7bKAKD7Fc0+lSvNlJA9b2O9kkYg0Bi0Om5VN1Ousafylr1ze
         +s5d9I1pIafF2+Zko7cxJItGvWgxg3QlLBAC1UPhSUVDfYoe4wKIGkog4765DeqLDpTv
         V7N8TE6IC/6yM8KQEf3TwcsP5yKZC1gbNvaDA=
X-Forwarded-Encrypted: i=1; AL+hErEi9nwZIkKhTa6nO40t1zApEk1KWZbV6Cpr7LSpmsYcKiMuPGIfyS5t4If+9qZxbqcggt3ZH3LUbB96e6c=@vger.kernel.org
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr12797257eec.8.1794861448382;
        Mon, 16 Nov 2026 12:37:28 -0800 (PST)
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr12797223eec.8.1794861447696;
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm1965764eec.24.2026.11.16.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: disable TX beamforming on BCM4364
Date: Mon, 16 Nov 2026 21:37:18 +0100
Message-ID: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151623.70695-1-dev@deq.rocks>
References: <20261104151623.70695-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:23 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With "txbf" enabled, the BCM4364 firmware (9.30.514.0.32.5.94, as shipped
> by Apple for the MacBookPro15,1) transmits a single beamformed spatial
> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP. With "txbf"
> cleared it picks two streams (VHT MCS9 NSS2) on its own. The firmware
> enables "txbf" by default, so the driver has to clear it.
>
> [...]
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

[...]

> @@ -450,8 +451,12 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
>  		goto done;
>  	}
>
> -	/* Enable tx beamforming, errors can be ignored (not supported) */
> -	(void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
> +	/* Enable tx beamforming, errors can be ignored (not supported).
> +	 * BCM4364 firmware enables it by default and then transmits a single
> +	 * beamformed stream instead of two, halving its uplink throughput.
> +	 */
> +	(void)brcmf_fil_iovar_int_set(ifp, "txbf",
> +				      drvr->bus_if->chip != BRCM_CC_4364_CHIP_ID);
>  done:
>  	return err;
>  }

The chip ID check has the same problem as in the ARP/ND offload patch [1]:
the issue is described as specific to the firmware shipped by Apple
(9.30.514.0.32.5.94), but the quirk applies to every BCM4364. Please
restrict it as suggested there.

Also, the comment says "Enable tx beamforming" while the code now
conditionally disables it. Please make the code self-explanatory, e.g. a
local variable or an explicit if (chip == BRCM_CC_4364_CHIP_ID) with the
txbf value spelled out, instead of passing a bool expression as the
iovar value.

Minor: typo "refression" in the commit message, and the subject lacks
the target tree (wireless-next) which wifibot flagged.

Since this is a throughput quirk (not a fix) I would also like to know
whether TX beamforming is functional at all on the BCM4364 or just
mis-selected by rate control, so the commit message can state the actual
root cause.

[1] https://lore.kernel.org/all/20261104151620.70671-1-dev@deq.rocks/

Regards,
Arend
