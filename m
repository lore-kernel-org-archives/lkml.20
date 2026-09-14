Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59B34734D3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396684; cv=none; b=Cb199Q83j3hHA+RtHzEQDea5GRQebycRTn7ix7EsLcV2riFRag+IuS3WmKFJGOUDMVLpJTJpttB7A3ggpYrn2010j3/gBvHJLOqr5PhRkzTfLeNH7DJpROW05cAdBqvYPc+pqk2weH7wXbsU9M7Y/Wlclj62g0QwXwECFAvDjUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396684; c=relaxed/simple;
	bh=22lNwcjme49lJoyQej5EO9GCPltJb1b2Z8DFscfSD/I=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=njrfrc8yd9MOgXlMaqpORh2Sc8NcQQblR+gu/x5rj2atk5fnWo1MNFlIYLRD76llo5CLMecsArGcGAJe2C+y191oE0xg4zzJQNrALxCNSB0nuLvJf8O1famFZaGrRu6VANPcZmURMYjMBIUY9i+nkdeDo1aHkXq+VvUtAishDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=cyb+H2/2; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="cyb+H2/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789396679; x=1789655879;
	bh=22lNwcjme49lJoyQej5EO9GCPltJb1b2Z8DFscfSD/I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cyb+H2/2jSKMZVwP8YlsaidpjFu1B8d7h2ZLhf8lEkePtq4aX2lM08Nrq2dHMpxiv
	 +fZV6aWmACSxdf/LFpoYsH+CHHaVruet6JgzSCz7Vsl5valU10itjuiQ87TvqzcCtJ
	 D2dda8gvrLdNKGNQsh1Hh/eGlKt1KRke85YOaORw3kKC15rcRvrkC6fptoilrptXeF
	 WVox9RCCrQ73wfhjM+OhI7sqlKpTDSeES/X2cIRsgJ5+NMpaFnjQqyTJvA98VLOhHS
	 4CZ46Wv8kWl1hJvk4wat4G5fUvU8B4aG3ZNSVS4weA0gmw6TH2bLsrCxYp3izQjQH6
	 mcnKSx0MU1aDg==
Date: Mon, 14 Sep 2026 14:37:53 +0000
To: Val Packett <val@packett.cool>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Xin Liu <xin.liu@oss.qualcomm.com>, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device trees
Message-ID: <20260914143445.yoga-kvm-regression-test-birk@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: fb7a7b2f3c4b98d606dcbfd78a2f76ebc60c89a2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I reproduced this failure on a Lenovo Yoga Slim 7x (83ED), BIOS NHCN62WW,
using Arch Linux ARM kernel 7.2.4-1 and SLBounce. Boot stalled with repeate=
d
SMMU faults, including FSR=3D0x402, SID=3D0x1000 and IOVA=3D0x86b020c0.

I then tested Jens Glathe's non-PAS EL2 overlay [1]. Keeping the kernel,
initramfs, boot arguments and SLBounce unchanged, removing the two
top-level ADSP/CDSP iommus properties allowed Linux to reach userspace and
initialize KVM.

Subsequent one- and two-vCPU Linux guests passed CPU and timer checks and
shut down cleanly across two cold boots. The host remained responsive, and
post-test kernel-log searches found no "Unhandled context fault" messages.

These were RAM-only tests, without GPU or remoteproc modules, so they
validate boot and basic KVM operation rather than full desktop or DSP
support.

[1] https://github.com/jglathe/linux_ms_dev_kit/commit/ce20a20db795f299983f=
092fb899e0ad1c005be3

Thanks,
Birk

