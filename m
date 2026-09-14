Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744BC488204;
	Mon, 14 Sep 2026 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401555; cv=none; b=lME3qa0I+ty6txpF7jEV8VT5msxoXVGbUFQl5yLw9JGC2GLqldgDQqH5VzYeKLBVJbKBKPhMsiE8LspcHhf/S78gWtzoUISAruaHl69wWIX7X3SZYnGNv2dC8EUGt5sjeCbWf+n9QIwVhuGcl91j93Gvel9RXC5Q7lI97OzWjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401555; c=relaxed/simple;
	bh=+IY27kKgwLo/EDgbyV/Lm6hsc0BtWZRKYkJ83KZEEF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMF19tEwUVKi7ZaagP/9shyoYOBBqpfxq3EaoogUuJ5sVE9Woih+JEm1mau/EnTt8LnjHf184cVPiPQF8SGHJJeO5dax/WU94Og6h1zUlXHnaJxcrWaNzg4xHyIiju0ZA/bwx//WLbvXs93cuKxTJ8IcNYyl1d4AZElc7LRSuoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tJB0bVrq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tJB0bVrq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF841CC4;
	Mon, 14 Sep 2026 08:59:08 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.7.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 422CE3F882;
	Mon, 14 Sep 2026 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789401551; bh=+IY27kKgwLo/EDgbyV/Lm6hsc0BtWZRKYkJ83KZEEF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tJB0bVrqZl0hJ+tXz/a38j5HcIOHarym8a7BzDepN+RSGifxuzS04Z9BF9bTId5Q7
	 KTkQyp54mWolEmAgpAuVh18aOEnT5O8NejTB/JNPqYFQGB48jfmw9TK1z8GUnfXShH
	 ryyFOkog2km79job2ICnk8KqZwg1HELmVV/9nXd0=
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
Subject: [PATCH 1/3] arm64: dts: fvp: Add cpu-map property
Date: Mon, 14 Sep 2026 17:58:51 +0200
Message-ID: <20260914155854.123341-2-pierre.gondois@arm.com>
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

Add a cpu-map property to fvp revc to describe the topology
of the platform.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 68a69f17e93d..5c4dd1cf0daf 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -44,6 +44,38 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
 		idle-states {
 			entry-method = "psci";
 
-- 
2.43.0

