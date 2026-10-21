Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575680;
	b=h8yzpftewpvDYWbWOmWcMkweOhc9auT8MKaRnMM4NOWo4ym4fE9dEOrTjYoOpWz25EWp
	 GspXquaosDbbNMekK+y2mDLg4lS/LXnTM4p7Gh28GhmD2B23606mgrTFh5HOlDvGp7wn/
	 wjptwvIUjqlxoD2Vv8FW8TbL3ICqgRExI6kY4iathld/tyWj1ijwnOD/ecrAbbb1pbm0b
	 7gJsxJLeaC7Le0WeQIQ0pGacLadnKFY+igY1tNr0VKmhZNLgNl+TUcc76eqUTRe+kb7jb
	 TqcYn2tcw0p5lRNlTpS+2ueZSCFtaMaXaCWmfRcEAviZi1sz2Sk8iD3DNV4ecR/HZrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575680;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=fyZC70zcs2JyMZN3/MJ99iH36eA3idZcChdR9W7M0ws=;
	b=rLo76w0sxCIHbw3Ltc3DH3vVlYJFppx2mBuh49VHpCq24Fh9IZBb3aOTZNJYtzyBJHSG
	 J1mrIpF/2db+fLX7cIG/8nges1FgU3TBKkiHbOCNUHDDFFUNwxZepbb2fvOIrR3zRSJen
	 bEnwYIZgpERdCB7HlKILZT9+LeJrl5WYbmbVFmzIqayBzzYyVYKkLV8fkramLd2MPyc5s
	 mteYPQTXw2hD8YRIIKn/73827lFRT6g8P4i96lLn7q7l7tdSZShJmRgL6zYxeDl2pG/XP
	 gLkZ2Uu+jrrIEziYUkzsuYLt7OjX9wE3JP/hTF2TNYKVQVF0WWHQBs+QuFqcCETQLBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U54cVHtg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB25606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U54cVHtg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01EC1F000C9
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575679;
	bh=fyZC70zcs2JyMZN3/MJ99iH36eA3idZcChdR9W7M0ws=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=U54cVHtgyaYCzaVg6lv6nnSrhp5kOAx1Sp3i4Xuu2rpNCaq4iSulQKlepPuT3LpHL
	 HtEHPuzqTixVtSC2VG3nrPnpOykscbOCeGErPz67XWoIuanXQBqgIX7UGZTB4J2VVG
	 qOiVaxyXC6QjSW1Jb0UaBRqBv8JJvIKAztju2mCujS9lL+aI9MhyuKRph8KKBeoLyP
	 EmTeFGCwR4y9PHOK8mjYVWY321DVOR/XVirs1V8usDxan04bQ7oH5c0F3TjOr0LFOL
	 yMqJgoMipMmi07Y7qJGN4cs00QHUnFzS+su2gBp/YMQ8xgtozRzpqpJB7kY9MFyE3J
	 2tE0IT1ke6koA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso3977401fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:41:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy25/o6jfJo+XP70jlCTF4AfumihzyLpqRnXxsnbv83wk1Xn6Hzlrditb0w23JiC94xiQqgKi8VZNG2Cgo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMuWNccSmiUEP2ieBMsL7mETnQ/zsZph3dEaXZiBquguigsgnF
	lmbK9o7QtMOS5Ne8YQ7JgLr6CYKHnZo3lBPo5q56y1koxuKtScY4LsU4GSybosLTB9BAYkvOlhE
	O3AE5c6h2/PZ3bZb+kqeex9pWRC7SW/PK8H7AourCeQ==
X-Received: by 2002:a05:6512:6c2:b0:5bc:e661:d673 with SMTP id
 2adb3069b0e04-5bfa1d00cb6mr598516e87.56.1792575678483; Wed, 21 Oct 2026
 02:41:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:41:16 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:41:16 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com> <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 05:41:16 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfth7nH3dkn7__N=o3P0zYvYYp8S58WjwX=zttoSPEusw@mail.gmail.com>
X-Gm-Features: AclHuK8Sh9-m53G1_uADJjezLlpATsHIz1MTBlYIHav2b9m-Yl5DadTNtdz_ykI
Message-ID: <CAMRc=Mfth7nH3dkn7__N=o3P0zYvYYp8S58WjwX=zttoSPEusw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 09:36:29 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
