Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9D4534AD;
	Wed,  7 Oct 2026 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366641; cv=none; b=CeuB+BbsHQ3L+k61DDBENphL12TKcV656fp7qywiwJ5nfDBs3IdbPB4ePwxRIyf7VOfpjDnqD+gKOw5oFsRoFLTs3i5spjnQRsIn+lScwuKjGdnngwaQL/4+20qaA48XQ72ILEzjeTMU2oXj4aV1QunBj/UC20TiDi8rwL5rCUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366641; c=relaxed/simple;
	bh=yRzOSQJq6pYhULsOf4dyOJDAzACfekZDem0Wrs0ESrk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gmpkZRHfm5Z1dfzlNRXFbKsGybUmA8HRtxbGvR1bPbtQ5bAaguqL6fmfGw+0KDowQShredJZotHY9UDRC8DemevOsD5dTXjjxigdQRwMqGxj0sFkIHHe3g+S2PXtK6eybTcXzM9+jYMCt8e4I5GzuztfRhu/5FiXpZ5YH+ZCQv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50294cf3a;
	Wed, 7 Oct 2026 17:50:26 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
Date: Wed,  7 Oct 2026 17:50:20 +0800
Message-Id: <20261007095020.820283-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260816100000.3707339-1-amadeus@jmu.edu.cn>
References: <20260816100000.3707339-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa115c57bb403a2kunm498eaa4535d129
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTxoZVksYQkJNTE9LHRodHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktJQk
	1LSlVKS0tVS1kG

Hi,

> Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
> MMUs, and connect the regulators. Remove always-on and boot-on from
> the regulator because it is connected to the NPU power domain.

friendly ping
