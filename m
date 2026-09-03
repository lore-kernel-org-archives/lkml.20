Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513EE50C2B0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464953; cv=none; b=t0CGwBWpOIdFs6Deogtz+5TaGC9U5s3z1E+RvG7v1VUsoMsR0mABSw1qYENX71Ghg+Ka/Yn9fuwxoelHWI+nimAVDlKDFC4owRb5B7rKBQb1+3eSdFnjpQOUpKq4B/ND0FdJY75zcKWN+mFOQrUkY3032mtgbmGurzU02I0OIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464953; c=relaxed/simple;
	bh=BYsI3FFlYAxzF+nFXM9EuRd7hj8pX+HDRmiPu+SFN2M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=eExOm0wyISO5X+XDVQmDPHjbuKCGBC7Gpm/M+qhwT3sqSlatbe+cajS6edTIeg26ZB1uBtrFrffHnY8toshaSL1PvDCaQitUKV3HhRBrnwDtBlG6BJAcmLwxBDIp7MRouXS+RnPybK1wFSkRM++P4mLbT3HctGd5cwgnipPPk44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b38ea4c6acso200493b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464937; x=1789069737;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=70n4aw62Ab5x56TWOp6WJ+y9l78PpS0U03ixNVEq2bI=;
        b=bkT1wyqNYRTYsv1ICw99FrGJwY6ZudvLcQ8/7pTmnvpw8+qHjh6zfuqW0ktOz4Dvsd
         wDnLDncIaBjJGm1QYPGdDoCDPAF/L32WIFaOo/tMX1xt5M2BBsePfrvWRJr2DkSQ8UDw
         x204q/M2VTV4aXSkytY41C9icLsi0D6NQenf1STjbakB7bEsHQOGY/W65zpVBK2YYEF+
         9osfiMtguooNTw/zQD1rbTAjR/Q8xrFe5CoSHg0L3FoSpfQFs7nfB6W3QdYm7j71C63d
         LM/JqVE2kbATlCBgoYYqGrn9QI5BZRGiYoxT3MkD+cZMSRPpfFGdzXEbKKpZBjYi7aIC
         5+TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxABLyx9NYWcGmAQQhPzuXH+k/J1YGrbNqUSp1M7U4+ScqIWo9YVv6K97EhtGkSLbeT0bRzMbH+zEMxTDo=@vger.kernel.org
X-Gm-Message-State: AFuF++m8HWs8DIJSrvBHsw90/NShuIuSc+/9GqmR4yAa/NP1KAbc/7re
	AWqPb1ebYtaY/sx4Lb58a8vX8JTQn8e8rHO3Lgl/IHcdjU+fjClEksfqbdC6Crp4fejCVaVsHnp
	8sZMZt1FoU3acBNCIzQegVrVIfL59ymDUSFVoNxUyLcNgExi14jOQDgptkaY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2019:b0:6b1:5b3e:13a3 with SMTP id
 006d021491bc7-6b6fd6c5c9dmr1040503eaf.30.1788464937730; Thu, 03 Sep 2026
 12:48:57 -0700 (PDT)
Date: Thu, 03 Sep 2026 12:48:57 -0700
In-Reply-To: <20260903194837.153586-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99cf29.9266084e.bf0d7.0278.GAE@google.com>
Subject: Re: [PATCH] blktrace: always record ftrace events as blk_io_trace2
From: syzbot <syzbot+4dfd96209d744263a972@syzkaller.appspotmail.com>
To: adrianox@gmail.com
Cc: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

> The ftrace ring buffer always uses the v2 (blk_io_trace2) format, but
> __blk_add_trace() switched the reserve size and record format on
> bt->version. That field only describes the relay/classic blktrace record
> format and must not change what goes into the ftrace buffer: the ftrace
> readers (print_one_line() and friends) unconditionally parse blk_io_trace2.
>
> The BLKTRACESETUP ioctl sets bt->version to 1. With the blk tracer also
> enabled, __blk_add_trace() recorded a 48-byte v1 event into the ftrace
> ring buffer, but the reader parses the 64-byte v2 layout, so pdu_start()
> points 16 bytes past the PDU and blk_log_remap() reads out of bounds - a
> use-after-free when the ring buffer page is resized concurrently.
>
> Always use the v2 format in the blk_tracer path, and initialize
> bt->version to 2 in blk_trace_setup_queue() so the sysfs-enabled path no
> longer leaves it uninitialized.
>
> Fixes: e48886b9d668 ("blktrace: for ftrace use correct trace format ver")
> Assisted-by: opencode:deepseek v4 flash
> ---
>  kernel/trace/blktrace.c | 74 +++++++++++------------------------------
>  1 file changed, 20 insertions(+), 54 deletions(-)
>
> diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
> index 8cd2520b4c99..ae010969c144 100644
> --- a/kernel/trace/blktrace.c
> +++ b/kernel/trace/blktrace.c
> @@ -385,66 +385,26 @@ static void __blk_add_trace(struct blk_trace *bt, sector_t sector, int bytes,
>  	if (blk_tracer) {
>  		buffer = blk_tr->array_buffer.buffer;
>  		trace_ctx = tracing_gen_ctx_flags(0);
> -		switch (bt->version) {
> -		case 1:
> -			trace_len = sizeof(struct blk_io_trace);
> -			break;
> -		case 2:
> -		default:
> -			/*
> -			 * ftrace always uses v2 (blk_io_trace2) format.
> -			 *
> -			 * For sysfs-enabled tracing path (enabled via
> -			 * /sys/block/DEV/trace/enable), blk_trace_setup_queue()
> -			 * never initializes bt->version, leaving it 0 from
> -			 * kzalloc(). We must handle version==0 safely here.
> -			 *
> -			 * Fall through to default to ensure we never hit the
> -			 * old bug where default set trace_len=0, causing
> -			 * buffer underflow and memory corruption.
> -			 *
> -			 * Always use v2 format for ftrace and normalize
> -			 * bt->version to 2 when uninitialized.
> -			 */
> -			trace_len = sizeof(struct blk_io_trace2);
> -			if (bt->version == 0)
> -				bt->version = 2;
> -			break;
> -		}
> -		trace_len += pdu_len + cgid_len;
> +		/*
> +		 * The ftrace ring buffer always uses the v2 (blk_io_trace2)
> +		 * format; the ftrace readers parse only that. bt->version
> +		 * describes just the relay/classic blktrace record format.
> +		 * Recording a v1-sized event here would shift pdu_start() 16
> +		 * bytes past the PDU and make blk_log_remap() read past the
> +		 * event (a use-after-free on concurrent buffer resize), and v1
> +		 * cannot represent the newer 64-bit zone actions anyway.
> +		 */
> +		trace_len = sizeof(struct blk_io_trace2) + pdu_len + cgid_len;
>  		event = trace_buffer_lock_reserve(buffer, TRACE_BLK,
>  						  trace_len, trace_ctx);
>  		if (!event)
>  			return;
>  
>  		tracing_record_cmdline(current);
> -		switch (bt->version) {
> -		case 1:
> -			record_blktrace_event(ring_buffer_event_data(event),
> -					      pid, cpu, sector, bytes,
> -					      what, bt->dev, error, cgid, cgid_len,
> -					      pdu_data, pdu_len);
> -			break;
> -		case 2:
> -		default:
> -			/*
> -			 * Use v2 recording function (record_blktrace_event2)
> -			 * which writes blk_io_trace2 structure with correct
> -			 * field layout:
> -			 *   - 32-bit pid at offset 28
> -			 *   - 64-bit action at offset 32
> -			 *
> -			 * Fall through to default handles version==0 case
> -			 * (from sysfs path), ensuring we always use correct
> -			 * v2 recording function to match the v2 buffer
> -			 * allocated above.
> -			 */
> -			record_blktrace_event2(ring_buffer_event_data(event),
> -					       pid, cpu, sector, bytes,
> -					       what, bt->dev, error, cgid, cgid_len,
> -					       pdu_data, pdu_len);
> -			break;
> -		}
> +		record_blktrace_event2(ring_buffer_event_data(event),
> +				       pid, cpu, sector, bytes,
> +				       what, bt->dev, error, cgid, cgid_len,
> +				       pdu_data, pdu_len);
>  
>  		trace_buffer_unlock_commit(blk_tr, buffer, event, trace_ctx);
>  		return;
> @@ -1913,6 +1873,12 @@ static int blk_trace_setup_queue(struct request_queue *q,
>  
>  	bt->dev = bdev->bd_dev;
>  	bt->act_mask = (u16)-1;
> +	/*
> +	 * This sysfs-enabled path feeds the ftrace blk tracer, which always
> +	 * uses the v2 (blk_io_trace2) format. Initialize the version so it is
> +	 * never left dangling as 0 for future consumers.
> +	 */
> +	bt->version = 2;
>  
>  	blk_trace_setup_lba(bt, bdev);
>  
> -- 
> 2.51.0
>
