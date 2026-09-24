Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E6C3264DD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240166; cv=none; b=Bl+BOXUhXPBfCaCa+QapF0yB5hZW9JuVLRa781W59HhKfXJZlzXNgM4YzkweVxQ5txDnnxnGr2ELGKD34isDFCQnAS7piTZKPnEojMIzfMYsUiJw4iROrxsIpK5VrpV/nBCupR8R/yGEfcjVRzWBzCCt1TWBGR5ZBqKjQ0bME2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240166; c=relaxed/simple;
	bh=cqtnu7IaIGoRYZElCxIR5LPn7c5+fBNV9m+k2cDqIEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jit1NNyyMN4YMcDcXFZPZE1vzkRRJKv4e8PvK/khSZY8v+b9zHWBQH+WnVhfN/GcXMGVkWQJVd/GXO+z4N63zwvnS3cbYUIG1cZ+W8wEvOf6+u5Cs8OeY4dAnZzW6Ry8NewI08wRfmPoJk461vn1NBqrUkKw/FdK24UFGDAS6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qwne6CN2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qwne6CN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CDC1F00898
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790240164;
	bh=cqtnu7IaIGoRYZElCxIR5LPn7c5+fBNV9m+k2cDqIEo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qwne6CN2u5fG+L2GUTitcbeg3ah8UOMkGFKrOhQvITofXsS7eaat20syjZ2PZMgOD
	 c0GS4MeaAmamYFxLSpwlXINRozq42rBSKL/zQoeypjyK28CN6oPXjrIwyseuM78b24
	 fTkAK7wEr6jQ34/jvLLuKLFIyOtfmjLwHut5dE7rC62jmjh/A9zXKBAXSrad/GAeU0
	 8dyxQiqmQNvFJ6G+dgJ1JjeUCJD31B6/FQ4bOW7XHj0HNWu1ApVTvnmdu+vmSTUZ93
	 3SUVYe/oWAHVrwF47EnvvBa3CCNwUQwSTvM3GnlSvgkMwqBA4mpCrA0MdGReE6GJAU
	 8mDiQVebw8P/Q==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so1984508e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:56:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByEwAHawlBc1GZg9du/ikvO3VeyFLWVMWm3WutW8PcZ7jbdP3Fz+klbPfqGf39XzOrnfa6eWXRfFBBtk0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m/5AE6v5KLSJodwQsTCsYEASe7occvwzUR0gx+rpqFLaMr8lcJ
	CDupEVe1tQXxiWdqF1x6aJkGb9tLPBFjzGJJURYB0yfCjnEOydO/PhMbn6zJsYkhWAKXuYSe7Ye
	5EcXEOZ1a5wXdbCBVU1/yyLlqLUL7w131Bclbp8rW6g==
X-Received: by 2002:ac2:48a1:0:b0:5b8:bc5e:d102 with SMTP id
 2adb3069b0e04-5b8df09cffbmr482966e87.44.1790240163343; Thu, 24 Sep 2026
 01:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
 <16f1b504-c414-4072-98d3-49f60d552028@oss.qualcomm.com> <CAMRc=MfBGgJXhn_c6RY9qhe-JAYjcy8vZOeKgK=cSpOW1ap0zA@mail.gmail.com>
 <79fc7d1b-98b2-455f-9a3d-d93602bb2bf8@oss.qualcomm.com> <09715ff3-df00-4ba7-8d9d-52b15e8b86df@oss.qualcomm.com>
In-Reply-To: <09715ff3-df00-4ba7-8d9d-52b15e8b86df@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 24 Sep 2026 10:55:51 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfqztXugCfGQ9_x8spNeWGH6C3dHLzdknH42Pt8WV8HNQ@mail.gmail.com>
X-Gm-Features: AclHuK8MBQ4rBng-BJk6WQWaJXowIlUzQObMWJORuFQlrETQhiaHdUkdd8Fk85c
Message-ID: <CAMRc=MfqztXugCfGQ9_x8spNeWGH6C3dHLzdknH42Pt8WV8HNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller nodes
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Shawn Guo <shawnguo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 10:50=E2=80=AFAM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
> >>>
> >>> we should be keeping GPI node default enabled similar to common QUPv3
> >>> wrapper node.
> >>> status =3D "ok" for all the nodes.
> >>>
> >>
> >> The pattern across Qualcomm platforms seems to disable the GPI DMA nod=
es at
> >> SoC-level and only enable them at board-level.
> >
> > For no reason - the DMA engines may be reserved through TZ config,
> > but for the past (high) N years that hasn't been the case
> >
>
> There is a reason to reserve this from TZ. Some use cases require GPI to
> be available during early boot, before Linux is up and running, which
> necessitates keeping the GPI instance enabled.
>
> Also, GPII is allocated per SE, while the GPI instance itself is shared
> across all SEs within a QUP. Given that a QUP typically contains eight
> SEs, it is likely that at least one SE will require GPI operation.
>
> For that reason, my preference is to keep the GPI node enabled by
> default. However, if there is a strong preference to make this
> board-specific and enable it only where required, I can work with that
> approach as well.
>
> I think it would be better to align on the expected default behavior
> now, rather than revisiting it later once additional users start
> depending on it.

If I understood Konrad correctly, he too is in favor of enabling the
GPI nodes. I was about to resend v3 with that changed.

Bart
