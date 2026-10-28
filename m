Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793181517;
	b=OBxdxR0/9/VH2RWP1ulNvwsdoISNJ1OWQj/2fgxV7AU6IrdNgLWQet8pBsa1CuLmmScV
	 HB1bamXotuSHt65fJu64TDYVZlRO/2YX5sHLsl9Zh1ijYVK7jFHPohzdxtKk5aX0fW6ZO
	 FbqNx+204tIsBLermIt8XRyB91L/hmGMeWiPpok1drBCMPcU5JoMbPa/HGTgPmAXFT7kH
	 qJU2pdzugRXsgwHbm5R/prEbrceKw+niK2n88hrYILH9t8PVRZ09pu2cwFtoFXm32M/ZV
	 PsP3jJc42DAJ5+Iw9U7JW9DgeHowB0svRMci95Q+BKnDUWlj9JtVzfEjFxHUqj7dmrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8iL3xBuCLUGHOr0laLgv9lVNTvVFhiaaWX6F5QYCURE=;
	b=iDIxSO/NHAFf07IkZiv7zskdMLJ5Jp17smKk8/NK2JD1sRL+ToSdTTiJ0HJTNYg+NtYk
	 mtlas9L/kNaxXNNQX2UlkddsqepdCknnwWT1g1o98NaouX/2R0Ci9JyXR+iCRQwmjeGKI
	 6G8gZ3Olo9Q2cdTgVQnvI3GmW7sDAwRxF1bBkchDMKOwSvFswhWR8vdFMw2LhWBrQw16/
	 9B1U/qWo7C2OKmplMOB5iH4f0NR53aRvliJsixoIlNHWLNyLxIeZKz1uKF7qPAsywgEX9
	 Iszefc0EC3LOIrL16PBWgg9X4N8JWAZKFpeM4429VS+ZUurOvcsPKdcZlcG0ed0ZX0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MNfRGB8W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E785606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E785606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MNfRGB8W
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8aea7b7ca0cso5645317b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181516; cv=none;
        d=google.com; s=arc-20260327;
        b=PELvr8/zMnrlutOa6IgO0e15VM/khOjKWz3DNaOZo7kEL8E5Oppq3TxHci66n4DAyF
         wzXUkb111bMMWEMbkWkfV6oR2qmCchLwr6k8LSX1EW+2ewmxaAB19hYmOUU5s9L74ymo
         MeB1gRoImVW/u5FQUhEM4GMjsHzserP551siTAJesDwxtzDWyfturVDNu2iNug6R/qy/
         BEPtwukGL637OQobvzgOTDKXMkFxCFBlEH9TIq+DcXo+1SrIvSFGK2G/cpmc5U7L0M4J
         TA4siv+7tjwNZxd44h9MF0tpGMHXw4qxe+Ne21xi08cGNR1UidyC2tJUnve6VcvWlxIw
         1Lxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8iL3xBuCLUGHOr0laLgv9lVNTvVFhiaaWX6F5QYCURE=;
        fh=RoymBu6Ysw8CvIvqlSAGLB1jfv9i20GjwWZ0Cs0auJ8=;
        b=NReB2IrgaUqFNeqMtnXXubLjuoY4+vW5UyTnGGS14boG/Vb+q0SSON9PoSBaFHE/Uj
         gp2paH49GsM/sirYVuuQ5G56hAwKpgrqZgdlxpuEqyzxlEZflNUdKA+FCeLmgdsJchll
         JdH5018FqOuMmK0ehG7t10Bitj29FcoQbkHsjIdk8foB56yA3sbcyBzR4+VQ+BuD/V9l
         vMyUo+cRIwKli37qJnJMSuTGp7CesHkP0kt6rWfveUs7OJ2YS/AOWzLJMI50zrMCx8Hf
         LkiXIGT2Yf7lrkHLj7L8IK9df5gqkZWeHIOWdcJKj56jPIU8ZJpcd5wAw9wRxB0okVf3
         8CVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181516; x=1793786316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8iL3xBuCLUGHOr0laLgv9lVNTvVFhiaaWX6F5QYCURE=;
        b=MNfRGB8WjgsnbQddruBkQbQap46egl4P62hZyl083tttW4bwNcxmisX11SNMOJUKr/
         O0hdC/YN6Dm4IL5PnRihGOTuD2yUkYMuIFI0ClqJ6dz7/yzsxRlZls5yDt61KgaVn2Wb
         PFj6Dbjd2UmBdlD1H2iQwvBOgDja7mtIWexAoHMNgBOZxRNI3o6j9g9mP3yYR0aE0vZP
         i/389bDRqI2qWiLbl31Hr93VKNVWxC9HDvPre6+qxknFCwlLcogIDQBDkG87l5RQ69Qu
         c1JeDoxMN2QKrP6gfP2TepfBcTmHiNE1LYGhtc03w9GHNGoqGGLokST0TtRtRt9Cu9Kf
         /ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181516; x=1793786316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8iL3xBuCLUGHOr0laLgv9lVNTvVFhiaaWX6F5QYCURE=;
        b=SKsSt6wqCgelejzRPwXw3MgWLnS14ub34HAcx2NHhZa4CioSb3de2YYpjdGUe+6DJ/
         Fwf1d5qOEvP62nf8JnAfR4S0IDl6M6iit69cWY1wKIcpTL8qIxub9CtCPXD5JowVQxik
         8WsvW823XnN+6nxyH5uhr40EjYT7MrHIybud/BVvSydTGWLQ0EsRBSgIPLtgQfFBSxJs
         VPaHWYHgQtc/Mk+E0Xo020Pmkre960yIzY4AwP5+ylGSlanyEuXzpMGL9hdtNPRLiAX/
         QrMDuOlT1iun5Q8jlTBq3XaqYFPf4gWrvbEIIiOy9LZN9r3PGM6sSrv6DTNnS9AGdOzN
         2p0w==
X-Forwarded-Encrypted: i=1; AKwUvBwIi+AHB8603E6I6xUy1cBoBPOBQR+TV+ezhXrLev+t8q/3RE5hd1HG+mNmQkOB/LDmOnqJJyvoHj7aiV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrpZO01vl6eRgZFExYEFMNvo4R2Uty81zgtom8s8Mn7lgE7b5H
	jugP4hGNZCMmvQvpX1fNnwat37mTS7/hbe3nc6ywBMBzTo0a6kCZIdcbYm07FtkaGps+yEtW0iY
	Bq9hT5R/6yqNCgCeRawNFkIzdtaT7WHQ=
X-Gm-Gg: AYBFou1vwGO6715RVwOSQ5Zmrt3kRm/WEYNdyGse2IUvg2sHLmFgnkUrrMi9tASLTxn
	cRNxU+UAKHHhIZ+twdfBjkpjszg+B9DVMatRiW9BrMYi+2MEOAueU1dIm1r8pEfbPeG5yV1wkWP
	b1MIKFjlOm18Vauj5EVnOk/jMKGZyAVKqksg4/KpTBJV9zAr0OWhHv5L8Fx6e9WiBKEf35oX+i3
	Fu43fI8irOELEQPwWdC5ez3vNASUtB4RuU0/ExcZHd+2SKzrKEGIUsKB8z0RscMs4/pqJ8Fq6qz
	Edni27ry9pK+czfDkU9BMZbxP0Ozg/L8Yg8N9wTNR+YZTD4OJOM52yfx2Df8g6VQFfEngVB0w9O
	f/E/ecSu3TCsDyHfIIGSf/mdlD5cwfaPo4oWnQGUeWpJLYN+edrl69yA55pVKebNz50X1Tkl/jv
	X4r34nibZN1wGH3eKK27J4RWNFLZWh4SEar9JCqvOZ/CFzqwNzwkw2F//gJDAP7Eope6tuP6vOX
	CU4
X-Received: by 2002:a05:690c:fd3:b0:8b0:a7d5:8592 with SMTP id
 00721157ae682-8b1b595a363mr12233987b3.7.1793181516411; Wed, 28 Oct 2026
 02:58:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com> <20261027202230.3539646-6-florian.fainelli@broadcom.com>
In-Reply-To: <20261027202230.3539646-6-florian.fainelli@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 28 Oct 2026 10:58:25 +0100
X-Gm-Features: AclHuK9Wu3Tn39aB_LH0camjx_DlDNxaxkN0UrceaNk9WSSmvziGqPcnpvmptdg
Message-ID: <CAOiHx==nHqXwjsmjH1vqiPZ+d12W9rKFOFarqhvhD5ukJb=xVQ@mail.gmail.com>
Subject: Re: [PATCH net 5/5] net: dsa: b53: use the correct override register
 2 Gbps bit
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:22=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> The IMP and per-port GMII override registers swap the override-enable and=
 2
> Gbps speed bits. Using the IMP speed bit on a GMII port clears its overri=
de
> enable and leaves any previous 2 Gbps selection intact. Select the speed
> bit alongside the register and enable bit so lower speeds clear the corre=
ct
> bit and 2 Gbps sets it.
>
> Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on for=
ced link")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
