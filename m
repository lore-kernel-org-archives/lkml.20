Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C4457E5D;
	Sun, 20 Sep 2026 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921097; cv=none; b=hoH5LU4lZIACTX1dri8N8KdAYU7bDG1P3FsfFhhdov/wBLKmurFvh6sMAOYv+fM2ScGgRaHnuKX9OsxiikAqVVeqtYcEujBPBWiGfYmv4GKgd4A8/TJQO7LyawhiaCPpAyIG7XH6mdyZJkTE+s7bXUP1d1iB+IK8gkRz0f3uA2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921097; c=relaxed/simple;
	bh=qrd51FM5tl7oIcdtAjunnfY0zt3GulcVDaAudO8yUAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r06hbaRHwL1d9ic/TvIi4xC4baR4SIVTuGRJgO+8pVCVDGkj5NMYQSxrBvd2xVbwUhxMMHaRQ6ovCuixAF6YnrWESYNGfOWngeo3vzsEQCmK46aNChI+CVVngtYPrrQQTpHpS/AQhsDC0Gpr2oZBHBrUfMRmdnwqCh1j3PJRQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcEwv28R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcEwv28R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A5F1F00893;
	Sun, 20 Sep 2026 16:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789921096;
	bh=PscyQc9iTEBQHUxuu5sjpSEnhgPYQHGisQ7n/NeljC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BcEwv28RIGLo5l6ZHrSgMqUA2poxenD3ZMvffsAr59wZ4pt2BRf/WCjtHokgWwgWU
	 D150uldtkSc4fr1eEKG1900kw08Vsw2KxoniTRZS50leD4e8/i9+hvlC6eR45Huzu1
	 c/TN6mlN/vMweNNMZ3s3wJaior0mG80wBANl/1effgG4rpNYBoJW0XyO46L3WjD8HP
	 rbHhUHsWuOVy85xbOu28JvijJqEOzR+graJkqbA+xKva/Y0IRSBCtZiaFOzfJEb6mD
	 umROEl3tzJtfqgy3Icz+s5PbVLZ1+jWNkk0oVyJBNHv/yVB66y46Dj9OahM59XBQo0
	 QvvgVQSmAFOOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
	Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH V4 0/4] arm64: dts: qcom: Add SD card support for Glymur
Date: Sun, 20 Sep 2026 11:18:06 -0500
Message-ID: <178992108605.214160.15370126108143745115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Jul 2026 19:53:38 +0530, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Respected Maintainers,
> 
> This is v4 of the series to add SD card support for Glymur.
> 
> This series adds SD card support for the Qualcomm Glymur SoC and the
> Glymur CRD (Customer Reference Design) platform. The changes include
> updating voltage regulators to meet SD card requirements, documenting
> the new compatible string in device tree bindings, and enabling the SDHC
> controller at both the SoC and board levels.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
      commit: a501c39e16105cdbd1fb6abe29d955b378306ed8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
