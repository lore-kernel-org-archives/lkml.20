Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CA142049F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282768; cv=pass; b=atcsAsGiFcLQW/0GYppNFiDGkxj0CnAM9ipp4JzNmXTPg0+gNf18+MB7RCeU6H8lX6BHHrjZnZWsUo1Rl2srLUf5zcnjAyrHYeYocJU8p3ejTadDi+OW+b8IRQLN9JRzOX3RkQyyKkMAs9cw4P4+rL5LdxLF2b3Stb5fFK7KMdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282768; c=relaxed/simple;
	bh=jYeLo1dyIKj3smCfjHTE1wfm6NWZSziLX1W9VVGcJ6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3uvmtzx4JmdZCfMQ+D3sJsYCzeEuz21Ng4VUEuBGWUv3+KjspJ5crXZYLFiwgX1YMe1ytAkTqHz0SYi4g1quBTOSOi1AoeTUdcRn0qQmiHK2o31XH/CyHX3JQCaxPtU2ry0VyqIPRVFNIUMsAdPpbTSoyhsRwO0mRe9mhOUnGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwjPwKzw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V2gUsgng; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwjPwKzw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2gUsgng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788282765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYeLo1dyIKj3smCfjHTE1wfm6NWZSziLX1W9VVGcJ6g=;
	b=fwjPwKzwwa3Qro4B98QGLxU/DgfCgcAyV6u1p4hl1Wm6iyJrVGWTJKJ3hmcIXWV5oSsi2A
	D7srf3eHLyD8loN/aPzQtAQLM2CnnPlIblxG/UKjKTiqw0H+zBmBqPDhf3l9lbOxXkhaNX
	QeG7Fl28DVa25wiHhrk2gRY7I5Fhhs4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-GFVPX63CMGGdo2gGKRNPvw-1; Tue, 01 Sept 2026 13:12:44 -0400
X-MC-Unique: GFVPX63CMGGdo2gGKRNPvw-1
X-Mimecast-MFC-AGG-ID: GFVPX63CMGGdo2gGKRNPvw_1788282762
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-39b1a8b8bb1so159641fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788282762; cv=none;
        d=google.com; s=arc-20260327;
        b=No6TkvuxeWYBJepir+Pnmv1Dx6qOKosnU/0T4Br+cF1NaKC542eUFlO8oTVcN8O8Xn
         dMVbLqEL57gB+yZ1bc/tMq7Ulo0HcnnuKLq7rX+9xzW5iqFX2q98sGYtbC06406ujH4c
         8OwKBT8cQFYOgBIe3eXL1BpbFCHlGXHWK5mR9YWGJffsFSVk54idA2QMF5Rb/7qY2IMd
         QrrnkLIPx2DKDySb5mU1CzL/BJjwfPjc1jDh1NuPWDYmcrNRGL9L5FYxMIbuc9L+Unjb
         MVcZt4yd4XZYHh4QVOlkkjpy4wAS9XjwO5iwGJ+NCLDFgn/++UAVkM2HoF1EazEuSpRe
         GYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYeLo1dyIKj3smCfjHTE1wfm6NWZSziLX1W9VVGcJ6g=;
        fh=74GbN9bLerMpFHKdzbgQMoD/HV7U2+Y4Ga0/EX4rRl0=;
        b=RpbDwjl1PIB/7pVxUr/n8k9XViPLK31r6OWAY3rUOxCARtfpq5cllFOCop9RpaHj8Y
         ZpfY8maxQMyO0dzR5UBAyJWqsTG9FrzPzj0eM48E/fs0IbpatOjBAbjoT/hw64SXMa5F
         57vIVy0M2OAcMZWG2TEHN3+rvDeYjZ7DRoWu74N5+jkszf69WxTldxlo7yLWJxxByt9X
         5bok+wQxCIBxOyHgCkAatZhWkGYNCpBEhNw27kFPvIWdRYk7CcfmpkF2pehjiZSZP3ce
         I3EFBPSXHNoNuEfSnIv1cChGnh6xIfENsUUj1BOukQQxOSRWlGlPC0LupdbwjfvI/jlU
         bWAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788282762; x=1788887562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jYeLo1dyIKj3smCfjHTE1wfm6NWZSziLX1W9VVGcJ6g=;
        b=V2gUsgngNoyi1bIxJlxLrU98VZ/kjhtqeZ9ObG7R/efafqhsSUfFLVfG2m9GJ74srw
         MB9rowqZngSMDiRvFsPUb2RyZQK1BBCDJiw3I7E5iNO6kFIe0IrWxyZfC8rtCyURxsq5
         NgVk3lkbVsm59jQLA9cXswxh/FgfwgoG1LdWQEy0pbQpl2jCfbHH2H+jUgVCLXrGa+Iu
         7z03PF1TB8w/P6d3iwjGWtvojTRXq+6EVUPU/Xx+yC+Dw/6fasBcmV2gM4ryI9IGfBBv
         i/MA3GGFvJuQdH8QEXEeDcL+8bfwvw1RzAFRa9A0WCafVTfTC00NRP3B+w6cbkmOwDef
         ZzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282762; x=1788887562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYeLo1dyIKj3smCfjHTE1wfm6NWZSziLX1W9VVGcJ6g=;
        b=lQeV0nTfRCCVs6A0j0ww0vvjP8nBZ745nypOpW+xKLFzFyubq8Fy/ALXoKc4Pg9i9n
         OBXnOvTebIpouECjxKbFLRvee1DdL621OmbQVwpUjiyUIjl98dTWJqbpCazOEaSPmYoU
         xuG4mhhvVZJQEBD5DkGd3GkCy5iCMV/wcvtF3X1z4tKV+D8BnXyBNanz4jo70k+FGcnW
         O0zT7LAPbdG1gUtxtEWi8Cyh2ZGPg2O3MbGAlQVF7FMOvG2y1JZYGhERpFf8/kYm6lqJ
         1QaRpWISSnO/yEJqHbp5jQAQRTX6S1p70ItKwYFDJpMhqcKU8GeX+LwGh7KDc6DOm0y3
         hkcg==
X-Forwarded-Encrypted: i=1; AKwUvBzvVc4J03zhsY2noPtw2R9Ym2QYcgIi1o694we8pD69s+ao2QyAqUHwjUvbnvnuSA16CDUtuG+sZULHDrw=@vger.kernel.org
X-Gm-Message-State: AFuF++lTNIo81P2N0/8xuOmXSX0/K4sHdTMUfzWcHhXKqMtvz9Eh/Qy7
	rbX0l1W0XypO6pNHE4yfVdakGuHt6llcHFiXTqADGumN7NLYGzo0NG/zG1J7tBONKgHni6yLZOA
	NXGxO8BhmeZIrEbiMctgCLj6td0gGjZ6kyNrKYqnmZ6oqOwGefU2Q2z14kzlnZMbLbTv5Cxm4jX
	WdHYlshMbkQKOTv46CuXS7rXA7ZkyeTZ67smWBZ8sz
X-Gm-Gg: AYBFou1TQ1rphPXuveAtFgB5YuiprXv8FKV+6kQu7e7d2YvVXXfHPKmaVZfLgBL8IMI
	cK7D4mQDbYvdgOucdSBKN/ljfSs1fjyZjxNkmTiCNj8ZZi40AJGli2h+iwoArMe3HtyWkbabhXY
	zFVYYkf4k8j8jhkM3EeFUOfiQoUpL8dZQVu8ZUhyLKEP7pRzBtr+GPXfQG
X-Received: by 2002:a05:651c:50e:b0:3a3:63a:baf8 with SMTP id 38308e7fff4ca-3a3063aca0bmr67998781fa.3.1788282762397;
        Tue, 01 Sep 2026 10:12:42 -0700 (PDT)
X-Received: by 2002:a05:651c:50e:b0:3a3:63a:baf8 with SMTP id
 38308e7fff4ca-3a3063aca0bmr67998661fa.3.1788282761971; Tue, 01 Sep 2026
 10:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901091836.16906-1-qiang.zhang@linux.dev>
In-Reply-To: <20260901091836.16906-1-qiang.zhang@linux.dev>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 1 Sep 2026 13:12:29 -0400
X-Gm-Features: AcwNN1V6z9doM154Oh_sdUpaPrT2erEss33T2N0VfrOkvLScrPitfVq7091J7t0
Message-ID: <CAK-6q+j7n5MvSRXMb2b6UZbaf+NxULrFJiAfs-o0CWi2u+48uQ@mail.gmail.com>
Subject: Re: [PATCH] dlm: wait for outstanding SRCU callbacks to complete in
 exit paths
To: Zqiang <qiang.zhang@linux.dev>
Cc: teigland@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 1, 2026 at 5:19=E2=80=AFAM Zqiang <qiang.zhang@linux.dev> wrote=
:
>
> The dlm_lowcomms_exit() and dlm_midcomms_exit() iterate over the
> srcu protected connection and node hash tables and hand each
> element to call_srcu() for deferred freeing (connection_release()
> and midcomms_node_release()). call_srcu() is asynchronous: the
> callbacks are invoked only after an SRCU grace period, which may
> happen after the exit function has already returned.
>
> These exit functions are reached from exit_dlm() on module unload.
> Once they return, module teardown continues and the module text
> may be unloaded while call_srcu() callbacks are still pending. When
> such a callback finally runs, it executes freed module code and
> touches the static SRCU domains that are being torn down, resulting
> in a use-after-free.
>
> Add an srcu_barrier() after the call_srcu() loop in each exit function
> to wait for all outstanding callbacks of the respective SRCU domain to
> complete before returning. In dlm_midcomms_exit() the barrier is issued
> before dlm_lowcomms_exit() so that node callbacks are drained prior to
> tearing down the lower layer.
>
> Signed-off-by: Zqiang <qiang.zhang@linux.dev>

Acked-by: Alexander Aring <aahringo@redhat.com>

- Alex

