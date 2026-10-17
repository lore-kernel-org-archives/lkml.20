Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37FE348463
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233354; cv=none; b=peS5SkQ3A369C2uWQEGaUWkWczlYVGwsxa0gBxoRAVxXQOL0Q5u58CTmowLfjjQmRx1hrIak1BxK4QYQr9xfJYuhjDrT+NVhffJcAtZYcT2DoKXtzkTSz+laMZMkox/SPh8rzPWSIJ44xH4qk/ZHqtKCMSYZ+/OgP88VlAx+rPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233354; c=relaxed/simple;
	bh=madghTK9ExBbBiA34VKdk4hXsj2aw7WBNeVH3eAy3bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPlx+HXMJl4aIkEJstNReSIEQA/0yEy7Qov1rwbd8qtowb+mrSHw1Kha+aiihPY6crOBopZOHQAWz2w0gJ1X9yc7JqL7S1pFClj2oXa252+y2YrhFscVK3+/sTXzcgrwhkWPv5T4O96IJikSy4eH8N43Qps0qGAA9rQqpGduWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=a/rynPDu; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="a/rynPDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ma
	dghTK9ExBbBiA34VKdk4hXsj2aw7WBNeVH3eAy3bc=; b=a/rynPDuQR0HIDruCL
	jk60lu1w701ZdR3xSBHViN858xpMhrKL+ZwnNOqZarEVDZW8AJLmTTwLXFElWTNN
	hfLfuPIc22QtndChSH6fl10r64znZmaGqwdzNkSAPGhdOOfQ2i+nmXLBfwIgIRSd
	bHfq1Bkc+aweHW1x7cP+WmEag=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXagpxT9NqwCttAQ--.44345S2;
	Sat, 17 Oct 2026 18:35:29 +0800 (CST)
From: Feiyu Wang <wangfeiyu_mc_code@163.com>
To: gregkh@linuxfoundation.org
Cc: Feiyu Wang <wangfeiyu_mc_code@163.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix logical continuation style
Date: Sat, 17 Oct 2026 18:34:44 +0800
Message-ID: <20261017103525.6203-1-wangfeiyu_mc_code@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007102212.112463-1-wangfeiyu_mc_code@163.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCXagpxT9NqwCttAQ--.44345S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRJb18DUUUU
X-CM-SenderInfo: pzdqww5hl13s5pfbu0lgh6il2tof0z/xtbC6xF-vmrTT3HKuQAA3P

Hi Greg,

A gentle ping on this patch. Please let me know if there is
anything that needs to be changed.

Thanks,
Feiyu

