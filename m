Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906799;
	b=P3nY7noievlWpv/HkvTKh/0SkXYygUj6fHws/2iegFhEkzaWMVmE7xnxCXfDzbqY4/Ti
	 6GeawtLYYZDY97/mLGcYXHexR9RYuIk9DWu3eqLrjzV+onUcg+lTXC3yUhh3WNStQ975V
	 OhBtnVKeoC4iLKrw5NEVbQZrxnQJE1BPVGlCVSbIL3lCR3utL8h4Lq03F75nw1gyZUKiE
	 M1LQmNxG3SzyWYFWIexxPWVo5nqTVVa0blMQ6dt+rtudc88nNjpmYbolLQpLa7/HeBoSL
	 mEDDwxuYdEl7P2Hf0FzoX0vK9VsJCcf+OTqGp/6S5ldNpCTs759GckWTLNeUDNdY3IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906799;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TZphQxclz2gFW9ezkdnyrlJdzJISPtOa2u0+oLIYQtA=;
	b=AyUS9zl8dcTKX8vMDACeCuPuMTCQzqxbXKAR6USz/RzL9OAP7zfcQNIbnHkE+SDdolto
	 j7YPnMSorTZ86FCL5BxxZDJTJha+DoM9xa0VBTiCtUKMSg21i4hWFaNHc0x4+1wyXD+GR
	 H5pjo01OkmKR4q62lTDY5nR7gr5wNcslqEZmO86d8lIMfg98W9cLbLy2q6TLrMMCzNmVV
	 Gwobk1ewu8KXiavDDWo5Tahy43MeGT/sYRH4jndnNiX811pP2bZVs0GgE6j0efNtRRBQy
	 +LI+gxjY5Qb9cWzrV1eKS7ZJPpnKLaw0glJp5MGWZNbx69oTeaYOm0rkxThxTfm9iiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=maryasin.name;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18EF606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E18EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=maryasin.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c34bff61551so93121966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906797; x=1794511597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZphQxclz2gFW9ezkdnyrlJdzJISPtOa2u0+oLIYQtA=;
        b=SZ7lb8UGNK7xNWKyKlcpTAuD6VjenSC5n6GTIGRuaH2bKJ1705xa11rJg9rJ8Cb8fF
         2IYEJGaIJ3lS8XQ20fVN8AXf1JOO6kYW4qmfPMxcjBWD0ZpJJraylgnSual7gBo8KTOA
         nLGQDPvU3W07OoXcCoURVh0cq+WW3Ez1Z6hL8kiMgc+B/jzf8Mm3VsaOt8d27sdG1SUM
         wI7gQEEclHXP9Mvhf4VrujYJD3mKaNaB+WBOEzlzsHybqzQT1eJ6KU/ujyQGIgYAoT1K
         tipipsyPCfAMZdaVjkwXzvYiTuhF7kkRXcTPWIaIlyEChgtEAPnFggScW5NTi6WLU8ob
         gMiw==
X-Forwarded-Encrypted: i=1; AKwUvBznzw7BW6Mu8BP17B41xrfpdTDAV0hOrEH7hV4f4p/O34sqwIbkRWdZRgAD5CfkgoIJmta9fNXOu9QMycg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FKSOvIhwPb4BDCsy/aKOiPPIR99ZaRpE9gvVAuDogP52rzRpH
	blUAUynu1ogreb5D4c2p6Mi9minDXaJKSdkAjTHrXYCkPekuCn5+B0cZHA3E+X1Iuzv09g==
X-Gm-Gg: AYBFou18EXebTscPCdBmF1S9xEVA8JFoxr8t4jEhj5C9VoXKHV1WiH0QhxYUDtLIsd9
	psDOR02EQ/QJ7tWn44lBRBQdv29PsAZOhriq+CNoCADzv4+RlyGHX9MihU2vNGUw7BDExHicT/C
	P+UkBWs9gJX01hbu07kJZgIE4fCXf0O44asZ92fQRYxXCsLHsEbi+sxeyD4CLb7dTg8ayg/VpEu
	Rx9ZRNUpJfs0OgJs6TJDVAHJcNplYQlCSrQ0LCnrL7Rn1MH/ouJYK5FAGfcrnZicXRMhQKZYA8I
	0loIqecYR4Lb82rq4hx4bdalFeYQD5S8aDhpYl4EPWXD4keGlHlI6zRWEmUVQQh3cTyGbGzv6l2
	AW2vZLsBZQA06Lxx54QvGm7Vl7/AbCTyq9fGs2xr8h3pEkMzTtSF//7z/ffL9SgtdsnRbIPvKNL
	5stgWitarcDQSHuxQSzBsmk3R/7Sq+o0khNEqbGUt15yOCp0S338sGg9IC0ivGby5wQEqyM+Gjz
	j0sgiddWQkePbHmTMdg1YV+11AgB/RWFbPF9TIrPj4H1AYimYT8QMQ+rcTmvPOEI4PImkFQn9xX
	v0RqH1gk+1mxS10v3ZSmslNDl6c8yby5hxaqH8M+FrAcYkJn7exDWCpyqZlnWqyTVU6PXzXInT5
	5JLeWhoIv9AmXfuIvOIGiGC/tC+dOsGdUJirmnP7SCY/JaT0lKe/QD7HiWBRgpZsLlug=
X-Received: by 2002:a17:907:ea87:b0:c2e:350b:7220 with SMTP id a640c23a62f3a-c4d34c5b8aamr45079666b.9.1793906797248;
        Thu, 05 Nov 2026 11:26:37 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac7c4sm12165266b.1.2026.11.05.11.26.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 11:26:36 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b57182c4c6so2291803a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:26:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByqHEjs2yijZSj7vBNZ7Pb68jqb8AiDOcNal9HO9lt2peGVAARpg8hZi5kcoIZhFMgE5dzwnbf7yi5jzXo=@vger.kernel.org
X-Received: by 2002:a05:6402:280f:b0:6b5:8674:c01d with SMTP id
 4fb4d7f45d1cf-6b5975277f0mr197220a12.5.1793906796627; Thu, 05 Nov 2026
 11:26:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104165319.1890851-1-srinivas.pandruvada@linux.intel.com>
In-Reply-To: <20261104165319.1890851-1-srinivas.pandruvada@linux.intel.com>
From: =?UTF-8?B?0KHQtdC80ZHQvSDQnNCw0YDRjNGP0YHQuNC9?= <simeon@maryasin.name>
Date: Thu, 5 Nov 2026 22:26:25 +0300
X-Gmail-Original-Message-ID: <CAM2dg7dnvj7X3Fo9r_=Pn=EHxUwyFEwQN6XdLLPmOAdaY76JfQ@mail.gmail.com>
X-Gm-Features: AclHuK9weJ0gP1AI6YK6eNmMlqgPCqXQEUZ4hk_XFsi6eDTrhg4oCQvVn1yYuq4
Message-ID: <CAM2dg7dnvj7X3Fo9r_=Pn=EHxUwyFEwQN6XdLLPmOAdaY76JfQ@mail.gmail.com>
Subject: Re: [PATCH v2] iio: hid-sensors: fix fractional part for unit
 exponents -7 and -8
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: jikos@kernel.org, jic23@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Semyon Maryasin <simeon@maryasin.name>

Here is what I observe with this patch:
1. Enable sensor and run xxd /dev/HID-SENSOR-2000e1.3.auto
2. In the second terminal, do rmmod intel_ishtp_hid
3. Observed result: xxd stops with "xxd: No such device"
4. At the same time, in kernel logs I see the following:

=D0=BD=D0=BE=D1=8F 05 22:19:16 dook kernel: hid-sensor-hub 001F:8087:0AC2.0=
005:
timeout waiting for response from ISHTP device
=D0=BD=D0=BE=D1=8F 05 22:19:19 dook kernel: hid-sensor-hub 001F:8087:0AC2.0=
005:
timeout waiting for response from ISHTP device
=D0=BD=D0=BE=D1=8F 05 22:19:22 dook kernel: hid-sensor-hub 001F:8087:0AC2.0=
006:
timeout waiting for response from ISHTP device
=D0=BD=D0=BE=D1=8F 05 22:19:25 dook kernel: hid-sensor-hub 001F:8087:0AC2.0=
006:
timeout waiting for response from ISHTP device

No system crash, so I suppose this is okay?

After subsequent modprobe the sensor initializes and works properly.
No kernel crash with this patch.

=D1=81=D1=80, 4 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 19:53=
, Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com>:
>
> split_micro_fraction() scales the remainder to micro units by
> multiplying it by 10^(6 - exp). The unit exponent of a HID field goes
> down to -8, so exp can be 7 or 8 here. Then the argument of int_pow()
> is negative, which the unsigned parameter turns into a huge power of
> ten: 0 modulo 2^64. As a result, the fractional part of a value read
> from the hysteresis attributes is always reported as 0.
>
> Divide by 10^(exp - 6) in these two cases. This matches the reverse
> conversion in convert_to_vtf_format().
>
> Fixes: 73c6768b710a ("iio: hid-sensors: Common attribute and trigger")
> Cc: stable@vger.kernel.org
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> v2:
> - Fix __udivdi3 link error on 32-bit by using a 32-bit divisor
> - Address Andy's comment:
> Keep no % divisor in a temporary variable next to no / divisor
>
>  drivers/iio/common/hid-sensors/hid-sensor-attributes.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c b/dri=
vers/iio/common/hid-sensors/hid-sensor-attributes.c
> index 9e7c26e37880..d44091faf122 100644
> --- a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
> +++ b/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
> @@ -96,9 +96,14 @@ static void simple_div(int dividend, int divisor, int =
*whole, int *micro_frac)
>  static void split_micro_fraction(unsigned int no, int exp, int *val1, in=
t *val2)
>  {
>         int divisor =3D int_pow(10, exp);
> +       unsigned int rem;
>
>         *val1 =3D no / divisor;
> -       *val2 =3D no % divisor * int_pow(10, 6 - exp);
> +       rem =3D no % divisor;
> +       if (exp > 6)
> +               *val2 =3D rem / (unsigned int)int_pow(10, exp - 6);
> +       else
> +               *val2 =3D rem * int_pow(10, 6 - exp);
>  }
>
>  /*
> --
> 2.56.0
>
>


--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
=D0=A1=D0=B5=D0=BC=D1=91=D0=BD =D0=9C=D0=B0=D1=80=D1=8C=D1=8F=D1=81=D0=B8=
=D0=BD
