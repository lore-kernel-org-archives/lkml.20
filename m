Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD10466B63
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399261; cv=none; b=sMw2od7oxYp+ICtkr0ca8zINagJm1ZaTCpjyph1sG1xocxcwkEzLepBeAICjtx+wcV1Xs4Y5X/NvIRoNiAKcE4sYLClXwTEZEI/mbHpvSkWE7hW6KTJmURDSG2T6pNiiLz5g/GHDzLwdmZRJDyxe3+hI4bvr46LexG/hz4VcR/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399261; c=relaxed/simple;
	bh=fFA7B1Zzm+M6TOI4RFrwiV6L7EFm/dOdjC0+vMkdzrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWqFN3LSJzjBPR0lXKEYpRoTRWSQDEjwE84mmVcAQAblKvjNk4Z3tc+HpieKSBK4zPric5uYMf1RF+MgAx2EUwbnQ5nNvwVDBaujrTzwIr/+IOu4qF3EWsfgbMoazp4T87lPa7G/8olAHsGCKkj9XDbVWYjrfWFG/iTRYlpMVxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RbY7EThD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RbY7EThD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so2186803e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789399257; x=1790004057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFA7B1Zzm+M6TOI4RFrwiV6L7EFm/dOdjC0+vMkdzrE=;
        b=RbY7EThDNPuqBEXKz7ggC2orlxSBL/STxefsxB5qB94nNixysUW1qpJ2cKUrP7KUN9
         JArqI0qJ/xDa8L6K0RGBm7r0+UsPCkAEwVvorZhinzsYnJSsPAiGxg5gsWRUUcsCWCnP
         4lh/7Ce8u3m7soRniwm04+UQprZPj8T7/CNbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399257; x=1790004057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFA7B1Zzm+M6TOI4RFrwiV6L7EFm/dOdjC0+vMkdzrE=;
        b=rtQpLUnoWtkRMx4T/Ft5BNraTwANtfJysAkgSXKxCMunkwX3vsLbR/PvuflptsffYU
         jtbCl0SqBGbuZTbJ3i/6HLv6mPA0pvnMVlYjV6DFYhyh/0N3MXIvxckiW0k1ifU9c798
         XpvRfNSlcuEgrNZgS84NL4xPbxuLgQ0GXbKP050dDSAXotGWcPBhf/A2IBKC0IEnEVdq
         gEUsz91kPHrrhb0NZ1zyJkQFEIxb6r1HNA1DkRwdIXK/+sloez6OHDmon2BZ3KpmuZwZ
         zlBe0I5PhUV1Cusuo7mEBJqUPuRKQIO1BgAuUvjxX79yvYwQAWbRgOecVQnD+8bCaU4k
         J10A==
X-Forwarded-Encrypted: i=1; AKwUvBwo4q9lFLBuwknMFxiacERjP2UNwn6x5G9g8tHFQEfTmepAK937C3zzBXnxzrBTcYRKwU1RD/y6T/3f0+A=@vger.kernel.org
X-Gm-Message-State: AFuF++nx+W9tLGtB0o4sR3eApSoDgQn+HhohiqvG518MCidX1JQWGneR
	Blw/5WDeaXKkOzZ9arZddMLjrZDJD8nHyoJnyH5OUcDXf9s1QCoYogEF8U8z4LBn2MjFXmWxi7K
	iHxzyFw==
X-Gm-Gg: AYBFou2dYfaF0cJny5gFghwbgnsYBewyz22ouXkT5PFgxw/eb5L8eJaxwK+YLaSKSSN
	35m0VRpylqi7wyEIRQJGNOzkhBq5pWJWznKOKp8JW3TNlvDgw4UlOu9GypeK0Gi85bk+V00HxgM
	8Zk66YoqPidMFOX6nDC0BmFGqhYiX2WzqjtHVVH6wqmujdngGxCl1cgiSY0M0J/Ml77/BL3WeXZ
	CZiPKgt1Xwqu7hL2o75+2eqTntd5X3wSQyBlJAnrZehKWmCnYSk/9PR5tCp78EZPUSz/LMU36sw
	zfXIPf6Sh+MphfWPPZ/ShdA4QM1ti3dSpTzfFiF8/BbXYeG+/N3D/kLXNpkJ7rwnmHSt8A+vm02
	tCYrCyqF/Uy70jc4VyCUiVihvEwMONnnPJBnmV2HZYj/gSZmSvn8XB2mxtDXvdmzPTQDasP14i/
	XdTp8MTFh7fypOTxzhAHJ8gFkfzbOpaixLFfs7DmEJJYw6L6HvnQRxzQLlwVv0CHJUdMh1xOmuf
	kg6WbaHeKxDpXQP7hVezPsQWVUP0EpD+D4azns=
X-Received: by 2002:a05:6512:2381:b0:5b8:99c2:84cc with SMTP id 2adb3069b0e04-5b8abb226cemr1311244e87.41.1789399256865;
        Mon, 14 Sep 2026 08:20:56 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04643f5sm2547428e87.43.2026.09.14.08.20.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:20:56 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso3046037e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:20:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzp8efrjLfwxTwIg262RuCtGDyqVlXMXiHMhtLOYCl5sYmWmAMIzEY0njSNbEdYhE4Fw/ZOfEqg0PlrTLc=@vger.kernel.org
X-Received: by 2002:a05:6000:1acb:b0:484:3147:49c9 with SMTP id
 ffacd0b85a97d-487028be8c5mr4006418f8f.2.1789398811422; Mon, 14 Sep 2026
 08:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com> <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
In-Reply-To: <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2026 08:13:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
X-Gm-Features: AcwNN1XNTZvJpFGb6MbsUkQxxgT0-VHyrG0ryskn4Oe6UeBRJylCSlvDiAONe_A
Message-ID: <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/panel-edp: add CSOT MNE007QB1-1 entry
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mpearson-lenovo@squebb.ca, sibi.sankar@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 14, 2026 at 12:34=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.=
com> wrote:
>
> On 26-09-13 21:18:33, Srinivas Kandagatla wrote:
> > 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> > Panel identifies as CSW 0x1465 over eDP AUX; uses conservative
> > delay_200_500_e50 preset in line with sibling MNE007QB/QS panels.
> >
> > Assisted-by: Claude:claude-opus-4-7
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.co=
m>
>
> I think Doug starting asking for EDID dump in the commit message.

Yup, please send a v2 with the EDID in the commit message. See all
recent commits to this file for examples.

It also looks like you are adding the panel without having access to
the datasheet. That's an OK thing to do if you truly can't get access
to it, but I'll at least ask if you could get the datasheet to confirm
the timings...

-Doug
