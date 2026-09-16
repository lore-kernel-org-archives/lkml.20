Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C43B71BD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574108; cv=none; b=qipmRH7kkuxiqaPXSQhXWNveNMnYDcInL4u4mQuOIp7nS19OSSXChrPapDHl+wNPb/+6ZGUUtT1ocP14CERJTagQFp3eymtFh7wlFkWRJb5HX13l21APwYMxIEBslbiom3Mr6AwASIrOcbWph7xYYhTavAoywU2X0ng7TyK91rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574108; c=relaxed/simple;
	bh=nXfwJbeIrC81Bycy+RIKQruC5DeNmTDnBtdHiBhbmFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4C4SubIokrM77XY1vmCF3bHzF4L/i/taQqT6zxTK4haL4w/XU2BR9+yO/KNyMautro2zSQxhLsMV6iPN3JQhwgIe9JHPuIt0U1Ey6Xd2fiv2XxFa4bH2OjN6eJtYJlfmiXFpQR/zv2MI3QkC7A5uEW/Mw/xPdw6bruaUa7PbQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HeQ/sXHw; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HeQ/sXHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cT
	zr6LFeS+OFd7bDXS5RjM/Ui5LVd91xBChD6tsVkLY=; b=HeQ/sXHwpQ8GiLIfk5
	9CXskLUHcHs5TZslUaEdincvFoggm5qOQT7fNIm05OTFfWc358jyzIwdnoXw1JWM
	mQmbVGE0Qg4PXl3fyJrpz5GcVsP9PK4KTpkxZnAulJTcdKOSC9CGal0/rlt5iw8u
	MAc9ZmjvzhOLcIjKjqJkzfkxA=
Received: from deepin (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgDnZ9Nzu6pqvrgKAA--.46070S2;
	Wed, 16 Sep 2026 23:53:24 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jordan R Abrahams-Whitehead <ajordanr@google.com>,
	Marco Elver <elver@google.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Edward Cree <ecree@solarflare.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: Re: [PATCH] list: add missing empty list check to list_cut_before()
Date: Wed, 16 Sep 2026 23:52:06 +0800
Message-ID: <20260916155206.6833-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aqq3un8aNsSNow-_@ashevche-desk.local>
References: <aqq3un8aNsSNow-_@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgDnZ9Nzu6pqvrgKAA--.46070S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIhRREmqqu3TPIQAA3U

On Wed, 16 Sep 2026 18:37:30 +0300, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> Any new code to lib must be accompanied with a test case(s) as documented [1].
> Look at lib/tests/, there is already a set of them.
> 
> [1] 0a83293322fd ("doc: development-process: add notice on testing")

Thanks for the suggestion! I will add a KUnit test case and send the v2 patches
in a few days.

Thanks,
Ziran Zhang

