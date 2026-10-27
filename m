Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793111983;
	b=eXr+LojDFihC7HOk1O3HeCLPME4WyeWsY2k+A2++avwj2DNzGMIFz+k7u1X3K0qxJ4aK
	 ZBfa05Qh2c15mnSFGn2B4YfxqjZeFqG1sCKHCA1sh1b5oViUbpBuekvC7pRFm0DNov8ES
	 vy9LcN3aTLQD7t3rutlZRLN4yt3VNMm6kd4WZzXtsOruvulavzT9X4urPv9wFL5cw3yRy
	 dELPJM8FxYHw1gK+6pyIupREeg7nvqW4/qobcCliNM7YakgGjc39uCf/EWjbJGlgfbq2+
	 mfkw9JM16UMFKxLSPLsSWL31hwcfdq4tOJw0/5ZdNEaenIzbK1mEKFRBAnp20Z0OKLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EPrxV4E3cA8qmso3bBNM8N5Yygid8H6mmV3NvCJ0NcY=;
	b=QeH5Z+MlWPuXVQDQvvZNvh6Ir3b4PYf98DUgMjQCBc5fXrM1hgAzGWUE+vajmd5nHn7V
	 2eTcslAGs8j4+wMQymC9eS42w6nK0kWnjFHNxXJE5TqUCZ2IX1MoP7p/M5LkF8polQzaV
	 ItKXEExn4kBoLO5omY74gPzZ27KOcA582Mt1U6UzstRYmmZb2gyCZgwFQsDL1HvA/u8vB
	 I7QyQ73CWnLKSiT/87BTZP0GefR0zC/+lcLcR1ieLeYLs2+agj0nUt0VvdNUQCs3/Cgij
	 uMLwCyh6adBT9JZpDYkSjv3Ae3OVwJQ5TjdM49XCyAR3Bsbn6dGuNde6BRRHUd7lxwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIO6oopW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A97606A335
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A97606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIO6oopW
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7c05859ec4dso205286137.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793111982; cv=none;
        d=google.com; s=arc-20260327;
        b=EimzXVvpTgcCZezxKfu+iDNtt3C9jMVfEtZBR1ut2OihaWJvLqPuuCDVJpsctfUf6o
         2eiBbc7K/VXkNQTTSvTeObA45fKTPAzkopr0rMdAEGw17/RwjRk4f1Mpdjckw19+ZXzw
         oS/C2igbp/nsglHzlQRxXNdNT/uvwccVSANfcvD2BIMllQgq4v/O5n2xDJbf+538Mkve
         woTr1/A4hnlzwOOcYELFOcqZ9edTcEmxf1oSOkZ4WAVIO3B4sSnKEsWNlr44Gq4NWbMh
         dx4yijdQ+2zw2U+kKo4djFkpJivdFSkrYkiAWUbJbzNW4sPvrpUgFwDXHjp/1h2lP9W9
         2+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EPrxV4E3cA8qmso3bBNM8N5Yygid8H6mmV3NvCJ0NcY=;
        fh=gJYvDWJAzpu+bjJPifJYVhbIxn6UK3QCvjbiBFzcCVA=;
        b=SRbFKBaRLEGJdmRwLnAAREl5Im1iRyRhhn3lEy75Li0WgZGioRpqh39IsdAQEl2i6t
         Whu7j53H6NiNTWzDAmHiMgHdStM2IQBYdYWPkib3blVnaQRw0NC7ge8pfukAU7kaLi1n
         muNrRA1H4h2OH5ArjkzuxWos+84U31qQowITWCbXCbXlOmxl8cEH7rF4yY0YK/qG8j8k
         rdpU64M4enBWdFvo9Pzqe7V2FFZmLZEoCR1K5hjwWf4/KsJlYyZOm2HiBvrK3TWCvjcV
         y+yiTdm+vXfvScyXMIOGpCeCjJ18jdAkGWYFNSNf+Xv6g1pDR5SS/T7RugaB8v93Fmu4
         3Emg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793111982; x=1793716782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EPrxV4E3cA8qmso3bBNM8N5Yygid8H6mmV3NvCJ0NcY=;
        b=iIO6oopWg7FoMl1h7iOZoSPHdZWd/a3MW3VLs77SAnzKr+NjkEZ7y1j5HVjRSCQI0s
         +A3Hyy6Lv5Xu9cSVYP0LuR4KvWarivKLPuRBmxG3OQHbvJONUx2s3kLLCNREN1NTRl7a
         OsS+hbPcXVqmrdS1f6zb/3ZmMskwBIscWq5I5Fnx6AzAavFQZ2SALRklr66Q8McJOM4G
         a8c/o5EbgPNF+Ou/RJym/Di+RPQVuqm73+gAR2PXhkLvit0njBpGr0w3KLFz7ITN5XBA
         wlg+qG3ejThGut8+VZWmGEU3lPFZrpUJZHQ1LIDAUfc1vC4QpGZeeEv99E0Z85Uaotef
         6+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111982; x=1793716782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPrxV4E3cA8qmso3bBNM8N5Yygid8H6mmV3NvCJ0NcY=;
        b=SmDTFZnIwrznS4YTRKaxE4R0JDlycDk958cSketuTR+nDURi2Zv0aBgGlZuMyxhBUv
         1ZUM+d7cSUQIUn1/T9yiwhjxpkE3MZYVrHVmbYJNOX5ewfzvBTgSFgkXJ2tJ5nBWIt7R
         iFWHBrApLx4dE7OJQHhgpd0Muvv6tsg0qLdxUjD9fPmju61CIaeCNUdN3ljyaXuOFSqN
         Bsk0GZhQfaNdUBMOw7yAzgDxckp96LutGfgzxS4JHpV+LOa5aNPYuIZbXDe9oz8jL6V6
         sQvONUdKlLsv/+9v07BJ5Fk8TKuWyOWH+tvptjZEdeM/4M7Eh3oQsuKMsbmcQWRB9YtP
         vKvg==
X-Forwarded-Encrypted: i=1; AKwUvBxa7EJe4kXz++Ik0OdzTjMxzlahxUBHXatYY7CKIpFecS8BqNAIBqYxAH3uCIeEgKMGNUjZIHnHjdgya8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPzy6c7t4QuKc/Qs+29ubfnucfOlLKrHe2B6AANQYS//M8LsqP
	OkDxK1MzdpyqQUJAvF57nmAlASRS8ZP3yfJx4IvrJ2ZJ+4pv5gux3l2q9qFtKS11ZHk5ioy0bGR
	NnUDtvVCvh3HBkIfN+m1y/CRucuqrovg=
X-Gm-Gg: AYBFou0PNvOyP6KI6AXT6cbGvEJhBHxEPNJGxeQSw+h6ueb5vkodLINsZN8IdVGPqHG
	/fHmNwSzHALdpwVfKUxdubrYS/xVGjuIi4C0/kro/TIKPHM3kDbYqGs34fuVlaXk+PGzcKDxZNg
	PDhSssJtZIreMUZn9/sPR8xfqBvujp+hSos/612Oje6YDie+M6M0hxbDIWk/vAR5KVA4uY4X26Y
	6wunAhk4J7r/hiCrWZqzXsUWv867BUp0TfEjEJvKMHDHyecR4Ii7Iaz1OktXRpyh0yjqCzn3VXD
	/i5jMbeGpObpwevpniZpQadHhu7byG+HRywZopKsU/yhWEg45e6fYir6b9/Hpiz0EgOpDg9j4jb
	zNY7LzGKind+H9MIaDxTc9p5XdE9PjIEoFcnmw256OEzEwJYPdFhrLSn3BmApOH80w+Jw+IzmXt
	5OuG6bC1IRpiVRQ70e4i9YisI=
X-Received: by 2002:a05:6102:868b:20b0:7b4:f1cd:80dd with SMTP id
 ada2fe7eead31-7ce5ca0ced9mr3651871137.1.1793111981697; Tue, 27 Oct 2026
 07:39:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022114754.865669-1-mptagliari@gmail.com> <20261022114754.865669-2-mptagliari@gmail.com>
 <88c61950-125e-4109-955e-ce09ebaab7af@amd.com> <0c7e45a13fb78064390818bb501e754b62f16f6e.camel@gmail.com>
 <20261027001506.27266-1-mptagliari@gmail.com> <6e0b5af2-692a-4b2f-ae20-9c164e7e42ed@amd.com>
 <d451b9a185817c576ebb7943a604fd1952470412.camel@gmail.com>
In-Reply-To: <d451b9a185817c576ebb7943a604fd1952470412.camel@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Oct 2026 10:39:28 -0400
X-Gm-Features: AclHuK9s3CHTU3bFA1ccuwGnhC7tFGFBKddQ8ABnYXLC2ngK0GiJr07BAJIqJaM
Message-ID: <CADnq5_OGgbFOJtBu7SwvvnaN01F=RSqtxZgBhJ1fty4pwBHmVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/radeon: process the VCE interrupt on SI and Trinity
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matheus Tagliari <mptagliari@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:31=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof@=
gmail.com> wrote:
>
> On Tue, 2026-10-27 at 11:21 +0100, Christian K=C3=B6nig wrote:
> > On 10/27/26 01:15, Matheus Tagliari wrote:
> > > Hi Timur, Christian,
> > >
> > > Thanks for the input, Timur.
> > >
> > > To be clear, I'm not opposed to a backport. Fixing VCE1 for people
> > > stuck
> > > on the radeon driver with an LTS kernel is exactly the case that
> > > made me
> > > look into this in the first place. But my goal is only to help, and
> > > as I
> > > said before, I do not want to push a change you don't want.
> > >
> > > Christian, if you'd rather keep this out of stable, I'll drop the
> > > "Cc: stable" tag in v3 and leave the decision to you. If there is a
> > > specific concern behind it (risk of regressions on other SI/Trinity
> > > parts, say), I'd be glad to hear it. I can also try to address it,
> > > for
> > > example with more testing, so that a backport can be reconsidered
> > > later.
> >
> > I was part of the Trinity bringup back (I still have the engineering
> > sample here :) and I filled a full swear jar bringing VCE up on that
> > HW.
> >
> > Interrupts were definitely not working correctly back then.
> >
> > I have no idea when they were fixed but I want to avoid that people
> > start streaming that this change made their system not boot any more
> > and we are forced to revert a patch on stable kernels everywhere.
>
> @Christian
> Are you saying that you are worried about the backport because it may
> regress Trinity?
>
> @Matheus
> Would it be possible to only use the interrupt on SI and not on Trinity
> so as to alleviate Christian's worry?

I've committed the patches already.  I don't think the stable really
matters that much.  If there is a problem, we can revert.

Alex
