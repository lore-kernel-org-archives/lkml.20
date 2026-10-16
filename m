Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378934F0539
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166687; cv=pass; b=mg1j/o5tnKeq5Pd0v2GULPC4p4JaEqSP5o/2guaCVGuU1RU2dRBWeh4VJutCYxXK6EQ4ZbO/ZUvvhNFyNL75yi49hSHJanHAO2Mwqt7/RhsPeHhX6/e9UCymIqJuy7p3/uQhoI8ouZnaekYV2X4F296crNGRlvC4jzDzy33DxgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166687; c=relaxed/simple;
	bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orAYYvVlT1Vwtfc+dt5G89knXm9QU417rt6JLUQNNyUJaON1uG6ujlflsKwIwY0FpJ+tQ9FhCedaHjPpwSKWa6SFqi2OCKkeiYDE+6Fi4OEXQ6F1XxjHYFK/LKwi1w1Lcps8Jpy0drWLt8G/+OVdmLNLkF5rA3y6stlY/3qqjog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuOJ798b; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuOJ798b"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ae8607e8afso526677b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166685; cv=none;
        d=google.com; s=arc-20260327;
        b=CEiTdSwDOT2mgSXX1z6dLAqTZ9Mr77bzwozenyMRz3qFJbnG+S5mUr8jQ4FJ1kBnTj
         c8PKwLQKlsuAkCC8CMj1bHTDpvBwSESYMCal2YjC0MoOLfbZURRygEBgOrC3sMQzt/oW
         YFadUc+zC8qoKzmStYMjJOZhp5kEUuAuFp7o6zybVEyazZShQz9fByhSZE15n8IUpd12
         gwFAJ47M4yLS090lJRZhKIcCj75ekPxS3ZTI8yLmWXeBeEfBwqFw8LCGAj4EieutB0Mq
         h5L9JMIlgxi0LJpgJYLAl6Fr8WgGpHDEGaUbgfTwg4V/39rUozAGdO6sr51kgbJ5kimz
         cpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
        fh=YRTMA3p03mjaUG/FpziJHUC0qZeNI9BjCsFuQPO2sDk=;
        b=T8SHqouuker3hGj3uDya1vfGHXCHYVnxTgdUY56545SUT3X0/6KZHNmk8ubv3H5Ir2
         ME+uHloLRDS0x6v4HrGnYIt2MfUp2BXH0yq3j8AL/WitvsLNh/D6gGNxAEGhoPcjdgg5
         oH6uiYoJyDtP7ZzmJKEYp0f8m3WtlS4KREYzRbhr97vbFzIGkcMjiJeyNjikpNbqXrTw
         I0VumzpPa8J8dgRWtkQecl9ZZU8xOkD+EdYaUDR9VRdrxdQT7h++XSGcp/OIhmMXFj1S
         OzWLBis9xrk2rNupRzyGNZ/z00BEkTbp7pm/3Mg1hVhZYvCicFXAyOMViRYtvMDFeb2H
         ukGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166685; x=1792771485; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
        b=CuOJ798bMYtCDpC5LWiwZJn7uw8bjiBagVxTyI6Y9WQHtVprqQYt1y47sCo21XrVNV
         UsOmF8vDTwr5vLG1QXN92cTa+5Im2jGEIYiRKKdOqgzUUOTnYt87XsGOn5018IMq+alk
         L7aJy/CQT1mulKcTs4zCTHTgB7D+ulX8GyNiMTZTTx8J0UwhjLxhSJpG1LHGNK5izf3Y
         c2jU0TWODuroFYqhSPgwpTpsaCq26tN2n6wpUb4c5k5Tj1qTFSAea6HSAfpp6N0Uh0Bf
         YY7iLlNhbSOArmXeqmWMYCYhiAV6fxBNdp+6tcTdfA02yg1vXQ4NCEjPo42auL7rK04m
         J4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166685; x=1792771485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
        b=H5Z6KsMEelNKlrepMazcsWy3Cw0MSztlXk5DgPl4GzRdcgBogHuZ+BYYMtIFGBZxUA
         bdlQ8ns3sq4IcVSJVwmQajaO3CeuKDyO+SvCv+VaH2lhCxc+/7G7318DDhEvlvfAEw6I
         B6ndyu19IZGanbVxV4WExRAeKmQUE2RnktGHxru3CJSrE5R1P2XQUt2MSFtbNDvKwnm6
         ChvZ2GxzQFihTdIjU5AitNM5ekW9/4aJsMVLh1S4EHx0+AfUt/H2+8r3XdCJRro7LPhP
         DHXco7o1dZQ8z9ueCEC8/NDOAG2qUPXBE5+BCYbLyo9JNfc2n+c+uBe/MtWFo869zmM/
         +tsw==
X-Forwarded-Encrypted: i=1; AKwUvBwJy19+1zcAE4LpVNgP3YJRAiDRPB1uiR2Aya6xFMrSbiX6g8wpkW3yV7xNzlysZ7TyS+OFMxPvfC/c+2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIic+zU2hjsuv6btWtmMd4bA3O2EVzyIHsl5beo8+yLBOL0iyAM
	obe4twinBWNwPR2Pl1pKHNkCD+T6xsUzGgZvEFRYN4DsWbR/ykYJeMotZS47ANloTXK0EfiYflp
	LPFtaGLHzk44Y1mYvaOrHGeS782vYnIPiw5tJI+Q=
X-Gm-Gg: AYBFou3RJLF3rIwINIpBpuu3RGTbUmxLAGeWhQNuJES+vq8+/tBy+U9a5ZN/3X4BlZL
	BjS9YKZtY9HL0Bt91dyG7TaizYy175E9iNzOda2jrWgIEDaZUuyUeVHB+1O3dWUMLkbqjQNfPKy
	4eEOsbEwg0iSQNGbqciIQ2lzD/WC7eEY/cUHJHxwLElc5pmKOtB6kBoEY0QsNqEY2BaeuepI9FJ
	of6sz4KHPoKG9h8zLi6Kf3UIZzuW9vItHe3R8gHtRLJ5Yqai4Ve+Woewx5kzF8Q5hu14dzDvSEV
	cnEsJiMouIXVtosgQnOJZoq9fw0ztPa6myvQca+sb+ea05RoAFfNigU=
X-Received: by 2002:a05:690e:168d:b0:679:94b3:a257 with SMTP id
 956f58d0204a3-67994b3d526mr1957505d50.115.1792166684969; Fri, 16 Oct 2026
 09:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016090930.947830-1-wyibo6109@gmail.com> <57d28e27-459d-4d58-b6ea-78739936d152@ixit.cz>
In-Reply-To: <57d28e27-459d-4d58-b6ea-78739936d152@ixit.cz>
From: Yibo Wang <wyibo6109@gmail.com>
Date: Fri, 16 Oct 2026 11:04:34 -0500
X-Gm-Features: AclHuK8HVxQHZuZqBOsgDtltrMYxi2H1SXCcO2OimABd3Lxmh6ZoSPvRZjNaQho
Message-ID: <CALQ9cS49UzOPA8PUh8Yf55+D5oim=9YRF9iHw0Hi0sXuZFDTVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document DW9714VA
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, sorry for the trouble caused by my insufficient checking.
I did use an LLM to organize register tables for the binding and clean-room
HAL user space drivers work when I find my chip acts differently. I
focused too much on C files and neglected docs.I will treat documents
more seriously in future patches. Since this chip is common and someone
will inevitably do a better job, I won't send a v2. Please feel free to
drop this series. Sorry for the noise.
