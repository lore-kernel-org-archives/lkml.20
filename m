Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CCF3B9D99;
	Fri,  9 Oct 2026 06:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528015; cv=none; b=MkrbbUdo8JOx1WcUgQhwmji1XjJjuk2LfgFz82aEm56xl+AALqNflfViAxOLkob4TXHYCmDBazILy+v7C3tguu1+izMqIZ04XPBY32WI1m1LAg5/0XmiMV2O+Y9l7ygl/4nmj/+mCfhoo/Ts9/nIFSWBXZ0lq+Ui3my7XVqXOmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528015; c=relaxed/simple;
	bh=3l0a8SnbNWkjLju5i7Tb4FJKVibu6Hhm+hJiTZ91hHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vciv9hjoAObVrlwoxIEYnNtIy5zP/QsSN2QEOtjaxwTPNlIWFWN8Cm6zRj73n9q+xqHsC4B7ZL5Qmse4eTv0X9UQRzucJKdJRz2hVIjJwlcQfTsJVwtdW5h1S32FjFp96B9lD9dLJVjxzo+uk+B89oc891VB1KYYA25jMjCCE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 506901f95;
	Fri, 9 Oct 2026 14:40:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add Radxa E54C
Date: Fri,  9 Oct 2026 14:40:00 +0800
Message-Id: <20261009064000.371223-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
References: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa11f63f41b03a2kunm224f12263c8abe
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkhCVhhJHx1JTUwaGk5CS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktJQk
	1LSlVKS0tVS1kG

Hi,

>   dt-bindings: arm: rockchip: Add Radxa E54C
>   arm64: dts: rockchip: Add Radxa E54C

friendly ping
