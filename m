Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794687322;
	b=JeqG6232onxF6+cTpySnnwqFqrYnwEmMuLfvknDLBrS47V5w7yTc0HjqH06st2yS5xAo
	 43JvuxTSgkU76iUEFgFWp2Z9nJY5PmlrA0Hotc4raMzq2TVF1lEN0OQt34V9Xsgi5Vu2n
	 jVGjBjcZiV+hkSVTTblknWI5qC+hmgkJD5KCm2gKQzjQqqsW1wef6rzorrLJWt5Uc2Ud9
	 2EsVW9iW9XGGHzlw9y3PVDRQ1TWGqNPsCtr9/TJoMLwNXTOkXy/Jfh65PtpRcq6CE2mbV
	 RCNglDxmhFpOEYKEitaAQzwTID3URw5g/p68H63Eskx+z5PvOOA1xjGAPNIzzD74lVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ejc0GeuWfZihrPmJAaj9/vl2gi1/D49AtBOnW2jsbLY=;
	b=X6I3YzUYdPS29Lt2rbd++H2Lb8Sir5uhQsw0velrV/fMuquFW9nYuqbfT8+DtdltjLsH
	 px2Xn9OxaQsTP0anh+MhiTd/ZQJ8cT1rUeZOeX/fQIRfiVQw5M2mL9MGFI00fLjgyYQ2T
	 +oodd/X++QomhojB0DK0VRTEOjKawblnwjak1E/HYpWwUcVPYHVIcANmxnMsSGV+bASY8
	 KgGbOamXWjBbjHtk7NZqTKG5m1+K2imFmwRHvrlizEBArt0yjdJYbRkqxLqOBFurtYSPB
	 nloDUktoUW8j9uDIFzaQpcJ5A1iqqeNEohsRGfkdYEEv1k2Hhqc36SY3I3L06HRCLxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSr20zQl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC17B606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC17B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSr20zQl
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c505186727fso412422766b.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:15:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794687320; cv=none;
        d=google.com; s=arc-20260327;
        b=e5e8SgGN18cYk11NYtl2BbKB8txQCjhLjmfmYihSXldMKeEpChaNF2t9mo+XhX50+t
         kEZAPyaYh12q+tGSaEMdn0+KijmFvJTmJla2fb77MRtimLUMSmrFpao7fFQ1SMdT4YYs
         Cq6JIFLbzk4EsbHyuekMNaVvLH2BlSLPhG8aCME5EDFRBTpvNzcv34rrDq7zDMIX5ZEv
         Zny9dZGiAepPTsCyHL7IQSjDMlcTuV3+WgkMlojZHezVlgEqLlme3wEPK4B0iDGTbmOZ
         M9Bl+3ZUpqkrCS+wuSqsccSL7E9KzwNfsWnEl2fq1lFZtHt8IN00ypnLDL8SUCx/DqWv
         skXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ejc0GeuWfZihrPmJAaj9/vl2gi1/D49AtBOnW2jsbLY=;
        fh=zbnj5HaYOscc4aZtxbpvXe4ynm5h9wj3g1h0Feagemo=;
        b=O4tuRvFE/PVvv2WKu+6LwmKcBxTVm8tzOg8cVHRuxzJM7jDoJCyCaWW7ItRHaoEqns
         Fp85FFP1nSYCEN6kWZ/L9ZbnQOeZFa0rpsBle0dMJq3gsb9ZmlJfUywc8Y9q9+ctUtKI
         hfM5M/fb302AV2UpA9EpF/KgGzkgw6eBHIMYLTgWB9iTpgQjrbYqe+9rA+m1uTNhL3dg
         UKbFDXDxRZKDCchbhLmpjHlp375UkZgGGU1OCQGVsj4FoJQ2WI0lFn4iEdpzhfUYRzIt
         V4ZiaSwt/F4ghg9UQOBGLdk4q2+/3pBFtpkQJ9OyUxvw1T0aBHlVmkVQklaTS8MFJOFs
         t9bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794687320; x=1795292120; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ejc0GeuWfZihrPmJAaj9/vl2gi1/D49AtBOnW2jsbLY=;
        b=pSr20zQlFC1iP9Xux+Kp48qHdN9EmWCayxfgp/nuXUmY9wM3NYVv+o9yf1bHBgg/Ej
         I1Xfe3CgY8UjbjrUXo2AUqfvVHKrrLS4KYAa+ZwFUWWCMGlxcTW24QesIQfjragWT9gg
         6Txy6z0NDITzrhIlWOQORFqMkmf5PJJQaEdmFoVycBsmKpX8t/I6RXiRV47TSlLq5gZS
         1kIwjdfnFuerwlhVkDp2tqYlQSSDJMAiBFx3eK9OCuQREB8SUpznNYZUCxsLYDmbrA3g
         UUQmjIhXH+DtBsoPyiyKfF2t/j9qaorXqtAKYJc7fNBKWPstm1m/9tAVVquP5l8Lg6Om
         aDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687320; x=1795292120;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ejc0GeuWfZihrPmJAaj9/vl2gi1/D49AtBOnW2jsbLY=;
        b=OCb4E3CDCj26uhGpC3rYcmJ3Pc+2frHfJsg/wA9zpjnkwKUMletTz4Ygtdjcmdg4Vt
         SaG6H7tSmJ/db4ReO6yUdwfI4RAy4CGX2CUS7Ry4knIMQTUOf51xBOnr2H3JQR2M2hk4
         DWE26/gGUhoas1IKcwLGnut8O/nGZsMHpCsQwMJhvXybU0KBmNFzxQ7RU1zmXwRBW3lE
         j+4m+/aclCUcGEryv0JskcSRZRFlFVHTudP3JGBHd+CsBpKzA/YOrB5D3l8LQmrRAYcu
         Htryh0cCe+hyoLQXiI7uVhlWdHDD5EwFm1lKwxcmxRaEosmfVNhQXz9QZ7FJ2jvekRHJ
         bgmA==
X-Forwarded-Encrypted: i=1; AL+hErEfT+O9YSzZvpGWsv9vGyvdOnTUc901aKOWtr0/m0u6fppvSO9wagaK2Ou8aIY6Q/nbH7/PYSayO45Nq8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7QsWitXR0FFhWqor9Wy7103OJM+Z/DO1GQxF823yHJb2xUQZ0
	6z3uX116wYFPy08ts020fa3itnyZUhjgzfqLWiKwyyRjK3UEGBZ98SWZ7EEj+MxazgSLE8VPNSM
	9IvTTlNGEQQLgrJLg3xi1o3VxIaL3ExA=
X-Gm-Gg: AYBFou2FVr5JaAKqCo/uCB6LlTZ5+aNY5guld6gNapxfYE75l5XTm/cQJDu7bdzKxZM
	TSLiLn+hIoTYInf9shvM7Y5ej6x4e/KAJOqn96zNjAN1VM9J/7WcsTzxNGUrIMZD6/xyz0xvs+R
	l9uIF3riJpaFVVKwHhvEHRgLcb4K1AeDZ60rnXRSLyUIKre8It7gWsSXubE9UTesbTdg5i8WSlx
	RytpjIffU8H1uXuxQqZaYs4piVln/RklCA0H1NSYbKVefNINyAjX0T652lTMDnyAvsKmG+RgJoz
	Zen0KD8wy/oyZNetc+loFV9uz+4r1yknGPRJiyA159RHLp9oHynatDjlCitteDF8N6w6PMk8Bve
	FQvMRaVvbiFgCVRI6fb3eFGmw6jOxGnHqOe+I
X-Received: by 2002:a17:907:3e83:b0:c3f:d912:ff8e with SMTP id
 a640c23a62f3a-c5096325a84mr517546866b.16.1794687319796; Sat, 14 Nov 2026
 12:15:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de>
 <20261112-rtl8365mb-dcb-ingress-v2-7-f8e6fbdf8c99@pengutronix.de> <CAD++jL=k8qb+Z3gpvbAZdf7sSqeV3QKZ+vgY-Qxj__vxrX3cfw@mail.gmail.com>
In-Reply-To: <CAD++jL=k8qb+Z3gpvbAZdf7sSqeV3QKZ+vgY-Qxj__vxrX3cfw@mail.gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:15:07 -0300
X-Gm-Features: AclHuK_6rjgfRpTtCjZ6KS5XO-9DuMHYibPlgy8wMhfBLBIgW176Gb8iFLvkORA
Message-ID: <CAJq09z62DpYe0totGrR4dv-o8_1MwK2LQzyXnm+E6hxcYoMOvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 07/10] net: dsa: realtek: rtl8365mb: add QoS
 baseline and DCB default prio
To: Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> > Add a shared rtl83xx-qos.c layer and the rtl8365mb backend behind it.
> > The backend programs the QoS classification tables and one
> > priority-to-queue table at setup instead of leaving them at their reset
> > state, and offloads the DCB default priority.
> >
> > The switch classifies traffic by the port default, by PCP and by DSCP.
> > Each source numbers its values on its own scale. Use the IEEE 802.1Q
> > traffic types as the meaning of the switch's 3-bit internal priority,
> > and map every source onto them. Best Effort then outranks Background,
> > instead of following the raw PCP number.
> >
> > Keep the driver-independent dcbnl handling and the ieee8021q priority
> > conversions in rtl83xx-qos.c. That layer programs the chip only through the
> > realtek_ops qos_* callbacks, so other realtek DSA backends can share one
> > dcbnl implementation and only program their own chip registers.
> >
> > The baseline trusts only the port default. PCP and DSCP stay untrusted;
> > classification by PCP or DSCP starts only once the port trusts it
> > through dcb apptrust, offloaded by "net: dsa: realtek: rtl8365mb:
> > offload DCB apptrust".
> >
> > Every port in use defaults to Best Effort, so all classified traffic
> > takes one egress queue.
> >
> > Select NET_IEEE8021Q_HELPERS from NET_DSA_REALTEK, but not DCB. The new
> > code calls no DCB-core function, and DSA installs the dcbnl ops only
> > when CONFIG_DCB is set. The QoS baseline is programmed either way.
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
