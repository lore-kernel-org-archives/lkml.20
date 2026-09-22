Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6866429CC6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065598; cv=none; b=CpiQN1SlaTASsFjDK+j3hsROJnW77Crb48B6z6fShzu9oCXlK2dYX5vTbflh3JE+L/4LTEgGltCo+RXA1yKPS6lwUkA4OvXGgndgGzbIZi1zjKaCxT8Uz9yHV1RnpoUyxHkwVFA6KCA2UduNATcGyVjYZyX3oGkz2ro6wa0X0hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065598; c=relaxed/simple;
	bh=fQOOmMfKDT561LEYSJ7U+Zz4WZB+sak2H6OqPNYH1ls=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/LDUg2lKSfNheO76f/D9u9mHerMgwDGjWz/6gTRdk027PW1MCmfB/nOmhyv3sarcwtKw3mNYM9NeLMPnSqlmqv5FGp6HwDfEF3lFd73Nc4d8b8EeRTuwmWO/8kUs5mwnAhAbQT1FfgBK4BOi8HNBSVWM2Mh8EMgq7vz1hBjhaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avtgnRRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avtgnRRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8A81F0089F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790065596;
	bh=fQOOmMfKDT561LEYSJ7U+Zz4WZB+sak2H6OqPNYH1ls=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=avtgnRRr7383dZ2H9vDMQTpZTawV6P2LxP+zXvnXHrPclzCFvHzCV7cQcuYEfZsSL
	 g7jUQRAflRTcyjOqrzGQDpotadtRhQowCtx9k969Wzds+p7v3PKHjkRV4dDemcl8XO
	 pFklkOsiA+s7fVHP0hc5ywdiQE9upT8VHNnTBs/NEwo05d88SwT/2AqD9NNTKZ7PJg
	 9+A+VoIjvGHUqxHM3ChrEVOwj/Sng3S8UoWKGAQdC4liT7ShWg23NIu57CFWxNJvsK
	 wCgD5BUSNgLocXAlRjwKgfyLxG3KTbpy5DN+8QUXCnJZ1+HOrifKErcTzaavk9/Rye
	 xa6vKJC7ox/nQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so4017479e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:26:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+ndu4xXq2Trtel2E6ySQGOwGhtH5uibMes0OgBEwYJ6lrXUet3b9JRfGDvEzg3aBpyR2s8FFzuVapZj4=@vger.kernel.org
X-Gm-Message-State: AFuF++k3QXLcQkR10uDKzS1LrN2wsa/XONdZaxyoFqoMOmt4Oyr2HrSA
	rJ+4fujnnFB6UDfYskCuWTFymt49NoKhJ4opRQ6cb3joxb8N5j9QVYZOzSeUkmuyBqL2LVOLwpM
	ABo1r58PEXNsGM7eW1l2vUKN967EFEmuGqSUxFDuQPQ==
X-Received: by 2002:a05:6512:a8c:b0:5b8:bc5e:d10a with SMTP id
 2adb3069b0e04-5b8c1967f69mr4437538e87.52.1790065595307; Tue, 22 Sep 2026
 01:26:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:26:33 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:26:33 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:26:33 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mej3sBp-Mcgc4XQrMQ4Q2ABLTnnku88Rp=DH=u7dtY9zw@mail.gmail.com>
X-Gm-Features: AcwNN1X-M6i8-qVUkr4jM0BLuDzHI2QmSBNutCFVmjBiGEXfgO6bYYVWn9_zLaI
Message-ID: <CAMRc=Mej3sBp-Mcgc4XQrMQ4Q2ABLTnnku88Rp=DH=u7dtY9zw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add bwmon node for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pushpendra Singh <pussin@qti.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 10:04:16 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Pushpendra Singh <pussin@qti.qualcomm.com>
>
> Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
> frequency scaling.
>
> The compatible is added in nord-embedded.dtsi rather than nord.dtsi,
> because Embedded variant specific 'interconnects' is required by
> the compatible.
>
> Co-developed-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Signed-off-by: Pushpendra Singh <pussin@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
