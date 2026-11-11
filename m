Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794362268;
	b=2aZ+AVZV1Vcbf4jOEOuSDiNE2M1fi0fZDVf9TPkMkeRtI7YUlgIR/i0tIMP+YuGr2uZ4
	 EUk7e2oVUcNoEcTu0h0/TeePoagi7q44A1VAcQPJYLJnr+RdGjiqZ+Lm5PmClsActtFMg
	 RKyu66DP6NoXJyxxVyocttf0f7BES8ZlN9X9mPkEVbya4u7nY87YSJpTapV1yf1cadSDK
	 0duYXXLAQHlP892cFQ7vrog09bku6eSMZ63P/N3nukIzMQZ0gQNlf7x4rNvuXQcTtY5gj
	 N7jjuV400wAcOdcw/lGcv/T6lwqzP7t96yluQJcf5duhFuTp5lfw5QDTUChnW3Rv3jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
	b=uQA8WSIWIW/8SZVjG7ticPCxphVcP5xPvyRmcNRyHlPNIzxL6ZN/PYQOnjZ1IQplv2ZB
	 pK2hun4xbD214q1L/J4YkRVpXnmiF+EJvSUC2oxrsRJdsMlnFZMXV/AZdB6LFlIYZGA5r
	 AFImcaE8E55h9KhxmwfSyDPhYrI2wvLS6KWx8ZKySnsIs90FH0a4fVm6df12+rH3npBaL
	 NfhnKf1U2BQ122dRssHP1oYR1Q34FMSSHpYy57d4yxMvSCIe+PrKc7xSW/EnNRlyFEgPZ
	 /Q3C5jg5mZjmZycB7rLYZnqT9Bsi7x95XmY1CoY7Kdlwa75/TffYzbwOWND21czAdIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gc6j0gFd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D364606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D364606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gc6j0gFd
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b300713befso23512657b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794362267; cv=none;
        d=google.com; s=arc-20260327;
        b=h01psl0WRZHFUhhD/emj2xMbG4yLec4zEmlJ/bm4WKsBtJTUxvzjXtQBfaPDEaFxc1
         FoNDsDmO7LvSBH47QiXBjla4E0vyXvdPb2br1oO30DCILHoqED9KgWGYX9kr0dQcxTaQ
         rxD8ellOFtatHTk4NPgG3e5ogwujSBq+bfy6z41h1WEKnnlDCcJe8LPzJFaWLzTReRXl
         Zzw75CkmqeuGgIlm7jqPtwC3Q/2YnRrDwiRjti3jCjUNORRr5SAt9WH/kJDyPY1kg9wb
         PLzN2rAiOfy34+l5IvEOEmAgn21m2+bGV+YBzCKL268jqpB0O1ASDSAwUcQMhIhju7wH
         C9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        fh=6oFZxB3POvioqJxOzNpFYslI7S7TNpdqP2q5makIMTI=;
        b=bceaLwMR0HMIRh21gd1PiTpkQyhPbNuLd6gnjyuxQs4s0+32daaMhFYjSv1200WU5h
         BC5sFWPERx6NfolabfseOaFLjBpF0JUlVSMorq9u0vnnTEjYAVw6eGeXS0NK8DYOs/4A
         i9WhsldV71zZOM50aSUZJN0wiuLY8+4nOw5nXleRHZny25TypKeevpXPjTbo7k0EmCJ9
         x+Q+bxvw2LEK6OIw15ytxjIi0F4jUe65XAr+i4TrP5gxQRhJq9RppEm62fGzXY/8sN/9
         AzhrT+qD83wFseQsWLDx/yvyHBVXX/+qRQjPYYGg5VI1kl8QYRcO/+mWwJUCuZg8+cWc
         p6Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794362267; x=1794967067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        b=Gc6j0gFdjp84SMRrPO2fu0xOmYK447dr9MikIWbL+L6NK7jKoog+HZ6NVoudTasbNH
         LJ7y9TEuxhgeeerS9XHsOriZlsP9I3yJZIebJ/85xKKDKCkHtix6lx1zRhuE0NONiJgG
         a7h8Jv2ugw++3Ihdu598/9ZN7HUCLjEZc1N5LV41B/UBlpZonluEpKgj9bbPkdck19Mw
         mu+xKtXj8defGbe3E7bpywhOTSdZ2aDwPfjoauqxlEn4is8HaqWsVCtPpVFsgz2cfcN2
         j6gHSFJl8OgTFVXunf2qvpdAUGEPBSpS0hxn+69Gnu7fCWOnumfw2u5QIUHhRrIAVXpt
         WBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362267; x=1794967067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        b=pWtmeVysfcshTj+PDuZd7z+R2lmcoh2AkbcV2hA9lhaMcVkyNwu9rO4Ldtf1gXbNAY
         OUdjeG+NDkBoZvQfjdefx+IXlnevHCu1WO3glCy9LX6JBt43KQulyhVlyT156JptC+kh
         zWwdEb3Z6J5BZGEzt3qdgAYDZHnldZH8AkBQtnVC18a8t+i/eUL9nrn/XUJ5hEhjkYLI
         MALuMEfzGv0K4xp/104BoHISbxQYAomLox3FQjUQX9iTsidSt+cVf3J6uc3qPn5TIfno
         3OjnuwO8jXDpo3wlRA8uqcBMME9Vcn+8w1jQPBDe6A35X76HlHAVoaiuCKdq+O4TwEdX
         QLRQ==
X-Forwarded-Encrypted: i=1; AL+hErGt0J/YdIejLOvnI7Ee0f/GjxT7G/wG/vEFbb/CyvCLl+qJ5ii47ZGBPzzij3eNRkvqDbgzodml9ZtLZkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hFf+aPVOtEvfUNrGyzuShvVYLWw+RkvloERTUpaedjGvkt8RT
	YwH98j5gpyCDgjvoCGqkFWfoAxEkPnydlJsQxSCOpQbZBKJRfFMvr8wTY2z/la/JIqa9mdmeidx
	kU/r1NrjCqzo9cPkrUFopk0tk1us5Jxg=
X-Gm-Gg: AYBFou2GifZb1K4WZ6IIVef7DWioWhzuWv59phozEl7UYt3+qyMmDofSPkZjNM2pFO/
	YpxXfbdsLibozB3JBG7XF+H3VxWtkI+rCoVSksNlVmkVsl8OUo6Y08ZMrXKN+5q54JjxXR4INUt
	Qslo6dzHBvIu3wGkHjPdBimtEjwdNylasByrORiYST+ATAi4D4GuhA7s2WzGOWtxeoWU/+TfJvu
	bsjyrFo6xcbNHsqFKHkPlzikyVeCoD//YdN8BXDTIfc52aGcxzq2rLPqY3BGAX0tHZBXwWDDC9d
	P+TIRm/lnEZXmvruZ7hCkrnLz0CujgmB+EFqD68cZOftZThmae3YhSh4gDxSQhmOTfTezlJr9Hz
	sCRV4l6PUKu0510VotOhHskF3pcYQm+CVDOReJfNSlxCr5PnyHpbQn5+xRXJ7sLZueZI=
X-Received: by 2002:a05:690e:80b:10b0:679:a190:cf21 with SMTP id
 956f58d0204a3-67c67f54906mr653906d50.40.1794362267159; Tue, 10 Nov 2026
 17:57:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com>
 <20261110-accurate-unselfish-cockle-3a39bd@quoll> <CANpmGNufv4_PM=1D1E-KRNQOuCPj8k+sGUJ1Y2HkkAtoSuL0Ow@mail.gmail.com>
 <3b5ac166-17aa-4418-bdb8-c7b9de22b991@kernel.org>
In-Reply-To: <3b5ac166-17aa-4418-bdb8-c7b9de22b991@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Wed, 11 Nov 2026 12:57:35 +1100
X-Gm-Features: AclHuK8xliRxrSv2YHsVIHXaEDGub-xO05VL_zEYwoOsVKkETettvgLLeJxK-6U
Message-ID: <CANpmGNuQQY-aiorBaNmzyywsVNR0P0NzCXnYweJ9fmkydYO2Gw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: input: apple: Add DockChannel HID transport
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:30=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> I would vote for input/hid.yaml
Thanks, I'll do that one. Because there's no change to the actual
structure, I'll wait until the 25th before sending v6, to give some
time for the mailbox / input maintainers to give feedback on the
drivers and anything they'd like changed for v6.

Thanks,
Michael
