Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917676;
	b=R2ZgMwB27n/bAgJlHqwPZwk4PCa4slMbuEUOrW0SrBIgS4acd5pyIEb8Jm8tut4TEsVD
	 TZWOjmvvghiIyPBj9gD6KeN1Exp+Pn9q7XW8319pojNFaBheXOQQ6WNAT0Oxl4zWRPshK
	 ON0uWGbBhE9QJe6drhn5Pl0nQQ7Ti5Ds1pwNvC66TfBL6jxNMtob1IU1n1MgqY9+ixRcd
	 +wHKeMuVOStmKA2ejDxd9kT61cCRpaYg7Z0TAbC7hhZYnEzr2qfn3qnpyaUZMrJTB5gOb
	 xrIpMzyNdf5Si9xYB1C4hoELZQN8ZP4JYCTO33vehMyzhQJJnK9HZFI6o9PGKSM7ldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917676;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=+MNym97pzJ7qmUoiMY8sbiPQF5RpntmoauuiPw8uCY4=;
	b=XXMonT6bpMUuekdl1WLaJMOrRkOqUNSyd+9nlUktdo1U9IowijA5YtI65+6twuq5etJ0
	 W7MIH1oRmftIh3vcNuf+ruuvyJ9Sr7HfmptW9vsTkKanuMWMplaE3JjGrNi+OlcOT+obd
	 pqPGJTkEMt/4nuJcjsDzrTnvOapEWZV0fiE+llztrXdWHPh0RNdcZEaTKb8Z5NkYl5RF1
	 3RwmXtq7O3iHmVOQbbENI5z3Bx+J7NaH4jsd2y4JU8htL+NtqZhNKZgkf97/iwWojcjyj
	 91DPMgPa2Ytu2A9SO7haeFuWE708cV+MbVTNSa7bfM12OONlgowpsxYBP+szt3r47Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E1eDnKkC;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D79606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E1eDnKkC
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2393874a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917675; x=1795522475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MNym97pzJ7qmUoiMY8sbiPQF5RpntmoauuiPw8uCY4=;
        b=kI/LuhRc26izzlcuaS2D7BTVdEIVLc5sXdtxQK2s2aECdT36/ttknlH9jZMcWuVos4
         dhUA2vJYbM5oYuH4dqK5LKEV14DBYEXWUeV0yvAQAVJLszstM5iwMLSHG+HkSF0CqIMm
         EneGBWyynve82uo/cEzUdGytMclCJaPlKR8I+g0iv/XYTIYL5FrkivrnIeIBsveYT4uB
         eD1L5Qx2R+k3mHnaH/cRCPA4JAiXfb+knAaDHTIcw7qpjZnGtnNQH7dAD9fkeS/O6E6l
         tXt2v+NQEN3MZzDmomJM44FpTqIrCiIKYviQvVeeW0Z5vVaByQUw82d4DOh72mkPm5y7
         dEvw==
X-Forwarded-Encrypted: i=1; AL+hErFzXHKCng2JXfSxrajlvdHVgUrjOJj4Q9r/8/SMqr5Hm1GF9m3ydi4tSj7iENGjLunECnVB5Q5+HO+JgRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uv46FHa1TiRVE5SIJtbROBErDZpwZZ5WpCPIHswTdnDwsPooU
	Cd+F51qP8mcGvGmbS5faNTe1bOwywUBPVT9aK0b1RgSM44CUT6sB+ONT3rsSbCZVvApwWHIh2Ll
	psK0wTOtI5BqeSJbHsDgxB9nqyq67/2KoIEnsJC2WqTEmImqai4iewdBS/5vy8eg7T8ctL4gpYq
	oh581TDssxj1HjyKvPXElkz9MKJmkAHdoPNfrGlDC4af4RqK5GE4Bt3FtV3NXPpvY/HR5P2/Z4S
	fT1RD1lWjHGnhK0DoYC83yM1g==
X-Gm-Gg: AZFdTZcVKa4KCDK87bUeWFdLCrI2eyv1wwLGlaaarsf+8HyVv4YHiCswkRxN23jzlRF
	pqHEEMibcb7neIGIYB1v80ugB9jVpQAm4BaInGClRSKm3ka5KMBt1Z28KVydksgIBqP0XGEGP5/
	70GG7SETnLt0sTz9XI/o2EJp8txyUTo9+XE23ovU0FCdbHTwk7SQ4zrzDF6xbUz/kfnEndl1yAF
	PpkPotTbk0hbJHtsDIfCE81hW8+6DItqwtmU6RFZ0mTvypJ+L7byy6tbyyvZ3qYjoWfjugAnWk3
	OjrLOuKtPjxOPIeZpZQxvlDfEqlh+KAnXL8Ybpksb1kEx9cnpaTfH7YAVkNzkooHNHObR9pgAVL
	dRPe81mJTgPuW5IDD79HapfCAH04oUQ5eHmCUQzcAxm0xa1h7+ajkJWsRgOovxUNEKlOYKZYTBT
	LWjRaaXuPxJW3x1cejYubsad6ottbCI5PBNRzxGOc=
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b1b0b531b1mr12783487a91.33.1794917675187;
        Tue, 17 Nov 2026 04:14:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abceb007sm1799234a91.4.2026.11.17.04.14.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:14:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210ec7cb34so3397566d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794917673; x=1795522473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MNym97pzJ7qmUoiMY8sbiPQF5RpntmoauuiPw8uCY4=;
        b=E1eDnKkCNDqhQ1RvloNRC35WS80Yh4MY9ly09Cefh23LwR/BaP4NwIxXr2VK3jUF/F
         ezOXgjHy+JkA8LONAX6jWs9HXsamQ8QOTZQffxL/ubGTtvbmVvzSVliVHF1RBiaeKAxO
         LX69ffJzhTnEjh1IRoNHh+yiPtUDd3xKTYmqY=
X-Forwarded-Encrypted: i=1; AL+hErGAUbkvAlGKWPm+gXRJVovBjzbqJFV0PbsBSsjCzxmeKHSM98EJlZjLVwv1zTQY16MMXzTLkjYNSyZviwk=@vger.kernel.org
X-Received: by 2002:a05:6214:3b85:b0:91e:a540:e60f with SMTP id 6a1803df08f44-91f242030ffmr231619026d6.21.1794917673075;
        Tue, 17 Nov 2026 04:14:33 -0800 (PST)
X-Received: by 2002:a05:6214:3b85:b0:91e:a540:e60f with SMTP id 6a1803df08f44-91f242030ffmr231618536d6.21.1794917672489;
        Tue, 17 Nov 2026 04:14:32 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d952fesm108043226d6.32.2026.11.17.04.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:14:31 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jeff Campbell <inca.jeff.campbell@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: enable 2.4 GHz VHT on BCM4366 before AP bring-up
Date: Tue, 17 Nov 2026 13:14:27 +0100
Message-ID: <20261117121427.3299125-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104170426.4129715-1-inca.jeff.campbell@gmail.com>
References: <20261104170426.4129715-1-inca.jeff.campbell@gmail.com>
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

On Wed,  4 Nov 2026 17:04:26 +0000, Jeff Campbell wrote:
> On BCM4366 firmware 10.28.2 (r769115) the 2.4 GHz radio defaults to
> vht_features 6: proprietary rates and 1024-QAM on, 2.4 GHz VHT off.
> brcmfmac never sets this iovar. As an AP the d11 PSM watchdog then fires
> repeatedly once a client passes traffic, the client disassociates and
> never completes DHCP.  This renders the radio unusable as an AP.

[...]

> Set bit 0, keeping the other bits, on the primary 2.4 GHz BSS of the
> 4366 family while the radio is still down. 5 GHz is left alone: it
> keeps 6 and is stable.  This stabilizes 2.4GHz AP and clients now
> associate, DHCP and pass traffic at normal levels.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)

> +	if (chip != BRCM_CC_4366_CHIP_ID && chip != BRCM_CC_43664_CHIP_ID &&
> +	    chip != BRCM_CC_43666_CHIP_ID)
> +		return;

Firmware 10.28.2 (r769115) is the version of both brcmfmac4366b-pcie.bin
and brcmfmac4366c-pcie.bin in linux-firmware, so the firmware is covered.
The radios are not: you tested the 43666 only (4366c image), while the
change also applies to the 4366 and the 43664. Please mention in the
commit message that the 4366 was not tested.

I ran this on a 43664 with the 4366c image. vht_features is 6 by default
there as well and the patch sets it to 7 when the AP starts. A phone
associates, gets DHCP, and the AP uses VHT rates (173 Mbit/s) on 2.4 GHz.
What I could not reproduce is the failure without the patch: the AP
started a minute after boot, on channel 6 at 20 MHz, ran 60 seconds of
iperf3 in each direction with the stock driver and showed no PSM watchdog
in the firmware console and no firmware halt. Which client and traffic
pattern trigger the watchdog for you? Please add that to the commit
message.

Also, bit 0 is the 2.4 GHz VHT enable. The firmware builds its own
beacon from its settings and brcmfmac only parses a few IEs of the beacon
that hostapd provides, so with this change the AP advertises VHT on
2.4 GHz even if hostapd is configured without VHT. Please say so in the
commit message. If that is not acceptable, start_ap() already parses the
beacon IEs, so bit 0 could be set only when hostapd provided a VHT
Capabilities IE. That leaves a non-VHT AP at the values you found
unstable, which would then need a different workaround.

[...]

Nit: "2.4GHz" should be "2.4 GHz" in the commit message.

Regards,
Arend
