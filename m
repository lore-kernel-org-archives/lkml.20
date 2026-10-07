Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C694A7C80
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377684; cv=none; b=Hcl2iWsVeupGXV7BTrPGBcdZvW5GjrHVVJvIgt5GAI3eMcD7EL1pq/84zT9KRIC2c4kKiVg0DaTR8M+p+xTy3dBVzEvlktL8+tlTfJinaoR9yQkvLxFaJS7UXbq4dpCk0/EiCgHq5fyIG4lRwDxAlQoMJUpKkuZ1LsW5FFr7TD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377684; c=relaxed/simple;
	bh=dXlEoLZn8xIfnNC7jxrPUVl7m9FtX0nbVYNpExtd+WE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thfEm6FGO/WRO18/hea7eBpaFO/8feA680fztbUAJwHgLmvdk4JoRUYkfn5G3aWYfNG8djKX724qDoX+T0nXM2mql/0l6wH1/smtTNvRKNPZXLqeTqnncAPOLW7h8JYJCg0oxf8/lgsQb84YHUP8kQDolDW7WwLbSzuWhdkvRQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VHnPLwpy; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VHnPLwpy"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a98fc80925so13124961fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791377669; x=1791982469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+rvRY3MxyDDJlHyGuP46Q73CKubNnzJd6vSmt+6L74=;
        b=VHnPLwpyK4+g0fPQEELGlQkHgobyUEjFVcnpMd6FUn2Ksr8IQ9SxnbxQa6NNLSiAjb
         v5S1p+gPoXfw5SsjfC6eCvJ5RORK97KdQcF35JtNlin48I7sCGUqfJn68VUoEaN1tGEv
         PTPL5WZaSYp85fo2kr8X+FAjG8nrN9UaeG+Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377669; x=1791982469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+rvRY3MxyDDJlHyGuP46Q73CKubNnzJd6vSmt+6L74=;
        b=Wtc8H1hvnxInXX1Xhgse05ztuYYKdRpo7XuFd1kKpAOV7xAVTTEELq47e7xQJYAImD
         2sgkXyzP0t/F6zVUYRjtQkLH+BTDjxO+35W9N0F5f4m6UC4923bNdbBovMgtlSuZ5xkE
         hlpbT6USY8rVEP0NDXy5yXPnVItjA5rz0oiIYkSZ2PinyU3v9w9w1UmyWp2I5D1iw7kq
         btxLwP6VCYfv37umQzAUfwJAvMB0aWZgL0K1GXhYoLCr5B1+t2EXRBrDIDi0KkUrpVG6
         9nX0RfEW4I1T0I08tyEhRx1mKZT0tKExSHCSSB4KtfRXIDZmd3Whb7bxMC/P1ljTiy6Z
         HFDg==
X-Forwarded-Encrypted: i=1; AKwUvByVNfnVGTLj9N+YukD5fY9Q4hDRJ1M+nJ8fHbJg0PDA4DOhEXos9wDpLvhwnBN89J7yBiQja5zWrZHY0vA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrUrE6/rvyY3/tewc7sFi8VfsYjPOAC+6jupukwOTCcaZTBEoG
	ab2Er0KeMzZX38iO7/DUcLrDx9t8HtoycIw0FlQ4r+7hEbHbpI3pTUKUveALYQUHjBEsDTgtbtv
	2u2KHow==
X-Gm-Gg: AYBFou0+jz3yq4Ppxtg6dSX0CBG9HcOgX3Q2wEUdHe/0p3SSy7nXrcL/Y3JiZ6WSXYh
	JVAnuIdWUfBvJtPaFZ9c01OnBcv63rj1Iz5PCvx105sgfAz9tQX36yOA+nb6g03CBKP9aoJ0kC1
	4QKBawknibQ1cYLGDPVBmj200wn9bBrhm5dhI1Db+e4ZCi7Q3eAURzRTRKfwi1tBDsPiNJcGHc0
	azpitWbdA06z6azhlh0AUqL1s+CV4DC3I8PTmovVW0uXC6YHr/lMhggE5McBSknHT1HQnbIG9g9
	jwvIAFcAW6rbFVS9232uu0Ilr/r41+FuAOlHQwpE/fwUZ5EJg8rVPOWPKU3HEajM6sRtQ7/Z/m6
	Ko8JHBf5tbkvz2NTDQI+06gyRw07W11IcDNyPovRWX015PctowuWeZrNuSQy8AMwH1JYY9qNwGj
	IzCeVsQIgrLiIT56eOa5q9IXnMZomOGEEfHrqhp8xXYFO22lKq7qsl0pOpQZ/RGBWIfjtTG4Sl8
	6uihzZVoq830kOm43HfcqhW6MIAhuFlXTxTWRTm33vtipb5
X-Received: by 2002:a05:651c:19a5:b0:3a8:bd3d:546d with SMTP id 38308e7fff4ca-3a9a2cb9980mr5212461fa.5.1791377668817;
        Wed, 07 Oct 2026 05:54:28 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a2054367sm5826841fa.35.2026.10.07.05.54.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:54:28 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcbd8df6fdso1198354e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2+rFHRtcEjVdTQgCV+QF+tAYkEA85qFvfoL1nztDdEpzd6Fjbb8DQ9N2hr6PH6mfPO4fbNT76CmShi+4=@vger.kernel.org
X-Received: by 2002:a05:6512:b83:b0:5bc:a9f9:b649 with SMTP id
 2adb3069b0e04-5bcd06e8b11mr798936e87.31.1791377665307; Wed, 07 Oct 2026
 05:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com> <20261006-mahua-surface-laptop-v1-4-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-4-406fc042162a@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Oct 2026 05:54:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vh-GRYtuGM+By9BfpO4X7skp9QOYeHRj7Rzc_tgQ0KEA@mail.gmail.com>
X-Gm-Features: AclHuK-ILqIUiSWOn4shaOpkE4nC07lDEACeQZtcv49rxdfgv5oCmNXTTOAhHtk
Message-ID: <CAD=FV=Vh-GRYtuGM+By9BfpO4X7skp9QOYeHRj7Rzc_tgQ0KEA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop
 8th Ed.)
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 6, 2026 at 2:50=E2=80=AFAM Gopikrishna Garmidi
<gopikrishna.garmidi@oss.qualcomm.com> wrote:
>
> The internal eDP panel of the Microsoft Surface Laptop 13.8" 8th Edition
> is not in edp_panels[], so panel-edp falls back to conservative timings.
>
> EDID, read over the panel's DP AUX DDC bus:
>
>   00 ff ff ff ff ff ff 00 4d 10 72 15 a1 31 05 54
>   31 23 01 04 b5 1d 13 78 03 7d 77 ad 50 46 ad 26
>   0f 50 53 00 00 00 01 01 01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 60 b6 00 a0 90 00 2b 60 30 20
>   3a 00 23 c2 10 00 00 18 60 b6 00 a0 90 00 56 66
>   30 20 3a 00 23 c2 10 00 00 18 00 00 00 fd 00 18
>   78 be be 2f 01 00 00 00 00 00 00 00 00 00 00 fc
>   00 4c 51 31 33 38 50 31 4a 58 36 31 0a 20 01 4e
>
>   02 03 0f 00 e3 05 80 00 e6 06 05 01 73 6a 0b 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 aa
>
>   Manufacturer: SHP
>   Model: 0x1572
>   Made in: week 49 of 2025
>   Display Product Name: 'LQ138P1JX61'
>   DTD 1: 2304x1536 120.000329 Hz 3:2 (291 mm x 194 mm)
>   DTD 2: 2304x1536  60.000164 Hz 3:2 (291 mm x 194 mm)
>
> No datasheet is available, so use delay_200_500_e200: it keeps the
> 200 ms enable delay of the conservative fallback, but uses the 500 ms
> unprepare delay of the real panels in the table. This matches the entry
> for the closely related Sharp LQ120P1JX51 (SHP 0x15a7).
>
> Assisted-by: LLM
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop 8th Ed.)
      commit: 7cf88d0a3f5324eb44c2ae9840568adb2374ec10
