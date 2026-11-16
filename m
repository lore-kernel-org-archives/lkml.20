Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852561;
	b=oFUHYfZybCPiJVe9olu8CLdxlvOl8Y4slB4/a/NHUmO8rof0ffUNiJ5bxRra6E4lkp+L
	 4GareuPGgQUAfPayC/P5znrijWMfy6JTqc/SLkDrKUSalpJWoasgFBgUNYXahQPyXH+TW
	 wfGV//VpFBWcbKlX/EwiHUiWf8OyZcXGooNOkpBjB77lMd+nngXLCEb+2t5UImvnc2Ndl
	 JKQB2eEGRr/zAPbYxd0rqTvUNl5K3VASzX3tRGxnBbkbwgro3yHdSLhZpIBmlgTs1IDQh
	 Cdbh0+Ip22g1JdE7h9rWnlb/SU+VW7XOfieFcPypP881JdhfEsE3ho4788o0nE7c71A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=okvp8C0zuSE2GrsT9KtMaCBqr1Zkfu7oGXcl3aeW/jw=;
	b=LZHFe39Hi2ZGG/yjmnV+hnXVqmHpADDHAp87GBHPtZXTM7gAJkOsGeYOEwUfJdFrgRNj
	 lhYaLXDkqDvu25G3xI7uo0KWOfLAdLzS/qlzwV7LGqnVyaAXzde6iHVsb03mYrmQ6u+Sg
	 F0H3yV6jmfZTb/RcMylj/+Yty4rejd99NzF1KZgeJ+4/KFBtojW6oP90vFgtmxRO3vi5I
	 FsL+huilEUILoH9DOOtuD5jakNLrUNAn2cIBd+uy23yhCijsfhqvqAjG8txvehAkXsc5W
	 hYgEhsIzcXd9Tot1Hr+ThvAIeChb4G80s/BFhAi2ng03XHoQL3n0TpKcSbVTzxCsZdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=OiL05YS2;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A1A606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A1A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=OiL05YS2
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5495d549924so48249391cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794852559; x=1795457359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okvp8C0zuSE2GrsT9KtMaCBqr1Zkfu7oGXcl3aeW/jw=;
        b=OiL05YS2dUgjulEGZcPXZ2GuuPa/kGvqN3r2wKpIWxdRWJBuCWWnuQRwvIsJ3sA+B6
         t6KKOyOM0n7cbylFAJD/bMiC6rbwG/aZVbI4p6sfZVr5Qjttyl8bhfL/1SRsFfy/DMia
         ZRmY5IVTEWmeRQlhNXWoAO2LkovRs7PyMF+I6PDXPo22DTCgroKPuKMpxSH2mif/r8ev
         IkcUPTqY3fgyh5mx8lPonJdaS/NZz80oey7iNRgfblPLVYYICRLhZ6ZVpPuw+okbkEv3
         bOTxYJ+EoZW571F5EkPT4g89TG/xLfrro0PkZccqWb65T0ztIDbVg72oCSV4pkCJbEOh
         5+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852559; x=1795457359;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okvp8C0zuSE2GrsT9KtMaCBqr1Zkfu7oGXcl3aeW/jw=;
        b=Tc+uDTEHpSlNSFFgqIyQVKtmw8tymNXEItABS5pSC+FzFXTN/CnpLd3lFqI4egnb9p
         rswGw1vklqvw8/6M0u1Or6aVg6Ka48JcXSMY5mdDMlyZar9C1xmEkA+5jcr919M4kFNh
         KdZodAnvVoWuPpqWPrSGJ0L+TPzE1Gr6qSsMBImnT3oiaHKdoBq7r3IYo2hQ7nsOUJ/F
         bIkajEwXFQoRa0xz9LIp1zXLAffwSLZpKXJvQkSaU/itu0AQlFjnbyfiox/PNu0X7PbL
         5AT3ZWKYEhi8XOdxDkcImp/iTyfnvMifrwTwOnzu443zmA87hdm914HFqkC0LEeBoKC0
         snqA==
X-Forwarded-Encrypted: i=1; AL+hErGAUXApK04a0R8vK8O1KMj7bRdpeb00/sIop/As991XrDTyNll/kLiy26McrFLiD++BetkJJBAmgMgM4mE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zNrlX6KowTTLKiIw20fPvFgUWfFFZ1NFhrxuYR3MJQx1jcuha
	A/L9ywf9MvKdzrbBVDRbXJrP30wF8jGtJux97iPvJn4NYlo3krONkBQH6HjpmdxpJw==
X-Gm-Gg: AYBFou0ROy0vzrWjL3uReV1TPpDpqdx/p6UH5N/4pBk+S8w301ZHiSLbEzyYbve7CKZ
	VEquGeHxsKLJg62Ac64B/snXvkTW6GqZYzlQyF8Hna55dxinZDCPzmxkveB72YCQRAU+jI0mJj8
	Sb8d+tKmQjCjmExTZeyiaTVd1r4SYyKUYy0StNdurdWhF4NFytWPTU0mDebhwZw1Y4IG4shbFry
	dhcVjdVeDginpNosJcBbyIDKTo2RvX/UCQvc5fOftvxfJnEDjdkEFSOcc5c9x3Y/Fh+M712PxKt
	vGrVB7Uc3zw4ITDrN2qbcu3XYtDVnVewFQsilSLn8ZlLgma1R8+JuL5HnDbYgBP9vVKl/eK8P53
	TrfEDSJ/N++DMLGsDxWoscMaZSIGJZsdUeX6F98WWy5CXNBH4i8FRQ1LTntY5ZkcPdXTk2SQX1X
	sGTZdle3kFpjOt8dVgRuRIbc0tWrJYE8kDOGanl6GqmYevnKdCVgHYanu/fewMRJS7LDiUCnEQj
	utk/G2eB87vCu4qmiZ6U5lkwNfjK/zfKIaq2nsFlWo8K2/9fRD5RLxCfMhVGYCgapqfqbVbOVcd
	XDeEWp8zbxXT0T8IRdFZr4L+EQ5nVUkJGUEUkIr5VmZyY38DmJU=
X-Received: by 2002:a05:622a:580a:b0:535:7b01:1ac7 with SMTP id d75a77b69052e-55ac4390e7dmr180243411cf.6.1794852559307;
        Mon, 16 Nov 2026 10:09:19 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55c42b6f3desm62496871cf.27.2026.11.16.10.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:09:18 -0800 (PST)
Date: Mon, 16 Nov 2026 13:09:16 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Gichoon Han <gichoon.han@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-sched: Don't let a bogus siTD remaining
 length underflow
Message-ID: <5ed0f4b7-beb3-4059-9e12-b9738af65d91@rowland.harvard.edu>
References: <CGME20261116052855epcas1p403c518b90d70d98752ad0ca2d9ac05e9@epcas1p4.samsung.com>
 <20261116052851.2272125-1-gichoon.han@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116052851.2272125-1-gichoon.han@samsung.com>

On Mon, Nov 16, 2026 at 02:28:51PM +0900, Gichoon Han wrote:
> sitd_complete() computes the received length of a split isochronous
> packet as desc->length - SITD_LENGTH(t), where SITD_LENGTH() is the
> "Total Bytes to Transfer" count the controller leaves in the siTD.
> Nothing checks that this remaining count is not larger than what was
> programmed.  If the controller reports a larger value, the unsigned
> subtraction wraps and the class driver gets an actual_length of
> nearly 4 GiB for a packet that can hold at most 1023 bytes.
> 
> This was seen on an ARM32 system (vendor 5.4 kernel; this code is

The type of CPU doesn't matter as much as the type of EHCI controller, 
since you're talking about a controller hardware bug.

> unchanged in mainline) with a full-speed UAC1 microphone behind a
> high-speed hub.  snd-usb-audio trusted the value and read far past
> the URB transfer buffer:
> 
>   Unable to handle kernel paging request at virtual address e8756000
>   Internal error: Oops: 7 [#1] PREEMPT SMP ARM
> 
> The register state at the fault is only consistent with a wrapped
> actual_length coming from this path.
> 
> snd-usb-audio now rejects such packets (commit eed0e9583a29 ("ALSA:
> usb-audio: Drop capture packets with bogus actual_length")), but as
> noted when that was applied, the bug really lies in the host
> controller driver,

Actually the bug lies in the host controller hardware.  Not the driver.

>  and other class drivers trust actual_length too.
> 
> Treat a remaining count larger than the programmed length as a
> protocol error instead of reporting a wrapped length.
> 
> Link: https://lore.kernel.org/r/87se19ufoi.wl-tiwai@suse.de
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gichoon Han <gichoon.han@samsung.com>
> ---
> Compile-tested only (ARM32, W=1) on linux-next.  I could not capture
> the siTD contents on the affected hardware; the wrapped value is
> inferred from the oops above.

So you have no way of knowing whether this patch really fixes the 
problem?

Alan Stern

>  drivers/usb/host/ehci-sched.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
> index 57d07d1c2dfa..12a10248a4b6 100644
> --- a/drivers/usb/host/ehci-sched.c
> +++ b/drivers/usb/host/ehci-sched.c
> @@ -2241,6 +2241,10 @@ static bool sitd_complete(struct ehci_hcd *ehci, struct ehci_sitd *sitd)
>  	} else if (unlikely(t & SITD_STS_ACTIVE)) {
>  		/* URB was too late */
>  		urb->error_count++;
> +	} else if (unlikely(SITD_LENGTH(t) > desc->length)) {
> +		/* controller claims more left than was programmed */
> +		urb->error_count++;
> +		desc->status = -EPROTO;
>  	} else {
>  		desc->status = 0;
>  		desc->actual_length = desc->length - SITD_LENGTH(t);
> 
> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
> -- 
> 2.25.1
