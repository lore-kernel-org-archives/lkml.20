Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4793BFE4C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500859; cv=none; b=CtZbMHX3SWU6dMX/U8a7ZN0XGW/wi9x1husvSr25pPdQOu98TnfJioiy8EvklEH1u+idwvKqGmGZfJzL8uj4O8Y0YXmK6NHUGBtr/ikA4P4yhnRCUjHEAqJZg1nbyXYbH90ehtMNyRdNdFif842xBm6wvKT0dUBySq9rQ5LGc/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500859; c=relaxed/simple;
	bh=Uo5ZRxOWSc6BTc5xSM/Az9cMdX0GLlELbAn/TockEyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyukckOquEl0DDqSFlTaGi3Y70gSWu+fQJ5UKo9OFLtN9ghaiMt+olKA739ERMm01jpUTbsD6x0SGuJMrmM5PlL315zpwYl9jyYSkYHLk6WEoucSyKY0g9yVcmJnYEmTHRolYSxTxqIFRwpAYlOBabFOOfDb2qVag4C55wJPJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuO9pcz8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuO9pcz8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so66250785e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791500856; x=1792105656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLE+b8D5djbP1RTNiaIJqryFeKHBRiPy92yjjm07OBE=;
        b=IuO9pcz8nq4VOCJlJhCpdD2kbwsfh6qLyGdBem5Q7arYYHil98IsiX9bXURmFR8l5i
         ZKZW/kot0SNnhZppP0UAgDAXm/B7dkImrDpqJaVM5sr4A9oVe1RJlqKWcOExkREvHHr7
         oEaI7xBg8LrSsU5oDwoOcW7SrRYge8Lsvonoif7gBhrTKVmVqMFhe5Qhoevm6vOzdJRa
         IhDjewQhlIMTB/Ezd9gkn08koRz4JopIfcVTDQc2L/uOIEc2PBnNoBpaH3Ldotv3zvbs
         NsFNpHU5q+HM/GEaAsMK33JlIPieXhb8mn5F2Wfo7IV34QrwWQcMSgYwyeDdI41FdcVr
         UWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500856; x=1792105656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLE+b8D5djbP1RTNiaIJqryFeKHBRiPy92yjjm07OBE=;
        b=rfcZLBoGZbWgU3YuhH5Thm35ZgYCrb35VyZR6Nu/6D9++tesBTNa4kho7iepHukUsK
         263wJNF6Z+M8ejEhONhInxjsm0MtyXvLA3VDRHXjLo/kHyzm7gtNRvrlVj3nLqcmvxWN
         FOWI2ZNRLbe0mWftbkoVOG/go7a+QeHCdA84US4KRkwOuMqFVu13du5mOo9LbxVusyXQ
         6e6VxM+YFzBjbLKvaOVI4heLk7igswnCFzlbWKiPlxB+/hn/ESgywoPQmMXt6Myzsiwj
         Bj4Tu8OVNL41pARrXYscJ8CWkOk3aKpgK28YX70KgsG+YK/Se0+esAZhpbBiPP7642Y8
         wpgw==
X-Forwarded-Encrypted: i=1; AKwUvBzQkcUu/mfpo5ZyH+gmImAZ/MiHj5RiT2/RPQKguRqCIoRvEpvzB20Ij4GyNi3+f9jqFbWC0qgclkpoUuo=@vger.kernel.org
X-Gm-Message-State: AFuF++mXAaY843M0PzgVzWsjBpvrPNhvX7AdHPshSeWszmMHIq6J39ym
	lHo8lpb9YR+ExqGOaVb8LZ2T4X8QL8AlUfqkIy3vmyj+6/RrtE654cVF
X-Gm-Gg: AYBFou2rKgURzIT51G/9+Q9aE9n95/EvlgtqsuN5ShsxiLJd6ACpwW5ajjYCoDDtSqP
	zcV/meZ6XGZF3trmygk5ZhLBfir4DdYRAhaSjySV2kSe9e9cuyQ5RSdwfCuAQ8v9UMPH2AoJG/H
	fKPx1bPMwkICqNE66sh8UFkIe9+UpCD70xDSh2iKV1cyw1MYgTmgO8Lf6iuT/R+DpP9ftTgFpNW
	18uoUsFkCOD+cISlS6pFGuI6hFH/S6gShij3MH/HjtbQWX/KT9RHZJSDb3kj7ixP4jNKQ2wRSRl
	QAYjioeckh0CDJB3DNZ73MQij4CMUJzpO3ZswuqIK9YNG3RR0TgsXoNK4CVIyv6ZzEcMypPZ9Sn
	ft4ZxcWnK0YEdiHbYCy1BW/6nZnHbUWC53ZHh/XFymBlz1x5cofL/I1QzKQ3CrY5rDLwoSpp1WF
	eLMZ21CJ0m9HvsOqAugzyyDszU13eIQxKb2AO3iphMJtmFyXbAeF+Zp4oShho8T29cVCSbevbdd
	92wUneWPg==
X-Received: by 2002:a05:600c:3e08:b0:4a0:1cfd:314 with SMTP id 5b1f17b1804b1-4a180455651mr144799455e9.26.1791500855826;
        Thu, 08 Oct 2026 16:07:35 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.178])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9abd3aasm626372f8f.32.2026.10.08.16.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 16:07:34 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleg Keri <okerixx@gmail.com>
Subject: [PATCH] i2c: qcom-cci: skip core clock rates the clock cannot provide
Date: Fri,  9 Oct 2026 01:07:25 +0200
Message-ID: <20261008230725.3228-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cci_get_required_rate() picks the lowest rate that has timings for every
active master, but never checks that the CCI clock can run at it. On
glymur, sm8750 and kaanapali the CCI clock table has no 19.2 MHz entry,
so the request rounds up to 30 MHz or 37.5 MHz, the timing lookup for
the running rate fails and the controller does not probe:

  i2c-qcom-cci ac16000.cci: CCI clock is not at expected 19200000 Hz
  i2c-qcom-cci ac16000.cci: no timing for mode 1 at CCI clock 30000000 Hz
  i2c-qcom-cci ac16000.cci: probe with driver i2c-qcom-cci failed with error -95

Only consider rates clk_round_rate() can deliver exactly. Glymur then
runs its CCI at 37.5 MHz, which has timings for every mode.

Fixes: fa1eb3af12fa ("i2c: qcom-cci: Enforce the required CCI clock rate")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 6d8be7b8b79d..289368c00fe4 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -586,6 +586,9 @@ static int cci_get_required_rate(struct cci *cci, unsigned long *rate)
 	for (int ri = 0; ri < NUM_CCI_CLK_RATES; ri++) {
 		bool supported = true;
 
+		if (clk_round_rate(cci->cci_clk, cci_clk_rates[ri]) != cci_clk_rates[ri])
+			continue;
+
 		for (int i = 0; i < cci->data->num_masters; i++) {
 			int mode = cci->master[i].mode;
 
-- 
2.55.0

