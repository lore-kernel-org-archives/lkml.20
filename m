Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1E3AD535
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625712; cv=none; b=Ecf9OdU6IvD2u0yENLfyb+aZMefry0u701CJcVwoElGjcgI3f0Y8PAxrlTQYWO4EHFwh6umedjtJv+4Jzi1ajp06nTQXW0bRcIvqIhmGeoLCklmEvYodfq3y3GB4AlzvZBCtd5AZcs19itVJEfofrzKJvmrt4LDOfNAZXuz9vS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625712; c=relaxed/simple;
	bh=ClCKvMqk096Ss1IQ2wjhG0LlsxZ/0gyo/vr3d+jeOkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GAXIvGjyUugiZJQdhVIcoi+qVg/qkSf+k6u02ufb5mhY/SEC1vKLDB0BWbMH/9i++6SdYSFBZW9HgFeQMVNNb6Pwkvt6Pywt7x4haw2qOCsy8LiUh1SK2EWMCTVLKC6akt+Xgpa+Rs22f+vBLkAjmftYv6p9qxgjeJ8xi1lrvTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLji/J+S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLji/J+S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6641F000FF;
	Thu, 17 Sep 2026 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789625707;
	bh=OgGmZb6jMSQm7J0WUsd7EqZXeayHVzyN5G7uVzAochY=;
	h=From:To:Cc:Subject:Date;
	b=OLji/J+SlPtFVwXDRTALtfJybOnuplFckZevJIzuYursj8ciOQMlHbILFsICymUjv
	 qynbKVkW4UWXHZf4VsrF+ji0dLO4XW2j3vaxvoTifnH6v41foHf1QMHzT8K9i0U35M
	 HT4vw54G/YIZVgsxhz993xI3XHmfh8PAr8gPcionqGk3+X77PiaaWXOqQbsnNXSR2Q
	 mE0JB0aDKtSdiHBa0SfjRfnxCAKobxi8GiTRX/5rvjEEkb7+T13fzSbu7kCd6oeaG7
	 IVePExkfyrNAjXyRnLcp4dyfHWFmSMULRnpIWF5G1Z8z4qG2wj97ywgWnFN3ms9/U0
	 sCciQf/QAUsIQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Hannes Reinecke <hare@suse.de>,
	Maurizio Lombardi <mlombard@redhat.com>,
	John Garry <john.g.garry@oracle.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Eric Biggers <ebiggers@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvme: work around all -Wformat-security warnings
Date: Thu, 17 Sep 2026 08:04:03 +0200
Message-ID: <20260917061459.1486026-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The sysfs code passes two string variables into sysfs_emit(), which is safe
in this instance but causes the compiler to warn when -Wformat-security
is enabled:

host/sysfs.c: In function ‘cntrltype_show’:
host/sysfs.c:682:9: error: format not a string literal and no format arguments [-Werror=format-security]
   682 |         return sysfs_emit(buf, type[ctrl->cntrltype]);

Print these using a "%s" format like all other instances in the same file.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/nvme/host/sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 02a2490a9ed7..e1e3dcfd084b 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -679,7 +679,7 @@ static ssize_t cntrltype_show(struct device *dev,
 	if (ctrl->cntrltype > NVME_CTRL_ADMIN || !type[ctrl->cntrltype])
 		return sysfs_emit(buf, "reserved\n");
 
-	return sysfs_emit(buf, type[ctrl->cntrltype]);
+	return sysfs_emit(buf, "%s", type[ctrl->cntrltype]);
 }
 static DEVICE_ATTR_RO(cntrltype);
 
@@ -696,7 +696,7 @@ static ssize_t dctype_show(struct device *dev,
 	if (ctrl->dctype > NVME_DCTYPE_CDC || !type[ctrl->dctype])
 		return sysfs_emit(buf, "reserved\n");
 
-	return sysfs_emit(buf, type[ctrl->dctype]);
+	return sysfs_emit(buf, "%s", type[ctrl->dctype]);
 }
 static DEVICE_ATTR_RO(dctype);
 
-- 
2.53.0

