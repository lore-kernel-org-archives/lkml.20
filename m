Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75332551990
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874832; cv=none; b=VF3sTccjefTaUidfUbzFUUXmsfNXC7s4yShShfT45GYDi06KpJmzWkCQjEzNDp0ThucgzNNLjVWvPz9vYVwYpoDkm629S6ikzPlY8IiT9Rl+puH5sH4qxzjrDLYqNtQfmwKoVSBtWHhPn2aSwwc5lIOAQ+IyMOtl5mlWvyTS/6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874832; c=relaxed/simple;
	bh=gkZiwD1bUMbHLsoBAAMAF82T6b0KqXCHjaMB8sqpczs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NKUruzW170TQfb+/HoSvIJmi5N9mMXkZLTmJGJCMyhXm1gVFWvz1FqatVlz6rnM7yVFQwrlBkoyoKrJl4G9V885aN1ZCw9Y7LGUT+exMxIH9iQ3zCOlPoYYW/kpUglyDwbPS8LazZQXvq5ks56kqGlkVYto6wJQiWRKx4X3nq08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZArCEkF+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZArCEkF+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so4170025e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788874823; x=1789479623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SJkr96/2clFb+b5z9ffMnNCNrpjtiTK03D1PubpYdyQ=;
        b=ZArCEkF+XESFYv8Hr9qQe/geQkwaG5k4vszp2yuJUUYve0/RCYtcX0CLwXO0Tq5JRc
         AjzTzQfwdlHaesfu46RrjsMbGZt+m5UHp2juT37cDf1ks+ZCIge8ZtC8vgSn3uIgjz4H
         rP9IUuZ1/DOtdqMBUG9x2WNuPbgKZsVnkaGSCB6xqk9RWDvvJU16UIv5mew0y+ehtSpP
         3lp5oFADQ3+PPeVGxhzF7wzRXfNS260aFyOgB3+F9OHBr7Ac1YPk7zLEXUK2fkRdl1sn
         J5Wv5c0I+HWbP+FZTNe/iR+vfwfIuUMAJXQcdy2ITYYc1qomdC0sch492w0KyqOlKLtU
         4KlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874823; x=1789479623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJkr96/2clFb+b5z9ffMnNCNrpjtiTK03D1PubpYdyQ=;
        b=pGUl8u0NAvDl8fdHa7No5Qgzr43L7KDzfc/CM0M4bvaJpI/6gQcyaXMNUzlKDHxlmy
         V6g+8Ik1m1TthGp24QFI6dv+RTjAU8F7erxDi+JgutHoB1X5rVJfS7JC8B/Ui7LJz7H/
         /VldLPhPLJiLCMnG/cL0OTdPz+E7C3DDpuymLpUmh5p/GyubVjoofrpQgFlG2OgCArOg
         +3ngPz2/In+/FZjGZJXzm2VaO5qEc2isPfLTPuwzMipCg0Fc/BWg5o/9v79E2XJScKiJ
         CHT0mYLQu4YskorLgXIXgAxEz7BzShG6Ea4mwfdIFpX0AabBd39T+tdttGzh6RciyDp5
         Am9w==
X-Forwarded-Encrypted: i=1; AKwUvBzzSGQ/c+pIwLzSEeMjRrO+u3rOgv4p/u9SnNRST80YeIDa1t/KyFNguw4m1cxwfbKsbGz4uZtkAcbk6tc=@vger.kernel.org
X-Gm-Message-State: AFuF++mrfc/2pYbIBV8fIRqKcSE63ficRASBgVDzzE06r2z1F0cdPuer
	VUiB0DElabWWtbO2CeyeWbbXf0/Th7LdlU9cYWu/WuZ9ZnPq2s3ZxCpd
X-Gm-Gg: AYBFou36hCW+qc88rovAxMV+biOU0wwzeWjrybKCBFNuqkFvYS8ZtyQFwA2A3sQSkg3
	8xF2dVF8Wa5ulVY7xbEvbVsEm83XvlMtYV3S30SqfuPjYiDtIwzmwgcbvvINFbXhbt8Px23Y//Z
	0ZolD81JokTg8YLRQhRzsqEAmcg1t2V3tPf0Qsu5wQsMZMy+M0cX727EDQ/+dR98kh0oyYxuZ3d
	uRDyBoy6JmpsbRgUFl6uI7vDnz/Xb1eBS9I4ee8rVWTGeMbNTed6JeAkyI73nIRA9bBtKn2b6sT
	cqHkAVuXa9QiOYXySxXu6u5x3L3r7bC3i+Xl+tIjuAVyiQVLrrE7G6rFYGaGlOF3KpJYlI7COOr
	Xdzb0JustLgDX4pftVf1DnSDZ2vGSUpQs+ugqUsspKqSwt7KOEExpseldFz0d/aVG4f8VgPdsJt
	SkZIDLXYFJ70afEvQ+asAg8XfXo8IjA4JYibghwnAr2XRb1OuAHSDH4THjTq5lb91pth50wd6cr
	kev9gngeXnpYXsCYbR5SV4JXsJ607bp
X-Received: by 2002:a05:600c:c4b8:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d17543be5mr77030865e9.3.1788874822663;
        Tue, 08 Sep 2026 06:40:22 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm345600325e9.3.2026.09.08.06.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:40:22 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue,  8 Sep 2026 15:40:11 +0200
Message-ID: <178887481187.4612.2819576206036967152@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130745.2545-1-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please drop this series.

It duplicates, as a strict subset, work that was already on the list a day
before I posted:

  [v2,3/6] dt-bindings: mfd: pm8008: Add PM8010 I2C support
  [v2,5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
  https://lore.kernel.org/all/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com/

Nihal's 3/6 relaxes the same required: entries mine does and more, and adds
the qcom,pm8010-i2c compatible; his 5/6 already carries the no-interrupt
path my 2/2 was adding:

  static const struct mfd_cell pm8008_no_irq_cells[] = {
          MFD_CELL_NAME("pm8008-regulator"),
  };

on top of a PM8010 IRQ chip, match data and a pm8010-regulator cell. There
is nothing in my series that his does not do better. My apologies for the
noise - I should have searched the list before posting.

Nihal, if it is useful: the Lenovo Yoga Slim 7x Gen 11 (glymur, DMI 83QR)
has a PM8010 whose INT pin is genuinely not routed on the board, so it
exercises your no-IRQ path rather than being a DT omission. I have been
running an equivalent no-IRQ path there since 2026-08-25 - the LDOs
register and the OV08X40 works - and I am happy to test your series on it
and send a Tested-by once I have actually run it.

Your 6/6 also shows that describing a PM8010 as "qcom,pm8008", which is
what I do today, silently programs the wrong voltage ranges. On that board
the sensor takes dovdd from ldo4 at 1.8 V, and:

  pm8008_pldo_ranges    1504000 + 8000 * n   ->  1.8 V is selector 37
  pm8010_pldo_lv_ranges 1800000 + 200000 * n ->  1.8 V is selector 0

so the same regulator-min/max-microvolt lands on a completely different
register value depending on which compatible the node carries. ldo3 and
ldo6 have the same split. ldo2 and ldo7 happen to map identically because
the nldo and pldo ranges share a base and step and differ only in their
upper bound.

The camera works on my board today despite this, which I would treat as
luck rather than evidence that it is harmless. It does mean your series
fixes a latent bug for boards already describing a PM8010 as qcom,pm8008,
not merely adding a new compatible - worth a line in 6/6 if you respin,
since those boards need the DT change and the driver change together.
