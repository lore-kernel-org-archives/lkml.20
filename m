Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076F470EAF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191294; cv=none; b=IPise4GCZZA3+5LWodarT/46Wu8lb+P7cNtcDWRk4pIYKIaClnO+yOZuBEB77SX5YVPbY+olBAEZGz+a/cfdNuFGRW/eEIhYnbUMqWUsl9Z6ZUSXGkgT6TCFxh3RzA3RelW8owXaR2UpR1TeSQ/jYWVQiplxD/da4Xsf6/yG6xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191294; c=relaxed/simple;
	bh=mDc/wOCeEkqkQbOiB0yuDBTvbbSjVfGhwobrCDJ6veg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bumLN0ODp6LVU4b5TupUILyDFLtDh716uq7Ug81RmdQ9rI0lrXL3oQEpQ9c7PeKX4Aa7EHmTcZJwqKmMFLyHVXZ8K2KrUULYAuxwQBSorwJsiaic+FBHHni5l9P7CO8aq6olvXbY5R+Uglhz+7syey4s8zce+3Vub1hQ0aiGuTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qA+Sbbd7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qA+Sbbd7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so42773305e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788191290; x=1788796090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvbNBLloRSv8ElrT72fx3PwVc7bEOOXc32Z9sS23w5s=;
        b=qA+Sbbd7OdwBfYv2REImsryMMxmos52Ke95aAsQWy5BW/9ZnjDdouKnRuu4w1LguP5
         /eiNPZ/7DrQXKfhpgulh3Mg/oUpKe98q1y5r9RY8R59ximPzJPqI6FvyiF/J38GC8vaW
         gO5Bq8SBTKAZE9bQzdRYuCIoeJIJXkokEICGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191290; x=1788796090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvbNBLloRSv8ElrT72fx3PwVc7bEOOXc32Z9sS23w5s=;
        b=Gfl6Y3MvhkFkQ/1DkP1pX7PT7HanH9xcxMKnXJdQ1XpcdFHH5crX5nDwNVdMPtbHVP
         fG14sEUuSP/XRDhwZOPHZ1DilSORn20QNB+aU2WvpRLSD9k2oS/85qX8+9EG3CzamwJ7
         29dXgcF5lc6cfDz0R1tzIQ1C6cv0cJpm00IWnC+XXC9Gkh4MgmVfSsgIab823V0vTRrq
         nA9QUAWbTOzNcfgHzc98uv1PLr5QGmoHU0Jx6in+h+8vonYZJ/lTsJFacoo+j4bJACwF
         whXKoEOdajDQM1DhBrEjcRuzTQnRETaUaPU+6gGaFmG9EaYvDa1bmLa4kujC3LOzucZf
         Z/6w==
X-Gm-Message-State: AFuF++nrWjdLJMAIOE0SQ4Ljq6FE4F6mWVVSEbitXpaF2FiVapZ59hc8
	p2OqMPlnOrvV3+HfIpRmo5q8tKPjlFMf8OR+dsQBJxGDhVirNWZwFcFC+pUVnLfoLrfr6vwTQ4E
	MSEE4ekw=
X-Gm-Gg: AR+sD12c3WyKgmgTzBYNNu9qGTBZwaziGUajXt93rLwv8E+TcTGES+Mgvqh7WZOD7X7
	Rogym3S+QQLcZHllVzh5c3z974Mu5dav4AsmvumT95E/Swnd3GC3+JtJ7z3CH/Eyct65XaW36HV
	fbRFBiucdh3lBosUo9FXXkNVw6m2a4MS4IRPlaP4E+3SoLyM0JcvLiE+LhJk2RPVcu0KWHEuQFA
	Oq6DeNVJS6LIuMtJeB03YvMJHGG3gEpvTwqTv3sVkEWg/E/2dtFERtrqFnJYHb7Ft4LqU9/Hpwg
	1KUWJnrcj4D67vrcwx0KKLcjwnjtVjPKTGLU4MHWzc/MFOUy+rn450uZJAJeJ6h8Ncf3vFUE7dP
	Th3v1AbFLEZYDT6FkEq5/nwj8mU/+Nxkgjb2oayPy21CqgnPfq8BFbJnVeE2X8fqPE5huU1P80v
	UXT4CgD8iMBnhcs90He3IMq2IDS+asIoT9qtKq27+yEahNR27EhP0PbRiWmqyKttzdHWcloPwiz
	n9Shz1Y/G3KqhSofAOPxRCrq7zIiaRFh8RCcQ6od/MHfAj8zto99SFkPGsXKDdTsu2N7e0PqcsP
	sNlmmTQDPiJBTQXfpscdTQRjLOTkstB161gZUTkPiB50VaSrwyALVx2KBAQD
X-Received: by 2002:a05:600c:c490:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49b91c17294mr422161085e9.1.1788191289687;
        Mon, 31 Aug 2026 08:48:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm220191845e9.4.2026.08.31.08.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:48:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 0/1] Support spread spectrum clocking for i.MX8M PLLs
Date: Mon, 31 Aug 2026 17:27:00 +0200
Message-ID: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

Changes in v10:
- Drop patches 1-22, superseded by the generic spread spectrum clocking
  support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
  is no longer needed. This patch is now based on the following commits:
  - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
  - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
  - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
  - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
  https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (1):
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/imx/clk-pll14xx.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0

