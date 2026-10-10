Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6485B37CD33
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791672056; cv=pass; b=tw6G1DM3dPNe04PMJLbSZmvPLJTIY7ZK7d+b9BwsQmsCZYwhcBCqkZsFrFelPGZVQaMI4jLDHmmCiQgkvCsp7ms+OE7wYZbnIf43NfXa9N12vrIp+8V9B51tR+JSS9O3TQKZjP6bJcbHZs0WZJHHztIChR7zMzPgSVJJ7t8mLVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791672056; c=relaxed/simple;
	bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuVLhB9LYnq5Ss3BVbm6AZq3peM1v6yRk28XfPcRsMTUF79/rAO7oa0Rq68csjypDq1QikRPT54Aw7BoWV+eqmIq53Dv4humvuvbjYioosUR9f8RzDBXGhisB8Qgwg76KgVBe4Tkmp75Y2mb9Ds1gHtrWKQjfz41A2QoK7nfe80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=hTbDXvB+; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hTbDXvB+"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677d35fd1d2so656797d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791672053; cv=none;
        d=google.com; s=arc-20260327;
        b=nxMd13L9bVGcOpjQ9YH7qYwZbuM6U0DTY2TdygcoUAbX3yGkAHK6TOjwRqZxESqN59
         gal/FYf+XK8SCqIZoovONDIlm2kopWbZCY/vQ+u7ftOPVVdz4Est5FtaepE0dRu+FaLp
         huLinEjI2pOSLX5kOyBXbK0HYTBDGQ5hCp9AATCPKX3LOt+KREn6pJ1D2YUxBs929laV
         DJSwoe2kEbZ+ILSGLuuHn+TJLbJLzFsOnn92L+CVCk1yXFFg8tfX1hd88TFXQBZpLijP
         GYLzHtfy2Vkvn0UuaUY57lKqF70fQ48B894tJUTrQdMaxObnrL5LDxsCCJlyNQh9xf0b
         zXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        fh=j0na8JRcDvIaQABGte7Rqps+md1kfZO0Z9Cjwwguju4=;
        b=RLPw+7QCbDQjqsYql+Q1plrZjN/wwXmbCn6phvEdGb3hFY5aXmVOvVWFKKMNOFQgC4
         lo+H6O4epvqo0L5rNY0+kmRQ21zA9qAATwWDngxjHJv/V2uuOgn/C+xzjuKt9rE/OQee
         5lUEpWmpoDXgiiCuo9DK1iXzNa7eTdPj7dUT7TMkSuwNhf7LaxF49plxJH31yAucjn0u
         YIVLlU4wACKwalDkhWjDkyEcxgJ82RUogOt2Ci4ijzc+Qsr4cFH2h83c3NsBSO5r4EhO
         U3MVF9w91Z32FlTaVgzYqxhVJM+RJabPjFknNgTymmIxaFndKAWF4IYZZikQV6KzmRir
         Ht/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791672053; x=1792276853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        b=hTbDXvB+EroO1FpSn6zCPJhCbP3gFD8tCYQk6spnV04sD8P4ZB7CnAeyHnUWZY0brJ
         CCNyb+U8INcbxlctmvPP1Fbl6QShI5MLkUeZ7ilq1+Jm4jcXWXweJogVeYRJSMVH9vWA
         6dswFz9Har+uvJBV1NG4SDnf1ChzqAbMIrT01MvyOVt9oHrK+a8hpJrwsTYwlyT7kJ0Z
         lnUnFgGmqCa2VjrIWZtdwTu1iBtDOlq8hs6gQKKLJvIZwGEadEyALFWyPsZLUHEkVy/S
         9g2uf/C6Gaz288AxUS6rajoAcKVRYGRoFwC2bcKY+B90XfYhiOR+R7KRCrnNubF6KV6Y
         pqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791672053; x=1792276853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        b=RatqzR7/i+c8Ks1wLY92dStYR0gNLT0mczlTKBpT3D2H2nf/yT2V1K5dOG9aDw7lIx
         t44wn5zDU5S/CK/pKGW+e1lgfZ0UYvBqghUWYPc4fgmDRLtPg8KR8+Jnzcxu7zvbU4ob
         KEFRiyQQ/IRTvpdPAjDGphl+3j329wPhlMLeQ/3vbH429fUwAimWeuTjW3GwE7RuBLZy
         hd9TZddmg4Iqfpu8ILJWD2LtqsQ8jlB4j9qdDoQuwcjgEd2dDxF9X1aw6pY/rhaPzDmr
         MLP8xKka8kpAGNziyI9p2Au8vWDhfroTrSx1EpksangAGoA5jf3xELUQ03WdYtrBMEHD
         aJ9g==
X-Forwarded-Encrypted: i=1; AKwUvBwgUp+kgez3fZdSMvtWKx4kbbipRB5ONfBSe1oiDFqIWbe6SJ7Y918ghFuhSfELQh20v+1jaKSgWNhC810=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwTe/uu1e74u+dxgdpqHnML7AMwgkuJOLNlzhb5H2Lo+GlCdOk
	tuBpzDHjgH7EYciKrDLDh+poZq7agw/T6DInU/L3AjCFoJSKscN932VwciFGxVBYxuIkIgSkjrp
	s/cDMmeiejm+9GCdxnH2Ihzpvq3mI8oI=
X-Gm-Gg: AYBFou2LjR260YSVlY3D6sJyKK2jiZYmwLEk2I0wtY16kVYLeLQShf3PyKnVdTLiTGz
	a90BdYbIYroTtfvLUuPoR/ty7/d3ymKVeVVSvARQWxN6jG7Z5BF4MAmXnUxAgMk9uc/2Ib2KYEN
	kr3FoRQwVsOb8TMGJUVrHwXUJ//5LkvOSswKnJLYVEa0C9ACpQsutCmndkZQrPKb7bvikIsHf4e
	DeoHuopzCbT7Yye5Moxs5yJRDUAl+LkHQoSuJJIFVAj+zK4YdrW0EqMY2Q4RwPP9uZSrg68qVVG
	XZKaldfvt91v2/hJDcGozvA1c5rqyqXI1GXIoAjCptIGtObQK0bwcwtNYSCTS0HO5SMHThhIMXI
	y8Bn3gsfqyEL+
X-Received: by 2002:a05:690e:12cf:b0:667:e855:ecdb with SMTP id
 956f58d0204a3-67935edbdd4mr1914994d50.3.1791672053242; Sat, 10 Oct 2026
 15:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-4-tanure@linux.com>
In-Reply-To: <20261010105900.247342-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:40:42 +0200
X-Gm-Features: AclHuK8sus9eXHW8D0kCsjiICdQbyK-pql4xQRfUyDiKVkCN64EjzyryJR6PDrA
Message-ID: <CAFBinCCaAT8+YjSwg0=aFF8mbN=j-MQ=oWvfwUakVE8O-eu93Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
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

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The glue registers on the T7 are laid out exactly as the G12A ones, RX
> delay field included, so the T7 can reuse the G12A settings.
>
> What it does not share is how the controller reaches memory. That path
> runs through a pipeline stage with a gate of its own, and no other
> device has any use for that gate. Nothing claims it, so it is switched
> off as unused and a transfer that has started can never finish.
>
> Without that gate the controller cannot do DMA at all, so it is
> required rather than optional: a clear probe failure beats an
> undiagnosable hang later.
>
> Assisted-by: LLM
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
