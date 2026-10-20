Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500560;
	b=ofEyHQTiMZ1NLXPkvy3gN4FDY8sHudygGk3fuxpYfUnfsfks04dD0sFrdJur3tjPH+bG
	 U/m2hDLO97I7+WpTNm0+7ksn7Jan5mETmajgYxbwGgTbpbc4Hra1M7kHpzP2wgjhTNjb2
	 kmSasJvSVCTVJSOuQRUQjbFGaUFMiBgZMzcYeNKg12tDBqbabKFGSF/Y4j/9+UWouDhWq
	 TcGOowfTlLGXAsjRDAvvXwQYwVS3fHbMD9DMxNUgaqmFVBhzaOoqXqYPUbrPPZJc67vcs
	 bqH6zFqbksmhBSgBoxxdvn0XhMnQU8gzNmdyCsM0zfx6JAn44bnGvNQct7pDM0H1s8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CqnJR5Wud1DAN6Fg9Q8koGamno6KsLilMYisqlHxAoA=;
	b=Q0/s094ODDjNgyshZwtqYiqEmUkxUZ1x1GjCCrcosSh1KkdqDcIzJJTFCEetMxFw6W6y
	 PC+2BBk3+2KXuUgOeU6/MclqofFSS20L3tZBGKNNaj0piHJOi5TK1Zj69OyS2Q+gKTkFr
	 G60oZs+AHjUghfZqN5oB76hYEBwU4OPd0c74g35prJxW2UuWjkMHmuXCNw+QNvkAp4mw3
	 CtFgN5sSfIooJT8syObDLfbl5YoEFrZcbKC++9EWsmPpjtyJuOUlXP50QUUuXdptZV8fl
	 rv6Vc7LUbCibdRJsO35l7DoIij4utf4ky52ve7Q7FPBEEN+EpqELcMBeLCE1QtBgjUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=zVsNfsCP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62F9606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=zVsNfsCP
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso2334393a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500554; cv=none;
        d=google.com; s=arc-20260327;
        b=rraN0MbK0X0/JH+MqdOSqU5DF9jdc/Bj3JncyIdBqDxzJn9mTgIxdzDWrG+c4ATgQT
         pPnitCi43oGM0GZmgZ38Pu8xNgNKGHIRFh0iZ1o1IlYeq8sMsLnPiVpUCr/lC9c5+kld
         v7e6twNqt8GgH9R3eE0SLfASoKY+wsPlkOYv6DwKi5X2yvpKTrHXzhGVbx286/FpyHfk
         ygtfPmpbXUUs6d3n7TVll6ZVubM0nsJWs8KVQPc6d56+viX7VdpAJvPSxJjyC0mdrdkG
         Nl+2ZKzD0sQTVaz3NIj0J2SSgtWkryfB4gYmRDgfnVe6Qf6CPkMNLOzsanKVe85zMZGc
         IL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CqnJR5Wud1DAN6Fg9Q8koGamno6KsLilMYisqlHxAoA=;
        fh=q8YXGeKI8ZZuXxCN9rL5SELdkf8F7GlSYNTmlgcEMSc=;
        b=A4qQGFGXkza9E/zGMiDut3zSOqs+B4AlDaX/eUepXB8RnF57PPMhWgfevpciLMRkXY
         DakYS/2Ek/6BSuVhepSwMmetzVOqapwF4wXfJ6whPIVqwK2Hl8G63KuznKk5rAybVOG7
         uWMoRUTzy9h16wTF+3NJ/QmIzUYMttPs/sc9nixAtYr/b7roCUCPAzWI8rqNyo86d8zw
         XEVeHp4Ac9BXvc0z0A+Soj4Xk3ROxxPNmLrxXQQo96jgLSN4kyhIC83YVSdM+vzoKFeq
         x1vmjya31vb6vLZHy+RXSephB/Ulz005qXZJ3QbYK7EAvt80iKT1a12oB6uDvnUl+Z6Y
         qJtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792500554; x=1793105354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CqnJR5Wud1DAN6Fg9Q8koGamno6KsLilMYisqlHxAoA=;
        b=zVsNfsCPZBw+Ri9Xsl9wXoJgEf/7Sp1i5cuA+AIHozLkCdfMyG2Y9C5MyYzCFflNI1
         6125FjHNDCyTMFbq2bJThVOhmiiZPwysz7oK87DP6I2n94+OMe1wY/D8Nlcx++4Sn/z/
         6gzXkT+egtst+XZqZzak3H1NWz/2TCVNNnGouMW9VyiAGB7DDSWXXKbC6MfRSzExb0V7
         uT0aZ/CXgHP+97p74wan3UJk/kiUNTlAtFaUE0pcDCNNBopsRqxA3/4WLHK7VBSK91Pg
         cTuOUzsfdFwbyY67l3gDHf0H6K1MPvrHxExlepovoXZAkMFEtT5SVx1uOSfUe3OCkCLJ
         X2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500554; x=1793105354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqnJR5Wud1DAN6Fg9Q8koGamno6KsLilMYisqlHxAoA=;
        b=MCP/nRhmIixpbRqbRS9Q2XxsZwqDrKKsj3HVk1vkJWV51jz1bPxVNofqfgd1PicuC2
         ni55BVSkDupnxpbF+c+E2OyIcvb/ewkh5w3WHUilxNhLIqrYxZ0STs6OvSXhsApQ271K
         aAKfBrvQQFnwEzraYXzXmgWEvinbjhbMvom1A95wTqO+CoJXbxl8lrgSH19tY7UlsXX4
         02d13BazY6tJRxl3NfLhJzT8cgtKK9iDhCirmrASlPRMnp3qSyovQBmftC5zGsouJbiq
         v2ynEfc32MltdMrd+r3NoHQ5NOsK6AWqweuuyVT8cF5iEJfyMn3twyp/JMO3BT9+nEMw
         EOqg==
X-Forwarded-Encrypted: i=1; AKwUvByuC3Njjwuw49FlNpZxfBPQu4kv7oz3sgMujNsdjLm2a2iTRmGw1FIuUqsdjdtHTbTmW6yCG6eEVsiquP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ51t0Ij25iccFOMXz9Ejw4iIjvfHHFa0U1/M7oIwlZovzRuBdR
	TDwN4Z8G5j73srJQKyQQhkMZBlbCj58/QotL+ueGe2PDoZj+xtQTuyuyiolXvDurx9+S2d+dxYe
	/BTToc26DIrzuLNFCOz+2gI5y2JYG8NTKGEqb8x3ZIg==
X-Gm-Gg: AYBFou0RySamYXhI/g0de8Uuv/N4uCw92j8q4NLfKsWKjSqg+mFyHk/n0A/LIKNX+Za
	gnqiBkDsmnAYt4zuVpNdYVvy2p+n6AbYOO9+unh1/tW0He8jmj0eQTU7obwkoOrgoLFExjskAWf
	9IvC09Q2M42HU8zHBXB6sAaYG3g6VWLpeI6UOVxhttp2brESMwpdW3P/S6p7YLUEq/o4spjt0i/
	8TWXtt9DirUB2pu75QhBxOJwU5Ni+vgORBI6HX7YfX9RuBVKrpVCFeAa61A2Io5Hd3R6RTuPwAp
	srS1CkvBvBbwF5lBMc/H9Xnrvt0sOi+KvDL3MlrxUpGOmea+uQLA4AxhdPbe8h4Yv9dLpPa0BND
	Ipe9o0GM1IrpnaOuT7lPuw3iNDJQIJBFNCIuhgeL5XtaL
X-Received: by 2002:a17:90a:da87:b0:3ab:36c4:b502 with SMTP id
 98e67ed59e1d1-3acef19656fmr9756442a91.30.1792500554208; Tue, 20 Oct 2026
 05:49:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020093655.344585-1-robert.marko@sartura.hr>
 <20261020093655.344585-2-robert.marko@sartura.hr> <554ff2eb-af27-434f-be62-17246c7a302a@lunn.ch>
In-Reply-To: <554ff2eb-af27-434f-be62-17246c7a302a@lunn.ch>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 20 Oct 2026 14:49:01 +0200
X-Gm-Features: AclHuK_rohgS66giciekkFEQ6V1rvibGJWMBWALaApFMciIq_wE3KnKfDINfbIc
Message-ID: <CA+HBbNF7DKkwu9X2=cykc1brHLmVnbYJe2VqbOH71S3sULu57A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/5] net: phy: mxl-gpy: add MxL86211C VDDP supply
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lxu@maxlinear.com, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, lgirdwood@gmail.com, broonie@kernel.org, 
	michael@walle.cc, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lrosu@maxlinear.com, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:39=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/* Packet Manager Control */
> > +#define VSPEC1_PM_CTRL               0x0c
> > +#define VSPEC1_PM_CTRL_MDIO_VOL      BIT(14)
>
> Is this Packet or Power?

The datasheet calls it Packet Manager Control.

Regards,
Robert
>
>         Andrew



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
