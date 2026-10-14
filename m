Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CDC3019D9;
	Wed, 14 Oct 2026 02:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946327; cv=none; b=LmXfv8cMpPDttfVm7GIiDCFmyaz7rSnS1pRzwnUmGOhIVoGOcpqDRMjTQQWwZiCNtFv7/o7jpoS7hY3qM5JPuFrSn7SoYwzixEjpjFpVW5PdnLgJqiTtGK8ok6k0AD3LcActYn59aN9qVTcGothZ43enLSRpU+C1I5I2pzX2pq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946327; c=relaxed/simple;
	bh=ci6lwH7Wlf5uolwLWEhz1tMpvPXE5t0FdSARax8LoT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+HE8QieSBzAp+BnSGLbZ73RX46QxIjDmzv6P4GuqD+2WPjTxf4Z5tE9poPR3Cc6IsDvEL/OnJU8UvsP7364lAk+wLti9xaIxQEwi2Lvz17wiTdAcnJt6EbFWb1mVd2E1agg2gVVM7/0P9SwUjNbSuma9/LTP7lC+iheyq8Sa/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GCS0FuDw; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GCS0FuDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ci
	6lwH7Wlf5uolwLWEhz1tMpvPXE5t0FdSARax8LoT8=; b=GCS0FuDwBl3yq1Hua4
	y1Q3fmf0QcxS/JH+v1IOl2TFzWR1vTnzfFxqpmfCEXxcyiZBP9k2cDGR1YTP4Dwp
	csgoq5rPvj3Rpz0WDxWH1HszpLHjuyMKJ0pUjdJyihVvMkK417ctiFAIvd5jzxa0
	KjGq7PZgk1UdlaOCvRfl3J6OU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3H9kt7s5qJrRlEA--.21370S2;
	Wed, 14 Oct 2026 10:51:26 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: robert.marko@sartura.hr,
	luka.perkov@sartura.hr,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hppiscas@163.com
Subject: Re: [RFC PATCH] phy: qcom: ipq4019-usb: Propagate reset operation failures
Date: Wed, 14 Oct 2026 10:51:24 +0800
Message-ID: <20261014025124.81874-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <f6f632b9-cc2a-4966-a43b-c474a05da7ca@oss.qualcomm.com>
References: <20260828091857.8581-1-pengpeng@iscas.ac.cn> <f6f632b9-cc2a-4966-a43b-c474a05da7ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3H9kt7s5qJrRlEA--.21370S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrJry3Ar43JF4UZrW8Gr13CFg_yoWxWrb_u3
	4Skw17Aw4kta1UtF4UKr43tF9IgrWDAr1rW395ta13t348JrsrWFWDAry5uayrAF4aqr93
	Gr1Uu34fuwnrZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjahF7UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7g4V3WrO7i67vwAA3I

Hi Konrad,

Your comments on the declaration layout and unchecked rollback return
are valid. Rechecking the provider exposed a more fundamental limitation
in the RFC's premise: the in-tree IPQ4019 DT uses GCC resets, and
qcom_reset_set_assert() returns zero after the regmap operations.

I therefore do not have evidence that the hardware-failure case described
in the RFC is reported through this provider. Generic reset API errors
alone do not establish that case on this platform.

Please keep this RFC on hold. I will not respin it as a demonstrated
IPQ4019 bug fix based only on the local return-value checks.

Thanks,
Pengpeng

