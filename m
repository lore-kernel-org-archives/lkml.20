Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997469;
	b=AYPlRfmkyASZtkKNqSlrnBaJjfxdtVb0jvfdQk3AUTHHfXFNeDd/m1/CPa9E9Aik/3Lo
	 gfGmVfOEqwBnu+NuECGxzsSR4lAz+7js9GnE+eLDGa2MDz06bBSEHTI8V3ZEQXQ6PXEeN
	 CggNuAqbD8SLqDSBNjWb4e/dQyFGMMAnxI0rJ4sld/dMindx9AN7XDsyP5moW0iHEB2oH
	 RJ21RgaJvqfZ0hXWHl0thLrM5upmi1OafqgUVzoBccBz02iay8jXfTtLFkNnkOvm/qqHo
	 4TE6s3tpkLqnfu1Sns1CsuyQRXJ1f07zr7TZ2PhDWbcxYbqbC2N0qgK9B8GViCqijcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0j1HbGy7SxsAlSqhArcwYTwwZPIic+C0p0uOLAj5YQ0=;
	b=Xs4CSlVwWkcEJPz7g/uXAlFBMRLTOcHSs/dKAhB5llW8VFNn2/lncOrMzwZywkax4jfN
	 dPM+b1ZJu3l6G0FEKJycmKdGKisPslE66GQKZhrqDBaLi1s/uz0WM1oPSWmZkj82dIFh/
	 s2ZJR9VDBy3GIqjuAmBU+wFx0oq0ZJmzihTF7KgCc4nBHyrbuIQJx98QQxI7XyfmOLiyJ
	 4RZb/XveQAO9Pr5twvi67vSkDEYVdEzpcWu7VSP2ctI8j3xOs07kjA0AgL7PzknShaIXj
	 gjkRxmusp7+RJQ+ucQJB+xLl+0O7zv3IHoeSSgikrp1Y7LkASWjn+pjIjmTrutf4D2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="APuzZa/l";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946CF606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946CF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=APuzZa/l
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1487316f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792997467; x=1793602267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0j1HbGy7SxsAlSqhArcwYTwwZPIic+C0p0uOLAj5YQ0=;
        b=APuzZa/l+iomygd2XnB1OLwxTWnBFALEW+WLtwiqq4qGZV2D7ZUvt830TlaSSiUq01
         elOJDygunaN8Ek6VZ1ub2l4QUzb+L9/e4XityPv8VOMW9eZTRaKXU0VSmqo+BEdrCraB
         hWff7GwMEj2QX0uYmCo/UyUSjfgdo+Ke+Ehniwsn4eNe7Uh4FARktmiwemjusGCN5DAA
         cSdBoktwOP7Er37FSibtG21hWNBslEnxqitV/REjFbToHI7nlDmmBbuCqPgurxA/41ge
         RS7Ne8RRlFtouPY0bK9LNCXVIYkRnJoJ1mNe+62N+0ABF4Roz0MfFQu922YnSwD0xEYm
         rVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997467; x=1793602267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0j1HbGy7SxsAlSqhArcwYTwwZPIic+C0p0uOLAj5YQ0=;
        b=M/zkrkzKOfIrMBfxQZ9yQqTS/KiP6OGU4DBP5wieWWlW2mxPhIhH897hU4en2x8gUX
         mHlEwaUbbaufkSHKeU+9aZyR40B5h930OjrP8nW766PdPOTV+KKis18wkZGdUwc9EWQH
         WEOYZMyvbapvjQa+/7/TY6TBRFCc9RyK1531ToXSHustNq0J4QakU7OUazjTYmcPhxOK
         Vpc7Yfq5ZK+TSbGYNeOKLDaO41W9NWy8xq6XMUkGimxxzZ9/p5/rND0vFwApjxT/3UMa
         IGW7NRFI6KvXRML4Fb0fUvzfqx+2bhxaGaCDkgQC8HsBtz/CbhP5CuyqMgG6UaNOHk/T
         n8RQ==
X-Forwarded-Encrypted: i=1; AKwUvByMD2Jkdmi0nBBxULM92bPbD3B2Pyyg3CKFiQEJtnXYmbYh0tmqe7VDXZ0Mic8v29n7s9khnrI2Bdjcl00=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYzET5g3G9K8LHKlZDo7Ktpor2IA4X9PI9iK2I2bREXIODztAl
	HeQuXiz83JFTwQLIYLsQCbqVW4MhRPFgtzqnBap5cxCa9B/cSWimdNtNUotzNVU5uyw=
X-Gm-Gg: AYBFou1Vw032xe+jBltwy9C+byY83fGr2sQp0k8zNVIcEbe+6f2cYfjxr3/YD5XmGWT
	5K7rdjG3CoxSkbvk5r1r/ljM3wSoqvIaRPXjmSi1/CCwGMcWIvLODAF2lUyXAMYbLG5pFNghAne
	OyAt85pn7axsGILY1RfZ52N20IGa7820m4zBirWVCbywIex12mkgfkVnW/jUvHBOF1KxSFXkfVq
	GM9Mjz3+jHusgPxSPqnGw45SBbFV72Mrwv6cefLy4SuOCgx6+uGw5IW6NRh0oWulURDq2BX0kCN
	5g84mLg1evU04ETI388KLxZJh5Xd9pkEAl7wXtdaCDhBJnYWzKfzbs5vwgQdkDzt27bhu61Mqb7
	8Lg9x5Zof41OzAfCJdXoNJXFKRC4Oe5c9xdUV5hKCbs7LALsG08GZoSitDywDfjohKVm5bgwJRP
	bDpwpRRfwrkMPicN4TvA1KdmNtt9TbmB9cH/qyHjEdMcnaS0dKORNYDIxr2bi71AIROkBl3krDD
	xz362TuJB0zu6WSUiz8e3Lis7xN+bKMnGpfAKgKVQz1Sqv8N1VDCx4J6AC9ZdM0P3YIQ0YEQKl3
	/jzrPmhApR08BPSl
X-Received: by 2002:a5d:6f0c:0:b0:48e:1d81:5b86 with SMTP id ffacd0b85a97d-48e3eb9b259mr9504623f8f.52.1792997466877;
        Sun, 25 Oct 2026 23:51:06 -0700 (PDT)
Received: from ?IPV6:2001:a61:2a62:aa01:5ada:99ae:a1fe:1f54? ([2001:a61:2a62:aa01:5ada:99ae:a1fe:1f54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm14523532f8f.50.2026.10.25.23.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:51:06 -0700 (PDT)
Message-ID: <8b0665bc-7962-4803-9904-26815a6594b8@suse.com>
Date: Mon, 26 Oct 2026 07:51:05 +0100
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
Subject: Re: [PATCH v2] scsi: aic79xx: Fix NULL pointer dereference in device
 reset
To: Andrew Luebke <andrew.luebke@gmail.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023170330.269844-1-andrew.luebke@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.com>
In-Reply-To: <20261023170330.269844-1-andrew.luebke@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/23/26 7:03 PM, Andrew Luebke wrote:
> Commit c67e63800446 ("scsi: aic79xx: Do not reference SCSI command when
> resetting device") makes ahd_linux_dev_reset() build its TARGET RESET
> SCB with io_ctx set to NULL, but the function still calls
> ahd_set_residual(reset_scb, 0) a few lines later, which is
> scsi_set_resid() on the NULL command. Every call of the device reset
> handler therefore oopses and kills the SCSI error handler thread; all
> further I/O on that host hangs until the machine is power cycled.
> 
> Hit on an Intel SE7501WV2S board (on-board AIC-7902, i686, v7.2.9) when
> a failing Ultra320 disk made the error handler escalate to a device
> reset. Both disks on that channel then stayed in D state:
> 
>    sd 1:0:0:0: [sda] tag#287 Attempting to queue a TARGET RESET message:
>    BUG: kernel NULL pointer dereference, address: 0000009c
>    #PF: supervisor write access in kernel mode
>    EIP: ahd_linux_dev_reset.cold+0xee/0x26e
>    Call Trace:
>     scsi_eh_ready_devs+0x538/0x8d0
>     scsi_error_handler+0x3a2/0x3b0
>     kthread+0xd2/0x120
>    note: scsi_eh_1[78] exited with irqs disabled
> 
> (0x9c is resid_len in struct scsi_cmnd on i386.)
> 
> Making that call safe is not enough on its own. When the target accepts
> the reset, ahd_handle_nonpkt_busfree() (or, in packetized mode, the task
> management completion) calls ahd_handle_devreset(), and its
> ahd_abort_scbs() walks the target's pending SCBs - the reset SCB
> included - reading and setting their transaction status and freezing
> them through the wrappers in aic79xx_osm.h, which dereference io_ctx.
> The same walk runs if the reset times out and the error handler
> escalates to a bus reset.
> 
> Commit c7f4c5dec651 ("scsi: aic79xx: Fix up NULL command in ahd_done()")
> taught ahd_done() about the NULL command, but not these wrappers.
> 
> Let every accessor that dereferences the command accept an SCB without
> one. The ahd_cmd_*() helpers for the transaction status and the SCSI
> status check for a NULL command: the transaction status then reads as
> CAM_REQ_INPROG and the SCSI status as SAM_STAT_GOOD, and setting either
> does nothing. ahd_get_transfer_dir(), ahd_get_residual(),
> ahd_set_residual() and ahd_freeze_scb() have no such helper underneath,
> so they check scb->io_ctx themselves: the transfer direction reads as
> DMA_NONE and the residual as 0, while setting the residual and freezing
> the SCB do nothing. The ahd_set_residual(reset_scb, 0) call in
> ahd_linux_dev_reset() is then harmless, and the reset SCB completes
> through ahd_done() as that commit intended. The SCSI status, residual
> and transfer direction accessors get the check so that none of them can
> be handed the reset SCB and crash; the only path from the reset SCB to
> them that is apparent is ahd_handle_scsi_status(), should a packetized
> LUN RESET end in a status error.
> 
> ahd_perform_autosense() also declines autosense for an SCB without a
> command. Otherwise a target that answered the reset with CHECK
> CONDITION would have the reset SCB requeued for REQUEST SENSE, and with
> negotiation pending ahd_handle_scsi_status() clears SCB_DEVICE_RESET on
> the way, so ahd_done() would later dereference the missing command.
> Declining leaves such a reset SCB to the reset timeout and the error
> handler's escalation, which completes it through ahd_abort_scbs().
> 
> Tested on the SE7501WV2S with this patch applied to v7.2.11 (i686), on
> the disks of its second AIC-7902 channel (160 MB/s DT, not packetized).
> Device resets sent with SG_SCSI_RESET_DEVICE to a Seagate ST373453LW log
> "Bus Device Reset Message Sent" and "Device reset returning 0x2002"
> (SUCCESS), three of them while the disk was being read; the reads
> complete, scsi_eh_1 survives and the disk keeps working. scsi_eh_1 also
> survives a device reset of the channel's other disk - the one behind the
> crash above, which accepts the reset but no longer spins up - and a bus
> reset sent with SG_SCSI_RESET_BUS, after which the first disk still
> works. The device resets go through ahd_handle_devreset() and
> ahd_abort_scbs(), so they exercise the transaction status and freeze
> accessors on the reset SCB. Not tested: the packetized (IU) LUN RESET
> path, a device reset that times out and escalates to a bus reset, and
> the autosense change, since a target here answers TARGET RESET with a
> bus free as SCSI requires. The oops was not reproduced on purpose on an
> unpatched kernel; the crash above came from the failing disk.
> 
> Fixes: c67e63800446 ("scsi: aic79xx: Do not reference SCSI command when resetting device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
> Assisted-by: LLM
> ---
> 
> Notes:
>      v2:
>       - Keep ahd_set_residual(reset_scb, 0) in ahd_linux_dev_reset(): with
>         the check in ahd_set_residual() the call is safe, and the patch now
>         touches only aic79xx_osm.h (Hannes).
>       - Move the NULL checks for the transaction status and the SCSI status
>         into ahd_cmd_set_transaction_status(), ahd_cmd_set_scsi_status() and
>         the two ahd_cmd_get_*() helpers (Hannes). ahd_set_residual() keeps
>         its check in the SCB wrapper: it calls the midlayer's
>         scsi_set_resid() directly, with no ahd_cmd_*() helper underneath.
>         The same goes for ahd_get_residual(), ahd_get_transfer_dir() and
>         ahd_freeze_scb().
>       - ahd_perform_autosense() returns 0 for an SCB without a command, so a
>         device reset that ends in CHECK CONDITION is not requeued for REQUEST
>         SENSE with SCB_DEVICE_RESET cleared (found by the Sashiko AI review of
>         v1).
>      v1: https://patchwork.kernel.org/project/linux-scsi/patch/20261020221530.2606178-1-andrew.luebke@gmail.com/
>      
>      This analysis, the patch and this changelog were prepared with an LLM coding
>      assistant (Claude Opus 5.5, Anthropic) at my direction; I reviewed them and
>      ran the hardware tests described above. Build-tested with W=1 for
>      x86_64 and i386 on mkp/scsi.git for-next (db8b4d2bf2d3): no new warnings;
>      checkpatch clean. sparse and smatch were not run.
> 
>   drivers/scsi/aic7xxx/aic79xx_osm.h | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
> 
Sigh. It is a really bad sign if the patch description is far longer 
than the patch itself. Might be okay for really intricate things, but
adding NULL checks to functions certainly is not.
But this doesn't change the validity of the patch, so:

Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.com                               +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
