Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9322303A35
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790297829; cv=none; b=Nhol3QRURDFjnOhVHQ4uvuKFgEnlMaQPJ4d5IC4kZGMb4GC7mHyjPr/W47yAXtBdj4f6SpggKN2Pm33AGK18hL2XO3yTN+vQbAsE6qGHR88IneRBPpYUiRjXJ/jsuKZHXj+cDyAYnIdPC/787L/pDZjV7U+TRvOKCVai0vL6Muo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790297829; c=relaxed/simple;
	bh=FJCgrw0AhIQoDzBVODYuql4sWvDFJqLutJAEKYfbpgA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fVTm8Jo5g97/NgxakbfU8K7atQtaHN1VcB3hUJhPLR3jhMKxf7TJZXN80/4MeRS2fs68XozWXDadAF+PIuBM93k2IpY7XM+qVPxkHRrVuiuCKBorTjQYtpJqwMkDOuT0xF3zcLX8BlAOeDibnRkLb8iN2/fYNDO++U2OCvjQy+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZUQf/wO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZUQf/wO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a147688bso307945a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790297827; x=1790902627; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FJCgrw0AhIQoDzBVODYuql4sWvDFJqLutJAEKYfbpgA=;
        b=OZUQf/wOSaVGQmrWHYMlcAqrCuF3fHq/AIMv2z8XXt4g5i7epzr2+uuaVw9s2yowLK
         W0G0cDg+RjxTvibGgvKLMmOoYou+w9Wv3ENjj+VDBnwxd4AVJuLE6sMP0rdrRmeP15fU
         t1iyErm/tYN7EHmqJ2uf19zgieDENiaD43Z4oMeXWgsnevbvZpX9iM9xDFnakt/E6bKb
         czA3Ojljgh0SDgGzLBcsL+fK5SSYIfIhNTWyz7Xx0Z2gEz4NP+CJNybZ8hWDAotxj8YO
         YYPexsDhcbGR+Cy9Y3sRiRYqaGHVb+0rafhB2RpT96Xjkbijnyfu263tcuzn0o8GEauJ
         ybHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790297827; x=1790902627;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJCgrw0AhIQoDzBVODYuql4sWvDFJqLutJAEKYfbpgA=;
        b=v87jGDOF5MzPCzYaUFujQrY8gOvoxuQAEMWVQMeuYfwjlWFM/0taBgs4bl7ifbYDSd
         IPOWGkVLylnSZfKFXNxMiWWCNI4kUHVd+mOhtB7ri+F7+WivuyjMTNqDCz7TpZtd3Uko
         hy1Ssjkpq+w3fJq7xfTytFR3c/uARGz6PBHQ7Xe4bfvj+zoLxeNQJFGxLZgndhpJ+sai
         Cqd2YvGGTbinugBhz00YeKEHjWjGTEFvwtvW50RR6yVr/FinLd3ygY1L70gALKL4VVAB
         zyvXKjqQ/u+Ze2+JL3p161cGxPqZcpMWwE7745OcDeXQgK0H8Wk1IBBGPvYb4jomW36M
         L91g==
X-Forwarded-Encrypted: i=1; AKwUvBxGo/6No+eL+i4j4VSPMGtampYcp1Kvts2GdB/iGOMPPs5FA+ni4sAipvGNKlaRf+Xy50LOwkL7O6Ckeds=@vger.kernel.org
X-Gm-Message-State: AFuF++lYkLQXW7xwqPkXNU/vA2svVgaYuFnLBvMhE06sBOGx5frceBhq
	sDDgMN4ZsVVkJD5BkaJACr1RkJJstl5FsYCbRLyMVER2EX3iFi1Rsgck
X-Gm-Gg: AYBFou1Uk9juNj9Lt7bRqpQECPO/MQy5WzC0QThxf+ndWniOc7WEzxRzl4qMG3GJaOJ
	pOiXQo+EyCcja6lZb0lORXWBOVR9+jR5+0SDMxLbo9M6GKRqHD9UX0GJcdVJ8GAhOG/TzyzOZdH
	BeipCxv77uhYPglkGdfg92MYGG/c4YeH/HR6qDooxPYsKPaoSdckPZ2ZM/utWQsDi6fPIS/05oX
	j8J4mxPsuFLjL1K1bbwUWWHtfmNXByziai+QyCWET9dNj0bbJ9x8kgmcjsTfc3dlvFcWjK4D34w
	i195QfTKWfIdh/FmOmVc8NgBoJjU+qzHAuLojcEnp9GJSdBC+jihzmGbPF0GuwzTgshZ0JBFCfH
	rhP/DPdkW50YsSfrlZ69zICqc9oqn6/9nOSlU8Ivsv1QRbgITca5ThOrouU7kSTYtbIyf/DOBRf
	nYO5zZ6rBIo6mathEkvO+4BQjPAkvvUb8uMWvIIKV+bjaqQnXHyiSZtFTap+BNXQ==
X-Received: by 2002:a17:90b:5544:b0:3a0:ad24:c0aa with SMTP id 98e67ed59e1d1-3a0ad24c0f7mr1970446a91.25.1790297827124;
        Thu, 24 Sep 2026 17:57:07 -0700 (PDT)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9589f7esm1147879a91.10.2026.09.24.17.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 09:57:03 +0900
Message-Id: <DLNZM1Z3VUX3.23ZXHHQWLCSHI@gmail.com>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil"
 <hverkuil@xs4all.nl>, "Brian Daniels" <briandaniels@google.com>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: v4l2-ioctl: zero the ext control built for
 VIDIOC_{G,S}_CTRL
From: "Alexandre Courbot" <gnurou@gmail.com>
To: "Nick Rogers" <nick@getfieldwork.ai>
References: <20260923160936.33445-1-nick@getfieldwork.ai>
In-Reply-To: <20260923160936.33445-1-nick@getfieldwork.ai>

On Thu Sep 24, 2026 at 1:09 AM JST, Nick Rogers wrote:
> When a driver implements the extended control ioctls but has no control
> handler, v4l_g_ctrl() and v4l_s_ctrl() pass VIDIOC_G_CTRL and
> VIDIOC_S_CTRL on as a single struct v4l2_ext_control built on the stack.
> Only its id and value are set, and check_ext_ctrls() clears reserved[0]
> and reserved2[0]; the control's size and the rest of both structures are
> left uninitialized.
>
> A driver that forwards the controls rather than handling them through
> the control framework sees that stack garbage. The virtio-media driver
> under review takes a nonzero size as a payload to copy from userspace,
> so VIDIOC_G_CTRL and VIDIOC_S_CTRL fail with -EINVAL through it whenever
> the stack is dirty. GStreamer's V4L2 encoders set their profile with
> VIDIOC_S_CTRL, and cannot negotiate against such a device.
>
> Zero-initialize both structures.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
> ---
> Found running the virtio-media v9 series [1] in a VMM with a host-side
> stateful encoder: GStreamer's v4l2h264enc fails to negotiate because
> VIDIOC_S_CTRL returns -EINVAL. Tested on 6.18 with that series applied:
> VIDIOC_G_CTRL and VIDIOC_S_CTRL now reach the device intact, and
> v4l2-compliance 1.30.1 reports the same results with and without this
> patch. Build-tested on media.git next (arm64, W=3D1, no new warnings).
>
> [1] https://lore.kernel.org/all/20260917171921.2810550-1-briandaniels@goo=
gle.com/

I'm wondering what the API contract intent is here. If it is that
drivers are supposed to fill the control structures themselves, then
virtio-media should also be fixed, regardless of this safeguard.

Indeed it is likely that virtio-media will be ported to some older
kernels, which may not have this patch, in which case the same bug will
arise again.
