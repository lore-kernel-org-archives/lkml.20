Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1723C275AEB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045724; cv=pass; b=u6dGwPkeC2LFBdrmxF1ydfndURh9i1MZPzxbwUk2mvP/RurZA9v5icipTbpalUcvYUExC7y+uiCZsVxwjjz/jKWqntgR7rVkR0OaVlrJktf8nQgwHKXd/75Q3/CzEHsc0XV6h807oO5k/1HPW7SwdxPZksaWj4rzDVToSy5ByeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045724; c=relaxed/simple;
	bh=b7pib6qmck6vMXUfMsg0lb3IK67ptExtuU9slsnEDP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xv3or9I4lEegpCB0QZ5IHPj9eA9HA7PhpyT7ceg4Y7YnVy3LPdYVkIUS3QIeZTBTnxI/uX0ajqu1irz6q8bJi6xAgzPqKob8ej5GDlC0lyGrj71nONVRAdBNp0nNkpVvbW+yXVORi3MMim421eSVVfBtDuoN+Wpq4PbWbC9sZYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWwAMKIt; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWwAMKIt"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab1ba47so1949671d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045722; cv=none;
        d=google.com; s=arc-20260327;
        b=nn4c92cWOU4sTkD4xm3IZjsZwrdRYEVekhT2g7lW+6UZzz8vS7QYGzKQOEv7+wVrRw
         iZsSDARdyJSUR9snfLPbh8Gu/ufoeXIpM+vV1guMckIsnnO9+OIGHkMYcDvnXttVxZtu
         fxdRG24WYWEJpvdJw9gx0iEK0qyyj1gaf6CxiUR8+nyDnmA8bSsaFoSaHpOS/z4Orz/K
         2XmHXZtd1irn8p/6rXyHYlGdg6MxX1KcFVoF+sDyzT6mOZ2V9WNUviz97Qi3u7UjIoTv
         pPciKnjzIlbwt89Zc/+Rb8K4CpTw2ugz5D3d8jB8H77hE+NbDhmrdlUZfLqqFmGJ/XMN
         8GXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OTieWtMtlg1zITO+Uxg0UDNibYRqr028lfLfV7Q57S8=;
        fh=xbKob4YGt/e5QAJ9/Zyr2LdpjIuG948CvUpr2se8tA4=;
        b=jAStn2MdWUccWaFel2G8KW/lqJCYM4it8MFXCqt5pUxgXdJikKlxU6m9WIdmiRM2l1
         UfbNLbes4S8cHhoAjztyvmIPmzFtiR7rEDMHbwua8t3lnJ88ULMyQ+5Ee8JVxcQBW5KJ
         VL+VGdCobkwiVqn/zZ0pT6GQLnAIwGqn8nHn6oCQsyzDQdQiUqmkDmdEZAS07jy3koZ+
         xZP083zL9xMCZhMbMaPWYSyMolBXTJmELW47P2e8WadxkVyl5Y+83iapo7i6Cb/RzoW8
         r6O4XOFzmVOXaJn+naXsokOkRsm0b52cHHTzoDoKZLBaOYMSBAjsfb+/6M6yiJA23NCl
         b7Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045722; x=1790650522; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTieWtMtlg1zITO+Uxg0UDNibYRqr028lfLfV7Q57S8=;
        b=NWwAMKIt9R/8P/xcRV3fIVOZC6HYtnwHRy8pQE3yC/jF/YuevHgLKVHYW3EU1s7rWL
         T3r+8Y2mSIzDeZMFLKZ74R1mcceZXamDsH6Gfy8XEJkGz3+wkSx4rCkuGWjuev3i3J7W
         b3p7b6fMsg0OC6KdZpeIIOk3+KdTCYFxRV0/MXhkwuLYlYDUhSiydlzEjLKz0Ml41zEi
         ux0BXH4DYUn8iWQEg8TqoKOE1TNsFxFqSctWTTuWqvD47ZOrrqQgd6knre6qmqR9LPy9
         I6PS9aksbflXXBqha4rlLB6QGuVlh1MEqL6HHpHALshsiiTwPDQMXrrRR6x+ogull3AW
         8GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045722; x=1790650522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OTieWtMtlg1zITO+Uxg0UDNibYRqr028lfLfV7Q57S8=;
        b=RUAWu7V/vkknWt1DcdTmqE8wCJLWaCqsoKbdzRAb4RPhq6BD56FXYiHnRY8pA5N8Z6
         +M+umAwtm89sb/uj3Ph7bZdt2cDp/v8FFI7wypcu+G/Sd8mw7msSLUKIuQ34iY/Shz35
         IsI5h/6GayWR0cWIBhgYuBukFlAy6gpRQzfr+z99ssG0CeWTLsPIHgDfuf/0+TKIxiAY
         ITcSU++GMg8rGtiJ7AR0NcDNiTy0S815Ek5at+7OQwisdnZo6BSBmDKA95Q64XK+gGVc
         +wCjFUJN7a+NouDd2yUL4h19e+AcIcRrjUhcluntSenRiEAu0jrFOpPR+sBNXKilaSdW
         hosA==
X-Forwarded-Encrypted: i=1; AKwUvBzh76zW66QwjFTNxr2tVcb19W24H3aWLo5LenKOS8JXO+SglVdRYEqJi6hkHt7aiJt29rMjB1T9rlstsg8=@vger.kernel.org
X-Gm-Message-State: AFuF++nRyaBy0NcurffaydLSWWBTNqOufy5Ugbtm3vepaMVrMRzRv6/N
	3fQ/PtcAEq8LZQ4ZyLXeaYA390p3yNeoRKOBPZVpRs24pbotmByKq8Q1VgBPDM/1+hUuPavLsth
	hQwvUgS2kHG4WPVi0/MIrq6KoCpIfWdE=
X-Gm-Gg: AYBFou1RXpMknO78GXNTqYQWaA7RZpQWNwYNxPucVmhLmWzauIJG7jRr5h88AW4JYdA
	25vQYKfw3eITW8PkVMg368L/qMLkt8pl2swlcay3Q9dMSCBmgXK+96iJYVDQET3mfTDuAdzFWJ5
	9k5JiJ9R1rsDbPY65uKmZ2j3oHh7ES983MLJ0vM47NQ0LNWnZyHy1IP88FX8Vhzyt2CeEvm//fR
	R+ecJh4wsudHB+L61V/oWNyn9ICs7qPpeyGRsKHvJi/Ha19Jq6GMdYg6620z0p7BZP4WYUqTMuf
	e3bkq8ZnQM76QsYRo4rDD1jtI01kspK7p6qcLYnKeWaOvY9uXhNEbCd45Q==
X-Received: by 2002:a05:690e:12ce:b0:66f:b0f7:5958 with SMTP id
 956f58d0204a3-672c292b051mr691603d50.6.1790045721971; Mon, 21 Sep 2026
 19:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919171710.3699710-1-lgs201920130244@gmail.com> <arFH__nd1-T-6kft@quoll>
In-Reply-To: <arFH__nd1-T-6kft@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:55:08 +0800
X-Gm-Features: AcwNN1WJzmefJMuoQ8BNwToU4Ldlc5pP17GQHNyphMtayYqHxTXwBfR3oYlyR7c
Message-ID: <CANUHTR9CncY6h_j-ADSrW_+QSPpDpKsqgN2Y_WrFukq4SYpy6w@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: fix mock ring memory leak on context allocation failure
To: krzk@kernel.org
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, stable@vger.kernel.org, 
	Simona Vetter <simona@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, linux-kernel@vger.kernel.org, 
	Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org, 
	Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:06, <krzk@kernel.org> wrote:
>
>
> On Sun, 20 Sep 2026 01:17:10 +0800, Guangshuo Li wrote:
> > mock_context_alloc() creates ce->ring before allocating and pinning the
> > context timeline. mock_ring() initializes the ring reference count and
> > returns the initial reference to the context.
> >
> > If intel_timeline_create() fails, mock_context_alloc() returns without
> > dropping the ring reference. The same leak occurs when
> > mock_timeline_pin() fails after the timeline has been created. Since
> > context allocation did not complete, CONTEXT_ALLOC_BIT is not set and
> > the later context teardown does not release the ring.
> >
> > Drop the initial ring reference with kref_put() on both failure paths.
> > When the reference count reaches zero, intel_ring_free() releases the
> > ring VMA and frees the ring allocation. Clear ce->ring after dropping
> > the reference to avoid retaining a stale pointer.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 75d0a7f31eec ("drm/i915: Lift timeline into intel_context")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/gt/mock_engine.c | 4 ++++
> >  1 file changed, 4 insertions(+)
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
