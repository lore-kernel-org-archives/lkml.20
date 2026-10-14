Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D784F4CF8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977280; cv=pass; b=P9Ig7mu+3JImGwRcg4n4z6uCBHU9cSyW3f+71M+BJ6wbl/9JYF5Sw5JGk+8VsNuyBk/7J2OwtdDuUaEdR4+I04hDOVAp1vu7kxokd9OrNuizJNqxZ0hCk4y9y9PguiAvkQebz1a8JZznG44UNUu+mBNup/tDiXpgX5HwM36Uu9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977280; c=relaxed/simple;
	bh=a5L7wozFkjsRHYT3hIlj5vF3CGkGjnoIBdPSuy5ToFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1uBt8oZX52j7SbN3bZ0hK5NGjWJuCLYMr71FB2EWRlRFG7NZUXtU4/zPoE84vSD7Bbbd67AQpK5MK5WcITEUelUq+Mdod0uFaAaDc1ARuNeaLJYN695X0J4dEyN4zrTmLlpB0oxGfXSBm8uS3SYE3uKVe72IWnX/PxZvAcKAVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWlJJANF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=G+PwQ7h2; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWlJJANF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="G+PwQ7h2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791977277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5L7wozFkjsRHYT3hIlj5vF3CGkGjnoIBdPSuy5ToFI=;
	b=KWlJJANF0kAW0/76/Xexm2NTzyomO/CjR2YTg2ZRZ3ngcqXoN/0NYyXV+HeWUdGa9rVxs/
	Yx81tPEKaJaN1yRcWkf0mpwEGP+OjdPCmsms9LIgQdkF4ebC4IUatcJJjp/TpPxhiz4F34
	wKANnL4oUMx9FFgljHEq1JqvqWk8w/Y=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-7gP_2DKjP6iuygIHQYpGcA-1; Wed, 14 Oct 2026 11:27:56 +0000
X-MC-Unique: 7gP_2DKjP6iuygIHQYpGcA-1
X-Mimecast-MFC-AGG-ID: 7gP_2DKjP6iuygIHQYpGcA_1791977276
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf71bbf197so3284777137.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977276; cv=none;
        d=google.com; s=arc-20260327;
        b=okOEKImi8i6e9Uq21Q0ECITKJnoeyQ+0svciBjRsDVQ/A4gVAyzNEaKYIEfrYbt50r
         2GIeGoVZaQHhshraqkEUZRKCwBgC4b4PfXHCatqp6TpDYLD0lWfjYBVRTd5wDnTNgW5S
         JBnb7qju9d1E5S57+jwvHFZCH0oTwYQkH5ddZdoiv6CxHaiOnkbTip9a6pU6/f4Fjgja
         Q27UQAtMdU2v4KnIVFkNIOzkwvtU+A7HNmwmH130ZEJF0O8Kg5/LdzWeb/BRPzRUHIcu
         q6Dijx5OB8c0LZS7wQqaOfUYzSt2mPUChSd1LXUmqjzGjt+O+BhXwS8O3bYFal/g5vNM
         SGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5L7wozFkjsRHYT3hIlj5vF3CGkGjnoIBdPSuy5ToFI=;
        fh=0uPTpBtdFS4AHQSqL6IGAnh21/4N7jrFtOYBpFSrX7k=;
        b=s6kbc2kWLTX3hoyViajzwMe9AENDF1a7NebfK8fPIWvInw9qkFY8GCms+/HFmTlFQV
         7yZckUSsxM5hiLyPlAnqgmoRXMk5MFo/pV9gXL4C+ZB/fGoti0PBrrNFxyCBnrSGlNAn
         k3Ov3zKL4NbFwOaNPqWtLyn6aGLbeDQtGg/CyKIqbybS8UQy1oyoOJ37ZGcUcHkOFKKt
         VwxJHtAry9M5ry3vJ+I56v/INANDOfSJ/wv9RJbO4Lezlb9iG5lgzLj8FywfCjwyZ9TZ
         Wyp0d9Aypu0uXbtJCL45GfUqbIeBs7Sx7BYcAC9ju4FrsTe5OZPa3WglfDV6+GBf47iP
         43bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791977276; x=1792582076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a5L7wozFkjsRHYT3hIlj5vF3CGkGjnoIBdPSuy5ToFI=;
        b=G+PwQ7h2b14exe+hjOHrGOljFppyQr3giJWS06N1eoYjRxC4e7IQcOewyGtkpmNO9D
         tRGSl8M2XU2ck5oqhfVF2whFfK4j6o5o+8a9h8CiF9EI/Ubk+pNWFjfsgyX5vzCTufhJ
         9H6FD0wulQbYLaQkHlH0u2/7C4rQB64Sa022+nijCRD96y3NGklArT14fbgGjL8JyBhp
         RkkauDChrvYSwhkcmToJGoBf1vagLjz7+Xl6D/D70F+fvFoCtzwNhUbAS9ubNXgUxvmO
         uY1PfHIaDR+TqUdNy3fQs2wJ8tXLhMvDuM4Tgd7a0wK5ufI2X95DXAGyj3TmPv89I3GG
         MUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977276; x=1792582076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5L7wozFkjsRHYT3hIlj5vF3CGkGjnoIBdPSuy5ToFI=;
        b=y1e+wBPADvEDtW76Rbtmlp89hEcdeuBJB+4xtYwnsme0KqTfH3kdZaYrpFzbYOGuqA
         49NmzSIdjhV8MgPqCIOPFehACRYDNzBp6JgR+PKT6xjED+mJ7L8APXe5Sxsy6805g49F
         GlWqKYUAx1i7jrz95HV9OsBd07xoTtVPlS5jlzzJ4GPCwMXnp77gGhFdY3FuHOhpRU5D
         qGgXGFoA64CzZLHSp0KKZOt1tSUmU3mhS1gixea0ZJYTYaqABz8A9Yd2ScKqLqudeRZd
         Us930YoQj1YrSHXGF2oa4k9tbXHpYKsbLgVwXSOaf1L8ouzRWuV4umFSge7DyYxRDUvH
         Wg9w==
X-Forwarded-Encrypted: i=1; AKwUvBzqmL6AhYXyKI/9L6qpU28uwCix1KX2ShZ5eTZy4vm9IeeQ/rLgzKQpkfeyAQeLOm6vd1YhvEtVYaRZqTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYId11rN3kRi0sJoWZknxV49slgL/7PTevwgNeghsjGrtjjUCzrS
	0jaDO1KViGfcwJ6TeQTwjKY66NK2FjYPQRDH1YDIMwHR4jtCxgq8QXXqRtxvH5z0zUSi5VgcmSo
	yP7g1qXBS5BY4vv4+V1Q4LD3QknR3WLlGRMvUgfst9pUge2qjrqDJhIebCInxZ2GQLbFsHGB6m2
	kBzQVBYOl6T3h4kGzYNw5rqtVNANBgekPXmjE9qFGL
X-Gm-Gg: AYBFou0qzkiLk2mP9K00sIVNrEnkdsYyLVBr/1xB6F39kL4dx4u9k32+D8bHbTUuw3z
	VE5kPxEAYzKG55KYbOM3GWg1F9cesOMtB8sK5z1KF9q7+aGrGtFCt1qBNYrBQFKt1yZG2O0Z0mR
	cDEQuJSKqjR6ShVX4ujW+XJGs6/4wSslIcF2yHffsZ94CsfuD/FcBxP5tY8X+asECnoYOHwTyre
	uDSHYgHe6tWg+c1LlD1DoIwI9c0767oRw+Mgwt8
X-Received: by 2002:a05:6102:2c82:b0:7bf:6218:bc59 with SMTP id ada2fe7eead31-7cb373e93d4mr5360961137.32.1791977275656;
        Wed, 14 Oct 2026 04:27:55 -0700 (PDT)
X-Received: by 2002:a05:6102:2c82:b0:7bf:6218:bc59 with SMTP id
 ada2fe7eead31-7cb373e93d4mr5360949137.32.1791977275179; Wed, 14 Oct 2026
 04:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com>
 <b8c135bf-927e-454e-8bca-cbdbae133d51@huawei.com> <CAKPOu+_Msno=mux+FUc-oV1-ywRFujJcnKS2HNv0sjtRVtUP3A@mail.gmail.com>
 <CAO8a2Sj2UbocxY+_MRdcH1TWht=UJT+ANWmzqLY9MQxZ0ujUpw@mail.gmail.com>
In-Reply-To: <CAO8a2Sj2UbocxY+_MRdcH1TWht=UJT+ANWmzqLY9MQxZ0ujUpw@mail.gmail.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Wed, 14 Oct 2026 14:27:43 +0300
X-Gm-Features: AclHuK9Dt6BVQBEgP32q9R0awIinzTpy5bwl4pmAWJh1Bh7UXUQjRVmYFm298y4
Message-ID: <CAO8a2SiVWYSR6s=Z34QcfPVNVSLGk+YQQza4DDEt8_8+j37AHg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ceph: don't unregister an MDS session before
 removing its caps
To: Max Kellermann <max.kellermann@ionos.com>
Cc: "chenyuxi (D)" <chenyuxi19@huawei.com>, ceph-devel@vger.kernel.org, idryomov@gmail.com, 
	linux-kernel@vger.kernel.org, xiubo.li@clyso.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Max, Please resend the patchset, the tree has diverged since this
patchset was sent back in September.

On Wed, Oct 14, 2026 at 1:46=E2=80=AFPM Alex Markuze <amarkuze@redhat.com> =
wrote:
>
> Since the last merge with main Linux the testing branch has grown by
> upwards of 100 acked patches.
> Xiubo acked your patch, which is good enough for me, Xiubo is back on
> the maintainers list for ceph client.
> I'll take another look at the discussion for fairness' sake.
>
> Feel free to submit and argue for any other patches you feel are necessar=
y.
> If a patch solves a problem or adds needed functionality it will be
> reviewed and applied as always.
>
> On Wed, Oct 14, 2026 at 12:50=E2=80=AFPM Max Kellermann
> <max.kellermann@ionos.com> wrote:
> >
> > On Wed, Oct 14, 2026 at 11:15=E2=80=AFAM chenyuxi (D) <chenyuxi19@huawe=
i.com> wrote:
> > > Do you have any plans to move this series forward?
> > [...]
> > > Is there anything still holding the series back that we could
> > > help with?
> >
> > It was rejected by Alex Markuze, and he never replied to me after I
> > questioned the two reviews. That's what's holding this back.
> >
> > As for my plans - I have more Ceph unpublished fixes in our internal
> > Linux kernel fork, but I'm not submitting them, see
> > https://lore.kernel.org/ceph-devel/CAKPOu+8SiwxT_44e63-EZ4T_4d-tGjwmk_L=
x8i4KgZOL5JnMtQ@mail.gmail.com/
> > for why.
> > I just looked it up: the stack of Ceph patches in our fork has grown
> > to 67 patches. They were either rejected or ignored. One of the
> > rejected patches fixes a security vulnerability.
> >
> > --
> > Max Kellermann
> > Principal Architect
> > Hosting Technology
> >
> > cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
> > General information about the company can be found here:
> > https://www.cm4all.com/impressum
> > A member of the IONOS Group
> >

