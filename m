Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203375;
	b=qHHO9VlrodcM/apkXB5nEeKSm8qvoPBCHb6SedpAMfJAXDUFlbfSmErgeWkUuP3Q5cNE
	 LCVFI7NUGVVuttDnNKc/UCsbngFrQWezyAB5X0860JrNdVu+76oMxD/Ia2d5ak9Rl6eS/
	 QyAlcnt4e7cYZxabQpnwNLd2bBDrEwhemKTpkDU9oZZHGC8peZbxFOdY66GgfU0hMcK9Y
	 /k8A+CQkugSSZpJG3A+MgICv74C9AkPjSliw6knaZNtPKuM1D183asDuqFV5yFUj6X3Xk
	 qk1fu6wBb91wlBY+7hfenKpyugyEOY+IQ51X1C/V8N5eWL4Fwmo0ukmPNF8tWU15k2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203375;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wKs3vJN4ZKJpeX5LXglj/FvmPaj4cVCU3oClZIx8D0c=;
	b=aNSmalVwCkxvX65cNjxe0kUwmsZCvyd66IgHUbSQBaHyjKHF2Wqw9GNMYCABCeOrJ884
	 lylPed6XL67WHtbDZkINiUybmvYqdfN4QxurgBG4ibRNevgKcQbQxckkgGkaloXxP2JiR
	 Bnji/kqVo0+R5GwRBjLPC0aFwxEcBLYP2FIQBR6M75bCs/ZZEiDF5/YX5BxNnEvUOju7V
	 U6JXQafalLwLXBL8FPfQT9TLBjBkuavu71LT8vsw6Of7TTGeuIjvRAz3JboWAb9xGf4A6
	 QDR3Zrm7nNQkuBqkjmXN3OkKPetz4+d7V3AH6gHQQhnziG9dvAszRaM4q1TCFuU5/OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelburch.net;
	spf=pass smtp.mailfrom=michaelburch.net;
	dkim=pass header.d=michaelburch.net header.i=@michaelburch.net header.a=rsa-sha256 header.s=protonmail header.b=Jt4sLcnf;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F87606A31A;
	Wed, 28 Oct 2026 16:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=michaelburch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelburch.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelburch.net header.i=@michaelburch.net header.a=rsa-sha256 header.s=protonmail header.b=Jt4sLcnf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=michaelburch.net;
	s=protonmail; t=1793203370; x=1793462570;
	bh=wKs3vJN4ZKJpeX5LXglj/FvmPaj4cVCU3oClZIx8D0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Jt4sLcnfHw2wqjq78XGZQKUE3kF6VJbqSCvrO9nhkfFZNTCElSapRkr3tmLid51p/
	 42O2O4HYmn8Wgs45QxT5eMbBKDl1CiZDXRJcm7D5ZE8wVcIGug1NCaJfBg3fg0sjDO
	 XwN+uAE21c1rg7POSH5JUzepdIBq+kkjWxUj/fn0o+LUJfBb+H0eCc4l3V+i5gP4Ao
	 9UEprSoRMQXApBL0mdftZkPVFU9YnKHN1uS/ZgX74YARA1WMvuoUe+ZqqdKDrJs20x
	 zn5KEmXXR/z4ajmSKenJG8DLAhyxrfYX9/L8xHcbb25QjJJyJtEtPZEui0Dwdj80Fc
	 DDKZ2nMWelV0A==
X-Pm-Submission-Id: 4jFBw52kD8z2ScPp
From: Michael Burch <me@michaelburch.net>
To: regressions@leemhuis.info,
	Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "phy: qcom: qmp-pcie: Skip PHY reset if already up"
Date: Wed, 28 Oct 2026 11:01:21 -0500
Message-ID: <20261028160121.10729-1-me@michaelburch.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <f6a49cbb-e000-4dcf-8b3b-61c3b8d934a9@leemhuis.info>
References: <20261013-qmp-pcie-skip-reset-revert-v1@michaelburch.net> <f6a49cbb-e000-4dcf-8b3b-61c3b8d934a9@leemhuis.info>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Yes, still needed. I retested today with unpatched upstream 7.3.0 on
the Dell XPS 13 9345 (X1E80100). It still reports "Device found, but not
active" for 1bf8000.pcie, enumerates only root port 0006:00:00.0, and
drops to dracut with no NVMe endpoint or /dev/nvme* devices. My patched
7.3.0 kernel with the revert boots successfully.


Thanks,
Michael
