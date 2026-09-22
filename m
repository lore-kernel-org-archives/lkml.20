Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA003542F6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087728; cv=pass; b=e14OsBrNl352goDf4ZlHANcgDuqmqqzSjFGO+KfxwbkCaK3Ca+7rr+nqIO+yMCHjda2qeD+idNiatewDkt4ppKdKGo4EmlBf4J36UPcES8xGUEeSoLgVmZ2FtEhjYOVNFHM849vqC05dSEyBNmDISPR90uYlbCnVU0kycFLmKt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087728; c=relaxed/simple;
	bh=NEyIVmq/MepCR0DVp6TI3+6kKc1aiUn/+ROhgJ5gksg=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEK/wHLSWoPoy0WBzfhV1Lr14t8RddjA4JKjfUREHzN9BzCsnyCtBNXL2saNPFYACb9pD4oRLE0gICYD1NTylqClsvHcCqlbWMFJvLYDeTge/adk7uW7W7xkhczDYzC0ZEJ2tesm1pyWOqFWf7dHtfR4UeCwFe9OwI1dfxzBdzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YbNcnKpX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CyjcmFe3; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YbNcnKpX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CyjcmFe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790087725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gK1S9WSj9Xr3eZwZT3BugPd4DtS8wZ7bJxT3IFUTmCk=;
	b=YbNcnKpXkQCzeYPQRLp76xmekPlNplIhoaMjzoDqxnhXWheywLE7UoKf05Ncmvxq6Qq4qZ
	ykShcN9ajRGFzeLHeGmgiq7pLZKzxZVQYb98RAzAHh8gepZ7iG/NPvdTfOXXV2mCg2eA1z
	ei2GDRISRIVeamLifupRYvb3jilgZL4=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-pnN_5r5pNOKl0OiRjMWtUA-1; Tue, 22 Sep 2026 10:35:24 -0400
X-MC-Unique: pnN_5r5pNOKl0OiRjMWtUA-1
X-Mimecast-MFC-AGG-ID: pnN_5r5pNOKl0OiRjMWtUA_1790087723
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso3159655241.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087723; cv=none;
        d=google.com; s=arc-20260327;
        b=pfve7RoXWt2CvpEnrq5r0tKj8pT2I+RyrsvuMhPcER0FfqjWJ+5Jf2WoOkQdwrb2dr
         8M/Kr2t7GwPBbx43WMo1BGCG19mGW/Z91Q1HmxIsvqz/Hj3h1vHR3sDLiCZwQYvU5/4K
         0Ri+hEE7E2hVVIvwVRkH7ZPKBO6QwPpq3+4uGRDAx9mJDmvw0A4rdqkZlZa8nbXTU8Dw
         BZrGllwi7V7B4yUDwoPDPb5d++GQ8xWGNjXI6YqCxeQCFBQ1ndK2WawlY8xqQ4reG7cY
         1nyA6iFInjT+SO8iBXT2XVx/k05PfxZQICI0Mftozz+GhKtItjQdlZXASVYWpT+PoDVs
         GEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :mime-version:references:from:dkim-signature;
        bh=gK1S9WSj9Xr3eZwZT3BugPd4DtS8wZ7bJxT3IFUTmCk=;
        fh=l0X3j+gNw8w8fV0pwZ3cKLxdCmZkrANXE+KJ97jhPzI=;
        b=h/EfkATRrOGJ7RDpQAPGW/Ih0NfX574myEN8SNcygP8FfylexTxfK/U8aTYB0h7HVd
         me3yT1UKRYgzgvtp5MhTxcp640brZTScansRxCmuKRIQevcbRC14M1YlkbFcuPgUVhfz
         ywP4rNfD32hI1oga+il22b476ZApSvxMuNL7MX8tmfziiSmrxsm87pUFkGfsxgqH/Cye
         kjtdTOKWOOPnnhdPXCJ580xKz5rSVyIHGMaPp+jVb++e+LObgtAJmuR3Trqyvbe7fIDh
         HLJL9nhIL21F26ROZl6KuEf3v7DGoh9HWd8h0q2Zlr96NuC4a0Q0zKbwr4coSMs/d0is
         oDnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790087723; x=1790692523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:mime-version:references:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gK1S9WSj9Xr3eZwZT3BugPd4DtS8wZ7bJxT3IFUTmCk=;
        b=CyjcmFe3B8bZK8OK1HyTl6i85CPQikz/h71+/9QDD/x7f5bkLhrV5bYhC/ThLpufJF
         Z6i5+UepRrNzNc3KyXD45X2kwJw8o+dcJh2kQpaUB5RVggbNHbgfBtswD8UqWQds4E41
         hxMUNbjEZtj70gyopci8G1+lCUJ1GKOIZUIvAwfnzhymiyKl2MpnPF2YXySqkUH1yTSs
         /an1Qk7nenRp+vK3F9zt8QhchMjp31jrI3MJfgg56U9ebztuTI5dzE05mBN2FRMYuJwH
         z7FEie9qpp4nCI7x7p7KdOkG3q2+ZQMVs/YMk3ccMKSN+WRBd87W6wrA9muOvoK4Yp7v
         mPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087723; x=1790692523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:mime-version:references:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gK1S9WSj9Xr3eZwZT3BugPd4DtS8wZ7bJxT3IFUTmCk=;
        b=IqTJY6T0OR+ZAsdtikZT0jKKneGppFduLqiBMAowvyn47S8LQH/akEpCLrCurpLUmw
         IYbOkxp8PTe6wcYCrb5C0qw66lO1/VH5WvVX5RpyhtmcSGzU+CBrxgpxxvwcEk3zvbG9
         t9hDLJZx2TRWSPGEm5hmdWXAn3c9xEal3gmzz+Q+8ATkqGQ96wyGi+o0WXgE2ldvEpAr
         sSIwV6EG+Xpr3z5ZDOrf3WO5NMvuB5Y26f4oKbROWG1SWvHvbxH0Dfw0d5rnoIP/Nx2B
         O/V/rEKvrGiVyWFCvj3TIZxsJjBXHe3r+qp42cbXA/iVj6IEI2lJBp+GLDyV+uh+HEKr
         rMUA==
X-Forwarded-Encrypted: i=1; AKwUvByVc2LzvJgG5gjBp249VAUdYUM1AKm1YFyi5lJAoxbbQfGZq/+qmfW/Mk11wMC1z6O7Lp+3fk7slRonekc=@vger.kernel.org
X-Gm-Message-State: AFuF++lb5nRhCyB/xHc1tl13jbgyY0RILas6JLj4tzmCYOcONvjfFEaW
	9fOcfW2NmtI/ELofuc5hMkK4kjipAo/f0w49xDOaGFusePAImUY4b1k5UOB1rD9LXqCAynsrFia
	+6t0smZ9fgRQOwpYcTjHtmLNirbDcMhOdxMrF+ciCeJDd78aF5Fdw2VV1eosxrTXSSncBRMpaDP
	6l7Hwy+aHlpc2Uj6xNuNvDg461aEZGBRhhE30ST6j4
X-Gm-Gg: AYBFou2gywxbXP6jYn/U4P47kTvRIBADFDCPJdJMQP4j7QxOfBh0RRgfECWoD80upiJ
	s5FpDv7NCx/U2lZbaSupQ1sa1Kc7fpQ0/GOPUlMg91TAJcM4ch718LrE1z8O1Rk9JJSgrvtTgJ4
	z65yPVTbET671bY7Mkjx7kyIE9Kv246gRyiyZw4Py1DRYSxquTWGkC3Pw=
X-Received: by 2002:a05:6102:6b0a:b0:7a8:1817:2765 with SMTP id ada2fe7eead31-7a8181728f4mr5384409137.11.1790087718373;
        Tue, 22 Sep 2026 07:35:18 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:7a8:1817:2765 with SMTP id
 ada2fe7eead31-7a8181728f4mr5383871137.11.1790087714634; Tue, 22 Sep 2026
 07:35:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 07:35:12 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 07:35:11 -0700
From: =?UTF-8?Q?Adri=C3=A1n_Moreno?= <amorenoz@redhat.com>
References: <20260921101538.97286-6-johannes@sipsolutions.net>
 <20260921101538.97286-9-johannes@sipsolutions.net> <98b93c98-21ae-4248-a60a-9625a20508ad@kernel.org>
 <7f557f5a-b21e-45cc-9d3a-cd4f8b5f799b@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <7f557f5a-b21e-45cc-9d3a-cd4f8b5f799b@ovn.org>
Date: Tue, 22 Sep 2026 07:35:11 -0700
X-Gm-Features: AcwNN1XMie8kM7dwxvbQlHH_l7IaHZoq1hw6XOWcr3XDlRFXqBgXY5EO4nZl-zk
Message-ID: <CAG=2xmNURzYdR+eL8x_kW64Bo9gEe3ne88YXaKQKT+_Ya7XZFQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] net: dropreason: use new __print_sym() in tracing
To: Ilya Maximets <i.maximets@ovn.org>
Cc: Matthieu Baerts <matttbe@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Johannes Berg <johannes.berg@intel.com>, 
	Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, dev@openvswitch.org, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:23:55AM +0200, Ilya Maximets wrote:
> On 9/22/26 12:03 AM, Matthieu Baerts wrote:
> > Hi Johannes,
> >
> > (+Cc openvswitch devs)
> >
> > On 21/09/2026 12:06, Johannes Berg wrote:
> >> From: Johannes Berg <johannes.berg@intel.com>
> >>
> >> The __print_symbolic() could only ever print the core
> >> drop reasons, since that's the way the infrastructure
> >> works. Now that we have __print_sym() with all the
> >> advantages mentioned in that commit, convert to that
> >> and get all the drop reasons from all subsystems. As
> >> we already have a list of them, that's really easy.
> >>
> >> This is a little bit of .text (~100 bytes in my build)
> >> and saves a lot of .data (~17k).
> > Thank you for working on that! But it looks like it breaks the
> > openvswitch test:
> >
> > https://netdev-ctrl.bots.linux.dev/logview.html?f=3D%2Flogs%2Fvmksft%2F=
net%2Fresults%2F833743%2F9-openvswitch-sh%2Fstdout#L168
> >
> > Maybe the test needs to be adapted to get the same info differently?
> > (and adding CONFIG_TRACEPOINTS to the selftest config file)
> The parsing in the test will definitely need to be updated, i.e.,
> the numbers swapped with the names of the drop reasons.
>
> IIUC, this change only affects the printing and doesn't affect debugging
> tools like retis that attempt to surface the drop reasons.  But, maybe
> Adrian and Antoine (CCed) may want to have a glance as well.
>

I don't think this will affect retis in a bad way. We collect the list
of drop reasons by inspecting the BTF enums. It generally works but we
need to keep track of new subsystems enums being added so a
dynamically-generated full-list of drop reasons is interesting.

IIUC, the only way for userspace to read this list is by looking at the
event format and parse the printf line, right? Any ideas to make this
more machine-friendly?

Thanks
--
Adri=C3=A1n

