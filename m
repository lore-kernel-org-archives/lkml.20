Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C43D518144
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066557; cv=none; b=odw4gkpMtXcUe0ZE6fYnBsFg9HIktIuV30U8WCIUFZ6+jWMZOLNmcxKxUT2uUZgGaYzeuLHN3dhVDmucUExFSj3zM5n+OjtKRHUjRkNQfHCymc/7gopI0tWj20U65JdstSabvHPNGgPrj79YyUe+Jf1vBYwGrLxiAuNLHuqzygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066557; c=relaxed/simple;
	bh=6oVcdzmMK85KNvYQY8vkwxZflX80T2BxPJ9HHlrFwhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOpaugMkqhW/HMMy/w+4kVzdNoRjHbeDqzoY/kBjy3dA3wJCkIYBq1atT3fq06mc7H9AQAkSu5SlwKIMMnFcIvmkqG4q2XvzvMtwsZ0SI1V+7+jOT9u2MezEf8sauAFEiWXUByoomNQHLQHNlPLxGixzXiToyUReghx3tYVh7Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0fqI17P; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0fqI17P"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2db710396ffso39012325ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066556; x=1792671356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SN6vSgMsnnJYN+HFBZesKCHrB6GOW3IUndONKHtHc6k=;
        b=C0fqI17PEw1Nreamv0VY+6rVmQEuJzI37WV1dX3mXFIjW+S0m3TzXpOIvfDRnT8dGO
         l2cQW2aw5UXXFgENemBpyuydEvLCSI1j1FICSLl4sCltMeZD/uT7PshszGJAp8C8WJvw
         mhy5xXnxrqt0kk12jz4Kt2dRhp6vznneJZ+y3aTxOyHKo4+E6eqwrxm4j7i2F8vwQRu2
         Bsd7IGX73slQCjXN4kkujBJhWNOW1QOsWesx3ukgIZ5SLa2WIg6na3otSxAz5Fv1OD2Y
         A9u41B6Pq6xXJZDt4Ha1Pj3nqw9gtrqYCf0XkbMGK1QgJqb2RpwlYoVOu3iBtyaI0s44
         XzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066556; x=1792671356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SN6vSgMsnnJYN+HFBZesKCHrB6GOW3IUndONKHtHc6k=;
        b=2n785ueHYtKwjfjE8gvgyRLHCzPTrOg0rxTlajZbgSI2PYpgGBSmbQhoLOh/pUrFBZ
         T5ISga53W1mqAS2Ovosgsx8HyZ+mH/VqfP4GJWH4ko2RKmloKBa3WnSESsxqKa5TlgD7
         tZMu5G7IlmWlt7JgHu+0jtuQ/5KOC1aZAbswW3nqd1BMfUQ1p+OLr2cS026imbVsPAVA
         mZVZSMRny4ieNfeaTY3rbAR8ldqpiYGDuatUejaASCWkrPY5Pw3qU7Q5Kf52MGfnSyjw
         oD27YjDdHrKNrUUd9z3uhC2V5TjD2740CZBIbGj6C97vHR1mRuBW+hpM+GLGPvU/3axc
         A1Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzd7Tjf/yeXE6DCBO/JmBmqtykNqH8cUdes/7D2Je4rKtMPjT6aXvVqfq6F+eeGtE7KZWeegGOW3Dq4Axs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPzIZVpKVvBe/UlG6vOQA8dcaSYhtEm1p9PiRfqkAFM2EKDJYJ
	wiuOLJFxmtEKU5xFJm4SY07WW8iceZhFCKvsaTJccmsr6mpss5K7ZzQK
X-Gm-Gg: AYBFou2N7W4GoSbaNDduxx+I9YnAW9LbF3GsikF3wSM1n6SipCt6x2FIGzlc7cl8M0U
	vjvpKPV1jv6piQ0nUIw1FmOQH4pvS9UFMQ13SXWNkRBuA3csz2ubsawY/zpeG/XXq/Ad8VvvPWb
	31Yzr1UTl90aocb6MkoEgmsOx5+atnptLKEse5KnUc54OB6EEsfR7RyS/hvahA6yCMCR3VbQpFA
	85vjgVPX4j38ZaBfTvai9SDP4gqKftEcnxXMbGpJYf2GSboamgw6bl66QvKNwXZVYQ1H55Bgwwe
	1bXBW4LmBQPN/jP4pdAfj+y7YklqPVPOq9ufqrxt/cT88k9yhs6SsuAKWq5EvWNspI/xZ5ZSWDK
	m/5tUz0De6hzXH0Kdp7kMMCyRK+aFtGU3RNYhRkmZXBCZ8V19mzFpc9SIkBcTx8jSkpoFA4q5Nj
	OVJrxHbOUGRidanw2gndr/9Nbg5qY+81S3NLpPS/eUHPUOK9B1dbIsZMmiXyu4SqZoNMnZ/wCa8
	t1/1o/FZtN2MHBguKyIxIZ6nVvYrk7PeRj0HexpZn3H5hb2Q1pV5f2G53WjJqEmagp8h7VOj89T
	seL4l5IBrCAz513ZUNfjmt7Q38qXxoE9OMv+lZ9R0yQVnea8G7klHw==
X-Received: by 2002:a17:90b:5825:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3ac9ed8f5eemr1065524a91.30.1792066555611;
        Thu, 15 Oct 2026 05:15:55 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9437aa5fsm4273307a91.3.2026.10.15.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:15:54 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Thu, 15 Oct 2026 20:15:49 +0800
Message-ID: <20261015121549.3809199-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015074621-GKN26088@kernel.org>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com> <20261012235624.77993-3-alan.tseng.cs@gmail.com> <20261015074621-GKN26088@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yixun,

Thanks for the review.

On Thu, Oct 15, 2026 at 07:46:21AM +0000, Yixun Lan wrote:
> > &i2c8 {
> > +	bootph-pre-ram;
> We could move this to dtsi file, since all board share
> same design which use i2c8 for connecting to pmic, the
> reward would be that we no longer need to carry this
> property all over board dts file.. similar we could do
> for "i2c2", but I noticed k1-orangepi-rv2/r2s have no
> eeprom enabled..

Agreed, v2 will tag i2c8 in k1.dtsi. I'll keep i2c2 in the board
files, as the OrangePi RV2 and R2S have no EEPROM.

> > 			buck1 {
> > +				bootph-pre-ram;
> U-Boot also carry "regulator-name" for this node, we
> probably could also merge it here, but could do it in
> another patch if want to limit this patch to "pre-ram"
> change only

I'd prefer a separate patch for that, to keep this one about the
bootph tags. The U-Boot K1 SPL looks the rails up by name ("vdd_core",
"vdd_1v8", "vdd_1v8_mmc"), so once the names are upstream, U-Boot can
drop the overrides in its -u-boot.dtsi files.

Thanks,
Hung-Chun
