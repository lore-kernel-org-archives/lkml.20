Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A5F329E44;
	Fri,  2 Oct 2026 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953652; cv=none; b=I5JFdTGJu/KpzKfmi6uaQ3TDMIvUT16sv7FsD0ebQrqtZYrgC7qAmvgxT3YrNJVT2Mdqp8qaxGTV7GquA4RP1V6DIPKLTPfkZTGdHbMBdpchyiWzyqaQnGOTmq1U7OblBo9FZaYWPf3OSmrQt0X3YRwFhhwCaU1YoOO3z5Smpew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953652; c=relaxed/simple;
	bh=pvgnMQIOoGbDrwhtaTkdZY88ra+VR6RHSHaH8e5JJyk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X2xa0K49R2pPuPsXYDXCtako+5YoS8QBTEv8ikd5uuosFTLxCHmZ40UK75L040SallGvM5yl8H9fqwGQlrlccV7SrgKHocH0w+KXVDWIjjq3Qbms+4QT2zLw9Ldhtdbkdj6a2YF3j/SUHZzUjMPtRK8pbpaBLFbl3qOOZTPNVkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vJIobw6O; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vJIobw6O"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BF5F497;
	Fri,  2 Oct 2026 08:07:25 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03DD53F85F;
	Fri,  2 Oct 2026 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953648; bh=pvgnMQIOoGbDrwhtaTkdZY88ra+VR6RHSHaH8e5JJyk=;
	h=From:Subject:Date:To:Cc:From;
	b=vJIobw6OFbsqbBpxSJwW3ejz3yZdEaPjplM2TQYPkXh6IZWsRkJ1Z9lA6RMbFJgho
	 xgdqvasLD04LgVpl4sl3RQKYD4/1dNZYWz/CtX29xNmoYJUz0pQQ6TqYobCi7OqqJj
	 Ul+cANRfgpKXvo6+n7L+6TG3gFGudyQ5N0cUByuA=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/5] arm: coresight: Clean up funnel and replicator clocks
Date: Fri, 02 Oct 2026 16:07:19 +0100
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfIv2oC/52O0Q6CIBhGX6VxHQ1QsbrqPZpjiL/yL4EG5nLOd
 4/ceoEuz3dxzreSBBEhkethJRFmTBh8Bn48EGO1H4Bil5kIJiRnjFMdnTIhQsLBTspiISVTEVy
 YQXWL1w6N6l/ew6jMGMwj0U7UdVVJ3cK5I9n7jNDje2/em8wW0xTisl+Y+Xf91cQftZlTRjkry
 kurq1IIfcuOkwmONNu2fQCMOEqw8AAAAA==
X-Change-ID: 20261001-arm_coresight_hi3660_remove_dynamic_funnel_clocks-d277556abe8d
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=1242;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=pvgnMQIOoGbDrwhtaTkdZY88ra+VR6RHSHaH8e5JJyk=;
 b=cmOXFv8KVTg3rB3iEzKjFXWOXWbQmhWuQjuWQI7YpZ06cTmNmfYDanvXRLwkG2qi0mpzkOaGD
 uTZeNE5+L4vDZrQ+m03XYIFEJaz8vqQyGwG0zJZgFtxfEIoSMvtwWcC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

This series documents optional atclk for static CoreSight links and
removes unused clock references from several device trees. It also
describes the programmable Zynq-7000 funnel as dynamic.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (5):
      dt-bindings: arm: coresight: Limit static replicator to atclk
      dt-bindings: arm: coresight: Allow atclk for static funnel
      arm64: dts: hisilicon: Drop PCLK from static CoreSight links
      ARM: dts: zynq: Use dynamic CoreSight funnel and trim clocks
      ARM: dts: qcom: apq8064: Drop PCLK from static replicator

 .../bindings/arm/arm,coresight-static-funnel.yaml  |  6 ++++++
 .../arm/arm,coresight-static-replicator.yaml       | 11 ++--------
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  3 ---
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi            | 24 ++++++++++------------
 .../arm64/boot/dts/hisilicon/hi3660-coresight.dtsi |  4 ----
 .../arm64/boot/dts/hisilicon/hi6220-coresight.dtsi |  2 --
 6 files changed, 19 insertions(+), 31 deletions(-)
---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20261001-arm_coresight_hi3660_remove_dynamic_funnel_clocks-d277556abe8d

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

