Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810072;
	b=FNhwTNX9bfzPKClZjFV+EoVCQuWsM98kLO3FdisjZhGfPfNotDNW+WIDt2bkDSAP9GJ9
	 T9W0HJ2QM8vmuJiNTy1vULZj3hU87KFmP9zwJAgXwnxyjviWOOLknoVPLZm/0wKlGVd41
	 94Br8cl8NP2XUjw7QJescE9d1ka78hsK0Y0ofJ+dg51p1FGBw4L0TJF9TV6a03mDgEWYT
	 4lldaKiTEhzi1h7dPQTMky2Ivj2V4zHMG8Z2mgCnf8CXURblufu7+5y94pWso55UUAtNA
	 1Rtv2AQ4sM54oTwnl14VlXXnh22j4jgLCJw4ZlFZc2Hv5WFXWHpVzEBq+EEX+J7S41g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=2luSXqGaMFEbJZIPO87Oq4zjPba7p3fbczRKY5RBYMQ=;
	b=GtbRDpbqXyJI8VhwB7fpnbmcZtehEkWKmfmD/VXJLZuZ7S75rsAtk1zn3aeRM5gh4+4+
	 ee7hu6j4jmxGrSClc6Mdk06RVi5w0qNGCWxSHF2OMYmegrihwwMcI9CyYcqWY7jmQN2wk
	 oZTtjuoZAShNttyHSdA+70WYnewi6bS41UsBTUUCeHYaGwgKmqxDBN/QApJ2MglTXhDGI
	 2KiBBdFPQnQjh903UJAtP/kfxx5pGNUCBycDQmHEUgXOCc9HkG/5AXtVjOrxeJFcaQBeL
	 Vamfeoq/Ca59NUpvxgIYYUSYaH3ZVY8KCDAKkEFohqDxF8KZezcyrY7uq1nB1h8u74g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zfu3hJPI;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C35606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C35606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zfu3hJPI
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso5430185ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793810071; x=1794414871; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2luSXqGaMFEbJZIPO87Oq4zjPba7p3fbczRKY5RBYMQ=;
        b=zfu3hJPInROrcGwhTCH4qAf8TYKQqLCXkZvvY4+z4EWjyCDUcwqCdPpochYFHDjpbW
         rL8kj4qnZkP6J7DEBPOKo5Xsfhmbc3b/jLjOa1M72H3OmSNW8FYsJoyfLV3JzGUoHHyp
         7MmHcI48gitd2mYbrJejrZ3YRQ8GVDlh+P9eTT6AvExiNWRQBCmZNzDRBE7R/8bWBDGb
         y8cm9lv135IMRicWDsh37m74vVwP4IYsrS66K6qs2JcQiLPrvH1cSwAjbeL2biW4aCnq
         m62l4NVhwIC7e8U2K870Va5T6y54iF5uYPWRSR74+UbSLQSkH/5SDObJoHn8+GGEusy/
         x6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810071; x=1794414871;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2luSXqGaMFEbJZIPO87Oq4zjPba7p3fbczRKY5RBYMQ=;
        b=S7kYi4MsDZs0UraXOZh1Cmd1NDxEyQrarY+egv7RdfcufqCZ8Qre6/HExWEYupn5x6
         S0xvN/4wcLWJIPW0MM7xReGQ6PotpmuSuh2QjXG2S3vZ4DL3oZ92B4iy0+XR+IjgAEjD
         YHC6YkIRPrvZqxQhpXWlxCivQLRq74kLOMcXT28ufPa9ysFASjV03TPcF54Tb8NUD09L
         F0A78blcISBIbu53Qy9BtqMaE7ycJ+y11PLjbV1xJhNFJQvJ20wX+QXgimE+Ai6fa7YZ
         8wWuDNyCSluxeZt1OxvT2fo3jV3C2Y+KMugwV0XyLdtp6QJ+eZKT7QXrgJ8bos8Z+sd+
         /erQ==
X-Forwarded-Encrypted: i=1; AKwUvBworXk16v68BvZtpHxkfkKx6a+uz8a9K8JHTEhGUAI97hH+ymq2chXvpznylzu8QneCxrit8yWueRkl5PY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xrt6T969pnrcQfBZ49KaIrbo4M6Cke41BJRsriI6LQQEmtIO2
	97rR+Wr6lghWIlHUzCmx0Ly7v2ZE8KwEQ5gRvuq3yqeidhDwdirTF7Oh6Qttf0WLc/0=
X-Gm-Gg: AYBFou1h+V8Ilu4S/oXtbHwxYbVta7or/E/drdj5zgo7P+rs3rmkJPGmag0oPeB/Xf0
	BV5+yWUHKPjsEQwCBZry3ecvnKTZG2rbsGKzwLwJkBtjYA3BPvJXrbkJzUYYqH9MLJrZ7MghZZ1
	ef00J+ne17JKYvqUZ/HGT5llAKVclGyNqZ08C6FozBBd6Ncxa7i1SHYmrJqzQcUZUYuXwzcZ4hO
	cUfQbaj7T5o8k9qqlS94hb9aE4VtdxlSzi8MzCv23VLlAC0CUGbdH7IzElbVifsQVm0k3vGwhST
	sw6x16kRIy+WjD0n8ns+i3XRxZWvjU798JZLfKTcBn3uhrBVyELKjdzM4ax/r3jzMTZKIe8q/N3
	vMdZbqd+MBYxAFI86yFY/2/q78YYzW1a2Kbm3ZXoFKeZPXDL3iRuY7QT3wltpaaRaOQNwZNl3G/
	OoQWfo6X9W71ELVXSqmg7Ytv8YOyY3tEqUqYINp+9o/x+MqHEwULXwFH3nQi+Fjo/XrFL8e6KI3
	TkG6orSJrFs8XbggXRr0aBgFol9NwSDkVM4/y+bgSR+nAAvVU2idIa8FzfWhApd6TPEsTCr3Iff
	CzdYOuB4uxXYFNBP6oP6FBLkcT9LN98=
X-Received: by 2002:a17:903:1b25:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2eb3649bc17mr150573595ad.12.1793810070851;
        Wed, 04 Nov 2026 08:34:30 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:bbc3:cdac:2cd9:7fc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed088a624esm10252335ad.0.2026.11.04.08.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:34:30 -0800 (PST)
Date: Wed, 4 Nov 2026 10:34:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuqiang Sun <izaiahsun@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: core: Do not put the device when
 device_add() fails
Message-ID: <autelF5ReC1j7C5Y@p14s>
References: <20261029130037.5505-1-izaiahsun@gmail.com>
 <auoLrJPq9eRAbeQa@p14s>
 <CACdDPuwmyAjC3kje+nYJ3yz7RePg8JzXsKGkzx-Ksxb=-_CZ8A@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACdDPuwmyAjC3kje+nYJ3yz7RePg8JzXsKGkzx-Ksxb=-_CZ8A@mail.gmail.com>

On Wed, Nov 04, 2026 at 01:47:41AM +0800, Yuqiang Sun wrote:
> > Unfortunately I do not have the time to read through and digest what Claude has
> > generated in the changelog.
> 
> Sorry for the long content.
> There is a human-written summary about the bug.
> 
> > The documentation for device_add() is clear, and looking at the implementation
> > of device_add(), I understand why put_device() needs to be called here.
> 
> I agree that as documented in device_add, the put_device must be called
> if it fails.
> 
> But in st_slim_rproc_alloc() (drivers/remoteproc/st_slim_rproc.c), when
> rproc_add() returns the error, the driver calls rproc_free() at its err
> label, which is put_device(&rproc->dev). With the put_device() in
> rproc_add(), that reference is dropped twice, and the driver uses the
> rproc after it is freed.
> 
> The same happens in every other caller: xlnx_r5_remoteproc calls
> rproc_free() too, and the other 23 use devm_rproc_alloc(), whose
> devm_rproc_free() does it.
>

This is the kind of information that is useful to find in a changelog.

> That is why I did not change device_add() or one caller, but
> rproc_add().
>

I agree with your assessment.  The problem is that both success and error path
end up calling rproc_free().  I also agree with your (or the AI's) fix, but add
a comment in the failure path of device_add() that explicitly mention that
put_device() will be called in rproc_free() to avoid reducing the reference
count twice.

And please stop using AI to generate your changelog.
 
> If necessary, I can send out the full document and PoC on
> how to trigger the KASAN.
> 
> Thanks,
> Yuqiang
> 
> Mathieu Poirier <mathieu.poirier@linaro.org> 于2026年11月4日周三 00:28写道：
> >
> > On Thu, Oct 29, 2026 at 09:00:37PM +0800, Yuqiang Sun wrote:
> > > When device_add() fails, rproc_add() calls put_device() and then
> > > removes the character device.  The reference it drops is the one
> > > rproc_alloc() took with device_initialize(), which belongs to the
> > > caller: after a failed rproc_add(), every driver frees the rproc,
> > > either with rproc_free() or through devm_rproc_alloc(), and both drop
> > > that reference again.
> > >
> > > So the rproc is freed inside rproc_add(): by the put_device() itself,
> > > or, with CONFIG_REMOTEPROC_CDEV, by the cdev_del() that follows, when
> > > the character device drops its reference on the parent device.  The
> > > caller then uses the freed rproc and puts it a second time.
> > >
> > > With one allocation failure injected into device_add() (failslab
> > > restricted to rproc_add) while st_fdma probes, KASAN reports:
> > >
> > >   BUG: KASAN: slab-use-after-free in slim_clk_disable+0x38/0xf4 [st_slim_rproc]
> > >   Read of size 8 by task insmod/69
> > >   Call trace:
> > >    slim_clk_disable
> > >    st_slim_rproc_alloc
> > >    st_fdma_probe
> > >   Freed by task 69:
> > >    kfree
> > >    rproc_type_release
> > >    device_release
> > >    kobject_put
> > >    cdev_default_release
> > >    kobject_put
> > >    cdev_del
> > >    rproc_char_device_remove
> > >    rproc_add
> > >    st_slim_rproc_alloc
> > >
> > > followed by use-after-free reports in kobject_put() and
> > > refcount_warn_saturate() from the rproc_free() in
> > > st_slim_rproc_alloc().
> > >
> > > Remove the put_device(): the caller's rproc_free() drops the reference
> > > and releases the rproc, as it does for the other failures in
> > > rproc_add().
> > >
> > > The problem was found with kbound, a static analysis prototype that
> > > checks whether callers rely on an object after a callee returns a value
> > > for which the callee may have released it, on v7.2.12; it is present
> > > in rproc-next.
> > >
> > > Build-tested with x86_64 and arm64 allmodconfig (W=1, sparse): no new
> > > warnings.  Run-tested on QEMU's arm64 virt machine (TCG) with KASAN,
> > > using a device tree node for an ST FDMA with a SLIM core, so that
> > > st_fdma_probe() reaches rproc_add() without the hardware (no clocks,
> > > MMIO windows only mapped), and failing each allocation in rproc_add()
> > > in turn with failslab: before this patch every failure in device_add()
> > > (9 of 9) gives the reports above; with it nothing is reported, and the
> > > rproc is released once, by rproc_free().  Not tested on remoteproc
> > > hardware.
> > >
> > > Fixes: 7dbdb8bd7c02 ("remoteproc: core: Cleanup device in case of failure")
> > > Cc: stable@vger.kernel.org
> > > Assisted-by: Claude:claude-opus-5-5 kbound
> > > Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index b88bf179507d..e4f44a3c8b4d 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -2309,10 +2309,8 @@ int rproc_add(struct rproc *rproc)
> > >               return ret;
> > >
> > >       ret = device_add(dev);
> > > -     if (ret < 0) {
> > > -             put_device(dev);
> >
> > The documentation for device_add() is clear, and looking at the implementation
> > of device_add(), I understand why put_device() needs to be called here.
> >
> > Unfortunately I do not have the time to read through and digest what Claude has
> > generated in the changelog.
> >
> > Thanks,
> > Mathieu
> >
> >
> > > +     if (ret < 0)
> > >               goto rproc_remove_cdev;
> > > -     }
> > >
> > >       dev_info(dev, "%s is available\n", rproc->name);
> > >
> > >
> > > base-commit: 82d0bbd67c42a44f0e18b0b7b0da0f3ace0c9527
> > > --
> > > 2.53.0
> > >
