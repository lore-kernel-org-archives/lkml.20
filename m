Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800839;
	b=UW4Uj7G5GaZ30QPMNvtxN6iRi2QaFW5jqvHGNY/V8Y5NsIO1r6SIKj/SuJvtU9Ioq6CD
	 ioKfbqj3i4CZz8w4GHAwY9OgelWenx0Yg3M7jTd6Qkp/ei/Kx3W+cwgr1vt70sD9tJ7CZ
	 +HbZoL7ASON/y2LtcnqzirIjw1Jh5WHoiWW1Vnayj8n3EWN0mUcne0/HQpgMAQ3QkHbry
	 sCnMB6EsUwE9CmQWhJEtS4ooGLmqZ5CfqpXSaQl3YoSiKwVk/lK7yCqAAhWWho5uRfbY1
	 D563gs4qb/WQ2d8nAg+whHgKDg7tWcj7OK8ldC/3axiFCDtQ3p6ARMhalnCu/mRwyaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
	b=4e0KJ3GKVdWS4OuCGs5gda2QsDEwlAV4TZYX/hEgIPwNnWDjc8jIDnXb38uiD5Ph1XZ8
	 p/h/TIU15p8lZ1OEGSssva17ivKevtTz6YBnjGJmoiuh6WmbEf3oC8jcOdgFP0IK7Hg29
	 DSmOAoo21CZeMjzDn6J5Wn8236Ni6LkStI+1BK33B+oxw1VVBmW5A8w8pZMkxS5LNpvrg
	 PNFpMEyOORxvFZ2U6dgakIgUv/PecY3KMP2GvUR2wjWRyaLKWA6JCCxbifDwKl1Fk7a3D
	 gS3CxBMpXLOAyfWL+1C5scD2JM/MhksJUIH45RS3iZdamdWOgz5v+hW8n5FSPbmnBYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84089606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84089606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a8cc11ac42so918295c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800838; x=1794405638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=lVAYG9Bmc2hoKTJuJzSrH6J+IhryAyiDTSMdo0aYG9mfqjPS/ga8+3YK2Ad//sbXE2
         HHofzfmuuJ/nJx0kE/6IytFncp6WqXb39RvQM+YnlJNPVlx4UDFXx8nAXhQykpg/r9dU
         TTw9D3mrL7B/AtTF/tGzwS4DWBrit2U6UIDoeAg8Au1ygMhfLw7GRk8WtuLYUaZkwSTF
         aYRfMnD7tWD2+C7sh5TWr6OTrCzca5srbXzkmLr+/5fdNnNFJYIheqB8xKYVa8MXmxFB
         4bAPEVWyyZRmC6vgyn2/OYmqQ8nZ9BmRTU8WOS8FvaydjpnVOWQKGf91yFtKwUSqhNCh
         RSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800838; x=1794405638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=B2enlaIQlOLH0ZQvMWdnQFkcxwQXhDuALDtUrlUUqbNdEWwc8Mmezidk2ojQXB9ih5
         MKmp1N4B1g5VSOHyHCSA1HjGz9GhpYkHbEG2bCLoQsyfjTuPzx9Wv0T9YMrUE+kBO/Rm
         L6CNe4Z8CWwYaQPuxnji3CeoizylAqBxRpT0xNMBSz/evBNC2BTjaTu4iVyB7hZmpTEk
         hAxuEsTJl3yvettry7MSnPCs534C4EGX4p1/PbFTqe0UxwaCcsIjidNNaHJRi132sKyX
         aW5qH+aITGme0sa1JMUg3MjWsbjbtbevG+bI+nvY5yjxrOFYPyBj8uVa3YgVJvOzTCmF
         jRIw==
X-Forwarded-Encrypted: i=1; AKwUvBxPlP+WJQoIIE2P8jBGtWkyICHdMryHrHYHxFUtTI3sK3BotMX4uYRcMKseNe75Pl+9KTJrC/ycrDPy9zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ls64iAjHmYVFAm99lmKyi/P46sDwNdF2ZQhs1DyLYxU0Z1LVc
	mK+W9pgf4QlH58dAKR4Zzg1g1UYV4kbKfQ+7Dxt4UQann+eJpkKADRyI
X-Gm-Gg: AYBFou3ml41wA4Mo+A4l/R4PygmnZ7oiy7yY7jtBo7ao5Ej05hHk8mxFvL/UjXkCpG7
	ZiKsSgv5/OpH70ljlFx+8ilLm4tzaKOjQafeBpgQGuFGSEOGpqGvCKk1h4CBBF7HxNADFGavvwz
	Vp2Vy5fj0j+yD9sOc/gbewmf5pUOuncHh1qXXXrLPH6V8N+oI8Yvc9i6Hq6hlSncq8HJ+BGttbq
	quaJHWzsZVJ2ccNU31npXhMQGX06NHQnu8KeRKS4rDm5v4UCAUvFVnNwJvEDk67IrEWOBlDucHI
	Vwzfhl+aGSfTMq4IrdEOt37CgNVVhltOQMiJQoKTQXM1luhuDrQOdz7LhW29Dxj1OaxTKhOhL7r
	8BKWbMYriTjdkTpadx6dJTY/tKthj1P+cuKc8p+k7oQcaaWe/BN95TNX10qRpg+AGTcYm0BSckQ
	8ZelpVTkXblv5Bx0N2o83pRlnJ3KjzZT/6/7S26c3sna4VkENpSMCR6ChLNlO7zeNt4HRKUtFxK
	HzMrXqjRqYqwbeGICFATVmYoOCiqFt/eRNmlhafj3hSwHBisGoTH2y7/AzzrsMxm0a7KQLNkOla
	lwY8UHnKMz4XhLeTfZO0NJg2G+sVHM0vUVJY9XXlrd/BhSva0COSRuR02eJIpyMVYUu59tw/QHv
	zN0w=
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr25563977c88.30.1793800837135;
        Wed, 04 Nov 2026 06:00:37 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8553620c88.13.2026.11.04.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:00:36 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC v3 00/17] riscv: add initial Zhihe A210 support using SCMI clocks and resets
Date: Wed,  4 Nov 2026 22:00:30 +0800
Message-ID: <20261104140031.1172491-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9b99c531-1977-4bc1-8105-bd9c3e129951@kernel.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Krzysztof

On Wed, 4 Nov 2026 09:24:15 +0100 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/11/2026 20:45, Han Gao wrote:
> > This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> > and V2 boards.
> > 
> > The A210 has four C908V and four C920V2 cores, plus an E902 management
> > core. The E902 firmware handles clocks, resets, power, the PMIC and
> > CPU DVFS, so Linux uses SCMI for clocks and resets. The only new SCMI
> > piece is the mailbox to the E902. [2] explains why I picked SCMI over
> > RPMI.
> > 
> Considering how vulab@iscas.ac.cn is ignoring reviews/comments and spams
> with a lot of unthreaded emails, completely disregarding any tries of
> contact over last 1.5 months, shall we ignore all contributions from
> @iscas.ac.cn?
> 
> Maybe this will be the only way to actually be heard?

Apologies, I am unable to communicate directly with the team at vulab,
but I have passed the relevant information on to them;
I trust they will handle the matter appropriately.

Thanks,
Han

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
