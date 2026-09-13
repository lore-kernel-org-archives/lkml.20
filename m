Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10783E7BA0
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297003; cv=none; b=TtnmbZ5foRBR/tLaJIjrgdE3pRW2yHMwxIAEKynhLTtS/gHayS8thIZr/VVVpR81u34S15DMXwvx/qU9M6J+CZ4tbQ4oLJzdEkG1JaN2tSXBEEgdyS1FBwP9YgSj+x2UPNiP4dw31NR10HiP3mu+Uhje0tlU1ZFBZP7IeTEZr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297003; c=relaxed/simple;
	bh=9Wh2+Sq4486qnsJWwypJCAHHHrsTDKWj6SFG8qMpcVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dmmZNJTiO1cZ42NZyzj5bMO6PlEk+XbxXgB2YV9sb2GiZ4TOHzXThzDnA1CCACkP+y9t6FKzgluiX+sDh55jhS3GbKb62EW59AAN77ausRKYG1lJb67P0nGbninHv75RhOE9qFHVX/t8gamxMjoPkMxzABLxdKD8grzqYoIUP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6n1Yz4a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6n1Yz4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B311F00893;
	Sun, 13 Sep 2026 10:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789296999;
	bh=o4vwBXsY0aKxB88xoaV7+laAtETGalqgALYwpXPPn8w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L6n1Yz4ahzR77f4RbHBBxekgXWwvfW9lNPfcHxNw6KV++Plk+rvYqDpk43cdes99/
	 QzwvNQBstS+yybptTusAPKl7n5iBD+SV2S9iwk3X2bVfkOzSqJJg8giuqdT3A6AhDr
	 AKS6YDVw4Udq32oMjnVQQw+e1fvRkkU69H+YS9MShJyN8AUsNXqiHXgKjDvr3T0mBM
	 M55HkNuFQZTpCNOtAbBWCvI41pFtvb4a1YJM6avDuRtiLC2Mm/pgD5sEFPp7zwyGdq
	 76v6bj0EzFg4V9qULLFFIsty2QhdgZCvKqyuDUc2Oa2SJNM6fera/PchVxl47g2xVY
	 +v3Yr7MdFQYZQ==
From: Vinod Koul <vkoul@kernel.org>
To: olteanv@gmail.com, kishon@kernel.org, andriy.shevchenko@linux.intel.com, 
 Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260219163843.1571-1-vulab@iscas.ac.cn>
References: <20251112062246.852-1-vulab@iscas.ac.cn>
 <20260219163843.1571-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] phy: hisilicon: hi3670: Fix OF node and device
 reference leaks
Message-Id: <178929699677.215437.6593754684719636000.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 20 Feb 2026 00:38:43 +0800, Haotian Zhang wrote:
> hi3670_pcie_get_resources_from_pcie() leaks two references:
> 1) The OF node returned by of_get_child_by_name() is never released.
> 2) The device returned by bus_find_device_by_of_node() is never put.
> 
> Fix both leaks by calling of_node_put() right after
> bus_find_device_by_of_node(), and put_device() after dev_get_regmap()
> when the temporary pcie_dev reference is no longer needed.
> 
> [...]

Applied, thanks!

[1/1] phy: hisilicon: hi3670: Fix OF node and device reference leaks
      commit: 2638a0e60f65e38bbd28400340ab92fa67b562b3

Best regards,
-- 
~Vinod


