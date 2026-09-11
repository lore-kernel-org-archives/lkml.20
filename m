Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AEB455186
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160088; cv=pass; b=obntbYZ5CV+8w+SP0Odii8YovkTsfnulz1Wtuf5iGpwmEQ8vrSeyNSGJnPpzusMdTHJNO4SYRTiGNKz8KVwlqCDk5W8YaWxw3oCt0xaSZ3orWFycH8laXzyvCQ+SsIvZj8ZBfVdFt4u/bmlgXn0zbYJnXtUSb0rWrQfyiq33sO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160088; c=relaxed/simple;
	bh=FlPA41J6GidnJ18HqQ+NEvzxuLHO13RlGgnl+HX9oI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOHayTvYaaJuZJhhxheLD3p60/bY7BCiGKi3pZxzbx2f+Q2rOoLhpW+G3V9qKiUso6P4TaIjv31jY8GZbRX+mbTB+Eey0BiFik6xgK8XIggEJUdqR0eMabx20bFU9z4e8E8BkRp00IpwpWuwUZ8hxoR87k95D7D+nByhBYsj5e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RfU+dmDn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pgN1VN9b; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RfU+dmDn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pgN1VN9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789160085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FlPA41J6GidnJ18HqQ+NEvzxuLHO13RlGgnl+HX9oI8=;
	b=RfU+dmDnAKvbWE+rEmC5zzFNIeZLqBMHCSNG141EIOZpMyD48+V+IYbcxLzK9IMKqTnAjg
	KiYgzeAnCWP/IFynviEe8YRoUCA7hZYusjB1hvMMphO2EtJSPC53vwoLmradDcr7dUPwGj
	PQbg46ZEU63/swCLbTjQQfzAHma2txo=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-ixcceFsfM06Zj5eEJf5QqA-1; Fri, 11 Sep 2026 16:54:44 -0400
X-MC-Unique: ixcceFsfM06Zj5eEJf5QqA-1
X-Mimecast-MFC-AGG-ID: ixcceFsfM06Zj5eEJf5QqA_1789160084
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c405d3e18eso1652301e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789160084; cv=none;
        d=google.com; s=arc-20260327;
        b=pusnuSVn2i/CsxB4QxS0foHroqps01C6uQ6btParCoNr6IFgj1xTag9zBjG3mj8+io
         wLwlj1mpTsL8GEJ46f29tp8t2buPdehiEF/GcjfXQcb0FGwkIJjVHo3GfPjNc8u9Hj8T
         sD3EjTXi00S9Ewi/dQjdXyBVQaZJj6I2fWUHPxMixDZCtRfXIbWNkI1BI0WWbaZC9d+M
         1s7PFxcsuTwo8FE8TVX0S3Yn9ZfNIQi9nLShLWex00l1Fj402AKmCGXh1bmOopT6YeAI
         hsynWTs3Kv7Ne/mDHCCY5HQg3tpqGwPowadtrqbTQ3FuiNuFGT5q0Jvq4HtrHHCTQdm1
         T5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FlPA41J6GidnJ18HqQ+NEvzxuLHO13RlGgnl+HX9oI8=;
        fh=v+igTBC6YcL79Y8YtwTJRt4NK6Eo65VdzZSffsp4FO4=;
        b=IL6B9ijXo5LinGcvfrNOfHtq4V1Hd12F/dlR4it/Ad2+GpOSOfCXN/oBxlNRSaobHm
         XcvZr1/w5a5NrWnSORVEMfviXb4b3/NpmJCYrKBIHdgSAmVdz+kpAUWxT+9gZKKpVsQR
         yey9YQO14sTUCTv1VADaQwpBlTb09+piQyOzNiVPk4Qdk4MlTrhK4iqtamCfQqR3cHMI
         3AJLEKqjInR9zYLBXdYdeqGWwaYTVOG8zeNhOEjszVKE58u+Pe1ZRcn7SOCfTvjfXVIh
         nDEWGU0KVo3JuZYptqRxfe8i8wAT2u54k9LkyNSxQXdTdNuZRtcv1zIA190cIBKFV8Gr
         36aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789160084; x=1789764884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FlPA41J6GidnJ18HqQ+NEvzxuLHO13RlGgnl+HX9oI8=;
        b=pgN1VN9b/H7PWBaV8O3zCoVuTmCzUxGz9wqJOElhedeGsVDaGoajCu7ss9PzCbIzbH
         07AtNIkLDa8y782iqmkx4LVU5dBShfRbT595F5gtZFTXvvQUJvU3iu3rlZ6OPYfcv0IB
         FpnsgEiJ9TdlaBPvMEv8IEuiT4tpOxCtVb97Qn2Rd1SgmQ9QHScLIMSGUAZyFKD8E99Z
         vuWHi4JVOgulgb0/MQb2asqqEsWscX2AlKUAfl89mEi4+KLYU9N6Om+VVke4HdHENLFo
         pVyR8hCbgv4rToJ1iJYnt9RTIeC1s2NUJQbtC8Fa560mSX/DRpYpwonFRHTzM9sowiil
         ChUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160084; x=1789764884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlPA41J6GidnJ18HqQ+NEvzxuLHO13RlGgnl+HX9oI8=;
        b=E7U3DhHkVTgJkftML7gQHGlcT5wnS6lV+zpMOpy3R2Q34eAsjM6zcfOYDJl4E3reHy
         XZVwaXCgFqZYx9QCO5xQPXrTOEzhEyFY3MzHIBq2m7y1Nu1q9lrx10O++sCXqvheu9a+
         q2owfb85ksFnxTJUGqQyZfk8Pvsc//GC2sjTm0q6ucsa9Vd6GrrRaoOBh6QzgjSMx79C
         LaECx2sti1OA2nOpYzhXHmn1o+M91XaYo3rIExP7ACj2nL+tuMnCDtNpXAKKpPxA/S/i
         c6+kCdJWHVpZR0cPLwhkMEBuPoStOAPobALR49vnbPtSBQd+YoX00WYlu3l7S4VQ9CwA
         YgWA==
X-Forwarded-Encrypted: i=1; AKwUvBx+oKAbgOlHh3lCeYh0+qkvnGR0/3Hv2ZhQfFf6DBv5RWG7XtG+q2wKQWWCYoEDtHLW6n6RGxE26+HwFw8=@vger.kernel.org
X-Gm-Message-State: AFuF++lVtP7mPpDX/8eE269K4b4QcEjoq6pdCABCHIC9Q2lPxNEJcGme
	iI9GKpMMIfOOsK1vGDt0ESH3LtKh65qcgpjmBlvI8mWXiHDW0nUhczpvstI/yTcAwIZAOI2Icid
	IgL/2pJWbJfXLlXAj2cIBmnfsFLQ1NHRr2D6n3INf67yQndS2qSlKb9nCnOMIwrt5IJFSi3I6Bf
	y1uBZItIYuYb4ugV4hkzkFQ/h7wEK8TWY8XNlepb22
X-Gm-Gg: AYBFou0mGoqswlKpYRf4YrrBAL8wNk4K6cXVQw3iqkI3Fll7lGB2RWI54Q2M7GFUpG6
	hFXPx/7lqPcc7dyxx3v42OnkqldI/dCBrqDWQQvxGVmCifLeo/tdmKu4HQQL1QeHMe38ZxcwFEt
	J0AoRgoPnpcQ8yi0fwXrbNVMyXULYYnH08jA4QZye07+l4eLXXlqGj0HP3
X-Received: by 2002:a05:6122:f05:b0:5bf:d3cd:3d64 with SMTP id 71dfb90a1353d-5c845d7f9ffmr9989596e0c.0.1789160084091;
        Fri, 11 Sep 2026 13:54:44 -0700 (PDT)
X-Received: by 2002:a05:6122:f05:b0:5bf:d3cd:3d64 with SMTP id
 71dfb90a1353d-5c845d7f9ffmr9989568e0c.0.1789160083744; Fri, 11 Sep 2026
 13:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE4VaGACd2es4NPQyhbR9pMEoGiTVBSE7Lw7x9VOb1Qbpvc6nw@mail.gmail.com>
 <amsapeQ2Kp6rwPpF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>
 <aqAMpawvpB7g1XdK@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGBCmA0+28G=V_Qs37cR2GKYDUTGQWW_uRe0qvEp5io3qQ@mail.gmail.com>
 <CAE4VaGCp7A7NuBC9Hwgzs5xg3bGBuRiDC8PRCu+yXnUZEXmt-g@mail.gmail.com>
 <CAE4VaGATCET9F4XXS2oj47aNEZx3HN__Zp1CH4+ASec6BjhjGA@mail.gmail.com>
 <aqONPHH8B_z_GpT2@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGDJy-EzD_iHeb+AQOYi9LZN1dB9OXjf7FtVWM=LWrWVTg@mail.gmail.com>
 <CAE4VaGAq1PugOAomUnJ4vEtmHzKPt5m6VJ21wErdOf19G8UPWw@mail.gmail.com> <aqRB8aSzbeQ-UcYY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aqRB8aSzbeQ-UcYY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Fri, 11 Sep 2026 22:54:31 +0200
X-Gm-Features: AcwNN1VnXyX6goxTYVa2E2ck7PdO3F14PO76Zg2Rek1nXQVAwJIE2cqMc_bw6SU
Message-ID: <CAE4VaGA42zWqhqXfzzkCfN_F__Dh+QQyCX3CvmDx0Wx4u3VzqQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com, 
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org, 
	mchauras@linux.ibm.com, sshegde@linux.ibm.com, thuth@redhat.com, 
	ruanjinjie@huawei.com, akpm@linux-foundation.org, macro@orcam.me.uk, 
	ldv@strace.io, charlie@rivosinc.com, deller@gmx.de, kevin.brodsky@arm.com, 
	ritesh.list@gmail.com, yeoreum.yun@arm.com, agordeev@linux.ibm.com, 
	segher@kernel.crashing.org, mark.rutland@arm.com, ryan.roberts@arm.com, 
	pmladek@suse.com, feng.tang@linux.alibaba.com, peterz@infradead.org, 
	kan.liang@linux.intel.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 8:02=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Hey Jirka,
>
> Thanks for the verification. I think that's all i wanted. I would send
> out a patch for this soon. Thanks for all the support.
>
> Regards,
> Mukesh
> [...]
>

Thank you, Mukesh!


--=20
-Jirka

