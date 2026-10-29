Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268918;
	b=0yltV8ThQqd0NHYG2sPLUFeRztgHfCtOMXLL1Q+lbYqvqmE9TELLOa0DrHcSUUCAd6C/
	 93aXS1OCHn0D/VoAP1OKRn5BksguOF+xr0UdhzCAAgi7M6XH6Nrwcb04tjTtasNnomjTs
	 jk7oOvMao6B9C+RIWAdu5NALW0pjyyxfkEctP0qcvMQrk8m9ioWZdgzv7spbH9JnXB2+f
	 PY6TgsJ+kIyz0JaSWtnsR924Glq5DZo2Nike2BD4DosyjjCa28/Do0KTAIj+eawc4r+/h
	 OXGnzJ4IO1WqYmdIRXBjyOv+q3k9aLJHwxWmzbYSqOYR94bj8Y/BQJSMHDKzoYUs2gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hZhJRYKRYnpA55dTVl2RVAnPezaQl7o2LFp27rGTjlc=;
	b=zLRXu66zfRIjLhlPgldv18LmQWDQwfQ2ZV+nwNgwJ1Oc1ALRg7PqOAQzFZAdprOSYa4l
	 jXpuqLsK2zob/puYCRB1loVjT8gayRHm40iakwFGU/dt5sAKpm6IZQeBaJdbUzwXMvPgR
	 c+cbwr4SVpmdO9v3EoTd3RhYRpLH6g5T5YVLQF66pR7eayP3HESuWcKcFynZrras10797
	 AssQUmkkvMPI4hV7iJKL++klSe9sUC9WbAiOkA6x8V3V7iOLDhVwU7HLNvQlFMaHXUbZo
	 NS3Pp1Pq/6k9AcR2FOJkquHXopNXsiuPPZf8cixhiQo/amJCbyNsDufZdhjkwd+LWbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYaDw9Qa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B05606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B05606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYaDw9Qa
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2980257eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268917; cv=none;
        d=google.com; s=arc-20260327;
        b=NDSR+5LjE8MqdW6WD+aCKV8ZyRyWO3Zc1q3PRi1siix0l2hDAofjmWsosNikecL3Nw
         UqnHMiGySJyZUbygyFrKxo0oOOkB6ixWQQR/C1JCYeUfPuvYOHzI2VqfqicFsUBoAIqN
         Fdhuc9hFuw3v2psl3/rKgBu3JPSmW4uFRD+T7OukK5EMylC8hJh7KiSroZPEpFPMX1cy
         a5ZsE3ZrXE9iKtuGt2PgPzkvxWsm2SdVHq/gfBDpe8n0Jk/dpyr+5lnItZBuzAIMZpiF
         llt4RiJVagKZpHyJs/5ucEN9+k4HoMPPWDLDxfFbuf0Ter6DT4SNhXTci2QElY6dqINs
         t8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hZhJRYKRYnpA55dTVl2RVAnPezaQl7o2LFp27rGTjlc=;
        fh=UjEXpI9zSWXfADTrQAr6jAO1LwWI59DaySw0GRZ3Yho=;
        b=rtUVqWXz2AfbheDqMkmwv89o5XRSGkQlN4XLcdGfbpzEJgFa/y5+pjg8c0M4smMQ2D
         h+AUJXBtlljICxyby1QFI2SkG10FVB01fyXS0LaFEaoQ3kAlO5GzVJtXWZEj7OokQmuC
         VnhTxtDPr1wfHaQERDWq8K4TIr6Fetq7YThFJ5EEMkqxYYdg40FrJrzdwKdyxdfW7ie0
         lh3Em4bf9vPoF7oxvkFBo8Pvon6ElWYOx5B46qV2P/KlCSr8q3dhmlNKK1t/KkwIUCe4
         5ZKThmvvpdtwV+pF9a1p9rXoOBaxfrPnksb7sVqd3uveP6j7Qqu0DSKUU2dXypr8+wiO
         cocA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268917; x=1793873717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZhJRYKRYnpA55dTVl2RVAnPezaQl7o2LFp27rGTjlc=;
        b=yYaDw9QaXvy/ey4C72CgmAyNvMVNhiCEbTAs49OXnei/ZdR9HQ4ujPrhIh3QcHQSf7
         NDNxbOTB3YbR4C5RZkRF1VYNQP/S9u9CTY/EcbOtaFoOwTlwhStsSoAYDGToa1nmQtNO
         YzwjyQR+93YuejSkGmUY0kn2j9hcgkPiDJwI1AyQp59CWfrSnG03qEcX6cdeyJsEzFsw
         kCBMMLbhIyYKc0Cd6jkfxWdtQZ0o8y/ZdFG7wS24RfvUZMiGg+y1laVgz5IwvjdD1ZxB
         vlAGCgNtoUkDkkfWdDnkBwwJ8+30su/Nh5RoEMMkpkUI5HlQCyjPh5KDG/1XUj1VvTak
         iP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268917; x=1793873717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZhJRYKRYnpA55dTVl2RVAnPezaQl7o2LFp27rGTjlc=;
        b=tOaWjbjhNmRIZP9dpsxg/08rz+1YNU8SCC+T4BYbBX7+qAjhSP0dnXHw8MkEF/mgSH
         LhAOwIySUwkxWZ20ugXDWwXtHfma/U9AWrtLsiy7bWTpyRGCPuTFMZ3m/rPqcJx146rD
         RiGsWCQR0UUL+gCvNoN+XSYis2/xWYsnbLQr/Uiw+uT3mOfq+/rI6ZCgNViPiwcmgz8s
         Lc/WrAtPPXHN6Ikm5AwMkHQtLphkek7WH5w3dkxUd/nBOKhQaRo1SRSYPaVtfxVClIMY
         hUB/f8jFgqSIzRSRYf2IhHQUh4k528YLpFegQ7hkGHnKrBZjmuBthZwhSlxKsEsWuGIs
         da2w==
X-Forwarded-Encrypted: i=1; AKwUvByLg8W0CNK1YredhCWXs3BtuzSY0TAs4iL86c9Wm2yL6DoSz9TdYzmUAfYEz97HCvkNb8TQjH/H45qi+qY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1IjuGQ/109rhxj1giaexuy39VLlFe4OvFvZqX9bMf/UE5Z7mD
	ihIY2ln/zTlMlZHGqK0ashCj8LJP7A666mQicE+IGMHI5uzXXSu+u6+uoBd+X6tJ031x03DhPO0
	lU5wLYtYwBCInTzIHPQ+DwYYPsR8hnOA=
X-Gm-Gg: AYBFou1FeRPm2VPnEo9cFgCxJ6J3QDr5Z2OjG/6DjxdmobELwheNGsywBEzYBGNeJpn
	eKF9WOV3SVwY6HfKSC90kwfjQKkRaPaZ1MPSemA4BSTi51GvOcviM8eTgkPUkfmWUnDM4Jdrs/5
	we7OaKHch06zpmbeR09GrpBBRSXJQ+EOqpHTzlfgi7dY4hbF0DHtb/B5uw7TjoNN5sXaGZCHUFC
	gPY4aGffnrrVIVrPSkdYIzbqX+xbTvl5bTLuj5p027uYmhtPcDyJ7p9K6K6I8h5yxEB6CiJPw4c
	2UFFLYdOx1Wrjb7zZA52vwcY1J7FvbTO5USdKqbj3nRpWTLIaXFWHCyCzhPEZjmyOL++pleENkf
	e6ZTiw6hsBhyhMkd8WbhNZ42AA7YNV+eW5eWd0KbB0bEzCJa9WXvwpJUUyCrky5BGQ+T0vKI19Y
	YG1ZbytjQFIs9kR5U=
X-Received: by 2002:a05:693c:69c9:b0:36a:279:c93f with SMTP id
 5a478bee46e88-36a203e2a52mr6817742eec.33.1793268916731; Thu, 29 Oct 2026
 03:15:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-upstream-speedo-t114-v1-0-81457cc9d94c@tsv-stahl-riesa.de>
 <20261029-upstream-speedo-t114-v1-3-81457cc9d94c@tsv-stahl-riesa.de>
In-Reply-To: <20261029-upstream-speedo-t114-v1-3-81457cc9d94c@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 29 Oct 2026 12:15:04 +0200
X-Gm-Features: AclHuK_nKjJOvqTdHrlTm0y6eXLR-uFJwQRZTvfrnf6NnzkRQXlz5soPbSPOmYM
Message-ID: <CAPVz0n13YHVAGNoEYZaef7HL1HkQK9w+mLUV-h4AGC0mr3bkpQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: tegra: dfll: Get the voltage step of range-based regulators
To: admin@tsv-stahl-riesa.de
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 29 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
3 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> get_alignment_from_regulator() takes the voltage step from
> regulator_get_linear_step(), which returns desc->uV_step. Regulators
> described by linear ranges, such as the SMPS of the TI Palmas PMIC,
> leave uV_step at 0.
>
> With a step of 0, round_cvb_voltage() returns 0 for every OPP, which is
> then clamped to min_millivolts, so all CPU OPPs get the same voltage.
> The I2C LUT is broken as well: find_vdd_map_entry_exact() and
> find_vdd_map_entry_min() divide by the step, and on ARMv7 with hardware
> division the result is 0, so selector 0 matches every voltage. The LUT
> ends up with a single entry and the DFLL never changes vdd_cpu.
>
> This affects boards that run the DFLL in I2C mode with a Palmas SMPS as
> vdd_cpu. In mainline these are the Xiaomi Mi Pad (Tegra124, since v6.19)
> and the Asus Transformer Pad TF701T (Tegra114, DFLL enabled for v7.4).
> The AS3722 and MAX77621 used by the other DFLL boards report a linear
> step, and the PWM mode does not use the regulator.
>
> On a Tegra Note 7 (Tegra114, TPS65913) all 16 CPU OPPs are at 1000 mV
> and vdd_cpu stays at the 1.10 V left by the bootloader. The CPU runs at
> about 1.34 GHz whatever cpufreq requests. With this patch the OPPs range
> from 1000 mV to 1270 mV, the LUT holds the 1000 mV to 1270 mV selectors
> and the DFLL follows cpufreq up to 1708.5 MHz.
>
> If the regulator reports no linear step, use the smallest step between
> the voltages that are usable on the board. Fail the probe if there is
> none instead of running with a step of 0.
>
> Fixes: b3cf8d069505 ("clk: tegra: dfll: CVB calculation alignment with th=
e regulator")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 26 ++++++++++++++++++++++++=
++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/teg=
ra/clk-tegra124-dfll-fcpu.c
> index 457a77c5bb62..5bdea4775076 100644
> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> @@ -642,6 +642,7 @@ static int get_alignment_from_regulator(struct device=
 *dev,
>                                          struct rail_alignment *align)
>  {
>         struct regulator *reg =3D regulator_get(dev, "vdd-cpu");
> +       int i, n_voltages, uv, prev_uv =3D 0;
>
>         if (IS_ERR(reg))
>                 return PTR_ERR(reg);
> @@ -649,8 +650,33 @@ static int get_alignment_from_regulator(struct devic=
e *dev,
>         align->offset_uv =3D regulator_list_voltage(reg, 0);
>         align->step_uv =3D regulator_get_linear_step(reg);
>
> +       /*
> +        * Regulators described by linear ranges (e.g. the Palmas SMPS) d=
on't
> +        * report a linear step. Use the smallest step between the voltag=
es
> +        * that are usable on this board instead.
> +        */
> +       if (!align->step_uv) {
> +               n_voltages =3D regulator_count_voltages(reg);
> +               for (i =3D 0; i < n_voltages; i++) {
> +                       uv =3D regulator_list_voltage(reg, i);
> +                       if (uv <=3D 0)
> +                               continue;
> +
> +                       if (prev_uv && uv > prev_uv &&
> +                           (!align->step_uv || uv - prev_uv < align->ste=
p_uv))
> +                               align->step_uv =3D uv - prev_uv;
> +
> +                       prev_uv =3D uv;
> +               }
> +       }
> +
>         regulator_put(reg);
>
> +       if (!align->step_uv) {
> +               dev_err(dev, "failed to get vdd-cpu voltage step\n");
> +               return -EINVAL;
> +       }
> +
>         return 0;
>  }
>
>
> --
> 2.56.0
>

I can confirm capping CPU opps at 1000mV and this patch fixes this. I
have tested on Tegra Note 7, ASUS Transformer Pad TF701T and Xiaomi Mi
Pad which are all affected.

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
