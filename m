Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C7D55C1CE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930516; cv=pass; b=p1ATNTvs+inrYuAi615y8xp5dfL/wldBrhRJozFavHh5Onqv5++2Emb3gud5DDiExhH8NzJBw8+rLBUCQkmeMr0XHXQ8t2oyZi3gvrIb7ZCTLynZS8HH4XJiIzuavarddpXaX2E2CsNc92xFxF3YVGeWhNkvnP9/v58ERkKgZrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930516; c=relaxed/simple;
	bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpxJJvz/39tlH4ZwVP3w0Dq9I3mH9+l/cGSXx72TRS3Yxg183pszQGVZPFomCBfhO2S3wzWWBobsLbwDjvzwA3pUvd3LmRcY25dDPhiiOFYhIKE33UQoCNScjyo9/LOJSDx0F4MiZAiyVF6rFsbP2N0Xo5l0EPFS4ZqQteuoGdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DUSXHq6a; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DUSXHq6a"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b056d58f2aso3698877b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791930513; cv=none;
        d=google.com; s=arc-20260327;
        b=P6zKAM8KrDkwftuizbySc5ZVgiZqfStnK9/ry6G/fygTX0ChJfGrKWv6LKULKPGwry
         8UfD+Gd6j+/9gghKrsDd5BqQJvOUIix2abs0GGmSnaMjGHMNGXJ/v+1uXj6WECuTT2qT
         6tUXIJRVd/NZKe+RSoXVotON1dMpakPJvN62NCooT35N9d9dxvJkZeD94MC39D0FWlRh
         Sqq+g3EnKKtI2uBpRIebzCNWlpp64F9GU01HgW111RqefOs8UfvV3uTdzOGd8cGUHpOp
         /PDFTFpbPzJrlkyddhxWM89VR0JVTR8X+5oaSXbj0kLiYo0ZHc5n3FizuMQ+s4XYN2At
         I3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
        fh=alnkRX7ZuShdghe2mty4aVMemAf+4Oj3JNwzlNRVs98=;
        b=c3uChkDoJgbd1iRXML34RnPCngeQp+Tqu6Xrbzqlfqntj0KSUaPm9N5jr5BGGVovCm
         4ZBVrd+eHmsz4AfYBIAWIQPs+0JNnSwixyQbhQIkqp3DCevTxsgqU9dUriVLVBcNUFr+
         ZTyziDPI8BYhUFwxX2PRWygeZmnDVsVb8WnFqBPimrOuqQCfqQ8P+45UlqhoziXfCA8D
         sgminZYXJwWBwbVst0ZLjK3JhA5ir2XTkFbwd9JvtM1esAgC3vsRbBySGwma8eps7MIc
         xCzI00R4EYo+jVb2RPgV/rEW2rYDyA4UYvVZvG2OOl3nmyxMEfNqZ9pzxRlCg+WcBFPU
         0lvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791930513; x=1792535313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
        b=DUSXHq6awOXCzmeM9lLEMtkMS1ys4ectWQNADf/Wr89M6R/5Ao9JRiZUqGyXDjy5T2
         JOT088ik4rp9/uXTDrLqf6AkzM5NhYBRpFSq6CIRt5rO/4hPnJUQfk3MHN3eJIe9KuAR
         U8PSiCTpeTfIdCGG8YfydaxD3paJQX36Q3vqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930513; x=1792535313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
        b=S3n3mmIfAsZukEvx09eLy8gAIiF5I/OxX2Ad+WCTFzHeD+5bn47J2FVvUwSBQpVq2F
         xBtayS0CWcPNMRKssEHLUouL27tmgk0g8+BRkTQUJ8EeqpNH9mHsfimArXv6R5TrId8c
         xW2lQYN2R27SOHWaZVixkGNL1PLnyPQk3tx5xAjwsdGVOzkfR24NxpXYV4twpCW6B2Bd
         6AycKnmwM+r2xbCq4gNJctk/d+9I3cQ/dK96qgcIEU5L91CmN1XREt33mRNskLK8HONM
         pbW1qjtIFb0IVUzCNY974nbvH1GrfybNNleeidtTUS0Mzl3iB9ghdhjcATt7LJGP4kCk
         muyA==
X-Forwarded-Encrypted: i=1; AKwUvBx2EO11ccfw7BuIYC76DWxBeEI9bPzc6Ep2LYDoVO2mdFrc0KaBofaKMAn4JNhj8S67TtuTm50xpfoGXNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzIdyDBNlj8cAekRHOctfYWhU5C2x3PC0WqhjRlFGpwLhldqS6
	AdP/ZgV6+Z/lyE9j6hQ3JCde5mESxru5qYOprfLF9536CJo9f0LI6Ld2Lrkyj2su4bB44kQdt03
	1eeoI8BopcHm0TkXEiKX5xnsiw4FCLobY97mpkd1E
X-Gm-Gg: AYBFou1FskZsuFEE49X5PIt7zo7BIFWW24sHeOYzMFmF2fKlW6luBPhuePtf68806a7
	fovSdWy/iG6w71zlKBXNdLQvorTmUhcpXumH0UyMW+5eeF+uq/CcSxDAlHihqFQy7SOvYT+z4kP
	LHxEyUf2UdMgBXR6BPbdys4C5Z7xxHS37NdK44hiPMgVkIBbdsamE98iNHgY6zRMubIWVXghfFt
	XgcspQedDtf4Yf/rKnzU6aZWW/fZRWUT8oEaa/gkwdb+AssizkO4Y8UiAr5u0vXLVG61L2wUL2R
	0tU/cGKAxzlWLz9ile6YFca2baBYIdv8+6BMAdaFd5p9gIMEzwdzL/+xUFXEkC7aO8aFvf2df6b
	E0A8dv1VXA8N0Fz2a8ure
X-Received: by 2002:a05:690c:6603:b0:8a5:1570:a298 with SMTP id
 00721157ae682-8b07edfeff1mr40474577b3.50.1791930513249; Tue, 13 Oct 2026
 15:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-9-384af01da3ee@chromium.org> <998a8c7b-82e3-4370-b0f4-765deccdb348@kernel.org>
In-Reply-To: <998a8c7b-82e3-4370-b0f4-765deccdb348@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:28:22 -0700
X-Gm-Features: AclHuK9UE5fFXMlu7KAnmwYM6JrldO8UdUyYtEVe8VXlPWtvlfdV-v2OaGNZ5vI
Message-ID: <CAEe3GZEuB+i2XS-GnGsmHaaULzThPL2wKT4j6QdMYbCCz47q8w@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] dt-bindings: input: Document hid-over-spi DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Dmitry Antipov <dmanti@microsoft.com>, 
	Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 11:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 10/10/2026 00:25, Jingyuan Liang wrote:
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> >
> > The properties are common to HID over SPI.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> No, fake test.

Will drop the tested-by tag in v6, thanks.

>
> Best regards,
> Krzysztof
