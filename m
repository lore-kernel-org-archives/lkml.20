Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23A54A5ED6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344771; cv=none; b=qCuljpfR5Gbhrt/wSjQboAvYeJT5tDpoTyJLwmj5DnkydfQp858+D2y9cfXEskP6cfxvVoeuj6H82y7Z+PgK4XeZK+RXAc/tCONGmJDyHyKuo0uGLTcBWokOwBBPuU3qT/Gk9rf1Bl7M+hzZY6EzQHvwGf4gLQkwmnPdtK5Mo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344771; c=relaxed/simple;
	bh=GPWZRmhcG4L6sCneQLtwuZopOUOlyZbjcJe1r//BOTM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8tUExhyNBeEYCfJkC00rASn7kn0GHKFeshfHUUZB69oCJoJdgEuDO4CrMPUDJiV+/jBsdM0M8c2+QQxd2w+QhiSzcNEYmAWB3oY9rrEWM7FYMwKYrLz+ukDL+B35g4LJVOeolSiNiLFrtyk96/xuthjaBf1ajpTstZO9QKr/sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfz7WzBJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfz7WzBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481BB1F0089D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344768;
	bh=GPWZRmhcG4L6sCneQLtwuZopOUOlyZbjcJe1r//BOTM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gfz7WzBJBYZFYwRLVg9m4e2E3Nc46fPW/m0Vfas57bUwV+/M48PntiSybri0K5itW
	 TKbPK6jH6ZGtjWJQ2ZmgXrrTYuWBDSSq/pnuPLAo8GnszMcJxqjVxlcVG0nxGZ3Fe5
	 76lZfKqPLTeZ37uVazZ8vRTPvluBEQoD99TgBtIZEQHMtwacPjdPZgz8ydzhpWonrq
	 c+AnqlOhkOznB2zkn5tHSsf/wpG1Uzi7UsHJUr17tM53Z3hMqOpT9pIV2fWpbIw+r7
	 SGRTi4FlBG2Ay8MGZf8pzhOjXlcya0B6wlflZyR3ndLvkMmk+41oGmQtEzsS8qjViK
	 ckSb1COlXJrIw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1021255e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+OxFZeSC/zAXh01bD+cRfcT08F/ksSHG+cTO3S/wPsZXs3Zm2cl4XNgenIADcl4jgPiK3DPz2TyVJAtY=@vger.kernel.org
X-Gm-Message-State: AFuF++nmuIK9TLRdXbZnyO8dzMQrGpTdORERnKZuj/ayyGKV0P26UhnE
	44vXv/fDlj7KgC6dYIkwO7SSEc8cNvLLTwDXYnVGDdRJcXFlq9HnK4/cdj1wL+jKPPdt5l7rAmd
	NFbkrav6EqutoMKXgdTX8oXhZz6Zc2px7YMYIwSh44g==
X-Received: by 2002:ac2:4c52:0:b0:5b8:c21e:28e8 with SMTP id
 2adb3069b0e04-5b8e6e2f6dfmr755919e87.19.1790344767005; Fri, 25 Sep 2026
 06:59:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 13:59:25 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 13:59:25 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com> <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:59:25 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mc9ked7RREYxs6WmvwLwGJ2VR0P7gmPZje7UdjmDdnfvQ@mail.gmail.com>
X-Gm-Features: AclHuK9fS4K0zcCgetZTHU9RDo05M52hg3_eHwVe9TjKtru5OxLuiE6W4yOuOVE
Message-ID: <CAMRc=Mc9ked7RREYxs6WmvwLwGJ2VR0P7gmPZje7UdjmDdnfvQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 Nord compatible
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Sep 2026 02:04:17 +0200, Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> said:
> Add the qcom,nord-dwmac-sgmii-phy compatible to the Qualcomm DWMAC
> SGMII PHY binding.
>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
