Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073213E49C0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682137; cv=none; b=atW2T2mgvOrdcw5aqGBIG11LHC/exl2zZ7PA4V1qjc24De8F20gZ/dxqhND2rANuFc3fnDp3gBhFzJZC8E5Xn7Pgq5AMNCcH4Ztboe9gwstcps2hQd2wIicr0BBmlFlit7j04LvBeuF4NesYzQZfTgZy93DncavRSz9lEc2RDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682137; c=relaxed/simple;
	bh=O8XZeeW3rZMl/wrWsPbPY3qelV4ueQOSNrge8q3zmW0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IVUXb646nWkf4XcT7DDqPHYZEP9cm9kjngd6Cc85cCoT/UNGm1+pNWdHQMDs0Yn8QC+Rk1+g0nbqp6v2ZmRDqmgG8cda4BO8jy01/7qgexvWgAKrz4WbjpL5+Y2b1439qvKBYnQnU0odzyRP8+V2D8UklK9yOXpHU2/2ATTtmPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=J4lRhI8X; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="J4lRhI8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=xKDSKizHZCSh/GwioNCRk11NIWuQanvzrZUh4Jc1YQI=;
	b=J4lRhI8X9o2TPUgNwf52MVFNgLyW4EnCq1v/DKKzfzAvodaHGRHvJ8Q9q8Rliy
	c0cT4IvX8yAZ0qRUNpMDxs0szBksD+1//HaQLJ44K74MqPECXfy0zmJ5HSpKWq7p
	OwEy4+NralQg9ymjG6UhHi4n59v3chkVz9njhGiR1KjP8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnfypSH51qW34ZQQ--.4333S2;
	Sun, 06 Sep 2026 16:07:47 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Bjorn Topel <bjorn@kernel.org>
Subject: [PATCH 0/2] irqchip/riscv-imsic: Validate group index geometry
Date: Sun,  6 Sep 2026 16:07:44 +0800
Message-ID: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAnfypSH51qW34ZQQ--.4333S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFyfJr45Wr1kKF4rXw45trb_yoW3twc_ua
	4v9r98JFWxtr1DKrW7Jws0vFWktrWS9F1vvr1rX3Z5ZasYqa1xua4vqr4Yqr18AFWkZrs3
	KFWfX343Gw1IkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjvzutUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7hPdpmqdH1Pk7wAA32

This series handles absent and overlapping IMSIC group fields.

Patch 1 skips group-shift validation and masking when the group width is
zero, including the APLIC consumer. Patch 2 rejects nonzero fields that
overlap the lower address fields and makes the upper-bound check safe.

The series is based on tip/irq/drivers, which already contains
bd7d57a03c4b ("irqchip/riscv-imsic: Use GENMASK for base address masks").
That prerequisite is not included again.

The two patches have not previously been submitted. The earlier local
draft versions do not constitute public revisions.

The issues were found by our static-analysis tool and manually reviewed.

Assisted-by: GPT-5

Pengpeng Hou (2):
  irqchip/riscv-imsic: Ignore unused group index shifts
  irqchip/riscv-imsic: Reject overlapping group index fields

