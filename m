Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167D23E00A9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177648; cv=pass; b=aRNAViAQIo2hj77sFXWW65sKCtztsDPO4Ii7ItIuSBmQWWaNDFQDr6MBm6L73eEHglPHmqxHq65blK471bWdVeG/CV468JrSyG6kFAr7mDQCBUpTt57lxViJ5ZTkq2O//1dsX0z/k+5At6pyOohJXNeThBobWXj+I/CjsOO9njE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177648; c=relaxed/simple;
	bh=59shnk5YdABVH7EU9lOkruHnUV5zrqz/LbWh9Ypnyqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSYKnzUlNFY4dzvuDdI4+viawf11XBO/CEnkpyAdglI3mZLgwIln5hJaf/E9Az5ceypALANjanD90qGTSkKaS/OWwBztDP/BRRlMlIcCG1/JsKbFNTSi1MG4c1RxCn/L7oTrBqGjmVAaRAg3x9zPn8XN2GPk+4ZFH06VPfm9Dzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBxlZsW/; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBxlZsW/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so3124502a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788177646; cv=none;
        d=google.com; s=arc-20260327;
        b=CQG/l99UGlDFXjP6E9yMDCYBtmSW2nrEOo3GqESuRdJZym+M8U7xUz6rcSufRsORF4
         T9FBNFnCkWkkVpXZY/YMKeyL0PeHb//w3feiMbddn686kh6ycxJ0fRt5tTb4laItSCsO
         h74j+dDIYRSb1ralTM/6UiavO5CsBo+bVFuDkZcdUJiUQNr3bvH5SUKrbbWmO7nAIXPa
         I4xzNO5EXh2DkzSpHaNI9hJNgL/ObrLRO7Su/GQS12gwV/4Q/W34yhr4u093P+YL2rM7
         hO9KMnx7nIX5Jm0m/TvlyH6sHWlL0NKP0Q60KtBpwLAXsUlO9+9Kv4H/91r9lSwVVIkI
         9trg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZEdPHPT/tITKhrVTG+XJ0o1wyuPtLccyUlcKppXSZJ8=;
        fh=K9inHFPwJneXWyKC5miqGycrGng+XXO+20JspgpXXPs=;
        b=Kc0JgqUIwdYaP1IYsRkHv2i/ByqnQEHMAKjZYt+kCqd/urwNtFKO0P4CQr/zqIiRja
         fIUzRh2Ktqu9Rf6ZNHABX5gAvtsww1Nf4D5mlriA6Qz3USh0boDlhw7RuaiBa2KnMrsR
         9p7QEn3uGM/HB8l4c0LYhslZbg2r9bfYyJ/8E2xPD83nfRaz/OjMW+w6ABs1hBxgqg7Y
         eoHq1Rj58plfPnMDV29lLHclJKAIa5YaWMK+WaImHvlcYqH50L4sfVTURLwAI5NViPF0
         CLIiESJr0/TrgNBd5xn1es5RaQEVV3f7ZgzDI1OTUq/3SlU3mNF0FN0OJYBdvjp+QNei
         Os5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788177646; x=1788782446; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEdPHPT/tITKhrVTG+XJ0o1wyuPtLccyUlcKppXSZJ8=;
        b=lBxlZsW/pua3ZKWe3TJwtxVW/UCXGciH8vbGkOkDS/FAbkKBCA+/O3p9Nc/+js1kML
         8yc9b3jAWk/088oDJB56b5tnXVumODO/4xDY8iS2//cBH5LBuCZ4Trloz5vY4CPnHzkc
         9WX6NEdDiclktz2fJNCRYtVvJZUVXUAqOmggZ8OeM1ZADOixmBH54bZPMr8z3dphHZut
         EfPEm3VHyGnvhRIZm3iMHhXMfN9iXvy9WgamGr2v/w0yUKWSJlzfqy6ZOg61AQWtVjx2
         Fym1t9T+ZNbycJmn/xMr83p3PXp0Vuk2Jb6z8ZswtREbklS3RFrZx0k4bWWDCku/lsY1
         HLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177646; x=1788782446;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZEdPHPT/tITKhrVTG+XJ0o1wyuPtLccyUlcKppXSZJ8=;
        b=hGz6NMEuvchxgPk/miX3UZu9mi+O7x0IUdi5pbLidRJwSIyrHvastR0tg4zgTxZNhX
         cwrdMuSMqsGt/AfNoQEfGHpzBiu/xYQof9fu1oHhQDMb28x4k9NjljUZXGePueGddp9f
         q7E1kko7sbOP3S/GdTIqIQX8HskoaQKyEDFdPRW0qfudGBCuhPj+0hks0YtzhysCz1Wx
         CzRFUk3EXVonu1Qo26e1K+FLGkF4QuoWar1potM8pFA2sDSD5sJVASYopH/fyZOCXRab
         o4upoYOn8Kvdhi/xqfMsPOKY39QYZmawGksNtPY+LajPphdqV5SCgI/21rKM9Ad7QJJL
         lBCg==
X-Forwarded-Encrypted: i=1; AHgh+RqtbCngyBDycVrqTVS4HC/0YP//xtvIqKTLCFiekLzELKdHTWB1/++8FQdk75h73fMBvPhIojVSG8YDoHw=@vger.kernel.org
X-Gm-Message-State: AFuF++kG1ok6far0lRZhjCXjsoQN0roMeCVEHQ34pwsKSSoXsNR113Xt
	Y9BTln9xSU/yAhKwmtfoEmuzfTXW2NoFJlKol0A7g1kyJqPtS7ReiBgysa/RfCiq4TRbJtFhUjf
	6w4cr4SXnJbQcvfc9QqtH7r5ecv4onw==
X-Gm-Gg: AR+sD12vg7oZle5E7rFJvuT/cFKB8Ki/+/PhLiJju8b0bj1zobXBfKGeNPUWmXgosx9
	Lc7iok+yU7kae3IvfEU8MZ+NTM/o6JAVjyMpYMKcxs2lVNY4YXReJooHzbJmuEZIrM0AKkioZXN
	RstXSQCsrUmF4aL74dYITXD3i4StcrtxrLr6qFBEPeEVOGXNQw80NyhQ36i+Q1Y9eiB7M6SacW+
	A1tOonHrRZEnU2/BfMIN5lGvbvlR58YeqFaXgfLO70gvESG+sIJUksEv4WBd+XVnPUgCudOkqY8
	McLTvdSIUTsKCP7Lsw1bsBX7HvaTpXNMTMFOFqoKDQ==
X-Received: by 2002:a05:6a20:748b:b0:3d1:3c2:85b6 with SMTP id
 adf61e73a8af0-3d266570c5dmr35694751637.5.1788177646257; Mon, 31 Aug 2026
 05:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
 <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-4-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-4-5b202de8c74f@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 31 Aug 2026 14:00:35 +0200
X-Gm-Features: AcwNN1U55-Spe1BCyB8yOmgMhN2oooSN-83xVQjBn7AtVurkhafkoP6j4ImL0r4
Message-ID: <CAMcHhXqCFzMy=VX+Pm+T21DuJ==-28wBwSJxKzCi1NMJhBKqfg@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the
 EC reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
	Konstantin Shabanov <mail@etehtsea.me>, Srinivas Kandagatla <srini@kernel.org>, 
	Georg Gottleuber <ggo@tuxedocomputers.com>, Ettore Chimenti <ettore.chimenti@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 12:05, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> Reserve it to prevent Linux from requesting or reconfiguring it.
>
> Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Hi Abel,

For XPS 9345 this change is already included in my series for EC driver:
https://lore.kernel.org/all/20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com/

To avoid conflict, could you drop the XPS 9345 from your series? I'm hoping my
change will land shortly, its already reviewed.

Thanks,
Alex

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index 2be5a37c00cc..b795b65d604e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -1072,6 +1072,7 @@ &smb2360_1_eusb2_repeater {
>  &tlmm {
>         gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
>                                <76 4>,  /* SPI19 (TZ Protected) */
> +                              <65 1>, /* EC reset */
>                                <238 1>; /* UFS Reset */
>
>         cam_indicator_en: cam-indicator-en-state {
>
> --
> 2.54.0
>
