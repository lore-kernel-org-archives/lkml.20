Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846F112CDBE;
	Mon, 14 Sep 2026 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368022; cv=none; b=kyf1/6XxQsCEZpczaqr/iZ43PfU9F5wo/1dy3PYrIXkDu5hTmbc9nYrkJelBCE292jWZYFakstydcP9zp793PdQj2l8idiNNTCbsfZvprBTZE6FRt3bcrtcktLbvitEWJJgIRvZlZ0R+14RQ7quGwpbP1LqPum8xA1O/s6TfPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368022; c=relaxed/simple;
	bh=I6l7npGQLlrrVjYJ1m5sd8/zPibfbzBi1Vd32GMtQwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bPUxbTldpfwlEOSbx6l0FpVp/KY2wuqNnmdpGJmHxd8Y9Qb8OBBi/0husCoI6NQZBZTh3QFEHUhnxFrKDlbanuKpYzhnwj7HWdgRckS7xbIrCYaqAf6Ntod+88eDEMYKEJ8pC53cBXcZJiC4Et+2RhbSsiRObcbXgR9Q+yd0vzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4da3ed05c;
	Mon, 14 Sep 2026 14:40:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: devnull+hystericaldragons.proton.me@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diederik@cknow-tech.com,
	heiko@sntech.de,
	jensenhuang@friendlyarm.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	razor1702@gmail.com
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: Follow the DTS coding style in the NanoPi RK3528 devicetrees
Date: Mon, 14 Sep 2026 14:40:00 +0800
Message-Id: <20260914064000.2409837-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911-r28s-upstream-v4-4-fb6c85f226d4@proton.me>
References: <20260911-r28s-upstream-v4-4-fb6c85f226d4@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ea4f22e03a2kunm37188d382a2ce1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGk0ZVkxKHR9LGUhOTh1KTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG

Hi,

> -		pinctrl-names = "default";
>  		pinctrl-0 = <&led1>, <&led_sys>;
> +		pinctrl-names = "default";

I don't think this change is useful.
Most devices are sorted this way:

pinctrl-names = "default";
pinctrl-0 = <&xxx>;
