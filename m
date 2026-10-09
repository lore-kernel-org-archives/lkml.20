Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB73B36402A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539267; cv=none; b=AUrHp3zIezkbE07VeFGZba7gq/YDk7rWE3C88vm3NVg7FC4jC91KACejKvjKnlefxSsTftul8qS+QcjpF9ie1IY3FFLta9fhWFq0Z04pa9irLoJ9LmKIbyrM89FVTSlGDWfvACDD6aFSOzTzMwhYiOEMpxrOIscBiD8b1EYwSc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539267; c=relaxed/simple;
	bh=B4rpVl4mptJjkcyRtvFrb+ksh0rsTg1kk1VMkeNJfyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIUIrhfRQ/PcObMNi/T6jrx3UfAz5uXCZ6jLw10FG39YYT+FGia/tb8qk+Yfk3hRVMJKRtleQz+bVKGbvhIvZwWS2Zy+KSzC7+xgaBLfBWubqoNvnijEvdvgN873wNJzp449B4N7JAgbjQFZVUYscjkOhH0eC0AIQPx91EyyOh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6+nEOuq; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6+nEOuq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso908012a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539265; x=1792144065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrPTdcZ/njH2i3/j2LZUGAT14iJIsacuNVj54+laGas=;
        b=k6+nEOuqK4IAjrktw65AHdhSink7++M5Nr8mckpwX6roTe1dztn07+ax0krKldOFL0
         mCRaCZmMPqBms3gApgkoP1VORum0AVBhyZp1k8yxcxhn/un8X//bB7CnxcCgTV3wc2Go
         rZnx2EHEAf3KjY/tqlmDa0k4xFPI91A/xdB5JIcMgMcmDVZCGoWk1ZmuOvAgHxvyAnOk
         tpTKbUXMzLfOcVNGP9utuwbY7JeuE1/U2T4hvWVZnFh+OuanX0u7CHKSIwL0duGvgPN5
         BiGLfOMOFvI6se2lERN9/9KiUuT5EgjLYfXFlp3HFgvCK8fvS2zNq7U9cGAwWUr/g326
         T8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539265; x=1792144065;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrPTdcZ/njH2i3/j2LZUGAT14iJIsacuNVj54+laGas=;
        b=TFmn7kDklhHdX/Em5ogCXI422uF2z13ksECikc+6QkEeGZuMV+Gm/crBbuJ0NbBqtn
         2/1PpR4EA/CbB75ypSx+FW0bPyb5I20UnT8VAKuQyf8jrImGZNW7ryCxUGT8uMvJ5TV4
         qo7PQwzp4wvhpozXzoj2+GIrgz+CUNPgNjdGCHZ9Ps3EeGKo+nwh2fXI4ymfgc416bkN
         8iKLmYvovux68I82e97dYOIeCYdSjchUaHmfCie4kAXVoLvyZ3ZbHd+A2Rpj2qD0RDcD
         dI425BuvC+pkyMV/qJ+Y5tBMszFTR+IZUCjuX0zrp5MBeOUKR8g+fRXS8Vb8kkFappz4
         cP7w==
X-Forwarded-Encrypted: i=1; AKwUvBzbqIJFBy6V+QnAYqDn18FjBllwpYRR4sIHXEaDSQKDtdchdnbuX/qLN/kXlKe5yGstskb1ORnZ152ltCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI39SaYl147piYqiY+m5WdpVwAkymSXyT7641r2Oq2aAEkebZOl
	+wV9exJI07JGAXGv8u4xsmOAZWfdWifF9lBCB8+sgvGs25YyxKgghQjW
X-Gm-Gg: AYBFou07znAf2kN4Eg60eMTrT8rwdb8FSvSJREZSQyrklB2ZUOqJZtTN2NrPZNN+5C5
	4jvPpswsFCYo5sr0bWZ/YSzh/P0DrdJBhdUb8EKWthggCmUJOr9fVeHX22HkfzH6zRyWfM/U0UR
	ixsoh8mYPVTkU2wnR+6FvgqK3A7ErueYes6cxkgzvsdV3O+wyAWEuorxaEEYjeTEbPd3TTNs4b4
	z3Owa3H3mpNZRH7JI140Ow1b9aALAMLjKQFerXay9KxyXSU+tskzAdlWMCqePp2sxIyd5eYshKj
	7pQGLYy/Z9DHeIKmtmxqq0Vsk4dkXUoVrbdxGMqt14XYYEeDoKgwNnNhcLHEON9PD3yvU2+AE00
	VqJkb9W1lXVFcZ2WCg4jjun4PIMhWzN6Hnfr6rRhp6aGN06bDwWJAXPRfan0eSFEV0Sxjjoc/ng
	Gp2HN00fEqW6KBYazwkatt53+BkKW2n+8cAdlXfjmvFqPdrVcHsPeSR6QGIoMBQZC9tJ2+
X-Received: by 2002:a17:90b:224c:b0:3aa:faf6:a951 with SMTP id 98e67ed59e1d1-3ab3a9a93b8mr1318325a91.37.1791539265069;
        Fri, 09 Oct 2026 02:47:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm2638018a91.5.2026.10.09.02.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Hangfan Li <lihangfan@iscas.ac.cn>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/4] spi: sophgo: Fix SPI NOR errors and clock limits
Date: Fri,  9 Oct 2026 17:47:08 +0800
Message-ID: <179153921379.259252.17749060045138037060.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
References: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 02:22:49 +0800, Han Gao wrote:
> The SG204x SPI NOR driver ignores transfer errors and clock limits.
> Fix both, enable SPI NOR on SRD3-10, and use 12.5 MHz on SRD3-10 and
> SG2042 to match EDK2 and the vendor kernel, respectively.
> 
> Tested on SRD3-12 at 12.5 MHz: both flashes identify correctly, SFDP
> reads succeed, and two full 64 MiB reads per flash match.
> 
> [...]

Applied to for-next, thanks!

[3/4] riscv: dts: sophgo: Enable SPI NOR on SRD3-10
      https://github.com/sophgo/linux/commit/0fe449e8ff7b383a8375e85ebca40133a02f3348
[4/4] riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5 MHz
      https://github.com/sophgo/linux/commit/a3a8c25c59f8024eb70a460767ff0d7bcb213338

Thanks,
Inochi

