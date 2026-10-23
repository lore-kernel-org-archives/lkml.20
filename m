Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790384;
	b=HB70jRORCY+p2hHur8KSyYN9SAiJ3MxkMljKmBjPK+jwYX6Vf2HSzIlJPEu6QstXPXvL
	 gjOh+X8qgKiGAnGgENNNvy1m/5cCvOJrsrlF/3z2XJAqnuN5/a9rDtSak45FYI+OxogMl
	 K1AetEvdqmS/YL4kDodkrBm9tSqoQIPYrEwMHjx0P7JhQfZBFHQefhZUmByqxv+vkFEJy
	 6XobiShUJZBeQCIMFxTIRK66iqY2RxwtxMAZljtoiPEvIifM92Mt0joIcS5HMB7T7fBBZ
	 1HV6TJsXzKo367pXU4PEf9yjivwkqzGFa8rby37jcDMPBIrdQjOo/lghwBphHwpOrCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tSuMMai5SfpfVUf6kCtXqBJ2psY3XIczbPO+y3QzLm4=;
	b=Gpd2H16gWCYXt3Ai/nYjsqKWAgl8JJh80XzzwGQhRbsBvES75YISoHlQfZQGhAM1I7Qx
	 YgXigCdfbxafZWIzfL7y83m+gzv82VJbk/kJLzykSo8ZfJC2Kc5fsTuHra9v6TvwikoYn
	 kAW+MmhPRGigfVfbOaYEVDTkL05pT0rG2SBHEhLOuY3yPO9lCQafJCURQ8Evt1IXj/HBB
	 0OOHIxi00OgU2L0R9PWjQluzASDkOkidjbdWpUIdrvNGFqIY8VdV/M1P1DsUhJ2A95LuI
	 C3hCnyE8OuAk1xaVliAsOq1m9GrXKFgDHgpKdDzkckTLtWZoY28n3B+VKlrpXg7ruAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=philpotter.co.uk;
	spf=pass smtp.mailfrom=philpotter.co.uk;
	dkim=pass header.d=philpotter-co-uk.20251104.gappssmtp.com header.i=@philpotter-co-uk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=DWNyqi4A;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69BB606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C69BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=philpotter-co-uk.20251104.gappssmtp.com header.i=@philpotter-co-uk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=DWNyqi4A
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so12027655e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20251104.gappssmtp.com; s=20251104; t=1792790382; x=1793395182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSuMMai5SfpfVUf6kCtXqBJ2psY3XIczbPO+y3QzLm4=;
        b=DWNyqi4AppeGyh2Z/DnJxsDJU/eYfAEI7EoRTcmINhbg5BluzD8Kke1FGiS6D3fs+j
         HpbutAUjC5rt6KvwfcIrVz0cK6bxsdd7oMCPDXqcGku6OkTwgOr+s2jy8avXJYHjoSde
         Io3bjmVLJ858uc1u9ho5VtKwpjtlE/QnNatntbZM1N5yQ8Y9IzMWD//OXD0YCCXBVDaM
         2vUXX3GvtrUN35kFQyUIPN/rRpCmugvvT7sGAmZYZsV0XXvq5EO4jW+O3qE3H11XKMSt
         IShIqUu0jDSPlIUg3qgaNPRAXKvbFGyKjOpSlSy542NXAtPX7NaZDY9Okx0XcprMqePo
         9+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790382; x=1793395182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSuMMai5SfpfVUf6kCtXqBJ2psY3XIczbPO+y3QzLm4=;
        b=Z+CIfxiOvhsAMpowCspbPZPVx9fhccFV1u4pmz6n5eF5fxg1z8kIOeOQDoRq7kcOw4
         dSpZpld5U0Wr0qtUqL9k/9q5TjZ6Ffp5jySe3Cpr/H7lCdFBIs1JNHJ8YSwg7pIGDauv
         8+qcwv50OW0DtUsG24J0dv3FY5qVxbhDrADWEmu+vVrHU2SXdmVQ0JXDeycB3loJ2owJ
         WF09MweDNP+1KXFAd+sAUX4eZwjYvsquZ5zcGcbDZ68sTSaQHqc+9+aemh0+IT/BWOQE
         c/22hiqClXg8vZpfOlprjWCSC1NqOsfswwH8BIAKgYzB2pTX8chxVaavuE2DWR366ETD
         i9BA==
X-Gm-Message-State: AFq9FYJBz4o/obYJ1FNiYLkr3mE52sQHOtAHhzWyCUJJ5QG3AfAKsGr0
	jekjHqOkp3cJv4x3k4duF6vo7x4GTNmg0zV73AmvKQj6T6kUsATCSGp2KyhkXeIFyxT3e+BhIhF
	arQCEZRY=
X-Gm-Gg: AYBFou20XeJSaTvzP4WinxYgZV7uCLYTN7cQZ7RTSIKUMWEDUmxq0anSL+YXeqUHtqZ
	P31G2IwfMX9ccqYH+nW2wMnh3mch2v2iFExEzeBGyKGB+vHyJGdwEuyX0cj8b+CibSXS1p8MzBx
	Sj+CApBFz2DtBtzJMCZCL77aqkzSQcTRjFpbI9Sx9P/pfREpYgrqGqMW514WT916oVgrplhwTS9
	3EQSb248+SqBuU4yjl8AsWAerDMNfJSTiARR7S49JRBgrSQhSPCOgBawSbtc7sA26wzDz5kCtrw
	wf/S+7qRd12kgnBvXulcBenLtFYzC0dFmbDM7S50csza/hQn4GAVPw+u+HEnG0HFt11vH1Yvv1z
	mrMRLNiE0IajJxLCf6KZotZ2cyWlkv3kkm9UUjYCQPPtAJ+1/5sKjrLwu6pDR2+QmXlijUs63B+
	8sQND2u6OnnLtR15R61OEQ5xpQehHiS2wmcxKGlF6PzCmb0v9ULiXwpR75y+w+T8E4Nv/1M5W1q
	kAyVvhzNUg934jmTYect2e3VQ==
X-Received: by 2002:a05:600c:a08:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a35aeab300mr991435e9.15.1792790382265;
        Fri, 23 Oct 2026 14:19:42 -0700 (PDT)
Received: from equinox ([2001:8b0:df16::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm12266145e9.7.2026.10.23.14.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:19:40 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Jay Vadayath <jay@artiphishell.com>
Cc: linux-kernel@vger.kernel.org, Jay Vadayath <jay@artiphishell.com>
Subject: Re: [PATCH] cdrom: bound the device-supplied offset in
 cdrom_mrw_set_lba_space
Message-ID: <atvPbN2n5Pu_1wd6@equinox>
References: <20261022181955.35758-1-jay@artiphishell.com>
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
In-Reply-To: <20261022181955.35758-1-jay@artiphishell.com>

On Thu, Oct 22, 2026 at 11:19:55AM -0700, Jay Vadayath wrote:
> cdrom_mrw_set_lba_space() issues a MODE SENSE(10) into a 16-byte stack
> buffer (char buffer[16]), then takes offset = be16_to_cpu(mph->desc_length)
> straight from reply bytes 6..7 and does buffer[offset + 3] = space. The
> desc_length field is fully device-controlled (0..65535) and nothing
> checks that offset + 3 lies within the buffer, nor that size (derived
> from mode_data_length) fits. A drive that returns desc_length = 24 turns
> the assignment into buffer[27] = space, a one-byte write 12 bytes past
> the end of the stack buffer.
> 
> This runs when an MRW-writable CD-ROM is opened O_RDWR, so a malicious or
> buggy USB/ATAPI drive (or an emulated one) is enough: no privilege beyond
> being able to open /dev/sr0 for writing on an attacker-supplied device.
> The sink lives in the CD-ROM core, so it affects every cdrom driver
> (sr, ide-cd, pcd, gdrom).
> 
>   BUG: KASAN: stack-out-of-bounds in cdrom_mrw_set_lba_space.constprop.0+0x25c/0x260
>   Write of size 1 at addr ffff88800639f6db by task poc/133
>   Call Trace:
>    dump_stack_lvl+0x64/0x80
>    print_report+0xd0/0x630
>    kasan_report+0xe5/0x120
>    cdrom_mrw_set_lba_space.constprop.0+0x25c/0x260
>    cdrom_open+0x1169/0x2080
>    sr_block_open+0x9e/0x140
>    blkdev_get_whole+0x8c/0x200
>    bdev_open+0x214/0xc40
>    blkdev_open+0x1f8/0x370
>    do_dentry_open+0x408/0x1290
>    path_openat+0xb2f/0x2210
>    do_sys_openat2+0x126/0x170
>    ...
> 
> Both desc_length (offset) and mode_data_length (size) come straight from
> the device reply, so reject anything that would not fit in buffer:
> offset + 3 >= sizeof(buffer) or size > sizeof(buffer) returns -EIO before
> the write. The sibling cdrom_mode_select consumer of size is covered by
> the same guard.
> 
> This bug was discovered by Artiphishell's vTriage pipeline, which
> generated an emulated raw-gadget USB BOT CD-ROM (INQUIRY TYPE_ROM
> advertising MRW-write) plus an open(/dev/sr0, O_RDWR) client that drives
> the capability-probe chain (page 0x2a -> GET CONFIGURATION CDF_MRW ->
> MODE SENSE page 0x03 with desc_length = 24) and reliably triggers the
> KASAN report on an unpatched kernel. The fix below was drafted with the
> Claude coding assistant; a userspace reproducer is available on request.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Jay Vadayath <jay@artiphishell.com>
> ---
>  drivers/cdrom/cdrom.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 4f1fd389260f..5e910d79045f 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -571,6 +571,10 @@ static int cdrom_mrw_set_lba_space(struct cdrom_device_info *cdi, int space)
>  	offset = be16_to_cpu(mph->desc_length);
>  	size = be16_to_cpu(mph->mode_data_length) + 2;
>  
> +	/* Both fields are device-supplied; reject values that overflow buffer[]. */
> +	if (offset + 3 >= (int)sizeof(buffer) || size > (int)sizeof(buffer))
> +		return -EIO;
> +
>  	buffer[offset + 3] = space;
>  	cgc.buflen = size;
>  
> -- 
> 2.51.2
>

Hi Jay,

Thanks for your patch. Won't be able to review straight away as I'm
travelling early tomorrow and busy most of the day. Please can you
provide the userspace reproducer code to me too in the meantime,
thanks.

Regards,
Phil
