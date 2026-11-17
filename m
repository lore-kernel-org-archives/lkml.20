Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927456;
	b=wThyyrWqQRYHq/RaoyLBoxYtwK/AEdAmMm4zKgqu1vRnfSYxhlAozxzA26ZC7mhZ3Kv3
	 jeqXr4f2atxPmr4PIuP02nNk7RFiRQY7kAVjvTKcBLw0yt/vdnfEgPxDiwVQMMzYZsN0F
	 M5Za19D34ygfA3qr3YJd1n0I0Hk7/7L017XvtH7gdRpJL+sKCs21XhJQgpciPbFSw3lfU
	 +ul+BHEt/4ZyQwx6mLdOMiiuE3SfDgSrSSbsC2n1q5iLKJpqOPQUCJiBW2+jpTIaUvC1A
	 6E+LMRWDdav+Knaspz1TV6uIqUyM6Seye4fnKfaG5sFfXgO5y3uybRV4MBpWITja0TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927456;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VaHYdskxBgJ5f/Er/TW8oHSSBf5pSt0lOXwfBFfdPtk=;
	b=jkP1MLNs7WhRPc0A8W28C2ftKaRIRZU+4cJDD+8db6CceaYEAIIgMvL7EnDujJ3lAt55
	 HnQ25qoMTtnSeLIb5GWw/BjnJdjYl6sY/cAb6dHD9GzXLsi9+yYW71OrsFYPr8umHnb6Q
	 tC7jkHHKTRcBYVIpXh0JJI7fZ1rD675SbdN6HoWrEO2ivyXct1VnMHCJ7v5hPiWoPTBG6
	 gTo2UX09AJZ0oIToXKnMBr3g1VuIZlfdXxp66/M5lQOMZSoqvwimoPQF+NJh8TIZe5b3a
	 9Ki3rBVclUxSj+xLOS1pKBhYhp3CKWSsorOMgUclYRuFgfw3eywtSGPq1UvBx/xw8ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NGAkj3mg;
	arc=none smtp.remote-ip=74.125.224.100
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A2606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D4A2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NGAkj3mg
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-677d35fd1d2so4755824d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927455; x=1795532255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VaHYdskxBgJ5f/Er/TW8oHSSBf5pSt0lOXwfBFfdPtk=;
        b=X/75C6DCSAlLefad1IwEy4M+wLSEmIrQ836f7fzDaua+JQCBMb3NO/gLVBnI1xwmjW
         Jp+hjdoRe76brl6qyGX+n86hbdcDf01a8NS0daAQAN87s01OlOifjhFd6nqG9jNxPmGB
         70QScVGjMi953zNwuvt48I1/Ra09asuS8h/v1UDm4xi30eJNqhelQfYeHbjPb1tUfgF0
         GL0rOUeid2EZWetFB9VdzJ8CkLlf/22K5UtkIeU8SsY//tA1U83UxPnK6ttWWB0YjWrC
         NsdYtuMbafY6chMuPYkssemlawEiV0HKR3JsaXNCKjp85kaMulJgU7uQ3eo/eDEpP4nR
         7M/Q==
X-Forwarded-Encrypted: i=1; AL+hErH9ryyHF/r5MdjHKRr+EFFq6MAxdoLYt3soLvwSC/x3XTvFxs+qTlLwXAP4t5jBbBIVlZT1SuzJIpJ/A9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aJrK6NI2oInIw8hF7J1EqPCw5hMG44MdZ+Q+H61ryx2KCqYfv
	uWoij3keCY7ObjTSltNnFlKtmLtB8d0r6ybg+W7N332V1Rs/blgkHqFXh+61mMX3J9QdlpWs722
	ODn45FyXD0U69DvGxmCLhXx/wl285/742QboDY70OA/ykWx8QMOM7wdJC1jZ8NfjHep0jFB1HLY
	If293BLlNFT5PwNlKBgBcG8gkot8V05bxD0yCSh58C9O/ktKHAzY4EJWCbTHK3sUHFw6zUcQ6Wb
	0GCxJWHEJ+aqJaOlMDBmQ==
X-Gm-Gg: AZFdTZfw/qFytzfkehlR64JKnqco+jHlM7tFUWV/ytrGm1iwJ3j7TB0u1TC/60/Syio
	bn2qk0aBTrKtczbZr73GEjZGjwThKCE6A+SSIqUMILrAzScYwH6ILxyk5sXZGp0ObOGQ6OE1k9C
	5AxYPA8PgZYbuR0WxbSrDKQ70ed7I48voOng8rYMdMv0XO0CfZnPz20QcWdpgZpQJuU7y6Lefr7
	Gfydwk2TElFwCRTJMiBzM9LpjbZ4m+pO2Lpj8zRLPV2VES1zVtUTizp+3yknkEhS6VgyeP8++bM
	z+g5ABs/PsTRphb+fnDRcQmrfTNbZJkkSmmZoJp3Ao6mfdhQYuM0uBZnJ8WNm87mOQTDWbOby+d
	9GvJW+3QVlJg2d7srO3ea+yRU22jbHcMX3iFp5D323QrEZIA6h6rrzbaXbOHmIZPV51HG9sJgBC
	wVYPlefayoypEXgsPu4t3m9kiLldmyiBpOsOP7iw==
X-Received: by 2002:a05:690e:12ce:b0:67d:b2e3:e57f with SMTP id 956f58d0204a3-67db2e3f03cmr3488459d50.75.1794927455254;
        Tue, 17 Nov 2026 06:57:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67da1d01236sm72589d50.31.2026.11.17.06.57.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:57:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e29c25101so2146934f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794927453; x=1795532253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VaHYdskxBgJ5f/Er/TW8oHSSBf5pSt0lOXwfBFfdPtk=;
        b=NGAkj3mgM0YCn4r+4HQ9fmXpMrLPf1Q0JvEhb50p763RLeEKqEpXkdSShpJhGrjXRD
         RX+iN8dE+BY+JktS6CPBjs2oIVYNCsrV2d1ZBJA1esoIpSWjouRiTRFNIA+aN1sXG0ny
         q0Bgx13TQEcnPJauLQ7zl3uaHNEGpiAZY9C/A=
X-Forwarded-Encrypted: i=1; AL+hErFLGtQXubVKXHAqIJvviiPc2Lc53f5hBEp/tcACQRtPcNpfWMRC6H45Wr0YHUkqFPDskJv///akeoJ7EDM=@vger.kernel.org
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6f45:2a77 with SMTP id 5b1f17b1804b1-4bb6f452d39mr188021305e9.11.1794927453483;
        Tue, 17 Nov 2026 06:57:33 -0800 (PST)
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6f45:2a77 with SMTP id
 5b1f17b1804b1-4bb6f452d39mr188020445e9.11.1794927452733; Tue, 17 Nov 2026
 06:57:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074849.475815-1-stefan.chulski@broadcom.com>
 <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
 <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com>
 <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
 <CA+Fu+LPnXMd9rMtywkZL77XzLq8n+8AiBW2T8Cau10YnVbofiQ@mail.gmail.com>
 <CAKYAXd-xM=gmpjz7g0+n+ZBA4Vb0Sz2i7B89Cs7XdHUY7U6WdA@mail.gmail.com> <1840b905-479a-46e3-97a9-b2f40cd50c29@kylinos.cn>
In-Reply-To: <1840b905-479a-46e3-97a9-b2f40cd50c29@kylinos.cn>
From: Stefan Chulski <stefan.chulski@broadcom.com>
Date: Tue, 17 Nov 2026 16:57:19 +0200
X-Gm-Features: Aa3M54q6UrvDJCXyy-Tq8up-xKFoPuFafstRfqFIuifIOUygyu9m1cZGcxONfis
Message-ID: <CA+Fu+LNry=dgUdEpULq6vZhnLRdVX39syn4E0Qafia36dHTn8w@mail.gmail.com>
Subject: Re: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the
 ksmbd-io workqueue
To: Huiwen He <hehuiwen@kylinos.cn>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	linux-cifs@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ilya Lifshits <ilya.lifshits@broadcom.com>, 
	Gil Benamar <gil.benamar@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, Nov 17, 2026 at 4:40=E2=80=AFPM Huiwen He <hehuiwen@kylinos.cn> wro=
te:
>
> Hi Namjae, Stefan,
>
> Simply routing WRITE requests to an unbound workqueue is not sufficient,
> as I've observed performance regressions across a number of workloads.
> I've since developed a more complete approach and will post it soon.
>
> Thanks,
> Huiwen

Sounds good, please cc me on the new patchset when you post it.
I originally tried to keep my changes as simple as possible, but I
look forward to seeing your approach.

Regards,
Stefan
