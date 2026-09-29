Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AA135AC01
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790657583; cv=none; b=rwOypliJAqv4Uc7US1EHsWjH1BuFxYb9P0aU9yCqYiGrR+jyLvvbbMh1dZEXLHsd6M/14ieCJcU/itJvB7I2C3jfJB0Lwyr3mTOA+kgpCM89pnw6a7w7WSvbi37Ob2V2n0dBmCWy4IsD6C0i5ZJ/wc967P3F+NlHxs+G63uOh6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790657583; c=relaxed/simple;
	bh=o539DLIWyqO/sfBi2fiRqwS9Yb47Tj3vo/VA1D2HkO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsy7DJlUC5yGjZrG0bg8PYg7OwQNGjG2HRsGWS12L1BC3bi3GdVAFv2W9eGx1TeDP/o6a1qR/UPWHU2bNVP4XYjtjv68iTTT2XxqXz6VVoYy/IIiENWJf82AbbByHxV9b7DGqRGsHdty9HnnpayDHkLJT0lTj+kGhjeJUMeXg1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ArsEW9R2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ArsEW9R2"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso16472365ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790657580; x=1791262380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/gMauj1wMCFkJAvjOeOaee1hM6WQfyxkgyFTZYH3bE=;
        b=ArsEW9R23xri0/RiwnWh172La+Eyk8MrUtfv3MA1O6k2sNMzF3vYyy2WRbqzEYYO9v
         TfsV8ZBHrrsxZ7v9oeF00xd8/TctCTymXj/5ya+wsW9j+DC2g+Bcco3Ft6ZkvKA1Taev
         kw75gRTWiQ1jW1JNvwgnMJ3fIVuKumypM+GsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790657580; x=1791262380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/gMauj1wMCFkJAvjOeOaee1hM6WQfyxkgyFTZYH3bE=;
        b=X0uxLwj5E5r7o6aq/hKCWtmwIErf6Ss5ytGiAqNibNipiq2Z+z7u0gZOb5w+Fh+HHi
         dEiseE6opd1//6KEmjX5umt6ln1mKbBZOlVvWZiMpj77lNjCS/HOW9hAhHcM3wfZ3jGP
         idHjsiDHld3iVZrjifEgkoXs6vqk3LvtnbaxVke8VQA5mNQ4IcJL1crRG0gN4bSRUlAe
         kbJXhvx66Dd8Bw1hcziUwJ2P7dMl9+g0MFn0eDMguqFDNyYlmerww87Is0rHBXgh0HnM
         JlnGvmrfhLPyiTPBakDBLtHg7duOfBcRIn/etlnaPojLbPiVNshYC8n68OJjyNbt789l
         xntQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC/qQNIkjKEQsoHxNzAZjL3VANcQwQW1W1zbOA9WFhXiEjHOEcMqq2JR0ar8uAGzQggZkRWN52TjZCvs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeykgLT9S1SC1VPbe6iDoEpKld54b2OnO7k4gQzGAxdu6/hraA
	dMRloMKY4IZTVWGSN0PPMsir/gFEN+w8sjgbT+zkRRFwaB9B/Y+S23u6QtZSs5NPeA==
X-Gm-Gg: AYBFou2tmUAYFRZ1XGuODisEAChvoYTlxBd3LxxBkXS/MGEkrRIo/u/1z1nuzj5kdLt
	d/86Cr7MdlXJR/AfkzrJSo5bKM9JwJJYglbad5OIy0WLhIQln1v2aF2S24+Q8OiQDp8PxHE/GxF
	zKRhK8AHCwbivz6sKLhsLHg8Uj/i9/OrDGMreFZ2ocpStdG1cNllZxf/ZVmxlE0cpob5SRkxddd
	4TcbxaQutvgcmDEjsv16y9rFy+Yfl8YlImjODdjKAkN/jNflXxfajPPQ3PRkv8SHaOFTtgqUVg3
	dLdwwhsdS3zKXx0YL9lcYYIoUfX6YS6hH+oF9RmGZhxrLtVuthxQpOhhiuMKk6ZoD7aW5aWWxBJ
	qDhkZ+lUe20d3nX5J5OAVpZDYdIHrGElIThK6SC84epnoskhyF8DcJgnFhjVzkBklVBjHNo6Yb2
	osHzX7mE5h7ZtShIwiiLaOePSARkZS1+wzb6KHuLWg5IEkxT5/hvpH6s+tJpkwbXn5mpOTdvhu3
	qwf+u1+q6y1NDtP60eW7BUOU2sh+dqovAxqimAfsoGB5ouUjOI=
X-Received: by 2002:a17:90a:e7c4:b0:3a0:809b:1972 with SMTP id 98e67ed59e1d1-3a098ce5e08mr13570346a91.26.1790657580465;
        Mon, 28 Sep 2026 21:53:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:5d05:485f:348c:a48b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858c123sm3423177a91.3.2026.09.28.21.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:52:59 -0700 (PDT)
Date: Tue, 29 Sep 2026 13:52:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Pooyan Azad <pooyan.azadparvar@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] zram: fix short reads from block_state
Message-ID: <artCq0JFqBNcZkzY@google.com>
References: <CANC3H+LdtoydSp+o2ecErAw7k6R2+gRf9LyxcaoHv_mGhJmyQQ@mail.gmail.com>
 <20260928164826.24858-1-pooyan.azadparvar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928164826.24858-1-pooyan.azadparvar@gmail.com>

On (26/09/28 18:48), Pooyan Azad wrote:
> read_block_state() formats each entry directly into the buffer supplied
> by read(). If the remaining buffer is too small for one complete record,
> snprintf() returns the full record length and the function stops without
> copying data or advancing the file position. A read smaller than a record
> therefore returns zero at a non-EOF position and cannot make progress.
> 
> Convert block_state to seq_file so formatted records are buffered
> independently of the userspace read size. Keep dev_lock held across each
> seq_file iteration and continue to protect individual entries with their
> slot locks.
> 
> Fixes: c0265342bff4 ("zram: introduce zram memory tracking")
> Closes: https://lore.kernel.org/r/CANC3H+LdtoydSp+o2ecErAw7k6R2+gRf9LyxcaoHv_mGhJmyQQ@mail.gmail.com/
> Signed-off-by: Pooyan Azad <pooyan.azadparvar@gmail.com>

Overall looks good, some comments below.

[..]
> No runtime testing of the patched kernel was performed.

I would prefer some testing, especially given that you have a repro script.

[..]
> +static void *zram_block_state_next(struct seq_file *seq, void *v, loff_t *pos)
> +{
> +	struct zram *zram = seq->private;
> +	unsigned long nr_pages = zram->disksize >> PAGE_SHIFT;
>  
> -		copied = snprintf(kbuf + written, count,
> -			"%12lu %12u.%06d %c%c%c%c%c%c\n",
> -			index, zram->table[index].attr.ac_time, 0,
> -			test_slot_flag(zram, index, ZRAM_SAME) ? 's' : '.',
> -			test_slot_flag(zram, index, ZRAM_WB) ? 'w' : '.',
> -			test_slot_flag(zram, index, ZRAM_HUGE) ? 'h' : '.',
> -			test_slot_flag(zram, index, ZRAM_IDLE) ? 'i' : '.',
> -			get_slot_comp_priority(zram, index) ? 'r' : '.',
> -			test_slot_flag(zram, index,
> -				       ZRAM_INCOMPRESSIBLE) ? 'n' : '.');
> -
> -		if (count <= copied) {
> -			slot_unlock(zram, index);
> -			break;
> -		}
> -		written += copied;
> -		count -= copied;
> -next:
> +	++*pos;
> +	if (*pos >= nr_pages)
> +		return NULL;
> +
> +	return &zram->table[*pos];
> +}

Can you return pos instead?  (and handle v as a pointer to offset in
other functions.)

[..]
> +static int zram_block_state_show(struct seq_file *seq, void *v)
> +{
> +	struct zram *zram = seq->private;
> +	struct zram_table_entry *entry = v;
> +	unsigned long index = entry - zram->table;
> +
> +	slot_lock(zram, index);
> +	if (!slot_allocated(zram, index)) {
>  		slot_unlock(zram, index);
> -		*ppos += 1;
> +		return SEQ_SKIP;
>  	}

I guess we can just do

    +static int block_state_show(struct seq_file *s, void *v)
    +{
    +    struct zram *zram = s->private;
    +    unsigned long index = *(loff_t *)v;
    +
    +    slot_lock(zram, index);
    +    if (slot_allocated(zram, index)) {
    +        seq_printf(s, "%12lu %12u.%06d %c%c%c%c%c%c\n",
    +               index, zram->table[index].attr.ac_time, 0,
    +               test_slot_flag(zram, index, ZRAM_SAME) ? 's' : '.',
    +               test_slot_flag(zram, index, ZRAM_WB) ? 'w' : '.',
    +               test_slot_flag(zram, index, ZRAM_HUGE) ? 'h' : '.',
    +               test_slot_flag(zram, index, ZRAM_IDLE) ? 'i' : '.',
    +               get_slot_comp_priority(zram, index) ? 'r' : '.',
    +               test_slot_flag(zram, index,
    +                      ZRAM_INCOMPRESSIBLE) ? 'n' : '.');
         }
    +    slot_unlock(zram, index);

    -    if (copy_to_user(buf, kbuf, written))
    -        written = -EFAULT;
    -    kvfree(kbuf);
    -
    -    return written;
    +    return 0;
     }

The SEQ_SKIP branch is probably not needed.  We don't advance s->count
for un-allocated entries, which should be enough, I guess.
