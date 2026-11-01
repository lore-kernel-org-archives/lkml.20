Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793574952;
	b=p7vPYKFQLA3TTAOwAubupTNTGOORyXu+PtFa09CDuxRl1xUN5rMZHa7atufVL0PS0WZM
	 1Qjr/yXN2kXmVVWatZ1U+5aCatAvmm0fWXQ0pebASiiIJ0Zr/XDt4Wv912xgWNqIN+7/L
	 NZ+mIVy56ztemlZhFUd/zPDD7E7lYE3SQlX4V7j6RnWsLDyeSxeI33HEB09e6LN4S5rgU
	 jl3ym+Mkt1rSttCSuqDXdMlCYDVedbKQvPZBhEH4ddc+WJlRYDiiwldlAqnwzHoU64lAC
	 9yonTrFr0rVQL+vN4/PH6KOHvTHlVEprz+sv0dmNESnA15VSDcbtEcAt/WfDxmeIWeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
	b=eARnF48aUJRUiulpC0fsOgrsYkAhdkLdzVPpWUcNUkKSDtIf6NbKdR97BD74eDAR/aUo
	 XlYUzZWdDijdWw9ylGr7GG8Flaqk0AmcsBN/A45WlTpTwI1avK7bdSTVQcJunlcSukrRx
	 xHjWfv2k5f56sZw/10sxg/LxatUzg1MLpDNgOqeLqmqRkeRRL4w0qxKtGBc4R1zEGCImL
	 kyCB+LvhvfBTop2+zmoEzrcPwr8WZ0U3IAOt2jxxocktFZ/xJPkJfKbMMBYGyvhHiCyXs
	 r1p6r2lyAsEcUoObt6smueTEn2M0ukde/YwGgmYxiInsexH2lQumvABjp/pTFBv6Ryg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73BD606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so7168a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:15:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574945; cv=none;
        d=google.com; s=arc-20260327;
        b=g3vkz49b6UE8mkJiCI0P9yofK1yVXPZk5O0Dsuijz+P/qEDZIBveWMV6/UMusYx17J
         SKtvxvBuenqjVllo3Xigb85gZYh6gF4y1S8exYU7wv2LaeqqPJt+F47Gwux0yeY2cXK9
         XAR6D4tvguKd3wMLJwu9nwZVsgUK5KnhOHGSWR9jYEOXDxf48OJKz7IcvxpWNI1NAGy3
         X6PN8jUjILPY06DrZxAYMvTJq8jHLa3yWWu9Q+z8FjM2QUHvMV6DhAnnSrxF/5CNx6Ki
         J80vUTnII5x4pywGyxPeGP67nUdmW2wzY2upBoSl7hOvpmAF5kOGIHJJG0cpMe5up+IZ
         kNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
        fh=pLit130L1MTHQsLr27xwQ6TtcQIturNaro38/dbeYr4=;
        b=rW5Qhdrvalu4zen4rR+7EY5DSIuggQlx/lkyPa4HhKIjWhqROKyB1H15MyJ7dGl7xn
         9rsz6cFDNv+3l7yxFbDAwwDXENqP0zl2nPoTy8YWrECnYULxIBdWTfxzU1QhjTMgr62Z
         2jhz/8JRxZY4aYmbUqCF2yQPKx4WCJCRPXWG6aI75r0hBFUvRvpYkFKmLtlhJnt+hksn
         Y7r0E053klhBmrqsvRunbEnaiNhe4AIZUuDot5zPFsJYIw79s8CwNePtCmHccac1pXZ2
         lOMAn/Ad2RTQFtzRmP7prsoHu976A0ObOZVgfwXMyqTpuAfs5AJ7iuHHMnPr89BMe1X1
         RAfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793574945; x=1794179745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
        b=hFbJtLRnNrWh9MczBVUqeHa6U6vBtL5Ropz9byKDoNLVHM87ltQr5NGlVo9+ozlqCE
         zCDbKcJYaT94e1dxw/Tl2UYTrALEmcu44Sdv+omfskaXW9uWk8l+BS5O+UYhaasoezsP
         QmUBkekyhVGcuiLRAHX2bsZXRHnGRLg08Qp+xKModUiXTfY2OCjYIvtANXAdTG0v4TNK
         zRLI7sKCdAUAyM0qQu3FA702xRVGzCQthGPmRzYyviVOrDfcPOzaWtJNM/ZhFIVN763t
         x+PQrfOvRfHZvM5mLxU1/1lHsxnJniaj65ghOzY5FFLgemheiUlWhWVkM5wETrQ0wSFo
         nFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574945; x=1794179745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
        b=JMfODHiknKPzJbpcaWRI0nwYNb0GYucUYf3ctkpfgHwLyuqHebQjVcviBtqdLXJZgt
         TCgVoE0LBNzelcVup0c0KW+N9uePsbXWfOWlEBXLhofteKnf9foDn8y0K6Pt/mh8WXPT
         dk5F+0NWZjn5I09BX43J1pprEUHJelvulyWwi08stgBknTAfeHEReZDIQSNHZ9bLzAsb
         IIomYkiNSSBbmRXy9dopan9u4FGl9O+skQ9pjXqnlk+pPlSULs28asYojWpSRxlmzGPG
         QrfT5TwA+U7LzK2F/GFlcxHMMZwJ5aEQQ6pIZEl1wCG6knTzZHnhM5krlwIv6n6tv+7g
         cGbw==
X-Forwarded-Encrypted: i=1; AKwUvBzKVA1KKcK7v9KGT/GyKXYNwiPwi0bJuyjjSEmm1NbGtyDToYz+UlPdQ4g4uQp2w4nVq53H6Bb1ZkDhytU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g3ejgkthrG1XGZFThi9EOy3EEYQgoWQK0DQa9+8WgNh5OKKAS
	eCKiTWbPKMm7fbITBqv5KT/FzdmLK+xRi5znjC2WBBdjJeP2hWkLbpkII7vNqcXbv7LJ5QsKRP5
	FDf2suJG5EXywRvH04tvyEu6rBMLxKQenHp/1pCpg
X-Gm-Gg: AYBFou0DunQepG6NE3GDwCZ10SNBAOlulfDNc5n1TpcGnFse1ifULfudLoETMZmv4op
	vexmLmsiOyiwOO53xU6kuzYgRUEWVw8HGuDcEWsVfcqyGM24xCL40iIobl5EQIiZ4gR1Gtcu6XE
	P80nPzzBDKbhbzJL+urV/KHvhmTNOfaAHYHq6QZx9Kv0NtGmugp6SwMYt/DeGblVE8e+WkbBfGN
	7mfYQtiRzG3fPy4xiHDRFUu//BXPh7fsZGKZIbbLXzCSi+RaCEkZHONecWDzgAO3EVOPYyD9A6i
	rPY2b/49ijYf9SsJtM3CbX/aw6aKxNCMs+8ihZ3llnI3IcHWEf6QwO3Sbs3t40xRa/XRiM+t7v4
	sXfQz0Bmw+WeSmPkNDAsrSmDLpYGHQRYCLFGEnsA=
X-Received: by 2002:a05:6402:1a58:b0:6b4:880b:1b61 with SMTP id
 4fb4d7f45d1cf-6b4b3cd2861mr242904a12.12.1793574944562; Sun, 01 Nov 2026
 15:15:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083539.777877-3-almasrymina@google.com> <179357408360.3131.16098294926514442303@kernel.org>
In-Reply-To: <179357408360.3131.16098294926514442303@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 1 Nov 2026 15:15:31 -0800
X-Gm-Features: AclHuK-UFMQ382VldDl9mQXawkR9RuLEX9lDNBBCTFPZuNPb5GUS05WDrMHtxpk
Message-ID: <CAHS8izO=-DZzaeFbczj=c5yGszo6parXeQNqqGV8oieZbmMW=w@mail.gmail.com>
Subject: Re: [PATCH net v5 2/4] net: devmem: detach TX bindings on NETDEV_UNREGISTER
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, pabeni@redhat.com, sdf@fomichev.me, 
	kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org, 
	tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 3:01=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] This patch's TX detach is incomplete.

I know about the issues with leased devices. That needs a bit of a
rework, which I have done locally, and would like to send out as a
follow up fix so I don't hold back this series.

--=20
Thanks,
Mina
