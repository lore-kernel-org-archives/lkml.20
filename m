Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72E41F7D4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427156; cv=none; b=WtCXjKsSWck+6JLjKELNXqcipd8ggTb1kvUodmVtPyKcsX8CeE23YWsERe2cYIaMzg92sMN1Dpc1+zC1oo01rxy+RCcJSAPNqkpFar9GhmgW09vepx4n20cPDOsPhT4Cbq/TUA1oGjAPhEDxs5Hc2+hEPvUUkSJkaDUFqvzswXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427156; c=relaxed/simple;
	bh=uRkKK/nT+aV2RrivtfepLK8t9jM7+66Vx+qv84P/4mU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XU8G3Ev9tOlBk2k78jibaIAkKd2vP0bOX7ow/gdbXdPXIp2I2PHsWAXO/ZUAzZXITychLe+Nl4/OhrfcMEi69VEq39OzdvZwZXaGIQDLInbhaWmfLXtD50T/1pmECG6mJOrPp7PITgB8IjLcJ5XGq+h7mfYHR957KeqJf8HSpKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xryHobFw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xryHobFw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e717c9841so15128595e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789427153; x=1790031953; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P4bUmIM/8MrhNWBsCgZzU2roeZ3zMpS7wHfUs2pan0o=;
        b=xryHobFw0ijtMYXto5WQqWs2WXYc5Br7gMQ72qTZPdUCGm2RSm3CCAus/YPShmmGsl
         zhkdAE1ECCC5x9vYRnE3bKDrOnKZjjk3ZjRNmxIbbrxpgtNPiVWGUoa/7UqLLahmFLXu
         U9v/f9LCvDSBY/0M5doHULq6OaIl1hwqVVxX65OJIxRtV7qiMUBsNgkxV4pnXqrDkxT1
         FSeiP3cBRkG5wC6twvrRjgOtLeHbaANaTaIeusFGkbwXFVuvjtWM5pESbNVzem23NVWk
         Dm1I+sH7uqj61l/LUZBKv3VV3nL7enXzNYPRbSM46MbJvmauXEygSWiAOx/i5/noAsJ5
         LMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789427153; x=1790031953;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P4bUmIM/8MrhNWBsCgZzU2roeZ3zMpS7wHfUs2pan0o=;
        b=yHHFWVvlnn1iAYHS05gvGPclj2P/PWY02F1VtjTfuhiHmQY9RvWx5GEsCR6qDfP3ba
         pdjw69x9KLzlnKqL7ucMOtG0RM9/N90hg1ve4j9bbDyqf80WdOblZqrjmadbzwMx1b+A
         qsM49Cocpxe4lur0mWL4/aDYcpwKcuL7Rnd70CxjF4EYEyDG/dt0Y7Y4LjWtYQFOOAdZ
         KQxYuSxjYhbqgE8VlABPdsP/LPff9UQPsv7GBRr0Nt2ilCqcSG57BCJT+D85GJtpG+91
         c9ba3dQZfgvaCc8dfLAHVGYlTVUUdNc0HWPBJxEXAd5Tj0ha5PifE88rOSZUaDwFMNdr
         sN/A==
X-Forwarded-Encrypted: i=1; AKwUvBx8LAZAlvg9Ey6bV+kzt8c4HPC3PwVWpCAb13KY9xh7szVaWJILtNytvUI21/mLOeJRQNMX1l0TO6jCqf8=@vger.kernel.org
X-Gm-Message-State: AFuF++ntVz8uEOT6uo7JrBDyReeswviCKxdo+GlS1es0gloX53xCvhQs
	dzWQhLPSAujDh6pJnYorGY3s4flrlRmiWuowJE4esjXzIlhS5gvP6NBXMQdiwq//agE=
X-Gm-Gg: AYBFou2D1NAVxorPfwAfZhJN4+zN2x85nVwg+ajb1b6E7prUH2tpPJz6aZBiCKTT43F
	H4vyRpCi7X46NNJwd034nq6pXokZCqU6LEbk2Wd1ZOfim4FFHjqoUmiyVk0XvExufwx5G9RIQT9
	c3b8uPH2WQJTC8irqX713u2ZPaxEkelgCXyMxbO6C6VqmTsI5kcppEKBJTAfI5Rugsa5w/I2aLf
	RHzdv2ExA/mbsYlVw9bh8Yqdm0C1NxNyzT/TmBHOF3L9NZhvc2lw02wT1z/beIXpEUgRoJptve3
	Wa+0NooW2QM0rr1dpfcY/ENG/rr8QfzAcXstFnrKpAKxsGVlJ9IsCtT97/j7yakw2G9InZnwW4P
	e5pQZ3NIitOyyiuF1fVhDd9ERhZCBs8IXLFliVcbU8i7x+y3TG5L2f4EWrozUlTNByQfgSYZc19
	x9zE1Tfo1FPQS//W7o+KqOORv4WARD4VohMExcuTZ1PcWH5529RZiniedbD5ePYIeuloWp1tgaF
	d/CKrRfdT243jjMB4F6o/tEgcq7LAu8MqsE00hv1Yxty1Cj1fhVZMACIBc+fI4=
X-Received: by 2002:a05:600c:37c3:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49e7a678879mr66917465e9.24.1789427152608;
        Mon, 14 Sep 2026 16:05:52 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d5f1sm32098817f8f.12.2026.09.14.16.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:05:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Initial support for Exynos850 SoC in ACPM clk
 driver
Date: Tue, 15 Sep 2026 00:05:42 +0100
Message-Id: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMZ9qGoC/32NTQqDMBBGryKz7pT8oJWueo/iwiSjDrWJJCUo4
 t2beoAu34PvfTskikwJ7tUOkTInDr6AulRgp96PhOwKgxKqEbVUSOvmQ2prgb1d3mjnFxpy0ip
 tmoYMlOESaeD1jD67whOnT4jb+ZHlz/7NZYkCW32rtXLODLp9zOz7GK4hjtAdx/EFK1baprUAA
 AA=
X-Change-ID: 20260512-exynos850-acpm-clk-bed1c23b66eb
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

This series adds support for the Exynos850 SoC to the Samsung ACPM clock
driver. 

Currently, the driver hardcodes the GS101 clock variants directly within
its probe() routine. To cleanly support Exynos850 (and potentially other
SoCs that utilize the ACPM protocol in future), this series first
refactors the driver a little bit to be SoC-agnostic, and then wires up
the new Exynos850 data.

First patch introduces `driver_data` to dynamically extract clock lists,
number of clocks, names of clocks, and mailbox channel id, removing the
GS101 hardcoding.

Second patch introduces the `exynos850_acpm_clks` array and
"exynos850-acpm-clk" device ID.

This version also tries to handle missing ->recaclk_rate() implementation
in ACPM firmware. Because the Exynos850 ACPM firmware does not support
dynamic rate reads over ACPM IPC, the second patch introduces
a ->get_rate() callback mechanism. For Exynos850, this falls back to
parent CMU clock topology, registering parent data via pdata.fw_name.

Tested with cpufreq for E850, with OPPs and cpufreq_dt on Winlink E850-96
board.

I decided not to add Tudor's trailer for the second patch because it seems
that rework is quite important.
The dt-bindings for clocks will be added as a separate commit in another
series.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- changed commit message of second patch that adds support for Exynos850;
- introduced ->get_rate() callback for Exynos850;
  Rework of second patch and implementation of get_rate from parent clock;
  ACPM clocks for Exynos850 now rely on clock topology and need parent
  clocks to be provided;
- reworked acpm_clk_recalc_rate() to use driver data calback if it is
  available;
- struct acpm_clk now has pointer to drv_data;
- rebased and added changes associated with rebase;
- added mod_devicetable.h as Tudor suggested, added trailer in the first
  commit;
- Link to v1: https://lore.kernel.org/r/20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org

---
Alexey Klimov (2):
      clk: samsung: acpm: introduce driver data for SoC-specific clocks
      clk: samsung: acpm: add Exynos850 support

 drivers/clk/samsung/clk-acpm.c | 62 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 6 deletions(-)
---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260512-exynos850-acpm-clk-bed1c23b66eb

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

