Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D798463B7E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930856; cv=none; b=G5msw1NA5ixevMQsKUpafyyzB9MLDyK5SC9dnVTfuFB9IF7KPgwTLGk0rSEE2tPrdZRzTUkECH5yinixJp5SWFq803Y333RJND45rpONb+CUTXmcwg0Ekf+iaokDbcgBu15w2iaTw+RbH9iwFx/ddx8tsHpOhKOvO1utJbJRmpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930856; c=relaxed/simple;
	bh=CfVVsEKQiKUKIdQcsrMCIp1srl6qWTN/O3a/DTTNycc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MuwVCPrKK3OFR68OJP7RNuIxPEqG1V1lhhUqlu+XMJ6nDBnKfhjV75k1/m0SesbGiVTMVFpvJUvEhs1Z3xkQ+s+iway21pt5fp4sa8vsTuxGtQacCRQvmPqk/E8kcalAUbnxR99K8loLCq3gkYLgESzr1r82LpPfCZk/XzZeR6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blYtVQuD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blYtVQuD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D041F000FF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930849;
	bh=CfVVsEKQiKUKIdQcsrMCIp1srl6qWTN/O3a/DTTNycc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=blYtVQuDY6DMK30ogsweK+gYX3Eg4oOwdDJXRFunA5u/8HssdVX+B9/M6l5fWUIUE
	 M6QF00vE3g1n8PLsgDNnWRCtDO3/3kA8of2sJLzrysx4fPYa+8SpiJu7c1WoHRljet
	 3/hIQIPlMiFKWBCNQOyeR20zhTnxx5/qfws25lbPSELmAGkx+6TdB0VdJcN8wltmjA
	 TaUi2ihTO8FHaDvyZ1yh2xqbHN2cx9tUfDp+B26aSUGxrBD+2pOvQdUoOB8b+vRYdI
	 LhoUWakCgZ4p99pu5ioQSZ+pPfltzraQyCnD3xsASEshsGzQgmvJzlYJFIjarLjxKe
	 8J7TupzpQecNg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so6667254e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:47:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByFnRWObal3+TNHEtloBCog+exKtcOgUYq6jchUqbt1njPXEK5V6zLNl8VKim018tohhDgQmhD16opABX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIruSvNx+X1UgOBrh0wPXg+hnDnxDzB6smO2FOl4kLDDyh2Qnxk
	73/5BT/W6Ep6EpkmMgmT1BQfr5ERW5Q9jgDkEsWWbRGlBCbdmtyLoIMT1OVy7bnvjn3BaLoJ1HU
	sD7iSBpekHg9BDZNKJu/H0s/7wHoxUD6d3234urp25g==
X-Received: by 2002:ac2:4301:0:b0:5b8:ea1f:1212 with SMTP id
 2adb3069b0e04-5bb9bb034cdmr497464e87.29.1790930848716; Fri, 02 Oct 2026
 01:47:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 11:47:26 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 11:47:26 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260917-nord-usb-dwc3-dt-v2-1-8f88aa30c434@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-nord-usb-dwc3-dt-v2-1-8f88aa30c434@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:47:26 +0300
X-Gmail-Original-Message-ID: <CAMRc=Mf=Uw549oV0sAdkEKn0YWGbGs3WJDvwT9QT68Wof_M1jw@mail.gmail.com>
X-Gm-Features: AclHuK9ZnIv7V1GnuyGLwFWZPuYOe9gSpC1LVPzxGkpqRg2LumFl06AulgiqkeU
Message-ID: <CAMRc=Mf=Uw549oV0sAdkEKn0YWGbGs3WJDvwT9QT68Wof_M1jw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Document the Nord
 DWC3 controller
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sep 2026 19:07:00 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Add a compatible for the DWC3 USB controller found on the Qualcomm Nord
> SoC.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix the interrupt constraints for Nord: we also require hs_phy_irq
> - Link to v1: https://lore.kernel.org/all/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com/
> ---

Greg: could you please queue this for v7.4?

Thanks,
Bartosz
