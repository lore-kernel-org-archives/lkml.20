Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900023;
	b=vQRbY+2kmB+GEhtIdPWehJC0pD5ZeePilMjJ4huLcfDU59l0QbfEiE0ck/qvt/7QhL7x
	 ngMw4YkRarOPCUZ5BSpne3QHK7UkikFQfSuM832bUtjTUzujeVfssBEJqXbsVVLvVYCFH
	 NwUbVhGbcyl6xKOfDn+HKyd/ifv888hf7rIgKKNXTznx9UwygK4t1s5ifPT5F547QrEra
	 7BJGE+90bZj65tKqOr6HxDK9eJb2TZWgX0rsMczO+UPPJe7nNagMj8Sp/Yd/v4iFb2Pgd
	 JwTM52ES3qbNY2IMIxoZNZ6PW7w56S4XJ5J3GpWKzRZQkJy+e1eSHaQ9r6EfP//3t5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900023;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=zaFE8iTb8ZQzitBt5EqDvKEkChXKzQMc8ot83f0D0Wo=;
	b=qComPvczBqrx3HgHRIU2tpygIP/8haVWDony1Rb1So6LxCIcGN0OOkRZgtsBjjgoXeqy
	 CnHHpj4+XnLMr41AT8dVW7+6364X1D0BHGnT/7Qy+v1wUHmP6b1plYZZgjb1f29zexbeD
	 6lMAITLTQDqULooVDBZwW9KzDUBL/AvYJ5muOV6WUlkCZ331fvSgSDNz1eSiLWs05zDXh
	 LCRdyBMkpUqQobmtZC6LRU+XcfRg5zJrMuuNEu93RzyFMhVt3EpShACncJdvbVGYEsPUg
	 BGrbM8+w4coFPXGRT7hrzbQZv0Ived8jCuiNXccL8j4/bcx/D8mVpitPT82JCSHZTLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Op+CqBud;
	arc=none smtp.remote-ip=209.85.219.97
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C453606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C453606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Op+CqBud
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-91b8306b9f8so32101046d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900022; x=1794504822;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaFE8iTb8ZQzitBt5EqDvKEkChXKzQMc8ot83f0D0Wo=;
        b=rHgsbM6tRSi1qVnCIKJPaIwDb8k6OZAUR36AwL+0q3Rw/XQ3XgUbWyWGOOXEyUyZio
         OA9hEz2qTPGZBE/LFQ8SRzKJ0sEuyI1MVPV2P2Aibm13s2XcNL+gim+9sfApVYJ/QKCC
         fRsUNG2ZUg9YXVr8SEzthK1MTbInIJOqYc+2Wt5ZfgAejs67y1sdfTDVi8Xlo9r88Yzz
         m3bYhF+SkwVIg4bDXp95eJsuHgzd1ObU7McPIWsYRC87kGp45qRJNRqktyHboKGzZQX4
         0TIAs0dXSptJ2Z7mWtpD1oPe29rRcDsgpcVhL3LzhqRKz1Tmabpi4dHoGXxzJk7+EjEy
         +FPA==
X-Forwarded-Encrypted: i=1; AKwUvBxFPdxlt3BTMReojlFoVuK++VxI08pMkRBVwoOKQIRtll8foEniJyeFU6L8Dz/QQ2h1lGK7k16/ouRYVo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NDLb1SRpw2PR9NH5ING6Ur2waazEcNj9zmr7d4btg1hW2PgwW
	Ij7owTLDG51JQE91BqXXxKQnvD3s+6hLgwE0iHmRY6gHT+JbpyNPE4ZsGh7hKNpGjlTlXEisVD5
	vQo91UTc6ux19PuVUeTJXGB/Y72yKbem4HB7559F9GTPCrZMQDQvn+o+Wk6/HikHlBfNGY+wGKj
	8wpzy1LIhgDFxZBVeYxSCWPKdIYat522exgz7EQ9DB1ZMazduRmo4xPTVFY1WPizJ7pH9oKF81h
	/MQOsZSsnlGpYX3AAbHZi5peg==
X-Gm-Gg: AYBFou1nSyBAMD/EEwmU6aJDbQL6XSNp6oaDmVIgjwdK8gjty3NihK7QaHRHK+6eRYo
	5Z2Hf1w205xDz/2qnb/lQBAJ4631FGJ8qbiQrFl22SfWvJl2Az6gIoksdDcJ+wTz3wbI0Wmccai
	S8xEN10UEn8pbfpJ8P4L53ip8tP8u3d0pi1MttLQ0gRYTioOh3iHv3fOl84m4Yb9jMcoZ53pnPD
	e018s1O/UoaDnTd+uW5voaesNMMTN3Es4N2gAw/P1qnjYmVH5iO6vnI4k+7qFkjB0NIsq8+YzBQ
	pxZ7KVFacSpFH4FLSg9zkVV+KlX6MAjpbFRJkmsCunVk77+MwmWE/4c+UatvMWE8Wojz52Ar1Vw
	5F/e5oF4EeJw61ff/OMimkd80OF0AiQojosSkQJZgL7f9mJVxr/RFrXR2xGXEhfsTyjw3gc/G9m
	o4kDhMaVBGEO7hSwlVgi4KcQCpG4nTHKfZ+hARZpI=
X-Received: by 2002:a05:6214:3908:b0:91e:a3e4:55c3 with SMTP id 6a1803df08f44-91ea3e456b1mr14399226d6.37.1793900022009;
        Thu, 05 Nov 2026 09:33:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91ea69d32b2sm9516d6.22.2026.11.05.09.33.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:33:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso2132237a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793900020; x=1794504820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaFE8iTb8ZQzitBt5EqDvKEkChXKzQMc8ot83f0D0Wo=;
        b=Op+CqBudRC2BNL/CFbVEwAY44VtofBamITEhOFo9pE1wlKliFv+N3lwbx4l3MeqCp9
         jpPNvVStIYUEtLXxjk58n2c0zpI2vcVh7GJqhuGNsaan0NU5QKgDQY4T/uHN+tD/Y0jp
         Hwow7/qkT3nSd28UK/By/dFHX88m/jsLkTzgs=
X-Forwarded-Encrypted: i=1; AKwUvBxz9Ei/jmsSZyEbz1epQWGT8h+DzEmJH0EWAJnHyuku0+JeJ6bBPq1l4MT3cv1N5GvUf5XNhe6exDeqhpU=@vger.kernel.org
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c703 with SMTP id 98e67ed59e1d1-3ae896f8649mr15916790a91.19.1793900019898;
        Thu, 05 Nov 2026 09:33:39 -0800 (PST)
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c703 with SMTP id 98e67ed59e1d1-3ae896f8649mr15916774a91.19.1793900019449;
        Thu, 05 Nov 2026 09:33:39 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b328a04asm4597873a91.14.2026.11.05.09.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:33:38 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, Aditya Garg <aditya.garg@linux.dev>, Yossef Osman <Yossef.Osman@proton.me>
Date: Thu, 05 Nov 2026 18:33:34 +0100
Message-ID: <1a1acc5e9b0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261104151547.70333-2-dev@deq.rocks>
References: <20261104151547.70333-1-dev@deq.rocks>
 <20261104151547.70333-2-dev@deq.rocks>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 1/7] wifi: brcmfmac: match firmware capabilities as whole words
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 4 november 2026 16:15:51 schreef Andre Eikmeyer <dev@deq.rocks>:

> brcmf_feat_firmware_capabilities() looks for each capability with
> strnstr() in the space separated reply of the "cap" iovar, so a
> capability matches inside a longer one. The Apple firmware for the
> BCM4364 lists "hp2p" but not "p2p":
>
>  ... evt_ext lpr_scan bkoff_evt hp2p rng_reseed arpoe
>
> The driver still sets BRCMF_FEAT_P2P and advertises the P2P interface
> types. wpa_supplicant then creates a P2P device, which fails because
> the firmware rejects p2p_disc and p2p_da_override with
> BCME_UNSUPPORTED:

[...]

> Fixes: ec64241c9fd2 ("brcmfmac: obtain feature info using 'cap' firmware 
> command")
> Reported-by: Aditya Garg <aditya.garg@linux.dev>
> Closes: 
> https://lore.kernel.org/all/MA0P287MB021718EE92FC809CB2BB0F82B8BD2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM/
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Nearly identical patch was already accepted in the 4388 support series. 
Dropping this one.

Regards,
Arend

> ---
> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++----
> 1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
> index cc19e5e7ebf..b324eb53a69 100644
> ---


