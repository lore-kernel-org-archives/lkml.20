Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793764925;
	b=g7OXwDIlnj1GtyiRE25YJM3YNl3ncQUGyMgFOivRFkAGlcUHIi1svuXxqeSixArYVxKk
	 Wmj/vN0B89R+BBCYWeUWT7Umyi0P2b7d6Zrjzw2i3K4pGDr9eFY7i9agdzbvDUuC0q2nC
	 d252AKSjpb7WTzuZX/ZfmwVDYExHtfSlXl2nn81JFxvLxpDVXA8DamzS/B0gRIVEORbmB
	 TpBWDD5s2mZ5sj1SafXp6SzzHyCapherZgaEUk5w9OilnuW9hTRnOfO41libz3SgJQa0q
	 +XvSTrCEwrJPVJ40DeBnT0JG18XoYreSvjxBVYSrA95/0W+ZG2kyU3LnCdT1iiUe7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lZNKZ1iGqEzwGtaZav+D5kkPTnq7sCsxBbTcImnHm48=;
	b=fr7bdzC2++e/16fyJ928bs22pZ/io/sXIIh8QSdRp72w4ZygBVuQ9xhjuWTA73t/NVBR
	 UKU2WTJ6TuAxpGUX+pHda6WiicRL/lsixWKx0IkhrJLJdqoO4M05ybiVarbmjfF0HIPjS
	 cLYS1uW3gXTm+Bi4yZFLkZzSwuFpvUgaYA9rduDf0+oIePhjGddMznIGqXdsiiPx3aObo
	 3yrevpLwbqvb/0rLJyU+8HN9HaLEoRALygQbthkL4RbaEXZ8DhzoGgk3WIuJrf5AxVsGC
	 l+RiGFU/NmGQfb6c472gInTlIQY7b+bGCbxwc+evIzcT4GlRg++nulcvC+tt1xytBUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DT/PzmJz";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C259C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C259C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DT/PzmJz
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso95406b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793764924; x=1794369724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZNKZ1iGqEzwGtaZav+D5kkPTnq7sCsxBbTcImnHm48=;
        b=DT/PzmJz6iXTIH3eH8qxmQYGC3torY5BgNYOYU21FHiVW3Uy0FtH3+f0Ia+5pvGBGp
         GgoOfDe9HPYslzeoTHFIBXCLRGpeEMWjGVVP2mVg8bJgB3duhgumzyrVN+S3Q6Se0TrX
         L2b3/F9JWmq0v4Wlp5dvl7+D2K7Pry5WeknEyMjLIBHElJOfXXDl1EoJbWve6ND67/Ho
         yR0Yo2VlGZLjAL9MI/9pekxiFuyB2dQudGg/U+zixjE3rJgCo8hGOK57S7B1lFsU9pyC
         GouToCPHRmae+NOO9QoLyahtLyISHqj6OVVJ7V+FZRreYowc9w3Wo5g3v+TrSthZRSmR
         haEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793764924; x=1794369724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZNKZ1iGqEzwGtaZav+D5kkPTnq7sCsxBbTcImnHm48=;
        b=Rwbey3japt1xV5XRORxQC4RkxSNXhZO6Yr8tMVM2VkS0h09rlctuNn0yCIpwRIN3zi
         ge4PIQI1LYs+O+dUNnnTMB5OlWhNkTUfkSnfSjd0TdXXeNW1k4KPVbjKH5a4zRlesV6L
         ytxdYPKwy8pw3qnYeP7lq8pEyitcMLUu08gBIhb0PQ0X2vIkW8W3sGWnBEWxZUimhqeR
         MWz2mR+IYCO7J3KEcGrRTzIo86c9G8AtyQiwn8fPSJDem8X57pwbKqrWvuM0tZR8n8Yg
         kx1sxVig4PP2d5NuLKXDGO0/05SW0u79iUg81X1tx21catgpCgd7MOAWJmzgeJ3GTMpo
         p3Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzEe498GzxKjoGz+hD6C/s5Oj6bCMpUQj5jEKr5208PhDBhZtC6SqetsNKbOySzU8NdgPPm2pVUeCk626c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fjDUCBmEI+LgCEO0B5eKpLNpYdD5hQQO4P33KQjo+nHic84Zo
	qIoVfhai/ThJZE4ckC/KQ20kFi9n6Q2jhytIEh4opzYljuIaLdLX7woQGUMu4s5sAT+bgg==
X-Gm-Gg: AYBFou2nHZlbAIK4YX4SnSwOy3Tgw1jiHdek/r2kjhYnv91xsau9dMU4iqTFFHxNUkf
	ZY/5RFbPkIB6ol9tbitXGcw6Lu5cJ7nk4+aEsyEYhnUYHvb7cBsdg6AjelzV3b5Q7o9fcah8PEA
	NHVopdwNsIbfyXuEOSK0GSuhlsBUXbdvlR3Zw0PBpJCTlmh3Fbahg8tpfRXGWWNpI9IJH+ZnrBv
	qap5ks3Vn0+5TddlGlGB8p8L4BdoPkARwak/1TUyGAGnnBLbhMMet3H1Elqyk06aZ+NqGM4SdIJ
	5/hIWRraKi6WFZx9Ai1KFoFVym9d/xG6rVp0S2G0h1wjxxRDLhP4Sn/oXXhUkcalbgf9P03Dulp
	vV+cM29hCglj4Fty/2hrvkYcIrZ9LW2cBkkI9TetWnsolyPYgCfS3bFiOQBZr7zfOJ+nn62QOO2
	cxwj7i6QPLLj6MxElQMrcqZelWUQpH/WQxAbo5UnEgYrtk2goCIAPfBL3Wn0Y1FmP4COlVTH7Ln
	j9swRvNJragXIStVymj6yI0H4nQCoYTNt07JnC667sRJxyotQjHf2RCePuhn24O/O14I78HgTiZ
	Cq6hJxBs75sT48H1n6S8scqlG+3orRdMUV6SrWeoTaM=
X-Received: by 2002:a05:6a21:7309:b0:3e2:490d:5127 with SMTP id adf61e73a8af0-3e928a86e51mr13327063637.2.1793764923903;
        Tue, 03 Nov 2026 20:02:03 -0800 (PST)
Received: from gmail.com ([183.13.19.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09ba4f45esm292653b3a.45.2026.11.03.20.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:02:03 -0800 (PST)
Date: Wed, 4 Nov 2026 12:01:58 +0800
From: Yonghao Zhang <hyz3367@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] remoteproc: core: Roll a failed attach back with
 detach() when available
Message-ID: <20261104040158.ddydw7d5smp7vope@gmail.com>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
 <20260929075453.2324597-4-hyz3367@gmail.com>
 <atZQEuXMwMpvmoBz@p14s>
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
In-Reply-To: <atZQEuXMwMpvmoBz@p14s>

On Mon, Oct 19, 2026 at 11:14:58AM -0600, Mathieu Poirier wrote:
> @Arnaud Pouliquen - please review this patch to make sure it doesn't break
> STM32.

Hi Arnaud,

Mathieu asked for a STM32 point of view on 3/4. The patch does not touch
stm32_rporc.c, but it changes which callbacks the __rproc_attach()
calls when the subdevice registration fails after attach() succeeded.
On STM32 that unwind currently runs:

    stm32_rproc_stop():
      mbox_send_message(STM32_MBX_SHUTDOWN, "detach")
      stm32_rproc_set_holdboot(true)
      reset_control_assert()                  -> the core is reset

and with the patch it would run:

    rproc_reset_rsc_table_on_detach():
      restore the pristine resource table in remote memory
    stm32_rproc_detach():
      mbox_send_message(STM32_MBX_DETACH, "stop")
      stm32_rproc_set_holdboot(false)         -> the core keeps running,
                                                 auto-reboot allowed

with the rproc left in RPROC_DETACHED, so the next rproc_boot() attaches
again instead of reloading firmware.

I have two things that can't verify from here:

- whether the firmware copes with the detach notification at a point
  where the virtio devices were only half-registered, and 
- whether releasing holdboot, allowing the remote to auto-reboot, is the
  desired outcome of a failed attach on STM32.

For reference, the sequence was exercised on an Allwinner T153 with an
E907 core: a failed attach unwinds through detach(), the processor is
re-attached and rpmsg traffic resumes.

The other .detach implementations in tree (ti_k3 dsp/m4, xlnx_r5,
imx_rproc) are no-ops or plain dispatchers, which is why the question is
really about STM32's holdboot/mailbox semantics.

Thanks,
Yonghao

> 
> On Tue, Sep 29, 2026 at 03:54:52PM +0800, Yonghao Zhang wrote:
> > When the subdevice registration that follows ops->attach() fails,
> > __rproc_attach() rolls back with an unconditional ops->stop() call.
> > That is wrong on three counts.
> >
> 
> It isn't wrong, simply implemented during a time where any kind of fault in the
> attach()/detach() scenario called for a stop().  I would certainly appreciate a
> less reproachful tone.
> 
>  
> > An attach-only implementation, one without stop() such as
> > commit 1168af40b1ad ("remoteproc: k3-r5: Add support for IPC-only
> > mode for all R5Fs"), dereferences NULL right there.  A processor that
> > is being attached to was started by another entity and is not ours to
> > power off: detach() is the matching undo of attach(), and stop()
> > should only be used as a last resort, when there is no detach() or
> > it fails.  This is reachable today: when the re-attach of an
> > RPROC_FEAT_ATTACH_ON_RECOVERY processor fails (imx_rproc and
> > xlnx_r5 use the feature), the unwind stops a processor which,
> > per the feature's own contract, "does not need help from Linux to
> > recover... Linux just needs to attach".  And the unwind leaves
> > the accounting inconsistent -- no resource table bookkeeping
> > is done, unlike on the rproc_stop() and __rproc_detach() paths,
> > and a processor powered off through the fallback keeps its
> > RPROC_DETACHED state, so the next rproc_boot() tries to attach to a
> > core that is no longer running.
> > 
> 
> Remove the above paragraph.
> 
> > Roll the attach back with detach() first, along with the same
> > rproc_reset_rsc_table_on_detach() bookkeeping __rproc_detach() does,
> > and fall back to stop() only when detach() is unavailable or failed.
> > A failed resource table reset does not abort the unwind: this is an
> > error path, and detaching from the remote processor, or powering it
> > off as the last resort, takes precedence over the bookkeeping.  A
> > successful fallback moves the processor to RPROC_OFFLINE so the next
> > boot reloads firmware instead of attaching to a dead core;
> > implementations with neither handler keep the processor running and
> > untouched, which is all an attach-only core needs.  The rollback is
> > factored into rproc_unwind_attach().
> > 
> > The unwind runs the same resource table resets as the detach and
> > stop paths, which free clean_table and leave a cached copy of the
> > installed table in rproc->cached_table.  Make rproc_attach()'s error
> > cleanup, which runs right after, null clean_table after freeing it
> > and release that copy along with table_ptr, or a failed attach
> > double-frees clean_table and leaks the copy.
> > 
> > Fixes: d848a4819d85 ("remoteproc: Introducing function rproc_attach()")
> > Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 65 ++++++++++++++++++++++++++--
> >  1 file changed, 62 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 19e0ea3e7240..c52212a1d180 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1348,6 +1348,59 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  	return ret;
> >  }
> >  
> > +static int rproc_reset_rsc_table_on_detach(struct rproc *rproc);
> > +static int rproc_reset_rsc_table_on_stop(struct rproc *rproc);
> > +
> > +/*
> > + * Undo an attach whose subdevice registration failed.  The remote
> > + * processor was started by another entity and is not ours to power
> > + * off, so roll back with detach() when available and fall back to
> > + * stop() when there is no detach() or when it failed.  stop() is
> > + * the only rollback that does not rely on the remote side.  A
> > + * processor powered off through the fallback is marked RPROC_OFFLINE,
> > + * so the next boot reloads firmware instead of attaching to a dead
> > + * core; with neither handler there is nothing to roll back with and
> > + * the processor is left running.
> > + *
> > + * The resource table resets are best-effort: when one fails, the
> > + * unwind carries on with detach()/stop() anyway.  Unlike
> > + * __rproc_detach() and rproc_stop(), which bail out before touching
> > + * the processor when their reset fails, this is already an error
> > + * path, and detaching the remote processor -- or, failing that,
> > + * powering it off -- is the minimum it must still deliver.
> > + */
> > +static void rproc_unwind_attach(struct rproc *rproc)
> > +{
> > +	struct device *dev = &rproc->dev;
> > +	int ret;
> > +
> > +	if (rproc->ops->detach) {
> > +		ret = rproc_reset_rsc_table_on_detach(rproc);
> > +		if (ret)
> > +			dev_err(dev, "can't reset rsc table on detach: %d\n",
> > +				ret);
> > +
> > +		ret = rproc->ops->detach(rproc);
> > +		if (!ret)
> > +			return;
> > +
> > +		dev_err(dev, "can't detach from rproc %s: %d\n",
> > +			rproc->name, ret);
> > +	}
> > +
> > +	if (rproc->ops->stop) {
> > +		ret = rproc_reset_rsc_table_on_stop(rproc);
> > +		if (ret)
> > +			dev_err(dev, "can't reset rsc table on stop: %d\n",
> > +				ret);
> > +
> > +		if (rproc->ops->stop(rproc))
> > +			dev_err(dev, "can't stop rproc %s\n", rproc->name);
> > +		else
> > +			rproc->state = RPROC_OFFLINE;
> > +	}
> > +}
> 
> 
> Please remove all the dev_err() above.  An error messages are already generate
> in __rproc_attach() when something goes wrong.
> 
> > +
> >  static int __rproc_attach(struct rproc *rproc)
> >  {
> >  	struct device *dev = &rproc->dev;
> > @@ -1373,7 +1426,7 @@ static int __rproc_attach(struct rproc *rproc)
> >  	if (ret) {
> >  		dev_err(dev, "failed to probe subdevices for %s: %d\n",
> >  			rproc->name, ret);
> > -		goto stop_rproc;
> > +		goto unwind_attach;
> >  	}
> >  
> >  	rproc->state = RPROC_ATTACHED;
> > @@ -1382,8 +1435,8 @@ static int __rproc_attach(struct rproc *rproc)
> >  
> >  	return 0;
> >  
> > -stop_rproc:
> > -	rproc->ops->stop(rproc);
> > +unwind_attach:
> > +	rproc_unwind_attach(rproc);
> >  unprepare_subdevices:
> >  	rproc_unprepare_subdevices(rproc);
> >  out:
> > @@ -1562,6 +1615,7 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
> >  	 * rproc_set_rsc_table().
> >  	 */
> >  	kfree(rproc->clean_table);
> > +	rproc->clean_table = NULL;
> 
> This change is not needed.
> 
> >  
> >  	return 0;
> >  }
> > @@ -1597,6 +1651,7 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> >  	 * won't be needed.  Allocated in rproc_set_rsc_table().
> >  	 */
> >  	kfree(rproc->clean_table);
> > +	rproc->clean_table = NULL;
> 
> 
> This change is not needed.
> 
> >  
> >  out:
> >  	/*
> > @@ -1675,6 +1730,10 @@ static int rproc_attach(struct rproc *rproc)
> >  	/* release HW resources if needed */
> >  	rproc_unprepare_device(rproc);
> >  	kfree(rproc->clean_table);
> > +	rproc->clean_table = NULL;
> > +	kfree(rproc->cached_table);
> > +	rproc->cached_table = NULL;
> > +	rproc->table_ptr = NULL;
> 
> ->table_ptr doesn't need to be set to NULL.
> 
> Thanks,
> Mathieu
> 
> >  disable_iommu:
> >  	rproc_disable_iommu(rproc);
> >  	return ret;
> > -- 
> > 2.34.1
> > 
