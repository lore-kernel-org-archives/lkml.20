Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A0F3C1F36
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983111; cv=none; b=rvnzceQez/s1q0Y7nP1YQKtNQbe70THrmCq/ks0xdQqryPpqGlFAtS2CzilSVwhYjaK/wMbyiTacfAvODAE7eXl04AS898i1UbdFnkNbuoKVBKh1LBJCvD03rjxTSn3k4M6pdnmScXsEKIC1FEEDwgA7fcQRgky7Ca9st9Pqzrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983111; c=relaxed/simple;
	bh=4XB/I+FIqmb244yO8hTo1zUisuonT4XFLkLy0pw0SRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ik6Lz3O/6jjMq5Uo7iBeFIBVMNwvr0rvyvuUbK3oV8nxuP0uawuh6TH9Ft5ypI7S29ucwey9harnNNUTsFzmSzCNrPlsUlkGCb2qcTmGk27AKcGcL1XeUoOhrzxh2q1sAyDUZJwAAtI3SvbNRyntncpImBktCsLd8DvjiG2k93g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=NXo6z0qe; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="NXo6z0qe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-2eefaa527c; t=1788983103;
 bh=5ENYo56kYOoaOL7ZeChMo/ToS0E03eRMjgDAeWj53nw=;
 b=NXo6z0qeNlhXJ3sueVNq0M1NTSaVK5TPzDH9dKUPf1dw5ZggaHeB5LkTOJ9KhQSfijvWsGxse
 ye5t49FT3Aqbmjqw7yvMS3vG8bsL6JRar0/pWy2xPs9iaVizDBcZ0QcJOjY/+MwbkZI8pKG+OAa
 /+BwT6A+yriKwsSP/pFTbdk=
X-Forward-Email-ID: 6aa1b7365382f19eb5d6c7ab
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net
Subject: [PATCH v4 0/2] Exynos850 GPU support
Date: Wed,  9 Sep 2026 20:44:48 +0100
Message-ID: <20260909194450.183693-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series documents and provides basic GPU support for the
Exynos850 SoC, making use of the Mali G52 GPU through the panfrost
driver. Only basic support is provided here and as such lots of features
are missing. This series only adds the GPU node for the Exynos850 SoC
dtsi, but keeps it disabled, so it stays disabled currently on E850-96
board (The only user of the Exynos850 SoC dtsi upstream).

Thomas Turner (2):
  dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
  arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml   |  1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi           | 13 +++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.47.3

