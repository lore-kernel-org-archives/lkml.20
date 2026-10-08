Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA83CDBA4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443167; cv=none; b=i87vllAj6dJ7zko8vObgte2iK8Wix0M4+DIJnkJ9WfbJedzxmt7d52XckxYl+VpQ67mkL5GoIahxdHr3amTPgXKIqgY1EQROfzHDhfq/ff2mldY3sUcnUo7bzzHtjPxck6Y+MJeaL6uJhbP8cEkpEt1OypvrVbrQgKJEir9DvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443167; c=relaxed/simple;
	bh=SMQ/AIdgJkr5O5fjNFTHt4fefg0SwuXDpd4904cBtmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XxeYZ3zfKKnoyfea01/xWCmKsWcHSNQGBnSm6Re7eB33n4R50iETFYSqLox0G0exzBG9IvUHwgf4u8YxtDydzFuE2jW4t2IqKrF9hmpMt5pazmwpk/4QUqr9Nz3v/Q/38GYw7Dql7XEo0psc3L1JecdCmH4cVR/7lLyR2oVPZyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okLRWIeE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okLRWIeE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso43897785e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791443164; x=1792047964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SMQ/AIdgJkr5O5fjNFTHt4fefg0SwuXDpd4904cBtmw=;
        b=okLRWIeElp920G0IBHYkDb6CFSJubsb8t0zT1FdAR+nAbYW/a/noXRfIU0IgCWAS0H
         M/RpBRbN+/0xM9328YI871UvGP7doePKgFS6hHNPeyf/V4paygF7ylXZ1+n8zrdDNnU1
         XaCbSoIhjvK2ikeWrfer+XEY0B3rbeQInP/gPCES/lWZ/BdWTf3m464syCoLqdCN2Gx0
         oH12NV+5t+NsdcEytrz6w1SOP27HbW4UlIBgOlqtk7RFOTSvLU1x1SZvQMpSNQbKKnsv
         9Xh0ZW6wDIckFiV91mLzzRYtC9Jpmni76ACvolQYplPwJzXa29HjkZilsfKYLqqCmQj8
         8Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443164; x=1792047964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMQ/AIdgJkr5O5fjNFTHt4fefg0SwuXDpd4904cBtmw=;
        b=hjzZlakkzB2kZ3WsZ6pRoKiooBoBnYRNO1r8sHoR2P7gRtMPKHxOAbuKIbLjD4dTVW
         w5jz7dQz9Pdoyxi9UqUoZHcvZas2g2HH3OgnIvRHBfiaN9hhHB5HjoTjl5l7MC8WCpqS
         loYzQBMDGrYjn3vaWUp28evDDNwcdAfRSwF//qNy21EIdqJ/Q0aAz/bvdk5/1ixaWSHr
         eUtk0MX03vUWAafP8+jkqYq22wQBa75m1SrQ4CTbE5/NoKDZWNYpdCIx9KIMNAX4tDHE
         WHZFl/O7639wIAdo9YVz/Qyb1+I9w0fr470EcjDlxUkPaTY8Blq455utzpv3U+XX0QL9
         G4CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD9H0jMQMMEWNiSE+8VbnwEPESonQWOjFLU6zg2ue0IBYKvYUEO7h4/h4dqvrv7NbKBrUF7bIwLxthcqA=@vger.kernel.org
X-Gm-Message-State: AFuF++mNNQGMLjNsJBtDzjBUMyJYvf84xOJYHDZA9Kd8k4pWL07dnAuh
	2GH42dwqT6sA1jKi6/7TO/A+gnizZjd11oQMg1KKl7daMJCT5/6eGaQ6
X-Gm-Gg: AYBFou3+Gg4QZr3ToQa2zAYvxDtSaKPY1PmajfZwz9urr1rf3OX9xdctgjVrYSpZOmH
	riByBkO2dx7+Q502oIlya0HUbRjGcHEr5fGL1C7lG13xoqJ9mhOQxabzcslBGTHFLhaeWlDFzIO
	6Pli3ZsMju/EGyuDmi/9A//RrbcMWjLIAcSkajUR+Ruv1rjB1OGmAd76Gh42norN4GOKx84U5JW
	h3LgioCQVYQBjOOUUHeXNZmeyTw486uxv5TTQgXLzkPk7fDPkDlexyq1aIj3rUwQ5Kigg/dMM6e
	DcG8zXBw/EfA3rBYBS7e3X8r8ehr1bpxhSTlQdgcN4/AWCE8X/cVk8kgWPopOyAkApOm2BMsHus
	fEbYC/FuGNtVkmzZVH1tQVTirOX4E+98ZGn/094egwsGighgYBzObXK1G/jSyVP0xkzY/LK2QIm
	zolgvWG6a5xtiAvmT9PeISbYDYxzgWPPNsMPhUMcocrZhgGod/EMotUFpN465YIh2g2t6BwlQBP
	n3kUNq9iUbOIRaUflLhH4IkuCetmblUcuZCxK4IswxgrubiAuf7LUTqYGMK2teM43/PgR+yVvZf
	855t9Ja0clvawQwKYy24SLKLwVd9JYLi2dh09DI1Cri2Jlv5UdFZfI9oRQU/51KohFeJH+V85Jc
	e10pd4blqEvNYZkA43AT/JesHcuEM+4NMwTZP/LoNcGXv9XpP9GA=
X-Received: by 2002:a05:600c:a087:b0:4a0:1fe2:d4c8 with SMTP id 5b1f17b1804b1-4a1802eabe2mr77020485e9.5.1791443163776;
        Thu, 08 Oct 2026 00:06:03 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843e3356sm42833285e9.14.2026.10.08.00.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:06:03 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
 hverkuil@kernel.org, ngocthang2710.1999@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, nicfio@gmail.com
Subject: Re: [PATCH v3 1/2] media: v4l2-subdev: Fix NULL pointer dereference
 in subdev_open()
Date: Thu, 08 Oct 2026 09:06:01 +0200
Message-ID: <179144316198.13032.1846729931094664641@gmail.com>
In-Reply-To: <20261008054842.GB683793@killaraus.ideasonboard.com>
References: <20261008042600.275884-1-nicfio@gmail.com>
 <20261008042600.275884-2-nicfio@gmail.com>
 <20261008054842.GB683793@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Laurent,

Thank you for looking at it.

On 6.12.86: agreed, that line does not belong in the commit message.
The runs that matter are the ones on media next described in the cover
letter, and those are what the commit message should have referred to.

On the fix: agreed as well, it does not fix the problem. subdev_open()
now goes through vdev->v4l2_dev->mdev, which is only valid as long as
the driver keeps the v4l2_device and the media_device alive. vimc does,
through its v4l2_device release callback, but ipu6-isys embeds both in
struct ipu6_isys, allocated with devm_kzalloc(), so they are freed when
the driver is unbound.

I checked this on the IPU6 tablet (media next 9cfc1aca0781 plus the
sensor drivers mentioned in the cover letter, without this series):
with the media device, a video node and a CSI-2 sub-device node of
isys held open, I unbound isys, then issued one ioctl on each node and
closed them. KASAN reports use-after-free in v4l2_ioctl() on the video
node, then on close in v4l2_release(), v4l2_prio_close() and
v4l2_device_release() on the struct ipu6_isys allocated in
isys_probe() and freed by devres at unbind, and more in subdev_close()
and __vb2_queue_free().

Patch 2/2 rests on the same vdev->v4l2_dev assumption, so I am
withdrawing the whole series rather than keeping half of it. The
underlying issue is the lifetime of the objects in the driver, and
that needs a proper fix along the lines of what Hans did for em28xx,
not another check in the file operations.

Thanks,
Nicola
