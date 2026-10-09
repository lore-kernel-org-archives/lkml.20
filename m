Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480C81A76BB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510913; cv=pass; b=YTny+k8JYrOhIEtGpJzneXisXF6cOlngn2w1cR7wAScPi7zir9NQUz77WhcKLBg9bzTqVugnaUcnN/6qlLdG2mXvEbLSoCfs/4Rd4ie/3gj8t4Nnx2IqQvqtdY4E5bXjcuVMLXQyor2Vez9vEcVj/IRZ6xkhvMDIe+G2QEnR4UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510913; c=relaxed/simple;
	bh=7FfE+Gjv/oitWMZfuNkc5CF1K6v6lHM3CtNTQ6IgqBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmhOMVbm4bxHWUnp8rTDfNRKvxGCf4MpnRKSJtW8qczyuGcDR7VsMbLfjvj52lVlqYasDVmcaoWRopeAijACjlVbRgk4THkdxOF2R038ABBno5AurycZw4TOQsWIdNya9E1W92CuP6NVcKSiPVJyADJnfaSBczGZYLh6WYzq5Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek6dfgqt; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek6dfgqt"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e5c8f53a9so310777885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791510911; cv=none;
        d=google.com; s=arc-20260327;
        b=G5yNxmlbHiCMO4W+HRx8V+6cbkW7hkzjC4X2Z4IGNOgq4q8ZGkeCCr9ZznDC6lxg1u
         cQ1KieokbPU+Gok8qP/x4Z/97RSLpt0pkDD1S2dq8k/bAPGLiDxo4Z6pqGQ57A1XUdWF
         FHJpnxaH/urbJk2BxBRJydUueNnFJ68c6kCMePA+0UM8Ydtvb3h0KxZnJjBBWVrn3sXm
         pTZYiMrhantz/sJldSWo/LWUaYuK5gqs1EvFZcNWsiilXv79BsWRy7Hi7j8M6+83HR1m
         5730vDtC1gfIY5Vxu+aubo6UqEfCUlilUqn1Xj0M0Y0D/TmkJF3UB7aPDIiMDDp5h9o7
         Bnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=irH5WtAUt7osstUCIXJbKMQBkmRxwYnXlK49ZN1iZhw=;
        fh=Lu/lJ1KT6XS94xoW/2kquk+pj6dFoGU1c68VaI7jKs4=;
        b=RJMPQCuemeb1dTfuKjnQ0QfVvOCbm5gnGkSCYWmglj9xz7fmZC/2GD/xfc2/jTJftp
         YYMSMwkRdtocKqKhWWadJlc/Mbjs2pZATv84I+Sh2nfXY/6ppC7WGtPWAKIlU9I5z5BO
         5I8vzNbKc3sLaRXuZ0Q9HQ4GGt+w8nynXrvKMloAXCQuxQNe4M4/w/Fov3Hv8OGNulxD
         GhaqXmeYQ19YJB4rsuZMXk/hazXNPba3xMzFrQGZKGJPEQReoYGNcTlNxGjGZlAp5yYA
         K3DwTwkc98IXpWixAmzITXIht748BG9E8feq8VA5y9nFqNP22h1xKtH5ndMNkrm8zHrB
         s8GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510911; x=1792115711; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irH5WtAUt7osstUCIXJbKMQBkmRxwYnXlK49ZN1iZhw=;
        b=Ek6dfgqtJGMFnOaaZI2ajABVdnx7qHW+nRCj/Ny8PxOnr/xBdhlk1ccFKfpCSKZk3i
         rU9sWRuxANy3nJJVRb1KX/2Z/+RIlTptDvA1dzkHQZ7G8A2Yj6O6RkAzusiCOsPamDjk
         3o90/N8gnoKFC6GsvulJwo7wQiQJWCkylqIZ1XIN4humBur0tCBY9hHlV1cX5i0qSIb7
         4MSITv5Bh4HczFSj/z4P4n4AjWhofNoXw+8lBceQbMC0tTkz1t8LgG+HfzZCFHb3KMSn
         2YtUYuYtP72hr2Bajyg9h2fclsmYR3fJxy9lYfF/L0PgHPtqkss4bD9oUG3+hLwIjMh4
         VlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510911; x=1792115711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=irH5WtAUt7osstUCIXJbKMQBkmRxwYnXlK49ZN1iZhw=;
        b=IEsOomxqmpCyxMHKicNfy8nh/s01pvCRVMVJ07tK03KB/I9qZNi/PrJOZ/Yhv7QLi+
         FyDHp5YC4IxIqoiDousOEYiLhhEIlr/BSzuOx7RlTJk11vzVfzDM3oGYAvfwdljl+JT/
         /59Ekf0ebjC0m0uxPXDYH7WdnIlpheXQQ4xPNNdYSr46wXh/sqqU9jL264mUYhUVNRTW
         hTjUK26ke8W+K/nM7N7oJxOlIcS7T16cpwes9TAilAaHJMDgKpSMim6KdREdGOpME3zm
         uYE7CY8gJmKD4K9jUrft7pZez4AhsAG8y5P0TZ6FmQRAIjKYi4kFUWGDnJc1VWAgGe14
         wdYg==
X-Forwarded-Encrypted: i=1; AKwUvBwmGG18xA7hS+IbcO4E4nejAfUNhVxkDDv1+QpQcN/wcTktsvhb0oatfcALyDu6UW5QnTW+nHI/ygrM/EY=@vger.kernel.org
X-Gm-Message-State: AFuF++mTpYVOVQfalSFk8AvjgM0l7nz2zch2iGP2aPBsWBbGYLGYH6cU
	46mui4hUH8STC/tkCat28LwGBUszPhpVjG7eikvwx+R3x3Uc5gPyZQ65hpYFZ06ToxKyYJWIkG6
	tNduHwkCefrgLtceZuZf4i6g3uqROPz0=
X-Gm-Gg: AYBFou2o3KMogWc/+BHnYAAA9GYYDZCH3vkzBjD7v9cwbCIiKUT8HZGFgh6gZOp7F9J
	SjMtAsCaDIlCriqVfyqCQpBHuDOFu/fc7VCJgTQXWxmWwxd8W/sBNK4qrw3A73EoiBeFtl7bPWz
	lXpcSvesxVkqf1Yz/82elTVRN5dN57mM9U5Wf6yxrJhdc5oVuD33Ev+zvIzLltjNkW+lkH3oYkw
	ontmXYPtqZAV0DASdm4CKUVtZ/RO/lJTrL1rdvFUq5mMMX37k9SW1k5/l0Vk2HxyRWLPDRASzfo
	CflBb2dPVBk160flvDCXT8DCZSqkuQ04JI23YnKbSHSHnFSevoaMqKw=
X-Received: by 2002:a05:620a:4146:b0:93b:d79e:18ff with SMTP id
 af79cd13be357-93ebd4b3751mr66750985a.66.1791510910201; Thu, 08 Oct 2026
 18:55:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006082102.27085-1-physicalmtea@gmail.com> <08e68e3e-172e-4349-825e-13bafda8c365@oracle.com>
In-Reply-To: <08e68e3e-172e-4349-825e-13bafda8c365@oracle.com>
From: Jia Jia <physicalmtea@gmail.com>
Date: Fri, 9 Oct 2026 09:54:33 +0800
X-Gm-Features: AclHuK_8ZpspQbr1VUz--jCkNxAVH4PyEVkIwHKuXxRYnqVazc-zqTuVcZPApWY
Message-ID: <CAJwVaMJCgJYJP3Mr5V69cxFe9mNGmG+SNAeP6Bv9+cYc0vnr=Q@mail.gmail.com>
Subject: Re: [PATCH] vhost-scsi: do not count PI bytes in the data length
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On 10/6/26 3:21 AM, Jia Jia wrote:
> > vhost_scsi_handle_vq() moves pi_bytesout and pi_bytesin into the
> > protection sgl and subtracts them from exp_data_len.  The length passed
> > to TCM is still exp_data_len + prot_bytes.
> >
> > That sum matched an older target path which subtracted prot_length
> > again.  sbc_check_prot() now replaces data_length from the CDB only
>
> What patch changed this? Did all the drivers except vhost-scsi get fixed?
>

I had that wrong.  9f977ef7b671 says target would subtract prot_length
and points at 14ef9200.  That commit is not in the tree, and the target
code never subtracts prot_length.  The in-tree behavior is
e2a4f55c6498: if protect is non-zero, sbc_check_prot() sets
data_length from the CDB.  The vhost add has been there since
9f977ef7b671, in the same pull.  Nothing later changed it.

> > when the protect field is non-zero, and only for READ and WRITE.
> > target_cmd_size_check() leaves a write's data_length unchanged when the
> > CDB size is smaller.
> >
> > MODE SELECT, SET TARGET PORT GROUPS and UNMAP then use data_length as
> > the size of t_data_sg.  The PI bytes are not in that sgl.  A parameter
>
> Can you have prot_bytes > 0 with those commands?

I did not describe this clearly.  MODE SELECT is not where prot_bytes
comes from.
With VIRTIO_SCSI_F_T10_PI negotiated, pi_bytesout can be set in
virtio_scsi_cmd_req_pi, and vhost does not check that the CDB is a
READ or WRITE. .
A MODE SELECT sent with that field set hits this.  That is what I ran.
