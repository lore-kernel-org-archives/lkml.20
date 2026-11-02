Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637404;
	b=my2guvFauX4IjdIwJUH/VedjIZ6ALbdt22aAnZSCHlxjw9M4AwK32vHsNxAjLBmZszwG
	 0O5j15y5vJh9jfPqzt4gKHWfcI5ttUyoyk0XPK1iTS6jrnph2390lFbAXQjgKQAi9LgAc
	 qQHP0gzcJ5Zej01LnFcmjXT0UGQOouc4le3n8le6bGuSpONMNGf0pp3WhQJ3RgMwlKsqN
	 zs8r+lcZUhiCAbyevFWqG3xKejuOqYbmd2G3n6AFSz9EOcmBMh4H/wEX/cJXOruQt0W1y
	 bjHuVCg7JRmXfhujPOe0LSXl8im9y7anrz/eq9hBsPM+RkmvShErPxl29JNzSCOu1Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637404;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pmxkjQHYZxu5Fni0akKQ9coEAC1dNmzFGp5ph6xLMkQ=;
	b=H/22ACJ7F2hXVlztxRtlnwzHEFY28+QyHZ7B3ZC0opFTKcKm0Ru8zmvwPjEGx4l+VCMc
	 lXkQtZKHaDVACsgj0ci9FPkdWH1IM2fkBPaDa+420lcLJLgG/bTphURu01Vk7nJc6OhoY
	 x6PHBUoesuPiz8ywalwlGtq0PkgjhbS8ug5to34vE0QBJ0WMs08L4FRsK6aOioogpVr7h
	 6HhmTsd9q+x5ge+wbKdOO/SVOaxd2yU33SaVtMz6iODl+oqIP23i1WgsdrYKSUELmIfsW
	 dnrSLR1+YaCZYsPh/kO13NjRRpgVSaf48Mxcfgm9STWD6R0APA/6doVfaCJ0uqiOjiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BZ4LLZyL;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SkhXKQa5;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BD3606B0FF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BD3606B0FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BZ4LLZyL;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SkhXKQa5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793637403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pmxkjQHYZxu5Fni0akKQ9coEAC1dNmzFGp5ph6xLMkQ=;
	b=BZ4LLZyL03mW+ZxZpmHsSI+nC0pthdPcU1SeFZZw1D8Gk6Z/uhOfBZ7lhLLmsvgC9yfGGe
	3QZQlW084dRtWbl/Id6Xe9Hh3f8GaYxDcnUgby5jM2GfQ6cUU2c2Hl0WLWeDS4V0WMJOBa
	GRJVPxst6s8Ob65sZC+eJa0ucDF8OqQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-j2c4L8LqOQWQlbuMtQSf6w-1; Mon, 02 Nov 2026 11:36:41 -0500
X-MC-Unique: j2c4L8LqOQWQlbuMtQSf6w-1
X-Mimecast-MFC-AGG-ID: j2c4L8LqOQWQlbuMtQSf6w_1793637401
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49febef74e3so28921775e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793637400; x=1794242200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmxkjQHYZxu5Fni0akKQ9coEAC1dNmzFGp5ph6xLMkQ=;
        b=SkhXKQa5SrVShAKn/Xv6hGHLDu5z49IRxN9UH+UEyxQDYzhPyHv+4yqd+i1QKjR9CI
         dXypMZVR6J39XWCA7XNQYnhCY9IkOfLnxhAQeP9/sG/HWj75x7hxJnEsvSy6PZXWNeqF
         Mgd8/V5lEwLNyzq6hARzda7nYnOTrQJicA2IXSpfY1qB7z8rKX8uNoq3XxdnJuF3D8I1
         jI0O/Nx764My0/vVN2G6+gaUk1zIg4zLbYYh854rtfMNfY2NFmQ0SffjxbpfDB5SOWcD
         9O8NNwVpFA1Zaqp9nNGmsIkNEnpgVflMwS2pGFmoCdHyQKGdpHLThGzP08htEZ3gN8wk
         leew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637400; x=1794242200;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmxkjQHYZxu5Fni0akKQ9coEAC1dNmzFGp5ph6xLMkQ=;
        b=RjK7ySBgkk8urKYo348qdpy+VCatVHRbce3UPUAJ6OT9JzVmerVEVSV0TuQGoufLvt
         B++18aEVIT+uzGpMmBDMEJfthVUDHgXs8jkxlPYxOxQ8mn1mYQNhffe7DiwiGV59RHnv
         LBYNuHiz3+Dfaw6g2b5iPXCOOEuadzWJuU/R1gDEZ+ZyZBt1i+etGWdH7fYXraCTZD5S
         XYDlITKBeerig4DSHv+vEWgvA0pjEeKoLnkENiWe2bqaM54VvN/5mrlpd2/3QG6QBtN0
         nWIGPbEzODnP/vvgXx5TopBxr0n2sAg3SkAaFoOnicQH+ktf2Wk0LKNFZenxNGJNxe+v
         v7Gg==
X-Forwarded-Encrypted: i=1; AKwUvByurx0ArAZTCCospAowxIex7RQOuYe9U4fTXpdnQGboUFA3H5QCmD+9mpySjpT/W2vDWhpBT00ROp+REw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7MhDQnXTHHrbngo5r9iMAn8IJ08+/Wz5xD5C2IPD7XwI//yw+
	ZEDnIWxx5aSjrEsXTMpR6P4w3Du+PhIuR52EJjewVsttcqjJor1rquFJJYkNGQaNvVPJQOLkF5u
	o5R+rWBQdPoKyRZQ5M/kjjf1m3RWfYb3qz2m14xUMl9RPVPhgGk3UpFhRMqeLdZXt1w==
X-Gm-Gg: AYBFou3EiT9U8PROBgqYkoW2A2RoPPZ+QugZZoFFBsvBDQX4pKiI/oaJ0EYVvAwz2VY
	oWElFED/3jVAysUIV6my3igsdMLDJPwiq5ocf9OGZkoHEuwfP9S6aeNg6dzdd3KA0+/4JTiaO+6
	4Qj8EPNN5O4jeaSJDzd4xNMbKsvzvwZGZVb8IX6VMzjKhT6iNPd5k3AOohP9bNh8gCHZqrOKmpk
	9tBwQWj+iNpkNoON+iL+C3+qpmQK3ji8ApZ1+4m29IIMB+197XQULjAWqOZCL7eyPQE76hTOqjt
	jSXLEqkovkBn3A+mpvFcQlfwAZ4tbxNfZ7A5l3PIYbIA8NvrabBSU+V7S9JkOBdq2790wnIDkf4
	l1QAqptDOMfNvfNzJ6pMiXaLnlGPDSi61Fd2vzZ2RdQ==
X-Received: by 2002:a05:600d:6508:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b0b9ff2129mr79309965e9.15.1793637400513;
        Mon, 02 Nov 2026 08:36:40 -0800 (PST)
X-Received: by 2002:a05:600d:6508:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b0b9ff2129mr79309335e9.15.1793637399951;
        Mon, 02 Nov 2026 08:36:39 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm455824455e9.3.2026.11.02.08.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:36:39 -0800 (PST)
Date: Mon, 2 Nov 2026 11:36:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Dragos Tatulea <dtatulea@nvidia.com>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 RESEND] vdpa/mlx5: Don't free QP buffers if destroying
 the QP fails
Message-ID: <20261102113629-mutt-send-email-mst@kernel.org>
References: <20261016035851.771496-1-oss.patchbox@gmail.com>
 <a7ed450b-5dce-4485-b4a0-9349e75e4c52@nvidia.com>
 <CAGG=RgB2NYmjugQrVOiKyfPF=_aU47CY_JXGmCLQ-kOe4Cxp0A@mail.gmail.com>
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
In-Reply-To: <CAGG=RgB2NYmjugQrVOiKyfPF=_aU47CY_JXGmCLQ-kOe4Cxp0A@mail.gmail.com>

On Sun, Oct 18, 2026 at 10:56:31PM -0400, Yuho Choi wrote:
> On Fri, 16 Oct 2026 at 12:01, Dragos Tatulea <dtatulea@nvidia.com> wrote:
> > This commit message is long and hard to read. Could you make it
> > shorter and more readable please?
> >
> > > Fixes: 1a86b377aa21 ("vdpa/mlx5: Add VDPA driver for supported mlx5 devices")
> > > Cc: stable@vger.kernel.org
> > Nothing against the change. But it does not deserve a fixes tag.
> >
> > > +             /* The QP still owns its buffers */
> > >               mlx5_vdpa_warn(&ndev->mvdev, "destroy qp 0x%x\n", vqp->mqp.qpn);
> > While here, could you improve the error message please?
> > mlx5_vdpa_warn(..., "destroy %s qp 0x%x failed %s\n", vqp->fw ? "fw" : "sw");
> 
> Thanks for the review, Dragos. I'll send a v2 with a shorter commit
> message, the improved warning, and without the Fixes and stable tags.

didn't get a v2

