Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27133A1686;
	Fri, 16 Oct 2026 23:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194685; cv=none; b=NGApNnGunWOMXUBWeh1V+oK6eUw4r5Yr/CyZ4giWNnax8D0qGTjcg8QTp8hXlpi3rSLsMFH3+EoYKFI5srXZB/tGxYtkn0K87I7amj3m4vALoI27CVTOXlEhZJ+z+Zj6ygamhlok4dMbBRlegBcn5LCK9EK3BtrQa7ycIBun6Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194685; c=relaxed/simple;
	bh=f+ruPVyGCiyd0ddXDwcN+mB5LgA1X4V1RQhTp8y28po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqyLAk21bESGUiVNckRsT9pS7a9fXVL6aaJEwVle4BfLzqT0iKNb5XXvEV/nzsfvTWJEibdzqAJ7sTTtrM0kz4h1ccHNCmA3liIxNOpbtWJtFslYL6v9rA/U6kfzHHoRELamH1p74UJ0OTBDbetpqyXi+o2M/FVLnXEtxkuN+10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org; spf=pass smtp.mailfrom=phorex.org; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phorex.org
X-Pm-Submission-Id: 4j61t63Qr8z2ScWl
From: Luke Macken <luke@phorex.org>
To: ritesh.kumar@oss.qualcomm.com,
	nabige.aala@oss.qualcomm.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com,
	abelvesa@kernel.org,
	abel.vesa@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	johan+linaro@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	mahadevan.p@oss.qualcomm.com,
	quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Luke Macken <luke@phorex.org>
Subject: Re: [PATCH v5 00/11] phy: qualcomm: qmp-combo: update DP PHY PLL programming on Glymur
Date: Fri, 16 Oct 2026 17:50:50 -0600
Message-ID: <20261016235050.4060422-1-luke@phorex.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a Lenovo ThinkPad T14s Gen 7 (Mahua / Snapdragon X2 Elite, which
uses the qcom,glymur-qmp-usb3-dp-phy compatible) with linux-next
next-20261013 plus this series: external DisplayPort over USB-C works,
Dell U3818DW at 3840x1600@60 over HBR2 x4, and the internal eDP panel keeps
working.

Tested-by: Luke Macken <luke@phorex.org>

One data point in case it is useful: without the series, link training on
this machine already succeeds at HBR2 x4, DPCD 0x202-0x205 read 77 77 01 01
and the symbol error counters stay at zero, but no picture is produced. The
DPU interface frame counter runs at 30 fps for the 60 Hz mode and the sink's
TEST_CRC count stays at zero, which is consistent with the DP pixel clock
running at half the requested rate. With the series the frame counter runs
at 60 fps and the sink returns a CRC, with the unchanged 5400000000 / 4 in
qmp_v8_configure_dp_clocks(). The same half-rate symptom was also seen
without the series at 2 lanes.
