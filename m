Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABE6221FB6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784801; cv=none; b=p8jpDnCTBTgZ9tklx74QPxTYj/fv5QVK6uqkWCAuL22HbwTDZyYFhlYE4gqi9l0vJ8V+NenqwCtbkNfCNrd9Jl5gU/N0Hg/SBdJ+dHqcgozuSiTvCKzHkn6S9m0TCS1ic+nvvN/UF2wl5QxC8ggC7OiE+XMcEiqfu/iUgG9+wX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784801; c=relaxed/simple;
	bh=QkBc673khEJJQGbx7I/5zeyC7cHA7PV8YOmbgM+RWaw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LFdZfowPvYmBl+pTk6yYuaxCyCYPxSrPGczR0owjY0fFvk4jg3WSaQoayRhrjp359MegW4S+ZuIVQykezZmnPjkQF0W8L7KQaIIr75Jqto/6lm42MQLm8xElGWNvcwvHhqoQwJzwUE7YPAx2X82H/P9kjhYnAciC6m5HZ5xlnnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ZZZNAopr; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ZZZNAopr"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b017a3be3so763821f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790784795; x=1791389595; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=86dchXVzlnHFM3eNazc1BHx4E9vCuJAvMqBHhXFBlXY=;
        b=ZZZNAopru5lujsSMo72/VYP43gvLQLX3BmgMuxGYuU1EiwnD7T4LwGEkZk6ARbtNaY
         gU4AtWysJXXt0jSwpwZqyTeC+d3UqbK6MlWw6CWwioFk6wL4k/93ZvAfr8V63YJDN+nE
         hOJAh1t//VunCgjkPD3saad4JQEBlqszr4CslfDNkVBEiw593s+T8Q9M4ODtjxfaCu+g
         dxJ1jXgbG2iHAFu64hsDRjYIrSt/Ud4FM6Zc9KXAmx0RyvQlCDmnQthx1I9bzvQunByF
         2iabjCrGbBNoASPP1KXE/9U9JSimp+QYz4ZaHn2FhjaSoqm+JLQW6kDSGhX/WrrMSPVg
         Ts5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784795; x=1791389595;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=86dchXVzlnHFM3eNazc1BHx4E9vCuJAvMqBHhXFBlXY=;
        b=EgRpwU3fYE1e8gmp/ZyyYqGfgGvzxLdXlal7NgYTOpVNKlcpo6NGFYsdf+FH70wQ7J
         eoukO4GFOf3Thi//aumYPcwcc1ubhJBdOwwfYBC3+h8caC1pUoTSaLnFYphI1h9iFV7w
         ELxh8yEh9R6nAwRffwPnhya3BVnDp/2i08QEbOlNKpuqLuBUYD5YabL1G1PiNXzVtNb0
         oSYCdZ6AdQA40C2bSXWA0G++TX1UhU3YLCrqi+3ed6FjQ9CElolSU++ToByIz2hDpOAq
         T6yJDD7WyojSi7ZlY3EJZHWSj580jdiC/CaYoiT+D0AeknvJgwwnMz0pc2Va+Gjlq16f
         Ke6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDTQau34gWxfw8jLvGpoyagyZSYOuOAKwd2rZov4Ys4PI8Ru897F3/HGFrbbuFJLxhOaKO07KSNkXV6NA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJut76HrjBf2IYhIDv3tcrii8gMy6iSDhgy1Jfbh1Xmf2ip2X+h
	Nv+woDCol6iB3E1bSHBnb6GZ+unB1JnATZwDZ21Uv1rEN5U9+5ba3Trg1EBuyTYaVsI=
X-Gm-Gg: AYBFou3twmxZ0hjNH1TKvPcuSZhpWcZX+S9l/uXBDj/LGLZIMYqQMbpz8HDSr7yeLzg
	ie7dtKKaPJvQFfqntgyWCUYU0hPc0+6ldIxqQJIBbLWkTbMul+nM5RtYZ5VZxKpOZDcpAfYUk06
	UqehehRGk3iOxtKFUSKT70kUysKP124IXobqR6hYdaaaVWUZ7ysSEaIymE5axBJMuAQgbzHpQGX
	NL5k6WksXJp4IYwE2IZlCxEXWNFZldUxiSpWfnE36zXa5VNlSkWl3O6Y93yI95m/kFMCz/HK7m4
	/COtUL5/0AT/vPgtPIB+0637Ua+TUT19ONTbavYtYp5YCRqsTtmpP3oUXL7bWQpdwC3YMBLLxRv
	NiLkdACrUNkMU07GLSMeqq+aEV/cLh2dtp/cZ/WDCyIsx5WIRTBuuCFUG5vGVxBlqmMJ/rgag5S
	8WtWT+uWGiL2MvNfIuBbk1SpuYfKamAAZiZCBp0zXAL3hce/nvMGZE9EAGYBFd2+ArVgpF8YunH
	0kuSWpxBUAOrv3O
X-Received: by 2002:a05:6000:4285:b0:48a:fcec:2a29 with SMTP id ffacd0b85a97d-48b024bd048mr4067392f8f.20.1790784794818;
        Wed, 30 Sep 2026 09:13:14 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068bc9d1sm119384f8f.5.2026.09.30.09.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:13:14 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/2] regulator: of: Fixes to of_regulator_bulk_get_all()
Date: Wed, 30 Sep 2026 20:13:02 +0400
Message-Id: <20260930-regulator-get-all-v2-0-ca82070d22f2@flipper.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4XM2jG0yMuV/2FY1DqFMQ00bSEaw
 r9bcO/yJOeeu0IgzxTgmq3gaeHA05hAnjLQgxp7Qn4mBpnLKm9li5762ao4eewporIWVVkWVBf
 GCE2Qds6T4ffRvHc/DvPjRTruod0YOKTA5zhdxO796y8Cc6SmqXVVqUttxM1Ydo78eaQI3bZtX
 xuBYbnGAAAA
X-Change-ID: 20260929-regulator-get-all-a553e73ff1ce
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=alchark@flipper.net;
 h=from:subject:message-id; bh=QkBc673khEJJQGbx7I/5zeyC7cHA7PV8YOmbgM+RWaw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtNRU/ZnY4fMvfP4eC2XfZubcrfZgX77jw8hL5b4Is7
 prCYR3XOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqdidGhg/hDUmn/kxWfSDJl1nkLqsqXzg58wyXzZM/e/qOXU15vZqRoVN+ssW
 M/pB0D+bi2atm5qg+P3G1d1b66t+reTOb25/u4wEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

of_regulator_bulk_get_all() only fills in the .consumer part of the
struct regulator_bulk_data for the regulators it gets, leaving .supply as
garbage, while the rest of the regulator core expects a meaningful name
there (e.g. for error prints), causing uninitialized memory access in any
failure paths in the core.

It also allocates the supplies array and hands it to callers, but never
says the callers need to free it (which they don't currently), causing
leaks.

Fix the former and document the latter in the kerneldoc to help any new
users avoid the leak.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Split by subsystem for easier application, per Mark's feedback
- Link to v1: https://patch.msgid.link/20260929-regulator-get-all-v1-0-e887c66a47f1@flipper.net

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: linux-kernel@vger.kernel.org

---
Alexey Charkov (2):
      regulator: of: fill in supply names in of_regulator_bulk_get_all()
      regulator: of: state who owns the array from of_regulator_bulk_get_all()

 drivers/regulator/of_regulator.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260929-regulator-get-all-a553e73ff1ce

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

