Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DE747F766
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936022; cv=none; b=Td2AXtSa2RkNO1wiZZ99cyYCZyZx/rkag6hTounAnrljajUH/gNNhOPdLUsN+hfNZJX8mSVOqrC2Ss0ewvPj5xQXEJWHB0eTQ8xHbGYRkYB8Bs04KH4wyBpsk2jxk1Byd9BPQcsthsqknK0VjGhMlYs5mHltIlbSBjph1qEx4WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936022; c=relaxed/simple;
	bh=+NMyYSR0q4CguElZkgY9cMD84i9q2+rZxgM6rQBXDUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNGZ/1XyEI5qhI/okCHL20eIWPWd/9+25UEm+UQTErd5/q4HpIqA0IqyK230TRNbgkkufarxaTifX18SYynyKHCBMGx3gF8mo6Z2cTQjzYMZAR625yVJAyr5N3VnOw1Np4wDJjsyAlgc/TQXyAat85HHTDMYk2PntUIvXwp1rSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLeUEGTA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLeUEGTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A751F00893;
	Fri,  2 Oct 2026 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936020;
	bh=vnoqOAvg5AxJGleE6Qb5JMlTIPuGPkSKPPhQI0oWRwI=;
	h=From:To:Cc:Subject:Date;
	b=mLeUEGTA0WCN2U54CpuN2I++Fh6ylG5y5wXPtU8Lm7UWz5TanEJ4MWNNhIu4rxjx3
	 nTryIpUiGDGzE5cbIwP4ZijA+5EZljBqwxsjrSqaIBQFoj6nysBhsUlLZUx7GA2zvo
	 GCvi78kZnydbui6/86DRgeM76yDEImtTorSgFEISRWUbLudZoILzXy9cCvVLgFGY2b
	 U5/Ea3aLSapLf/awT+LezSjSleAruYf58xScyRwl5dGv8VF0s/PVHyfVDc74x3pWul
	 Dl2bm+JNbtQoK0BukbvkG8xzj1oJy0qZChCo4ljzVLgp+oEO6UT55+tWFibLD9fv8C
	 NIM9BxZd7L8KQ==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/4] nvmem: fixes for 7.3
Date: Fri,  2 Oct 2026 11:13:25 +0100
Message-ID: <20261002101329.1084348-1-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srini@kernel.org>

Hi Greg,

Here are few nvmem fixes for 7.3, Could you please queue
these for 7.3.

Patches include
	- rockchip-otp: serialize concurrent reads with a mutex
	- layouts: sl28vpd and onie-tlv device_node reference leak
	  fixes in the error path
	- core: fix OOB read for bit offsets of more than one byte

Thanks,
Srini

Alexey Charkov (1):
  nvmem: rockchip-otp: Serialize reads

Janne Grunau (1):
  nvmem: core: Fix OOB read for bit offsets of more than one byte

Leo Cheng (2):
  nvmem: layouts: sl28vpd: fix device_node reference leak in error path
  nvmem: layouts: onie-tlv: fix device_node reference leak in error path

 drivers/nvmem/core.c             |  4 +++-
 drivers/nvmem/layouts/onie-tlv.c |  1 +
 drivers/nvmem/layouts/sl28vpd.c  |  1 +
 drivers/nvmem/rockchip-otp.c     | 15 ++++++++++++++-
 4 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.53.0

