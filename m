Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E0F3750D7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045260; cv=pass; b=bRj14xpZrhmGa6g7E2tvWTfLhJNpC9QzEbdHxOBQRCK02UkZzBOA0ieBU6fXzlg7wWY1jwFea30bdu7u4X7TLhbe15whHLkWIs2jgDLCbkiE0bNjLn5FAWminOqwlBTBDc6DTPyKXJTb0/vCuSdqhGNEab6maEtoZL/OkydyB7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045260; c=relaxed/simple;
	bh=/bF+2i7J9tw/SU9Y8Ch+X0ErYTFXTPP1J7KPqLHGa9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxEzut2qLjiAzCMhLuYKV7hIgARoWyWj7URELILI70Xq+qulZCNnqxzmrlYsFcDKiuqDid4wUXOBQqNVQWsYN+GgRss3t2AY0ipvWKSObgoBj3Xv8gGTU3WWlzyRAC4Lq3UrdxBXW/PtYHWLewa5csUmf8er708ttWYxp4k157E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuLhNOa0; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuLhNOa0"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66f943b286fso3285179d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045257; cv=none;
        d=google.com; s=arc-20260327;
        b=HVdl8cpA0Qqz2l1CTDHghdqQKaYmK0/eQ4Ai3ciPxHsZeQAI80BOcf9dl9BHm2TPA6
         Nm17HinUguF79+I1HSXcWCKferWaCfChsUuIlxgloS5c5RFE0rCyLRRa/+/X1myNfYVL
         UXgIhFV/ncY2o+q5Vg/QMZdx3kncc4JHOvUKr5IjKZ4x/+FAYn/2426ZS8DPhOqIGcuh
         lhcbBcgr0cn8YjgFUBCa5hppUpGvK/2+iUnufQwQDfSCFwh9kCMkxofbvA4swSSlH7kO
         qTe5hZKsRzpVpvUK1Li3HA7LYjfA+TeNy00KYuljmJQf98VG5TOnOARUH7fIjNes/nq4
         Yszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K/Pzgg7o0qrlVK5qFQbvKisrC2SDvw/OqmX88foRwCs=;
        fh=e2fBe+TcuYQLJv2I4JtOrBselBSFlI/tKFYSpfje1qo=;
        b=ibjPvG+1k0HckI7Aw4q0fHqsK6wYaPyr3nzEz5jVIfTDWZvObe/hfJ+PPuh/8WtvKT
         brudpaGl2gWHGWn96RN7fxlEepqe5h4EhKp7Q/0o0F/Xypma9WWkB8TXWrceXy5GyP/8
         qAfzpkKxATimSA3gFSMRg/61Jq/dUAFY8eaH7XB7KKSRCerIOp7iuAcTW+9Ks4WsY36t
         ezscHpWhKsm7oOXTIFTBA/O/XaNkaPQLEU8cCN+zk8Mk6Glw2RdbU6uBHe5QsKw/+44Y
         AGgFxRkOTvVheWoytuewqrX5p1/jnzpmDBqUQ3xZQeEZNFEy6oD8kk7A6S79vWqSzJ4C
         RhFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045257; x=1790650057; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/Pzgg7o0qrlVK5qFQbvKisrC2SDvw/OqmX88foRwCs=;
        b=AuLhNOa0yPL9n4hIKdsmoKbEnxfAuuK/HKtO7P3kdusbH5x7hG67dS6slg21oqqMbg
         cDyWlzyF2x/28pOi5Fl8T/RIaFd6Rjo0MQYcMzadjD+4UENR1PxRRxs87oR+B6Qws690
         feROsiscLY5pVaXM4pP46S1YHdsoShHCTC+QhpmUTCOl30+ifYBaiosiNwHH3VuHfZAB
         nVYqcFnrEttaaf9UVTCXUDWVCgw2bfgmwhMJ31UPwTk2vBwjXgjrmYdrBC08YVpw4F69
         SURYQi6jSnhJWWINrDZnJWp1Y3YNntdOtAhJJYRmUFg6jndk4CwP9X94B6w73xvr6l14
         zZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045257; x=1790650057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K/Pzgg7o0qrlVK5qFQbvKisrC2SDvw/OqmX88foRwCs=;
        b=KWG6ObZXAkARj/gPxRkOJ8nMkY3NqRrD0P+8SwvGF5EoLUEm+U1L9mMXGPSpH3bLmD
         gDsU6Jb9FmewX7R4rtZQTuIEfgMonHXRXOz3TAanHG4iZI7OjqtwO9uyzYtQ5JZfAaz7
         6qWrLO/VNHkOZ79dZ+sLpBUPrv2nLO2y4xAikfmtjPjhoZ+NKEbo815iTxsXJ8vsGm7a
         Fme/dTEeL7a7/l8p6l7NTxc3NChySoAX0ZOwVO9ByK1g98gNuPE7ao1askFTLduTvB93
         QmiJN+63vbPRmbEdOZzr+dJPv7RMLcjVqLSkQ38PR1fgl6Ot67UdGjPJNmSh3bbfMIeO
         bu+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTymcwSVR9NOzxiBGcUbiTVdFPcdZc9ziwCRXCGWumhbz/MN6bIXVbPxaYws0qh0GtX8B0cpxwQghO4bc=@vger.kernel.org
X-Gm-Message-State: AFuF++mzzViQzrFuLSFcuc9S+x4ihkx/bJ5isP9K4uPg1zVp7lCAE1tr
	i0x1uXwOYGu1szA8742a/+mrp4Vhv+DcyO3bYSfeD4ISfsTBbIFOV+OVlrPFDYYEdIgPwvUyaQC
	zVVMljuXDNHvv8zUXr+lbmUJTc0wCRpJ8YBoGlWFoP6Am
X-Gm-Gg: AYBFou0vcnGCPS2LrRrDYdr9cXxUiMDFuJFLiVjFiJAd70WU/FKmaHitalkrHgoki3L
	wrEkdQlP3h06KLrcl3J3Y/0qBdVulyC+ol37kUNJaTFm/MRraswv8BwF0Ods+2ALtSEftRJyBfw
	z6xp+SW16PzVd/Nd0pN+aAhMZvTm42cHG9B7vMNE+Sqrs0ps6gw7TTLHm7k+ewS1/hGBMa8sioM
	bB47N4B/uPp2yLfa8knFxIzy9iqbQ0nzZ1+O3gtBc9S9pKK0J7pbcOHzCnLFPINrwqpTg9j8nE+
	IdJ+sFpqQHnAWl1IYkI141AtLG0P07BNV4kH6PhWFHu1Xda3p+nt0r0KMZc=
X-Received: by 2002:a05:690e:441b:b0:66f:c1be:84e1 with SMTP id
 956f58d0204a3-672c54b6fb5mr245756d50.79.1790045257564; Mon, 21 Sep 2026
 19:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921073847.63505-1-lgs201920130244@gmail.com> <arFH7F944RO7TUqN@quoll>
In-Reply-To: <arFH7F944RO7TUqN@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:47:24 +0800
X-Gm-Features: AcwNN1VMKLPliQEBYI3cwmxMjQMSd7JsGwSa33n2dtOWCSkj81z1Dp0OO7Y38vg
Message-ID: <CANUHTR-KMdRmJwjpqqk5tsfnQkrwRBroCqkYOr6f9o=6yVewJw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: SST: fix platform device leak on probe failure
To: krzk@kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-sound@vger.kernel.org, 
	stable@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Thorsten Blum <thorsten.blum@linux.dev>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:06, <krzk@kernel.org> wrote:
>
>
> On Mon, 21 Sep 2026 15:38:47 +0800, Guangshuo Li wrote:
> > sst_acpi_probe() registers platform devices for the SST platform and
> > machine drivers using platform_device_register_data(), but does not
> > unregister them when later probe steps fail.
> >
> > If machine device registration fails, the already registered SST platform
> > device is left registered. The same leak happens when
> > sst_platform_get_resources() or sst_context_init() fails after both
> > platform devices have been successfully registered.
> >
> > A registered platform device owns resources allocated by the platform
> > device core and must be released with platform_device_unregister() so
> > that the device reference is dropped and platform_device_release() can
> > free the backing platform_object.
> >
> > Unregister the created platform devices on all failure paths to restore
> > the missing cleanup.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: caf94ed8629a ("ASoC: Intel: bytcr_rt5640: fixup DAI codec_name with HID")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  sound/soc/intel/atom/sst/sst_acpi.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>
I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
