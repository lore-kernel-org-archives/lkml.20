Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673886;
	b=zZmtpPuAjglijw6Z2nRv+nCOkqJwMezWCJRolrOqhpKSlIMoadrDtz5RvAlFjDENUtaf
	 zQzRRBjzpp+x0old5Y4/laRSrBrtC2Xylu/LAYsK6eRKDvuZG8/sISU8HqbW/wFH+8tk9
	 ePfgdosv1xx2zQkvAOJ11zBM+KpkYmXTLtDP84Cki6VH1H5EN3Pqn3Y0DKZBCB4jwBt/i
	 gM3bQSbfzG5mb39qjnARN82ySFRKK0SfBBg8oYchd1SjeKcszhSvC9vxcXknKfL34qLPJ
	 6gcrCJmXxESHLkeRGVvirWlvW77bAr3V83HNeA65SHDFy6cgn+NndlCFL9RwPDZX88w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673886;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=5Vlv9NX7/q60nT2M57UH6J+SRq53m5fxwmq9gc9UNtY=;
	b=JbvOoOJa3508GGocyanxHfCnjoKpKQzOlykLhknStWgYMdgE3+KLy7tM767DNuvXqPSG
	 DjG4gR6DC7M1E/xs6fCRVFEVV6oR5/RI5uwyw+Z6x0+3QvIR+GnVPCktjRMG8nVP7Mj8D
	 DMLK2sbJyECFGrV5RGnE8kO/EVlsShWJqCWMA2xlCbFHkHcmv2NFlTCCX+OguxzY4HKVz
	 nbloZHgpBwXzGz2F8IS2YeItK38W0e3W/QbMAd6DoD+E6PB7DmpoppMU+plK9nAkNV8tI
	 g8KNhuo0neFGdW8cRhOhnY+YPsVDUiXqu9mKWi5KOhYr8R+beQdyugraDmcgZiMUUPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiCJw52s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432C8606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiCJw52s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52411F000C3
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673884;
	bh=5Vlv9NX7/q60nT2M57UH6J+SRq53m5fxwmq9gc9UNtY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DiCJw52sWHHrE8qE6dCiJo4/jlGyosgQ3LhIRRZqibEDXijWoo5S6QbCgWYxPHcPD
	 IiJ5pdLjwb7gxK07GgKFoZtPyDQ3xFOOtS1EPNBr4ijilCyNwwWePLpcKNaa+4UHzk
	 aIcBKj4FIK7HNX5Gmvn3o5iR3z6jZ0emGnAb80TR2gAH4a+zV7WK1VKWMQhrkhRj6f
	 xVML9XTK+zrk3Bm+wTrUsywc0BMs8vdoCJ88C2nH9PyqF2mHgbH2tyO4lyivJLQpLQ
	 EliJkIxJrv3YWne3c6i6vGuC2nHXLWaUKUCmi0H4d6CMjGLXB0Pp1bRYFzvdGcAoiF
	 zPQZ8q2fDjiog==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so720636e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:58:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8Iu9x9/KNVLlk2froqTJoDA4IRyGIixvJaQRCs6Bss+6h4YSbmiYpdHKUbI6DdEi1fbXQjzTmtwOJxAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYILrasLFdcixPAYSpBPMqFlBaKfqwgQ/72P6nJ0rtf7g9mhVncu
	c30wIYZ6NbBiPE+OoFtKBTtvqysecWA1fYEZNLmH/rAxs4mHDdcLa1cGzpCjywWlqfKNqy4YMMd
	8rCFQxxv9Wg/7uUSURBm35vTQFCizz+JZtDVXVZbNPA==
X-Received: by 2002:a05:6512:33d2:b0:5be:50ef:ef02 with SMTP id
 2adb3069b0e04-5bfa1ccea29mr2142055e87.13.1792673883580; Thu, 22 Oct 2026
 05:58:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 05:58:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 05:58:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 05:58:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeWQggWX_A+CkAE-Ci420RqLV383HGngAXx7aFnGO4krw@mail.gmail.com>
X-Gm-Features: AclHuK-5CQtiKb0je_S_IE6JRBYFGKIeNGx2LoOrOHFsNUMvJhjAXZmu6HDSJac
Message-ID: <CAMRc=MeWQggWX_A+CkAE-Ci420RqLV383HGngAXx7aFnGO4krw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: Introduce SA8255P as Lemans
 family SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 04:37:04 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> While the patchset [1] supports SA8255P as a standalone SoC, this series
> offers an alternative by introducing SA8255P as a Lemans family SoC.
>
> Lemans family has two variants: Embedded variant (IQ9/SA8775P) where
> platform resources like clocks, regulators, interconnects etc. are
> managed by HLOS, and GearVM variant (SA8255P) where they are managed by
> a VM acting as SCMI server.  All Lemans family SoCs actually share the
> same hardware configurations like memory maps, interrupts, DMAs, etc.
>
> This patchset moves those platform resources out of lemans.dtsi and gets
> them accommodated in lemans-embedded.dtsi, so that lemans.dtsi can cover
> GearVM variant as well, i.e. lemans-gearvm.dtsi includes lemans.dtsi and
> overrides/adds properties as needed.
>

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
# sa8255p-ride
