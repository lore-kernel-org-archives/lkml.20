Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823215;
	b=JqJw0IHEwmk4ulT1OmUWjGTsL0Yl774teFnwYuh9w/BXXR+IsJ2QB2Ey7ae8wK34qJK/
	 +YxTULHld2tlYNYpBB5U7azqLyPmqK5bZC4PDhFa9p+pyCqyJG77GNlYdVxjFhQ26gZFF
	 mLgDRjrSvU1FMrXvmSH+qg26WSjxn62u72P6gLfCBDksRnJ1pK2Tx43M+9Od9jm3Ek9yI
	 skHr0mcOnxK7NdN60FXlXGjxHLtlunvFbo9i4RHjwkLfuOVVTXM2daoDn2wf1KclYJFs5
	 5BnUpn2E/9vLZmZKNf1YG29RmQhS+IKgQrKp3bfSiuzoiQ1uIyq2kqJSBoxJD6KR2TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
	b=VVfT6X0QhK8bmowdPxOZPtFcvMMY06MZv4QqLg61KWGUEgKqkqwgZSOriaQfmekMuYCt
	 E2bPnHpluUZqUWvvxi79p5fiCIUPgllsfc6ocq9JtaWX0vrW2kd8ZyLldhtGiMj0jQvO5
	 UeOPTZt2LTU+oyevhg6Z7uFsam7CY3rMfxcbLRQaTTYaIAHuC/VXj26IFHa++1aNPtP3x
	 5HhOBr3vG0NTGMQ/dOSioxqQk/aIaPzj2T9nkNG4RkrubEXgErw5sbiAD5s90VKsUT2yb
	 MRjvRi2D176j0xQfsKWPsOMA+ucWKIU+Bt3QAEzM78K33DCig1b1eY8q/P50LGMPRrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZyfG2ka;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD53606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD53606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZyfG2ka
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1489065f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794823213; x=1795428013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
        b=EZyfG2karYEC6c2v8a9CVKvIn3VTpcvJjBWEKWkwZnMuVrzc3zfNGmB4Mkt8Q2Nxlk
         GefOEJ/SKzAyW/cCiDPKHIfnla/ZHoqVairWDum9XOHNcvHXHpgaqJs0jZvAbCwtUw2y
         /OZRstU9JA6TLMOPBwJlQBF2LZ6sSivDXJo0tgTSmk5h6DWDKhiX+f9OHcScLEV9J6M+
         9D4an3zou30wtp+HhT9CGL+Ep+3D2RjGQjuSJZHW+4SNUt2H2ocP5BYNUlEshsgKsM/I
         5v8n/qJqE2icsgR6ZMA7JHiNnOs7SKAGQlpCgutl27CEGsil1AOla/GK26pcMo8YWu5t
         kOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823213; x=1795428013;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
        b=jjW4f24pY7H9L4DeGAB0C5rR5OYBVpKtpFqXPkDWA3PinaQirr0m83Bp9rCcpvHedP
         pFLt4P8N2NcE9tzgkRQqkiDq+oUB5Ag/q9fkMmAFahJ6snU3JRYonS4mM1B63dr9/KER
         azJZaiBdk1jFojHwxl9eIzxeVKeX1nAeLfKNpWJm6sq4sQmNaT2t2TuapxEh9kbtZ4tz
         tAqAfcIRJ7I1/iBnq7huXcl+syeffUp0FUl431ZRBDeNnndK+4++YyJXTCY45mfjGhSs
         ilx4q/mxrSTQmUOQ3yXJY5p+T+BSIzw35/WjWbJ0fZFtT3hXfZQ7pGQu47q3OMVSdKzn
         RKNA==
X-Forwarded-Encrypted: i=1; AL+hErGoiD8lIS7RJpXc/MV8LSAeP5AuxYT15PT7eY5U+EqjIG0V1loRO7FCEBjVSLghiOCMToVElFZ04m3idPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HBOdBqBtm8rSQrbEqiATJf/dBmBJhsYPNCy2LVaoAxZ1nMv9f
	fJOeguPg21dv0NShhUSIwkZOMdStVq/+xG7FUsFz8xabUFfGxnamcOxv3ovRRYWUppg=
X-Gm-Gg: AZFdTZcX8cV2K0jhm94YOLtFo/NWBfRD+/qZlQjgbt5ky0I5JPzmQDwWJ6XxOvpDINo
	AR6+F3p74Yk4oWDQEiG7bJY4/M5s61D/ZMlENbJbTab6J9mt6bmV0EM/VBq1kcWFszXvalOlNFx
	qku2n9JLoEg9XtZ6aSZLsrCI7Ga5djq38oWlS72zlloB3S3IKpA5eQ8KOGND8chnoCymHxwiO+c
	0A3qqZy7Wv/JZuLyoZxjMsJAVjGf38phhp0VIBo/klJhRGnWWGwhHEwnuyC03+0ashXoB5Evmws
	+ZZU3GACVqCVxjI8OM30dfiCrQHMsxFkK34PcZpFINsYLlEx1x6sCC9F0+Enn9Vpnx9uHqdavaZ
	6gnlpXmlVDWFkQi7Riu2FwKO0P44oV8jm2GGB7JltqmZpm6l0Fil/IpbjacZnkiEQ4faYmYvvd5
	b9FhWN37s2ve+unm80U3pI/XIxJVMLVlZbNZRT4yPIClduGAvtjJgNoCEtvwj+jiQkOCTIPFOiL
	YFhZ4vJhWqUByS3uwd+NWs6dSjyXxPTxvtsK4X/RMW9Q8wvjF9MHYon/El6gzD/0deMmhlW/prV
	H7AO0FOUptQauBdkTFJHFxbo1tWx4u2x+g==
X-Received: by 2002:adf:e008:0:20b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-49c71e3e1c0mr15349062f8f.9.1794823212810;
        Mon, 16 Nov 2026 02:00:12 -0800 (PST)
Received: from [10.48.2.141] ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ecda5sm20247717f8f.37.2026.11.16.02.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:12 -0800 (PST)
Message-ID: <ce463c97-8fde-44b3-b3bd-c21a69ee61b9@baylibre.com>
Date: Mon, 16 Nov 2026 11:00:05 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
 <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

On 11/13/26 11:11 AM, Linus Walleij wrote:
> On Fri, Oct 30, 2026 at 4:58 PM Clément Le Goffic
> <clegoffic@baylibre.com> wrote:
> 
>> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
>> driver registered them as groups. Register pin-only functions without
>> groups.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> 
> 
> Patch applied for fixes.
v2 went out after your mail, please skip its patches 1 to 3.
Its patch 4 does not apply on the patch 1 from v1 (a line join Andy asked for), and its patches 5 and 6 carry the arm_scmi to arm/scmi move from linux-next.

Should I send the fixes of v3, patch 6 included, on your fixes branch, and the rest as a separate series on linux-next?

Best regards,
Clément
