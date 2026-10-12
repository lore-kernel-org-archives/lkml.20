Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E1C38C2A0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768643; cv=pass; b=opH4jX5Cc85d6aFV4NlzjpmGBYS2O9MDZOUCuxK/61pkMR4K9cAlbCYz2LQH6yb+1mg5Uv24XnCLPXgvXBLQogEK0egomnYONLoybeFb4bjwTfspeR8/A4/rt+HoJ9KDPr8GHTiNPc4m6TroeI/t8DFAcXdn4s/+4W/3cwNIOYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768643; c=relaxed/simple;
	bh=d1fEXq1Mkk4vkb58a3C48SM4t/4EvTl4q1MeMOc9GIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDhdgRHjq3Ce2FWkAjKwBaBPpNEq5U6Q1fKnJASsKDHbc6z2krjO29vyeoGImaG58wVhUoUlLTaPk4+M9FYqKOnOnmcGoVFDoyH8+awNg31X9EijgO2EVO19BQCo6QKfn4NV7FTn4u9HoEch6Yy3CCneK0Acm2aZOU807UB+w3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWbKhR8F; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWbKhR8F"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-49dd13a91d0so516886fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768639; cv=none;
        d=google.com; s=arc-20260327;
        b=UTKo/+GWIQvjUi3oI23570zuv6GOovzHcddRALDROhvAS3mFSq9egoVUHoprc1P/qP
         KRx3J5JDd2p1RXBCFHUQMqQr/jCUHwBxuSm9t4UyhPLRyB5PaQYG+p4+0O+VeltVSrtC
         K+9sTClu1AuloVR6CmrOMLbn5ilc6NFmtSkcKOV7dO+O9t/GLMDKYEmQdOMAI55wp3Is
         gA9sAR3z+pczvQCmQusIsqsTyQhWaXmUFgBaDncm0Dx5Jq5TT50zOXzvW01QHtk0DD+0
         hCk6mcexBm2GOPKNJwNSE/ZjJUTHXWfHX2/iwoE+Q3v/j+EQXy1F5e3mkPL1N+/z13y/
         BANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4eXsmhlclpfowQz5aqJOp7PZGMOX+eSHE8u7F7KW9Y=;
        fh=wxaJI26TnDO42DEzBrgesBxe3gFqhjVqnL7LwOafbv8=;
        b=XOx5yYtXEhDaDUEihhy8x/6W1ozW9LzYDY8T5U+BjOMe1SWHn4LOYB+Fyl43/hJUco
         3E/Ex+LrZ3oGOn36Dj+sSkzcnhC0G2DrhFrirAUvqq4yfv4RmgPCiow2wFxWRbpBoo41
         RVM8ifhLK6PPwZvhFi2vW2FkcCQogNKFEosJwgwMvDrTEJa/vcBKTcSMJUsIJZcLZFjx
         y1vMfptKCsLuk6gkFgx72fFDimvmSFAbK0njC/f8MjWnNeJofkHGaItn3m95PKcwyLxI
         AUIUJRTixmmdDdTw8tjcauwt+vmaNZCoYgSgOhRRw8ALqez8zqcyptcSrZXr1dZdClPl
         vxQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768639; x=1792373439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4eXsmhlclpfowQz5aqJOp7PZGMOX+eSHE8u7F7KW9Y=;
        b=QWbKhR8FC+ZA8ab/OyiZ3QAmVkJMbIp9ruiItLr0mmxhz8ZPZS1kktkeSM/iHwVFUH
         WPw7OQgUthwV6PTibwNzbvn+7WeI+soz9GIO+LQyIjlVCyR4lUL55KZOzOZtdeQXHNSM
         Q/fvnoRxJEdZ0tQyo3djUw2SWDxi0GajwLcBTsbWktFF5O7MambHhTsJTGhxNJli2Rjh
         5/TUsDU5l4kuRKTwwM6Ei1tzorYXmdACj5EJaNqC1TMqJwfUOsYBmmZIgKtMGsTqbCoe
         SIwqIAV+hK6W2wSrd6CdyCNKOLXYLDm5+tWexbzX4jFVmGOPiglwmWJRJMYMNVNXkqWA
         tULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768639; x=1792373439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4eXsmhlclpfowQz5aqJOp7PZGMOX+eSHE8u7F7KW9Y=;
        b=wuAFNfAR3u2ygVRfk8mYS+QGJG05ajoqkhUHLnGqLP5P3gUZbEnf3RUML8PSCRUMl+
         xoOv0qhHsOBsLSKa4dGgQ2rmocAIo+N8aHbrLoBiOjJUpkHUz2lVCe7VpiRUtAktE6qW
         YtOGu2+vH+tcP5Cz5W1Ffz1hRnvigDZC58SL5TpRuzUZPUZg/MrqHfNny2zDjqU8y3rN
         1Kcc4qeUMUE8AevIvEHu07hT+27yAYCUN7BcVjDO6ako3fjFEo9An11ioU2f//VPPgRJ
         MwdNsAS928EsSIhB/vOrdtTqLAImtUGxeHkCYGoBKqwdFVrwxVQJWU7pxpYqqqfEUFpH
         HCUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAQ1hhJ3yuPQPHT4NzUg0IV2JM8/hzbqg8Wd3lOrSKRcq2nRhZuDNn3UgCrPa3fRid8S64slfMI5tB3Gw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLa9xaPSBk6Ny+TYrUgzcvocjwRl0UeDD/JgwivsqakehPTneq
	2iPGgZ5BWSDmQb5G2BrQdoTT47QjpHPyQBOpPWnyXLuHCyNBS4kkYERpkRNY2iForjk5/0U4C8H
	dBdqqjawSCxWFsovL9KtejeRFVcvOs7g=
X-Gm-Gg: AYBFou0Apkmw1FQb4IVmyYk+dWxU7z/Qpx2e+xd1Tf7MQ7SgKLanKzWU9R8RGTbEJNu
	NO7zvd7DstnWJFPyXMhJ9+FrPLNiJ/GPNJ2tRZ1Q6ocTIvE+DYNrYsbDTDFMS1HQyfynZmK/b4z
	Yxg5cQIuaPpk75K4ZHNLDoisNQXAvrorfa5gGxWaMaz39FETe8BM7GmDVR3ArQjT/qMAqjh8rqt
	r0SretZQUh5UnXRVahCxPaNh85Yk9K6q6otEZ2/5EC7hgnr5p+LmAEnkLBp8vLDuik90fZ8ziH6
	QQBPe4UbqNb52BQgB+/G33cFBgt5TjMyj/AIofyVul+3+2zaeyMV7f0=
X-Received: by 2002:a05:6870:e2ce:b0:494:a2cf:8dce with SMTP id
 586e51a60fabf-4a2a870834cmr6526407fac.4.1791768639415; Sun, 11 Oct 2026
 18:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930172948.2901336-1-b-padhi@ti.com>
In-Reply-To: <20260930172948.2901336-1-b-padhi@ti.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:30:26 -0500
X-Gm-Features: AclHuK-lzcBr52y20tr2XLLyOQm2hH8-_1PyChxO-WGTtfJpSF8tAo9K4q3D4EQ
Message-ID: <CABb+yY1nPr0qBngbnmReKPbziNa6be7i4OJDdNut9V9eQTiAJA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for TDA54 variant secproxy controllers
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, afd@ti.com, u-kumar1@ti.com, linux-kernel@vger.kernel.org, 
	vigneshr@ti.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:30=E2=80=AFPM Beleswar Padhi <b-padhi@ti.com> wr=
ote:
>
> Add support for the secure proxy mailbox controller integrated in the
> MAIN voltage domain of the TI TDA54 SoC, which features up to 444
> threads with 60-byte messages per thread.
>
> Add a new compatible in dt-bindings and add the device data in the
> ti-msgmgr mbox driver for the same.
>
> Testing done:
>  - Build and Boot tested on TI K2 and K3 platforms.
>  - Tested that these patches do not generate new warnings or errors.
>
> Test logs:
> https://gist.github.com/3V3RYONE/8cb2e49ddd902180a920730b7a5c8016
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
>
> Thanks,
> Beleswar
>
> Beleswar Padhi (2):
>   dt-bindings: mailbox: ti,secure-proxy: Add TDA54 variant compatible
>   mailbox: ti-msgmgr: Add ti,tda54-main-secure-proxy support
>
>  .../bindings/mailbox/ti,secure-proxy.yaml     |  4 ++-
>  drivers/mailbox/ti-msgmgr.c                   | 33 +++++++++++++++----
>  2 files changed, 29 insertions(+), 8 deletions(-)
>
> --
> 2.34.1
>
Applied to mailbox/for-next

Thanks
Jassi
