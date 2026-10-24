Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792838122;
	b=uFQLzG0Jo+xDkPXt35Z7M8k08cmFEWZA1xzuOFu8/2f0wZcZC1bqv9zI1SBuPazlSfhP
	 /kwqNeiqXvj+SxQ7Ym/qFsNpQF/1VYVaUcXs/lE2oYVNrTVnZf/jk2apSBdiQFS9IVNwF
	 i5QlgNf3z6z7geAMAq0tcdETK93gqK1mX6Eja93hzCpcGeAs4KImTrQdGdP/RYZMqeDtf
	 Zc2VZvZl50NMW7dmmoZABVnJlLfA4IuqCVU1jJhROybh1HqsJjioRu/xGASIh7H5A1vWa
	 j6rsh6dJp9lVntkPAVtaWU9q4VTMlK12cIb1TshegKznzB6Jb66URgHv4v4kcyqD24w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
	b=zyA70cEEdEkrLd3uZMmEKcM45SVmvunTN7XkgH9O4dqTUAO4IRCVkpfwGyh9yjCFWLqN
	 xqbpivl1VlIE81Qg7GgVeM6hOjR6tbrjPfdsIph4sbhF2hQhK4mDHrEcnqauVEjyP5A2G
	 bHJoEO6XeGfy1dDz0xg/Ap58KOA7bJXkH84hfvRTFnLqnyIvrMO7Jt4BiyB4+14LFdVls
	 g4H24LUkaxB2YGLIag6khF2WqY0DF7/9mgyIITWfql4lX3Moyy317ZPIXjE7AHrGSVMBh
	 +//VDtt1nFIkk5sZT2PkwOUCOfFUgwLAX3GyA5v9/gqdxvk2nkkE2Vnr+tK+s+oaHug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ljANwm9B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314C0606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314C0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ljANwm9B
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1024356a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792838121; cv=none;
        d=google.com; s=arc-20260327;
        b=F3j9hcHiWbajj0Hm3iKAnmQR/I+21ISCYaqtBnxoNGEnaqdYe7IRSPDSH8a68ttHrv
         BaXoIYV07Iae/0zU1REJuWuKnexqqQZnWqk3nbKW1B3lGnsqOQb9aERzbt6Xs0AIawFe
         i/8iAJoVF61JWpTS3j+sTrOOEwN7KYvbduQGDkSRhH2ej+UrpdRGEVnWHD/FBwaGFO18
         cK6JDbYh7Rs7cPYXiiHSo2Rjf4XiL4Q/AwmaVoWYM2CgN2CA0uck7mvBrU7/PTEejno+
         Oiqw2OiJ7Uer0HwosuuWt8YwM4mNtARH3nhMoLdAxclFeH2MqEWaddq/MgAdmQNcAqxn
         C4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
        fh=d3uQWd6gaURvtpEDKuJAgty/ESbh+nNM9zHtf+MiWB4=;
        b=Zu2QiXTK949c9bIT+tpd67qbr3zp4X2E1tNQkrLxLnCpA3fiicJv4tJqhEpeKb5hON
         vN/c1+yaoWJPc+hQc8cz5lnD7MUvW8nbJ89xUqMJwrj0LZBGyXiZ+Yf/DxTM6FzpWDfQ
         lkOzQKgWt9FudBJE0VxJVYEzTIejUoyNLTDCVI4oi2XCFLETSMeEKwqcLT+Xp00Qyz0E
         WoZ03mBz9xbIhQ7rYpY1ts020HrtwZSGadlYSLNtzmiwOFZfHaBXd5f0iML5nDxobWPD
         biSZ0+zuXVZE4f/azNIA2j7JRVrO2TR+ER4mQALkya/DWVhoC4ktz9orvZNGBlCHuID7
         YPGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792838121; x=1793442921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
        b=ljANwm9B6EoPJseb/Kq4puCiEF4EWyMyp3X4n2LWv14GXwcMXrQFunBzY7NF2E9Kvh
         xoYmLEaKc7xY3wniTybZ00WnXOXYEeViJU1q8hAjd23BuQeZ1PVEIRnsiXggdN7gi7av
         roBQeMjH6PF8lsFFd7DgRfYyWH/k0KxDXEyjnTVs73NNTKNpwYrRFsItYFA6/BY+i63g
         i6maHwiCRuuiGcsW0Hk9rhVlvGPADq42KmeiH+Dz2TPeB2OTJUFUEIyay3e4K6O4PMJ9
         G4uQ/e0A6ITIG7MP1X6F3PuHc2HnbAj7R3LDRS2JcLWacivlBpU3RzU55UsdPMMEgQe4
         s9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838121; x=1793442921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
        b=A6CkthBt3y1PO5mtDKUjBl/6WTuiNIJo4HYMXx1xEbJxvqLd88J2/dSbMbczyFu8hO
         uMRQa5smC+p+8xGqOv0oyATo9uJrAk+YtgmUEFeUJZdZi4ozC1dNUsMyYd+uWz3mr39T
         dEN+JntM/MZaR2Cer50YECO/8kJZESxMukjX8208uTw18+OcIrwu+H/Gy1t67eIxVXpu
         4hvf4pm5xVtDitJKYrAs9XaRnt+pFPVdcJEJ4qwbTGhnaI7g4RObmqHCG+DKbWq8GUhG
         IRFPcC/JDitXuwuDx2Tn/Gk7MHlqw6nywvLteGSz3YQXPXnlUsea8wOfWGY5VRUgkFZs
         174g==
X-Forwarded-Encrypted: i=1; AKwUvBwmtCYgmhpBGAEez788aiQ0KI2isnCX2YpYN1h9P7+z2cJPHE6rSSwlwW9C9Vh8/x50eCqXW5ja36fLPEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJZkmIDVCSTioJz2PCbQOdrnczhKTPoYeaxVBhpBwRqunQj3YR
	2tW/BDaeX4iLJ2q2KZXG1C6uF9vZv651tzFYR3ENmrQjQAe1m66oLaMgZouVVEc/LaXu1VzmuPO
	bM4nVAXoH4qAwlBVNq9FDFszMwf9dmEVVTYoMzabrOg==
X-Gm-Gg: AYBFou2fLrPbxJsr9WnSZtHEvj8R2ytFt0tWjOTkGj+g0Dag6FwzGCle89Z7syfYgeD
	RVrG+R8kufncjzAq9U4LKFkin0zCOOLjU5LmN7iUSKaQXLTmZac/5uFsRS+IOc00P2qNU9AgkBp
	eZWIvlBkDeznZ8qvrm4cDibMdcecWP7zWsHeY8EnlkoSM7NGEvBJ0UfKi+vbmu3X+n6jABOnhlj
	jsvwixl9pfn4205QdD4x0nz35WjAHhANjNTX+lNa2og7ptn/ngzds+judLGpGKzopzUY8uPNEYS
	WxD3GnzG6PFfDohgiPK5pCMdMQ7Pd+jQpy6Sh0eomvqWgRC3As0Jk3T3Y7khmOiocOsGZiL+J1q
	0yhDsjAKwEvTSH7YOSohPVBQ7qHD+/60arWQKwgNZlZ/4lWOiyuZ0ireg3tICLt14C+yrU6FGnT
	B0KeAy+aAsK2E/guSw
X-Received: by 2002:a17:90b:582d:b0:3ac:c024:b275 with SMTP id
 98e67ed59e1d1-3ade9b2ef33mr1458580a91.9.1792838121551; Sat, 24 Oct 2026
 03:35:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr> <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
 <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com> <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com>
In-Reply-To: <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Sat, 24 Oct 2026 12:35:10 +0200
X-Gm-Features: AclHuK931L2oXiPPuKzWcoF3-rZklcyBCLSRbJVaUCSuCAcGKc-a8jrSumJzuR4
Message-ID: <CA+HBbNFiAF03WTz_N-_N8ZJantFdSBud0vZbiNw60_Oxju_=FQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Julius Bairaktaris <julius@bairaktaris.de>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Vladyslav Andreichykov <vladdrako007@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 11:46=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/23/26 11:41 AM, Robert Marko wrote:
> > On Wed, Oct 21, 2026 at 10:06=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 10/20/26 1:39 PM, Robert Marko wrote:
> >>>
> >>> On 20/10/2026 08:54, Julius Bairaktaris wrote:
> >>>> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>>>
> >>>> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> >>>> which takes its AHB and SYS clocks from GCC, so the device tree does=
 not
> >>>> pass them back to GCC. With only .fw_name these parents never resolv=
e,
> >>>> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails wit=
h
> >>>> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 H=
z.
> >>>>
> >>>> Add .name fallbacks so they resolve to the clocks the CMN PLL regist=
ers,
> >>>> as gcc-ipq8074 already does.
> >>>>
> >>>> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>>> Assisted-by: Claude:claude-opus-5-5
> >>>> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >>>> ---
> >>>
> >>> Hi,
> >>>
> >>> This issue does not exist upstream, as CMN PLL is not yet wired due t=
o missing
> >>> networking, even then the solution is not to add global name matching=
.
> >>>
> >>> The required clock inputs should just be passed to GCC directly which=
 I have
> >>> just pushed to OpenWrt.
> >>
> >> Just read your reply after writing mine, I'm looking forward to seeing
> >> that patch!
> >
> > Hi Konrad,
> > You mean the wiring for CMN PLL or?
>
> Yes the wiring

Thanks for reminding me, I have sent the IPQ8074 wiring.
IPQ6018 will follow.

Regards,
Robert

>
> Konrad



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
