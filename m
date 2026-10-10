Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D9383C84
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791671846; cv=pass; b=ZQcvtMTS8pVVrMwDQWvZnXf2RfiEHB1Lqy/0R0trQw0Pl3PTEe1V+KA2fXOHIiauI8koFNIs2bHaDsPEtLfEuMSr+BIAT5VvT09aIl/edq2NU8Zo4wDh4AHW1+0uGaSQFKLylYE9YoFV1HtUAzVgf6//DAKn3nNXKVwaExwYagA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791671846; c=relaxed/simple;
	bh=Edn/b7yHTs0QFZu4M/RBjveqNZ3qiAFmLJfm7m0vLn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhZzHTGU3i2RFH34s0OnOiREob40eH4F6QJ+nyNcinvDWxbuubdEc1Y4shdyhMl45Oonkgqe496iaE6OEm8SEjtaC5L6seTlLLpNMwDkqBPfXnDtENuh+k7QlnbR1MxUjanYHL5iITq+Qw2hinANHKePPI9qW03o7DBgALsj7S8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=mQPVP+Bp; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mQPVP+Bp"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677af43eed4so625714d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791671844; cv=none;
        d=google.com; s=arc-20260327;
        b=BE18vQSBC858tTP8hXhxCIQwzQhvt304vS+uB+vGA9kQg3RiqndNmgTaQtXLhJc6sm
         sUSRcRnJ4+zeS+eTd9o8zuaB5haBw0gAhR8g9hzfwhOEwtMCNbtoxuXo9hoWH5RAA5p7
         CvJUwqBfgfPkm9dGtt4qIvb84sifpDvfmXv5jeZZl8w9CkTaBgcXKO3fN4M1bW99u0Db
         YeEM/bE6cQLRO/f9+63FHIuXPuCXBR88oklNTVAMfIz5xn5+g0Yp85L52vw87pR+/nTi
         97TiSi77vkLHmDTKXwxva31K9eIZTEhz2zRI/Skcz22chjwvlYAfov7REkY7PJbaqzvd
         2rZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        fh=WiFQElsnGpsT3UZR9NOa3rkmB9afVAh2CtIrWUFgpY8=;
        b=YKd/f6ttyfBN2KXkkn2ShyRM2WiIg8faqWyKWSe7V4CdUzV3XpUZhimZcliY+epvCp
         Cd92qSCQADp1IYVUgL2+068lTCYD164Kijszzws2HLWF0oZ1WAU7f6ZWsVQgsT9qxZrA
         nO5iRdOGDwRRGk7OQ+g4CQM8ed5pZje6UvvEdrD1/piw2Arotn47HEA798gXkkfMZCj7
         9LIlGTVsDOGVHgMTRVcwNpbUQ+bmE8GOEdcyQdqHnc7sckXyY/1XG8eMFi4/5aEBUw2W
         404RVjqU83RcaQBFGqu3JRlzcPR8FvVHuaR4Q2xlY69kZOmxxk2qvub1itRHaAL+I6U6
         Pwkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791671844; x=1792276644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        b=mQPVP+BprV4H0rZWB2FZDlYu6LTcaA8A7wu+OF1tcZUWLQVjN0+Gcs3eErEXTr/81e
         WPFvXfPMTIyI9I6yuKktuw4VkaFpZ7hZGaokdQ+XyUzGIAZoBx7/bwz/TTTTAhlFeBIs
         C3u+eFc6+Ljc6OkYA3XiJdkQnIfoxLlOZ4UFlolJwdi3T9LNVm7vcY4oebiNAvw9ctaD
         0DijPhUbOH5X2+5i/aS5MAOKGxRtTxlar6x2+16R58Vhoy8ND/cMl2//n5hybH1qZmGI
         ghfsm23tCFRGs7aucKptuQsxXycdlvWO/mtQIg6OqwWGyUY7m/hQS3tUKrnLooxQd032
         CSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791671844; x=1792276644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        b=IQAs9oYa72w5e4KdB8TCj4xCMIAW2IzdguVzSnzrkqh8EIeOr7/K9tcopHVBGM8ex4
         rYzcpJQoBx1Z3QFoqYlhygH0X/f5CHew4wn7SBF8tOvesSZCM9e+2zSOUWR0jUgD6Dnc
         uMnQBuNDhMNJQqXZmFBh6UKCkQp4bnSzD1O77NSGePCgK27KU/jMG1uhboR60XC8/guz
         YCuHUI85hzrG+R8dTgAfQPT749UkRYxaDLJBU2573G2DkfYQ43F3iWsaB+lm9rlE0jJ9
         Gc138tUWRmBX1Ee1rmb9qMDJt2L9R+31Sz3NqIY8LKm7UfTdNXk9xxehHtNid2M6LlLj
         GeeA==
X-Forwarded-Encrypted: i=1; AKwUvByMsz3eaWtt7vdml/vzwzdcj6Lc5Mxn1NJNJzIt5f25RREwX1SUTISejjoI4wwpeoSbIEneYncu2X4MjNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVAmNnYF83dW3f3IzN7jrh648VT9YRg2c/G0pcsaQea+d7D626
	dVHqPsvKzccGcrrhD0yy0jIxeTcP707nnTfKN3H9H1ay+vW3tVNnSxXDYceLPDI3rCtPEarM/qF
	UiUpJvYyRztvxAE65aR7Xa7H16I12Tw4=
X-Gm-Gg: AYBFou3M9mU+SM9cZ5N9ghWb8PKZ9Hu5sbH6PVnIkPR3v4SnT5ugSPYFFbEIrVgVIDO
	hoBXqwGND+bTKoYEASnQC3plmmQgQgVfNBTkBawl9Wv/Ho5/Sve+WnPZxqNibdWRxtJhK9mbdSN
	6wkH393WiaV/4NUku2dtNHJYoGPAtJLH3n0dW0gO5wSJxIQBWsJRPdAb8JTo9vrNVTI7U9Yi/m+
	cfqgPevj/fp8oqjAqGLnO+KJ8w/9013vcx0UsPW3KChSoaTROPmcpyei2+d3oDWIj5VDXM5c2tl
	FA2p1JtytL2Q4I7+DLdO6681u71H3Bc/cwI2tQn/Df3WRTyd3TG/X/hMVFPRwEytjihcw0LqCVa
	yIBu6F4DePzmK
X-Received: by 2002:a05:690e:4813:b0:677:c63c:ed3f with SMTP id
 956f58d0204a3-67936a45e25mr1411453d50.69.1791671843883; Sat, 10 Oct 2026
 15:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-9-tanure@linux.com>
In-Reply-To: <20261010105900.247342-9-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:37:13 +0200
X-Gm-Features: AclHuK83tYlY1Yg4pW9pjFmYK85k4ljD0olzP_yaTJsbdkiweyuLFexiO6_OaD4
Message-ID: <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew, Hi Lucas,

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    =
RX delay
> +#   rgmii       -                     -                     PCB trace   =
PCB trace
> +#   rgmii-id    -                     -                     PHY         =
PHY
> +#   rgmii-id    present               -                     MAC         =
PHY
> +#   rgmii-id    -                     present               PHY         =
MAC
> +#   rgmii-id    present               present               MAC         =
MAC
> +#   rgmii-txid  -                     -                     PHY         =
PCB trace
> +#   rgmii-txid  present               -                     MAC         =
PCB trace
> +#   rgmii-rxid  -                     -                     PCB trace   =
PHY
> +#   rgmii-rxid  -                     present               PCB trace   =
MAC
We have some boards where the PCB traces result in part (1200ps) of
the delay needed for RGMII (2000ps).
The remainder (800ps) has to be added by either PHY or MAC: the
(RTL8211F) PHY can only generate 0 or 2000ps delay so the MAC has to
take over.
For the three boards I have in mind, please see $ git grep
rx-internal-delay-ps arch/arm64/boot/dts/amlogic/

> +# A property for a clock the PCB already delays is not in this table.
Can you please explain this sentence (I'm not a native English speaker)?
How I interpret the sentence: The PCB may add delays but those are
implicit and not part of the {rx,tx}-internal-delay-ps properties. If
the delays added by the PCB don't cover the full 2ns requirement then
either MAC or PHY need to add the remainder, see fine-tuning below.

> +# It is either the fine tuning described next, or a mistake the MAC
> +# should report as a fatal error.
How can I differentiate between "fine tuning" and "mistake"?


Best regards,
Martin
