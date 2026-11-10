Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347248;
	b=Gg2PyRJw++2U1CEI0Ft/0oYYwePAXbaemvcd36fsPG7wiNaW/6FKf/teBc/n/BgYYhed
	 YADjjR+8cVqqXMEOFry0JGoJ2EG7zl+m6Dz7uEUcxJ5uERUyaSIhMhcmoIFQwxIm9tzFZ
	 D+r6A219RySUxSHTOwqoHFwUpHw7MGTBViNsSzoAQd3Ezp1bPYGd9Fxu7L292UiAbboaF
	 a/FqHJw5vvAr2LlsyU/X53PNsctJyEYaFd/o0sAlHPPky3JtIrK9amDAQiFXYqBJi7C6b
	 +aGqsHIdpj7l4O/sWE3KEjMtg3Tlto3RX405KAjdb8jxWRr//7IJ7nM6t7RSLXluMHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=itQt7baLboByvaqThpANlw00X2jZNEvZSlvEBpjTN+A=;
	b=YYU5wOk9zdD8UDSrFI+RqnuBpozdo2UhiKGrtNUQq49r8t9GjX2kFak/S4EwfG91SNHU
	 dSqqradjRK/nv7vuxGg4S+ba/hHqV+5OhZKjzLGxcQu38ETMmkbeYkCVCbQVOC+2J6bJm
	 +6F7ySoLQREa/gBxNFMQU3LibAl+vborjdRBNZrwfQC/n6gMAMc+IArSJWMDCk0FRQe3Q
	 754s/gPc/NtRl7gYke8cfCpq1XBWXRi6WemX1nB/j5paD5de6vK1+iVfIuPD+A1bP0gCs
	 Ql81o5bEwOn0vIKlvuwiELRoxBAZpQJVbCXvtAAHpMzAPcO9XmLr21Z5u/qjUGhOiPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=philpotter.co.uk;
	spf=pass smtp.mailfrom=philpotter.co.uk;
	dkim=pass header.d=philpotter-co-uk.20260707.gappssmtp.com header.i=@philpotter-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="W/KnlQ0D";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BB7606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45BB7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20260707.gappssmtp.com header.i=@philpotter-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=W/KnlQ0D
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so29366405e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20260707.gappssmtp.com; s=20260707; t=1794347245; x=1794952045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itQt7baLboByvaqThpANlw00X2jZNEvZSlvEBpjTN+A=;
        b=W/KnlQ0DeIBoAK9St+jmdXu4f0Pu4sY6irZz2N4aJqAWfDFYOuXjqgjeH8qK//147d
         bQVUHJkmuXQjwKJ3kJSh8KPBQuHUuwuwQH7cJwMbD/H3f0VMVm3r8B2hVhcqWe37nYgJ
         kSWm87fIZHHJiquNv7AsRNAzf3VXY5ZkB7A17Qbzrwa5MTIQQuB/VEoag9r9KJcjDk15
         H68a+YqMTyE3NlAfgScs5kKT+Ck5P3gZvyIVuGnj0C+0xSo784bw4PFqU0nCs23AZh8u
         2FqlLwEv8ila/dWSUqxHGKr6oU59QigN1iEtpw1jDODJLrI8P3Zwv/6UGdhU4LpdtDvv
         ONbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347245; x=1794952045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itQt7baLboByvaqThpANlw00X2jZNEvZSlvEBpjTN+A=;
        b=pmEhfFk8+TWbanTq3FeWnQmSiqT+cB+zbIwoW+bIf7LKxDLCedyyEBbdxYqGM4001M
         2dLZVrpvbwDdJyBwGx+XVeaciHGqIpdB2mcPLYWOtl3ELPwnX+TVSmsS3S8arC1Pdcn4
         sX4r6gP9FREAriWvMyH0S/09f5AOO84i7Y13vTPbHzyydOqwkRBrV3YuG9sKJO09WjEL
         1S6+2D1dTrFIUvLlTAkITQlJBiRZgiJnQx3OutfapxIAP4ZU3fuUdh9E5QrN0yzDlbYq
         ezhvzQauChm5J13TgbMOdWXi8fZUEOCATeImlYIQTZElZoGPP8+PXXDF/5c9V/EV9dq7
         Mc6A==
X-Gm-Message-State: APuU4Z9kV6IB4azIHcLkd2DGWRVrgn4jzKYAy7mfbafKgVIq4zwDgnNY
	LeIJvtTK6MEJ87GgLELICI6Tor1JGrIRZwcduZK6uAM33VNA0FhUOdO3zItK113kso8=
X-Gm-Gg: AYBFou0w3iI+BQQjfsWK+EXVm8uOongqnSyp4jB2CsnWVEXjR94esOlXseHuM9Fxlgq
	rKDebIc3fgQpZjPLs4FygZ0FTvrezTrsBS+w8f64aSCh8BMJt1PX70YKtwijcUxjENSei4UcytB
	QCtgjwYS6doh633BFadkrE16V26FP7BBtnnautb6Ts2ivaaPzhuL1AWx8Q9YG60wZuoipOyLDl7
	bFIfB3bNxvB2km5c1tCD4cwNP95BudqxAqgBVZtNOpOb1WNNYHMH0+vt3umLa2YquA4g13JQ9fw
	zhdnM8Ra1J9rZZwjE3Y0okVv6VRv7bF/ddTJDQqNuQavJPjBMKt/+Q7UINu29OgkkUNPNo6f4Yc
	iqhxnbc9C1EumEzwNUsj6gL5bd7mP2nxbCTdrswaRvtK0F+87wrb7NfHHNAnsZcm5NoIT/zM4Q2
	njDkkjhZCbbBV4+tqnTlfVvH3NcmYOO7P6HTGJzctcHEPuc/eL7bv74UJ4Ws26aLHR8xSB0xw95
	qM6iWdPVhD8uwTQTjDr1JycSTcaGFUnvgaaE7eITRq3oF1ErSVVD7MEdDxTY1+WHb1D5phJvVA=
X-Received: by 2002:a05:600c:4f81:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ba09377c5amr6608315e9.8.1794347245373;
        Tue, 10 Nov 2026 13:47:25 -0800 (PST)
Received: from equinox ([2001:8b0:df16::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe63e6sm138029575e9.7.2026.11.10.13.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:47:25 -0800 (PST)
Date: Tue, 10 Nov 2026 21:47:23 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Jay Vadayath <jay@artiphishell.com>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	phil@philpotter.co.uk
Subject: Re: [PATCH] cdrom: bound the device-supplied offset in
 cdrom_mrw_set_lba_space
Message-ID: <avOQ66kCxOghtFp4@equinox>
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

Finally got around to looking at this properly, sorry - been very busy
and life stuff happening too. The fix looks decent as far as I can see.
Can I ask a few things though please:

(1) Please drop the Assisted-by tag.
(2) Please remove reference to Claude itself, and mention just "LLM
    assistance" or such like if you want to (in the description).
(3) Likewise, please remove or substantially reduce the final paragraph.
    How the bug was found is (in my view at least) not relevant to the
    fix, and (perhaps unintentionally) could also read as an
    advertisement. The relevant information to the mechanism the patch
    guards against is all contained in your earlier paragraphs anyway.
(4) Given your inclusion of a call trace anyway, probably worth
    including a Fixes: tag. This may well just be 1da177e4c3f4 in this
    case, but it's a good way of signifying this is suitable for
    backporting.

Hope that's ok? Based on how the patch looks to me, I'm happy to take it
though provided the above is addressed and no other problems are
discovered during runtime testing.

Regards,
Phil
