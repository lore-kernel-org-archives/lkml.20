Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3D38A70C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760429; cv=pass; b=DVDHrEtFnt15Yt2kD+PxrUcbdKEbOS4PnARkSok92jv4780kxroLTetTjYUh85HYM9QzubBVzpm3sD2SOQDhDZAVV1XFOOSQq/wXWxuAYNgElzfqn0SFsIGtnIxPZIWHsJtvhRCDbzKfW9fuj9lRMmbMerWdMCOzvGOZnnseFnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760429; c=relaxed/simple;
	bh=aFuIk6AbhdcNiE1bV56o6X7K9fMz1Hx6enV/8s/aroE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXvQFM7G4xRFJq7BZrUCUFYiEV6ZH8s82eZ2nJ1vU4Yyo+aayksz+F4Na0Im5YsxaZlzoJQ1F2iPgSZAt5X/fzRue78aRdGS07U7MRJChrDTSPWzb8gTWSXurYUHGShS2lMCtttIC+dbCa/4aiQaw64WRgcxQ0qLwaVWzDOagZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAyksSd5; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAyksSd5"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66ce4a63e17so1438773d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787760426; cv=none;
        d=google.com; s=arc-20260327;
        b=lkW3TJQjw++N0nOOoDOd1lphyLcFIaojA2bXW5gcIhB3fmLlFXKfDPFoV97tCYYTTb
         JaDLmVVXVqDA8KnuevJdOh9dlUMC/74d0+tJ2IiKwqfyAH9oYZXedWd7LdJa7L5GZ/cI
         dhEuMCOo6n/VysoCTZlo26m9ulKHs5oIWgLhatD9vFp1iUaMDvYMOCS/kgJlmrn6zzCB
         flxcIosTbquEGukMQWuGKyyh5P6azRY7TfqeHDxQm3iY54lzPFmIA8BSFSfFm++GVFSD
         Zvkvb+WzBc7EluzeBS+LhSczrOsDGriQ4buk3JHRW95QoYF4IwZNNEXfwBPzpowRQH5c
         QABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZlZQ8Rhh1qyGK3bhrJ6S37zPY0GD0Zfh5+8vycnKN4=;
        fh=qd5Gk9Er1RNRs7NeGXStoRSfv74PuaOuR8WlE9kch4c=;
        b=Vf531HWmXnur6l1QJ/H9eeKDW6O0FPc5q4j3tu7juf5Sn+Uu/xYiKKF11R1a0n9rI2
         afAwn2NlS9WBnE3LZBCf/SJw4LwarJyVMjNYKgtCybmRGkYfL2JVplfQN8PpMUZaQt6b
         nN+9yZHpt6VLzM7Tu+hsNdrsarKadvKBih4VAqZeiX42beKQMrB5t7gnhG98T0emWZ1A
         8VowBFDBvdsT+BRfwT61l/g7ukoeMKld+uhmTEnOxNxYN/nKpxj5kres3hqesmaDSCfr
         5E/6xQd4bLxa4ftvGotN9KvnDn6PQnhhjV4DmqnzLPHuWjzhjB4CGSoWt8Xn8Mm02nft
         F78g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760426; x=1788365226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZlZQ8Rhh1qyGK3bhrJ6S37zPY0GD0Zfh5+8vycnKN4=;
        b=ZAyksSd5/Dm7wmw2SqPibtg79xKHT9liPdYXA2k50TFiw+nnuXd/lKkFvtdANK0909
         FJvA2gFPQEIjsOANZN+yjVwQJyvtEWjVy6WMkSjg2Ubp/Ekl6LouEXhnOU2RHNXfBxDY
         0ErbnX/z095WYMmHOAbxsQ5DwNTVad3zkNJT0v8C1PfmrXbKvjg5t98zgy4i20beBA7P
         s8gBsnn7oUUACZUsKHiHYi76VcaRgh+M9StIZcoLsRyOUWtAKLv9bLRqkyN3nVyaq2Mv
         B6v+WiP1bG5CMduItYtUD+7crr8Wy1lQAmw0vaDvjq7XmC0a5BG3kikhvjBL6GGD4HIS
         wXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760426; x=1788365226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZlZQ8Rhh1qyGK3bhrJ6S37zPY0GD0Zfh5+8vycnKN4=;
        b=h54x90pLACCZBtxXM7EXEB6tzJbom3Yxyfis+zlxBgg7rA/t/sP4K1ESHP7I6Cyf3b
         p4ResNKLHGKUumMQ9lwaqw3+/DzEf6QJEQ5gWkV9FCIQEq/C+5NWb2RmR7yznlBo0uaX
         8X+JLO5LuuCrshT7/aCCAvk++e47BKUVjJRjh55tlQN7sJ7/BHDD/cl9AieMD2oa9iUl
         qLXxCP3NzKfANaGr+5u41Kh3p/7s5IgrvbKwP16m2+yc8TSF/NPjGs2Re7DC+zDLSv1N
         yW/UYFyNaCnAapow1JJNXzo2elx0AxPOBt+tjXEdZzEiIrmZTOU/n8ESaoNwJ7BMb+Vd
         q24g==
X-Forwarded-Encrypted: i=1; AHgh+RpZeKdbx9r1ccrs5NCwDdlJgoWqpgpAPUTOv7c8hSARq7LU6OvawfyEZ9GJJT1b6fWi6jeNQFtlEWNiQJU=@vger.kernel.org
X-Gm-Message-State: AFuF++nTS10tJlf9reWvNO9E+coDmk7BYhvJ/g3ExDQrp+RJT6vcfMq/
	QLxqvwdUXyUI2cjoD0rCvHQJrX6Q2vMVS7e5inKh4+LboK4FPX9qqBYgtAhndQ6PusNfoIPPu8u
	UcqrvibnB9xWVMGtugzeFQVgC+JvblFo=
X-Gm-Gg: AR+sD13fa/mdNMoWgP5X8jGo7ZBXBVo0rb683N3/c6LxHnkDqGh/t3gNvtfcDqyY5j5
	dbe+DHGWSp7H0yBoaj7yXFfkRBu64fMkl+u1hZtg54NRjJT9nFVDy15trCYFOPJG8PV1JlumnYO
	sBx3MLsIizHFxKxXcPdE4+KR3RjHKjNT7fUB8UQ3tOlLfEabi6Bl1VP8VvXlf7BfbO3czR8hrfl
	Oh6u5vUDzJoVmgz/TlE5/oNHQBzzkIr6LG+pKlmvuGfkU3hoDvrQrtNkdMWNgO9zX6aT5a6m3O6
	hueBAtGf3kcb9JGXRF3097m0CguxNNHa0PF8ciGHupoDtVWYSIbSCu1TiYW3KafdKnRc2NtlSRg
	SOHcgbjatHxxCHFo8NFPwae24JlOqWg==
X-Received: by 2002:a05:690e:d53:b0:66d:2469:2518 with SMTP id
 956f58d0204a3-66d256eece7mr2798681d50.13.1787760426443; Wed, 26 Aug 2026
 09:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com> <a518f6c8-7880-4854-8dc3-ac90f0eb93c3@oss.qualcomm.com>
In-Reply-To: <a518f6c8-7880-4854-8dc3-ac90f0eb93c3@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 26 Aug 2026 11:06:52 -0500
X-Gm-Features: AcwNN1XibUJOXyNOa2k-QB-afByCcBkGNudzVWR4SXKPlPfS0zWVsrdForCs6cY
Message-ID: <CALHNRZ8rqcDYcBJY0+Y_ioJroWsns_BFggMpuwZy9tiPavvBaA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 5:26=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Retroid Pocket Nova is a high-performance Android-based handheld
> > gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> > featuring a 4.5-inch 4:3 AMOLED touchscreen.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> >  .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 118 +++++++++++++=
++++++++
> >  2 files changed, 119 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
> > index 09b3c5b2d9dab..582805e89f4cb 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_QCOM)   +=3D qcs8550-aim300-aiot.=
dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-ayntec-odin2mini.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-ayntec-odin2portal.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-ayntec-thor.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-retroidpocket-nova.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-retroidpocket-rp6.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-rb5gen2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs9100-ride.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/=
arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> > new file mode 100644
> > index 0000000000000..2422be63f0f13
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> > @@ -0,0 +1,118 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include "qcs8550-ayntec-common.dtsi"
> > +
> > +&{/} {
> > +     model =3D "Retroid Pocket Nova";
> > +     compatible =3D "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550=
";
>
> Do these actually have any common lineage with the AYNTEC devices, the
> common DT for which you include above?

Please see the cover letter to this series.

Aaron
