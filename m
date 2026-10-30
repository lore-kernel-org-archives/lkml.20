Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359942;
	b=BfBMvv8xDXEu5m6S4rH7bTH1bpZ3X15eHa2R3+OemyDPQAXVYQ7B/lcfnb4MuN1lNc+3
	 X3VlG5WlEYKuEfuEUH/C2UiOlm5Y8U430EpWINIGtS9PbxLnhew4ar3zJWv+LkIdlSSaw
	 TtX2NcuVrV+zkbTu9LoZVfpQEls4GdQHD5z6OIsce8Y1nbuCx6z2Iotn9QzXCb+jwQvsz
	 WaRbXJmWYCCF4JPX6YdRq3C4kiYdHtz3jScZqzn+DcGMizMoZvtQywTajZp1Qca/HpYf5
	 oIH5wyqnhY6iTwHoLG2YbKMUmPrRM4eK5A58sSExdncESyCwp/xA1/tG/85J4PSo2NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=bCRXJOfL1rF+9fr+UKD9RmwMJVlMYUb3ngXZoi9U2Uw=;
	b=mQGlIDsRjrYbhhgXbkz+lwZYMCMVjiFQ9hquBLEc7z2KfMr7p9Utb5H9Le1ZTKZn3/GG
	 kessvMYI86/gWd/CmDpx3av34IXefS68cSWf3nhYu5WbdpzSXp30TZqoU4yLTdd1q6eJk
	 5j7Ln4EpKjp2qEmvJ5xT/3rhkBuyvjnZ1nBdBGjKXgDX5/cbbqHo+YQS6thS03fhSqmMW
	 QhTeTIk98umifrMdGJ8cuXzK1PUP9wWp04AjFeFZHjLleCpQ4v7tvLo19I433E8mmPo9f
	 WswOWIORCPxxWy8edJ6rxQCQhyEaowWe2EsnvejicGnbD0vhbQWik3v7rlCrsUaPWCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w03xlHOL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF54E606A339
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF54E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w03xlHOL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so5480945e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793359940; x=1793964740; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bCRXJOfL1rF+9fr+UKD9RmwMJVlMYUb3ngXZoi9U2Uw=;
        b=w03xlHOLF/X/r9/Qy7G4IHunwOFbxWFcuqCTaRy9YMih0FbCwFskjFyoQpFFKP/ylq
         g+ofcPtcLkburnrrfM2FkhCJb1Oi9InixLTIUp1KY3PbN739V6VmVuLwJfuj/Tki4Mqr
         rXjZHmvo3Qv/spuhAb3y0KfY6MDNUh4kk7fpeF74S2aJ1y8q+EB6sGQYjE4z1/ozFLWJ
         Gl1xbJKkgjS+ODriXEY/Vxkt2R4CGCLh82iHmVipcsj9o27kcqhF8i+KPyuP+S07aZbo
         aQh8yA+RmmEwum73ufUgZWDuXjO055n7E55+UIMNVLoOudSa8jG6nrkQus0/HGQi3uLs
         S0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359940; x=1793964740;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCRXJOfL1rF+9fr+UKD9RmwMJVlMYUb3ngXZoi9U2Uw=;
        b=Pbr/ggEk0ngHHLRvNU5s9/GBlSc5uhgXLue+5S2TwMFnzizp6CUL2DUHXxIZ8AmKhu
         tYFa6iTCiO8PBLJ3laxMPVC+fpWdOl7tU6sv+k++zZbyw0Dq9YN5zc6c/Fde4fsVluUk
         OSfIZ5N11MRR+KsxyphDSvxSGEQPa6FTQ45WlCkaNcods0MGWv8q0TT56QElyIV/NbEU
         +FC4TY2ohqriUBT6q9mE4p/Vi4zAoW4s4eY2SNUtbWlKQyLbEXnIGIXmJ6HgkDV7RspH
         RFTNSO4d9d9G1gpoq5Qa1/6ta5tk/KeyL8nA6QNHH4nuSyF7MdVL4xCEco5OFi9/pmGW
         RIfw==
X-Forwarded-Encrypted: i=1; AKwUvBwYxAbWdQ6Z0lMzRuuEfT2pEdZYtvDM0w6GPQxq287gSfPevSd7r+/FBzYQBz58ljZl04TEVclr6ZA0104=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwwEhQE1wN22t0AFuCHaAR6E0sEgBbozIKBewc4jLlSsQBdC4U
	uCVppWDNZKz6PSZ+tMIemqZMlPj4elqyy5zPD3U8jYPkS4TdXjnlGNKbNbzLH4uvQJM=
X-Gm-Gg: AYBFou0leVNCe3ZeaCw05jKjSaew0/upUdZCp8otyE5PMNbvluff7PktoMj/QjoUFTd
	YdYw7qrb5wO79l1v9bbH5rTCe6wE6vvVmUtaZAjKuxoJoejQiAfKMPVtSpmb+ogVdT0byF//xry
	Ev9ejBC0uMm1G9pJn0GCsKS88cfaa1YFAV665EmkAXoJu7DmHxq53xCRCW+UQcv9Xm59jgiajXw
	VZtqPaal1LM3IbSyyAgK9sF7m1FSE0YBE8fSwcQwZHqayJ/0TYsqL099/9JQ2TrTH+DRj6d+fEf
	26Ewok1vPVptVS9wtri2uwju2SGYyM5KCaeeYxIJPYTA2PtTQJBtMVvCYH4m2LaIht0PtqdzePw
	ZAQYkCE/rlrFWBfpBztJAQPz4Z4E9641KXaoKAu5HBSitdRGSvPgdvbw9NfFZiD+bMKu0UAqFTC
	8+klRKeBp4Se0saO7ciHUbDEfn7YQI4NWHn2v20t8JTlZXkx8xu8N6yRi6NX6sQ15ucDPKjAFeR
	RwKUYPx05NhsMkqmm5ORMjIPaMjq34PgtVj6JmwibkAtBD+JX6eJB6p689wKhhJt9eAS9X7t3uG
	uQ8SnjtpL71t9vRgBwFXFsQW3t0trVCvhg==
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr40702125e9.17.1793359940297;
        Fri, 30 Oct 2026 04:32:20 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm133071965e9.7.2026.10.30.04.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:32:19 -0700 (PDT)
Message-ID: <3e4f24686842918a3a340cab4a7cbeb7540b8a1e.camel@linaro.org>
Subject: Re: [PATCH 6.12.y] kbuild: link-vmlinux.sh: improve detection of
 third pass requirement
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Juan Yescas	 <jyescas@google.com>,
 linux-kbuild@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 kernel-team@android.com
Date: Fri, 30 Oct 2026 11:34:34 +0000
In-Reply-To: <20261030-linux-kallsyms-fix-6-12-v1-1-9c43c892de04@linaro.org>
References: <20261030-linux-kallsyms-fix-6-12-v1-1-9c43c892de04@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-10-30 at 11:29 +0000, Andr=C3=A9 Draszik wrote:
> xxUpstream 14b8b4bf2d7b cherry-picks cleanly onto 7.2; please apply it to
> the stable 7.2 tree as well.

Forgot to remove this stray comment from the v6.18 version. Please ignore
this line.


A.
