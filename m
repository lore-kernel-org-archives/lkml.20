Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794149306;
	b=W5H+ogmUUBZV/sNZiUriRRdOoWiv0kkW9WXpahoHi0dM/zD1YBsWMYvbQNz18vn9BNfU
	 nM3bKp79HDmJqZfeR6gbZiSEg7lt1DAfB6IUqfCP65dIc342p84BsO6GaOhEaBsLpn9Yg
	 D9T5/5nmkhh7T1XpoJHsfEXIQ+3jJMv4yGE4QN/GqPA9pIj62EsNpNNEYAHNJJhxTZn20
	 1UJOCeHdphQe9E1Dr9Hf+B/kMt2e0vxElHOqT+7lBWGep74IvIDqKepwmQ+6KW+ht5SuH
	 CcYLtr3/ZO8YPP6Ih6kGMR1TccKZDUkc4JJB0fbpAzpFdi23fkT8EBxKMLvu+ynd0KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=72njd0xQ5iZD4pPKmsLG/N0Oqv9jSjZrxN3BfMccT4k=;
	b=vvH8DdHB7Om9sCB5z0P3ogczy7o/KJ4YJvz7M5qQPJRlVGXgpPapKBEL3Pc5hyrcVpeI
	 U0/KmR7RGZdF758tmrY/qk9v788GVYS8hD3VeQRPAlLJ61th6SFXr5+2QuRd1eAcn/Bmt
	 4xQLOURNTIydI4jjuickPtyHDrx2FqWEeWNyUITJNZvvOQ/FgulMuYczFPzon90+FfBhY
	 WjjJ5KvrgOVbINt7k1bsalhQTxOz8ZdAASfZlz3tUsnnHW84yfEtAgNXt8jO12aYpSyCM
	 60QRUC8cAape7dgto8fTebKWjplXtj1hrnDrsmXhzw570nc2929wcwH2TQisQowAR+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M89O7Eav;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAB6606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DAB6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M89O7Eav
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso862545e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794149304; cv=none;
        d=google.com; s=arc-20260327;
        b=cAlXDsld22e7bAjQkZhjTN6ixEfbPwf/xsHlBZLM96Mkue/JZC5hEl8STbaorSXQPG
         mxAaKuwidcIMTrJEYY8ujhnq6psqKfqbknmB0Mj2HUepuKLXHatvXMv/ZSRTytrC44S7
         BVogqQHrITqrDB/W2GZ78WyyvCZQuApLFIKjBcrAtZCut16B2T3zQ0VzuJWln79rbUPa
         2HyBUM0ohEs9slqyfNFdSSFSXv0F2qmKANQnZb7urPLu36ukPA4UaW/582vQoRN1fCAo
         MFI+f+TZUZNayiCo7hzcV/Milr+k2esYhBxYwPpoVTDl5m/I/WwyNAYApRGWckgptjZF
         xmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=72njd0xQ5iZD4pPKmsLG/N0Oqv9jSjZrxN3BfMccT4k=;
        fh=J57C93oLeHkuYa/JGL7dAov1iavSukx8N1xxiwYsWN4=;
        b=H5rAkeSw7im9o6w+wJdpT3QzDacrBZ6/24mYll4DeNIaIxATHAcLXTjq/zxlmabbXO
         tcHsZSBzN3BtBg+5ARcWj7drjwJObQ9CoF9yodTErRpaOAHfYvM27fCUsIrHQYq8tpwh
         5XCFNMRdbKoRj2uG/99RCBvtMBc9gEuOEWQ4nNR3PyWlXNAONFhrq64CzKqIEdYP6Zvz
         UAbX+NgnD1Q6uPIC0Bextij3b1kW6rRSfiXd0rz/hw7veOW5GnNT55ZEDLJXu1oDKD5o
         sTWeaAw8GMolazYA7LfG9jSvgWxCGBnFiFmfflBAE5SoQcb3IbSUT4CN0d5NV6pscNjI
         3i/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794149304; x=1794754104; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72njd0xQ5iZD4pPKmsLG/N0Oqv9jSjZrxN3BfMccT4k=;
        b=M89O7Eav+NpL1KqjMFVjw5iimIbpfy/0FQfp5RsxTeLQo/jL4ljSEZt+csLG0XgNQG
         7gmTLcUa3Ox1lX+Cq+ptOazATthaTntkflV6T0LnwYHpmzkv7JBIROJfcp3grtuzuZ5o
         +xvuRc6fZ43kmkCyGHMLQcDhcZXphFCeGHi4i2+tXEOFB7lyTIu/ICjylpIPF08BEQDF
         bZFmY5k2cqcKVdQg3gdw3mcXTaS4Z0bCA2KTwChkyMQ/8XERMIcV4hXcQ3r76D7Ods36
         6KArQhsNgtsOLOEtt4ZnfwUIPNNjnjKq+Q4EgDoGy/hUCfjf+/dDa0GWJYMrgpRjXT7r
         Wt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794149304; x=1794754104;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=72njd0xQ5iZD4pPKmsLG/N0Oqv9jSjZrxN3BfMccT4k=;
        b=dNbUuntN55FvArvO7v5yQIwR7uZRldkJcwddV9d4NMLXzGS4AtOEqNZSGJyA5Q9ooB
         3J7vqUCQrjU4V6F10Yw1iYUyrV0PweCVSrbVIdDY3wQK7VhBY1NSJ6Xe2n3UTrbtdZLG
         nt12hxMFgjAnj/mQEt1GPl2Hba6BCZRiGC6VvPS1zPnQtfio7eB0eZDS2WaT19TH0iAj
         2HkFZiDh9Y06+Howg+JR5fAuAXvpBfxsEM+qehpFEHh4X31ggbDck5JZWW6X2JcTxKaW
         0iK5XPBwyOOTs7sZtDNEn+G+bYJ/cXvByLA9DMkX2piXBmthW7Cs7Iz3GAaV8+tH1126
         DUYg==
X-Forwarded-Encrypted: i=1; AL+hErEpEveV3/R7rUfgYpnQuJFqSBwhz35LTqeQ0eVEnjMeVxZvn7UXh56IaOg2JCZ5I52ubgCHCAAZ199FHAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WNn6i4BuHwLs5/XhBK4ZE7VrIUAY3afWltqUzypOsVCeUYupO
	acmTBIA3QbXk9m4y344xk1zMjo0ukAYWW//h2vZnhuYez2jMbSbcHt7FG4k3f3oJym6Z8yeZFWV
	Nn2O7wo8IySC+2SJYSBQG0odo7A7kKX8=
X-Gm-Gg: AYBFou1Br1oEfYnpdJ5Pj42q3mWyX8AKS8EQhOb0AruP/mf8DS2O9YDu0m3nlVMZyDp
	QJBpEvS5WIFKnszioKU/GRXH8GAklgtLFYrBaU8+gzCmWGnsh97WT0CUPC+BW28vwBpMKoF6dt/
	nBEKkh8IRUghKpawfhH4BwMdob/QiQlyta9DJpcLB2O0AmmVR9h69vP8MV9N6RyU3/4FO54t725
	hf1A4MRL4smx4AEDazezu5n7EYv6QO13Astt9kxFW7x5tVTbmLW6aVBlRuTeBiIFoWev/DXRkzz
	FOLtnkhxeA9QDABTI6P3jMjLF3/JNNHJzb9GjwBXGvkaZjmvnPXt8PBEJX+JtWiG6hQh5f872i4
	tOl5oPjIvGRWmGpod4xwBtCiExlJydjXgEzN9bPcQY00Zo67G3qNsqSgS8skjESk4pUh4wCA=
X-Received: by 2002:a05:600c:800c:b0:4b6:267a:dd6e with SMTP id
 5b1f17b1804b1-4b963c9b704mr33733845e9.28.1794149304259; Sun, 08 Nov 2026
 06:48:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tle493d-v1-2-3246e91e6394@gmail.com> <SN1PR12MB25289B6D8FD76DE3160299B5A5762@SN1PR12MB2528.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB25289B6D8FD76DE3160299B5A5762@SN1PR12MB2528.namprd12.prod.outlook.com>
From: Viral Patel <viral8854@gmail.com>
Date: Sun, 8 Nov 2026 20:18:12 +0530
X-Gm-Features: AclHuK8k8SGGyofgHCdVBkLXPFoEz1YfhP16T0j4rlTWnfJa_LPLI57xmzGezk0
Message-ID: <CAFkCdFzQBHMc1CvOJFQY+mtepU12UrEQfWyNdY+rWUYW5CG7tQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: magnetometer: add Infineon TLE493D-W2B6 driver
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: andy@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dlechner@baylibre.com, jic23@kernel.org, krzk+dt@kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, nuno.sa@analog.com, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 19:13, Victor Chernyakin wrote:
> > Based on the TLE493D-W2B6 User Manual v1.11 and Datasheet v1.2.
> >
> > Datasheet: https://www.infineon.com/assets/row/public/documents/30/49/infineon-tle493d-w2b6-datasheet-en.pdf
>
> You should link to the user manual too, since that's where most of
> the information relevant to programming the driver is.
> I see that it's not available from the Infineon website without a login,
> but it's easy to find elsewhere:
>
> https://assets.sourcengine.com/datasheets/c9ebe749-34ab-4924-ab2b-aa7d4dd15e25.pdf

Agreed, thanks. In v2 I'll link Infineon's own copy:

  Register details are from the TLE493D-W2B6 User Manual v1.11, which
  Infineon provides after a free registration:
  https://www.infineon.com/gated/infineon-tle493d-w2b6-usermanual-en_dc6d4e62-cde1-4d4b-87bb-c3368e25e35c

I'd rather use the vendor URL than a third-party mirror, which might
not stay up.

> > +/* I2C addresses selected by IICadr, i.e. the default of variants A0 to A3 */
> > +static const u8 tle493d_i2c_addrs[] = { 0x35, 0x22, 0x78, 0x44 };
>
> The manual seems to list these addresses as 0x6A, 0x44, 0xF0, 0x88 (Table 4,
> p. 14). Can you explain how you go from those values to the ones in
> the code?

Table 4 gives the addresses in 8-bit form, that is, the 7-bit address
shifted left by one with the R/W bit in bit 0. Linux uses 7-bit
addresses, so 0x6A >> 1 = 0x35, 0x44 >> 1 = 0x22, 0xF0 >> 1 = 0x78
and 0x88 >> 1 = 0x44. The hardware agrees: the driver probes my A0
part at 0x35 on a Pi 5.

I'll add that to the comment in v2.

Thanks,
Viral
