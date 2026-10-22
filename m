Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792689143;
	b=LMLfP8ED5oPVywZLeJIrE+u2zprAxqy95dG4fID+TPOIIo7YvG+Pigm73RD8vf+WUf+M
	 HLjK6fnvKLGVZfxAADwoX25b18HOC9ihpqZqvFgG87aS90dP1BpU9RSkj5dki/3zK6SuZ
	 InpQDde/hUKYtNvhUMsh80lNKOm7W8VdpA8+KI9DU9ztFOffnBpe1CCajAkha7AUTIq/Z
	 +rpgHuieHqL2Me97fUKocLUT3tUEadoMAoLqE1fgukxycWUhm9dmS+kMCb0zXbxsJAQn0
	 jhWrbZZPF97F0VEitmsKjOQHooz9k9vEnFfq1mS5r74ThcDxNf2pwVBGPh+9b+p5Adw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
	b=PRpdNlovenWOMZu4MVXrX84XCEiDK39pspbQvN//d9xeF2Xl0qZDJNazLoiOdWs6W+TZ
	 ZN/PqIm9Nf7mptVwQKXZAtE18P326/WIg0zlj+cw1bODSyYbKZAzS7BOjxySTdTkpK9Bq
	 O8NZc2BFvjJR+wYLSzaQZi4DdaqBpBnxV17lqM88A94VEhsrlVID3zXLltDGTwOhXRsil
	 8TGO5qHCLdkQJs7o+G9XWzWYkZyfY8cnmdXNm4cv80wBC0U7q3z9BSXUwfj8MOyhLAz7u
	 9ElwUWexzAC5EvRfb+MwtA0jnL0HiVcwvdrTbSgIND1Hpjdob04LnMYQJXbrqiOyDpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RRsdoMC4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.131
Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E486C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E486C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RRsdoMC4
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c3e0e38c8c2so777166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792689141; cv=none;
        d=google.com; s=arc-20260327;
        b=NmKZVkW9W3Ij6e7NeIHyQxPnPIritjmfqPw0Nf0ubreJid5HtVZAuIRe6135KXrH4Z
         LDgG46Y+rdAz9ib7PuCD0sDQ16PvifZnUYGUBz5JC5yMSah29nzF8A8GlImpDe07zbRU
         u3KFpVgBnqmAGLNcNiNlzZVjNDEQid9uITDPoxyM/4Tr6yIEuf7go85n5RfNN3QKenDO
         WNaYCPjbKBFFgNnUrilh2a4LXD0D0vet2kHaKGNHM215Es4WlWiOfmlzdvvmToUDBnRF
         DB6uoRdMJnDFDX1zOwWwhx/POwPrpQ2d/xVYfu9BU0aQ8LvR6qohmttPro3qKcZvLQ8F
         MsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
        fh=vThx19hdvw7t3E/a2FeI/l7CqioTy/UVWih+VeOq01k=;
        b=TCD15L6jHNZzzgZwqMXrQQ5D3RKjoM8N8ksDIf2mX+10hRlJSAXAAuocYk+bT83fs5
         rPcUZHU34Ft1JQLBiFtxsWLzlSpH8N+s55dT2j5rNBIKCnLdu70zgeATiE58gRygzPQ3
         CBSipkJI/UUHmSeYWmffI1HDu691ovDyxzvOqYtaFwuVSuDvArHJVslfqAu/gkokbc+r
         9j/GYC/KXhyslR8aMkbjvHD+UwNw2FmOq3CbkZ3Q167sOUyjnev6Auda8Q8nXm2svSD3
         dlWeb7tjBbJnKY4sedendvSv+EPZprZFzJVj5Rx/XHP2Mz6PFaM5uyHZG4o2BbeUlWFW
         oq1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792689141; x=1793293941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
        b=RRsdoMC4w6FJhYM7da1YZGYH+aI7aUNA6hb0JJyxgACKGqJQPURvwxkRxFil4ma7Ku
         +DuxaHMAPxbnSrT+hFH1YTS/fY3rl4rTWtt5YpBZ63/Lgrm0V/AR3+T+9mwDQPuMHm+V
         BaXurUbGbIXrlNGzjov/ItXYqf1LgJMTgtrm1uleBFlopLYuqhOwXBS7joz1BXGDNAIM
         JhFoY/y5XxJz3kyn3nKrHje70rTKkMo5ve40ovAnZQbQk1s1iRyOZRUJ8GL2PBuj4sn8
         7ib+fgGOchAPXyq59g4fwhX2ObS/Q3yD7EQcszramjKqUKn0dc7wn6UFI7RYUdsOyPey
         RszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689141; x=1793293941;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
        b=Qh1NOnSWFIO4jkJDfuocjE3JWEGBk0PSe2wqKCvWlSV56wl1th3gad1KxNJsgYICdq
         WSAkkQ5nHXk/0Gxn/UfGgZI1NbLAPkFdr9KuTq/u6mwHgH0vG9xZ1ZTKz0E54im3qibr
         jUYDJI8SiB84w3P7eVA412M2FolulQEeXsTg24Cdj763WI95EwQ1Exo+TMsGrIvcdH8g
         0yKdKGhDdJxGwzCetwc0M5UVgDfT8w1gQMklU69wat9FoB82bHp42oSWrkbJmrOOU5eD
         HUzcRJ/L0YqvBIexv9IQJxeTQEhCu7LtjqvvzsFnDMBIR+HeOlmKJi9bVpBnSVCcC1PC
         K34Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqNg7szLPKWZBYrCnumdOzKmNihdm5FjiS3+rcMsFBdUCyigkCX6xMsNouDNJJxtDxASOgBoLRFf2yo/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBzvIjyQcYPOgVoalHTqfOpNdXhgo2zFWwru/NxFKkOoU+jhmj
	eWeaOCCb1lvXkET7N1iN7sgb5+MkUNnXPg/iXyEJtBkXWlr7xMiE29MJ2ydrZDbVkaLkX20qV65
	5ptl+07/4A4qLcBWLHRWdjWjhk56u25Y=
X-Gm-Gg: AYBFou3UeBIJ4dZiAFJvUtNoJmfgDsZcQPFzEkQld4OhldZzTIXL4CZjPJu4m582pNy
	lNCZ+Yf+/Fpi3dCflL/KEkNkBCE7EqirBgmeVUkV/k/iBXC+7QCG8tmkLQKxHa3OYSIGzM0ntSb
	Cu+TbsyWsf7bhpJ8f0VOlTiD5s5GrFKxJqVF3tepwPA9M2a3NKNpqRWZ3UjyxK2qpoKolTRUdwS
	wJhG3vyoFkv4xU3+wXd84137n1jUXUKL9BzSAcrB4Zhweu4Ml3CU+nMU+q1bpNuSBLRmqxq6DKU
	saRMgDawUBpWZ4xm6iVwqf4Ly+q0WnRrWNZ9p4EDBqtJ/MAFp9zhD7Y3v4YWtQa+it+VySMTa13
	KFwPe66sDsxMOSCk7lrZOgqXYZKj9ocLdfQYra3j6KGOWJBOGWVisQC8bVrwq
X-Received: by 2002:a17:907:1c95:b0:c26:19de:9aec with SMTP id
 a640c23a62f3a-c4679b577d3mr599686166b.43.1792689140926; Thu, 22 Oct 2026
 10:12:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022025844.150320-1-coiaprant@gmail.com> <20261022025844.150320-4-coiaprant@gmail.com>
 <e7f68299-1c0d-4b0f-948b-4835086c0df8@lunn.ch>
In-Reply-To: <e7f68299-1c0d-4b0f-948b-4835086c0df8@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 23 Oct 2026 01:12:07 +0800
X-Gm-Features: AclHuK9Aw-1KGTe0rcDr7TiLvHCZz-VKOsYzCIMnUV4-DQLpiOO8Gle6TTGKUh8
Message-ID: <CALj3r0gMA45HG2khs2SyehftU5KAHR5i7__CKXSZR8GSE1Q19A@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable
 SGMII LAN port
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B410=E6=9C=8823=E6=97=A5=
=E5=91=A8=E4=BA=94 00:58=E5=86=99=E9=81=93=EF=BC=9A
>
> > +     sgmii_phy: ethernet-phy@3 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <0x3>;
> > +             max-speed =3D <1000>;
>
> Pointless. SGMII cannot do faster, so there is no need to limit it.
>
>         Andrew

Hi Andrew,

Right, SGMII tops out at 1000Mbps anyway. Dropping max-speed.

Coia
