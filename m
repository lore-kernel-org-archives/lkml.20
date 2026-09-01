Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0334949E5EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287840; cv=pass; b=tWp0XAQsSYGhECRRma/cQN0XZmirVlNMosJxtU6uIJRh/t4FlUv7t3LIqXYIleKLHR2OBvbRcv+s6iniWjxeNbWKRfV9SVTwINJyfMU+9m2TWc7TuOPugvnka4+vV7xo1c4x3/lJvqN2whgfw2m8AdYjrW+pKtZtjsFLQ+PCaiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287840; c=relaxed/simple;
	bh=494ckq7zWDraIEHV/+JsNGhiWAQA60hpCZCjqs/KHgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZh3dyJe9K++4PssAEjpVR5CxT9WfbsU4xGxg6nhMWNUEjlJmv/YzF1lWKCMu5w3qR4Jpgz9fTFY0W5QCZny+c6yEOw3sO5DQDptS/VDgZBzcKrK4N86+KxV6U7iN3TUtZHP8Qd2gWZLNutmEw2CXg4JRi1K/rfdnvK4/khzxRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKBYKNvB; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKBYKNvB"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c25099bb1fbso10370166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788287835; cv=none;
        d=google.com; s=arc-20260327;
        b=GJs/eK2Brf015gkjgQ9Z/PsSdUUM5rIamp5oCyj5aBqfgRlr5Ax5pexcHbPL8A3exR
         qNLbadyUz4Y2lY60U0Z1Vfdv8YQvW+fqCL3eaGKmzR3w9cAZGs5Gtnlfyun0/4zezZ99
         7HSDhH0pbJVyRVXYkWmi/RzV7gu9WwcjAk3rD5nQ+s0RyXz11l37IT7A7lVxC3EPx3iv
         TRWF3nZhmELOXgpENt1/+GOOuu/WXP2pZNaiv/cK76zxzWOEn4yFIG1nILsG6fWrr81G
         JU/Ih4dBjP5LuUXtB6I82NcyN756l8CxOFVVpjBIZOLaAWFDu8OaZnIwrlfG3wZ6KcZy
         AdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=;
        fh=hsEGk9Az7fnZ0IAs6jSf3C+Du8X1R2tIHu4i8aLyuvo=;
        b=i0RgLLWgZZWZSNGkek/J5162tsT7XKI+P6e5T57AO52rstIO5Fc0dj/18dlZpEygoO
         /JXD9OoUOV+hKQL9QCXftuW+Lixs2/fW9xvGGWb5KAMtoWyz4ek8GBAoS3kzGJ/t0vKG
         KYJhmIwd7hthW9n4npeL1W5Ff+2eMKqO0vgWDbvk22RSUl1ZiGVPBRgMTgtZeQGMK75A
         Gob46ssrmdqZ7tETKlvf9v9TqzZRw36hPR07LYzqhfXi0eQp6GquPHJTxd5qzo58iD+o
         STyQ4wSf4tSGw9dLrJekHyLJsLjUXiOw4eDL49tAEwKelSnAKAPkHAb2WoOgNJOFInAb
         Uzlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287835; x=1788892635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=;
        b=kKBYKNvBUnclv15WTHuP0UPrtxDazur5+xRPXOIYcsxFAvc0qbt8r5u9V0H6U/F0Mr
         LqQUHwfrJ1eBOhgD3UUplCJUjFDAXRdmSxbsIzdWy2Hf6ygkiPgDs6E+jSprvIjncUMh
         glTsz5KIwXU3fbEm+SZq5VwT1Nx9gmphLdxZfsRnaacRxYaUcSCQEB4GX7pcznt0A7F1
         uvB5pywKk/SjtvA91turLbuMQO6fNx8cM1k5lGDGppDTwCI4POROAGIENlEhoc5vkJQH
         /6GUkDN6F0+wBxdJSMgbwySstPZ3F4m7MtwuEwqgpmIEXFBrbByi1KjOBwEbHo5Ja69w
         6XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287835; x=1788892635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=;
        b=Ln1FsNhZSuno1h5+bUPTt0ieYIiV4bJOS+sDeIHFdDAIAHT9DSe+KBCCU6kXdVvMug
         O8lsphqUnOhd+qg8wQjk7ogTorlg2eU8ld9rcb47uO+1YiHfbJq0WlVtv0rzBZYlA8C7
         QVUhEEg/Onc6/nXLLcYCO2hinF/8CXa4IbvoII4M8Im/0WQ2mcpQvAbZ42LTYJ1cAPME
         Ob3dIv8AadSTuCNFWW2yWR7TRDvhLD1jtNptO8yeyp9+3eFGpI88f+QJVbE5+bTM8JzU
         7sOaVdcfRbEtQvGe1gAmwpAaOyhDhAiQ3HbHm3E5D9V2xteee94913d2RyI0cwVRGaXf
         c8cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrnvuYz1YDx+pYduE2LSKJVBouqY8h42C08dfK8QEvlc55pcAqDF3UOt9mfWlPQgHJYIdA0tjubZzjv9w=@vger.kernel.org
X-Gm-Message-State: AFuF++nH0Muwb++78EnuNUY8FyGS8sall1iNOMbH2V3AnwjRCpUuC3yJ
	xsc+xXIrbvht4UxhLbxDnVa09ZkoBNuSQBi2SCblkhBaKaxDbYHh2VvAqpnhJvUvD77gI/4Ei/b
	aMhiCvE8wA8LjkoyJ94g0IjpAuJcWlXA=
X-Gm-Gg: AYBFou1sO3oHnWOCUJ6quNsK/K1tHQ+csRRWVYODfxJWjimGV++YXwvRHtxS7l5CyF1
	Z4hbD2Z9OcSyvWyVt7NaMaf7W2oiYtqQDamdK31zitMtcsvvS/VnkabkvMRUuC64PHwI9/nJfFE
	lj6uvAP+QH+jeAR9w0ErcAXecMiJs9GAMvswqefTFeTAWOETukFyI8wOmcY1hjJ2DooYIwEuDMt
	zw1PcamzQ1ytGVBdnDJxmle8ZTIiXWaU2efL6FFPylEWnHJcTaAvIaDm4RKvjAbs+I4Epjvghsw
	rj4zgqHow3CuyzhUiG/qC7pE7LEQH20e0cxgVSvDrV4MQ4iEDmzLHDbCAMNNCqunFMekGqQWKPK
	zWVeYYco9uVKwUZnJZUFCLVE3Qu6yGIwH7bCz8jI3KH+rbdDGxegKC0+2SPG2793lwrdzUeK8VW
	ub5pb7Z8RSlJpj+jhpNlP3WtUzHNH/h+geb6+fRT/FArQ1ph3gCjRY0xU=
X-Received: by 2002:a05:6402:c44:b0:6a6:32fa:1e9a with SMTP id
 4fb4d7f45d1cf-6a632fa1f2bmr14643753a12.18.1788287835187; Tue, 01 Sep 2026
 11:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901025311.955936-1-rosenp@gmail.com> <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
In-Reply-To: <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 1 Sep 2026 11:37:03 -0700
X-Gm-Features: AcwNN1UPUj6nKVtq1cjCz-NC6msW_ZrmBOinD39yYI4g4c84oBstlABPtX9pTQk
Message-ID: <CAKxU2N_qR-KKvq=qv0eu4PMYMf8zHnpYnZ8jMvpBNKVitB3Vuw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 8:08=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 31, 2026 at 07:53:11PM -0700, Rosen Penev wrote:
> > Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
> > allowing the board to be woken from suspend.
>
> Could you explain this some more. Why a GPIO key? The MAC needs to
> know if the PHY can wake the system, in order to offload the WoL to
> the PHY.
This was an out of tree solution to get WOL working on this board.

After some back and forth with an LLM, the conclusion reached was that
this is the simplest way to get it working, not upstream ready. And as
sashiko points out, it has problems. I'll respin.
>
>     Andrew
