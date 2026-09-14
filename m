Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C587648821F;
	Mon, 14 Sep 2026 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401557; cv=none; b=mrABEcLhb6w6yEzzA968cJjZUMSBbRYGnQe/A0Mx+8gWuqHi3NJ3zzEKiUinsjm4ytVWAcZ6KN9JnoLRyb4UR2dXhoXSW4QKLuYv2yd5zWHQuoHOhjmbyKVwfGOHfqSUQbvsTbcofpiq7ubQ2kz5asioqJZGsJlp87NcOfc+NMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401557; c=relaxed/simple;
	bh=nf7aM7RWUWkbd8XIYhO1XB0fiyBZip9G05NFlle9HYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Grmt+03wN2Rqbg7IfyHCijuCO2TQSmrd7CLq8GWSGFFwyCW07USjNUKfUuIy2tw7qhtgDgdoLsD/IBbW78AMEJSzO5g+2irQA6jHK1ZFoKL4qa/Cmf/vTISomGYOvtuVsuybOqSseDF5WgJHvAIYKvg2KKszBi7TOYBgdrMSSYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qvVDu1Bo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qvVDu1Bo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76884152B;
	Mon, 14 Sep 2026 08:59:11 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.7.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 859763F882;
	Mon, 14 Sep 2026 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789401555; bh=nf7aM7RWUWkbd8XIYhO1XB0fiyBZip9G05NFlle9HYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qvVDu1BoMMSuMenLStj/36AwF5Pq0lFr8NvXaTn99VE0i+x/Q2Cz85jVnzovOMXG+
	 RWGWVLrO4vLU48yvCC1GOQm0Db6gLgR6M9ZSHwU4bbZzEA1us4DiTuZ7nLgOT1ajLE
	 4krx6FbtuEiqOpsm0LFJsBwv7AKi+vZtCp+e2yPQ=
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: fvp: Add EL2 Generic watchdog
Date: Mon, 14 Sep 2026 17:58:52 +0200
Message-ID: <20260914155854.123341-3-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914155854.123341-1-pierre.gondois@arm.com>
References: <20260914155854.123341-1-pierre.gondois@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add EL2 Generic watchdog to fvp revc, describing:
- Watchdog control frame
- Refresh frame

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 5c4dd1cf0daf..c84796438a83 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -294,6 +294,13 @@ frame@2a830000 {
 		};
 	};
 
+	watchdog@2a440000 {
+		compatible = "arm,sbsa-gwdt";
+		reg = <0x0 0x2a440000 0 0x1000>,	// Watchdog control frame
+		      <0x0 0x2a450000 0 0x1000>;	// Refresh frame
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0

