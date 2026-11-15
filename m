Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709561;
	b=1fZSDClhb8/SFV+7H0Qq1+3gHjNvPDiw0wY3B+oPdrEVO9lJ8V+XVSIwTKw6LqZVhkV7
	 BibcqtR249JceeClA7qKSDgTpDOeOhnnW5rNc3ns7zi1y3rbiza99rA91A+oKJ34dOdwk
	 RCBlGEI1hONW0ZuqNpdNKfYGptMHOH/ub7jxyqtPnLL5HglUn6cXWuPnvShSr4T4a0tKz
	 VZfErnF1KsKy3y7pyqRX9Pk73oHbjBFCujNLG9jiPv/VAHRKdZ0VVUUqHOJwBhuNpOBeZ
	 Ilcg9iEpBrc3Np+QpwUJEF+9qJQ0LOm7ymJSCUn0VO8LU0HjE6ECtrvdXWv4mNd8tUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XBDay+SoYcPU0sU6hc5PE3yhZdkJGrIdG29lu1ejOcI=;
	b=XvE0DgDY2W9eEIHIle9YfmpLf0/IOxbaA5LnsXESePtzAGe3wekwK0R0i8G2nOB5u/hK
	 dpZ9AkpTzkPkGix1qk1FSMIr6elqQdYdj2PRNGV5YQjxy/kJilC9s6i2eqBa9YOCPyOLX
	 aeF2eBQgDkSTNrWn0fhqCtacIa4zeZfu6OJkqAxR2GemkkiZQJmYt9YU4QA2x6ZsKPsMJ
	 Q7aX6SDyr1PP/7EV0Shg/oQOMC43TYJ0mLQFRPCNggdgElwNGsX1nUYr7oTq7FyZf4WEt
	 b+QQe5kdgzgxxe8tV7mcKvY5BxW/9bfXjBjuHL/q0KAbLzsIFCB8014OoETJt32zlBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAhvBAWG;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27739606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27739606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAhvBAWG
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ad1db7e31so479169eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709560; x=1795314360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XBDay+SoYcPU0sU6hc5PE3yhZdkJGrIdG29lu1ejOcI=;
        b=YAhvBAWG8Du5A9pBVS8Pf6w+YJzqdg9Hnb6F/P9/kFZvvnyfdLOX7dv7a6x1wOAk5b
         bzXtgzCGvQs2uOcfX4DUxwg6coPUo8bk3XrweOUVb5DPpGPIW8CHYNFU6aQGeJpFqB/M
         aTmjf3IIFXkc7QmOqBWoAY4Su00sqC8bX7KY9VUE9kfo7yx5/4GmS28P8soNhuJSs/Ge
         yi5KC5925r2tEpjZVzG6WTE5pREiBDcQ0+IlvOB4dr4jaSzj2g8U3gVzL8xgPN2hC63d
         ZzlflEQjfXEh4YXV5frS/7RIsEEznYMYdtg3JCeVQbeHlf3r4jtDKak1JIHRgFuGaUfS
         /p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709560; x=1795314360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBDay+SoYcPU0sU6hc5PE3yhZdkJGrIdG29lu1ejOcI=;
        b=DsnpliMUWVoJCuTdDMUI5ptjmIG6O3jqnKHxxZbcIpfGFghkDYQndJlNTztuOplQX5
         GHhgmjagBpYOq9mKzNVSFJcF7FqjVAHMC2NDoEYJjDEk7aIB+8pZVfME5YCSD2oGZI0S
         4wthxJR9ODf/S6D+OqOxokiII2ji3CuyYg9609AuopvPbGeba5DrQRfzPMHYLIk+0PMt
         xgNPA+gJ2d2ckzPw0NKTLWxLTdpT4U9bIHHIFOtUt5G23SbO4fy8aHZrUYxLmg3vl7q8
         Ug4bpI6h1j0RQ8VseCBjdedET0y3JQeF8lFdGSWEe5F2PqaachtnMzXJDzxFsdTMGE8h
         8MCw==
X-Forwarded-Encrypted: i=1; AL+hErEg3o6ndltG/TMfgcMWHPYkxSNrVslac8RAmg775fSwZ89W+AMXMUN/g0Glb45eLw+Egx7AD8FCDQfyIkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZgK429oxuR//0kf3P39Ikb3sMRyqFVMPsO/7MP+qS9FMhBScN
	09tIULLUNqmwkbgmqdZMXRRkc4tp4wgHhCo6CBrb3mf7h3N/bL60pIxs
X-Gm-Gg: AYBFou33toWSJt9/qt2UwJ1Zn1OzB1WtDBcdb+RSsNnmEPcM0iLaQNRHZF4XPY9ujwg
	I7aM9mwilVUN+i2fCR490J3je3l15dvixUmQHk+4pttEYvE4rTZN6RsfgDchIRxwbNud6GMaHCn
	oKizaTo1u24LfBOnIfyNeiAUKI6/4KlPKhPjJYcW8zUt8FE/0J0PmDP/Jsez8igqrZ9SGLGOtNn
	iOXvOetg4Ll755OMcTzilegbwbTDEDQN/Vlw6vxOgb7MehT2O0o88wqoNV5vEsY0qi4a+V+pPuX
	Z+lgaUEnobgeDvOkDD+WplGi6ZeIZSJgCPr4K7VMpWOGBpQbNUJsOuEAwLG6KtSKUN39GxDRGO6
	O7mH9aZVpcEQI5kPZeZM1ll2XMVrwo40FrgAUJwfyI+KQxytaHLePi8+ejuKiyliNOTS3p15qx8
	Z1Nrys9lA9GqxkrLI4QdV4gLuCKMTo3fYYivF8edC9MtavyNDlo0vbQd97OGfSBDnHwOhuckpyT
	XljwEK2Umx7BZuCI74YflXvIdn8hA3TRohcJaJ2pXzWX370nqv8CastcOuoji6m5G9HPMy9QOo2
	9m6kY18rih7FJ+XNMHdTpDKHWSRDPpmFU+QRshvclqMm0KEzMzSPn5kfs/Fu/SSUcMtHNLOK+7j
	ssDWAizVDFYPrwGxMqgUvU2vzzZdogqYN
X-Received: by 2002:a05:6820:3419:10b0:6f8:51f5:b9af with SMTP id 006d021491bc7-71ab5108708mr2371012eaf.25.1794709559883;
        Sat, 14 Nov 2026 18:25:59 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm5379466eaf.0.2026.11.14.18.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:25:59 -0800 (PST)
Date: Sat, 14 Nov 2026 20:25:52 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: shuah@kernel.org, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/4] ublk: cancel commits arriving after the quiesce scan
Message-ID: <avkYMF-_bBaIfBly@fedora-laptop>
References: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
 <20261111225801025TKHDW7iZbMR4sFQAc8af5@zte.com.cn>
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
In-Reply-To: <20261111225801025TKHDW7iZbMR4sFQAc8af5@zte.com.cn>

On Wed, Nov 11, 2026 at 10:58:01PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> QUIESCE_DEV marks the queues canceling and cancels pending commands.
> A server can still be processing an I/O when that scan passes its slot.
> If it submits COMMIT_AND_FETCH_REQ afterwards, the newly published
> command can remain queued without a future request to complete it.
> The server waits for that completion and the device remains LIVE.

The issue is real, and it can be reproduced without any test hook:

        kublk add -t fault_inject -q 1 -r 1 --delay_us 3000000
        dd if=/dev/zero of=/dev/ublkbN oflag=direct bs=4k count=1 &
        sleep 1
        kublk quiesce -n N

Without this patch the device stays LIVE after the delayed commit
lands; with it the device reaches QUIESCED. Please add this as a new
recovery selftest in v2, so the fix is covered.

> 
> Share the cancellation claim with the command handler and use it after
> processing a commit when the queue is canceling. The cancel lock and
> CANCELED flag ensure that the control path and command handler cannot
> complete the same command twice.

The commit log needs to cover a few more things:

1) ublk_cancel_cmd() refuses to cancel while the request of this tag is
started, and the new call site skips that check. With zero copy or auto
buffer registration the committed request may still be in flight when
the command is aborted here. I think it is safe, because ->canceling is
already set, so any new request on this tag is aborted in
ublk_queue_rq() and never dispatched to this slot, but please explain
that in the commit log.

2) If ublk_wait_for_idle_io() fails with -EBUSY or -EINTR, ->canceling
is left set and ublk_cancel_dev() isn't called. With this patch the
server gets UBLK_IO_RES_ABORT on its next commit even though QUIESCE_DEV
returned an error. That may be fine, but it is a behavior change and
should be documented.

3) The new check fires whenever ->canceling is set, not only for
QUIESCE_DEV, so the subject and commit log are narrower than the change.

> 
> Fixes: b465ae7b2524 ("ublk: add feature UBLK_F_QUIESCE")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> Tested on next-20261105 with CONFIG_BLK_DEV_UBLK=y in a local QEMU/KVM
> VM (4 vCPUs, 4 GiB), using real ublk devices and fio. A test-only server
> hook held one COMMIT across a successful quiesce, then released it.
> In two runs per version, the original kernel left the device LIVE until
> a second quiesce; the fixed kernel reached QUIESCED without that retry.
> The paired runs used the same userspace probe and no kernel diagnostics.
> 
> The four original recovery scripts also passed twice with this change
> and a separate batch SQE initialization fix, without C or driver
> diagnostic instrumentation or reduced fio load.
> 
>  drivers/block/ublk_drv.c |   40 ++++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 3d322fa1b..082f105f1 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -2792,14 +2792,33 @@ static void ublk_start_cancel(struct ublk_device *ub)
>  	ublk_put_disk(disk);
>  }
>  
> +static void ublk_complete_cancelled_cmd(struct ublk_queue *ubq,
> +					struct ublk_io *io,
> +					unsigned int issue_flags)


ublk_drv.c uses "canceled"/"canceling" everywhere, so please name it
ublk_complete_canceled_cmd().


> +{
> +	struct io_uring_cmd *cmd = NULL;
> +	bool done;
> +
> +	spin_lock(&ubq->cancel_lock);
> +	done = !!(io->flags & UBLK_IO_FLAG_CANCELED);
> +	if (!done) {
> +		io->flags |= UBLK_IO_FLAG_CANCELED;
> +		/* dependency ordered against smp_wmb() in ublk_prep_cancel() */
> +		cmd = READ_ONCE(io->cmd);
> +		io->cmd = NULL;
> +	}
> +	spin_unlock(&ubq->cancel_lock);
> +
> +	if (!done && cmd)
> +		io_uring_cmd_done(cmd, UBLK_IO_RES_ABORT, issue_flags);
> +}
> +
>  static void ublk_cancel_cmd(struct ublk_queue *ubq, u16 tag,
>  		unsigned int issue_flags)
>  {
>  	struct ublk_io *io = &ubq->ios[tag];
>  	struct ublk_device *ub = ubq->dev;
> -	struct io_uring_cmd *cmd = NULL;
>  	struct request *req;
> -	bool done;
>  
>  	if (!(io->flags & UBLK_IO_FLAG_ACTIVE))
>  		return;
> @@ -2818,18 +2837,7 @@ static void ublk_cancel_cmd(struct ublk_queue *ubq, u16 tag,
>  	if (req && blk_mq_request_started(req) && req->tag == tag)
>  		return;
>  
> -	spin_lock(&ubq->cancel_lock);
> -	done = !!(io->flags & UBLK_IO_FLAG_CANCELED);
> -	if (!done) {
> -		io->flags |= UBLK_IO_FLAG_CANCELED;
> -		/* dependency ordered against smp_wmb() in ublk_prep_cancel() */
> -		cmd = READ_ONCE(io->cmd);
> -		io->cmd = NULL;
> -	}
> -	spin_unlock(&ubq->cancel_lock);
> -
> -	if (!done && cmd)
> -		io_uring_cmd_done(cmd, UBLK_IO_RES_ABORT, issue_flags);
> +	ublk_complete_cancelled_cmd(ubq, io, issue_flags);
>  }
>  
>  /*
> @@ -3560,6 +3568,10 @@ static int ublk_ch_uring_cmd_local(struct io_uring_cmd *cmd,
>  			req->__sector = addr;
>  		if (compl)
>  			__ublk_complete_rq(req, io, ublk_dev_need_map_io(ub), NULL);
> +
> +		/* Quiesce may have scanned this slot before this command arrived. */
> +		if (unlikely(READ_ONCE(ubq->canceling)))
> +			ublk_complete_cancelled_cmd(ubq, io, issue_flags);
>  		break;

io->cmd and UBLK_IO_FLAG_ACTIVE are stored here before ->canceling is
read, with no barrier in between, while the cancel scan tests
UBLK_IO_FLAG_ACTIVE locklessly after setting ->canceling. Either side
must see the other's store. That holds in practice because ->canceling
is set under blk_mq_quiesce_queue(), but please say so in the comment
instead of leaving it implicit.

>  	}
>  	case UBLK_IO_NEED_GET_DATA:

UBLK_IO_NEED_GET_DATA publishes io->cmd in the same way. If                                                                                                                                     
ublk_get_data() fails and falls back to requeue, the command is kept
active, and with ->canceling set the requeued request is aborted in
ublk_queue_rq(), so this command looks stranded just like the commit
case. I haven't reproduced that one; can you check, and cover it in v2
if so?

Thanks,
Ming
