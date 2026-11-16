Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861454;
	b=DO4C8j5+gpbgW7fw2xcdMBiG6nBmCyyRiBozcNzTQC3kb75Ncmjh56IxchCLBCU8SCZB
	 ecvT8nApNHllIzrY/UWCBmiAnjWFsz9doM/ehTM7Wt0wZ+BzlK7IBd8e2/qEOaM8PXgSE
	 rj4pYLPf5j+1kjrAhfw2WZXypIycN1ijKZFQ4UgKerL9kx5/AfW77TRNQL/gQG5X/nzWU
	 mYFHwwxT8x51SaNXc3vH7zIByemzlDX31rYEE13urlrdfR9oGJPnC/Ys7+IylBLnYzO7l
	 RBP1Pw3AfYGCzD3p2p5ANFWl3LFvHRUHRRXCQPSILuRj9ssZOJbz7XvUW/3a6cLbXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861454;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Ur1Ul2Xf/shlppt5zC3CiqKndxvZl78A8xthMxJt+3U=;
	b=WrwXzeWuoUztk02GOLVKe5pyPX2emuzbm4Tw2jhwTFRd7+UMflf5307WcA5PV7YtcN8t
	 PNPh1V/PK9JLXBi6tvXR9t/0KyVmc2wqu+vPJgVYD46B8gYsgbgNctjF3+7IvZK6upVNj
	 cJBw9lhcHdZdP1zWS1vwwsBoIZ0eNanDuKue2KgL4zk7XTWxHPf1yZMMa4FsmWgVywaOP
	 Pdg6IuTplPVWY99B5JFfz92km7wG+CvpaHjjV2GLsXbAHjw41z63atDIdkN80NOuVQ+63
	 9aiHK46WWZy5tHVbvhCjvjXVXkrDRiHGKA3rjFi7nB7lVj50l4ZkqY1hPLJ/wMzSybw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="CqKg/qhX";
	arc=none smtp.remote-ip=209.85.217.100
Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com [209.85.217.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DF2606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DF2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CqKg/qhX
Received: by mail-vs1-f100.google.com with SMTP id ada2fe7eead31-7d2e1abf3eeso194277137.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861453; x=1795466253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ur1Ul2Xf/shlppt5zC3CiqKndxvZl78A8xthMxJt+3U=;
        b=y/PvSoL7IsdhsDJ1ltNl47ZBZWV+HX4fvBEsDeLWsjwSxGgfmCfbRgGTKSGRCjq4TY
         LN8NubnN3i85O61z3dvZ819+JF91ZayVb2bRrF34ia+TUiZ8FKcsj95+It5RNu3RjO4/
         3Ju90zaZFaEbHYaQISjmlk59inUV+TjN+QF6azqMklWERX3DF7cHSq9S1Wz+4vyfly4w
         VrsybDrsQwjxkT6ArmmVmQDUs80jZ14KvQfzQoKDnN4xjSO5UAmFEVgNVFimH8ZpBYMC
         vQYKTXjMPeQQGly1eSwrwjNviirEBo9eN4CJXTosq+i47Y+VCOCl3ZLOD4ooMDgwb3gt
         nbyg==
X-Forwarded-Encrypted: i=1; AL+hErEDFbW8otKEHIHqpgWzt3jVf14KwolIaWkDjZCOiJySS5fLTyPfzl6jHt6kzRXP0fgicg7SKxziLTgkTYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k3tGtO8FzygBa6NXeapbW3hpJyVlU8qX/6wdks/c2xdLCqoRu
	0R2eGpu1vqe1wxi9IVIu7ax34uzwVE+UvLiVay7w4ad3k8aKUBk1yVkt1v+5riloXFOgT6VGA4/
	cjNxP06G5Zb0eXyuf/4yZrxm8YjNfkK3ojAaKyVoAIMAZNRPcVcOSCaegzunl77oK3JHRC8EK+V
	8NYlpZIf2c6++jzHrGr8cMDcjoPTVUHEcCWhyc4/qhpjabXl0xJiyfB7+6j2rz5MBSSDnnon1lK
	Sd7y9IOJIyPPfahQIjopWR+mQ==
X-Gm-Gg: AYBFou2sRtKWencmT/O7HCdZUD4H8wZnLrXQyk3WlQEHsG5viF+s2OrZDaUZF2yCK1w
	G9KylXo9urPx/Qai2NB5Zgj0LrpOy8Rx6lsR/qC0RK2Wz2QOsn38eGjp5fd3Z/MM/4QPFts6gOT
	MhPhwo9Ugk1BfkW62Le4jjvRYQki7LgAO6Ht0S6Z58hvvipA2MvIVm1PPBDjiMbRvmXaU+WkJEU
	99wKVaZThvr2MADyD22bWKw0UohwaBbyGE5us38CKBOaq6q4xHRShYXqBC1hOhYZ7g4Gy83kdjt
	9f1mzySM8Nrzb5fVf5IWz89XCq5/c1AqbwmB+94D3N7lX0sPhZYp9LmUo5SBlqH1yJnIZHC4T2A
	4hUAQRO6pfg61eUU824RDkTTvkYxWyuj1vNHOdePfODUSVtFbHqgBsDfaufPZhRIZ6lvmKN3h/K
	sI81TbA20YxqDdLFVAosRNgolNCZB5E6GHpvQP9wE=
X-Received: by 2002:a05:6102:509f:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7d69f61df18mr227257137.4.1794861453058;
        Mon, 16 Nov 2026 12:37:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e337a2e93sm96661241.3.2026.11.16.12.37.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so187692eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861452; x=1795466252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ur1Ul2Xf/shlppt5zC3CiqKndxvZl78A8xthMxJt+3U=;
        b=CqKg/qhXQEIpOo+V3be8bAEE9WrJWHT2iEpICW8UKKs8EH5fxhAH+F/anov47GR5lX
         J2CtFAuPOqy2LmtGCD2zLAkUgKU6aPYj2xKhpckNTo79CsHK193PNuk1nysfDf1ZccTO
         4g8a6qqPdQHAePNQ3ApQ8IvzLpqRZEycGvCq8=
X-Forwarded-Encrypted: i=1; AL+hErGSB1KOBLhk5pkg76L8Xm60APbTL9FqWG1uxsyLXBVYRaWCfwtaVPk03T682Nb+rWmRAY0AI1QfoEnXz+4=@vger.kernel.org
X-Received: by 2002:a05:7301:3a91:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3810cd4e36bmr522306eec.11.1794861451733;
        Mon, 16 Nov 2026 12:37:31 -0800 (PST)
X-Received: by 2002:a05:7301:3a91:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3810cd4e36bmr522268eec.11.1794861450737;
        Mon, 16 Nov 2026 12:37:30 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm1965764eec.24.2026.11.16.12.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:37:29 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: leave the AP 4-way handshake to the host on Apple chips
Date: Mon, 16 Nov 2026 21:37:19 +0100
Message-ID: <20261116203719.281605-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151629.70790-1-dev@deq.rocks>
References: <20261104151629.70790-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:29 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK. hostapd and wpa_supplicant
> then pass the PSK to the driver and leave the AP side of the 4-way
> handshake to the firmware. On the BCM4364 that handshake never
> completes.
>
> [...]
>
> Clear BRCMF_FEAT_FWAUTH on the chips in Apple's T2 Macs, so the host
> runs the handshake.

[...]

> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

> @@ -318,6 +318,20 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
>  					BIT(BRCMF_FEAT_WOWL_GTK);
>  		}
>  	}
> +	/* The Apple firmware for these chips lists "idauth", but in AP mode
> +	 * its authenticator never completes the 4-way handshake and the
> +	 * station is dropped after about 8 s. Leave the handshake to the host.
> +	 */
> +	switch (drvr->bus_if->chip) {
> +	case BRCM_CC_4355_CHIP_ID:
> +	case BRCM_CC_4364_CHIP_ID:
> +	case BRCM_CC_4377_CHIP_ID:
> +		ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_FWAUTH);
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	/* MBSS does not work for all chips */
>  	switch (drvr->bus_if->chip) {

The commit message and the test report only cover BCM4364 and BCM4377,
but the code also clears FWAUTH for BCM4355. Where does that come from?
Was it tested, and is BCM4355 found in T2 Macs? If not, please drop it
or justify it.

The chip ID check has the same problem as in the ARP/ND offload patch [1]:
the issue is described as specific to the Apple firmware, but the quirk
applies to every BCM4355, BCM4364 and BCM4377, and those users would lose
offloaded AP PSK. Please restrict it as suggested there.

Note that BRCMF_FEAT_FWAUTH is required for NL80211_EXT_FEATURE_SAE_OFFLOAD_AP
in brcmf_setup_wiphy(). Please mention in the commit message whether
that is affected on these chips (i.e. whether the firmware offers "sae"
at all) or confirm it is intentionally dropped too.

Have you looked at the actual root cause (e.g. missing/incorrect
"idauth" related iovars such as setting the PMK or wsec_info for AP on
this firmware)? If the offload is never usable on these firmwares, say
so in the commit message with reference to the firmware version(s)
checked.

[...]

Minor: please add the target tree to the subject (wifibot series_format
warning).

[1] https://lore.kernel.org/all/20261104151620.70671-1-dev@deq.rocks/

Regards,
Arend
