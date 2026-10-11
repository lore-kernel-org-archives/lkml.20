Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C8845D906
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728512; cv=none; b=DOFxRqg5IwLZ0ssT0j5TIQoUCQBycq9lMVXfEsmdDSxwD9R5HSI0UDN+OCZ65sT8AC2ElDPAnXBb68yaHX5kUncJHh1jfYY25UOILLkuXcA6N95BgzoLggpKrsX9yfPWET/7da9wbkBTHCJOaejmM2FjXoWWVBFXM5957JdRt7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728512; c=relaxed/simple;
	bh=HlQy9lG4oAWvBTINQPKtqjXM14hS5iTctc/NgAcI/mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9ltqphSoUuDn4bAT6wttMXSxhAdljZOOJDP2bQi71jAbK7Fcz2PK+GH1sAhkMNOXgEInaa4OYKRjq32/D5EicdRYc7q2VLe+tCI6Y73jy2E44geQ76Lv8Ij7ymf05jdHegiQjijPanTfsX9L+7uwf/oCZggieYSCWLxT22GW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-917bab38b14so18718446d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728508; x=1792333308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66qeQFvPa1OLNzA9zOG/eSFE0YAdZbwXEI8cdDv4Aes=;
        b=BliwjWTxkSoLKc1kzQa6WrUc0mgfCU0mb5fxj9wJPbhhoX/9WEzmSNDCtCalCH52Lw
         a4KoyafH6XDLCvjizYJieSPT9G4SBOqIbKggdaBPR2xfp01KLlZPGtht+wh4l3w/NpRf
         ZDnlA1eKAKqMJuySPrJoGFxEuksK3Oaz6AQGNwITUmSef0pge1dNWmelNAL64LQUIPQ1
         FP4w81V/tHhYCi6r0CydqhUYepbnnMoidtzMpvgDuj8GuOpqm8MjwRqb/hGu5orRIflQ
         q5gLq2JESQYTkyGIoRoimx5XfXjCn/dr1bOPn+VP7H+keESohJOtXHOW9iSbzp/Xz5Z6
         fLog==
X-Forwarded-Encrypted: i=1; AKwUvBx2iHgIqPcPGcWgGUkJjxG1yYtCPi2qMe+McssmEblwtsdJEJwPs7N141XzDCtYBIUEDbpmU8/V6jW92X0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC7A3Tyor7XSJl3fqYvZOi8ZDXNxy4PRSRS/rfwU8kCeRiu82t
	vYs6ZaAgtPv0dt67rT8omJ9hnK9kVogErhY6GaFxQ8FzPPI6o8f3bIEbbENc2zUkKRw=
X-Gm-Gg: AYBFou3fUJPXe+dc5Ql1lWipk3JclXxK7cHGKLHOQS56Y7sVPPmPJ9F0Rv5ShjPK2N5
	BtdHqa0DPYvCtMxeMmNxoNSe1tuFmAivO7tkTcFe4qM96kEa3cBC4ELwRtL7/JcIwoGdP3r0CeG
	Kh9+wA2hkVuj1SfM1cYLadL8AkBWgIPdA25E7+Ws17QnNJ9L4q8JGGH+KJB/Aj2S6My2JhpW0Wa
	I2Ddbxj6HI5YENAqzeKHlLqlbCprJV8nSvuxd9mBFYrD6N5GmdHNSzyw4DfsENYMP5wFhgA+0Pu
	MYUBOjM2B1tYvlKqRhrRQRIP2WzaWRd8izNb2bykbOy3QRnePGsnM32+7d3cVtxCKKRRHPAe3IG
	/basUt+o44NDw+RTUIspNFIl/T+32Cx5oJcIMdUUVC0Ky9TRNAaG3kqzccXclY5MRfsVI9++Dym
	Rpr8iqKytW4rYlZrnp+cRUDm0tdHsaW7+v3c3rKaF1pGEUOdiaWCFg3MwJMRC/iAcSTgby4O0aN
	LpJvZdTcEsJ5ziNH8gXn1vMhzVN2MtrEIkOASKe1OuHsVQuX9cVFw2/tKZDksqM
X-Received: by 2002:a05:620a:462b:b0:93e:92f1:4222 with SMTP id af79cd13be357-93ebd0e57c4mr1206370385a.4.1791728508521;
        Sun, 11 Oct 2026 07:21:48 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b7eaf07c7sm8064816d6.21.2026.10.11.07.21.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:21:48 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917aca1aee5so18005456d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:21:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzsh52SDE13sTgsdspvAbtgycUY6m/KYteejAGylxUzZ8iSIf+ChIURqQvzR73EXA/UDwZ8u5mEjGnL+6s=@vger.kernel.org
X-Received: by 2002:a05:690c:a78a:b0:87e:2404:45fc with SMTP id
 00721157ae682-8b07ee0119bmr12804267b3.53.1791728189975; Sun, 11 Oct 2026
 07:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-2-tanure@linux.com>
 <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
In-Reply-To: <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 11 Oct 2026 15:16:18 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
X-Gm-Features: AclHuK_1GqFe_9xMchzTuN-zUjY9-HZS8dq9HbxopbZkfG1FPjpin79NLsfNCvI
Message-ID: <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 11:04=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas and Conor,
>
> On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +          - enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +          - const: snps,dwmac-3.70a
> > +          - const: snps,dwmac
> > +      - items:
> > +          - enum:
> > +              - amlogic,meson6-dwmac
> > +              - amlogic,meson8m2-dwmac
> Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
> In case it helps I can submit a patch to change the Meson8m2 .dtsi to
> use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
> we could move it here too.
> That leaves only Meson6 with a single fallback compatible. I don't
> have any Meson6 boards, so it'll have to stay that way.
Hi,

Fine by me. But I think it is best to wait for this series to be merged.
Lucas

>
>
> Best regards,
> Martin
