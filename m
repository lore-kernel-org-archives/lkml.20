Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794932670;
	b=mhV962uAFATzGQFNvu0ExKVkOW8IwnlMOGa/ncBbWYLC7QeC+sO0UfN40GfjeaxPJLwx
	 cNp/bfVyMdn9q+7Ke5UqIwwwGop3Dpm6KdQPGQo0j86nQy6lQVqXS/zMdC8rX4i47B/X+
	 o1u+H9bnK7jn/FNxwPCLQS5eYsIHci66x3ouzzbwaBCDkXxoe7+Dwwa6HkfnYgXVvIv7l
	 QjjOF6QdhJCyyEmTK7jZX8YJDgHpV26xP+oQ247jylq/PJNgUUnkchvpeZzB51uJodRnW
	 Cp4/G5Yx3C/RX+JGM+gzJx7kBBbKdXeQiBKsPXqn1NVc6hIr4SY+d3CLy7kuyOPTL8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
	b=O4+VBOqH22MpXMH2XLozesnSqWQrhgpsn4AM5XZeF20tLihAWBeS/YCre2m0xuxwDZGC
	 1wFKwocAkurV4CUrXaKMNfqSzw0scDPUC2vqSqa10oxyCrbvzCA0KZOiwyE19GCOYpHyU
	 OpIA/u3iR52NMfA7s+J8DEtkICoyXTuExUErXltjbAhDGRthzCf3UumgHZi181D/P3Mvd
	 6Ddk1oVtwf60fN4sSO86RXoQe0hRpnIHNJ0yW3D+dpgF9gH2MTqlUeRaZNTRU2E8/kkBs
	 /oFfrfMleLLLniK73D0utvvfDlO9fOagI7us+SCGjPpd8suBAIV3VjvXmfshRhQrSag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdqQd8jv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E465E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E465E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdqQd8jv
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4322d310e7so871752466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794932668; cv=none;
        d=google.com; s=arc-20260327;
        b=iHoctMq3b6vFp63lQOo2B3sCOkJDO29bZ5rGSZ1Axs6wGk/QbKDG7X33X33UpgnUFi
         fkuNGDnGHrqrMJ2Euez/AwFPnT3KqV2Q5nHguw5bT72NMCzXwjWhG5vcLRlgmbOcXkNU
         WHRdh2fPGcQTrgs1FxmSzbRJI2xzjezXNwonva+azCRXcHyhr7ZhgsmSHDleGfcjdoZz
         okyCZ2Gh0laiEiMRODgWnQSexHDcALD5TqZanwK85uljOE2SQQPsvudzkOuqmnviifYS
         yl0EVAwXD3mAWoBlPH9NsHcl5UHspYIOWsYjP2YagUfsXuFzYzgMlyz0sIjEyW7uwQ5L
         asPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        fh=YVs5raceompUzpcIvsQcMUdfZo61OR9qBJmrHTO66yw=;
        b=Ej8T316ioWgcVNGPshl/i712UESRcggyyAef1sx448K6qJ+uwBVIrxtBtUpdUwJJFb
         A2mwyZVqHITC4ZjyMSSWYbpOKCqfwwoT2mtHAAwCJAC/IQ8PgvhxyUK82vWbVkcldvNl
         ed087M3jTJwlNvHAQ0ccq4wqzndyWw+EObepif5znBJV6iWMRN8zKk4xECAAN5R0j8VZ
         ShLuGhAsC05rZLO0dZHDPxLD7PgVKzxY9S+cxs3CFjs4jq1RkEP7kK6phTHWKRDcBJsL
         LghnN7J3ZZ/xXQA8/oaSdEU/9kop5A3MgB0lJVvbTLONRSyyR1NN+BOPZiaDz5FK3n1B
         /Vfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932668; x=1795537468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        b=cdqQd8jvojBdqf5S+ZlBYnRBB0iv9NrxVYWGKdwsf3qISFsmdiLHOpl+UNMQAzU5Ho
         liy/ffvLgOjWoCC0QMtIRtCSaVqYHa8IArufbSdRmDatd8CHbeYDI8B2a59M2Wrb8O29
         5NvqLtv4LgJz/k1d6g/ZfQrzTO47WvsKobB2eTGboiH6qTmucj3NIxw06T+MZKY4mOTH
         seB2ppD/Pobdk//WYyirPBedKHZ3i6zq8BB2cxTSK/1zF1XG4JeHqeQQ/WrdtMt+RNK3
         5yuPyjkXC22spPcEmapMTeUxRVzMVVw38Bm3+Ce+ODpNYfXU3pJjuC4IOnDK36O1bFx8
         gTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932668; x=1795537468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        b=RtLMotuhZwfd/joh39ut3f+R4xAxwtG5tB2I+YjCHdsPeRIYOjzqsju8PPzPF/LWtn
         HW2N2BrLLgkCEnJKJbwHaOW7Ia5f9mxcmsfNOu51OJJ/qzaRCEGu/JfkLLY7QHVmJS6x
         tioAGqaXo+RQXySBGANtxtfhH1E6N/wFP6EjiYn4O3FwaYwWrKiqrOTL21UmdgWplriK
         e5i/CMjmle+it7Ht3neNvbypj57okoYMEmeVuTto8MfAYzsFz+X8NogYdnodEH9wnUIE
         ThwnbhotsPixzanUHOPD19gjQYY3yVDCD6TO/Btadw3K6Ywj8tIyYoLXIxIa4S1hb3Fg
         /WMA==
X-Forwarded-Encrypted: i=1; AL+hErGzZdsC4h/FEitcHxCFLFGeQtjdw/PT90eq5IsDFcNrjk1j6wtD/6soCIYJLilze+PvkwZ46+MqCjYq5h0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZZXFdZMuOeiI7C8wFwkgveFAJmqMK411W697372q1Zg5YnJT1
	UHqRYxEYDz+UStcscPxV+2JidIh9zTJZAMLUvtn5oC/OwuMYZd2jSq/HijeguFQ+AsMQUiYq3Bh
	jaDITYjOgoUYt3MuTqpUcWpxRRU/yVl0=
X-Gm-Gg: AYBFou1iX9TyWDMndo/xXhsW9bFPwyzQnZIS6qzUBrpw9nbwPFaTU/e3w0ozsLJ7jkb
	nTlj0Q2ab0E8haczWGwnyMCHsWE9fnUMYlrmYSu0jT4sLXfmUWsPvOsT64gRFCnEl80t1o90opb
	czNu6jvsSChmj8X1rYosG/pi87DvMhfYIZdA0gwzkUctKmuqHKQSxchKiQt89qKyDJ7XkuAyyX5
	Krsi/RRfR9AO0EvSGCkqAdltB9htExc5hq+vT3aMaJpMIVMUYGuYZiD4tfWlKTmZnQXvg/D2AnM
	uEnpDp2PSlu5ArSuBEZEPaDTMdyBpmmId0jneBpyJ3atNUBMRMtlR2jmfA/tX/Br8ycNJc0qOJG
	j4rIOB/cgn7FakDizWF8CsIVyxhTwej8XnSvD4xMNZ/aUJDjnev7pXzZWA5j7
X-Received: by 2002:a17:907:d308:b0:c40:f9ea:7387 with SMTP id
 a640c23a62f3a-c5096110ee7mr1203048466b.6.1794932668009; Tue, 17 Nov 2026
 08:24:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com> <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
 <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com> <6b2ffa4d-b99c-42d1-8729-00f180b955b2@lunn.ch>
In-Reply-To: <6b2ffa4d-b99c-42d1-8729-00f180b955b2@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Nov 2026 19:24:16 +0300
X-Gm-Features: AclHuK_kxuMbS-JfA12If6aJeq6DU7qmi51H7ZrXORdCaUCFkepguGc-ovdSkpg
Message-ID: <CAOPX74709XiLXLoioDJStTSzzhstC2sHpM4GieAO=3-37E18pw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:49=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Sashiko said only [1]: Sashiko has reviewed this patch and found no iss=
ues
> > For some reason it replied only to me and linux-leds.
>
> There are two different bots. The netdev one send emails using
> netdev-bot+sashiko@kernel.org, and it gets the reply addresses
> correct. It is also more accurate, less false positives.

Oh, okay, nice

Will wait =3D)

--
Best Regards,
artem
