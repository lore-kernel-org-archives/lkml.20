Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD963B71A4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371966; cv=none; b=PKlTcJN2c3zw8/Ec+vAWLEr/5MoN2tKp3G3BCzZ5WeWEyorzDu2ah1g1S8Ycb3zr9aqbTtQYNNDKfK7UtNvoPEyCKaB/gdVeUE6c+Lo38GqqyqlQwsJ4wKCCHTC3iL2Vv/GuSfQ+5we9f2bGAbcVi82WiFaYwLL2EKQJWvr3EYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371966; c=relaxed/simple;
	bh=zwEor6K8yGoFURlxDvbOjCkK1oLF41ASBn1v919rW7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuYVG/GKstO0/AG6Qrb/gUV1fSt4nQl95Vn4VNE3OqTjyiYbWHYVoFyVTqVgq3ByUyIrbqy7rIPHZ57K51kh7Aimc+t1oXoZg9RWUIngcBDHTasoZ3N7l2TvkrLN9HSXrVza8XICDnBC047E8sQCmHJYmbeNIIV6a4/jqOuo2QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkNMWODj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkNMWODj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB751F00898;
	Mon, 14 Sep 2026 07:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371964;
	bh=S6FY7ZetqMty4OJBLyaiR50VfGzmS5JdgvQQAtmW5og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hkNMWODjCp66HXsxP40B6blv8cONrbJukcJ/P2yD5rFqHu1HH/cAdIPa6ZXuhv93s
	 9303f0QcA06EiHGNfU63DL4v/77c41jF3vDiXPO6v0CeV6jfg0Vo0zJVv2nZuWL5RH
	 ZAr9lzJr6+CDgHX5MiuaC6wKUdbSKS33EDRrNowgZUlwrFRAbIOxcKLy2fHY5mPXbr
	 EhyJmaTiBbEcvtcnLV+huW2Gj/SF2rzwZCUUu/CQu9LGqrKArnw97S5X76gVRBkFwa
	 Oc2Q+yds/RTYSv5IB62Vdr3nYHND4TTfDGnS//oCpM7du54OV0DiU/dad6IHatUlQk
	 zG/jmF4aA/qGQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 09:46:00 +0200
Subject: [PATCH v3 01/10] regulator: ab8500: Fix AB8505 VANA voltage
 selectors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v3-1-7f92a365628e@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The AB8505 VANA voltage table assumes selector 0 represents 1.05 V
and all eight selectors increase linearly. Selector 0 actually
represents 1.2 V. Selectors 1 through 6 cover 1.05 V through
1.175 V, and selector 7 represents 1.225 V.

Correct the table so each selector reports and programs the documented
voltage.

Reference: AB8505 User Manual, DM00046744 Rev 3, p. 257

Fixes: 8a3b1b8703fe ("regulator: ab8500: Add voltage selection for AUDIO and ANA on AB8505")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 3705c98b0713..ca59406d42a8 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -264,13 +264,13 @@ static const unsigned int fixed_2050000_voltage[] = {
 };
 
 static const unsigned int ldo_vana_voltages[] = {
+	1200000,
 	1050000,
 	1075000,
 	1100000,
 	1125000,
 	1150000,
 	1175000,
-	1200000,
 	1225000,
 };
 

-- 
2.55.0

