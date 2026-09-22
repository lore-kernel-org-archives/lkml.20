Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0013B5B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045323; cv=pass; b=ht1aDFhGe0aqn/W1T/bduKzfNSK95nEDU2W0168Z9Jes+LqIWFnDYBbtf7RNjNI4lnED7CjGxSZQ4fP1ZFCmjrJ8jpLllyqF5yRUjtoElCy4ml6E3fayF07sxmm/BJunqfJD7EwED26MTpEjQMmwfjg0vldfTZbcrnVVAAvZi8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045323; c=relaxed/simple;
	bh=BTNod3yCiVITqkGUTzHOAxx2QYkllbtfz8BL73slXFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JK17qEslUdXs97PaRDnxMm7rxypQz+pQjyWm7qyxd5F8LD5ken5zvdMg6ZVo/+8wp70gQxFZuMTKW8G2fBm6HIz7/+rLvLA/CyY4w5e2cJF84e+i5d57n6bfoyTYIWzF8uAdipwuWU4bmrB4Lzs8fAoX/shZHP6xQBR48rjnig4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCP3YP06; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCP3YP06"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e56a1fe3fso3442801d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045321; cv=none;
        d=google.com; s=arc-20260327;
        b=spTu/4uXCNC/u5Z4CQOFyaD5HKMpzWG2RCSKvxEuav/N/hytpbPo8hyx+YtV9VDKI+
         cvuCVtHuFA98Hd64f32kV/6VvFLuYstS9W59DAG847B4SgqmjJrl1WNvAZV0t+hxmokF
         6jHnzWByTCZzn8MWuV85gzMU+xjIjFCFJrmNs3Z5u589uImusE6JBtjujgwmQ7aosbH0
         xYM9DhLBXrwLWdbsoOYDkP7DslXSrAU1wt1bKyUiogDcA6WKxohqcYtacnLhXq4I2I79
         8W58V13u3U9EftxNOQxgj3qZ1r2jal8peTaTsvBNBm49Gj1Dk9NcOKnLkRInUCrX16tE
         JPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EwWA3LgMjt74XDEZ31Q/wUl2bcv/dp/523dBsTBjRfg=;
        fh=V7tMknDUjtoOTCeGKsTWQ0fcJMq+Uk/jkYMJMT4xmfs=;
        b=SMyezCplCdRt4OZxikWxK83o+10S3ReUI2vCHosnvPLEO5IqVdXaGQGGau9snzeHQD
         q524fgA1bFnKRygSHOQ1TnheGJx2SL37uLTU8eSO8UX55wTwEy+hvOtNXqFC/gVsW6QO
         7V382YG98+cC3GAPfAsjkwOUs2IC2wnpYLeAch26QtMCSghLZUycauMiC9LG0DiOUqwi
         AoWhlTEaQKS5pM6EhnWyPuhvk3aRZeKVhiNDfnXUe/aGVgloeISZzsknWu5UxdonBGWL
         LP6ipum0OmJ/CzRUVukZABZqO8dbH/SDyCW/DNthUgSCV+1xIJHMH9FJuqRtBaIe/0ST
         zlvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045321; x=1790650121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwWA3LgMjt74XDEZ31Q/wUl2bcv/dp/523dBsTBjRfg=;
        b=OCP3YP06F13D0Is8mrxp+Hl2BJDVBihPjBs3Uo8vxgDg4/VbCZqmai7HtFnRpmbvC1
         xpqWRj2NgtjDsOsJLggDYqTnSf78B+LKs3nDWjbOICMMFG8j00pxUWywGYejUmfuAX91
         0iVt5FXof6FSLCS4Ior4GDPhmBmrCwQVPhKtMM46pUgfRuJZMw5Q2SEng1H4hdGmjXPx
         PX4PY+oL/SekL6FZC8n0Ji000zsDy0cs7sM+xU3BzJkPodvULhQh940ci63re/rWO98D
         2bbVmlJDg6X7pOQRqpjlHGaUNELq7OXtun8yUWfwsjDN5p3oROK477OPz2psy7O6Eavp
         CX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045321; x=1790650121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwWA3LgMjt74XDEZ31Q/wUl2bcv/dp/523dBsTBjRfg=;
        b=ha39SkV2S3Oi7Z6OuIJNyB11JOqTwFlMDMAMrgaf3K0OE2T4IgIQMlGA/rjCkgomnF
         j3EZnOczHGr8LQHwYGvaBgVw1GjwMHKMXKyTt3eQDaxt7ylmdrUPzAmGzaZWCalDmwYb
         uudf+9SYeP2NJHz8tjd2K7elATNPtQrbHvBwzge/ahSofVvUi1N8IB+kg3NpN/74fNb+
         S0E+B6kZen5rnJOTduRH/iEfi/hQT2JEIgi+9okofUkaV6IhiOuVs1a0NZFTF+ahSTNW
         /mGNGdwfPr5zys8kVbB01A4+7OksCLaRvIZf7EiaKx/GMcsXHjyy1eWImNNy1dPCPCe3
         I3rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyW2XEX3rv8wKZsqPBvYUeXUVrzy40dCO1dIsh14+aI96LE+66cwkQ3KHRGmfvRT3HP9bHUV6xIjEQ1uE=@vger.kernel.org
X-Gm-Message-State: AFuF++k26c5FB82bY7+ZfJItAM0g8s5UBS2wnmY82FoEeU5f+UP4g54L
	LuAlAD4tdhHrl9+QRORxSZoLpAiYBVC8glzt/WE9iUKzqzmtOhDoy3GgHOt9HeNs+dDiI8IyGd4
	z7XImakV48AqV8KwFpCQxHC6mGJzZGW8=
X-Gm-Gg: AYBFou3E3XI4F7RU2ciL7ydlwqnvW0rIy/l7maLrmxOWUmFKHQz6kUD9nzkjs7SkPxd
	s4BvkHQIlr5QAzN8js1G+ZLjKwp/f/C0jHGcOhPNKGDpKuA9kvbiTqzQAkOFTg8PfnbxZSRYU3T
	IpcpjkDUZEr0+peOS5XFLpgJ3/OnUHG0bsu9GvIsDDnMe10zl+e4YCMlsjOlESZjQW37Hyu0JND
	yQ6BdYkUXNNXVT+Jdyy7HGeC1XULFeRXCWRO17t+b0w219Efrf/7vxSFYOt7XL+AOjZHXwGB2gP
	pY4r8jDANhBjCPqbUgukWceHHohqIJsJiIiBivcMzJ4sRMkc61mCRMRItw==
X-Received: by 2002:a05:690e:4419:b0:668:9230:e266 with SMTP id
 956f58d0204a3-6717fdb20a6mr2869967d50.46.1790045321076; Mon, 21 Sep 2026
 19:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919175925.3739806-1-lgs201920130244@gmail.com> <arFJeRFJdL-fwRmk@quoll>
In-Reply-To: <arFJeRFJdL-fwRmk@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:48:28 +0800
X-Gm-Features: AcwNN1VhjH0umtEATXdXl4Fw6zfObXCRNks60FtGl0HS8f4Ga7r0Rf1ihREbjxQ
Message-ID: <CANUHTR8we6L7TXR7_HR-xZK1kYWnqpoUY2sGcrjeFOHn=Hxf_w@mail.gmail.com>
Subject: Re: [PATCH] dca: fix provider device memory leak on domain allocation failure
To: krzk@kernel.org
Cc: stable@vger.kernel.org, Maciej Sosnowski <maciej.sosnowski@intel.com>, 
	Dan Williams <djbw@kernel.org>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:13, <krzk@kernel.org> wrote:
>
>
> On Sun, 20 Sep 2026 01:59:24 +0800, Guangshuo Li wrote:
> > register_dca_provider() calls dca_sysfs_add_provider() before looking up
> > or allocating the DCA domain. A successful dca_sysfs_add_provider()
> > allocates an IDR entry and creates the dca%d class device.
> >
> > If no domain exists and dca_allocate_domain() fails, the function
> > returns -ENODEV without calling dca_sysfs_remove_provider(). The class
> > device therefore remains registered and the IDR entry remains
> > allocated. The caller may subsequently free the dca_provider, leaving
> > the IDR entry pointing to freed memory.
> >
> > Since the class device is never unregistered, its device reference is
> > not dropped and device_create_release() is never reached, leaking the
> > struct device allocation.
> >
> > Call dca_sysfs_remove_provider() before returning when domain allocation
> > fails. This unregisters the class device and removes the corresponding
> > IDR entry.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 1a5aeeecd550 ("dca: registering requesters in multiple dca domains")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/dca/dca-core.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
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
