Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F73D2FF7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856894; cv=pass; b=TNtevnMKZL//of3QJGJJBVHK6XQB0oVSGqvR9pLt5BbP90/UVCd9YbFgsRYT3tqCd/VfLCNl4aoxeNlpfUMmFhlbGHafYZCCciCgNNJE/tUbq00q0zjafNetPc1DU7bxjgMRWd0qixexp67LfsjBnx9KELz85bstfBIuc1N7Hfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856894; c=relaxed/simple;
	bh=t80nhwRApDWZA93DyMsDHi8I1BEwRmnmkFQwG4H1QEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Baq7OOEEZea64p+pG2QfSYV2ZexpJ2CggzLTICtm2tv/0WmdKLQiUG0GSyoxouPvFlgfPNQYyvpFTn5MQ4BNajWoGB+lG8ArXQk+M2BZndc9Mvnc8dVfrsns0aRz9YDKe/Lk5B0IKiEyGDj/aPMC4/kbvWud9zrdzp68PX/ozEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=CX9q+Ujc; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="CX9q+Ujc"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso3198291b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790856890; cv=none;
        d=google.com; s=arc-20260327;
        b=V084Twl90W9gwN9cQrACmV77DCTS42LxnaJ2/uR8JZbgkoGfLohe3hBUz9dhtTivlI
         eJUNrb0y15iCOIHev/8ks+G9YCbkC6azIPTFfZ3sq1f3/uvlfQbNOINa0nJqGfn7Ay34
         X+PlOTSXCmRrydDG8IfaZM87gTvr9S//fR6/yJTpbfHJ4IrucHUL8hUzgctFJfyxxbEW
         9hT76yV7WbBdXWIx4x/yQ5ki8t2C3rhFxWQaPdUconUXFYGcZzXIwbnt2vahtF68kN5a
         FEEwmYpuODGaWMDV0Eimv/Mo7gCbe8lg9i8GDLqpyQW6lFD8r2uCalvK6LbsJJ5kFo0Z
         lfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YpU0f3NtjRyuzMkIqJCo4gz/bCKyWtpvBq9HB+O7ccE=;
        fh=mqkR/rCr3HNc9krS2Saq2VhsljbH3vFnPTOq4IdSq3c=;
        b=EkIVEENbXyig/Uojp0yAAeBFDmia86gxPnOF7FLz3SvCQUamxwuNFMLUDiKJjo8rMZ
         m9Zc5Bf8u5fonP4NmdZolBLvhzqSRNJz/5b9F6vS6BM57zSZA0jHea08H2D/F56t25Vj
         VfuwuilpIZv8oGSE+tt7elD7IcPIFYpcAGO6SEheMIJqgcx/W7ITKO48fYMDAuIdioau
         Z/Ytef4oWXP6JKS8lLv1XSGnJtSjkaXYqqSbpv7KiVqdjK0KiNZrLye60UTzvLROLnEV
         dJbkS0VNGEtMEiBt57Ci9tRhi0ploKMAFKPFzO71fRbG4bB2RV7h3LwRZH4S0Ni5m3hS
         kpmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790856890; x=1791461690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YpU0f3NtjRyuzMkIqJCo4gz/bCKyWtpvBq9HB+O7ccE=;
        b=CX9q+Ujc+9ijyP+hjLjhQHKOA1Ajp3s5G8hxo2Q49I1ChcSodIObiGY3k+tCZ5fhuE
         cKEaci8lNfwxR2JAtFk0QBxmt7cgJFJTegk9HhVcQeuKddj5zMxJGIDM1W7F+PhLb0eb
         QDCbD0DNBN4+IPyhdOVdwwwIklPpDB/SkU/tNYh9CMETu2vE05c6pFIgMMHKHSg79Xco
         JNS/Dw/fG0w/wM6YBf4voHLb+o1QiI/Q6kRouSgQFePjoz38ejkkf+97oFnva09nQyBz
         B0q7tjHJNzfe5ocPl79T04rA6IgNw8RdiGfnYcj+CyD7mbw1nKLyVeL1cg2A4zu7FHvR
         jYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790856890; x=1791461690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpU0f3NtjRyuzMkIqJCo4gz/bCKyWtpvBq9HB+O7ccE=;
        b=UlWKtwGUO8WMx4EE/jmYGQKEaBTEfSHGroZJ3WlQcMnT6d/XiAi/6BK/jTIXEZuOpG
         1B5YtZnJ0P/h6MhoekWdEobGzOzsWTi+g+hhuPG/lGOpedcyppvQRK2HjqNgRUSCfkGy
         fkQmFF5aclxOuD0qEaS6bM3l5CJTWF+2p56wQrbe/k/EPsfUambJwFhRTOFwB0OO5nk+
         3YQzESyAdUaR/eciQAslKhLlfGxMEO0keXEpkZPW6ysskCGetThmoevnAejfwNeEMCMA
         eR1pyOUvBeouSV69P59+sonTNwr4WsQdG7RKaB/Pcp2AaKojCGIIxyrIeS/by5o9ZABn
         xdlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjvmb02PEnQUQB2rEzaM4UuJmPr+14+vSnEpAz1z3WZ2e4ScXx2hV833y6ZvSTFdY48X/R061G8QXTJzA=@vger.kernel.org
X-Gm-Message-State: AFuF++mG41QrbkTzMnAD7UIyrSOlVkYLrSgfhIFjyE0yZQiEnggspTGw
	ELA8vqCI3MK/XYa85OHzNPVS5+k8ddzTXrbu5iaFPZLN+ZrdVlpV6A4cYM7SulbiMmcN0rvxf4x
	DXNyDpE8J4grgab8PbEYMb0fe2PqQJEoHtirXmm68wQ==
X-Gm-Gg: AYBFou2i7YbHZnaua2VrTUMAowKMsn57ggJk/qDyqeCQwURAiaT/nLbXdTWjmLSdDnK
	em+HtGk+EF6DRhJlGiLLY7IDkxZDDENReX7vxJhj0tI685cs8m5k46WPJC/M2/P496IagkdRA2/
	J4eJbRH6y9R2MXQAr76UzIVQMxfJ+uAZbikYpCwcGuBOx9M0uyNYi/90i3KBlQ7jkXiAg0tLTdP
	eaoaCgPZbTayCbY+OkbdX3/N6blKonx6svMQUeN7GB7spNPy9VjdBVuqoOkh7yxKcicbcL7YiUt
	VGgMwv9bRDdW0g4PrZj4goyyNv7Nnal+QsOreaoZh3v5hy9AUErZijx7uYFiaB7dSkntlLljAD9
	kXogsydrVoidXMGzdC5S50J/2Hr11ZQbtHkk=
X-Received: by 2002:a05:6a00:99b:b0:880:78ca:8408 with SMTP id
 d2e1a72fcca58-887498020a8mr4062364b3a.7.1790856890524; Thu, 01 Oct 2026
 05:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930122305.293686-1-robert.marko@sartura.hr>
 <20260930122305.293686-4-robert.marko@sartura.hr> <20261001-splendid-athletic-coot-1bbbb6@quoll>
In-Reply-To: <20261001-splendid-athletic-coot-1bbbb6@quoll>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 1 Oct 2026 14:14:39 +0200
X-Gm-Features: AclHuK_WE9ut5IG7WpoJ3i8LiSUCQkUGd-Zayy7qamfoOiiMgfWXeX1Yay2v7OY
Message-ID: <CA+HBbNEOiAw+_zzQco13nNzUPdGUgo+kjcRzLFEA4LmnzF8_=A@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: net: maxlinear: add MxL86211C lane
 mapping support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, hkallweit1@gmail.com, lxu@maxlinear.com, 
	michael@walle.cc, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 7:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Sep 30, 2026 at 02:22:16PM +0200, Robert Marko wrote:
> > Describe the optional lane-to-ASP mapping for the MxL86211C PHY.
> >
> > The mapping accounts for board-level swaps between its physical TPI
> > lanes and analog signal processing lanes.
> >
> > MxL86211C supports per lane mapping.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/net/maxlinear,gpy2xx.yaml        | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yam=
l b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> > index 0645e885f1747..b98cb3c3e6d49 100644
> > --- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> > +++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> > @@ -22,6 +22,21 @@ allOf:
> >
> >      then:
> >        properties:
> > +        maxlinear,lane-asp-map:
> > +          description: |
> > +            Mapping of the physical TPI lanes A through D to the PHY's
> > +            analog signal processing lanes (ASPs). The array index ide=
ntifies
>
> Are there other lanes as well? Not ASP? What sort? data-lanes does not
> fit here?

Hi,
I tried to keep it similar to the datasheet, but looking back, a more
appropriate
name would be ASP instances instead of lanes.

I am not sure if data-lanes describe what it is fully but I am open to idea=
s.

Regards,
Robert

>
> > +            physical lane A, B, C, or D, while its value identifies AS=
P A, B,
> > +            C, or D, encoded as 0 through 3. Each ASP must be mapped e=
xactly
> > +            once. Omit the property to retain the hardware reset mappi=
ng.
> > +          $ref: /schemas/types.yaml#/definitions/uint32-array
>
> Best regards,
> Krzysztof
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
