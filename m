Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA11391E4E;
	Wed,  7 Oct 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366024; cv=none; b=QP0LxP6aHWmLQISrretQhIghktU5CSq55NOyH5g3ZhiBmIBWkjIzHO7BQQfjp7YJL6c3rYP5F7sLoLKT4WSJZxut0PP/fk/4YjLWPeJECUo9yCGVgBI9Hrab2WGTpi8bSJAYoS3tSCxN8chhWZyRb9Rj3Xf2FecjnREQKRbzyjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366024; c=relaxed/simple;
	bh=56i8iN8XIQu42EMSyo0eD/OhhVTYSzZ5pp/B827kHd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jWBY9HAsyXbWtoDdLWPikmN2u96v6ddmO8K1OsU6MfKTQoPSG2ZaBHg9/5fkSc7KFK4uiuMuZXKYfZwtSduuqOSbTYVdB9krm6yvNE0yVgO2/0KKIBvLYgGrRQ5m3SAq6oAye/6mGDaKfInxr2YPSaMpuVX7QSaLjTgubtS59T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50294ce74;
	Wed, 7 Oct 2026 17:40:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: fix adc button voltage on Radxa E52C
Date: Wed,  7 Oct 2026 17:40:00 +0800
Message-Id: <20261007094000.817223-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260808100000.1518466-1-amadeus@jmu.edu.cn>
References: <20260808100000.1518466-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa115bc07f103a2kunm98eed11335caa9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTx9DVhgfGU5MQ0oZTEseGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MSVVKS0tVSkJLS1kG

Hi,

> The ADC button voltage should be around 1.8 V, not 18 mV.

friendly ping
