Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874425;
	b=VP+2TrTynbizbInTepmHld3uky1QQkLRvjnbxvRzXTMlYqcgmW6lLce1eip90HrTDqNr
	 IBgbBnGtGhiFkfEl/Hj2f68rPcKcRf06K85idc/9EzZvcxykaE4q8U7AG9WuClx+iMDFX
	 Qjlv+vgB9C/joNht8ub95hOFvPd2Y+dUEBEiWMX/4I/Ke+Gb7u1AgoSgLEQGsitduySL8
	 UO594kKogQ+h7UD9wMUZq8MVmJsvr/F84N4h9DlmNgtSW/eLGpuMYjbcb+IhdPBCoGLqw
	 fXIgUgyJj2O94vjKj1a3lSa9ZTHA/jqmDdWGPu+wbEQ2/ZpoFHByC1FPMEpdYlQuOlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874425;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h/gdacrfTiLelWq/exWpeXojbuqsCH08OJQEuYg8YBw=;
	b=m7NHxoJ67ovPVjKaF9Zt5YGG3Gr48tuc1mnspq3POi/NdmeZ8h72m8RjP9o+UAK+5Rrm
	 cksnQuknXSWqtsjOQk84VR0oNiJ+sg4uEMHMuXQpi7yynjrJ4mmMYXubYhFmyh3/eqsez
	 ha6qbuw7Cp8wFU6McNfeSZ9nCTb7hH9aaUbMH7h+k5OExUtjZjWtG0tzsjzzs6uww9+TU
	 hVqcdbyDd4ZMJ7b2P6WtVvWyxh6/0csqV2iGuwWx46bW1Rbbn2uFQfyVVl2hlrrvzGZC9
	 kHudbPEVBK+KcGKVDZp7sdwfbnN7ofPCyJmx77vTTBUXj+yGB5PZqMeZeEuObvASN4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77866606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77866606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2249092a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874424; x=1795479224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/gdacrfTiLelWq/exWpeXojbuqsCH08OJQEuYg8YBw=;
        b=WPN9LPHa1iJXuKqs92cfmu8yjvGlz6kAMOj9Nv5xeFDhGP2/Vc+Nkn5B9PDV3oSwAr
         sm7dnd2d4OC5yOtCZMJdVW69s4kM7w1nqqaukzpnaK6yRVLgvM8Q/SUDo9jwUM1M5brO
         xWchpHNKl2Bd1P9hg09jDDzCQ1ffUIePNCOhSE+XjyL6QyuiI7/0w8OZb+Z4SoBcf19S
         VapDiRRSlFbuNtK0mZjV8d7CAkBL7rhk1l8YItntiIMLKdTngJ6hFgNk2S6K3zQuXmA5
         XAafrCmX9o5HnQ8JfnTMYAfbN3JxwLZMsd4ioGy9sqImcUqqU43cBB4t0k0dAXIxUd1t
         N3nQ==
X-Forwarded-Encrypted: i=1; AL+hErEz21g9WP1hzpUZgPm1cZ2DLI4qVkMaWkdLqXhlynJaaDyp+Evgh8dHJNXNL6DIDPMfgDLvxDkrNd2OmIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sT1Plu+KmIvIYqO7xezO/+xaROHxmWaU05rFrnHYbGBAdbRVB
	cje93dfEjabM1k55ADMgCXfevblvaZEPkWRKrlMjeLjSVzAwHck9Xaw8hQUy5Cnp
X-Gm-Gg: AZFdTZdiNZN9SGqsoZzU9RVDEgTjL6pIOzjKzKo59LKF/XUkKUgAKOCOwaNeMLdp5aE
	E3mdYHgvi7ezbXge2N3jortHRey+4+zM2YGLNxNQO7TTXAZX8kTdtq5W4YEGpacLOiq2JocypJv
	l3YAr+dYkyRXML0Kcme5Tasdx4KJz6qkplLP6RYwjo3rCOOmg7e39XxckHKWu9ks4K761je1mUb
	Rwgnm7+vEFZc/YDP3rd9Xr+WuMGo6t1uoXPDXn3Dc+rpt+pq58EmrS8yNxngRhlZ9jfTQ0gm0eI
	/2IRY6pI8Fs6uhLgDeU+98CaWn+GnACQcE3V8gFJD/JHIg0BfBgqhe+Oka70lmrfqE4RdimRkKQ
	jTXSOOqzTzthIOuH6QWvzEy9nles1hLP8tIJXqYNGNd1UTcZf2F1i4hfTiIWxFPIWPiMUv8Bxlt
	TJhNswnQ2OAjeYVd2cFoQI6obOXzhBDtFIMn/C14E8Nv+NnNNUbVPDdNvMOaL62rOtnPxTLZuun
	qmsic+u7dnTcoC+WY3FpJUS3qN+dse/sufUsBEUc3BPpauYU1rT/VGjRjKHZZsKYV7HMKMLVgr+
	aDH1zj0cxGIJd9kOEuKbqOjX8rSIdIccJBT52svdZBwfp3peXj+pixfZ0/o4z0QG9Xl23rzSGPS
	/pGM2/+6cchyW1vmNBAN+p3u4RnUAs165i37HhL2v8fnR
X-Received: by 2002:a17:90b:3890:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3b1b0a4c362mr10100578a91.32.1794874423613;
        Mon, 16 Nov 2026 16:13:43 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abebf1aesm1226762a91.16.2026.11.16.16.13.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 16:13:43 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3712b6d9843so3361220eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:13:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHYw5/fWAp6W1FY5S21lZ5/l9/FZ7R6tPWArXYUV+HVuw//xOx1hnbApY0sAPJueSUhgT07BEZy3bunCTs=@vger.kernel.org
X-Received: by 2002:a05:693c:8852:b0:36a:1452:8dad with SMTP id
 5a478bee46e88-37966f32039mr11934066eec.20.1794874422435; Mon, 16 Nov 2026
 16:13:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev> <179472506475.2199510.697226978948266850@kernel.org>
In-Reply-To: <179472506475.2199510.697226978948266850@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 19:13:30 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7BJZcPdnYQu6aivUsbrofVSEbs4W5fZqV-cO9iTdQ=0Q@mail.gmail.com>
X-Gm-Features: Aa3M54ofcAZjY_xnWHNA845PgMGAu4WiQ21uf2gdh6--4iLizzUdSyAzlZq7n94
Message-ID: <CAPY4CJ7BJZcPdnYQu6aivUsbrofVSEbs4W5fZqV-cO9iTdQ=0Q@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: b53: mirror BPDUs to CPU port 5 when
 port 8 is not a CPU port
To: netdev-bot+sashiko@kernel.org
Cc: florian.fainelli@broadcom.com, jonas.gorski@gmail.com, andrew@lunn.ch, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026, netdev-bot+sashiko@kernel.org wrote:
> - [High] The new condition in b53_brcm_hdr_setup() calls
>   `!dsa_is_cpu_port(ds, B53_CPU_PORT)` (port 8) without checking that=E2=
=80=A6
> - [Low] The commit fixes a user-visible bug but has no Fixes: tag.

Both are right. v2 will check that port 8 exists before calling
dsa_is_cpu_port() on it, and will carry the Fixes: tag.

pw-bot: cr
