Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA1D4A92C8;
	Fri, 25 Sep 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345724; cv=none; b=oYfa4/azFzjjnitiKnurBR61EtLwNbMiLZEfUuaBExsPSpCXu5cDNwYuRhJef8QKo4B+hTX+uUX9Vuu8iYcGm4tHCOmQmojplwcxl7//ExxZXDyGqJqIkYporffNOeqIFui04zIFgluBP1ex4F0OQQDvoHE6dnI/mFnw2nklBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345724; c=relaxed/simple;
	bh=Ls52pXpzr1T1qnGLbBRdF1CUTQwVNInSVmdkIWntQUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+hDWBCJdnJ6IlYiUSdIIrhn5sUB5c9Q+hhQFzPVWHXAQN2ndoeT5GD1QJs0+vcYz0qPqTh3pQnm2ME5b09a7nhTNpKRbCrUIraEH4Dlz2Bdbef1tBwVzIws4Rw3HwrDACLF8SWKnxS5zyhDh89cpuxnBwe82qwYVXsb8no5xGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDbG8rv7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDbG8rv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFBD1F000FF;
	Fri, 25 Sep 2026 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790345722;
	bh=UMixwAsKabK1Ucepgi4qrbQZ3u5iUCubCMkD65S3qpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WDbG8rv70Is+vU+PIVBNsn70DxnEEo52aSe4hJqUZoOHHyMQIWqYQNHgA5cVULQUi
	 nXJs69E93D5uPj6arnqYfSHHqsCGkFkYkAjBGBEAuc2ENemdlaZ6Fa4n7b/yB+l/Mp
	 8GUOWsStYxBMyf7Q4W+kh41la7giYFrn/kwCrWTpGIZLY+K5aCZiiJRiXeMa6B1/1y
	 tfuuUgzCjbq6i+p40UAkSl2jTujPUIpOMFLsk6l5fwbuhaTgKPwlswdB3UQ6AXW0b2
	 9MlDwHRuaD/QZN5K9VXDTEekamXRnwAIYlNuDs2cUL1GIWtPZ9fMx9QjdPcGymkSGO
	 chAvVwcjj5HQQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Avoid losing early rpmsg probe
Date: Fri, 25 Sep 2026 09:15:06 -0500
Message-ID: <179034566345.1095282.15144565947927220567.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720-topic-pmic_glink_defer-v1-1-94c0f233f2f7@oss.qualcomm.com>
References: <20260720-topic-pmic_glink_defer-v1-1-94c0f233f2f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


On Mon, 20 Jul 2026 16:39:02 +0200, Konrad Dybcio wrote:
> The PMIC GLINK rpmsg device can appear before the platform device has
> finished probing. In that case pmic_glink_rpmsg_probe() sees
> __pmic_glink as NULL and returns -ENODEV, which is treated as a fatal
> probe failure for the rpmsg endpoint.
> 
> If this race is hit, pg->ept is never installed and PMIC GLINK clients
> never receive the service-up notification. This may leave the system
> with no Type-C functionality and without battery/power supply
> management.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pmic_glink: Avoid losing early rpmsg probe
      commit: 1517efff0e9d21cc4c9cc7ffa1fcc30225e6b069

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
