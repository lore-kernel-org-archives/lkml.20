Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918077;
	b=T8qcuLZ2Sw/EOHCL7Y3xZpdcBOEobbgeYr9e42xjD2owbVV3EaCR//tY3iog/xPLElPK
	 QSQIT+pNBEXxBmQghg4xjAjzch4AS1l7rd2bqN6n3tRgHt1//Cn88OX4Ij6AoXxrHFU+F
	 B0kRBWREWB3q7ped8DGbKWb+SGag/KBY8RRXZCZwBwKGN1ZnyGWIljbt9H9xcZ4Pi0Qx9
	 mcHYs6x4+wk3JdgUK9aU3Y8ScXJDjC/UfEIyjOcebblKGGoE9VgO+4wERDN8ADEekkXlb
	 rhoBdRpdWpX1jz2BDwD6XkTnOGiMMJ8KDQvyTIrxfbpZ2zimnZALmnbyWZ0ULfY54tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918077;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=wFE5OccGT9k7Iu9igK8BTncgR6NdDYboc+wrbdQGo+Q=;
	b=ulk7n1MF3/5QBY3mmvxHjOZ5hzux1lLTBJK/2yG+P+31iAlbDrPJEF19mNDalzD6vRPm
	 ILOgPD+yfP2PDgU2xTdl+6DWgjhxIOqIoh9VU02JDKlLevN9ncx50R+wZdjfpPglnCvsC
	 Ag7sYOY3HH8KJuZcOXi2WiTblNrJ4Ityro1RtUHmCYXAXdzYhEnF4q/jIynpkJK3p0RD2
	 +aZC9wVRfTEJV3CHp0OqlK6I5vTFrbBk6aPmuPATLf43bYd38+KOw1gXfpoJN98PPUmmy
	 9kYlg18vVAbbojKceObZJHCu/vm8rp/uDeVXgg22S8A8z0XGJ0AsbzxfzJpoeIRU5Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNa9+CKg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128B3606A32F;
	Thu,  5 Nov 2026 22:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNa9+CKg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D191F0089F;
	Thu,  5 Nov 2026 22:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918076;
	bh=wFE5OccGT9k7Iu9igK8BTncgR6NdDYboc+wrbdQGo+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hNa9+CKgrefZrv1QfASZV+xCC+g6UJukrvZMgDY0b8maNLezZJ9eZyCY54Q+m5mM4
	 LsRCtGlpd49+LHMXUQQtGkLwCsNveavKXUcGwFMdAx3ke/anj5TJUT4CIHhx7hsL38
	 yqCxMO37x7u0fQ+HqKARTKESPeOBe/IOhr6P74zTkr99qJu7yi5vxYvdIYYDk4+LAh
	 ZG0D+EYT0Euvppdd/RTeS7liNWCytO7MsOy6rSX36QlWAuvyrGWRWfunvm0iRZjsQA
	 vi1aJ5Yh11Yr7zGcHoej4GPhh/SBe1mVAGztxLf9pQOee/SZVURF7h9KqIvyEKO2RY
	 5d27TB+uc5ZGA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:20 -0600
Subject: [PATCH 7/7] ARM: dts: arm-realview-eb-mp: Move "pmu" node to
 top-level
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-7-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The PMU node is not an MMIO device and doesn't belong in "simple-bus" node.
Move it to the top-level which is the normal location.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi
index 55287a2a0654..1805c00a90e6 100644
--- a/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi
@@ -101,16 +101,16 @@ twd_wdog: watchdog@1f000620 {
 			interrupt-parent = <&intc>;
 			interrupts = <1 14 0xf04>;
 		};
+	};
 
-		/* PMU with one IRQ line per core */
-		pmu: pmu {
-			compatible = "arm,arm11mpcore-pmu";
-			interrupt-parent = <&intc>;
-			interrupts = <0 17 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 18 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 19 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 20 IRQ_TYPE_LEVEL_HIGH>;
-		};
+	/* PMU with one IRQ line per core */
+	pmu: pmu {
+		compatible = "arm,arm11mpcore-pmu";
+		interrupt-parent = <&intc>;
+		interrupts = <0 17 IRQ_TYPE_LEVEL_HIGH>,
+		     <0 18 IRQ_TYPE_LEVEL_HIGH>,
+		     <0 19 IRQ_TYPE_LEVEL_HIGH>,
+		     <0 20 IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
 

-- 
2.53.0

