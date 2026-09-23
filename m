Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163F651CF7E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167251; cv=pass; b=Z4BfD25yp/gf6cDXV+mL6YDVEnyPnMttLEI9UWPdj7pGOe4nmXZPuy2axpZleDZ/9Dg50OZZBwgwNlyKidap2sx6sc+WSYw2ipK9vi+izjN1AmC67nIeP8fNEz41v1yXawC0rOqgGrppv3U7IVSbS8DiYhBM64O/cIJSafbej7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167251; c=relaxed/simple;
	bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pA8RzDDGdk+NjOQ1rbukakh2whMjL/79GKf43JP6Nf5SQgsyg1Y8p7bNlplu6qJQn1A6jqQsP8AttK2zo/6SvtHfjS/nVTWg5V3+pg+4lUe69STLLe7k+fJmcQbur5gjwI/nNOsHUTCyuecg7RniPwO/d50TDsqg69PlNg1k6T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNVWlYwM; arc=pass smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNVWlYwM"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c1971f5efc3so48768166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790167245; cv=none;
        d=google.com; s=arc-20260327;
        b=LV7odR4eA2T7mpu/w2Npg0V6ldlyjeZ8fZGqUtDn11bVjVgTw7lnrSBiVPkldqm067
         wW1+TFUTrsFQ/jO+oj972bdhj6LxyE+h6klV2/LipoyL8Cz4TJxyQPBy9xqirIbbj4TD
         kqQKxxauRH6GZ49qzPgju6Cf9ceCf1Hgomprxw/7LBJI0VJcLZKjFWQnG9gLg+HkxOe+
         7zIPhMPHG4jVZgF0+gIm5x+89B7DpLNV7mpWMRb71Z5nT5B35s3Wgj1CcBJnSJ2tLKDK
         oDJP/Aj8abNj6niXFc+47qg9saEQ3FMT9cxMVjaxjjmLehGZ6vB/LJHIZDJ/hwDnXDCQ
         m8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        fh=Wng4bFrvSnElKte9J9rSfnGHEnrfsBRrtg8JrIDkx1c=;
        b=baUtrF1QpTcc/pDnPxBYXaHZZ/4oGLzhb/MxfWR426fW8xs1FPKHZN0BDIwVEgE49U
         QFXcxbmq6qI3CvfY8LIw69Ef9z489nUlzpnMjwSOUzvidX7ndF0mHEWrpu5q+VRREpuh
         iig5H7F9WQABM146ZCMwpz+D8GCCww8T86+7P5F/Wx4sumhDP2U9Yr6vv3uM1oTlHqCe
         U8ZQ1TEW17XDb3GTdLizjomHV0O/WK8+AGNG9HZmx9qQ7GvQmjCPfCCIyg64TuCDcqYN
         mcr3Pn4sFLB4A7rbe3CM5vmjexpRI8lY2Op856NfJttO41AbnpouemQx8oPxdBLULpuv
         O2pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790167245; x=1790772045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        b=mNVWlYwMzpZ6XdVh6gnhcylaxl51TIH99pMipEXYbsjdb6U3HyDy+7+Mux+yYlrY8n
         tAMNUR3OZJ2T4gS4BafREQ5OIUX179JKOOByjFTUWb8R5/hcungUbho65yJ4rV/SNOhP
         0ajiuf9kM2THHOfOP+UFYk0R0vS3RM3arQ3y/MaID/B9K1FSPa8TKjGBrYfgZniYWZ8Y
         WOBi9fi7Eem04EN4bjBeAa+WDy8b939piz+ce1gfpLa7MgQ/nRFJtIS/46LlwWKn7uca
         pALtLSEcy8N93BTGd2Vd9A/JGwiFYL4DGiLmkCbK3sCoDr14KK22yikj5r6/1s3poe+p
         AiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167245; x=1790772045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        b=DQ0LdWbLhW28UsCQ61fRE/8zaDL5ltdd2Q2c19KCH71tjA3jjo36ysqZloityBMBY9
         YlHH3z/fWP/btiF2spcjjd0WV2nEtxrNezuAKXyD6dUP30a6BW+ZaBboUroHhBmWdcH4
         P7WXtnzVEBMNp8EWUFmxU7Gapp9bfgOIYW4xa2pVG+lgi7rtDJf+KqedowhEoV5XYpfL
         1CHUX8pNWjxMfzWzaEaJhCxX+XwegKSRtxarpCSaJUkN+1r0EQUUPgDD6mhYWGErxhXL
         sq9rLUHYRRT2VEovmJdS/63GVt8BlEvO2/GJ5wSeQgxUxcX0YlsfOaJvDet7DedbbR2u
         AA2g==
X-Forwarded-Encrypted: i=1; AKwUvBzLe+eVokr7UaQNZu3jslnqdiSircYCCWsNeMetn2D78ya7sHsSWV8Cap31BUz3XpaXrqx9Md5v0VGB9H8=@vger.kernel.org
X-Gm-Message-State: AFuF++nn937fp3t3A2tfho95HInxkrdyF7Ud2QA9yx2R1eJGUkzGUOpA
	pKA+07GpgEWtD1+n0aXy2ss/ONhrzh7SRZEojXRYk4REJGRG5S7j6O/yTkkRGL4/J3u5WR5D0OD
	ncaGJ06ny7iMVWw2+C8+4uJrNo1qfm6c=
X-Gm-Gg: AYBFou2zGoxN2Y+cT5++f60K+0II7CfBCmfbzUqo5AKmJqnu6rRgndSi4QlcT8P9RqX
	U2qI/VIvzzZed4zfygAbTU5ZbAVRKAdAB3xzDukvb2Wfnfh09iw9CrN9wvPcIqJzqXt4Fo1Xsk+
	Z73qiF5oqEPZv8lPYzyZzGyhqisWmgIMaq+BMsb+DlUxy9gxSpB7KhapcenAz5ZX7BaeP49nwx3
	n1rkqOSvqHc5FnSv/C0HYvKkiGNO2QKxEzvDgzwEQWSALTMJ3IayGzJMcagO1onQ6jduEEWk8IN
	NlLachJL5LToG41jr4UnKxXF4tRvGEGTuGe+BZ1q9CzlWvCzAr1CXfbSkA==
X-Received: by 2002:a17:907:d91:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c2aadcf4484mr194861466b.3.1790167245181; Wed, 23 Sep 2026
 05:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922195006.79890f24@kernel.org>
In-Reply-To: <20260922195006.79890f24@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 20:40:33 +0800
X-Gm-Features: AclHuK-io9PS85iIjo2RRKD7nlxq4FY18LSW8xzP9gnGJLLZJesN4MppzV2qPUE
Message-ID: <CALj3r0hH6m7jUEweKMWGmCW9aOxShaqsV0E+z4ztBhXbJ+378w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 00/11] net: pcs: add basic support for RK3568 XPCS
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=89 10:50=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:24 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Please slow down with the reposts.
> Not more than 2 a week, and please wait for the AI review to finish
> and be published before you repost.

Understood, sorry for the noise. I'll keep reposts within the limit and
wait for the AI review to be published before reposting from now on.

Coia
