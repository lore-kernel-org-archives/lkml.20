Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38303335555
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845885; cv=none; b=QGZuCPFu3rO4d/uwzAdCP2GF156b2MLX0JDfmMQRrbkppyJAe6g1Nifh4LFD+K+NuRUL5UmhgoVOs24Nwb5mqjRxFsKg6WcfgX7sJWxm/HzuepVKm9Rdf9dnZwXEcmfithE2iFaROYB3C+tTgam/AdeWTXTZk/VHX9zmKes0L9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845885; c=relaxed/simple;
	bh=NeHshQNFCGwJF2ysi+RWsWuwph5Ge0ieMHHyeUv2SS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOoibsptVOcBztKSA4a4q7j2+GI2A8gNnXrTjpH2BSCjidTk5IKLug3CG+kU77nqvYge4+CWHpMRmBwgjgzrOfz8Ej4xd0RjQNAF8s3T0orqGBIxqSIjgchV1yxmgRJlTMBI4myOpfrwxLCJrj0fseJWnN+BqmLQhqTyi3dIS8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VGzD+gLl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YD5FrD8L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VGzD+gLl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YD5FrD8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789845882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kjyUSthyZu35KpQeM9B/0jd7CF9c0bVVky2/qXbbeS4=;
	b=VGzD+gLlsQrMifF3+CMMRFj6AhU9LHFoULnB0WVC6DkdNAAilC57HBfz/M3b7/4ea449qV
	eTu2ubozrffDgvbJ5ZVP4hem0peLofHY5AaxfAnZZdSH1hSMaPMBF4l9w0xN3M2k4ws1m0
	pFcGiKatmM92Gfb22eiWpO7YEHJvcio=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-qpdBeUJLM6iU3QfeOU10Hw-1; Sat, 19 Sep 2026 15:24:40 -0400
X-MC-Unique: qpdBeUJLM6iU3QfeOU10Hw-1
X-Mimecast-MFC-AGG-ID: qpdBeUJLM6iU3QfeOU10Hw_1789845880
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cd74fc1aaso11715075e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789845879; x=1790450679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kjyUSthyZu35KpQeM9B/0jd7CF9c0bVVky2/qXbbeS4=;
        b=YD5FrD8L8ro6jkww6Zaehi5NslkKMNn5fdErK2+YRYDdiZGDijDXGu2dWZQbpOnf6L
         l6vFvEUCbL9tXggZRuinaZKPr/0AcEZWwD71mcOZzlfBxirqyPXBAMWrbLG0sfj/zn0l
         U5dcgZlX1dzIo6EHiKSNRSBTR9taTopsHkCgVCOKfUngynr7+Uj4+PaRNeCZAA7VQO2v
         Fw7VBCFNwa2mDatKaWOgGBkv6w8WNBziNrSwqV4kTrHS2I61iZwieu+LFgMvw8+4uUAY
         YK0BvW56/M+lH/vt6HBqJl1yrRNawiaJpunUl6VfHvxeJZC9OzVKPXAXYThBPY6XOO/7
         iNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845879; x=1790450679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjyUSthyZu35KpQeM9B/0jd7CF9c0bVVky2/qXbbeS4=;
        b=xSvME4vvn48byk2QpI5tZ7YKt+qz1UOA8Y01XUqg5bb6cyfR0NIAlrj+rC4hgxizIM
         plJ3/qUoSjn33DnGj+RBy282lph3WulX4UTvm+67k2q8HJcUROOmdGdjAyZwncZoaFFo
         0cMUCGq6dRHpPiTla9JbeOAQqxzyumE1CV/jjCVwdYYkCkODIaItaUfOO5lKeEX+5WSB
         sR/qnCzyGggxtGyhBYkB4lSLb2X27G5i3GoRRU1ffbuEnf5eQzs5BxCss9YtjkZP15gz
         oBNsgc4q7iL0cTqOxHRyjqWsUVMN0ABAE3D46+bWrtiRYbUshBNQeQsqfNxgAlG09dhc
         IdrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDWOWgIRKnz0i5/vsmLMhlY5Ld/aNu8ZISLkP+pW27CWwNssFtgChGd3fuZXl/f6A4jLqu22DIsmxhv2A=@vger.kernel.org
X-Gm-Message-State: AFuF++l/McvGKgev2PwNjSktKnUu7ZtIPVd4+6BHpY31yGbrzfo/l1zl
	LlRznNwyseuFLAjVNxcnGbBeN7sydHZvUBUShgBnlqIxAB22voQ+Gxbunsesv52Y28pBDn8AmhL
	jO+SSpQadVnHF7GIL6WyElGuWdte7MS9OHoigyOyNDu+tbCk6oTSPwVwfBH1USfwcxw==
X-Gm-Gg: AYBFou1nJ681thZBtuULtYsQNmOJOyOYQ0LJdYzhNSpZ0wtkKI/EXGXMSxO0MfO1Pvj
	4hYU/jL65Ja6mO5eMix2QhGPa4BhWjc1pw84iC0np5v+kancelEzux+10aJE+WJeGmrk1JlUk6p
	N0ovJu0bw5q0ujl5yNJf4jN5tD/nLagjNolCDVGRdMWX4QcvtJsSnD8mmBo4CGz31cCcQJyQfoq
	gA5ibbUgvxeTuYHBEPm7jMhpIoFbuS5IoBIlT6JXY2w8pZ5SWtBW2KRmBZGiK1eRjXRlGQ22nt2
	wKTpul3aL5TvsLsbaLSl0uVBPR97fUL6vMO6EniDK39BXm5u7guBvkhkgtNRfEb2eJyJnYh/D/a
	2RC+23xtZ4m3gx8CGQidwQJ8=
X-Received: by 2002:a05:600c:5251:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fc5736898mr78443165e9.23.1789845879497;
        Sat, 19 Sep 2026 12:24:39 -0700 (PDT)
X-Received: by 2002:a05:600c:5251:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fc5736898mr78442915e9.23.1789845879068;
        Sat, 19 Sep 2026 12:24:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0874c3sm138399065e9.14.2026.09.19.12.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:24:38 -0700 (PDT)
Date: Sat, 19 Sep 2026 15:24:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Nicholas Bellinger <nab@linux-iscsi.org>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vhost: keep vring addresses stable while the backend is
 attached
Message-ID: <20260919152336-mutt-send-email-mst@kernel.org>
References: <20260919131744.131030-1-physicalmtea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919131744.131030-1-physicalmtea@gmail.com>

On Sat, Sep 19, 2026 at 09:17:44PM +0800, Jia Jia wrote:
> vhost-scsi keeps the response and bounce-buffer iovecs until the backend
> completes the command.  If userspace changes the vring addresses while the
> command is in flight, the completion data is copied through the old iovecs
> while vhost_add_used() updates the new used ring.  The guest then no longer
> sees the completion.

I do not get what all this is trying to say. if you break it you get to
keep both pieces. when is this a real problem?

> 
> Reject changes to the vring addresses while a backend is attached to the
> queue.  Keep accepting the current addresses so userspace can update
> VHOST_VRING_F_LOG or log_guest_addr without stopping the backend.  Queues
> that have not been attached retain the existing setup behavior; userspace
> must detach the backend before changing their addresses.
> 
> Fixes: 057cbf49a1f0 ("tcm_vhost: Initial merge for vhost level target fabric driver")
> Signed-off-by: Jia Jia <physicalmtea@gmail.com>
> ---
>  drivers/vhost/vhost.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 44cac11b68d2..074590838de5 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2150,6 +2150,17 @@ static long vhost_vring_set_addr(struct vhost_dev *d,
>  				a.flags & (0x1 << VHOST_VRING_F_LOG),
>  				a.log_guest_addr))
>  			return -EINVAL;
> +
> +		/*
> +		 * Commands may retain iovecs derived from the current ring
> +		 * addresses.  Keep the addresses unchanged while the backend
> +		 * is attached.
> +		 */
> +		if ((vq->desc || vq->avail || vq->used) &&
> +		    (vq->desc != (void __user *)(unsigned long)a.desc_user_addr ||
> +		     vq->avail != (void __user *)(unsigned long)a.avail_user_addr ||
> +		     vq->used != (void __user *)(unsigned long)a.used_user_addr))
> +			return -EBUSY;
>  	}
>  
>  	vq->log_used = !!(a.flags & (0x1 << VHOST_VRING_F_LOG));

