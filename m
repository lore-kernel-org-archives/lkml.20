Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794896101;
	b=395nfNe4trK3H+9VoGpvkRfdswxuVhksNdfMbRWiVDcHCL774TRDbHoNpt5JmezMZQQ+
	 1dkMUOA4oMusMvqeuG/+TIBZ23hvZpKXVqTQxu0hKjSDMyOVzi91pih+g6jI2QxXMHzOZ
	 4Ks8KN9IuwXV/pRsgiICx1XP6clDR70aDoolsuh/p4Wtq+FEsL1qH7F1kI3K5cKOu3Cdg
	 Md4JlVF01MYeCRbF2+5TYdvEdwQ9FVWOGEG5QJe3sTSUFMPY16ndUFjuUeMgG4Jt7y3Dv
	 vi5ARvbGjsl1XOruRUlWaB6qD6MEPxgng6nL/+A8UhmEIEi803UgS19TFpIKIlVYvYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
	b=yxi2hPwDqkgDxwlMX6XC0WYcG6iNm09KYndiDIygN6Ip0+zeQKe4GYidrQLs3/+iFS75
	 MPGTwdKpW/N+v+HIp94bWFSUERJ4QUOIEVauSrtG2ZivhuV7v58efTN2IMCy4OZR3+Ppl
	 TlfYmKfr/+zVUDVIes2Jgri7vvuBSg/HJyvnVnACF/R5CDZ7U/2mKO6vBRTEdEAHdRQbV
	 X3R1SdbUeOzSiHj6W1Cng1j3eoao+c2ShfHWXtJ7nRc4E6UBacmRb6h6XpUwachy1lXNX
	 SGDKilBThDG/IClBpxItPzo0xVf2O8BQhSvObqjcUCJvXAqSGPm7VUmaedXk9dAAEaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG4FZG5e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CC4606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65CC4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG4FZG5e
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so6858324c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794896100; cv=none;
        d=google.com; s=arc-20260327;
        b=Vd6JE+lz9jy40yG2PlXtPP6cz99TBVW+SPwPEQKnf4TdpyBQgU4aapZ8WKxULaIH1g
         RDib+6yoeyLAbAPYEdlb2dB9uB7rxFxw/5eYwOqQTl9/dubEnPDhma8jTZB+94WgrKVX
         Wbdmtp4Xbn0lNTPxtPTbcy2jRD7LOdjp9hWURLSSmOOY24klJS8Ciu2HM9CCLvUuv6OH
         cklgbc/mU5BISCRdw4lGNiNGB4NKn5GJFeRV162I9p05yT96ZJFGU4hWuZRCwD2JWKWB
         wXucQfajH93Oz4Dj86pcvQhVhqML1bt42uXFBVmOCHbGwQ5usUzA+lr3yhJp1pYNq2sF
         Otyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        fh=a+t8zgszHVXnyNsAcJpt4Tdslwz+yCr0L30ZH5OAmbY=;
        b=Xy3EjCUKjZsga4cV9r7+TvQ/GT8yft/tJUWeIBgOk8sVomGlyy02RhBxoB7ZpuIucI
         cFvlzia6XqNZ2uprkYLHbGaXF1uZEnjq2Dm3bUyLJ+7/XLXaB0rZWAeWgBde4Q1Pg2R/
         2gppo46yN5//3BCUwra1WUlsKsKD6fvtwaiy+uMHLjE2O+ez6lxrpmg7ojGzyrjplB67
         KpiH1IjmXIiqdP1HwiJS3x7Op4fwI1PUEbS+R5KgRAPv8V4CcesMbOhsuzEL0BI8e527
         ewiOJaY7B2HqPyYbe+xzdgOWconautky2oSLZalA5/BYTs4dBCtgrsyWdqMHKTL0jqC9
         J6XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896100; x=1795500900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        b=BG4FZG5ebLAflhDHW2u0yN8dm3eyrZXUYTLHo5JldGheWYi1fIsH2FaizeVmFA9kLI
         +RyhuNCMrzqWS7kJhDGPo4BxJFoKyvf2IYtNVsgl0LkC/dmaN8aKXN2eml8i0ij6E0qs
         BvT6Jk6X4MklIDZaKrqCiwvBjo61puWWfw2hdNfM48pEQ/LxtMvvxqI7j9nGjYxHmsE8
         UrnoDT3FJLhp7ZFdLeDNpw5eLbBmuR/zTY+xxKAAgxqoGkfGsb9IZgXJmtfSEGleFcRE
         ifTsOtpXm4n6cQW6dWpaKzDipKLQwPpnl/vqAnbpR0nin39ANrSZbIj8udtOVpcwRmkk
         KvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896100; x=1795500900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        b=yhKL0kMx1u3uRJrfrNPDpyxQg2i0QNnOvWCtKSItYTTiYy1xnfso2w2GHF6iGuWZg4
         M8SSCLVlNPnPKPYHvoqXBSLYsyPqSs4Zs5R6SZRCCbUANmUcGzzJscStrj4KSdNRqSFi
         4uFm07Z75FzOPLpE/h+Fxh4fR1RfSzkP9Jcpp+i8SFh9DuV2gaUI0EUjj9S1KmXkfAir
         B6czy43PHlnX1j65+wGexmF2eA5g7uGepCtuHh67XAsfSbylm6I6ZiTsjOG3yCbrX0QM
         6fZBGgzuT51vQ/A0lSEdisaapZWAA3CwnYNO2AUeztn+Yv6juIlZMIAtgYKhTiEK/Va2
         nmRg==
X-Forwarded-Encrypted: i=1; AL+hErFTIuzbO/DWwEVBfk0nPd4Dip6iZ4IDeHpaMksLq/G0Tlw1BjBf6Q2lnN6d6MF1CrNw4IdwJKSAPDE1QQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YdmIO61142AbxJn74rqc/VXPBWrK53xjkCx9TCXL1qDpl9SjC
	+zu8C1LN2jsvOTSuqkpcVJwaF+C5PzyzF1maz+FD9FbxQQzvk77P1OXiAySdjr9PhlGO8a44po2
	RzVfDOBOiVPSpmfyMamvAzVBhiqgPLtA=
X-Gm-Gg: AYBFou0w+UgCv8NOHDGd4w3Q6T4Rqa8H6DFOaKGLZmIo0AKW5nVwZMnCfCIhjTjzVUd
	tUlZ7j3p575XGiUSypwBxvnexxXB7l2yrgFoUenLv5T98h2wVbNWZp+o1rEKNdMcsNg3g8v2oWC
	FuK0LPAryLrqomtO3fNtZwEUdJC26ut9WZ6tBv+xW91r4+0+1Ehu8l1KAN43fNnqYlAqeCcwhXo
	9PCqy4TGWDHCTJckC2FRVQj+aSu3gtTqBqUV+pps30B4qdv+i7eOMJLyL+G6m43+eMSwgWkxiK3
	KUk7XXLmLgVryLfPGCzwYwjCmXJaxvs4nCX1aWKJEFYfm/CboZGjP08vfQtoloG6B2FCUDBE+uo
	RInMOYOcHiPD4sCy5BWnex3aMW9IshIhZH1nCEuQ=
X-Received: by 2002:a05:701a:cccc:20b0:1b5:32d7:7d73 with SMTP id
 a92af1059eb24-1b532d780bbmr3902889c88.30.1794896100415; Mon, 16 Nov 2026
 22:15:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
In-Reply-To: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Tue, 17 Nov 2026 13:14:49 +0700
X-Gm-Features: AclHuK-92z3C_GXFHu7R-8mmf-2cWRgFAIJrCVXLvNtI2-ZT_Yern3kmnNXQGro
Message-ID: <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Val Packett <val@packett.cool>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 8:10=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> + Sudeep
>
> On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.c=
om> wrote:
> >
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > call is rejected with NOT_SUPPORTED.
> >
> > PSCI provides no call to read back the current suspend mode, so the OS
> > cannot tell which mode the firmware is operating in or why the switch
> > is rejected.
> >
> > Add an optional flag that tells the OS not to issue
> > PSCI_SET_SUSPEND_MODE on such firmware.
>
> I think it would be nice to further clarify what's going on in the
> PSCI FW. If I understand correctly, the only supported mode is the
> PSCI OS-initiated mode, hence it's always running in this mode, right?

That is correct.

>
> This is clearly a violation of the PSCI spec - and I guess updating
> the FW isn't possible at this late state, or is it?

Just as Val stated, it's not possible sadly.

>
> >
> > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > [Reza Kurniawan: split out the patch, rewrote the property description,
> >  renamed the property]
> > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Document=
ation/devicetree/bindings/arm/psci.yaml
> > index 0d04389c81..2eee38d155 100644
> > --- a/Documentation/devicetree/bindings/arm/psci.yaml
> > +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> > @@ -98,6 +98,19 @@ properties:
> >        [1] Kernel documentation - ARM idle states bindings
> >          Documentation/devicetree/bindings/cpu/idle-states.yaml
> >
> > +  skip-suspend-mode-switch:
>
> Maybe a more descriptive name can be found?
>
> osi-mode-only or broken-suspend-mode-osi-only?

I initially settled with a similar name before (with 'osi-only'
phrasing). I ultimately went with 'skip-suspend-mode-switch' because
the root cause was only due to the mode switch not functioning
properly. This property doesn't do anything regarding the mode the
firmware is stuck at as it's only fixing the failed call. Normally,
the driver sets the PSCI to the preferred mode at driver probe (OSI if
supported, PC otherwise). This property simply skips that part and
assumes the FW is already in the preferred mode. It could
theoretically work for firmware stuck at either OSI or PC mode, as long
as the platform shows the same symptom, It is mode-agnostic essentially.
That being said, I'm not completely against the 'osi-only' phrasing.

What do you think of the above rationale? I'm open to suggestions.

I admit that the word "skip" here isn't really helpful since it counts
as an implementation detail. "broken" should better describe that it's
a quirk.

Best regards,
Reza
