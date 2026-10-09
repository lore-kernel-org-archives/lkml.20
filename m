Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5698E341057
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566654; cv=none; b=Zq4Mg2Ih2377niO1XTAGvOlGbwamFAQXTLOCleU4eEuM5aUihRFCuD3jm206kTaOrwhoHKd3z1AnbGXc7vYcpJC+U9SzF2NC3CntYqF+1YjT9Mwl0q0awQbprJyQ8Q4WSrdY8NNWyT3VvpYEV7YE3RzSfftzI6YN5bMoCA1c0Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566654; c=relaxed/simple;
	bh=VFysVpEzuY8YIJW9d/0IzEmfKNAQdee0KKSzflKaTuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DapBHEKwfgp/IZm7Wmh7NdvLhmw9YEQLZP/sNOS3BCMt+Pj3N5YnQlHYToMjex25UKvMn2lzufUcPxqustBhnEnYh+oYdSBByLsuJrIe4Nefy+jmOanDFljCuxaRwFP0M+VgcxnXukkWQapAHj3OYiy1sAFhOX6kCHLks/jB5uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZ5YjG7d; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZ5YjG7d"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e4af975346so38693105ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566653; x=1792171453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MgP/Yvmg9WREY6HrimkIjIQqXOyMedJLEXkISSPgT0=;
        b=qZ5YjG7d7fSw7o0DMAmePRu7hcS2xZz3zqcw6tR1loygGKORjVgg7hxAlglm0alg1z
         jT5YzPV/dDEozPTHqdr2DDUwqukSxEDBiSD2dxCPZ5MoacAI1YBwAI4mCfcXzGHW/oKl
         ih2MqoAT9KZXs8+TVLSHGuNtz5ZkHVHsVRTFJRhhUI+ONXrpMHeUyQyE1mjiLl+wAOKY
         HoXee5WbjdUuauPnXNgeqMRc9Sl/6csXrsu1M8VYldmfb13B0cQdMY8GdEPd9UC+W8lS
         7pHD8fKtZ1Rin9v/6Uf4HaFpUwSjBZ4Xzx2K6iyweAtBVh4gKu1jpzi2KawGAmz0uR0B
         CAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566653; x=1792171453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MgP/Yvmg9WREY6HrimkIjIQqXOyMedJLEXkISSPgT0=;
        b=nsitGnXSyK8wuxkMnV8KOwVUWrReqeH/nTfHwHop12zuedm9DP224HJInyp6BzSdRA
         pA23//GmTG/gX0dKG3f0CAO4MqAKCX87PmM7XK49gag5ZOV+4Z+MMPoMfru5yN3HqsL3
         /pSEcOsofL8DmS8WarzQw3/fiRA5nmDn+hJdwZNYvXGyjj35HIzXHToSytOGqdG4kVtu
         /s/4qB9U4n9wHwA/hVkCBOBlikd6WAda3S6f/GmNiqp+FRW5Yi0g1VDeFNy39VGRq8zY
         M57K2S7iCgjubC3oCEZ2cc3uRHFPMZ8JPx0xM/1AfAfsr1SsWVJn/tTUjS+r7QczX6Ce
         t66A==
X-Forwarded-Encrypted: i=1; AKwUvBzOmi5ZMJ+N6R96ee4nDlfLAuuWTv9xd3Pi/puI4SJjpdpptSN3ZCISNzmsHc2QFa7Pt8kVvwkHeW/p+xo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOyH457YRgS3bsVVU0Aa56XTIeoFyXdkcUzqu7PrmLgMmKgl+Q
	hY6LPRHSAtRO71Ib3/s14WqkpdO8XQIHZhvWynSyQC2xVh1PRi0UL19d
X-Gm-Gg: AYBFou3BPkXZBK097r6BySrhbgp9VS2FZq3j0ufMfXGS/tsN4MTefrKsz9S/c4TuM69
	Mj25KHigHNqrfGX6cvS/iXTHzEybBIfJDoUEAiVO0cgKhS9rwCDUeHgQTUMCe5JV2FdxvRmMUXG
	hLFbYVqWnM05bqKWpc/NhGLsYBOMaGMCCaRApJ5NzAm4pxxbl2p6hXS8SJVjuCh1p7shWqsg4ME
	Y2BCSOmJ+CMI0jArhzdfKaDzAZvc3YZ9E3W/TWE2uclvjl1chKywxrxxa0si6a+tmw/Jq7tA8aH
	zyYfzGTpiXLK23SrS76swKWAXRT4CAVdqNuk+NzOjA+1id2x7IhQJscs8sVLpAKqgBpORYM/rZd
	Nc5HnHr/CxpnX7O9NK/9Pqo7ehUhbJcdiYE2mkDDQOoZgSjPZOOr+07YFZqN2Vn4rSVPaZV2PXc
	1urFjxJAa/H1ic8fSZcCYOIWIhm4hsKxrKSwIU2sPIIN3Cf1VessAky2CFC2FptxlzLXmhzL5/+
	W8/nBFXcY7hO0rFjZFRrQkeixgRAc5LX0bUDeE4
X-Received: by 2002:a17:902:d58f:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2e842cd4632mr20971865ad.16.1791566652480;
        Fri, 09 Oct 2026 10:24:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8725:99de:769c:1fe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1643sm14442125ad.70.2026.10.09.10.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:24:11 -0700 (PDT)
Date: Fri, 9 Oct 2026 10:24:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Haotian Zhang <vulab@iscas.ac.cn>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ville Syrjala <syrjala@sci.fi>
Subject: Re: [PATCH] Input: ati_remote2 - fix type confusion in device
 attribute handlers
Message-ID: <askiJMSDiLRTeJyX@google.com>
References: <20261009040302.3087205-1-vulab@iscas.ac.cn>
 <20261009-shapeless-silky-deer-acd3bc@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-shapeless-silky-deer-acd3bc@quoll>

On Fri, Oct 09, 2026 at 08:10:08AM +0200, Krzysztof Kozlowski wrote:
> 
> On Fri, 09 Oct 2026 12:03:02 +0800, Haotian Zhang wrote:
> > The channel_mask and mode_mask attributes are instantiated by the driver
> > core through struct usb_driver::dev_groups, so they are attached to the
> > usb_interface bound to the driver, not to the usb_device.  The four
> > show/store handlers still call to_usb_device(dev), which applies the
> > struct usb_device container_of() to a struct usb_interface::dev and thus
> > produces a bogus usb_device pointer.  usb_ifnum_to_if() reads that
> > pointer as udev->actconfig and dereferences it, and its result is passed
> > to usb_get_intfdata() without any NULL check, so reading or writing the
> > world-readable attributes can crash the kernel.
> > 
> > Use to_usb_interface(dev) so the handlers recover the interface that the
> > attributes belong to, matching the other drivers converted to dev_groups.
> > 
> > Fixes: b20d6bf8014b ("Input: ati-remote2 - use driver core to instantiate device attributes")
> > Assisted-by: DeepSeek-V4.1-Flash
> > Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> > ---
> >  drivers/input/misc/ati_remote2.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> > 
> 
> 
> 
> Multiple things here:
> 1. Your team ignored completely previous feedback.
> 
> 2. You use multiple identities with this email, thus I actually doubt we speak
>    with actual person.
> 
> 3. Finally, same feedback:
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

Not sure what was wrong with previous submissions, this is first time I
see it. This fixes a valid regression that I introduced when moved
attribute registration into dev_groups and inadvertently attached it to
the wrong device instance. We could consider reverting the original
patch, but since nobody complained in 2 years I think I'll simply take
this one.

Thanks.

-- 
Dmitry
