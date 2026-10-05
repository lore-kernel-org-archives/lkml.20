Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9025B09C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237857; cv=pass; b=MlDmV0ZXTtIiKoIHW6nInlNlQfd2WgL5EdFUZFTYf8gGj+uYCzTN75jtFbhT5Au2mMpEpxsvpes7coYw/Ncy1lD0wPz3I1xvdk6sUApQQYCF0m5pGI5XFuqJ/9ljd3bFEocMpv3W36pjNIkteANRYGwgbZisDbK9EMAQ8a1WQlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237857; c=relaxed/simple;
	bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYB/EI6e8Jv5MmqM10rT80/KJpBRh0RRAfGDV8y9ZVvhWrdsD8HMGpiKNNQ31sSslqbUK+Aw0SnrhBUGdsgt9R22lfYEz4qfEaWB26fukuZBF4kjb72itjaruxUw9XzkD/gudwzGdRWDdQ31ry6yU809aB5eon+Q3cfglkO/wfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rgJQptSp; arc=pass smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rgJQptSp"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c2e85cec3acso105995366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791237854; cv=none;
        d=google.com; s=arc-20260327;
        b=Q1n2oW64nkUYtvkeEvaLu9cRyFHlQZDkkHiP/HRSppM3/lGMMsq1ii36MAbaxG+1eo
         SYQ9fFB5zkSRc7a/xEj1lYLwxoGcNDhaE99Q2q0JsvS+JLnIp+N3w/aH8iqy0cEmgiRK
         E2AG4c7XbnPYqh9xw8Q30S3tJ/JeRr1D7neBZpKH3Qhizx7qA4sxw+q08dSWHFg3Comm
         y9WGTCAQ652Rb8EZcoRswcD+YWMPR9Tw6IiTC3vjA+kLBlUuLT9fPK8ng9nruwInramW
         TgE3T1Fd5Z7zZ24EDhTTuPBKcOHsk+fzLNAFwvLgYceixCMIn/05Hf5bqzBWGX/Bitkm
         85Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
        fh=95KRd3CNMniH/WgwGzu+cyjyYUMR1+sEzSzd/odjjkg=;
        b=TyiuefRBAzKlnVmvXrwuLUouAD6xpebGGNi1p7F9njBzbqna9spOwwicDlmmdWziTY
         ZNiXPbiR7CzDwC/rnUVO+NE1VJNJs3RyjkbAGdQawLlojGjTuVCHXSSU3wbYsTtP9Khd
         8RLXKNRQclL8RDmftOAOCsLwdOiBWIm+V6TaD5IDPM3sKX37Ko0s0SwxwAGL01BeGaoh
         FtEwUeB9euhPEfm9da1GILhPdogfd/iNSzTXFLSJaM+0igWRhbinHOA5Hl/hi6lKGuoe
         zA/IyKLseEOtrh5s6wBj20Q7Bqe26wEVdYZoIRdGwo7O/baO3nKs9elKFchHE9sFchqO
         4kWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791237854; x=1791842654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
        b=rgJQptSp/5lQbMC4IAeUZp21Nq8XNL1OauJhINU/5TD2ClLBvu3L/rCA5ellOgiTes
         U/ZWx+0rfJqnHnl4L//q0nNVUwqHQHIyeTb+sdd+9LLYkRsOFuraogGW8V5wrE8c51cM
         urXTHQg8JVDjvdzBOi9Tv3PZiDQaqryCi6pA5R8sYy9DfgLx2iFe9WL4FNnZzy3PPqST
         qPx9y9tKkJkYxkyxyjE1rEX5KGWph3fbmXdlJCFQhoANfJtk8VGRYpoSIuidg99m9QuK
         F4xn1FuXwLSfbnuHpTz8Kl5488H6aVgs9ZaXI4iFXfX2mtowMsY+VVziB0TtdO42NI99
         ctaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237854; x=1791842654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCErEo1wEmMk+mf7jU8H4RsXealnJyQ44fgkbs7wqm4=;
        b=GGJlP6iTwzL/m54P48ls+0wrIJ99i9anhPNZmaD/EnNBWj20gXSXUB3KX8Fa2miL6d
         OxF/4k+xvjMkq1sqwHqA5NSK6oKeL0VOLfuF9l6oXrmQFOwIzD6eRORTHPSX5iIMKWxe
         8VD+QtBpI/VcMlS9Ibg8CO5tcLNe6PpnIPGSMzpYfnIdnS6yfrqH+lfEOeIq55Iki1el
         lAxa8D9PhmA7/xMDpr3PHhm8eRNRiwhzY8P4qOSV/OOn31wb29648P7x/CEtvNA5HbmU
         C6Ektpign6UB7+OgqcUNjMaHddene4gDL3KMxWg5kr6vocDIxki97D0zTxKf5Phd3O5t
         A6eA==
X-Forwarded-Encrypted: i=1; AKwUvBzEYT+9jPfR3ZVwbd5AiZj8rBXM3LOLbjLltdFJv2ndcYrAIqz/Ogc1BBwGEj3UVMJtpr5UVsStveHllEk=@vger.kernel.org
X-Gm-Message-State: AFuF++mkR/Keg+zkBXshOYKnQQa7DQiTebaylJEmhFCfiUi6aQmGNvYJ
	kdhODUw/phwQpfMaEorxqhiDpCrCM5zy5lgdW7UCJDkV11yZROXNlzR3Zvs0UqVPmfuQSkookSG
	+VTnYYhmlwDMfjgmjF8G2SILTckrKE8A=
X-Gm-Gg: AYBFou3k+/ev+YcUY0dPk7VaAegs4rxG8A76wTSxPiKB+t7BdzzDX0smq4T4WZ6/ifZ
	9zTHSKhqI2ypXwd+gL1htQsmnHISHvVdYmKNP+i7DkU1SxTWn8KZHOXyaf8Lrk7cF9YmFKsidSL
	iEfl/QG6WpWJc2zEW+Z9cI2Lg3PLE26TbU+lB/O0cqRdB7Fs17Ok32wEChAs4/eAhO2Lr4voNDP
	HIos+zjDDL/Q73o9BJswIcUbIoX/2JEaBcFIeZyeOrz1zGfxwMfJ/QpuBpJ2jYh17OpI/io7odh
	y8AX1Zc3YDatAgisjQ5yfDezj1gIST2MkrysKq5GZbNusdRNRsbhWpjMFA==
X-Received: by 2002:a17:907:3e29:b0:c2e:19b1:dfe2 with SMTP id
 a640c23a62f3a-c2e4ad3b1cemr1046003766b.23.1791237854529; Mon, 05 Oct 2026
 15:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org> <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
 <20261005144432.580daa2f@kernel.org>
In-Reply-To: <20261005144432.580daa2f@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 06:04:02 +0800
X-Gm-Features: AclHuK8_KLwVxsmgUNUhSrq19BEwBKrpkwc4LlinlPX0y7uVYSSqgvZVvQtFu6E
Message-ID: <CALj3r0jNFss4RqdPjJ+NJ=yPRm7zZA0N83T2XxqLuFwoH6iN7g@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 05:44=E5=86=99=E9=81=93=EF=BC=9A
>
> Well, the patch series is already getting stuck because of
> cross-subsystem acks. Do what you will, I have 700+ patches
> to look at right now :/

Hi Jakub,

Understood. I'll split it as Vinod suggested: PHY binding+driver to
linux-phy, DTS to linux-rockchip, and repost the remaining net-next
patches separately.

One request: could you prioritize picking the stmmac lifetime fix
(patch 01) if possible? I will send it separately.

Sorry for the noise.
