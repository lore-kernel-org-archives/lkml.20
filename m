Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7774CB8A0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769298; cv=none; b=oEZSs8oQ9wOAtUFrZbe5xGZ5g6p0IfpX+CAD4fMKNU4yctwgP+cyge9ZyyzgGxtaA4ruDxdIYhlpOe+DNjkWkvS0x9lAreBAAzjD9RsR61kl7qA6EPbLqXWiCE+ctu18pc6R/NYgtPA2+flVe48QPCVlRa1qdMfZDvdghs7E/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769298; c=relaxed/simple;
	bh=kq5W5nIu5PLv0CsnhiAfj/Rik2O1CWjzqKYPXqcV1qk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=cMbj6tPZiFrv+jFIHbQSir3JhC3ezH7X4FtzUFcbPLKynWBygrcV3eDkqZIyRhuqK7s8VGvRsKwm1WrQ+3jMbbZ6tYv/Mi0rnnknWkDEMdjJ3VoTo2MjNrYuK6jafmKlFgUeOBPeSmv+0LJlQSwcngLQwy7xmolabJHy7Ockyls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pN29opNM; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pN29opNM"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso7892340a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790769295; x=1791374095; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aVzuXE/DlhAkuriCQToRPrh16XzvOjKZo5qCvzwYsCc=;
        b=pN29opNMxSwQgnLw0POUd1TLywrUAkSo/Cobmj7smnNGNuoxsmw3jqUG5tQNc0Tk43
         oy2wfQAFgdBJmuZrY0HDHK/axqxtmWPeenPBkqt8MmnmPLGE6Ew7VDQxmbXrEIdjTUCK
         jorF0Y7FddHtH+SiVliSDJAKZ4wXT8syDRkHtRkxLjReHu9n78gXgpaKPw5IKmBZ8pZO
         V7jeXGgQZYKjtrJG1L1ZwgindFmwieHe01qFQT8i2LsUTCG+wvk4zogXwjOlEj8Aa4qM
         q+SJFUMYhpQGdCDOQxmRIpWQ1FbMmyQXD1ihw7Hseaq0EIjb+L+VQDcyUcOPD6x+jIre
         4hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769295; x=1791374095;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVzuXE/DlhAkuriCQToRPrh16XzvOjKZo5qCvzwYsCc=;
        b=aOX44jP6hy+cV0C2yBnh7FjksPZboR53n6uUDW+EyAf+ATv4CUwJCHcj0Lh5230oAS
         enPbF68DA+v1nJFQal8nBnHha9+VPjBtQ1zfKqWckf7a0zg+DYnkkX5xwxM8JKi1dvZe
         mY4dZLG76wGXJdpxTIEQDrRjfwBnRuQMSIeZdAjmOMl5jVy8/0DaoPLYCC/HnE9qQ/hr
         XuP0wmBn9my/Q8ZDXfVElGIsWJ5p1tehz0Yc0i1h8FHyUxbfOI1jyPt7hCCB7npHXajt
         iPJz7ei/Maum3tGZ/BkBjkyLo5tNGtI+pMM8eEhxEkUgUFE76swQFqtUC+A7yUc9zZ/t
         kEFw==
X-Forwarded-Encrypted: i=1; AKwUvBx97h4BaUXotMtVCdqeDopLEsYsWqnyyRGFa0yB7rH/1lBdXE0cgp6Y7bS30TM2QCYhcD77goV3u8g2+Ig=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKIeftBPJGQSykgYWMg7rIzA6ZAVJZQK75L3P6dFxTK61pBvX7
	k5gyP3yfHJxmIMPM6uUv23I+Ghl+klXjlEmqfskFc76810Aus1vU8gulZj3mTH3B6ee6eCepa5j
	IrhjkvEg=
X-Gm-Gg: AYBFou1dQ2eUXyvqUQumG7YH+T/gliCYdR6XubIYbeCbMTG/LvaVNj9A8vJbhtNrZM6
	2RPP9XJEVGoOlmyvHQwWmK2M9q8qGZhVLZ6LySC634fzMxTqieMF6hltcxWCSOeJQnKL5ecScob
	qxnxDgTUpquuqlC1PV9vsa1ORVFMdyYmB9/uv1L1uc/QaT1qW/XBJ7j9ttkH8W/B/hYZ91orD+Y
	I3tCn3cBpTqI2tOgF8oXbJ5a61C2mPQeQLUFjhOR7VepBcoEdVWxh2MyhoDeYM+CGwffM0PTnRG
	vMEAdQPR8CXAId3l9ca5S1rbOP1slRWQHbnKFM8DuXtzuLELQ+/AHk2Z+2tSRHL8/PI8bLDCklc
	BM7TI0mTP+yQMajCUNRGKUeTPLCUWoE3lPWQBBTOBYTlyvoAoAb7PILn/SFpy5VXHhdlfqcKQnS
	UwjKczCV2j0PmJHOx5nLUNqB2AyE5SMWd+Vo/sWU5t0yk9TMR2YAjvlyXXRiOwqb1DSRBeSHGh/
	u92r+W4nyYbKuov0+STaQArAzsiO/uOXFJgJrvHJ/I6CCoMhfWkXU8vhpp4ONzV
X-Received: by 2002:a17:907:2d8e:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c2e23d94b26mr97396666b.35.1790769294780;
        Wed, 30 Sep 2026 04:54:54 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:2655:b567:7e10:e7eb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22e16137sm55259666b.9.2026.09.30.04.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 12:54:53 +0100
Message-Id: <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: "Thomas Turner" <tturner@lineageos.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
In-Reply-To: <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>

Hi Tudor,

On Tue Sep 29, 2026 at 10:02 AM BST, Tudor Ambarus wrote:
> Hi, Alexey,
> On 9/29/26 6:10 AM, Alexey Klimov wrote:
>> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
>> protocol provides interface for all client drivers to actually use
>> features exposed by the APM co-processor.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 8a4771899a8e..91c6cee8f483 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -11,6 +11,7 @@
>>   */
>> =20
>>  #include <dt-bindings/clock/exynos850.h>
>> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>> =20
>> @@ -170,6 +171,18 @@ timer: timer {
>>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>  	};
>> =20
>> +	firmware {
>> +		acpm_ipc: power-management {
>> +			compatible =3D "samsung,exynos850-acpm-ipc";
>> +			mboxes =3D <&ap2apm_mailbox>;
>> +			shmem =3D <&apm_sram>;
>> +			clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
>> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
>
> Why do you describe these clocks?

>> +			clock-names =3D "cpucl0", "cpucl1";

To link these clocks with ACPM clocks from this list:
(file drivers/clk/samsung/clk-acpm.c)

static const struct acpm_clk_variant exynos850_acpm_clks[] =3D {
	ACPM_CLK("mif"),
	ACPM_CLK("int"),
	ACPM_CLK("cpucl0"),
	ACPM_CLK("cpucl1"),
	ACPM_CLK("g3d"),
	ACPM_CLK("aud"),
	ACPM_CLK("cam"),
	ACPM_CLK("disp"),
	ACPM_CLK("cp"),
};

Eventually to have some sensible/working ->recalc_rate() for ACPM
cpucl{0,1} clocks.

Which is needed, for instance, for cpufreq_dt because it registers with:

static struct cpufreq_driver dt_cpufreq_driver =3D {
        .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
                 CPUFREQ_IS_COOLING_DEV,

Don't know if it answers the question (if I understood it correctly)?

Best regards,
Alexey
