Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83638239A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974823; cv=pass; b=etoQ0WTf6OE6ssAvKgM73so4JvRAzn3rAIBEHF5j9XkdWOfCnEzdZjJDLRMSvTcQ1mF5bLubJpfjaZ2usIx+jmhzCHJbIVQ7deOA3qjlM9Fr3AiPYA/h4TMAoFDtZO2D5tpF9PS+N+KHGNI7ir672hvzfCkwokO+Syy4uq6rv+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974823; c=relaxed/simple;
	bh=BxvBfVACsPmDwWkhsEMNS/sYummmzVIv+k2Sin5DzuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqyfi83K2FVeFqF/8gug84DFQLh6ciKsPSDzVsoMOSSmcejMJj/k3DvqFQCCbQEnMUEtIet7BGvle6PPsm4A6Pdo8i2T68OhusfenGd7h4n4NVrewIPLG1bugL78ZPDFn40DJGuLoFtG0V18seM+oEhRzP85HACIgDdZ2heVpoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tp+sNeDX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mt0Y7USV; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tp+sNeDX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mt0Y7USV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791974820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BxvBfVACsPmDwWkhsEMNS/sYummmzVIv+k2Sin5DzuE=;
	b=Tp+sNeDX27sxYkFEG2YO9858YV2FNVp49Jqyz1xge8XadANa8I6jjYhMVMd0zz3XKwmpKr
	OQsKvZpvCO9LRlhCHFxJ+itsXwornyeXjmRvj+YT7HW5M7joxaWfrAqFwM9dCgFM5f35Qp
	cKP1ojMUV9n/K+Fk6tEqv9R2LFCcvlI=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-iXJu3ezCNoKHrE-KP8AD7w-1; Wed, 14 Oct 2026 10:46:55 +0000
X-MC-Unique: iXJu3ezCNoKHrE-KP8AD7w-1
X-Mimecast-MFC-AGG-ID: iXJu3ezCNoKHrE-KP8AD7w_1791974814
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e96f90659eso157319e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791974814; cv=none;
        d=google.com; s=arc-20260327;
        b=Ga0SMbcXPJcEmXklFC3rCiswv5sh2v9s0p/N4PBXg70SQeLGb09P0SPa1LPsptfdZZ
         fuEfc9B+SSxnqqeDncds4w84AMLkpmvfoHtC9LtJrHwBle4pZdiy1Z3EdJRkC3fUCRq4
         QuyIRsBmdZ0nFjReEZ9AbTlR2jDRbUrcoR5ZO1sHHV3ZS6PQxn9F7y47zFBdb9/b+ZUi
         04v3yecHmehDWgzCmGNCE6Pp2YsuiwjjyUNJmWwme9hIPCOA9HcjnlIHdNPdYBgrdIK5
         Yt+fycQreoi8HBGUaVWijgQfj7RTsOjCSKO0ofkjx6tx56BQ515JFO4+5IGVD32UUtAt
         j37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BxvBfVACsPmDwWkhsEMNS/sYummmzVIv+k2Sin5DzuE=;
        fh=FtU4t8hVHWS7pN/NhpE7IDy0Npppqb5b91Bl32kI/2M=;
        b=k8F4JEia1xYn0nZBr3UizX8kJ8rw41eFlcsTeCcPyprhxBpmGJLlYxy0LUZUFiuSve
         KYnrmSc0f/A6ZOcrRI3lNP6PhyimU3ePDWmTXK6/YNzLo93/rpbrUawijxdmnzmSsYN8
         gkKbPixKbjG75uoZdX/CBp7FAUJBhS9FrTQvazin67v51muQPXXXhFqhZSGBfCX/p8T/
         K7EV/SxgTPj2gqBr2iOQiFZyLPT0k67WvmUeBOCH/cfSSZWpuhpwSjz/WWk+IK/fC9ss
         a4Ac9Rxu8oeEfO/3Op8cMAK0YVjv/KTpgsb2o39X6wgFuV0GTvo2gzIQYF9bisjpgTAY
         owag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791974814; x=1792579614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxvBfVACsPmDwWkhsEMNS/sYummmzVIv+k2Sin5DzuE=;
        b=mt0Y7USVDbpTm1UGzpiK74uBreyrHxdMM3y3NY/fszULBXMjwLyBXJYaMmsl8SCcZ3
         rwCCX6yXzxe5FJEvMMSWO3jhue+eaAnqzRo4NQ5P8lf/6w7br8nznHoOgG8MXUuEucZS
         omG9XKPBsD8110B9sFA42FDDLif/Y50I9oAP0fhI+Wv0nvgqyxA7sSKXImKF2eGQWelk
         i73rvb0XInsmlAe1qNAWlJyExki4zR5zVJC9qNTHq4qWiFZiQh3KSspQCxUJXgGgFAvC
         Xu9s/ekuMkE5iC2ttlFwC2Uu1JDtFWabLqhHAnV1gkKOCEo3DaibrnXcuPq2ani6vFNk
         bBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974814; x=1792579614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxvBfVACsPmDwWkhsEMNS/sYummmzVIv+k2Sin5DzuE=;
        b=cmNp6kXVNP6Bi94PNcAB9R+g1O9uRJvgS2gjA1uPjUw1oj76nuvb1jV/a8gb7NipUb
         tsU1yBO5/KXCW9u9AO+jK1VscbY39jor/uh/eqXHvtyALW+4F8uereNZYqS5JdL5ufh5
         pxbAaZmeh1uuI7BejmDetvTl5HwrOJdkVkhWAkkOlh4leGryzYQ62XBGYqnzDpCdXNVu
         LaHh6k/f5xsRdf7Jy5VlLLU0anIfRW/cVkb4k2ax34ALu8HeuxM2GtYzhf5OZlaWtYg/
         rzlG2qwIcNY3PLjLEu8q69y6IY2ZMEkKSAgeGOWt27UUAbxJWabY/bwq2EmiciKahSYr
         yIiA==
X-Forwarded-Encrypted: i=1; AKwUvBzJP9ZDy+/ZzBYCclGS0SXeMEAAFWAivF9U0Sx2mOsw8EIkbtjb+N3fLO/wYaZ9QUxcjjtf2+EW7bJKkBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkswDb0CopETD7HhNVycoMUlt18MCSIw5XcIm7WtwByUJDFRzZ
	T8urZ4LnHHEl6wRRHoxh5ymOsH+N2+Iz+hnT3Z6DQIC/Ld2OEzpFvVn4tGJLbOtH3DpsPHUwC8j
	qFOKixquYfyCsafY9XiySoRrWncNRDXiz1owBp2gV4o82PZxaOtspCgeALEQ2oe2Yn+n/2mOX+x
	mzZJK649O2kLc0ICvZ6tfrHZGnZ3kLPJdlrQapOAtl
X-Gm-Gg: AYBFou25gRkhva5IVvCYBaDy9efrN9aHDajQrRnnZ73jrTBxKPhB+fWkUFIWzu8AE9y
	IudNi0m2k4ZIbEuZGUFplGngiVMks/bRPY+cZfeEDQAAf1kENPCM2UsN4HHA1bkai0ismG6ZlM+
	vPM7oAuFA/y7vnj7k2uXrbf7lHQCFZDKvtKsEx4HOmP/ughwnB0T5q0SqyXVLawZQnHvNt4AULd
	FEEnRbtWevEYw+hRxp0bE7gLgCi2cpH6A2/zjdr
X-Received: by 2002:a05:6102:370c:b0:7a7:c789:881 with SMTP id ada2fe7eead31-7cb37281a29mr3959105137.6.1791974814514;
        Wed, 14 Oct 2026 03:46:54 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7a7:c789:881 with SMTP id
 ada2fe7eead31-7cb37281a29mr3959100137.6.1791974813944; Wed, 14 Oct 2026
 03:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com>
 <b8c135bf-927e-454e-8bca-cbdbae133d51@huawei.com> <CAKPOu+_Msno=mux+FUc-oV1-ywRFujJcnKS2HNv0sjtRVtUP3A@mail.gmail.com>
In-Reply-To: <CAKPOu+_Msno=mux+FUc-oV1-ywRFujJcnKS2HNv0sjtRVtUP3A@mail.gmail.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Wed, 14 Oct 2026 13:46:42 +0300
X-Gm-Features: AclHuK8FKbDFTguLGmZ45Nt-Pf5roM9971-VwqpKjaMzROf85V20p58VAm2pwos
Message-ID: <CAO8a2Sj2UbocxY+_MRdcH1TWht=UJT+ANWmzqLY9MQxZ0ujUpw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ceph: don't unregister an MDS session before
 removing its caps
To: Max Kellermann <max.kellermann@ionos.com>
Cc: "chenyuxi (D)" <chenyuxi19@huawei.com>, ceph-devel@vger.kernel.org, idryomov@gmail.com, 
	linux-kernel@vger.kernel.org, xiubo.li@clyso.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since the last merge with main Linux the testing branch has grown by
upwards of 100 acked patches.
Xiubo acked your patch, which is good enough for me, Xiubo is back on
the maintainers list for ceph client.
I'll take another look at the discussion for fairness' sake.

Feel free to submit and argue for any other patches you feel are necessary.
If a patch solves a problem or adds needed functionality it will be
reviewed and applied as always.

On Wed, Oct 14, 2026 at 12:50=E2=80=AFPM Max Kellermann
<max.kellermann@ionos.com> wrote:
>
> On Wed, Oct 14, 2026 at 11:15=E2=80=AFAM chenyuxi (D) <chenyuxi19@huawei.=
com> wrote:
> > Do you have any plans to move this series forward?
> [...]
> > Is there anything still holding the series back that we could
> > help with?
>
> It was rejected by Alex Markuze, and he never replied to me after I
> questioned the two reviews. That's what's holding this back.
>
> As for my plans - I have more Ceph unpublished fixes in our internal
> Linux kernel fork, but I'm not submitting them, see
> https://lore.kernel.org/ceph-devel/CAKPOu+8SiwxT_44e63-EZ4T_4d-tGjwmk_Lx8=
i4KgZOL5JnMtQ@mail.gmail.com/
> for why.
> I just looked it up: the stack of Ceph patches in our fork has grown
> to 67 patches. They were either rejected or ignored. One of the
> rejected patches fixes a security vulnerability.
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

