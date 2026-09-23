Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98373443E56
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147393; cv=none; b=I08Q5D/CrUFZvsP4U4eQTAwS5rayv6umvBff3+BcAczdrFic+IDiPHPoFeId5mAq42E13vCcsH3OPpmakLZCQ1Y+b50fCAO1w+k7xXOpONWksyyWx5wKUJAbsucYObXl09a4jOGO8CSGKYGDocQ/5QIdtrYqjV0klwp1nHdVLJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147393; c=relaxed/simple;
	bh=eHfMOe6yj02YxaPLLtIkd4gQOtdahdLmLAMh8gnz3bg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NheEg9lFp0LLa3vHmDiYzXT7C/kryE/pzNwuCSevszXd5WJpNt5DQ8okIGnFGrjCn6gJBDFakTcZVs8Qn260NH/gL8qBHh0QAEndO3bgOy2l+v80PLt6IKWlOXxjRHrgDOFvJ3pbkraeGhV872F1ajbZWb7g6Q8f9URWIm6vh2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6WRnefT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6WRnefT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5595F1F00898
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790147389;
	bh=eHfMOe6yj02YxaPLLtIkd4gQOtdahdLmLAMh8gnz3bg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=k6WRnefTPBUOG1x03Ga0DPz0yhzIZqAifGXC0g33jzH03dN+Q8zPmfpVL/JWdKp8Z
	 tzo6oDNE6myn53NNdLOkytHkU4sFatSFSsrhs5RZinoFHLi2pbRQbrbNi/tRzGS3Q1
	 pUDBjELxM6zUfGTc4YOf/fm9Hdz2lGs+s4yxaABW1seGLQizvzql6hFm0X8tnLYSw3
	 IFbh9mEJN/Ux3AYpU5AbIZiDj+kAu3aDQFRErMp7P6tC65EBnzT0anS0ut49A9Z/lC
	 2ZveVFR1bFku3UMc3jYdzUhGmyewHbMQmDsT4WHZ52+Hm+Ps1aMBy3kt0QOOfNabU0
	 Wvv9EMepHaZZQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso5666221fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:09:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxN3YXwid7nYB89ga1oms3oErvWswkyJTGmKqd5/0sfV1u29T3Jio37z2Dnns+Glg2RM4M/5dbkRtZv+LU=@vger.kernel.org
X-Gm-Message-State: AFuF++ntzD9MIiUBTRDZeoNizE0WQQ0rh1iU5G4WRCAZMGYbCynoUdZy
	ZjgjQwmpxcXVWLfN8379c9N5A6WJahowGE6g67o6JFht23kcrDXmDHO7SH0OAR1TtmS5SMG/8i3
	VrkmG9mzs4WT3WBloRVwC83Oexy0/jB0TAakHSo9K+A==
X-Received: by 2002:a05:651c:1507:b0:3a5:dfd3:41b6 with SMTP id
 38308e7fff4ca-3a63056d051mr3233361fa.0.1790147387898; Wed, 23 Sep 2026
 00:09:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 02:09:46 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 02:09:46 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 02:09:46 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mea4jjSz5L5C0jMiQxovC13xSLODJ7ZGEJomCkjvuBAEA@mail.gmail.com>
X-Gm-Features: AcwNN1X3aGV2TxSGMG-9SN0VSQVmz27NKmgIHphO1b8cBVjG9WNWFgpOpDyyI7k
Message-ID: <CAMRc=Mea4jjSz5L5C0jMiQxovC13xSLODJ7ZGEJomCkjvuBAEA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add PMU node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 11:34:46 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Anurag Pateriya <apateriy@qti.qualcomm.com>
>
> Add the top-level pmu node so perf events can be collected on Nord.
>
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
