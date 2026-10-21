Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579643;
	b=iW9SgPC+tSk+Zs7JmhorK63t8tGDp8J8U+cyrX7LqAKaF+v6Pi2af0WY2ILrv0OZhET/
	 HAZ21lXCEz7PK6WdSzclH/cSqBbASw/LKE28z7fTxT7ciXSTFjkuRWU/paBDhzuVKtvVg
	 sHNhB3ZNsa0iGP4KwPpYPbwNnQZd/4QhB9CyzNlE/r4MZvH8EGvxSS3awH17AEqCNmpKU
	 lVvqlbK9qQDodyLnHRJHI1wGDkDVWmrZZxpB2VVtR+9c+Xqh+ayOwOYQXmmay5F/Rbm5y
	 qrQ0TVnYBq5quAf0jH+i6n4IKdNBXYNGX3CL0FIGqzooejr/LpJdhr9cn8klacg9wIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579643;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=4bc3lyW8ExNMs+t0RxZYctVap348djpgztaEMV/DmNs=;
	b=Of2XJi0ZpB3KrTPzVThx1IXOWiQr2baCNGQC+xO/9GWmfGHnEpehyvt9PH7YcZMiqC7I
	 JjWqAh8zuV52yqpYObt96MAFq9YSHRyMg/Mn1kxAarupzOG+wSGu/6tWONX8wlfKmTowC
	 NsJdv9wE1tBz9beeSVX+4MO0RM0ZgecdEbjoBrTiULgRPEWfnFIYyYlmKu73a4P7l3Xqq
	 0JXGgvy1ra6Wt7Jt9Au3AruAiBqN0K421Zrl8cjqHA2nCG22NuOZrVhWI9Oyu8Xw+JMf/
	 2MWLltcyQVUP1qyiyg+4fe9hdoqb9V3X5+SR1RNd4+4WGm1bBwyq/aaBkBCEz2I8Y2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oLGvXQ98;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEFE606A338;
	Wed, 21 Oct 2026 10:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEEFE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oLGvXQ98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4b
	c3lyW8ExNMs+t0RxZYctVap348djpgztaEMV/DmNs=; b=oLGvXQ984248iRJ5qJ
	tzRNkRq2PLyi3KzOHNdHtRpe64gdRSfX0s+t7wV3qXAg8quZ98tDZY457ItbJjuN
	QDBH2GE6nVXv4nCueP4gqooUEjgFw3IidJ61H7c9edWSn14nRjb9I2x+k8fl8XgW
	8dE8M8r4SchCwoyclzKz4/6n4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXXzcZmNhqXKxSBw--.62283S2;
	Wed, 21 Oct 2026 18:46:50 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] EDAC: reserve space for debugfs input terminators
Date: Wed, 21 Oct 2026 18:46:46 +0800
Message-Id: <20261021104648.4105938-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXXzcZmNhqXKxSBw--.62283S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxdcTUUUUU
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Bv8N2rYmBvbUQAA3b

The Versal and ZynqMP EDAC debugfs injection handlers allow the copied
input to fill a six-byte stack buffer and then append a NUL byte one byte
beyond it.

Limit each copy to five bytes so the existing terminator write remains
inside the buffer.

Jiale Yao (2):
  EDAC/versal: reserve space for injection input terminator
  EDAC/zynqmp: reserve space for injection input terminator

 drivers/edac/versal_edac.c | 2 +-
 drivers/edac/zynqmp_edac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

