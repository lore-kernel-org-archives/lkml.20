Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C64334692
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896493; cv=pass; b=XauJFLPgaaF34ozB2cNrfWjuKY7XRfwdN8bYWh9LYeF01nWlr9VX/nLLO721iYuf4llE3ZjclwDlmkj3OJsPB8FeTVrOxfLfunK569DRN2MRrAmFK+MkVg3/Z3NqRnMncx9OFiaIP5k6BD4VA4V3KjD5D/3Vt+XwLvXybGTgy74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896493; c=relaxed/simple;
	bh=toe9yb2XFnEECQoBzURsHAyN9yjNtZPEApnZ+PZcHWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TK1ogHC1mIWb7nwX9StjoUmqc6ll01NCWCyvIjohYe+B29k3eBpM+WPRNcBi7n0JBd3Il60vk9j52mo0gjC5WtNPqtj8LaCmBT3EkzhdMNFHWOCaFeewGx6JbculBSYaCVxz8xlrRmfwINizooEcNaTLy2r4M45WPINbgS9Wrb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WlqHcuOJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R5wDzuxT; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WlqHcuOJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R5wDzuxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791896490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KQqcIXlaYOQ9CiGwV5uRnoFItSNFU1ls/V/6Sz7sN9o=;
	b=WlqHcuOJJZBXJJ93A1Pat8aTNcsgv382dgos3UHCk5jqpeMznr8yeXbiwfVhff52LfVeau
	WOEbaN9iWowQj/EcKFiCLPiLKUCa6Wu3F60Obcqg0WRnIS2rFtVXxipyNSkfUX9TyAGgBA
	GF+PoUoiJO4FzoOCyj/AMDYhxj9HXyU=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-zGbly4jxOmy7Z8dfWkLrRw-1; Tue, 13 Oct 2026 13:01:28 +0000
X-MC-Unique: zGbly4jxOmy7Z8dfWkLrRw-1
X-Mimecast-MFC-AGG-ID: zGbly4jxOmy7Z8dfWkLrRw_1791896488
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ae7fb98d59so23512407b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791896488; cv=none;
        d=google.com; s=arc-20260327;
        b=YoVKekTc+jGxKGSQ/rDtWaoYCznLlBCs6OC0d/JeoX+K8G36cWLi4LmwL4V5JN/dR4
         jQgR1CvYi163NFD+2Abhe/biZ3OxeudPNab/16vlkUNi+TkS2N9na4nT6oumArOtMzbG
         CUMiGwZewSAsote/TA/cxVt89CguQGruSTw8JWKKikdMi7yK/BhZSI8aEOBwW0FDDsvg
         Gw+eUVjiVHBPYJB2Wyf7N6Wx0Qf6fJ+QiiLIzXAV89FxVZZhmwL8y6NIvhARwM/diGST
         3eLHcUdACon46hc+BnPxkDeATiOnhHRe0CkVexEAJRHr325zD5JnDflZC7XA2BvEJi+V
         DYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KQqcIXlaYOQ9CiGwV5uRnoFItSNFU1ls/V/6Sz7sN9o=;
        fh=uELw7H7DWjZQBQdoXwfFnHBdgB0qY6fQwM2pf91DqIo=;
        b=r3k6CeTfrqIRt0eBDh1KFS9QQc3LQlxkqH/WdZu7g1cdc1wNPaLygiRSxxWuimnB3g
         3XK8TH1FeL4z17WEbEDMd4Op3E4x6Ov88wDSFs+mTLaRszcp1VipNpWiEgwzvqqz44cP
         4JkgnUDGjoow35CVYZ3v20agC34CZXUdjy3PsNVcWWQOYu4vIBg5yc45ltd2A25pIPG3
         miM9JCyFuKudX9qkn3OorCU1EK6C8wXsHvweQZJIm59FN1uBUHf+VFgnF6vDH61mim7A
         qDL4ZO/iQJVjaKmOJoV1xNz0d6PSZ+y3V5UJ3goE7e1SEqz5q/sOW0ryFxVlB99Fjpdi
         Oj7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791896488; x=1792501288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KQqcIXlaYOQ9CiGwV5uRnoFItSNFU1ls/V/6Sz7sN9o=;
        b=R5wDzuxTaZ6IBU/XNOKVx+B9+wCwfJKIORpNi1kzZCDnriT24V+ffXC1tn0fLJ6jLs
         fxWUiRJVLdPW13XpVNNsyZLm2BD7p1o5T8czs1PyZ9+rgz0r+F//I7z5Mf/3ccil+kyT
         gvkjWAygCJYfoc8HLnQtA/9RLdTmE0FLDbXAp0O0CvHlKZX83oQisQyHJo9RajfuTRYW
         fSUAsBe0SnvBdcsyu8QHj036AhYPlENHFdlKJOMUVp/jAWmSgh1GVZtWUs710jY/o0TW
         3ca17pmHU7JV3fUeBg3DJdEvd3WgcsttJNEQwB+yvvJkvLA2CKkPZMjLxhpx8AYxp1Xi
         UmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896488; x=1792501288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQqcIXlaYOQ9CiGwV5uRnoFItSNFU1ls/V/6Sz7sN9o=;
        b=i5roXWHyzQ+zMMkPQhbcweiw2ymqPV1dlcR3K5iG5Ezy4OCc2Nk17duQLp2cUJoEOR
         KIDT4dB+Fpx+HXavGl6Kq/poSsZ8ytxBSxkYYj9dEz4kdZjHis0Fisg9zquQWzNJtXRx
         ruKISz2ixZGwaBEgh7XFM+msJ04rYMCReAXQFAqS18ttNBZkqGKp01M+z7Y35LsBi1+7
         HbSgH0Hb1pYO2tS7LB2rn3BWKq+hak0nC+eqcw6GDHjHNmk82KoN/TdC0eaaIFh9aHQJ
         /US12Dfpxv6yBf/nILOZMPsWxSSm0r7bh1io6IpnGj7cC+Oa38CphswJprOegMt6WVvw
         ubug==
X-Forwarded-Encrypted: i=1; AKwUvBxxoznkcn6CRKEMzrVfunaKJpcOQIiqb86dsaYPXgeSmh7QoypY6hEflr4I0xqPOSeXce5K26ZDTtPGk5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFgAT1nHTZMSJAETohrPt17gN8ZgsVpn91PQYo30vksUWJ5i7v
	WUWLIYss3DtmMCmSfvqb+kVbeIMAVH5y7eCLc6U6vTa7N3LIzrVBIZvVZPs5s4AWOaCy1y2jEU9
	AaesDePne+/E0ru7Wi8mSyf3ELWgQipV1o59DFg+MHE0z1sKIEzewKWadx7hVqvT9hvJRtMpkNP
	WlsYqLTYiQ1pYN9+V5Uh5tukOh2DUNZzFUo+nxXrs1
X-Gm-Gg: AYBFou0k3eOW/pHeEe2rfp82dbl9J2thyWHCjcsIMTlTYFfGiP/mKd9hm5kAH6ZO8yo
	ogJ5wyYTBI4InhZ8HcUwRkKZpkIaPiEG+Ldd/tRoOKsX7WcOY9+qm1aa7pIEoPZYSXK5erUkKuz
	8eljx+qS+T5WVGwJRg9IAZNE9ZBrEQLlZuEtmfDpg6pzIgAX+E8wkS4A==
X-Received: by 2002:a05:690e:4847:b0:671:2832:efdb with SMTP id 956f58d0204a3-6793627124amr3406826d50.25.1791896487653;
        Tue, 13 Oct 2026 06:01:27 -0700 (PDT)
X-Received: by 2002:a05:690e:4847:b0:671:2832:efdb with SMTP id
 956f58d0204a3-6793627124amr3406753d50.25.1791896486366; Tue, 13 Oct 2026
 06:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com> <66ad2051-193c-4990-ab4f-efce0000c00f@quicinc.com>
 <20261008190304.rz2kbniwviinls36@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <20261008190304.rz2kbniwviinls36@hu-mojha-hyd.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 13 Oct 2026 15:01:14 +0200
X-Gm-Features: AclHuK9nNGUoFlmvw1xPtcbUceZp-66ZFXEJTxSsNT61wpcfLTveJyn4kskXD44
Message-ID: <CADSE00JEH8A8rTwBa030QJmJiiPC51fCdcbv=y0Z6qkg69kNbw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] firmware: qcom: scm: Introduce new locking
 mechanism for SCM driver
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ninad Naik <quic_ninanaik@quicinc.com>, 
	Murali Nalajala <quic_mnalajal@quicinc.com>, Venkatakrishnaiah Pari <quic_vpari@quicinc.com>, 
	Jian Shu <quic_jianshu@quicinc.com>, Guru Das Srinagesh <linux@gurudas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:03=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> On Tue, Oct 06, 2026 at 02:57:45PM +0530, Pavan Kondeti wrote:
> > On Thu, Oct 01, 2026 at 06:16:48PM +0200, Albert Esteve wrote:
> > > From: Ninad Naik <quic_ninanaik@quicinc.com>
> > >
> > > qcom_scm holds its global mutex across WAITQ_SLEEP and
> > > wait_for_completion(). Firmware waitqs allow multiple SMCs in
> > > flight (wq_cnt). If one call is parked on a waitq while holding
> > > the mutex, a second call (e.g., SMCInvoke) cannot enter firmware
> > > and both stall on the waitq.
> > >
> > > Replace the global mutex with a counting semaphore sized from wq_cnt,
> > > with at least 1 wait queue.
> > >
> > > Fixes: ccd207ec848e ("firmware: qcom_scm: Support multiple waitq cont=
exts")
> > > Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
> > > Co-developed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > > Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > > Signed-off-by: Venkatakrishnaiah Pari <quic_vpari@quicinc.com>
> > > Signed-off-by: Jian Shu <quic_jianshu@quicinc.com>
> > > Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> > >  drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
> > >  drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
> > >  drivers/firmware/qcom/qcom_scm.c        | 6 +++++-
> > >  drivers/firmware/qcom/qcom_scm.h        | 3 +++
> > >  4 files changed, 12 insertions(+), 12 deletions(-)
> > >
> > I don't know all the history, but in downstream [1] selective calls onl=
y
> > allowed to sleep w/o mutex.
> >
> > Mukesh, do you know if it is safe to allow all slow calls w/o mutex?
>
> In the downstream implementation, there can be calls that occupy waitq
> contexts and sleep waiting for events from other VMs.  However, there can
> be multiple such calls and we may run out of waitq contexts. Normally,
> these calls are SMCinvoke calls or qcom_scm_qtee_invoke_smc() users. In
> those scenarios, even normal slow SMC calls will wait for a context and m=
ay
> wait forever for one. For this reason, one waitq context is always reserv=
ed
> for slow calls to ensure forward progression. So, slow calls
> still need mutex for such cases.. However, I doubt if we have
> sleeping SMCinvoke in upstream ..

Thanks for the context. That's correct, SMCInvoke isn't upstream, so
the starvation scenario described in the commit message cannot happen
today. The semaphore here just replaces the mutex that was
unnecessarily serializing all calls. I can rephrase the commit message
to avoid mentioning SMCInvoke as motivation (that mention comes from
the downstream commit). And if SMCInvoke eventually lands upstream, a
reservation could be added.

BR,
Albert.

>
> --
> -Mukesh Ojha
>

