Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59103537CE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772695; cv=none; b=ZlNbU0k19cph1q10k2Pdo1ABQSyRCD39kUrnPXGwz6bC5oe4/niId1RB3651j7dbmB9F9geOTyWOW6p0yN3NRM7XHupWqab1DLucAzWN2irREAed8Z4jITbTqF5GwyuSBn/oA8tajkGZ6TcfVYxcq/WODY3WYLengzjQNMkbXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772695; c=relaxed/simple;
	bh=SGfLYuzawYM7CArQUCVBEeD5eD6OckEYf0HNwbCiXAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qs41JNXQPhSCtWqYqvPsoDzLgVjYLJYj0YD9iez8VbH35zg5PNiQEfcthdX3tHbCv/eEyRzTgtSbSlC9dMGH+pXwuaf5jSc2VJ0ebyYhiZrbhjgXaQSVSaJkgsuaFJ3J9EKJmcIqpoB7eoeeYPFuIvyIVQ3nZ/1JhnwAQRF8d0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTkQvk8W; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTkQvk8W"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc149372c14so1055408a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787772689; x=1788377489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87q+5ivROSLtYuJS4l3dPY+myx5uTzr/xnq7BAcE3WU=;
        b=eTkQvk8WMa6mlDzcSyV11t0wN9va+X95JuON5Yg0VnIoWdT+OXtWRhY8Ov9dizgPbl
         C/sdl5KXw2vMPgE8vNIB42TIz0h6BGIojgFazpMx1qwFKT/2z1m3a8KiES7M8h3ohz+l
         gl53EBCR3gtRQdumbv8MCTfFubHY31ivSW7xmhRE4Fawaw0xMoiBOKJEHrVvhM8tmWCe
         AEHSNGKjKZaTFxDGTcvWeWG4fl8dHWSBEUy82gMRgizQwEo6xZYq4tyfPbrwGiNgQjYW
         bajbn5Aqdl1MCol/2ovKpm43TLiGcQOPttPURiXR+KLYdE8tEOwMMxVGucajnTRQGHXd
         cGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787772689; x=1788377489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87q+5ivROSLtYuJS4l3dPY+myx5uTzr/xnq7BAcE3WU=;
        b=fUgyAIZ5VV/mkoCulixcuzAmh6zzq8c8iS+1RQtrOZicVNUVRY/L4JhIw+eOwt3KSc
         4XAS/0K9a0zx0vQoOav4DyHfK6eAy6EoVmVhnv4qkKoVTwdcqHciE2AJzsDmruXlcsU/
         H+UMr/eo3bWjxgVbpB684C/gpQL79ABT1eGRUxhPtT2UuKyakZ62rcyc4FT+5+++hFIa
         EnguW7Tq8/wplVkHtow/DfuKB5kpFMFRu8vnW+IKjz9SP15qeH09ELRvHXBa4RmvMipr
         9/hL6rX6zMUE0P2z2DBMz4UiskNe0EeeEs0GIuEpe0/BTCy2a2/wpM1no8LKSsBp4/a9
         Xomg==
X-Forwarded-Encrypted: i=1; AHgh+Rrw1qV+WNJPpzammj/OcSHQzbjiVD0R31yrwXSJvIuPg6CqrlH7aCPgtGWQ0zKvgw59IT+3oUy87RSFJlk=@vger.kernel.org
X-Gm-Message-State: AFuF++mXXa+KMuE+wBkYVYLeoPzyZriH4qecJf2HqgKIsEnCPwsEhLrU
	TABk6hmFEdmlyuhNEmMB9rq5mT6owopRllwkuid/lPLdPJp4ia0mC3yt
X-Gm-Gg: AR+sD10cd9OyhuQv8WhRO1+C7aGtIS/TxcZoIj/g71Gw0nzYU43g4Ub8R3n9qYbCo3/
	p5PkMLfmRzrgEP33qlUxZEIqLwRd/iTeUDlL/jGaNQaQ3eK5yZMXJo7V2pgfubvyd2X8QWrervu
	RzyAr1KIEHpdYwXayIwqFHQj6Nft9X6b+pYBhFoW/x+2pexV0p/5+51IbwktIEvXN9K1wNHRXza
	XYEnt4uatXcuuPsNoNQUbPW6TtbYBTGlP8N3r8kff2Dav/EPPUTsgcAPHeIpwzyN9Cn1Qux/RtC
	yOW5yY7JinlLlkxM8zRxV6rdmPHa3b+rQCw+qHP9Pt1HCDjNjSWWDjRkODqK9WI9s+TFF4jXFnv
	eKHgbPeAmayKqCcnEt2fFeKtPgVZuLPQ3z0P9VkFIUNf/IeH3c0d2947Lv0kdI4VVuKgofDt2wR
	/bDpTWtDnOGdVyGW3Znl53NkOLVucgFSGH1emjCn25/GqEYakWHdmLKATjwG0SBCj9jGthkCY6g
	VqMvjiVUYSK+1nd/OLj5ThDllw75X2dTxVpJ62jElTfqp5SWwq7CuBaywJebXvSLi6txNPUQDZl
X-Received: by 2002:a17:90b:4b0f:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-3966d1d9579mr17435841a91.6.1787772688569;
        Wed, 26 Aug 2026 12:31:28 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:b984:9fe3:5dce:f291? ([2001:df0:0:200c:b984:9fe3:5dce:f291])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3965547159asm7952454a91.12.2026.08.26.12.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 12:31:28 -0700 (PDT)
Message-ID: <b010c98c-ecd5-439c-b07d-3efad26de7f2@gmail.com>
Date: Thu, 27 Aug 2026 07:31:22 +1200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20260824153339.512487-1-p.pisati@gmail.com>
 <20260824153339.512487-2-p.pisati@gmail.com>
 <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 25/08/26 19:53, Geert Uytterhoeven wrote:
>> +static unsigned int pata_cswarp_data_xfer(struct ata_queued_cmd *qc,
>> +                                         unsigned char *buf,
>> +                                         unsigned int buflen, int rw)
>> +{
>> +       struct ata_device *dev = qc->dev;
>> +       struct ata_port *ap = dev->link->ap;
>> +       void __iomem *data_addr = ap->ioaddr.data_addr;
>> +       unsigned int words = buflen >> 1;
>> +       u16 *buf16 = (u16 *)buf;
>> +
>> +       /* Transfer multiple of 2 bytes */
>> +       if (rw == READ)
>> +               raw_insw(data_addr, buf16, words);
>> +       else
>> +               raw_outsw(data_addr, buf16, words);
>> +
>> +       /* Transfer trailing byte, if any. */
>> +       if (unlikely(buflen & 0x01)) {
>> +               if (rw == READ)
>> +                       buf[buflen - 1] = raw_inw(data_addr) >> 8;
>> +               else
>> +                       raw_outw(buf[buflen - 1] << 8, data_addr);
>> +               words++;
>> +       }
>> +
>> +       return words << 1;
> This may be one less than the actual number of bytes
> Why not buflen?
>
words = buflen >> 1;

followed by

if (buflen & 0x01) words++;

makes 'words' the correct (i.e. rounded upwards if buflen was odd) 
number of words transferred.

The return value is then either correct, or one larger than the actual 
number of bytes?

I believe the template for these functions was 
drivers/ata/libata-sff.c:ata_sff_data_xfer() which follows the exact 
same logic.

Cheers,

MIchael

>> +}
>> +static int pata_cswarp_probe(struct zorro_dev *z,
>> +                            const struct zorro_device_id *ent)
>> +{
>> +       static const char board_name[] = "csWarp";
>> +       struct ata_host *host;
>> +       struct ata_port *ap;
>> +       void __iomem *base;
>> +       unsigned long board = z->resource.start;
>> +
>> +       dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
>> +                board);
>> +
>> +       if (!devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
>> +                                    DRV_NAME))
>> +               return -ENXIO;
>> +
>> +       host = ata_host_alloc(&z->dev, 1);
>> +       if (!host)
>> +               return -ENXIO;
>> +
>> +       ap = host->ports[0];
>> +       base = ioremap(board + WARP_OFFSET_ATA, 0x1800);
>> +
>> +       ap->ops = &pata_cswarp_ops;
>> +
>> +       ap->pio_mask = ATA_PIO4;
>> +       ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY |
>> +               ATA_FLAG_PIO_POLLING;
>> +
>> +       ap->ioaddr.data_addr            = base;
>> +       ap->ioaddr.error_addr           = base + 1 * 4;
>> +       ap->ioaddr.feature_addr         = base + 1 * 4;
>> +       ap->ioaddr.nsect_addr           = base + 2 * 4;
>> +       ap->ioaddr.lbal_addr            = base + 3 * 4;
>> +       ap->ioaddr.lbam_addr            = base + 4 * 4;
>> +       ap->ioaddr.lbah_addr            = base + 5 * 4;
>> +       ap->ioaddr.device_addr          = base + 6 * 4;
>> +       ap->ioaddr.status_addr          = base + 7 * 4;
>> +       ap->ioaddr.command_addr         = base + 7 * 4;
>> +
>> +       ap->ioaddr.altstatus_addr       = base + (0x1000 | (6UL << 2));
>> +       ap->ioaddr.ctl_addr             = base + (0x1000 | (6UL << 2));
>> +
>> +       ata_port_desc(ap, "  cmd 0x%lx ctl 0x%lx", (unsigned long)base,
>> +                     (unsigned long)ap->ioaddr.ctl_addr);
> Both printed addresses are virtual addresses hence not really useful.
> If you want to print something, please print board or z->resource
> instead.
>
>> +static const struct zorro_device_id pata_cswarp_zorro_tbl[] = {
>> +       { ZORRO_PROD_CSLAB_WARP_1260, 0},
>> +       { 0 }
> Please use named initializers, and drop unneeded zeroes, like Uwe
> just did in all existing Zorro drivers:
>
>      { .id = ZORRO_PROD_CSLAB_WARP_1260 },
>      { }
>
>> +};
> Gr{oetje,eeting}s,
>
>                          Geert
>
