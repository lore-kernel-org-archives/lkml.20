Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794766119;
	b=uOiJaSLzfkqRd1rxDMmhREwG7kDdI1n+7hI+FS7S8225cCjdSEdsnmyadOnD+OoXGTz5
	 085S32kiDoZDhg5JSo1cmp7lL/6GUGz4wHXD+APohdSIWpwk9hIXxhdW3qLBkF0QXEJb2
	 pfvTC8K1IPPoFtHpa+trdJtT2GyNCdJMBSzD7o0z6tQZMTUzTzI7teD8Kqet50BzXvh8T
	 4Dt61m+KbIf0I1EauDhquNPAhgKIHrx6e8Fhm86v+HVgmWPGvsHam0D7ULFrgc8B9GP0n
	 opYtktkxeakAaM2TidJuwunf1XdGLG2g8oisZzW78QUdH7RULLxMAB29ddWYcV2I7zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
	b=vgsgCW6Lm7GzaTXktI2fb4jbSMwaPxYswT0XvQ0cMQggE66cNCrOEKAwn9YulfSZHL4q
	 L8iMs96YeDc9jlynEv4n8t3bdwvb0dLFlp95+G8+KTzTZ35reRntXpSAHYXNRYm0IJtF4
	 uUfclw5hn2EMN4ByxDQ/01Ab3stEb+h4xeCL8aJPvoNNVWOiM82VAE4qj4T8OvJW4jN8n
	 78hDgK4MSU0xBi+V5V4Bj+X+DMzPHt9OtsP7W87Vf4ADJF8WR6w99YLbOPqiPsQ2U+FFy
	 5NtoahGlrhv0EAI/oCJKHguQLqpH2X6wKrD55PQTALMUEqz3xFd8VS3D73TPOhPIzAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NJYwySQH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56048606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56048606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NJYwySQH
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c24619b19so1765411d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:08:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794766118; cv=none;
        d=google.com; s=arc-20260327;
        b=CHpQBUBMUgEESILY84olEg6JOI/hKt5xMWXw3MwtXtJCsokERk5iEFZ3zhBCTyb5Ss
         46xicAagppxbhpMVluGnibqoKVwhlzdrpcqbgWZZjZEWY8O1v1WToZ/hhSgLKk2Pj1uN
         DPUugkCuGdmEWgbkua3KgshlhRFQqSxoHmidSfOJe5tA1SU2c/zrdHQVPOPivAo2o7u/
         aLSKGPDwmdmV5lHD2qRoLHuN0v6TaNGWJHvZSAmMUsOy/+H9kpN0Mt+FsxphyMGKO6o5
         IQiUCVa70qYNCyOyJjrIluQytDSoX8P/uXmja3deJTtVpFtwAL5Egw74YxtzxW0Uzlkp
         bDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        fh=VUgYK2A/nACns1K7O27Fj8gw5ynTG6JRqI4CnFNmMtg=;
        b=B2J4hms8+hroj8Va7G75J5A1Z8Rkqu2c1xY89+VMndAgemJ0q7LKG1BM1uvm0ozuuM
         5rVh4h/UmfAzNTksQuQ5IyP75nko2gc2g7IHFQar2VLAYYoWqKh2hqOUg2yFKlstGbH7
         ZNObtOz3GiR0rAagIa1AjPJlFmLw7hhPfVNgZDAsCv5EbPqaVSAI/KMflOdd6Ig6+vxW
         FGJCm9Vtklt2+lwt3ZF6wKI3JtP9BxlNy38VZNO6P2FpfL2Tnrkwd1eAp8ah2Jzata1R
         VWuKn81bWwhok971ar7MTZFc6OecViPRvKdmt62+SQAgMqrWvSOJEsK8p/UbhqnPMk1w
         M16g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794766118; x=1795370918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=NJYwySQHOYs29DzAZoCW8KTTN4Hz5eL3gp2kthjrtMBJgUvZUdGP/E5why6wGsaU1T
         lMwanMmvalvECH+a+Rz1SKSkRFhICLIOqqH9YtPzk7oiK6IXTb2IZnVO65swhS4C1HpV
         FX51qZNZ+UnmtU2DHog4Zf7b/XL/rNNkUsklcrv8V65AQML5/oC/q8X6Z0VCPAkcN1P3
         CwNl0gLixQryZLXt0MUFVFo+fYZ64qmoeV9repPHSkLYAvTOXcuZPCjm8iWsAX0YReE0
         Z4zQa+WdwkOiCym1+HdcxVrGnXddJi9qjcShaxIi8T5T00Sh/qRgG6exViSshW0pt0lF
         IWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766118; x=1795370918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=M5lyBMVVEYdA8HkLF3uaQv1mdjqgH5oVKbg//VW0sWKtoijn1D7hmjLzPm+RU4dN1P
         i8uDHjvGNdB4wtzQtun5eO1D7HeMwjuY4ut6QQtPGjbuuwiFBITRajjC5Ub4Ah2kOC+w
         J/fY/jpa2kpoUG3ahTMejcDnS+n9/+W0YXLtDcpYUOat3zWbyGqJ/gxeTiyunPFmhvub
         DSSBIltWYo4z8EJYMN+cAVVkH3gjkrPl2vKBiSVXzaszBjxhBUfACBUU6MQ9uL0zdkJu
         tA6LXYkpDvE+WoS6+ygtYpUFGPhI7VnU7QqvYwk88lLkenUaMeJcACj0KYWqJQlv4vQD
         lZWw==
X-Forwarded-Encrypted: i=1; AL+hErEpiUdKkvAX+ADshaM8yhH+G+TtReAfKUijwJFjMs/sx2KEblFVyE0m+iYOA+zPF9iv/Bg8Ko8rSRmQ5Fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iL0geenjIFFIjoNVLQGzFuHHexDJRr5tihtN6FxUH2U7v7qGs
	j71TUQcD9/crS/s1iBtGAa+g69yZ6GwuSsY40NZwMI99/mJuySAaOX/LLKNHGwwz2HE1SsKfgKe
	7GXBo+dNTt3BhLGzcz0JIhP82CoSF0xs=
X-Gm-Gg: AYBFou3RiqxmpwIulIl2mKV8uiVXRA8sv9EOsvqy9OwX0dCZx0MBbTwTdKsdaR02TUR
	RS4IxVGyjdL358QNe7Gfb8b8XoRMHVMX0rHj8OOCJEUR8Je4A16NGHb1fhn110ZC0PetSRWI4o3
	dQevb3HZ5ptaCeI982A984WdfPYemiT9LDyFnoVVP6xvidrxRehjE93q2MR3XcaJRldKZhXbW37
	4v78YtylVKw8lAwTr7dcgawJyU6wXrm4eIcptP4X+Hr7tdm/2ES7B5h0F/mSSSZshlAW3J/S49O
	mVAGgf0OXtat0UEZscD9LPaK82fBkgSdS+1o3N/AxxwAf6DSdYnXf60yyrCCo7KzHw/ZuzjO2MT
	2zkGQm8JF38WggBUWm17evMhAZRy93my9M505razJDiJYiYCRkylKz/jGj5xcPWfWaLHpFA==
X-Received: by 2002:a05:690e:a4a:b0:67d:a6fc:6ba9 with SMTP id
 956f58d0204a3-67da6fc6d40mr1650517d50.106.1794766118350; Sun, 15 Nov 2026
 10:08:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-8-tanure@linux.com>
In-Reply-To: <20261113121852.334604-8-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:08:27 +0100
X-Gm-Features: AclHuK_ca4Ke1rBatVDRggo6mUiIuil3NWD_1WvhT9IQ3QzVWOrT84nkfXuKy0g
Message-ID: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Fri, Nov 13, 2026 at 1:19=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
[...]
> +&ext_mdio {
> +       external_phy: ethernet-phy@0 {
> +               /* Realtek RTL8211FD-CG */
> +               reg =3D <0>;
We've been following this for a long time until someone found out that
RTL8211F has a broadcast feature.
Can you check the strapping registers (or simply see if the PHY
answers on address 1 as well)?
I'd appreciate it if you could update this patch so we can use this
approach as reference from now on.


Best regards,
Martin


[0] https://lore.kernel.org/all/bc8c7c6a-5d5f-4f7c-a1e2-e10a6a82d50e@lunn.c=
h/
