Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C129A52B1DC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858673; cv=none; b=Wueu4PjUXPb97dZGojyCcDFYlJ2UdaKayu8MwE9EoLmd1Q5QfgT4PjbU27CeA3kGP24gqITR3XhYoXPqZQ8jus5f8GoqQLo3FoX/vDT8MI621UFpz1Yw5tG3eXuUKDYlbjnOdH9TbhWUQ/sb8lstTEYu59pinH2iVQxLigFGUxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858673; c=relaxed/simple;
	bh=TmzzV+fM1QSXib/KcubYMEqzdh2Oyo//gEQU5hpWWs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyfS+t2q7hWFZNGR/IgkvqeLWjuB5JWTRTuWKPgoldSMOpQXL+Jlpy8IhpyOIwDaYFwUm5uJVkm6Nc5RJLI/xjBe8PlZO2wIej7wZmEu3i2IiVwATpTjQpQdRkhH3nXHJCwe9NnyIo4ZqvaDNjz4Bfggv04Q/NI5cBUeyGwhc4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FSQzD4Uk; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FSQzD4Uk"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so19654a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788858670; x=1789463470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IrpwdRZwJHUrRXfsJpygnheg0Tk5qU692FixuJGcKnA=;
        b=FSQzD4UkKoH7nFV+7KtLqMVKXnWrx07dj06vGUF5qCMJuLbG4ZrPfKi5C0/XT1Rjt1
         9sv96NRQrCD6n3IF62sOlQXXt5aWCepfhPvy2JcVAv9/wsJowp5T1wumjdrvAK8lecox
         hYhinp0BbxOtUGVOLK3yDeutdbeN3zTI4V7c/Pc+l6EhslrDgVdxFcSVvFMtp8c9JuDA
         pONAT0BtkPv0SczblcxKsa1WYOqoEOpAP2qMtKbV1Jwp7t9hgo8ckoPS01M++h28tuZO
         imoO/WnAZ6aKT5PbPhXTILmkPxkMDxzftbNjDdyS3hige91wbGrWvH348nwiuycEB8CN
         IZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858670; x=1789463470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrpwdRZwJHUrRXfsJpygnheg0Tk5qU692FixuJGcKnA=;
        b=iYkSv61OjhvzyNnsuK/js2VyQBUOf83xVbjCVB3GAjPVCLtR21R+L3uISON7uOQWxZ
         QQUZY56iu73sv1chQ/rkgX9FmpA+PxNX1h+OprUeDqnCN/3AtbBpyZ3HFwtKsRZtlmWj
         9vVkhOh0QJxX0cDtQVNr41FNZ4LC+gd4KtJmksfm0tXgfDRokg9iHzi69vHJ1HSS9pv/
         0JUkBwws1RRNB93/gAKQm/2qmX9jzEJNP3i6+9PsnCzQfan6niAsmXecDRR+wU+nxEUu
         QdFA/65H8KBkKpSx8X5KELE37Y4I9qG7eY45V021jK/7WswUToJTPfYTbQ4lEKEAHtmJ
         xTAw==
X-Forwarded-Encrypted: i=1; AKwUvBzLI5aGIZ2VAkJZqbiQhwEv17kVOHMOrQRWmA0COHZ/6oMfjbAW/L6izlMKo1L5eh7vB8cTcvq3geXS/08=@vger.kernel.org
X-Gm-Message-State: AFuF++nNr954pvKiQpTVaY5qZf+cZSi/0nda2WrlTiUo4z6UlnRGSRqG
	+LwAMPJqQK3qQFAUntbIBDO1NZozaHrSJQLNlChvUW+YJ38ESJTeyPnMDbEQuGu0qw==
X-Gm-Gg: AYBFou2wD2dlbrWR0rynwC57I5268WQdYEu90Cl+172gQJ1q9swp5HX8nDQ19qQAQHf
	xvhZKBjKyKuJi54iMKtjir0399qFSb4TjetqKGtJyShHE8csGSGGtCQafuIQixU8nY0oKFWtWmv
	P3JTgBpc4UBC69ZpmrG3gezfJyd9UVHtDUpzlo2hA2APyUmR1AQ6BM9uw1+vDwtgvcCyL9itLdm
	rm3TVoRblbDQIEpG6ogNyc6e/Cfih2c3QeD6+sw1WsnMOmKzeJzKWcU+rRZUbVZ3d8YLYtyBHb7
	3Qci8Y0BQ+IP9LPLvmmWuMNTevF9LGjgRqT8HmHnyhz1nQufvOlyGylyn3O55F3j3d7RwHYmIp2
	qBgrOdDgFYsMdMVQDbh6sXBIbhSNOnCWq1Jts6wmyElkwR9GBbIjMS6Bv+QaBXMYc86ZYoxB/Sb
	A9Dfv+ZsG3EYExO/LicYgYgmBxCctB1mdOBlSE79fCumNIkgAlxAX/EovgPtvw04Ali3RFGFaSK
	Mk1uZnkGB3pQ5E1AODd9LyprmVjKQ==
X-Received: by 2002:a05:6402:a5cb:20b0:6a1:f088:9486 with SMTP id 4fb4d7f45d1cf-6a7f67b5d76mr50415a12.4.1788858669454;
        Tue, 08 Sep 2026 02:11:09 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5921e2sm581052366b.46.2026.09.08.02.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:11:08 -0700 (PDT)
Date: Tue, 8 Sep 2026 09:11:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jens.glathe@oldschoolsolutions.biz,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <ap_RKfCbXAVBRtSY@google.com>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <799c3128-cf43-4a64-a8c8-3f6695bbf424@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <799c3128-cf43-4a64-a8c8-3f6695bbf424@kernel.org>

On Tue, Sep 08, 2026 at 11:05:34AM +0200, Krzysztof Kozlowski wrote:
> On 08/09/2026 11:03, Mostafa Saleh wrote:
> > Hi Jens,
> > 
> > On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrote:
> >> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
> >> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
> >> chassis, different silicon. Stubble and the DTB loader need distinct
> >> compatibles.
> >>
> >> This series splits the board description into
> >> x1-lenovo-ideacentre-mini-01q8x10.dtsi and adds thin leaves. Each SKU
> >> keeps lenovo,ideacentre-mini-01q8x10 as fallback:
> >>
> >>   lenovo,hamoa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
> >>   qcom,x1e80100
> >>
> >>   lenovo,purwa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
> >>   qcom,x1p42100
> >>
> >> No qcom_scm change; the fallback is already on the allowlist.
> >>
> >> The remaining patches fix the common DTSI for both boxes:
> >>
> >> - Build the Hamoa EL2 DTB like the other Hamoa boards.
> >> - Second M.2 3V3 is PMC8380_3 GPIO5, not TLMM18. A 2 s startup delay
> >>   is required or pcie3 fails to probe. always-on is a hack until there
> >>   is a real M.2 power sequencer.
> >> - sound-name-prefix on the three DP ports. Enable lpass_vamacro: no
> >>   onboard mics, but it provides fsgen for tx_macro and rx_macro.
> >> - usb_mp port 1 is not populated (no PTN3222 @ 0x4f). USB-C is
> >>   usb_1_ss0; rear Type-A is usb_mp port 0 behind a Genesys hub.
> >>
> >> The Genesys hub is left undescribed.
> >>
> >> UCM [1] and AudioReach [2] topology for these devices are online, too.
> >>
> >> Tested on:
> >> - IdeaCentre Mini 01Q8X10, Purwa (X1-26-100), 91B6
> >> - Hamoa: compile-tested only
> >>
> >> [1]: https://github.com/alsa-project/alsa-ucm-conf/pull/843
> >> [2]: https://github.com/linux-msm/audioreach-topology/pull/74
> >>
> >> Assisted-by: Grok 4.5 (xAI)
> >> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> >> ---
> >> Jens Glathe (7):
> >>       dt-bindings: arm: qcom: Distinguish IdeaCentre Mini 01Q8X10 SKUs
> >>       arm64: dts: qcom: Split IdeaCentre Mini into a common DTSI
> >>       arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10
> >>       arm64: dts: qcom: ideacentre-mini: Build the Hamoa EL2 DTB
> >>       arm64: dts: qcom: ideacentre-mini: Fix the second M.2 3V3 rail
> >>       arm64: dts: qcom: ideacentre-mini: Wire up DP sound names and VA macro
> >>       arm64: dts: qcom: ideacentre-mini: Drop the unused USB MP port
> >>
> >>  Documentation/devicetree/bindings/arm/qcom.yaml    |   11 +-
> >>  arch/arm64/boot/dts/qcom/Makefile                  |    8 +-
> >>  .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1188 +-------------------
> >>  .../qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts  |   42 +
> >>  .../qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi    | 1185 +++++++++++++++++++
> >>  5 files changed, 1246 insertions(+), 1188 deletions(-)
> >> ---
> >> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> > 
> > This series does not apply to ToT nor I can find this base-commit
> > in it.
> 
> It's a public/standard commit, next.
> 
> What is ToT in upstream development?

I am using Linus's Tree:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/

Thanks,
Mostafa

> 
> Best regards,
> Krzysztof
