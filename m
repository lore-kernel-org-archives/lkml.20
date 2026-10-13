Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF12C11DF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896876; cv=pass; b=HAHAkCB6T4gpG34wl+OKxKYIyaKvpvHQfiLGJrUN75fXmLyycZm3+B/hFPwp2sB0UqsOF6FwkYV7TUUadSUAknTRJqdvwWtbFulIceML7lJ2LaO9tN37+cUs/fuckq7sR/fqz9YF89xRGo0uifqyS8rdyV42VraoyAGJTNMf+OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896876; c=relaxed/simple;
	bh=xawj7LPCwbMgqnWjYqRMdtxCMjGeDH8k0aCK3wtjkY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owrSYqQmTTkTsi2yO5X2yDE+LTxc1XRfIZMqDNQXO5SEmuqbb5nD1G+slJjSM4IeRQefE7n8AQSxtQo4uMQcZ2dJUaw+NajQdhsYepUDvT+JeIchWyxyv/ad0qRPF2eUgB2C+pDTwzEGdJpxmzgcM5hQqZ8RVVFnHRTwD3P6HTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1zniEmF; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1zniEmF"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a6bb779d13so646848fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791896874; cv=none;
        d=google.com; s=arc-20260327;
        b=fkYG9fnfdBXIKOC7ILtG1RLb8qmofkbfOLI8nLGSsw5Js5COgmJ7sQh1HuJsovjErl
         3KfcN9nOP2b+1fahQYXTcMW4XZMUF3o2h2QMXRTsjxxXgLeEh7h1RNnPk5LhU0dsXoLh
         9LpU04cod6w/HBasDHhN+1l5kRXEHZB2hhqbkvsNyDEAUuzdoy72536GnzBE0ApLyxZB
         vf9h7nVMICSXGn+OiK5YxfjWBAIQDJgJInsMRq1H9am5lUi6/GBts2xis354gLEoSFIO
         zIokgdm41WfhVQa/0wY0+Lf4lxemIcRZuFtZE5EA9NavT3UfkIngsWdyxV/2ESFWRrM6
         purA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Qheg1l+96cWqmrxCXMlwjyQaZbPfzvAfZfTwXsDXnnc=;
        fh=HaX6fLNrHoEnXKXRiTZYK9Ou+u5dEGTU3efmYvo6A3o=;
        b=NqCdkOBA+9ME+58FVaP9qRleJJxkXIN7BuC6R8s3Rp9b9fPKP43V8Swt4lSvu2vmIT
         yxOECV3TUyBl1MJlUs/G7u19zSj2wmEetZgEl4KC94cH3AeM9uqQ3QeBTKWaApePLa9T
         H1rZbigk7SW87Vhk6LIwQoiyvS3NgRBabWY0ptoEal82lseSU2ijGstNMPvGUw0SDyc6
         lViRBaL/WZhQTmAoCtEnQV+0aN6z5p9pmaRlZyyqcSdeo2ICVwS+SLLeh6uqtaT9ZTsj
         TG+zRMZKP2+QlLWtkLDxhgOPZ/uqswUCnd151zCUWfewYfpAYUIxOmRFeAoOur5yo9/T
         LKWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791896874; x=1792501674; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qheg1l+96cWqmrxCXMlwjyQaZbPfzvAfZfTwXsDXnnc=;
        b=b1zniEmFdl/6RdrAfnf0sSH89U2wUtZZ4vYOhjdp1cijiEIq/cixfWYcuN0onyIL9D
         lvTqNOWE29E3xTwtmjnUcZkZICNiXGJtuWJ/6+g+CJpRgLYcza/uIsySfqife+D6SYN1
         vKkoKlHhbAOW6AULkTyjsuEvfFbPETwcc8IaMzUiwVVaiaHoNFKl8x77oOaTumLGJz/2
         CyYn3ZzabvWisGjIGI2g23a5PiA/SyVnn86wpEFRAHDPiD2Pq8oZTfMdCiYkp2CvjV5I
         jhMmDYebvVQ6iULzVTW0gqsk83muR1KDoU13gmBNch0ayJWTRuAH7OrtIJuwlxXSDEPn
         Oj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896874; x=1792501674;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qheg1l+96cWqmrxCXMlwjyQaZbPfzvAfZfTwXsDXnnc=;
        b=wICo3MLA8nGguVxEjU6GaxY6hVxwSPefXES2hTW2z8pKB3h1dZFmoLTNdFHLid2RNs
         gQR3OasPeJ5hQoWR9Xz3FhNlZLahoP7m2PQrrFrlfvyEdHkVtVSxsNL6efdG37Pe1zh+
         tYsUHs39x15cK53fg8tH8KpNqo+cWjRXVg2tkNhElrmOFBhuV2Yjf8Jsv9n+8T2IVKc9
         o6shGT1jYZKSS8O0yBlVnXZdvj8E31pZZ4FwUXHhNUdboSRmoWst9H8eeHVoQ1aTkloI
         buRMu5zBVQfG+Fy4JImTTKnjjqTfPc7SBpbb7I+tUHyQ8zKKJ3bMVAjgGU/XtG6zzZmJ
         1RVg==
X-Forwarded-Encrypted: i=1; AKwUvByTkfNUBF79Uovi8fqpvTl6ipjhNU4KXGioz8O6cwUf/5OnsTk/aGC9gYN4qF/67aNyZg1a/5r90tyajew=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMg4BMhDgX3dQqpor3fUrStSe56q0g8HE9yVDtS1rUcs7Lyyug
	xJhLG5f34MXRjKfJZ925SICJIJEayUxJAVLN4UMwyRR2BGY2Ao2byWwOLdqWyO2bM1Q6LiSuYij
	c2UFQBzb3+N9m1+v1AqLAnebbyi3oA44=
X-Gm-Gg: AYBFou3MOzvBDG4jxqVFOFdWocffmgkJewMC/AGqoOXTdCszJuFLRGxUHL/SIv/QhqC
	j7SM5WDu5qzyUVXo5nsXeGAiOFq4j+gZY1u6nLpuvFtrfNwS+BsV9nCOPY4CoFJa+SELyalitsI
	jyW74dypM4So2A4M4pLUQbU9ynJDGvPRsxwfePyZ+70zmOCaWNcntmaFRplwttl1dURJl+H2om7
	ywhKZjipYu57JCJMg6NalOBOJbf3BSaGl34NpeglFz/VgS4SQqMxQiyIHYWqzF1qc3WIJJOlEID
	R/9XJYEqOvtXEFAz9yyGoByaVEGetlp3rE32y6fPH7E12NOFZLLhwLNMfvqYLLqTSwoOOCByKkc
	jQYtgVJdC7AJqKA==
X-Received: by 2002:a05:6871:385c:b0:494:75ba:c6d2 with SMTP id
 586e51a60fabf-4a2a895588emr10792549fac.13.1791896874028; Tue, 13 Oct 2026
 06:07:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012170857.199561-1-hjf3108@gmail.com> <64707239-eac7-4259-a8ff-7ec43d13860e@suse.de>
 <CABOQOSXgG2kBzs2sBEE69mmPcO0cKVgjyk_6DG5RST_4uL2+sg@mail.gmail.com> <c9460a8d-3fdf-439f-9655-82b60617b85c@suse.de>
In-Reply-To: <c9460a8d-3fdf-439f-9655-82b60617b85c@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Tue, 13 Oct 2026 21:07:18 +0800
X-Gm-Features: AclHuK_BSShDGM_0lhA2qLrS0hd1Dfj-OXXVUtwJLUikUL0Nv1qjZuflxKv6ilA
Message-ID: <CABOQOSUE17pQQYydLxCLHg1Jg90dwCEvMZYyo6TzYHMn9RAL2Q@mail.gmail.com>
Subject: Re: [PATCH] drm/format-helper: Add XRGB8888 to UYVY conversion
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 20:32, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 13.10.26 um 14:17 schrieb Jie Feng:
> > On Tue, 13 Oct 2026 at 15:11, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Hi
> >>
> >> Am 12.10.26 um 19:08 schrieb Ho Jie Feng:
> >>> Add a helper for devices that use packed UYVY but accept XRGB8888
> >>> framebuffers.
> >> Is there a description of UYVY available somewhere?
> > This is for a reverse engineered usb display adapter, which accepts
> > input in bytes of U, Y, V, Y in that order. I'm not sure what
> > counts as a description, apart from it matching DRM_FORMAT_UYVY?
>
> I see. The format exists already in DRM.
>
> >
> > This patch is meant to move this out of the driver:
> > https://github.com/rhgndf/ms912x/blob/main/ms912x_transfer.c#L153
> >
> >>> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> >>> ---
> >>> This is used for a driver, ms912x that I will be submitting. It only
> >>> supports uyvy framebuffers.
> >> Please resubmit as part of the driver series. We're not going to merge
> >> it without callers anyway.
> >> ...
> >> For naming, please follow the conventions used by the other helpers in
> >> this file.
> > Will send the driver in with this patch and its fixes, thanks for the review.
> >
> >> ...
> >>> +             v = drm_pixel_rgb2_to_v_bt601(r, g, b);
> >>> +             u = drm_pixel_rgb2_to_u_bt601(r, g, b);
> >>> +
> >>> +             transfer_buffer[dst_offset++] = u;
> >>> +             transfer_buffer[dst_offset++] = y1;
> >>> +             transfer_buffer[dst_offset++] = v;
> >>> +             transfer_buffer[dst_offset++] = y2;
> >> Rather that writing bytes individually, use put_unaligned_le32() or a
> >> similar helper.  Byte order within a pixel is little endian, although
> >> I'm not sure what this means for UYVY.
> > This is meant to be sent over a usb transfer, so byte order needs to be
> > the same on both little and big endian systems.
>
> DRM formats always refer to little endian. As it is implemented now,
> it's not clear what the endianess of your output is. Please duplicate
> the other helpers' logic. They all pack the output with appropriate
> helpers. If the USB device requires BE, you have to write a separate
> conversion helper for that.
>
> BTW, you have an OOB access if the line width is not a multiple of 2.
How should I handle this? Rounding it within the helper doesn't seem
to make sense and the function return is a void, so it can't return -EINVAL.

Other helpers ignore the -ENOMEM error when drm_format_conv_state_reserve
fails, so should it follow this convention?

Alternatively, drm_fb_xfrm can be exported, and let the driver define
the rgb->yuv coefficients? But I think it is fine since _to_gray8 also
cites BT.601.
