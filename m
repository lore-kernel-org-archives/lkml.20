Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617741;
	b=xCoHxDdEq5x2uSHlvZ4rkGffJaE6sPqMRxFvLEhu6tyW84jraFS6L2hu0KP8tcK961sy
	 81cr53FtmEJSNvB8Lb/3HX8PRQkC0T7lBlmbEoLUtbrBl/RljSDN6q7K6eS1lZ0Ivy32B
	 Lo9JbJFj0c/jRU3nNSXosLXbFeLOIKdOyZ41BchLYfUHs8NzXjNHSdoFfCx/pIWVigd+l
	 k5H4aQixrfAL6FHsdKWYGdpt4WNljNNyoICHlrRuj1iBhCe7/Eg6zopfE/ReH7i0qmXTO
	 dIc1qm5akN6Lqv0DLvTzLLT9zzhiPeGZeW3w5IQcBzR1bcywz5nkhoobSh58uX0o26w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kogwx6wOFEx8wkc1OUmn08NcuZSkF+8EZ7OoR4vifO8=;
	b=Ft9hycRk8O/UXbIJ3Scwh5G+UToKeJ+ZEGIQAPPsS6POo9iVPHdruZGGTmxeMJ23/8Q1
	 TQCrmUUv0+Rxlmcpct/8TmQ5ErBVvB0fEzn8ZTmz3KiG3FcM89ocK2GEpjqZsZMZr+oDz
	 Kk/Av1wgGcG8l6w6tR5X7ZuuwzxjhOg7/N/LsrpYjsxsQyDDg/zc1jVguEKEx4EvUxrWZ
	 cEwD1+ClKAwzy2gUqkPmtKQajCh4jUSxm6gB7hJBzTBoXZr0n1rojO0iYpxUNveqyBs7C
	 x2x8frjz3oyopNCpy8uSN3obyeXtoPqQqsgUwQx+QZEP6cCgC6hgP/sLXFims7yQVgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qt+nxT25;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249D2606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249D2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qt+nxT25
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c315869241fso397363266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793617738; x=1794222538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kogwx6wOFEx8wkc1OUmn08NcuZSkF+8EZ7OoR4vifO8=;
        b=Qt+nxT25+VUAwTzK2Y6d+fGiF0wLVF4G5iT0KoZbkMTm8wWqK/cXR7WGG4duUq7GLQ
         mOuEIfwFM5tjyVyxaMYUH2bRafUMo1DrjeOnIgV/SgJIuLJONqvoYS7mABTuyXKiFS47
         qv+rKih8XH2HHt5tTdMlVpLQ2PwtQqCf0+iw/WtqpQ5YMtnHCDbVlKTrw2GwybvJ/wfg
         tRauBMFLsYPpeyUeJno5oTZkYlfghF8oQlGejTMTWDycQTxPLLmqCC1UXlPbPezIV0HU
         1r9Q+7NkMm581zL47MbiZ5Y9KUBM5clPeREm3nf9vfUP+BPAO6ImMAdK+7tcmXDvvyKl
         y+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617738; x=1794222538;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kogwx6wOFEx8wkc1OUmn08NcuZSkF+8EZ7OoR4vifO8=;
        b=DGkufE87mIN+FtozfiX9FzuMXZoSxytv+ps3vsACaVFN5ULOK30MC2bGF+jOT9T99Q
         srprSiDjXk6o9CQuzcFXvkmNDd8AkfeYnOSW4HX8uNi0W75XZozBaVBtvl/kp0jpf2I6
         rbnNlZFsfAn73Yh+FYU5y3pNkYI/y0AikJx2BcG67MtacRD8wot99+OgupnAEIrdDmQk
         OFcD5Hz0RB522SAaPAAfEAcZ2paoNVppS3fjZSgkAncmC0owUDubdmngYK7MwAxzWtO5
         ym8lvb4pdaP473Zm4TCK5rnX+O8SWo9EsD2sNmYhJSq5iw7f0jOem0pQFVwfIhO1XtZv
         mpxA==
X-Forwarded-Encrypted: i=1; AKwUvBxgcxkjrLdvlic4F9QrYYbaXnoqDZzXOxhEYJ5xi4JCTTWEVe0yBNJSpsIAxS7WjPoVwj/l9/CaK8rxw+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2o28guA9BYESkAJ/G4Dox9r9iIs5dF00G4kyaClnvh1M3ExZk
	tpEXrZk1BZ3GetmUA+Mcv/htE4t5AC5Ryg2Z0Ei5FT8h7VGDBMxnMF99
X-Gm-Gg: AYBFou1zl/wAdZZQxUhl0rdCPxOS4d2jAm1AYBOlrrVKH+XTVow6BiQHcSX0RVvu+d4
	vOxFEaY/sUwGRAW1qmo9OcZ6rgbWUSeCJ3uXQmukX8kI2eN7EFPBZN3Dos+v2PAFtttfDyLFyp6
	WmD/r4ojZfTzb3DclHDdGhbLZyT01CeF4/zyy+JPShz1Aeo6YgI2d4+xaEWU4IV+SOFHZlpInog
	bYzMF1JLd/UfDXSeId3orHYD+Ko5alULI3vzGGa5fS90IgRpAtsuLJ5bllvJcZkic4Z42yEwdks
	1G9VoMwCnjTSzwu1PVVDcfgRwbTVkgaDFd8G4vOQuH0gA/JdLxd5iANqsIVlFV9zCIIO8v5nJ5b
	KDYHCQOthxQghSLK4iqKYQQxg+T5or7OIOGQTVFiluumarzecMBb1Zdo60fxORhsbYz2IxXFMBt
	YJFAhkKSgOl5JYIxz62N11c+N153d2QBgSRnQU0xafbvQLJxbnQtqFzSBiI0csouo5awnh/mRrf
	vQ+O6J81vHgnRHwWEzhMegplqrCkSwux2RjqgwSevj0DYRGNModHTrLqd1qa/BPgcLjx9ycDrOe
	wffSrTHROKPt62cSPiKFr1jGmVhvX6bP2kDYCmnGdg0DMiXZvwIAj/r9NEf1MyBB72/yn27EdU5
	KGoTCVxUOkIAM/4OrHGqnQg2OfvIskiSz0Z5AiE+KNcKw/RAzAWdamfb8BwKB0w9hqgFaHvqimH
	GaeFtmDN8iaA8eAZ6nSxxRUb0XB0XauAjyw7ze3t8JhXoYAzywkQ1rcc59+gqDJS4=
X-Received: by 2002:a17:907:7fa5:b0:c40:eb1a:4c8b with SMTP id a640c23a62f3a-c4ca7a6d245mr730198166b.29.1793617738242;
        Mon, 02 Nov 2026 03:08:58 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe93db0sm364494766b.66.2026.11.02.03.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:08:57 -0800 (PST)
Message-ID: <a8fb3606-017b-464e-a09f-1f1ddf3bc45e@gmail.com>
Date: Mon, 2 Nov 2026 12:08:57 +0100
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
Subject: Re: [PATCH v2] blk-mq: fix out-of-bounds read in blk_mq_free_rqs
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>,
 Ming Lei <ming.lei@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 syzbot@lists.linux.dev, syzbot+e90526cab23b9efcd03c@syzkaller.appspotmail.com
References: <20261014170538.1089448-1-krystianmkaniewski@gmail.com>
Content-Language: en-US
In-Reply-To: <20261014170538.1089448-1-krystianmkaniewski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 19:05, Krystian Kaniewski wrote:
> A KASAN slab-out-of-bounds read can occur in blk_mq_free_rqs() when there
> is a mismatch between the number of hardware queues allocated for the IO
> scheduler (et->nr_hw_queues) and the number of hardware queues in the block
> tag set (set->nr_hw_queues).
> 
> This mismatch can happen if blk_mq_update_nr_hw_queues() fails halfway
> through (e.g., due to memory pressure during
> blk_mq_prealloc_tag_set_tags()). In this error path, the elevator is
> restored with a larger number of hardware queues than the block tag set
> actually has.
> 
> When the elevator is later freed, blk_mq_free_sched_tags() iterates up to
> the new et->nr_hw_queues and calls blk_mq_free_rqs(). In blk_mq_free_rqs(),
> it attempts to access set->tags[hctx_idx] to get the driver tags. Because
> set->nr_hw_queues was not updated due to the earlier failure, set->tags
> still has the old (smaller) size, leading to an out-of-bounds read.
> 
> BUG: KASAN: slab-out-of-bounds in blk_mq_free_rqs+0xde/0x680
> Read of size 8 at addr ffff88818d67fc28 by task syz-executor117/5839
> Call Trace:
>  blk_mq_free_rqs+0xde/0x680
>  blk_mq_free_map_and_rqs+0x40/0xf0
>  blk_mq_free_sched_tags
>  blk_mq_free_sched_res+0xeb/0x280
>  elevator_change_done+0x1d2/0x5c0
>  elevator_change+0x34f/0x480
>  elv_iosched_store+0x504/0x630
>  queue_attr_store+0x207/0x2b0
> 
> To fix this, explicitly check if hctx_idx < set->nr_hw_queues before
> accessing set->tags[hctx_idx]. If hctx_idx >= set->nr_hw_queues, the
> hardware queue doesn't exist in the tag set, meaning there are no driver
> tags to clear mappings from. In this case, safely set drv_tags to NULL. The
> subsequent call to blk_mq_clear_rq_mapping() already handles a NULL
> drv_tags pointer and will safely return.
> 
> Fixes: 04225d13aef1 ("block: fix potential deadlock while running nr_hw_queue update")
> Assisted-by: Gemini:gemini-3.5-flash Gemini:gemini-3.1-pro-preview syzbot
> Reported-by: syzbot+e90526cab23b9efcd03c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=e90526cab23b9efcd03c
> Link: https://syzkaller.appspot.com/ai_job?id=827b5760-86a0-4f44-9c69-430b572eac12
> Reviewed-by: Nilay Shorff <nilay@linux.ibm.com>
> Cc: stable@vger.kernel.org # 6.17+
> Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
> ---
> Changes since v1:
> - Drop the additional blk_mq_alloc_rqs() claim, as that path is bounded by
>   set->nr_hw_queues.
> - Add Nilay's Reviewed-by tag.
> - Rebase onto current mainline and refresh the recipient list.
> 
> v1: https://lore.kernel.org/all/c92b0c7e-17fb-44c8-99d9-59d45004d05a@mail.kernel.org/
> 
>  block/blk-mq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 025a799f35b92..259a5705efb79 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -3484,8 +3484,10 @@ void blk_mq_free_rqs(struct blk_mq_tag_set *set, struct blk_mq_tags *tags,
>  
>  	if (blk_mq_is_shared_tags(set->flags))
>  		drv_tags = set->shared_tags;
> -	else
> +	else if (hctx_idx < set->nr_hw_queues)
>  		drv_tags = set->tags[hctx_idx];
> +	else
> +		drv_tags = NULL;
>  
>  	if (tags->static_rqs && set->ops->exit_request) {
>  		int i;
> 
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
Hi Jens,

A gentle ping on this fix. The patch has Nilay's Reviewed-by, and
syzbot CI tested v2 without finding any issues.

Please let me know if any changes are needed.

Thanks,
-- 
Krystian Kaniewski
