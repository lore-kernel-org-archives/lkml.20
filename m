Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1AD3AAF54
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669552; cv=none; b=p8rsNLkGdMdqSsffg7xvq+FKc2Wlv7Dg2WZGlr20lyBjAakf5TdHkbp9teQ97/GyiRIu/J2+p4bYGuVhSfozraZe+q9SC0yfDNTepSP3qUmE4mzzrGhkEElPzdw2TitDyzyAUJVb8y7K13cPJ9e8NVmlVoBC7lYnGThqNkxwdvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669552; c=relaxed/simple;
	bh=e8jTQ59tb4Ke+Zmo+wcDDbIer2Daet/lCXTrHvU+JBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oldAniyAHhsJ6fOi5MVDAbxdjUJTE6M+46CCG5oi04aSPP8rXb8Tb6Cr2//lL922piATjMepWOl9SvlHkaa/miJgsZYlkVmPViGUr1+cI3Ck+8fYH4brsrKelZvRP+1Amp4EjKtUy8IqLRIeDk9qkDASfJQOvpCc8loLZh1aqbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7b3so2150976241.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669549; x=1791274349;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wKTPnbd7pHw8WKn97YDxHbj3C025J4UMPNethHoNt9I=;
        b=cw4OZ1FkliUTJ8d8gWTkqgY0ZwW5jjns2n0kms4jA0Mpn4S7Ay1CEzHlaJCf+TQi2s
         NqNksQux4eIKifomIc8l/1thljHvGjwkUBeN3EnRKs+LkLG/wjtXKuA8vMnc1B9eKwrc
         AmSWsfR6ECkyPxc+iU9c7UU4ym4quMIUSDN33e2x+umyNIhQizlJFsTyw/pIelUreSkR
         O3u8KaJjjOwqicY6yxFUK63P2GpQQP7LK9Sda0KEYDnTEB3/7OTt6ZhWNGPw7TojSaGd
         FoyuvN5P4RHHeEgyeb9kCIzsiWbSvXzTpUbbN+UyUvOpkdsg8kTJUNf+SjmXVb9KFh88
         mcIw==
X-Forwarded-Encrypted: i=1; AKwUvBxT/KG4U9uU5p0xE7/5HV6DNMuyJny/a/M7XkxwnFeEewjfBRj3CKvrdal8NJSoMQWEEMfAMX6ueLm1uv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu5p1QIaNwzMRuGZTc6w6rqUlp8cI6C7iPhUle8ujxCRCKocfT
	RbiH31Rkg/S7N3Aq9kF5kuLOFe2a094Cc6gSso9+dKnXdHYILMMoHA1P5U8D597qtkA=
X-Gm-Gg: AYBFou1gPlOHxwKofdmpNmiNkgP958/FWLB/pV9jGtgWWWstJNLuH6ZZ0ooVS2VntyY
	uXVt4wWnxrSMQqACAyqNxUuX6WjKLGQCS6UVkp5JjLXcP42at3plJ48gR9erfZRtQv2nemBkpGQ
	gWFN5lT1ebtEUzi+MdwiwgZ8RR8/hs58fT3ZzJ2FWbRoI7wbEGsrA3uFdzJEYVLVMGz8NIU6F56
	h8a2WKP3np4wFjo3S7AMqrwPRwnl7secEhIEHfP3OPs93MCd92ceL+mxoIQ8oFUOj94H69XPlDV
	QS57NJwFykFu7ZijvXNR5xCUqDTUB1me1K7ZpYtC9LEWiGL2C61OMyN6WZwacyUlBGqmuNaHL4k
	eG7RW5bBGhtdz219TT8XAP+MYIZ8r2eE+6CviU/VGOBNl3PWFvlyLVsRZiLdYn/MujVQfxxzARa
	6J3YfL0Lg1DvsEsPPn22SRwnX4Cr/pIN2kMecSfpoKKTgqa7A35HzQb0FNuwj3oodm+foGN1j2h
	3Tf6oF/6usxIGtw7G7ioyaBY2MaOq6yfKWRMA==
X-Received: by 2002:a05:6102:849c:20b0:7b4:6e46:4cb6 with SMTP id ada2fe7eead31-7b46e4651a2mr1619060137.6.1790669549505;
        Tue, 29 Sep 2026 01:12:29 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889afc5b62sm10174544241.1.2026.09.29.01.12.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:12:29 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1853445241.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:12:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxcZNq3LYZGg7Zs7oAA6avBmQ5Jfa11LjXSMzmiz04ko8uF6Ucm5ucMWhc9onxROPErKUUrTZaP22s9JRY=@vger.kernel.org
X-Received: by 2002:a05:6102:5346:b0:7a8:15b9:dd34 with SMTP id
 ada2fe7eead31-7af1c58fb71mr6318332137.2.1790669548884; Tue, 29 Sep 2026
 01:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 10:12:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
X-Gm-Features: AclHuK9FhwKj6JL-kiqTsnzPxsKOECrpai_keY8LaopHP5dfC3Vjj3Wu8JulErc
Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and both
> HummingBoard IIoT and HummingBoard Ripple Evaluation boards.

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
