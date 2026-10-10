Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62697331202
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791669653; cv=pass; b=GaQgJt4TYPHuPxrvB8FD1Y2dHaxcMNLeMP6eP2SxqXXX7maiuqC8QOw1wIi7JbPgimyfxAXZCHTt1gphxo74EV8UMbgIMQnTv1LMxwn9goQAG7ibTAxh/kaMBeG0oDvqz8f11JtWDNt+SGm7Z24wKI+YGbMzV+hffSmnnJJvShc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791669653; c=relaxed/simple;
	bh=VsLa3yNmPbqAsvOEv+girJFBtwqO7wp3UAIL92BqneU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYNIjx9KWzThH8uo7qORl5vU8xKnixrMd/+m3IyK2oGpJKA1ltXdKvZwnvNBYxAlPVHPKpe5BIu1mJqtqUE1SgCAJX3gAuRyu7imrRDK/4sOsFCxrWsxdfrjZMNK97tpmvQkHzxukvfPgkHM/Zi4af/Z1JhwwDkg4QU4s4uPkSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Z+P3lxY2; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Z+P3lxY2"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677d35fd1d2so646201d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791669651; cv=none;
        d=google.com; s=arc-20260327;
        b=r6AyHC1WgcE5DY3T2cWMrphxa4UR8UXT5dLzPl9V/5QczYrPJ0WWnnnN6cFVOkcbax
         DNjaRvPNwIe+zeU7q9gHwyl2gJdWPKfR8alGnEaxhtlIIfHS/Xeb0vlC3XEdBPAwz+aP
         x40D2yN8/eRkO0arjYULcPyZ+1+m98ssit0TugdwKqiJRoHdve5t9mYgy8s6lAEFE5B2
         3/dYKiS7eai7B77xuvuG2GK8Le2pY6VxFhyGEyhnglmINIGe0URazaPEc2KYBOfDq2m/
         WvjNsm5Watx6z7v32TDxtLVwHvMHBqPb56RN0usavIWpKCThjdf5iXHYbKuwd97atYPj
         0llQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        fh=m4Bz1n2WObClR20tdqD8EhXL9PvDLQMffza1l0GfzyA=;
        b=MNaUmxNBWYDNIHC0l8vrUhFy/PKhG1q98j832+0uWbbfrxedJDzXxE0QXpeaPQxQa6
         c5rbDAH3x8vnHZXypkQxkvZI3YW57pvq0sd358k+0sHdcy6v8smkCTk5qY3yWpPBJA9+
         ew9YcXEOWoliYiqL6pm0HqReKOf3MdrmW8O4STI0D+T1W2yfGAaz41Z0AdlyqPcDdK/f
         gbsWH9iiqrQG6E9zgL+y0/gkcm56wMeifCzdb5gATozDMp17nNTS8JoIp1SM6fRnWb+m
         4C8oMQDL/5DivN3KDFyn7jBSQX/uhTKj4a8PBDjdZ2s+JEhiRiaXrnC93yvCk8Lm/lu1
         hbew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791669651; x=1792274451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        b=Z+P3lxY2zcf3Kb5thIym1/9pShU4pcsu19c2lYcYTIM4vhCVFK51rQVCb7734VU41k
         dqI+fbGue/8Cucl8f9uyXI/zYAaAJ4Fv2gm5rFFrCsQOhLi5VOF1Eow9TdguabLJmH8h
         brz9+JrfAF4RkW0hKjsku/7aCEZUpRN9iON6kmJX2PCVFWv662FKwFkAirHlwxLrser/
         xGyaQ+GHPIyhCTSzVa2cLL8pmlcM/ulykrmnT/OiyOXfJFJVXr0AgpU4ybSVQ+b9R7IR
         YkUg/AyxCu6sFxqOKZE+3HrmYiscDx+dDICnmpJ6YoFm+ElDyi3gOTlwPFat5FeCBNa8
         8PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791669651; x=1792274451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        b=X/DArBitCVEdTec9W5xpZzYpUoV6NxYbH7j9eC2WFDDS0w4r1puGLRw1UsMUxzG2oj
         CUtVUZA4H8j8GemZwZad+aUfI4ltHuOqUiMXrGiI/jHUdNDJnKc++5F3kV/oIEHHvovb
         5WwkUNeIiRPYhRqPlZI3WBVnE4699XXvKQt9/1g4cq0rDyThMwwlOUpSSD8ehO/lokdw
         LARqzEbQJ8zaqD9zzl7a+EGv1iEq8YBTEaYUORdeS0MkrycbVha7bLlfIB2K5dDuw0nv
         WJDTu6Wp9fbXzo0JtwKrYbnRXhdIKELyPS8CfWjuHfxsU9Nno8BslaBK88IlqShLgnui
         yMiA==
X-Forwarded-Encrypted: i=1; AKwUvBx27E3fGj2/qWRDqRo6FnVJjq+UnzEUoX+KbkP763XaTHDN5XVnv3g0fMsZjqLmn2MbZj1Emgjuz/f7P3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcCvOtMZsA6KUXm2OXpCpT9j4VFQ4P6WI5f+P4vjWKTfAUsW3y
	6LfzD7y+oHqFRPh11ElcqanjTJtQbCiM3mpufby2gsB2Aaw6DAWO90kUoU5vfxNDqtYjgxQtiyI
	BkgWXKrABwGITb476rJeLNaPaVCz6raM=
X-Gm-Gg: AYBFou2hF89/AgobZD8DiwbsdR+BBR8RvJQN/3L9vEAaJ9UvNuIjfToDZulwMFUI6kF
	UKWf41LKwlhpKtLI9yHMQ7yC6ntq5lkPnAog4A58ntmjtvhrT8vmEq5mGYD1yg3aGkjpo1aCC1e
	Y1CWn/jQrRp5ugoeJii9XyESB5w7bdwBL0gDpcKfMJLZ6CJ6XOsXwhsoIWfnXIboITHOgUbXgaL
	qxMjWYrun6bn0cQV3gfaDH45iTvr0Wk2gStnB1hPg74YwEupo1FqlhSWOQtHSoWChFP2ofFUJYc
	jx1ARkjIUaV3csNao6IDMy/gfSCHhxm5dkuV1RW66pwAlnXrNsONkUipa2cL45B5vTiQryaPymN
	2oQk33XN34YMW
X-Received: by 2002:a05:690e:810:20b0:671:5206:72f2 with SMTP id
 956f58d0204a3-67936049a53mr1141845d50.56.1791669651100; Sat, 10 Oct 2026
 15:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-8-tanure@linux.com>
In-Reply-To: <20261010105900.247342-8-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:00:40 +0200
X-Gm-Features: AclHuK-1AFCBBfJ7Kfb5Ikey6DbHIu9yDPTfwBVIgnuMS2JnhjeqsjRPSCAltBs
Message-ID: <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
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
[...]
> RGMII needs a delay on each of its two clocks, and on this board
> both come from inside the chips, not from the board traces. The PHY
> adds the one on receive. Its transmit delay does not work here, so the
> controller adds that one.
[...]
> +&ethmac {
> +       status =3D "okay";
> +       pinctrl-0 =3D <&eth_pins>, <&eth_rgmii_pins>;
> +       pinctrl-names =3D "default";
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&external_phy>;
> +       tx-internal-delay-ps =3D <2000>;
You're stating that RTL8211F's TX delay doesn't work but not explaining why=
.
I haven't come across this behavior before and I'm worried that that's
an issue with a batch of RTL8211F.
What if the previous/next batch of RTL8211F will have working TX delay
again - wouldn't that mean 4ns delay in total unless the RTL8211F
driver is changed?
