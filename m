Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86C03A0E99
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900775; cv=pass; b=F58R1+VpSBjF29cOBGfwU3sZAa++39WUz5lIZVmkef4vLYkZCPuSBrdZzmKxFHHjdv3d5fV2M3oCx3Zd+ClNSa7DsHZEIDmXw8fRfTjio9smtXyGyIpS753Rc+gqrb9WnGWYiiPQcfRdZufkMDsrOQCTnHgy6ZVnnubTKX83OTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900775; c=relaxed/simple;
	bh=xLZbOw6NlpdpQQwlf9qc1ls0oU+m/TcpOZm+5XJ2btA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVGnMH6H1JQAyYlPcIQkpEp9r8xL9BKdKFWw4TWjR+1AXxAQ9ZmvgVxiJBNLRVIowgVbqcMpHQNY7px/HE7sKQw2EgAjxyjS0/5oq4cDVNCY61uAp9Q2ZTy6T7cR9Xr7UQwTgjsZe7cvWyG8//pQ/WkfA7iPzmtpI+RukWyTWks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P3WSDt0p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oqL7twmm; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P3WSDt0p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oqL7twmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791900772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X4f548bT13ES1ASPlNMKyS3qtXOvU5fyTD3IipYzJ58=;
	b=P3WSDt0pjw6WwXgry7kGJbob+Hpik1ly1bOvSLpa1Bdiopjg18hhJ81jG1x0w2FPVT2qW3
	W+g2FamnK1/3sT/5+VG+h0h2q+/HYrVBdYii59rl1F2OI23q9Pnoxic2v4ID352PqSk8Ex
	UHiqPHr9tmgexzsUV6BlKJ1jftuB3gQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-Ig6WngeaPHaRexscKSU_NQ-1; Tue, 13 Oct 2026 14:12:51 +0000
X-MC-Unique: Ig6WngeaPHaRexscKSU_NQ-1
X-Mimecast-MFC-AGG-ID: Ig6WngeaPHaRexscKSU_NQ_1791900770
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4d2f0f77124so4172927b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900770; cv=none;
        d=google.com; s=arc-20260327;
        b=I5K+dyZFbHSPTpYXwE5yR2DH8QRawoSBMIXmF2cqBuIxy00M7KS5iMKNXcJk/Nx+rE
         +ixsZ6SfU/DSRhAbqQ1FJ2dDNzCoWjlo0Ii7c5HryQFaRqEoezUqq/k8ipCC316bmxmj
         mDfwXJZH6jCRO1iKpnk/Mq7LzMygC5umadSDVpHbxzyRNCXOfbugWaweGam4VJ0roQC0
         Z2o+OfcTaK+PzWQPX2vkGaP/I1Wp4F24Q3iB9J79GhA3BnUFQB5OZBJ6T8kwGtacEp5n
         oet2mZAozZ068WFd05jxiBpWFsqxkirt2cMjDqUofb/+ZeeG1+sCs6RTvvaXPtyKkRrx
         Aryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X4f548bT13ES1ASPlNMKyS3qtXOvU5fyTD3IipYzJ58=;
        fh=XwxK5J96kK5J/nPMSjiiG2zjMs5rpyM5tYgFw11c+aQ=;
        b=UOtK/XrvHiRqbBk9PtRQaS1pfSkg1o2ONwDk3IG8z1jvpDNzDcrYNtFA7gJMQlcE3E
         xVDxYEMleK/qU5xk3sdYOlA7Fp82z3kCgwFQwrQu1OtST0sqpbk0KC5YK4L0PbUw3o16
         cozQNCzTHt+bXu/BQUw1S1FPrV4454hkPfFCeKJe23TBJFLUieezUb1U+IneVIQPpPsG
         EVl3a07GRMmoACPpSzSlYYBuqeR6ZePztr2fOm6a2Qs3BmGyJ1lG+RrPMI3JMq2PUT3Y
         WvD/bENGCvSSg3WuxjR2XFQwZehJBFXTRcK0k/nu9pKv7S0xzY3A/lHZsKGdcLZvmIAI
         Fj1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791900770; x=1792505570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X4f548bT13ES1ASPlNMKyS3qtXOvU5fyTD3IipYzJ58=;
        b=oqL7twmm9f4hr4AUpHaPlcK7+m9bYQdYHPZXAkoTJ2ufdaHYVIXHjW02DIihF0gFGn
         Ok5XU4NWOQWnxPbTaPV+v3IWTqTP7naJ/E3T7TK17m2V+CXZ9OaSHIDlbetZe4wQibKH
         Q7AaKg48xKvsMbwq6L3eFCIlJPuUxFgrIN02GowM15iezNlFuk3/jWMmiJxHU7EBacYs
         KG13FkYc2AGEN5dYDa63klKLGvCouX7/rOcY5F94ZcY2Auw9rk9hJDA4pWkmoo9RsBdr
         Ue2OqOmMrQcYegNYrhBuj+7c71bURB47VRgZ7EyAsRzRMLNjf+BKg6nF2qxQTMJHqLim
         l3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900770; x=1792505570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4f548bT13ES1ASPlNMKyS3qtXOvU5fyTD3IipYzJ58=;
        b=UYhRtUgwd8Se1LAKCnt1iXqPqmufXAd3aHBMZolwyefHnRqrVbdiyCDJ1K4hOcdZ1s
         T15pZdaeJhS8eiwAhz6eVZBPx68zM9LWXzmCgCjw2oegSXn12BOYldzV2dS16Qxg9kET
         u4N1+5218zGd+iPYOJUvFFYRCM2QgJUk0uWwYeQeFYMBdBzwhU8lFow5mBFdNjPPW1Jg
         +anmM6e7Es4AxDVJJLFyHpPisL95LZ5ZlOoTX7TwoQWHXgsIv1wT22cdZEfhhJTbBop7
         L4TIU7npspqTt5EKm5HNrv0daLz6mmmGHm8365VolJUYhkWGnjla8MHC8fFpaOjk42dz
         BqBw==
X-Forwarded-Encrypted: i=1; AKwUvBzZrVg2hvs7UoYMpnHy5vQBdHcN9M9XT/W/a4N36vJygLT9aIOYurZRT9/YUZtAHnOI6pH9CoD5nNw0Fcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbk/6Rhk71o8Y884sL7Cfe9zN6UqeqCVLet278yjcVQwK7BMMH
	Kk4SXCz72MvoZaglZZEyPVhyQN6aKTPbq2XwcP/OouGEbJcBvw080vNicT/PWKkSDoxwy1OmOU9
	SJd2GZJh4hk9ltZfedYe8tgaQXb8ZBqAcyWcpNMh2Yvfi7fxhnYPHvcBd8iYHwdUfLdhFuR0Vnv
	wPjWorYe/rjxpTdppS783w+oJuiqLG8bfK6ICdd/Uw
X-Gm-Gg: AYBFou1Ti8F5Hp5ybS4R+YSPalHa2lTbxWAFZh3xwWgY6/owiWo0460YYSbF7JXqS2t
	rNloAn2jb7QVLS8bgbDhprcQGI5Yn0XhqwIiig4uy87vHh0QpX6eYlUSNmqVV80yHCUXX9yGURs
	7zUJVa7WECrqAMSStcfTNgLlSrqY5/gB5vIXUe/mCvHbMbKIGiQLMhmA==
X-Received: by 2002:a05:6808:1818:b0:4fb:bfc2:1a78 with SMTP id 5614622812f47-50c42a25b68mr11292921b6e.2.1791900770481;
        Tue, 13 Oct 2026 07:12:50 -0700 (PDT)
X-Received: by 2002:a05:6808:1818:b0:4fb:bfc2:1a78 with SMTP id
 5614622812f47-50c42a25b68mr11292886b6e.2.1791900770020; Tue, 13 Oct 2026
 07:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-2-17520fa3c541@redhat.com> <687efc4e-e19d-4cea-9d2d-45de1ea2cedc@quicinc.com>
In-Reply-To: <687efc4e-e19d-4cea-9d2d-45de1ea2cedc@quicinc.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 13 Oct 2026 16:12:38 +0200
X-Gm-Features: AclHuK-MnA9uh9kbAvzIVnS8SQD_ihp4EByVodUv3ybcAA3lUVVpgaO2hPNIgdQ
Message-ID: <CADSE00Jf5XAf+=Ovz=MsagkA5DK-mpZ-mPoiMb1Z4Qx8GpmrGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: qcom: scm: Allow the SMC request to freeze
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 11:30=E2=80=AFAM Pavan Kondeti
<pavan.kondeti@oss.qualcomm.com> wrote:
>
> On Thu, Oct 01, 2026 at 06:16:49PM +0200, Albert Esteve wrote:
> > From: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
> >
> > qcom_scm_wait_for_wq_completion() waits in TASK_IDLE. That is
> > uninterruptible, so a thread parked on a firmware waitq cannot be
> > frozen or killed. A long wait then blocks suspend, and shutdown
> > cannot tear the task down.
> >
> > Wait with TASK_IDLE | TASK_FREEZABLE so the freezer can freeze the
> > waiter during suspend; after resume it is still waiting
> > for the same waitq completion.
> >
> > TASK_KILLABLE is not added. If a fatal signal aborts the wait, the
> > driver returns early without issuing QCOM_SCM_WAITQ_RESUME, leaking
> > the TrustZone execution context.
> >
> > Fixes: 366f05e348b2 ("firmware: qcom_scm: Use TASK_IDLE state in wait_f=
or_wq_completion()")
> > Signed-off-by: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/q=
com_scm.c
> > index ea4481385412..92cee2263ed4 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2664,9 +2664,7 @@ int qcom_scm_wait_for_wq_completion(struct device=
 *dev, u32 wq_ctx)
> >       if (IS_ERR(wq))
> >               return PTR_ERR(wq);
> >
> > -     wait_for_completion_state(wq, TASK_IDLE);
> > -
> > -     return 0;
> > +     return wait_for_completion_state(wq, TASK_IDLE | TASK_FREEZABLE);
> >  }
> >
> If the wakeup happens while the task is frozen, the task will come out
> of completion only when the task is thawed. I don't know if there are
> any cases where that is not acceptable now that we are making all
> non-atomic calls to enter w/o mutex.

As far as I can see, the only caller of
qcom_scm_wait_for_wq_completion() is
__scm_smc_do_quirk_handle_waitq(), which is only reachable from the
non-atomic path in __scm_smc_do(). Atomic calls return early before
the semaphore. So all tasks that can park on this wait are non-atomic
and would freeze together.

BR,
Albert

>
> Thanks,
> Pavan
>

