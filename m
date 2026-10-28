Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175937;
	b=a2zuJe9I2jdg8vLTItVv11Osu/S5MgUqpWjZACngnDSJVM/rPQt101rbPBCLwkjFCGNu
	 kAeuOpz8qBoKylU8LJ5VZuWP1DkOJD7kwKTxdvFduNxh8VOUnR346mlYt1kLNYm/04v3u
	 JfT/jx210fT/sgJA8ouxLarRcxI3Mpx2EXLKaK20Aj7D5lGnSx2ZajdrNyrZgDmEed9j+
	 R4LmMuYJy9H5xYiLVQILyd2HdJ3BXXG/MNJ/ka0w9NYPo/yjeeC4hRZ5xzbqdu5cMlwUt
	 WXeUsmk+MLoPa8xkh1j2wK4gqLhXz6zjY2LcR6SgBlRJaQPh5YJDKHl+i/QDwsSdwuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175937;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=05l+8JW812QvmCS5ASRMEsto/MViEuxLP3EanVEdMuk=;
	b=dO0QnjRL644JG6sWdOkh/RN8SkXGGZJdYsNYvSDMhiMhvlrMY71rwBR+dnTm8QZ71Nqm
	 //t/ZEEfxIgALnAi6FBOK1lMfv8dYMGOBKsYRtoAnRt1pbVztPh2E7WDSEEnwKcr5JX/X
	 W9W3U4wARXWBL7A53ODLx1MtskQwtDeFHnoy+OhMi2x8wG4T+GR+H3QiDni9GYMA/xrte
	 sjh3L7x3EXKwOwhOrWu5LPYoI79Dl2JMPMkjQ3ZZN8eje6dZO1Cb2M590VRiXU05PxS8X
	 4BSAWZoCBwaOvIIfg8yR3/K8LFNXmI1t6A0UifOKVecMz5m2QpQxQ4jhyIQCHNDIoYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jh5UxeZ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D23606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jh5UxeZ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12ADD1F031E5
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793175937;
	bh=05l+8JW812QvmCS5ASRMEsto/MViEuxLP3EanVEdMuk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jh5UxeZ1SiyWyhZKrGsTkAzISKGPgJzuHiQjD/CYuFRgCLjIUR4rvYsQlagvkehTX
	 AoImjCrz/jrmRZWqqkwlkiTTmHGQcA13o66ATdXUXGMGVTNEfHbPfINtsYDQIreQv7
	 8Hg//W1tQYaDp+WuBPFrbVuUdiajFX0zCTQBAxXIdK5fWL36Sxc4vn51ZYmUEmUPRK
	 fdosq++7MQwEk6lAW4ydudWaxq6flnmDG9jGJNoEDLgqtAKlvcMb2ZfRpFNzUCMu/u
	 o5zPzTmtXIj+LwG9ANVDcNHYa7166zyzBo6CBh34bjNehhTv2d8OyDxO5ObEJmrUxp
	 19bkzFKFiwQvg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso6545011fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:25:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByba4/baiWo6mYxBA7tYI+5mI1vEfHIGnFegUBhWRAPDlyeQQtczlPtKb85LdK+QwJIMTzuYGA2+YRwnHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAvG2zckZXexZais36VhOOUtogUVW0Mpyk106gOZreIgImIfKH
	tqI1yqx8Tmfd47WDdN9cWtwmohW/nvUsGmjeVNi9Dd9YehM9WVJ/e4jJDrNmmy+6z6/STjjx7uv
	0jfVnLchrbV8RrNgjs24HY2yoPx8IsI4c8GgEd7L62g==
X-Received: by 2002:a05:651c:198e:b0:3a9:87c0:7737 with SMTP id
 38308e7fff4ca-3ac9cf81e73mr3153621fa.21.1793175935670; Wed, 28 Oct 2026
 01:25:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 01:25:34 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 01:25:34 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com> <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y>
Date: Wed, 28 Oct 2026 01:25:34 -0700
X-Gmail-Original-Message-ID: <CAMRc=McYTWmV6iAbm97C-xs1vh9Atvy-LivQBW10iHQh5+rPzQ@mail.gmail.com>
X-Gm-Features: AclHuK_avRcSyuEchrSyhnDYEBcfCksI2Ibe_hZLUqTV6ryNiIHPJk3TgyKxUG0
Message-ID: <CAMRc=McYTWmV6iAbm97C-xs1vh9Atvy-LivQBW10iHQh5+rPzQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 09:36:06 +0100, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Fri, Oct 23, 2026 at 11:02:23AM +0200, Bartosz Golaszewski wrote:
>> The embedded and gearvm variants of the ethernet MAC use different
>> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
>> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Do we run into any problem if lemans-gearvm.dtsi simply overwrites
> the compatible without this patch?
>

Technically no, but then lemans.dtsi is incorrect as the MAC compatible depends
on the firmware variant. I'd move it if you're already touching the files
anyway.

Bart
