Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6252DF6E6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875669; cv=none; b=XoCumm7cNpObp1Wcn2QnzAgXrrykPOWPe9bcOevFT/pelZpSjKg6ko9ZLI61hVITndipsYA2QSHMncdXgB0TSSxtN8Oi3bTMZsQL2ZR9EAeUSjRbsF+acRe4DvuAtU0ctHKo9rjESgDEFBJ+WHmPyzSfrwIjt9s+2nlWvqfcVxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875669; c=relaxed/simple;
	bh=mHUP2EMa4HLrfBY6PoqklysfLqNsm4NlzRpAT2qHoM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wb09TqruYP2m/uQw7PCXk0BojZ1mzkwipfa/Z/eKu3APypTum6GH2mzOgmmae1P7v8ls7mQEbJwwXWs3IPHHyY7Uqyv2NNCwlE0WzVxcqWRnWvKeDDU0iPqDJLIxf1uz1RV3AEANatqexRnaeuMeI3BIBnL7xIY7AbTOO7jzN7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbS5f8Tm; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbS5f8Tm"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so31948895e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790875666; x=1791480466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mHUP2EMa4HLrfBY6PoqklysfLqNsm4NlzRpAT2qHoM8=;
        b=gbS5f8TmdxP/uhaCD+Jso5ydNkVCY35nEIJVwLatFyVzGq0L+N3BetlemWIwHkGdI8
         e6tpYk+BnYqkqT0h6ZWjusOZ8Zl9F4SDTz+B2n3X0HjcXolNKHzQqhT84xh01iqI5O32
         TkG+Vly6Z+Grup55UPITt/DFrZkgM8DMzy1AO7H7fy4eXpd3pS8IIICAXeWuyklCmW9Q
         u/d2tGd1yuJuyxRP5jMTuFWmO5QiBsarCvCNin4ESV7X6FiUXki+9RcQC3stJk+aDSEr
         h25vce6uBbzcSJNpxvxXXjEl+7TisCG7Qqwc2Cn7uYonvYzDPG5p0bd7iQ/PpjfHh10R
         p+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790875666; x=1791480466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHUP2EMa4HLrfBY6PoqklysfLqNsm4NlzRpAT2qHoM8=;
        b=dCId199gfiSMCjQOyRdZ5zoR5z+6X1gfCkOPbwbPNTmc0swEs4bNtQDKgSuu8lf9QZ
         Dgf9jZMj+AAnJ8LY+Q5liCZj06C4eOJan6OIrdn7/Xno8sNPGqBPUDryvLs+f59Uj49m
         5c7fJrP3Eat9Ob5ZFvzF4eRQrkNdlr5ebh0NC4x0b53QKFrHfp0Wm11ScSWoHK7UrBxs
         8KEeETPiSYrVBeYY7LZQaOA6Il/fRvOs2jHmTaViUQQHK0Eh1zJiGVy8mI3BKWxATGO5
         1rrjremeUWJS2cbfCSM8H0Ies6LYVl5Zg6XbpL25Kkxd1mNf/bOazxbrOkxbVpsAlVHL
         yYRw==
X-Forwarded-Encrypted: i=1; AKwUvBzbXhzQDXfW814GaCfly5UzdYQn2XfD5CGdg85WJbu5L0O1KBK+MmTw9IGtYs7YUWdZ9Mq37Iy5wNTVdSM=@vger.kernel.org
X-Gm-Message-State: AFuF++lPnuF2E1USo3Ky856GrmRynrzymWk2hy+334K71O3NSaN3TaHd
	gRfmvHYQvZcK0FgirqdK4BPBwCCCnOxtg9liNciJwXMspCxWRe82EKds8AgDZm6Ki8s=
X-Gm-Gg: AYBFou2i8uKQErX9Fmj03znVqDExK5C8ESmIi+QWhZBgqI444g0J5+GYTge9Rx8lNVw
	SnmTpSKw1j/SWwkGmipOHjArPg89TJA+FtufSnydrDwAMG+i27l7hNHxj+nXDXJdZX8tciPavfk
	ux36212MBYs0Jc0Na1TIVwGbPK9kNoamijtQY5JVr8CaSSKpYWUo3f1XweQnRvVbEkCbwLbacx6
	IKv/PazGbRw8b6N53EiJaiXP2u/u6WUF8JFXVd8oNKOWAMugrydbxO+Xfn3kp6DX/GaYwHUepSP
	ysf4V7sFYdVYSdrkjTPeZz19xQTut3XkKFcjMij+dLJackLm2LhDkoVKbKQnKpK4IFgSrQVzFHv
	bopXCdIxbImLoihiuRyO/26puIeUS01RzUam000lk4biFbU9B+IAJ1Cx4xyHSOz84ueB/LpbRGF
	XvEUlCZRhyVvNecF7jLK4PSXhl4S+YudoVEPCsngtzreB7Pxwp2aHU34bvhul+VuK99PGiV518N
	d3FliwngqkCPerWCe5fBZQlixI7VPd+Gpu/t3w/FIE4bInIH97pNlTuiud4jwMkJWSbh1CK8UaZ
	YTaJH7OV2qZIINJMKwL/Y9EO5lxJJG51nVmbVDxw/4thGysBu4Jr1ommiTKwxIQUuPX7Es9O67f
	gCp5PgsNzhDEc1uURwd4nPqjvyw2B6kX1u7GjHKhR
X-Received: by 2002:a05:600c:3b01:b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a027573634mr5070995e9.25.1790875665814;
        Thu, 01 Oct 2026 10:27:45 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691cdb3sm7131028f8f.25.2026.10.01.10.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:27:44 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
 antti.laakso@linux.intel.com, linux-kernel@vger.kernel.org, nicfio@gmail.com
Subject: Re: [PATCH v2 0/3] media: Two oopses and a hang when unbinding a
 streaming sensor
Date: Thu, 01 Oct 2026 19:27:42 +0200
Message-ID: <179087566277.2226896.14093541499965645@gmail.com>
In-Reply-To: <178921203630.98144.13238972861597227362@gmail.com>
References: <20260911194854.78894-1-nicfio@gmail.com>
 <aqUoLr0JFGEBiJIf@kekkonen.localdomain>
 <178921203630.98144.13238972861597227362@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 18 September you mentioned you would reply to the framework patch
(2/3 of this series) separately. Before you spend time on it: I have
reworked it, and I would rather you look at the new version than at
this one.

The v2 patch only checked the two pointers in subdev_open(), which
narrows the race but does not close it. The rework stops reading the
sub-device's registration state in the file operations altogether and
uses the node's own vdev->v4l2_dev, which unregistration never clears.
Reading the code further, the same sd->v4l2_dev dereference is also in
the EXT_CTRLS ioctls, so it is now a two-patch series touching only
v4l2-subdev.c.

I tested it in QEMU with KASAN and vimc, unbinding and rebinding vimc
in a loop while 16 threads open the sub-device nodes or issue EXT_CTRLS
ioctls. On media next every run oopsed in subdev_open(); with the first
patch only, every EXT_CTRLS run oopsed in subdev_do_ioctl(); with both,
there was no oops or KASAN report at all. It does not address the
lifetime limitation you described on v2, and the commit messages say
so.

Shall I post it as v3, or would you prefer to comment on the v2 patch
first?

Thanks,
Nicola
