Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FCB33936D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435224; cv=none; b=LyU3q0DrY743Y1jS0vy3xZX+NKwm5RZaZAonsyK/23pBhe/GF+NYgOXlx08orDbRNN6qtxVp5owRZJgO7uI5YXyG6NzGyPKR62jnlPqc27efcu66jCdxsWG3XNr6p8C3N51+Sq3aUcYrqm9SjutXPnN0L1l2WBkseZd6GDu2KPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435224; c=relaxed/simple;
	bh=zLBagadYIkgHnlxLvmsxj4cwyFqnUnBYuMtGNS57J5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQ41pyKlg3BlXhhtaZnQsJupA7UyDgq5FUG6lCr9CVKwZirPpz/jjyMfi3rdwjQyQGLdPIwWo2KHuwpDElS3eI++SyOfHwbeP60kBiSbBMVLpeVdCUMqcsFgxxnD98TDTW6FXP7I2DqhGkItE5VX0h93tR+0rK+b2XyctFYMRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZQlbKzh; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZQlbKzh"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef1d0so29195061cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435220; x=1790040020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HicEH3nO+EqTxA/vkVDZn60ZwfdK+A3BWy3aE6/nD5g=;
        b=lZQlbKzh9LKaYlmjHYSQ3+lsYbbaG7DUS6+98Mi0G33gd3D+DzWQ8xb4e11Ee+AjTb
         BD0+9kiuWw9wJ5SsW0qtHearnuDfz6AcBse3j3tJ4ZZu1caF+wpG2XAuHpTaAqx+81wn
         r022xHKNRnCbYyxcR1PgPTX1s2hoKrIbDbZxwcV6Kmd+CCVq2KjIbQyh9qYFDa/yKzJL
         UYxz4ReGFJ0wqjZ0ON3yl7ez2jL4poMQsWmOHtGnVzxWQvzMM8+gxoJ3n+Nmc8f4rC51
         TO7+tfCE9PdDTVML9R/hEqO6u/XUiDR0kv2Ypx11sXxtXKy5CqL36rbZtlX3IKkTJAiO
         oXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435220; x=1790040020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HicEH3nO+EqTxA/vkVDZn60ZwfdK+A3BWy3aE6/nD5g=;
        b=I33JghnAi9+Vc7bpjLWR1R98U69TzWKTNyC/RUjPwLTx5ph00w4laNX+pKXZrSDkSw
         3ivBGsdSEQY87ni22D07zN0h5fl42JAElp/DBcO46R32KfxDscHhYiCFs0ZWpXlMenNe
         dX+7ApOX5CPFHoPGI9YT+gH29SyM5WhPI2OtJOhQoNPPXJrkGPfzZGeYCNGmz7lKl/3b
         Cl66atah9721NgDpHaj/OX6lBUp3BHF0csPgd9em7Tr4VqeOQD5MFt0LkVzKBe3G5kv1
         Mh3y3/qgzZefQi5MtNXOHaXeGWWLdw7qwmA7P0xDCsmP8pqxF4KrtrjwK66k61DqFmwA
         ofoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnZBVZqJGUa2J80Wag3k95BZgRgIAnaEHKe//EPRLqCa2SW8L8tIXdGkO/h4EW7J1WQQ95JScf+SIfZRk=@vger.kernel.org
X-Gm-Message-State: AFuF++mtvG7sxDPjvldqcplpckTjykVHb68NpQavlYEW+Sq6ABUa+reB
	UyakG+ouicLMh+ZYcZMrIdlR5dT3NLDFJS+jakvC1gpq04y2WCY3p3lFGxwC/1bifQ==
X-Gm-Gg: AYBFou2CLQunMWtVEBYUl6tgCp8Nl2RnT1xDbsTJv4N4IU/OabZ6MIrLqGX5JpAyw85
	/JT5BjCGkDCYmnSp6/1Hkz1MMm/aWMIGqHAl+byjzSGdo4Rka7fqKKa9xC13LkxoSPk9B9mWo2E
	cacfkPOITs0oe63szZKS/bZb3kAGbqSNw9hSCSt1cIr0sZuLuFR0M5AmTIAdpXb/nkQ9rrDQaxC
	umZfGaBU/T0RMXZOJLKXCJbH1WSaQqmsxd2DOYqT3fo5UZlSgRJt3DXVymkHlWj/rDRAsEHRi4a
	NTK93MHM7evf7BAcVh0xEMkVyO7R9wtgEgf7rHI+wGB4S3hLL8vAit0+PDWGY+yn8HeH7rN+hBV
	ia5LI1oZon1KzejUkxXXmt7uTM90fwjD0ex3Kxj5B1MErlK3J1we4kfWOOPHYsF2elJPH4FjDUE
	nv19WgV0Pgq5oRA2nLlX1g1+jVuHqjowm8Jb2vAnlOUp5LR8x7w+HZSyRe8yNxfRSJINkbmESdB
	pVs0wzYtRhCyaJooIiQJMp1k7g+1tdbJ8HdGrH5Szk/yv+TVta33wBbQMa3Jyww8+mZO3NgpXzt
	hyL+8p/COHJIyu8SGZeW33/4VOJLKmXjOGzQuPwoRlPvVannP/682SQYyXy2+ULic9cMyQ==
X-Received: by 2002:a05:622a:4c8:b0:530:1613:e09e with SMTP id d75a77b69052e-5310cf14c2cmr70974781cf.1.1789435220207;
        Mon, 14 Sep 2026 18:20:20 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:18 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/4] usb: ohci: Balance controller wakeup on cleanup
Date: Mon, 14 Sep 2026 21:20:07 -0400
Message-ID: <20260915012011.61874-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These four independent fixes disable controller wakeup after HCD removal
in the DA8xx, S3C2410, SPEAr and ST drivers. DA8xx also needs the same
cleanup when notifier registration fails after the HCD is added.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Assisted-by: LLM

Myeonghun Pak (4):
  usb: ohci-da8xx: disable controller wakeup on cleanup
  usb: ohci-s3c2410: disable controller wakeup on removal
  usb: ohci-spear: disable controller wakeup on removal
  usb: ohci-st: disable controller wakeup on removal
