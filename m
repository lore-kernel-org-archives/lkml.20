Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861449;
	b=bA7YkxqM2eKvRsRaT6l+d9Xo2x2tjGs7DC+fif8vPE9bS4qGKeui7MA1mziw2kaTmNUM
	 dgZBViz7ZiU/YHBfFgsqjReFyXUTXKaukwayqfH7+oTAXUMrpywuahflHTC1YyzqIhNdA
	 Bn+UuN58Q7rOoQu2raN/i9eVenP5TcrJyRDQ5kuQ991tyeTfKZYczAJZY8iJEhwaOZQRP
	 K+9MURII10wmt9f0PWi0+zQriCJatJVonslxKTfVXJlXMmxb41/o7dEGUEfnE5hB38kN4
	 DMR1nZ1hUclQbviNZQDH9dluSD1v7gwsC6JiEgkwvephgm8vAhMxstfwvNMcmh0FADA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861449;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YVbblNjtTs13Z97PdCw2KBjDlkIPD+IChpKyCjLOTc8=;
	b=nbnxDC5VtT0pk6kMwfGQt1aYuo6zqwm2MTOna9VlUyr0nWxSS2KjNA0K8MDyGVUY02g9
	 kr7peuESgaKYc/6TTQf+BND+34Y1Jycoy7WoUKc7FRNnKPpxdnjPcXrFkTz3GQ4tDflo+
	 Tk28KtHB1giLGspUG7cLjriC8NUYxxrG1L1VbsomlZEIKtkqgRgDhTSUYOdisYW3Adm8n
	 T8TtejWeK990VO7JdN2ifJ3btYHFPA92pGE1GhxnvwzuODzBjR8e/swL3R5ulAL+JR+k3
	 CGbSiL1Y5K76lgclwapdvguMi4JRoBQr5J5sY/u0V2hkaAl4+JD3J7rsWCide5oo8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XjVceYwr;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB13606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB13606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XjVceYwr
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso3767451a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:37:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861448; x=1795466248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVbblNjtTs13Z97PdCw2KBjDlkIPD+IChpKyCjLOTc8=;
        b=kXWPfVR1nnRf8T0udi2PC/pN+fGzppUzvr1VBQ2Ig6Rw+z6PEwoD5ZHYiqO06Xr34A
         /BJE4lu0WZUZCg3HkQGFvQCVrS316vSsLI8RbubbpzFdk6NWZBTgbuzHgFy0U1yy+3iu
         YDJ1jgF3bkv8AdpRjzSs3+9ZRE1ORmA24y3QY/YNoP8OBJzdpohhITAAforUhp50hzFS
         X3a9unwl57zPQ0/WLKbd1H9q5VoRRV4nYi3eyqlkf47h/IRKdhW0fokjOC7QLOQCzLCk
         LexQ8s31fLNLhOLHSqLvolUiD9yfOE73AaiVtKmeIqOFhC8dxza5fv/ODSQizYGoqZk5
         0G5A==
X-Forwarded-Encrypted: i=1; AL+hErF9pLg4Ml2JW1fSrsb7ss8YjRgm1+zPwVhJPNuFZk0biUzGWYWdmJp9K/RfILy0P8wXn/xJmNT0+rGPPhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l1O401OU7bv876EBJ9JOCGA/X2V8+MPpr8NrTjYFjEs+kC8oZ
	KkUrUrhYD18/OlqWHqA4utYiDwnIi04eS1W+eOjE4KHQgTFSfTg3FBUb/BT9uxRfubRlaWnSDNX
	yTA7nDGWZsecNnm9hj9YMiLo+M+78WOXpg1xHxir6OqDFS/J/FNunYN1aVzPwkk3OGKsAv2wpv9
	T1Gy07P4gOTv7NF9Qp80EP0rouMCXVDdATTVeozc7dfldVjglD2b3q1Rw51DCQa5xKIZGwqQeRS
	OI7sx7uXtUv4l9eI8cf7pn+zg==
X-Gm-Gg: AZFdTZeKTa7CvWWASE9KQJGFKH04F2NEHgQTRIbgliEdKumbeIHFDooFN1KXLNo6F6N
	s0nq85Kl8Fh5vdF1DIKVt5AK25YrocuXbCEqjyO1u2Vaa/XFoPDkmkEQCWiLBZeR0qubQiLzlM4
	wDcI/OE1J/LQLGjqKykAuvKyM+2HUCtnGyU1iu3uwl/M2Rjobb98uJr8IW510hpRbFaR/LaWGbJ
	AevU74PBcqJLy8Bov5QkqLRSUF1XfK8rbjWvW7t1yq+XO9rQeAX6maB9qYc+okzjQuG4WNtgLXI
	Gssje9mPtKOR8pGxyWU9RIH88FYSyLCXWBzaT6861zEo3/tXHcz3Prh0Eox6ns/279jUDYtV7wI
	1INhJFobUX3FdIhDTnqDl1UUsJQNh9s8pnmkJT6CCYB5Hy5SGgLZKac+3R+BBkQLykU6+P6se1j
	qyzNEgDJ3PLLpI2y7gouJ5Yd1GRXnN7Bb/9zX9LcM=
X-Received: by 2002:a17:90b:2fce:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b1b0b93822mr11997909a91.29.1794861447884;
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abe1c098sm345084a91.5.2026.11.16.12.37.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38131260a5dso306271eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861446; x=1795466246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVbblNjtTs13Z97PdCw2KBjDlkIPD+IChpKyCjLOTc8=;
        b=XjVceYwrfAgpEEB+p0FTO/pKtIYXh4lgnCCw9NOd1uFD4l5nuY6Cir6ez9JdKQZ0Gn
         8X2ZvAC41KvSL+JdnuXTXFYdUwvWRcFUgfeXL293dkhj+5lKeSBb3ydIezKtkKHG5wIl
         0VZawNkspPmJmd/+hBu7Nn5wVsRFXOr8Qwl5c=
X-Forwarded-Encrypted: i=1; AL+hErF//X1DNEpDG1LhDHgS0tCGU4N2DPQhf0Vxp38caljvJEVZkj1hLoi+/apiAXZ2ctYe45su8D7Afd30W0s=@vger.kernel.org
X-Received: by 2002:a05:7300:d589:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-37966387cbemr12214379eec.7.1794861445657;
        Mon, 16 Nov 2026 12:37:25 -0800 (PST)
X-Received: by 2002:a05:7300:d589:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-37966387cbemr12214351eec.7.1794861444883;
        Mon, 16 Nov 2026 12:37:24 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm1965764eec.24.2026.11.16.12.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:37:24 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: keep ARP and ND offload off on the BCM4364
Date: Mon, 16 Nov 2026 21:37:17 +0100
Message-ID: <20261116203719.281605-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151620.70671-1-dev@deq.rocks>
References: <20261104151620.70671-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:20 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> brcmfmac enables the firmware's ARP and IPv6 ND offload (ndoe) whenever
> the interface is up and not promiscuous. On the Apple firmware for the
> BCM4364, ndoe makes IPv6 downloads collapse.

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/core.c    | 10 ++++++++++
>  1 file changed, 10 insertions(+)

> @@ -103,6 +104,15 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
>  		return;
>  	}
>
> +	/* With ND offload on while awake, the Apple firmware for the BCM4364
> +	 * makes IPv6 downloads drop to low rates. macOS runs ARP and ND
> +	 * offload only in sleep, keep both off on this chip.
> +	 */
> +	if (enable && ifp->drvr->bus_if->chip == BRCM_CC_4364_CHIP_ID) {
> +		brcmf_dbg(TRACE, "Skip ARP/ND offload enable on BCM4364\n");
> +		enable = false;
> +	}
> +
>  	if (enable)
>  		mode = BRCMF_ARP_OL_AGENT | BRCMF_ARP_OL_PEER_AUTO_REPLY;
>  	else

A few comments:

1) The measurements only implicate ndoe. Do you have data showing arpoe
also needs to be off? Otherwise please limit this to ND offload.

2) The commit message says this is an issue of the Apple firmware, but the
check is on the chip ID only. The same chip IDs are also used with other
firmware builds and boards (WCC/non-Apple), which would lose the feature
needlessly. Please restrict the quirk to the affected platform, e.g. with
the Apple board type (settings->board_type) or a per-firmware quirk, or
move it to the vendor feat_attach callback instead of a chip check in
this helper. The same applies to the other chip ID quirks of this batch
(txbf and FWAUTH).

3) This looks like a bug fix. Please add a Fixes: tag and Cc: stable (as
Aditya suggested), and mark the target tree in the subject.

[...]

Regards,
Arend
