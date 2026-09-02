Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9870A364E98
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359815; cv=pass; b=TvRRhqMgNwHOnns6gR/qqGJ6Y+GvxIQqzba2dYjn+cg+1kkxOTgccxxQEJ4D6OiatbiZLpNeCUuodJ/Wy89P2D17HbUR+VOX69Ifo89sbrVo04oEGeVnF0qYKnKh26f72GoLEIRXkRFAZ14Ba1+AXXaTvn/9kxJfltalK5Ap1aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359815; c=relaxed/simple;
	bh=TZmvaasfuNqPTtuT70sqqQUSwx1v/e/Zx2LqnB4yVi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fpu9ztD7rWb15Jpjt8u2+2EB2uWynCL2ZgmM9M4WWRX2Ar85idhEzm493uoA9iCxm2YO6zh7wHRc9OGFlF5iYxPeHGGYC6ffbXWLzT6WOxX+tsAbVpGvUhtg1WpB0WV9pWX/uDyZ6w3WDhek6VVal05DxaKuFnBu4Q9fggxztW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrkgtBBM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TDSRiaUj; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrkgtBBM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TDSRiaUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788359813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WVfiEtRpqIOnrFF+s2huQjsZo4q2rNenXW836wUs2sI=;
	b=LrkgtBBM2U5WBFyON0mx86F1u9JlgmJRgRxaaETD3os6GgliuYzD1gBdykH0PfWjCTpLrW
	4X5091bRP5erppyfyOP4eEm95uYppeF/0mz0cq1bKsjdHBmh9odjb7KoL+dCqCD6YeV39I
	rDQXfQwm7K0b7LY0vYbjVRg/IW62qjM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-acAcCsFYPyKL974sjCcL6Q-1; Wed, 02 Sep 2026 10:36:50 -0400
X-MC-Unique: acAcCsFYPyKL974sjCcL6Q-1
X-Mimecast-MFC-AGG-ID: acAcCsFYPyKL974sjCcL6Q_1788359808
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5b15484404cso769246e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788359808; cv=none;
        d=google.com; s=arc-20260327;
        b=PHSL6K7/jvmq7gNw105jJF+TKRG6EUBclvug0ImgkDrs/fCUNCuvWqybUvefMKsXwu
         ii175BYJKtM2ZqdeDACTwCkFvrdA5Q+OQg4adgDVzbaA2ADPkTGhxF217WLXCMBrJs0T
         k1eahhmbBvYVv2TlmFu4NIenLnXDkH2daDezrDUhTjPoYJxqMINnyZPbi3t5nHDtH064
         ahjTk5fY5ABr+zneNtYgrFzD3ssqLl4OEubqRqRpm533qRM8gPbHuuKT1GhlRZWd06jU
         WC4fvD9ZbLU1AT8F7wrceMso8YMkYNpkxR6BRT6Zjcj3dHRgeKsVnTzYlK48Lj7A6A0Q
         UbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WVfiEtRpqIOnrFF+s2huQjsZo4q2rNenXW836wUs2sI=;
        fh=SiRlsI6Sd8Iwpb/KmVsV/wrhsWEOImG+Ws6leEZ8GqA=;
        b=s030BFZkh2HXzpLqNC712YgG90cq1kso82lUT9KbwlwSbiTfYXv0NZw6xEWgAvdNAo
         5G84o1X3CMCOPLXzshjot6vXchMupB5WNljyhLnZDvZEj1ZTqHeJYKXK+TwJHzvjArab
         4wJGdHmtnWhv0vcn8HUGaW3JlwoE/GqaK2Gr4hADAx0zmNmA6OHGcOfE8dzMbd5JibWN
         7AykFqt1xDTVaOBhUudCzRgiVWzsxsJGq3eS8vdXxEex2RMX54ALWK5Tnd3kCK7MmGXW
         ZBIW8+3cFc24HkA29ro99EegNZSKXaFH2n9Xy7CcInxyDo1pAFZw3pCjGpC9RX5/jTyL
         CVAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788359808; x=1788964608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WVfiEtRpqIOnrFF+s2huQjsZo4q2rNenXW836wUs2sI=;
        b=TDSRiaUjaoctffjIAcH3xwPkR6Xs3p+mdi/sr8c7sJuuLWPWXk1uGk0t/G19w+hP3C
         L1jwpr535LQih7oMmPs5RXKRwTMC3HSUYTFl0RIN2KjKa4y+qi1OzwYW7nJtlGLfI4qh
         K/kQF2BlnA20JqcmQNgyjbo8JOpkUgNrkm++4SRLysssr8FHfm0wGdNVbMhzJe7ElMFz
         Bsfd6KidZ/t5XMfUoR4rEuykDMS57L+iodic/ANtTymOS/xTDdR9wun05UjUbp0QlV11
         WK3HE4+u23Val5tGnkY7BW2iBdGwo9H+kBVXDu/rNFttkyDlAlk0llm+fggQNx22Y4Iv
         82nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359808; x=1788964608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVfiEtRpqIOnrFF+s2huQjsZo4q2rNenXW836wUs2sI=;
        b=Q2Z2YgXrsZYgSgQLkdLMN9ssELhx84CAdNq1CtqpjF5Hniy0SRftZrEKuv32dTe+/9
         Guec1rNBBOjEZAV3/hFYEovkXuimRgMbQVCSngW8C5zPxQsXnkOySiQv9fatScchH99c
         /iQu0h/j2c/mRDsd1CrqJdIu6PDZ3mJlweNa+yMOEUV9qXtcLivWrLH6koSHMtPRday2
         1B9pOuWBWw/chbmI6PjiZL1jT/JCkM4ZPddyDxSrJcHG87QIpFaoNjx4yeG9VCcevkVE
         HySzIZ12oUWH2Qd+s2VWOoY5lQnbI6AiJZtewQ5g7jIXovM2DGoWhXAoLTWLiqz6i/R7
         QzGA==
X-Forwarded-Encrypted: i=1; AKwUvBygO00iyef/1yskrtHpEO9+PIdO8E26NUayCHYjI4VsCmA70BFMviTDs74nDzrlvIW0Q5JJxkCN2hg1FSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nVSpsJktDkUH2+J3CeDP1jCg2g64FDBqPjtrkEdPUNk1rikfcU
	rSiOhyGTuDB1JoOiJWN0EUdqgE3e1bL3oh875xOjsS3wlxUG7iqSZ7ZrlVRoZBp3KC/YG6c+kgW
	TJ0wU8TNX52+hQI1QTtWonBVNnioZafCWSkfxHhE+uLpL88Ul3hCm+vokX88i0Arw+sOWO5pKSs
	AO7619HTIEQ95iAdUmqez8kPvyB0Gsq9f4PYsvgQVt
X-Gm-Gg: AYBFou2efPRVppJ2mQ/9zAo0aG8jqzNIDvc2uA22tfw96Ewzt9sqHjMq5YvcPVhD9/B
	HcNx6nY/Zt7HywddmX0OPFsyT/vS+9vVMyyxSjJgTD82Ar9iC7djN+oynDvVa0apAZ0eeGOfibR
	DimZyn5PBDP5h5WRjA0ZJsmC02MFgqdsSsk4/dHSiPezHEDg/hx/Q0EEvb
X-Received: by 2002:a05:6512:39c6:b0:5b2:a919:f9fb with SMTP id 2adb3069b0e04-5b608699880mr1867193e87.22.1788359808448;
        Wed, 02 Sep 2026 07:36:48 -0700 (PDT)
X-Received: by 2002:a05:6512:39c6:b0:5b2:a919:f9fb with SMTP id
 2adb3069b0e04-5b608699880mr1867179e87.22.1788359808018; Wed, 02 Sep 2026
 07:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901091836.16906-1-qiang.zhang@linux.dev> <CAK-6q+jFXsZpWHrm0CSa8Tr+P3qHDmWVQA+9stXViyUf48CuvA@mail.gmail.com>
 <b530646295a64f5e1cec5bfec5064f1fc79d3d9d@linux.dev> <b686c4e5066aa11d7d868097b35e04db58190103@linux.dev>
In-Reply-To: <b686c4e5066aa11d7d868097b35e04db58190103@linux.dev>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 2 Sep 2026 10:36:36 -0400
X-Gm-Features: AcwNN1UVK4Wd1puy8en3G-MOknq5D1y938UAw3x7G2DdWgDZO_ERjPjfOaq8jX0
Message-ID: <CAK-6q+gET5NPczHYexcGXgptGTVnynYuVWzdbDkpsuvnbrymLA@mail.gmail.com>
Subject: Re: [PATCH] dlm: wait for outstanding SRCU callbacks to complete in
 exit paths
To: Zqiang <qiang.zhang@linux.dev>
Cc: teigland@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 2, 2026 at 10:30=E2=80=AFAM Zqiang <qiang.zhang@linux.dev> wrot=
e:
>
> >
> > >
> > > Hi,
> > >
> > >  On Tue, Sep 1, 2026 at 5:19 AM Zqiang <qiang.zhang@linux.dev> wrote:
> > >
> > >
> > >  The dlm_lowcomms_exit() and dlm_midcomms_exit() iterate over the
> > >  srcu protected connection and node hash tables and hand each
> > >  element to call_srcu() for deferred freeing (connection_release()
> > >  and midcomms_node_release()). call_srcu() is asynchronous: the
> > >  callbacks are invoked only after an SRCU grace period, which may
> > >  happen after the exit function has already returned.
> > >
> > >  These exit functions are reached from exit_dlm() on module unload.
> > >  Once they return, module teardown continues and the module text
> > >  may be unloaded while call_srcu() callbacks are still pending. When
> > >  such a callback finally runs, it executes freed module code and
> > >  touches the static SRCU domains that are being torn down, resulting
> > >  in a use-after-free.
>
>      I should rephrase it:
>
>      Due to missed call to the srcu_barrier(), when invoke cleanup_srcu_s=
truct()

Then there need to be a MUST call of srcu_barrier() before
cleanup_srcu_struct() every time.

I am confused here.

- Alex

