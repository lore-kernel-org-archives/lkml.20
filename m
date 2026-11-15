Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794787045;
	b=g9JWwxyUwnkwJtZsH1wZBW/gMgo2ZXK2wYXt7SoafpcLhhjw/Rs22zw7ALuD/n/f8Kw6
	 KRyBvRfYPuebh8XorQ0lf5uHik9RM5i/2Z1Ct5cKj70o85tfhzqvABZKcpn63nK53Tx7a
	 vr4gyMfZT6dpGaH2KClYrRcdEPHbrUdZtvmdP0eE0IGWKGAoktyKxx1JsyeQJwW60Hi3A
	 pGQPgpRIurxab2Sot4DL/XFqSjR6QfAeGfeqLTVMF6S7xLLVgb4pW9VgS+OG8ltRIpP3w
	 JAGXYb71cAXaGh8+pwdSLZPDRte6CgKn+CuBZjpqZb1CrvF3eTvu5ge+ypg/0Z4kWXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794787045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OR4JZ8/atF/AwQ0QRrF76msUgiH/x83Yo3VObwdHnAA=;
	b=xmQ2gt/6UO4MeREQrwp4fqKrYAZ9VvSfIiGNhujGoTnWshC7qhOkHga8aNB8mvlhT3ne
	 5/gVeX9eVOm8OZ+uH1QF+2rShGyT0DvuU6pYTvrKKYJVfN0xki/I9FxhEaRCggYjbC5dk
	 o5x3EB/ys1xM0nzOCcl3pwRY1PeZbk70jA57bNaYrYcw1z3R8sWDGWGx2VxtbD5OG0Zy0
	 AL73MCCcuMrx9zV1GdFNDGGTLy3xdqXlLemaGq+wcisaR2ogrf8cSxRql/McLFj4MdX1J
	 D2auvs3J2FhlyRlnZi0X5+xzaMI2/iXqjH1Q/A7ZlDoAekT7YAAN52yhd/wUfA0CdfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VCn+8Xqo;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267DB606A89C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 267DB606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VCn+8Xqo
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50604721c8so474975366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794787043; x=1795391843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OR4JZ8/atF/AwQ0QRrF76msUgiH/x83Yo3VObwdHnAA=;
        b=VCn+8XqoYKu97g/4LPvx8qL+6NmKbTJk8S0WtIgsYG/GzYohYOHo5E8K+sne/aHOrq
         l/LQ3WhpNS/CcjqG6NNNiW5t8lEvKySdp8hlRyZ1mSuJei6uCmPZxhGFEnjgJYT3qG8N
         RIXvsoa5SfhFsMRNKm5gFVeowJscp6s2OeGZx7S3dOpuahRR94Mb46BciB+saDFObagi
         ZO44t4iRMc9pIQ4hkNQLwlXIK3yO1VuSPLjWEJVBXiRhBTnIQMvwfvNF6yNf0/H4AiQI
         +/uSXGoA+HuS/mNsdomDPcqqUOZAfQM+SEPH6v9esEf8/+q60ebLizzpfvgwx53b7lW/
         c8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787043; x=1795391843;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OR4JZ8/atF/AwQ0QRrF76msUgiH/x83Yo3VObwdHnAA=;
        b=Khwo6kmFXIOdYEfPcDjxAFPkfUxzUSRKEG3uqYHZHFAV9k/cZ2ZBEi+rzUc1hHXS93
         7lgn6e/10mMhIK/64RmKdMon/ImO2TmChK80og3Am/pFik5pqgtHicpzOYjHusz834ny
         9yt8OGhFs6gTj8MF9ul95/Bo5wH02216St9Z3hwIjas5IE4+dmk312dlX9Pv/r3eZsAk
         pLC9faZAqf+V7CBkUstWDDN3tsg+iqSVfk1yP1sSiNdJJKp+GkNibuYefVQHtUe8D/Ky
         gyv60IoXWj1vDeTCyHMtZYgz+RGJPBq+ytPyZ+LVjtHrzX9XWMc08BA4/67y+e8ZkV51
         g9xQ==
X-Forwarded-Encrypted: i=1; AL+hErHC7wiHkubmYdCs639jYneUE4c9sznZ+fWJheckviWqg6Rhsc01IIvv/nf+OCFrj8u60zTzbJdG3Po89B4=@vger.kernel.org
X-Gm-Message-State: APuU4Z95WGLbI06ARkYNKw6mSIw7AqVFkDjA6dV7aQbA4dvDXAL3veM5
	cbSY7WOcaay0WrkPM1c3ct8ks9BMTOJvmU/nDlLK+eLNNMo8Pu7Z5rmU/FXQWRlu45o=
X-Gm-Gg: AYBFou1jyHu/UrrPVTicwmYOZC1m3L7UENB8ajv1npMOKqYqBgJTKv+lpAxo+fnoF3f
	emA21nID8C3/6DdEIEruuQ5ygNYusrocyvZ0ECCLqC0WdBRHCJ3REtRE4Esssg6wlTjyurjWzT+
	1rH2TaXiB6MAFitsrrLx1ARGhbPSqrlxtU247fr4iZZNfq8wTaloqEH6Rcc88LrAIAdgEE1EzAU
	w7V2T2eYFMaPjy1znC3wDlWIxD2g4ArgfhR2cH26P5YwRl4+S+8xGoWBn/RTn2XvRWRG5TLsbXU
	KFXS2mw7Q0KQt0SjEm0eD6Bx2U51zLprlYfqB+dFOwpcSt0t7k3Z1vsSVdUrhp4e0MGXA7ZXTkr
	2OqjMSsMQBe8aewZNc9IyJdQ4sN/+4qO1qiKYsWwR6pCSq9hDVQMrGLp6CE6ghbeyu5Kv+BNkrV
	fxE7aEScJNjYfWAP2t6FgHk+RZBsVMXQ8H2rbi6/aHNRz+PnCTgGpoLpY1DYpR6DKH1v7jVTfIa
	b/3NhPrEbvSHHlrU6dNz3pf0yDI2l3wcUObzMYYQuHWpjyA7cpDKtIPc2MHrdwTwGrpKKx+icEU
	GfIsHA2gfdGb1+i3H2HqFQ==
X-Received: by 2002:a17:906:7c49:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c509641047amr521843666b.40.1794787043309;
        Sun, 15 Nov 2026 15:57:23 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f86226dsm28795445ad.43.2026.11.15.15.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 15:57:21 -0800 (PST)
Message-ID: <8bf058d0-558f-449c-ba96-2b4a1d067dd2@suse.com>
Date: Mon, 16 Nov 2026 10:27:15 +1030
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: raid56: fix use-after-free when waking up the rbio
 I/O waiter
To: Miroslav Cimerman <mc@raidlab.org>, linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20261115232358.58163-1-mc@raidlab.org>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261115232358.58163-1-mc@raidlab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/16 09:53, Miroslav Cimerman 写道:
> The end_io functions of the RAID56 read and write bios decrement
> rbio->stripes_pending and call wake_up(&rbio->io_wait) when it drops
> to zero. The submitter waits with wait_event(rbio->io_wait,
> atomic_read(&rbio->stripes_pending) == 0).
> 
> wait_event() checks the condition before it sleeps, without the wait
> queue's lock. If the submitter checks it after the last decrement and
> before the wake_up(), it does not sleep, finishes the operation and
> can drop the last reference to the rbio, which frees it. Even when
> the submitter sleeps, the wake-up removes it from the wait queue, so
> finish_wait() returns without taking the queue's lock while wake_up()
> may still hold it. Either way, wake_up() then uses a wait queue in
> freed memory, in interrupt context. On 6.12.117 (bio_endio() and the
> end_io function are tail calls, so they do not show in the trace):

The analyze looks good to me. Although I'd prefer an ASCII chart showing 
the race window more clearly, e.g:

    CPU0 (endio, irq)                  CPU1 (submitter, rmw_rbio)
    raid_wait_write_end_io()           rmw_rbio()
    |                                  |-submit_write_bios()
    |                                  | \-submit_bio()
    |                                  |
    |                                  |-wait_event()
    |-bio_put()                        | ^^^ checks the condition without
    |                                  |     taking io_wait.lock
    |-atomic_dec_and_test()            |
    | ^^^ stripes_pending hits 0       |
    |                                  | ^^^ sees 0, doesn't sleep
    |                                  |
    |                                  \-rbio_orig_end_io()
    |                                    \-kfree()
    |                                      ^^^ last rbio reference, rbio
    |                                          freed
    |
    \-wake_up()
      \-_raw_spin_lock_irqsave()
        ^^^ io_wait.lock is in freed memory
        Too late.

And the waiter sleeps case:

    CPU0 (endio, irq)                  CPU1 (submitter, rmw_rbio)
    raid_wait_write_end_io()           rmw_rbio()
    |                                  \-wait_event()
    |                                    |-prepare_to_wait_event()
    |                                    \-schedule()
    |-atomic_dec_and_test()
    | ^^^ stripes_pending hits 0
    |
    \-wake_up()
      \-__wake_up_common_lock()
        |-_raw_spin_lock_irqsave()
        |-__wake_up_common()
        | ^^^ autoremove_wake_function()
        |     takes the waiter off the
        |     queue and wakes CPU1       finish_wait()
        |                                |-list_empty_careful()
        |                                | ^^^ entry already removed,
        |                                |     returns without taking
        |                                |     io_wait.lock
        |                                |
        |                                \-rbio_orig_end_io()
        |                                  \-kfree()
        |                                    ^^^ rbio freed
        |
        \-_raw_spin_unlock_irqrestore()
          ^^^ io_wait.lock is in freed memory
          Too late.



> 
>    BUG: kernel NULL pointer dereference, address: 0000000000000000
>    RIP: 0010:__wake_up_common+0x25/0xa0
>    Call Trace:
>     <IRQ>
>     __wake_up+0x31/0x60
>     blk_update_request+0xfd/0x410
>     blk_mq_end_request+0x1d/0x1a0
>    Kernel panic - not syncing: Fatal exception in interrupt
> 
> With KASAN on v7.4-rc2 and a test-only delay between the decrement
> and the wake-up:
> 
>    BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x76/0xe0
>     __wake_up+0x1c/0x60
>     raid_wait_read_end_io+0x132/0x10f0
>     blk_update_request+0x21e/0xea0
>    Allocated by task 82:
>     alloc_rbio.isra.0+0xa8/0xbf0
>     raid56_parity_recover+0x10a/0x9c0
>    Freed by task 84:
>     kfree+0x154/0x420
>     rbio_orig_end_io+0x1c4/0x340
>     recover_rbio+0x393/0x590
> 
> Wait with a completion instead. complete() wakes the waiter under the
> completion's lock and does not touch it afterwards, and
> wait_for_completion() returns only after taking that lock, so the
> rbio may be freed as soon as the wait returns. The parity scrub waits
> for its writes only when finish_parity_scrub() submitted them.
> 
> Found with FuzzyRAID, a fault-injection tester for RAID.

Since it's not a public tool, I think you can skip this sentence.>
> Fixes: d817ce35d24a ("btrfs: raid56: switch recovery path to a single function")
> Fixes: 5eb30ee26fa4 ("btrfs: raid56: introduce the main entrance for RMW path")
> Fixes: 6bfd0133bee2 ("btrfs: raid56: switch scrub path to use a single function")
> Cc: stable@vger.kernel.org # 6.2+
> Signed-off-by: Miroslav Cimerman <mc@raidlab.org>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Just a nitpick below related the header.

[...]
> diff --git a/fs/btrfs/raid56.h b/fs/btrfs/raid56.h
> index 8700910b8dc9..6c82a975eb68 100644
> --- a/fs/btrfs/raid56.h
> +++ b/fs/btrfs/raid56.h
> @@ -12,6 +12,7 @@
>   #include <linux/spinlock.h>
>   #include <linux/bio.h>
>   #include <linux/refcount.h>
> +#include <linux/completion.h>

You can skip this header, "volumes.h" has already pulled in this header.

Thanks for catching and fixing the bug,
Qu

>   #include <linux/workqueue.h>
>   #include "volumes.h"
>   
> @@ -175,7 +176,8 @@ struct btrfs_raid_bio {
>   
>   	atomic_t stripes_pending;
>   
> -	wait_queue_head_t io_wait;
> +	/* Completed by the last end_io when stripes_pending drops to zero. */
> +	struct completion io_done;
>   
>   	/* Bitmap to record which horizontal stripe has data */
>   	unsigned long dbitmap;
> 
> base-commit: 3aefd67f08f8ed59ed0fa90619b25856df415031

