Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FCF4EDCB4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999724; cv=pass; b=V1KCekXX19MmO4lyR3KuBifQn4UoDR+dqd/MJcP8wDoIsKo6KmYpg2qO4qO+LYoOdldI2bkBGL+XGNlFAgLObOhWtS9Lbe/0h2SXDwjUsPdrqs9NXvYQEFUjjcItKEZ/LWQjGgg2VavsHiPZhHQ1ZsmTI4NCXM8ZfW48HmDw4IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999724; c=relaxed/simple;
	bh=eeXzCvcse/Jv5mvLFh5TSfXBVG+2naR0d1KoQe3JgmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gr4/QN5NE/RNIKFm2Lbzqdrt+xocf7unku9xZhC4YOffxrbEKA7/F+WHAfC4Sc6tI4XsAxqu37tdejrCSNhg2vUCJavWAGgC8dZewm6xxMpbqnnDCqqA3YIA3jvQ8MzXNs4+o905ov8U0GSGsj/SWv+6gf0mAqxAydb5tzPJtlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=We00uoRR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OKWm9/9n; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="We00uoRR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OKWm9/9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791999722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeXzCvcse/Jv5mvLFh5TSfXBVG+2naR0d1KoQe3JgmY=;
	b=We00uoRRBWVRomDaXzZZ7KwN1RO/4K1H3N0DIx2D50ms7d767aSYBa4Bxkn6UsJJIEvK70
	qT7rZ9bRz6++7QpECU/YXrB7pWEMca9QjSN0Cd5M6nDL6J6b1HEym7aiS58GyVobMbMpIW
	L0mKtDL8JTba0FEfjuseba2Jro2ObUI=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-usn7ii1vNHWLNcWRgPn7Jw-1; Wed, 14 Oct 2026 17:41:54 +0000
X-MC-Unique: usn7ii1vNHWLNcWRgPn7Jw-1
X-Mimecast-MFC-AGG-ID: usn7ii1vNHWLNcWRgPn7Jw_1791999714
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf67e46ae0so698210137.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791999714; cv=none;
        d=google.com; s=arc-20260327;
        b=WWdO5hk8duNgpwDnqlHmtgVNyxleHS0BOmmEOh2k6Egl164n8OTsw6d2SzKomGqGhL
         Pi6gn4sZOgTEyOJSSTcQBVQ0sXZXliGjEYau+zBRXEVQT676GaZWnrpvB4hTDdILOmHZ
         Cw88MDGe/7/1eZ/Uat2GX/78TO8vn1TbZVj6C4TSdBwCuf2s1s5zJVEquWKCXI80VpWa
         qzMtKnXfHis+/b0cNIKAIrIXbp0h3bsNcVJ1yj0uzuOkYGHO3i5J8WQA6c3WrFxpUZ4N
         sTkaTrnF8L7g57L1FFBAUT5scljfKzPnpo2SjIb4j5vSSzPFRHqrvR7e8TMy/h4LUxh/
         dLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eeXzCvcse/Jv5mvLFh5TSfXBVG+2naR0d1KoQe3JgmY=;
        fh=zK50hGSCdWx3NgVYT2llDcRZTQ/QP/GWs/G2SjFcf8w=;
        b=n7OSvIhiwedKFBVIpJPni/YgUtJPlouAR1GjEEHJU2V8GqOIEjnsOFMLIy7po1f6ra
         qJS8eEoB2CV7Maysmy4uYsRWMAflDnonAoKGIxWUpxk2ktyLEdOQmYxIIPdhTvq9ijYe
         ImQ12s4Eqj2fe/ExvqrSRDnp8Gnjh/Ssnyl1c3JYw2GHnGf+5/Ds3rmnF0jqZC9BSFTi
         96T2f3jcgfDhf5JrHBFu4v9048WbE7wjVero1S4bz1iWYtLvWHYAY44gwQFQsLC9u6Kl
         VH8tvSXTnXDQHocNz8sdjEWfmoJbpI1mdxa3ocC6nLvT/61DyIudAs9+durelfbGcz9X
         TI9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791999714; x=1792604514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eeXzCvcse/Jv5mvLFh5TSfXBVG+2naR0d1KoQe3JgmY=;
        b=OKWm9/9no+yXxt5S7jbCssD9nd2UgOFIXMoRvVf1/CIsKkjasIcG2Ka2F+iL0pGENh
         BIHA/iEnsApuLMjzWxqv3Df4D+na2PxjYVbJl5epz8B87GoamcIoBOZJBrbkRVRt8JLB
         1UPwbv9itOIu/BlhaF+DVTourWvR9ZwTK13fmkiufqAzYv+1xnWFTOqMkN58GJjliKZm
         nsHxCP63AQdmp9PR4m98C+fKTx2kEUqTZfnhXdczFSk+7ekjRapc5fi2d5ifo3SIiOQG
         00TQFh3nvyHWnySTgxsYbJz/sntf1hoZ9fpan484gBhfB8eLfBk/RCYAwdoM0fciK3Ti
         UG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999714; x=1792604514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeXzCvcse/Jv5mvLFh5TSfXBVG+2naR0d1KoQe3JgmY=;
        b=uaTLmSce/I9cQqqOhs2dTP3e9mTJq3WCJ18xvcB6VuyW6whY3VOEd9UsKxpDOI0Ke9
         f5M5/LOBo5x8Z6suC86LISdLQkEsl33FgTUsNhNWG3PkyFWTgA3Y0kl/00JqM+I3pYKO
         Onq0FQW7rmv1qTIGJYiDOX7kZpTl/7v5OpYFpYC7cTKEt7Imsj1aFb6Hgs1W19yXK12+
         3Hamj5XmzuyR+GhznegKkfRGYqSjSy8GM1+dNM0HZLwuNBSUo61a+uAonEQwigK/J0oY
         +bCY97zvqAjCQ8kjj5ICZe78yd1ttx4nEWzXlplcJmy3wwDUMMw+bE+k+uDnjxUEatVp
         c9ng==
X-Forwarded-Encrypted: i=1; AKwUvBx3vyNOS3hIZXd3r1rEknfB1rZ1TkUCeCZu+XrPpHltGgnMuLe206g5+VlDDPylBxVTht+ft2DcW6Kj8XY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKgVz4sw9J25d7j5kuyEC2/UNBOL9zfjloMnKRPyAcTNKllTOJ
	EgHmJjx9d/J7k85TKJFpHdNgBJBm8jj4exSNaUnWeelnGUotnkqH/79cGnCqlUB0RIPAohOHRpi
	2dxDXSfmHfeBxYVcFYPC1xtZJojyBiAT7S1RwEZ0NDs2e8RJdC/JwyHa30Z44cEEkyufJQ6+K1J
	9pLa6PkU/vbryix5EvEzRMVOzezgka78mSHGNNWx4+5vdjgy5txjs=
X-Gm-Gg: AYBFou3no0y+f+XWhagXZvqoZF7X3OqtAdk5T7z1y7TI4PXyuaaV+XDceKVtsmjykTE
	n9xfyOti9PW9qFLJDMsKiv6XU52YDKVR7I/ktb//t4e7dmLVktZw0R9Cn5DPBJ8/BbaD6K1wGwc
	vYfyWE9L2Nro8faPBqH/x3mCjdFM+OeCQ+NWda9jjHv7mZ+lf1Ghd2afPsK01G2zZE1Mf6MyTTZ
	csCHiq2ebDnBjnSfUkXGi/AnYMe99A43mi6Vi2r
X-Received: by 2002:a67:e7cb:0:b0:7c3:ab54:105c with SMTP id ada2fe7eead31-7cb37254ae6mr4053297137.7.1791999714143;
        Wed, 14 Oct 2026 10:41:54 -0700 (PDT)
X-Received: by 2002:a67:e7cb:0:b0:7c3:ab54:105c with SMTP id
 ada2fe7eead31-7cb37254ae6mr4053286137.7.1791999713611; Wed, 14 Oct 2026
 10:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com>
 <b8c135bf-927e-454e-8bca-cbdbae133d51@huawei.com> <CAKPOu+_Msno=mux+FUc-oV1-ywRFujJcnKS2HNv0sjtRVtUP3A@mail.gmail.com>
 <CAO8a2Sj2UbocxY+_MRdcH1TWht=UJT+ANWmzqLY9MQxZ0ujUpw@mail.gmail.com>
 <CAO8a2SiVWYSR6s=Z34QcfPVNVSLGk+YQQza4DDEt8_8+j37AHg@mail.gmail.com> <CAKPOu+9x_7WQmKhW==AmLoSzuPrUqeSV+JR69-TaovjEhuj6Ew@mail.gmail.com>
In-Reply-To: <CAKPOu+9x_7WQmKhW==AmLoSzuPrUqeSV+JR69-TaovjEhuj6Ew@mail.gmail.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Wed, 14 Oct 2026 20:41:42 +0300
X-Gm-Features: AclHuK9vXikgVqTLHZRCnTWV-IrIq4ErflAGSoRJjlbKe3B9fIi5Q2ybZN6v5sw
Message-ID: <CAO8a2ShEjqyNA41ujmF5GfOM+YbJvXqCHKO9V++KBkJCXNOSUA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ceph: don't unregister an MDS session before
 removing its caps
To: Max Kellermann <max.kellermann@ionos.com>
Cc: "chenyuxi (D)" <chenyuxi19@huawei.com>, ceph-devel@vger.kernel.org, idryomov@gmail.com, 
	linux-kernel@vger.kernel.org, xiubo.li@clyso.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please use the ceph fork and the testing branch.
Since the last merge with main Linux the testing branch has grown by
upwards of 100 acked patches.

git@github.com:ceph/ceph-client.git


On Wed, Oct 14, 2026 at 2:50=E2=80=AFPM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> On Wed, Oct 14, 2026 at 1:28=E2=80=AFPM Alex Markuze <amarkuze@redhat.com=
> wrote:
> >
> > Max, Please resend the patchset, the tree has diverged since this
> > patchset was sent back in September.
>
> I see no rebase conflicts with linus/master nor ceph-client/for-linus.
> What other recent changes would make resending necessary?
>
> --
> Max Kellermann
> Principal Architect
> Hosting Technology
>
> cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
> General information about the company can be found here:
> https://www.cm4all.com/impressum
> A member of the IONOS Group
>

