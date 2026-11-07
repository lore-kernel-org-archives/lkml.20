Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794046690;
	b=DXASWzm8Y8UhjGXVU9aRybIZWHAs85c4dOksNfN65st6wAB7jz7QhJ9CwD+RjkliaTvC
	 8oXZEo7lue7H8eeI8fVpgnjsBZ8kX0z98qkfpjVYVgGdkZt1+7IqiHwJckCo9nI1FdLlv
	 w4DaOKhSX8sounuelDl4PRuOhuVE3sbOtI/666OJGv6bQIBwVwpim6zp3oRWk0fmVRowV
	 P/GW/CD8xxxtCRNA05rqN0IJR5IJN36aahFd7OR4WAOX7A9yogiD5yCs8OkL7Wit/c6On
	 TZKHovgnNRLR9WYdj81HYomTh7IQhi9L92gnxIJhYX2nKccX34eh/4Ujt9RB83bZi9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LlYZSnhhBhztP5IWsnPRPqtaO1fn+3H5U4xPBBTTlKI=;
	b=WDut6sYXkSqc6OW36HBxG46nIwjZF+oIN7ZpoKbHTj1dTtIndGqeUfzZTrecHNwAFSBO
	 gZH3cx5lACVSXm1aPJv+kV7p/t4MDornnhEYJD+LzFseaW+uqHcpqzpg6eM0pCFCj3DrA
	 0QpHhLuGKh+L/Ydqmb668eW7krQU9IrmCWHaIlEAlPgPlH71aexz3yFOMqP98v54V3DLh
	 7+X3X48SrGjcWCpedHt4tLKzr6wmSDptn8QGG5GfhHSu+NSWatn2gGYS36UQUxv5H3qbw
	 8oaQkvBHfFnT9KdfErml4k307AS6Yw46GoLMwuJ3eg8niBiC+TmDduFHJW1kTDfAALA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP7jVZlF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A952B6082BDC
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A952B6082BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP7jVZlF
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1927942eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:18:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046689; cv=none;
        d=google.com; s=arc-20260327;
        b=ED/H2hSoWeJ5c0cmOMTJRPwunQ5mugY+eO+pytnvzMDjTcdyGVCKr6kK8AupOm4VGP
         0eAyx7vnDLyeOtpNmQrP+XGp1Dnm0zX0WfBAVsj01RXClUsHLQW8SNyPlhSdNxJTthMe
         gyV09AefD0uiAbcVVBYgDrybeUx6+iidGONCXcGyN2qGpCj/9g0h/lXYiar/4kcHxBYN
         b2GBhJf0dZp0nQHBBPmKIOViLwbF4QrNwgXwL7l3c4dSOCcXk1GSgYjZB4SsltFudtc+
         c4z8bwe+IGsu8XHh+ztpy4mOe+nOWcRp17Bg724rpRZo4Na2Z2rbnoTkoh8KtSQhDXO1
         rj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LlYZSnhhBhztP5IWsnPRPqtaO1fn+3H5U4xPBBTTlKI=;
        fh=fd9napj11bBnokgINY9rfKf/3Tw/Q67GlYxikMyKEDI=;
        b=mBDm3lG+XON65LmrZwsIy/B08/bu7qRNB66e7WNyb2Do+67f8sWJ26kfprqpEYASLP
         OSnkrnmwaqKDhdOPAnEG4/8g1XjFp9ghf2xYKKzprRRoSrUh5tshrpx3u/Lt48ObleXM
         QM+XNk11dQuQXj8g8HEG1ZpI/+vgZcHdJI4edqAXwlrvL8SZhoNYCDnCU3w69epIje0o
         GBpIlN0snGY/rkXa8IOzSZ1E8X4uU2w7fMA5TzBC63AQnQq0SwMBfo2FyXNMvD9AIxXI
         LWhf3zATYD7nYCjdSJ9cP/cMiC52/9IesJdOf/gF6O28lKw959qRqR189sOs0PijnVB7
         p0rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046689; x=1794651489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LlYZSnhhBhztP5IWsnPRPqtaO1fn+3H5U4xPBBTTlKI=;
        b=lP7jVZlFvy1fTCONhPWDyL4pzmVoRjpo0Cd87RZmlWWt6Q7QRDEuDQkoFslzqtaodt
         1RI7cSRBMHm6M1e25Wg6HMmzjbbdiCgJvEBCN4ODyKT1RR34cQTfuxMTfsvSj5tsrWfi
         weR+zF8KcKUVMUaux8r4g/yNS5S0dOdnTM0HwsT4IgS829GvcVsdfjNkq1J9aCiDAof0
         iLntN44/aK+yT3bzsqtUFByFKhH6mt/ZProSDKGMNziLedQKVy6IuOtecDmcI3rHN+Gi
         PhakD0y9GvzTlClIc+8VbgPe9Gw+fWJfCW5NVAopvJqHPKCtinthbNzdF/WnMxqdFeQV
         zYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046689; x=1794651489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlYZSnhhBhztP5IWsnPRPqtaO1fn+3H5U4xPBBTTlKI=;
        b=evx0cZz8KJAogZkztUADViUEwKeIDNxUe0GgqsV4TIe0cGsVlWlr3HzkRtkXVSanot
         J6KUl0aWXI9oc8rMUowJekPFzzzR8cYr0s3Nk5TjfVji+6uQaYD97pC0U7ENgTim8w96
         E58iSTdZth1MQXQlYrlw+V0PI9DfXbGdocT1i0qiMN8RLyCtpVgUzZy7dODqYXdi+suo
         S+QtLSrHofO0OtXvlGnmFnW4Rl80OhjuU4iP0B0Bxsq6f8yvY6QDCOPK/rfvgsUUHpnY
         Tb3QHlPeoAqweXnerprkMeUiVNerccuMGFdl1t8OAOUizBYpM//pyBliFb98qN3cWeTJ
         s72A==
X-Forwarded-Encrypted: i=1; AL+hErGFOf+9JFqRJdqiBIOssMqQuOUJxOSMKyGwtjtC1NJfgfXzt9MsBIuqyuKA7yRjG4uSc53LB9DWJEiwsdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MfDyCXr5B1HEWTZtaF3e/JAIcGojquulqJucKXdbz60N7qXpZ
	4Ov4Go4ZzbqAM5ZdNJ/i2KHwQihbDONnFEOkb3iOLWM3AHysdCuhENsr3/BWf6xfrvh7uc+XSJz
	++aTokEDOUDGJ680idy4oJb06G6ieK6c=
X-Gm-Gg: AYBFou36Nx9rnHC+EnrA042fHqo2LVdSHycZA4khqtIFpp41i9qXuVjGmpSJX0V5NIN
	r7INKpbHHvwLlDP+Ujw4pJ3xZ6hVj2YauXMPrsoHjb1cIeU1bYiYDpwJo3seMkQgUeYAAx7sSEt
	5hADe5lh30RwIWK0YmHVjJ7pc7GKy2IoMX38HDggDLTSgdQm5NtK5GruwrMjbSee5UWC31qGqMb
	9LQGrjiL+z9utAEmb5Np80awOnifwTGPxBPz3cAEbu8XtzbuCt3i61ui6luGhL3BQNfvnjhDmtV
	Erqz54/Xij2wmYsAbKiPQ/B93qJ028k/YPlHsyzI3HOp9kKD4xcIvy3IxLsIEE7/H1n+4E+s9Jl
	VHaPMweF9/SdZ8z8mUmh6UaN3Cot3Wk6TlkWI6pEAx2vZwbzBjU6mUG7aJ8/W6Po+NXs0DzImmD
	wqkeepMNLK6T6H72RcN73R05h/34UERg==
X-Received: by 2002:a05:7300:de07:b0:36a:1294:59e0 with SMTP id
 5a478bee46e88-36f75f2622fmr6160193eec.24.1794046688723; Sat, 07 Nov 2026
 02:18:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-upstream-soctherm-t114-v1-0-c875d1921084@tsv-stahl-riesa.de>
 <20261106-upstream-soctherm-t114-v1-2-c875d1921084@tsv-stahl-riesa.de>
In-Reply-To: <20261106-upstream-soctherm-t114-v1-2-c875d1921084@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 12:17:55 +0200
X-Gm-Features: AclHuK_jIEdyr-up9S7mHl7KTEoo-13Z2jwrbx6ifXQMV0tTi0jUUh7MBAiai48
Message-ID: <CAPVz0n2jFCxCa=t=XaxE7S9YxbYyF3WGbwXqBvkkQHjmiErqdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] thermal/drivers/tegra: Avoid SOC_THERM calculation
 overflow on Tegra114
To: admin@tsv-stahl-riesa.de
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:32=
 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> SOC_THERM calculates each sensor temperature in units of 0.5 C as
> THERMA * capture / 2^13 + THERMB. On Tegra114 the intermediate product
> THERMA * capture has to stay below 2^24. Above that the hardware sets
> TCALC_OVER in SENSOR_CONFIG0, clears TEMP_VALID in SENSOR_STATUS1 and
> the sensor drops out of its group. On a Tegra Note 7, 80 out of 80
> samples matched this rule: TEMP_VALID was set exactly when
> THERMA * capture < 2^24 (largest valid product 16747731, smallest
> invalid one 16877718).
>
> The fuse calibration itself is fine. As Mikko pointed out in the review
> of the Tegra114 series, the fuse corrections are in 0.5 C units on
> Tegra114 just as on Tegra124 and Tegra210, and
> 2 * NOMINAL_CALIB_XX + shifted_xx is correct. This patch keeps it that
> way. The problem is the range: with T in C,
> THERMA * capture =3D (2 * T - THERMB) * 2^13, so a sensor only gives a
> valid result for T < (2048 + THERMB) / 2. On Tegra114 THERMB is close
> to -2000 (between -2117 and -1812 on the chip tested), which leaves
> almost no headroom. On that chip the sensors were valid only up to
> 45 C (cpu2), 53 C (pllx) and 32 C (gpu), and cpu0, cpu1 and cpu3 not
> even at room temperature. The gpu zone therefore always reads 0 C, the
> cpu zone stops following the CPU at about 45 C, and neither the
> throttle levels nor thermtrip ever see the temperatures they are
> programmed for.
>
> NVIDIA's downstream driver runs Tegra114 in "lower precision" mode for
> this reason (tegra11_soctherm.c: "We must use lower precision (0) due
> to cp_fuse corrections"): the sensors count in 1 C units, the readback
> is scaled by two and all thresholds are in 2 C steps.
>
> Do the same with a lower_precision flag in the SoC data:
>
> - keep the fuse calibration in 0.5 C units and halve THERMA and THERMB
>   only in the final rounding step, so THERMA * capture stays around
>   2^23 and the sensors report the same temperatures at half the
>   resolution,
> - double the readback in translate_temp(),
> - use a threshold grain of 2000 so that thermtrip, the throttle levels
>   and the trip interrupts are programmed in 2 C steps.
>
> The use_lower_precision option in v3 of the Tegra114 series and the
> downstream driver halve the calibration temperatures before the
> calculation instead, which applies fuse_corr_beta at twice its weight.
> Here the result is exactly the current calibration divided by two. The
> PLLX hotspot offsets are left as they are, as in the downstream driver.
> Tegra124, Tegra132 and Tegra210 are unchanged.
>
> Tested on an NVIDIA Tegra Note 7 (P1640) together with the shifted_cp
> fix: THERMA * capture now stays between 7.7 and 9.2 million, and all
> eight sensors report TEMP_VALID in idle and after 60 s of load on all
> four cores at 1.12 GHz. The zones read cpu 43, gpu 39, pllx 43, mem
> 39 C in idle (board thermistor 34 C) and cpu 63, gpu 55, pllx 62, mem
> 53 C under load. Before, the gpu zone read 0 C and the cpu zone stopped
> at about 45 C. The thermtrip, throttle and trip thresholds are
> programmed as 51, 50 and 45, i.e. 102, 100 and 90 C.
>
> Fixes: 9d522a877b6f ("thermal/drivers/tegra: Add Tegra114 specific SOCTHE=
RM driver")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/22816196.EfDdHjke4D@senjougahara/
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/thermal/tegra/soctherm-fuse.c     | 15 ++++++++++++---
>  drivers/thermal/tegra/soctherm.c          | 21 +++++++++++++--------
>  drivers/thermal/tegra/soctherm.h          |  6 ++++++
>  drivers/thermal/tegra/tegra114-soctherm.c |  4 +++-
>  4 files changed, 34 insertions(+), 12 deletions(-)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
