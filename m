Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987372;
	b=KQ5eZLkUOY9cGl/5Sk9H2MdjRWOTfqf77NXleVoOzbgriV3V6+xxeQAkj73a7HAqJ9/f
	 jkJBFyydk6WAUXPQ/SzfUhdllqRLSwiYu/rGgOtBp/ea4FQ98aEpEIUo0vF07M+a+nfM5
	 9b4IuTPrmjEHwv7OrE+hQXJKtcE4wWugHtZou94bhFZziG0Oo6egZWWR9I3jXn8f5sMGS
	 TzQOt0adlqQkbv3REMGoOAs+wxQiliXRqbz5eGTO26YM33auIhDxkMCKJJg2PQhonTf2p
	 lOHgiXcPjiQtX8C1EZeKe8daXuJPn1ZpZdwtrmg6I5pCgDsbZMwsNw+N5vQHWTreq1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987372;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fYklhhhbRSQBfdXX2JpZkjACP3Hz9ptxY00BldJcWAs=;
	b=GCaPPO0bPBRioV6aE0rgR4ZMF59VtPd+sJEYImaZN0Ci9ZtHF0w1kkUhRPYxCHpaQgNK
	 R0bcvmNe01bEEietFMCFqYspCO/Mk7a0QP6sD9SfXEea3DIv/F4KLWKehWE4RAKNqr1Mm
	 9ij/Jdanqc+86P+vXtXQPuA1mYHZtpOw65Av2dHy0I+JfVHpafS6CtkDMp09wv/46Be1i
	 3CuL/2TBzOAtFwThIJ8aUOVFsMh09tGBpWu0Y+SzBrs4bg3YymojKTb65fzAf1o0YiANm
	 k7jyL0d8BJw/QyLfazde04O7s6vVjWROA+WXbPtMB1thiTRJP3igLlNTtOhC+yDp/AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6A9606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE6A9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de1fd5f572so386029eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987371; x=1794592171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYklhhhbRSQBfdXX2JpZkjACP3Hz9ptxY00BldJcWAs=;
        b=F/btDEBIcrsd7F5kxeLLOYouMtrjwrWNx2JRw6hM8WviMJ5aXhVTedpWAc2ACZcdoc
         JFpaRKDah11B5I1BLUDuwRMKcRKai8Pwgp4Ij11mp6/fYfVkgQAoXhL8sPs3+lI972gB
         gLbW7YYng1qHGQmZ9Pv8tQlXgn5Y0WZnXupJ2LtH/lhYiUcB2lXdriSjNW/A152J8neN
         +UN41LKBAQtLRCqQoTsfNQ88LmYXgMPv6ou7WOrcgFTlnYw1DixUg/i2wW5IQXt3Srk/
         X26P0avx932YeNfe+HJGe8U8+fns1OOPpxD1FcBo4j1NQQk+PtMnHxvffOS8a0ERF7ao
         Mdqg==
X-Forwarded-Encrypted: i=1; AKwUvBzKE5ECgGSIXDV2wKhP0oqdDx3VpImCo6mlqYge9b+oRAj4S/c114E4UThh5nebgCXca3gPIbkfXyEKlbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8gQXltyhGPyFjEEfsKJjC9xJxdkeygX1Zt8ndrx7r7SCPhs3R
	IKdSSLrtp7LgmBKr5tN4Ck65qDLfmQ9tiQcIKJRWmToV0SnMTwnoBcYfr/4h7yxn
X-Gm-Gg: AYBFou1SDqtHvPa37goSTq5jI8XPSsMgbT/FLOzD6uXNNjJwflbcM5GyhQUZc2kWkRz
	nUhfp80DY/FoErEwZGdlf+iY/Q7etOhi162ue002f7+ZwptLsH4+naZWO7TsYfiRoZ4eS9cnqFL
	ogiX7bdkvrE7DU5kjLhdmknPzBKQ02MEu86swzp2K2WaIv7DThnCqflKpSLEzMGZlpHIxcvvn8V
	/jb/EqDs2zh9poAE383taRm/emqzpeiVBYv7UOWnenn3K4nt4ggIAK5z7k86kenEA8WfhFfbaJY
	f1msiE96g5iPDAsjevXjVVhYXO+ToYWBJ/uYntAhCfSaRazN+Ax8Wvl6oZVd9A5wUVieHHz/AEN
	WLJGvmUNf9gGdrtuo9Ng0j/J3xn9D2qiGzpo3JXlIZ9XsofBGZqeIDIcm9wvfONEIapp+aXRkmO
	sFwOL+TcC7NM+1uO9W2zWT2GqtRPhIWYvu7px21fHRlAvldY+gd6ewpgNk/QuDZSPcIX1Rvc9IP
	STSnAWmEcpUyNY25SkZfRqhK41ndzySMOZsgK55Wu2R3wF0nwITkQkFYojmfch47YfSEVBfGcHp
	zNgnV20RtBwX1DAeBXRKCBDYGsZ7uzb/vkKXycnL9YWWYssLl5weqlxySLFCr8qixhb814kbk2j
	s/EY4+trPYSVYyseBxc5TTFtwSk3r/dZH52NIx3sxkjfl8vlCvrDpvdTP0GJft4SlT4KOWCtwMs
	/UCqR7v53Hi/LCFwVc99/h
X-Received: by 2002:a05:6820:2383:b0:6e0:8fc2:84a3 with SMTP id 006d021491bc7-716e790e060mr1579306eaf.39.1793987370604;
        Fri, 06 Nov 2026 09:49:30 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e9fa7ec0sm2092434eaf.3.2026.11.06.09.49.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:49:29 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-825b40f8a26so394659a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:49:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByfg61xxdD2UrOLUHjeB7AkM+xgoOa7vRTHbMHToheib3U0/7RqgWRbm1C5UXQ8N96CSHJLzF13RX+0Di8=@vger.kernel.org
X-Received: by 2002:a05:6830:270a:b0:81b:9d18:75c with SMTP id
 46e09a7af769-85f1cf95bdcmr3174058a34.20.1793987369358; Fri, 06 Nov 2026
 09:49:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 6 Nov 2026 12:48:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je96B8OJwSR-3Kg74QCXyyBQ0CxYZ7UpLjvFn+UraDdjhA@mail.gmail.com>
X-Gm-Features: AclHuK8hoZuMZCPNLtXxjvtNoRHB9-OULlZW_Ke3tPYAl1aigN1s6wtlzqMd3Lo
Message-ID: <CAEg-Je96B8OJwSR-3Kg74QCXyyBQ0CxYZ7UpLjvFn+UraDdjhA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: apple: dt-check-style strict fixes for
 Apple M4
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:56=E2=80=AFAM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:
>
> Hi,
>
> mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
> this makes the M4 device trees broadly compliant with
> `dt-check-style --mode=3Dstrict`, leaving the same exceptions:
>
> - the property-order and line-length issues in the generated pmgr nodes
>   are left as-is
>
> I checked carefully that the modifications do not cause any functional
> change in the compiled DTs.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes in v2:
> - Also fix indentation related dt-check-style issues (mixed-indent-chars)
> - Change the ordering only where the issue is still present against
>   current linux-next dt-check-style.
> - Also fix any remaining line length issues in the t8132 dts except t8132=
-pmgr.dtsi.
> - Link to v1: https://patch.msgid.link/20260924-apple-dts-m4-dt-style-che=
ck-v1-0-3ec651d75baf@cyberchaos.dev
>
> ---
> Yureka Lilian (4):
>       arm64: dts: apple: t8132: Fix indentation-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix blank-lines-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix line-length-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix ordering-related dt-check-style issue=
s
>
>  arch/arm64/boot/dts/apple/t8132-j604.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j623.dts  |   2 +-
>  arch/arm64/boot/dts/apple/t8132-j624.dts  |   2 +-
>  arch/arm64/boot/dts/apple/t8132-j713.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j715.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j773g.dts |   2 +-
>  arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |  19 ++--
>  arch/arm64/boot/dts/apple/t8132.dtsi      | 157 +++++++++++++++++-------=
------
>  8 files changed, 109 insertions(+), 82 deletions(-)
> ---
> base-commit: eea4f3b5e9e19389af3b99af64cdf7352b67c298
> change-id: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
