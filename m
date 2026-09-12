Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D1B3932D0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789245915; cv=none; b=ZlbAzSFBMyO5qlBjNi5nQvrcyF0ymSl0vQ2xYwnZE6o9Dx/itbf/ANS5+IRVzxvoRKl+oXkZVmmK5eyS8VeWkxRItLfLdi7FQxklNX/WfLZczfX3Ehm71HJv92NULbnVpp/3c/o1GvC31JDy9+k59pDs853yIWYbHyROvXv/hYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789245915; c=relaxed/simple;
	bh=jCtkC6D2w9zvVyG6Iv9zvmXCHGYf9UDcHKGEplKcoKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZjPehA5ZG3H9Lp4U2WIakz0yLB+/6kgxobvMAYJkSHQy3CNc3KkbZ4m2+SVIqz5556O+NajEYZhvbNSVsIZCzg6/Io5U4BKHod3AhSq6vO/GeRfqwyEFDO+0yEEqq44A7aYAefo0Oacz3ef4F0XBgxoUfjxCPlg9SkY+Zl1AJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=fDCgS+4R; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="fDCgS+4R"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8CE0D240101
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789245903;
	bh=va5DYBu2vUOwC5NHKgWZaSsI06SaL+sZeAaoSpAlKxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=fDCgS+4REl5KgxgSmYJhCkBu7A3e2lsVPV/12PgGbIOvbiHmMsBKCgx0v2+FsqwmR
	 PHyLeTSZNMo8u2NcE05l0APEo3uI4a12vWKhHbXXnuuvjWNwXkVlneJ0rS6rgZbEMO
	 zQ9o3GhoktidxAZsKVkON8xHoUavnM2T2fGTw8DGHjKVu1iwI0Z+EoacEhJ1XunKU0
	 19n9qjwvNzjHtINmian7oP/zgqP4vElTN72C89JetY39+xIkE/8Kd/pg/ORVMyn0fq
	 58ZQ/bil9NCVFq/tUACL6KJcDFyy6cxthDf9xCsvBQnRB3ymQLzYonx7sAZ2JcZfvA
	 fpL2+SNxFt89g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hj3M0750nz9rxB;
	Sat, 12 Sep 2026 22:45:00 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: st: add eMMC support on STM32MP257F-DK
Date: Sat, 12 Sep 2026 20:45:03 +0000
Message-ID: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SDMMC2 controller, its 8-bit pin groups and enable the
8-Gbyte eMMC of the STM32MP257F-DK. Only MMC High Speed for now.

Tested on STM32MP257F-DK.

Mateusz Nowicki (3):
  arm64: dts: st: add sdmmc2 node on stm32mp251
  arm64: dts: st: add sdmmc2 pins on stm32mp25
  arm64: dts: st: enable eMMC on stm32mp257f-dk

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 69 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 15 ++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 21 ++++++
 3 files changed, 105 insertions(+)

-- 
2.55.0

