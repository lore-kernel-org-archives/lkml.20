Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB5346E54
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511233; cv=none; b=F5j+UdRcveCeNUcqTPO+LJOPy1K40dRQaMtZsQgzzfSl0oWZ0qQjuSO1Q9/D9KRJFLlrXYfZfFzRNbsd2l5w4zCqzcamm4rxlmDWKgi3tW+TIgIMVjIjoEDZgw6JjguY5B2lCK+JeXQVTtB60zkOiK1hrr6hf+llajSLe9v9E7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511233; c=relaxed/simple;
	bh=bmYgvLBj+2fhN6x9AYnMb/kQHcFNBrYAQBS80G1+HZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7oZKRzd/3X/YgpiJ46XT4k9ucfDF+Q95nzim+TPwkEybtUo+unbYubwLc/fJTyBy+Ny8eKwmsoNJtd6Xy2ObEueufvkNw62jedzsjS3Ve5CiaVPrHI53t7l5eW+/WC36FwtCXtQ00p3rQTrdNorpWvq2Sch7ooTGHFfqx8DxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VVeBrPjA; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VVeBrPjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bm
	YgvLBj+2fhN6x9AYnMb/kQHcFNBrYAQBS80G1+HZk=; b=VVeBrPjADv8axBo0bk
	jPpFYmA817kRL1EPemb5uHEuQBMSQvgOiQdkvMbtghKXYsFvo6JUYuN0p36YiL1u
	CJ+HOCuucVWVTVtqIDoSR4gcQs26wmEX/PTKuWLGhN0C5uPm1NAuQj3IOwoCe8/h
	jVS6KMzV3FGmkMh7bZyzYNe7k=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnt0z6xalq3CS+Aw--.61588S2;
	Wed, 16 Sep 2026 06:26:03 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Longlong Xia <xialonglong2025@163.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] mm/ksm: merge-path cleanups and folio conversion
Date: Wed, 16 Sep 2026 06:25:43 +0800
Message-ID: <20260915222545.5683-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aql2wPergPKdfzU8@casper.infradead.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnt0z6xalq3CS+Aw--.61588S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRQ_-BUUUUU
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC3Bu0rWqpxfthtAAA32

Thanks for the review. You are right that I did not justify the
page/folio boundary clearly enough.

Patches 11-13 only avoid converting the target page back to a folio and
provide no functional or performance benefit by themselves.

I will separate the independent cleanups and drop or rework 11-13 after
getting guidance from the KSM maintainers. I also found a NULL/bisectability
issue in v1 patch 12, which I will fix before any follow-up.

Thanks,
Longlong

