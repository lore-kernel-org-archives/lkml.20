Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794213436;
	b=AXSgE+Kk7fElRj9YpQAS+t9HmEcrtG7MEH5jpcaDbuOUd520tSkQJ3a8n7s7bpavwcYt
	 W5xPXiHaCObhc551K7fK4o1ls3+yob+YWdz/Mwr5nUpxVXkxa1qPPvWsALR9DN0tqw/Ev
	 GeY7mr7D0zJcXQpNv3wuIWTcVexiAFdzatuBNYIg3uKQRwgay7wmUoWHE4SLzpeI2d8XL
	 7qa7Qvk8BXDLl6XGFub2KtTGGJAah0Z1Yoq1i2m84rNUFwZOY6nKtfMyrqrr5pzp0UCKB
	 8TpJNSfJhCoTRwxpN8wtknMpbVhlIaiYJuqrh37coDJGvod6r1QyxrxKBgnao85fCrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213436;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
	b=OCX8T5NqHu+SLOAw6a7Ifzhq9gZYh4Pr3C00JwgE16JxTcPUwLFKIKAEii4NBNBkuMtK
	 gHXhZ8RVuAm4zFA9ijeeXhn0Q6JcetQzMjjX6CZtareGVj17daiIPMntobyuE+6dNp/X2
	 SXeJSA4fh9iKY9Bj8GLKTdSoBQpif54fUKXfPbg5lnudfDhlFAIQoxYbpgURJlsCwldtj
	 yLIIwfiQZ0lDtSFxkB7dhmnKEc4mgrjbnBWAAWro/DXqfaGMfav3H/CuAGIV6ACCnbQDR
	 qRapvqC5d/RXRdz5w0DEPeiRacQhV0Xia1+Rw6uMaE8gnrftAVLb8rv/b++qPF5wQVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwxMxPGt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJQvvlzO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0F606D801
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F0F606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwxMxPGt;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJQvvlzO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794213434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
	b=iwxMxPGtiRya2B4bd4KMJAtPkQdiqaA9K7L6vR6cBJUCwG2NZlnhHHcreHnR325wq++8tq
	ysyhab0pFlfUdfcUH6z++BEjF8gURXRmjB73UcolFFpWnxyrBzwxbVYHcXgzqPVjXbBMyD
	/QlCfCEyAe0vzEiCVwuTeyFio95v++o=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-l-b473wiMgKdnh1527-NLg-1; Mon, 09 Nov 2026 03:37:13 -0500
X-MC-Unique: l-b473wiMgKdnh1527-NLg-1
X-Mimecast-MFC-AGG-ID: l-b473wiMgKdnh1527-NLg_1794213433
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-869553205a7so9982707b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:37:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794213433; cv=none;
        d=google.com; s=arc-20260327;
        b=j/BAvQaBLFs7DsFTEq6DwmrQcPv4QHap1WJBnFNvhu8aAEz7fBXW5InVSq0C/8Bcek
         CYjPIhguQ7whs0VTSYF/PL/eY7/bi8qTY94agDr76Hh4IPC2vgRJy884VsfZ4VDYyXwh
         cjTo6OR1ogriLWx7DnSP2Ch6be4ogNNNk0u4YLFm6qhwL4vNdImB6WSZohkPBQzw72gO
         NAYsYcZ3YPQg5UYB8FP5KIOW+KfZ4SG6RCQQ3gwBGMdM3xeuj7LiRDeXfcYgE5aCkqxB
         465+w+Q3w7DQBJtTYOw14N2usg6qpYwvb73vzuk0zSMcxd7r2jHTIpoJiG8yhi27IQWp
         ON5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
        fh=9sfeT+RRa7kBvF0DmvxUv0OM8RpEruyDdoqf1FnhxU4=;
        b=TyG4ZpjUJQE/Wl9p+t/hmj8bP4rCw4gDnXdppoIsZAWdq2vxo/d7QRryAnNJOO5bsK
         YcImqFrOo4Du4B8YRqqtQbIRE6ert3L+aWM2NSOK/xidMs0CxRi3N80NZ1gzSwBY1o8z
         t75//80CvsWQ8vRVAp5wmuh5VyWdgK6/1hBfbaM+o3uDgOyj6KNKHJqOP7enyavmCOco
         4NaB5vjUIg6kL5XJrfF+8NI0jn5R2UT/3pa0STI3jeEJ4H2h2ADKkNkGGyeHT6awqzOH
         D1X7gAF0dfYpTdcFaI4v2tHNqXKcVOInhKAaXcBposhzjvy0UXuc11d3r38CuGpDaGuB
         pXaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794213433; x=1794818233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
        b=NJQvvlzOK4RkO258sxT6Q6sPc7AL8wgWMAWvEyNMb5EhCISyqBmEmGbBzxWkRKn05O
         d4kPhtzNx6P9N1E0+h/4KlmBNz252E4YU+CMPKR5aoErte+7UT3lNre6ZP8mcf9spAqX
         pBW4botNNlF1kWWjhIhR4RFz5t9lsg2c/Zy7/OOtbRv+7QjwRjVBARPFTpS3ckdwHpmO
         p1b04EMhPKbQnEslk0tckU9bd8ItuXO0F9kmn0nX7eVQx6d9LOZ7xB8eXU6Rp86r0Daq
         E4PN8D0iirC4rWsoLlQrokx5KC8cSZNGNMp204OmNchZEHRC/P93bOq4rhHIsmuJnmx/
         aCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213433; x=1794818233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CImfgfvrGxTGXdBijpfKFHsWibRgSElYzGxJDK8LVgI=;
        b=jO7K9wW70SmIco08xR4eRERAZKvOWzM5q1ThLXQY2RPjeiz+um69SmalSGro4Fni1r
         IgQfu5INxc1ZKpC6cSM9A4DdYuqQzhqxOzozNUtSWSwlzO2BEkc/nl5304O0NZCuIaeh
         6Up1c9UlJlEPBjjqq6KjC8MTzxxjXhIHM+slJwpzrvZXJ76bxKrA1nTK6SRs6pExul5H
         HucteOnvDxiN6EgJDAykn4ou2pzGuPRcfxftgXxmpsGWoJ9zfOI4NdZBiQ2frZ5WFiRl
         1v4fjcZnacCUMKm5Pa9htS6U4ETwWo3jYuLJl1onGW2WqY5hPwRVW4RQvidJurTDa9HD
         Mnyw==
X-Forwarded-Encrypted: i=1; AL+hErEMYSqtS+UYQvMbLVDXimuCmtjRPQXeFi98+68eKnA63vZIaoQ/JPY0HVKSxIM9fSh5S8YpGqoaHMHpY1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+lbU8k4R//AAHevzn0gamZDDEgFrZ4sOHrtMADOtreSejl9Nr
	agEVPtqR+omAmO+9Y9456uB3YoGMjHt7stfThMVvzdVBTtI7YD6jgCMoAsFwAQduUwRBkwrqtD+
	kxlmVvUOEMrOc3B1mb5GahR+7XlB3GhZ2r02H8itBH8JPtb+5m8o35xEtECVlwPs4nDYYG1mrRL
	S5PdgRTc9DQNJS6z2rFDEp153ci3usOG/WtQgt1OdX
X-Gm-Gg: AYBFou1j28cDyKdSH0tBha98xANcoV1JG6c9YmaiRPueBYNipSIWIvdIKHKw4tDJ59b
	OAQIxmFzlYy9C/8Qpne4tYk5c4/HGcetCkb2dTFAKK3M8/nX/KX1nohR2odzNrumM8XOmuHD1w5
	c3ofWd7gKK93Z/Y688PjXBZvAfrW4BvYNQ8ZMpQLZo/vwENQDSa/Pg+G06
X-Received: by 2002:a05:690c:e211:10b0:8b0:d027:c4f0 with SMTP id 00721157ae682-8b36c8dd4ddmr14885827b3.1.1794213432648;
        Mon, 09 Nov 2026 00:37:12 -0800 (PST)
X-Received: by 2002:a05:690c:e211:10b0:8b0:d027:c4f0 with SMTP id
 00721157ae682-8b36c8dd4ddmr14885757b3.1.1794213432260; Mon, 09 Nov 2026
 00:37:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com> <66ad2051-193c-4990-ab4f-efce0000c00f@quicinc.com>
 <20261008190304.rz2kbniwviinls36@hu-mojha-hyd.qualcomm.com> <CADSE00JEH8A8rTwBa030QJmJiiPC51fCdcbv=y0Z6qkg69kNbw@mail.gmail.com>
In-Reply-To: <CADSE00JEH8A8rTwBa030QJmJiiPC51fCdcbv=y0Z6qkg69kNbw@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 9 Nov 2026 09:37:01 +0100
X-Gm-Features: AclHuK-3XHL2magG-d45lby-7DLyXWPMdnCs08_ywvxiu_bfyD4ALAh1Tjfef_Q
Message-ID: <CADSE00Kv-YHCy+ezXYt3DUcCRRyv2aToUX=npa7cdgUrVBD2YQ@mail.gmail.com>
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

On Tue, Oct 13, 2026 at 3:01=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> On Thu, Oct 8, 2026 at 9:03=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualc=
omm.com> wrote:
> >
> > On Tue, Oct 06, 2026 at 02:57:45PM +0530, Pavan Kondeti wrote:
> > > On Thu, Oct 01, 2026 at 06:16:48PM +0200, Albert Esteve wrote:
> > > > From: Ninad Naik <quic_ninanaik@quicinc.com>
> > > >
> > > > qcom_scm holds its global mutex across WAITQ_SLEEP and
> > > > wait_for_completion(). Firmware waitqs allow multiple SMCs in
> > > > flight (wq_cnt). If one call is parked on a waitq while holding
> > > > the mutex, a second call (e.g., SMCInvoke) cannot enter firmware
> > > > and both stall on the waitq.
> > > >
> > > > Replace the global mutex with a counting semaphore sized from wq_cn=
t,
> > > > with at least 1 wait queue.
> > > >
> > > > Fixes: ccd207ec848e ("firmware: qcom_scm: Support multiple waitq co=
ntexts")
> > > > Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
> > > > Co-developed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > > > Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > > > Signed-off-by: Venkatakrishnaiah Pari <quic_vpari@quicinc.com>
> > > > Signed-off-by: Jian Shu <quic_jianshu@quicinc.com>
> > > > Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > ---
> > > >  drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
> > > >  drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
> > > >  drivers/firmware/qcom/qcom_scm.c        | 6 +++++-
> > > >  drivers/firmware/qcom/qcom_scm.h        | 3 +++
> > > >  4 files changed, 12 insertions(+), 12 deletions(-)
> > > >
> > > I don't know all the history, but in downstream [1] selective calls o=
nly
> > > allowed to sleep w/o mutex.
> > >
> > > Mukesh, do you know if it is safe to allow all slow calls w/o mutex?
> >
> > In the downstream implementation, there can be calls that occupy waitq
> > contexts and sleep waiting for events from other VMs.  However, there c=
an
> > be multiple such calls and we may run out of waitq contexts. Normally,
> > these calls are SMCinvoke calls or qcom_scm_qtee_invoke_smc() users. In
> > those scenarios, even normal slow SMC calls will wait for a context and=
 may
> > wait forever for one. For this reason, one waitq context is always rese=
rved
> > for slow calls to ensure forward progression. So, slow calls
> > still need mutex for such cases.. However, I doubt if we have
> > sleeping SMCinvoke in upstream ..
>
> Thanks for the context. That's correct, SMCInvoke isn't upstream, so
> the starvation scenario described in the commit message cannot happen
> today. The semaphore here just replaces the mutex that was
> unnecessarily serializing all calls. I can rephrase the commit message
> to avoid mentioning SMCInvoke as motivation (that mention comes from
> the downstream commit). And if SMCInvoke eventually lands upstream, a
> reservation could be added.

Hi,

To ensure I take the right direction, should I keep this patch with a
rephrased commit message, or drop it until SMCInvoke is upstream and
needed?

Either way, the next patch adding freezable to the waitq does not
depend on it. Regardless, the check that treats =3D=3D 0 as invalid can
remain independently.

BR,
Albert

>
> BR,
> Albert.
>
> >
> > --
> > -Mukesh Ojha
> >

