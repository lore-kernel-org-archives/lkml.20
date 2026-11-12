Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453101;
	b=Vm+JaoesBR6dNFoCneRCrejV6+BZ5eeHe78jeWeeORWpC+qCBMKuuuZkBqq3cQbXFv8o
	 SioAcgaptI57kxPo9abbnbwaeT8Rmq4LkQ5/kWs8Ck8Kaqgm9k2Aa2ev9Ccj9wJUqvV24
	 JzsJJEOHbdNnTDtnLclocU3IFjoL8jr9OvJjCIBzjMIPxqWnmNIis+aWwJ8I0xT+faGVM
	 2nedym4tcT70KyyaEyKzEgBVAkhSvsQUDSPIvVmHycBgDLLwAQT54Q9ruyB71PP5PFNVs
	 iiP/Rcy6vD+i3iBx32kJNcv7X2HxiaJakazWRBuHnqKQqjuPvRY+s3DfVXh676YMF6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453101;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Fj6CoQmsX9XGQZEuHghitNTy6tkyR5OQsxgnkp1YdaI=;
	b=gO5M8xjr3suicHmItg8hNSji4O/XrQzzCrApkjPdWpSSil9L7Wdi4eo/XThRnVsc/YZb
	 V3HrI/1EUx27jOT7i0QmT9WB+IKoeEJq8+XfPUrhs5p/G9N4mQeSPLm2ggkG5uCMFPjNe
	 quEYIyyzg0n3sI4ePhdIs/OY0PPLt1AYIc1j6p7PkaUWYGVIlm5aYAY/Tno/fRG6+SeuZ
	 h0nE2lJy0OcIu9x0QQaGrgf0Pc77HFPgk7kjcUE2NHOWVYhpq+vc6w578jWyMB4KwIkFQ
	 V781Ehu7p7evdTi4MEMrSRwGrKoLUDdX+aC/J2ieWHqia7TO/roL70lOlUYu7kmRDrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=nnlYnvDG;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935B7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 935B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=nnlYnvDG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794453101; x=1825989101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fj6CoQmsX9XGQZEuHghitNTy6tkyR5OQsxgnkp1YdaI=;
  b=nnlYnvDG2CGd20yWyWalH3tKv9YWAjnyzivfcO3i2uVyUMGhKovxXHsC
   JsjmtApqqjLAhmfg3DrNh3dLOGiu1KB9pQHfxVhWpbRp/VqU6WdIVeNc1
   oOrSVudRuvUlvQVhVdc9X6Cn4t1c9/ICC6/M8aoxR4MiGw/j9PgGiSWXP
   19CHAdI/hwmxOCU/0yY9GktXsJncGX1x2lht4HG/XzdL8jZ9UJWVqpUsV
   HCtMW1dI1/QKctjBovrRSHLzRNQsYziW9Wvc26GcTWwO0dJXTumKtGNpr
   lc5lc4IOq5BhY8whRUqlcGqqlnAflH7h1ci3qbZDUnQi7kPDedBzihP+O
   Q==;
X-CSE-ConnectionGUID: KZI5UGNHSFuliO4mCWnTAQ==
X-CSE-MsgGUID: FIUT3GV+RMeyYH/JwlmIKA==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33547152"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:11:41 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:23415]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.231:2525] with esmtp (Farcaster)
 id d5e2315f-cf95-4f5f-b2b5-64d618372791; Thu, 12 Nov 2026 03:11:40 +0000 (UTC)
X-Farcaster-Flow-ID: d5e2315f-cf95-4f5f-b2b5-64d618372791
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:11:40 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:11:39 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 16/19] nitro_enclaves: Let 32-bit processes use the ioctl interface
Date: Thu, 12 Nov 2026 03:07:12 +0000
Message-ID: <e62c7d712fba89df037e136375f36a34752d1d70.1794393487.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794300000.git.graf@amazon.com>
References: <cover.1794300000.git.graf@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

A 32-bit process on a 64-bit kernel gets -ENOTTY for every NE ioctl,
because neither the misc device nor an enclave fd sets .compat_ioctl.
The ioctl arguments don't require translation, so just add the default
compat_ioctl pointer to them and hence enable 32bit user space to drive
the device as well.

Fixes: 38907e124088 ("nitro_enclaves: Add logic for creating an enclave VM")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index f8b066c990ce1..355eb0a684ec2 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -68,6 +68,7 @@ static const struct file_operations ne_fops = {
 	.owner		= THIS_MODULE,
 	.llseek		= noop_llseek,
 	.unlocked_ioctl	= ne_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
 };
 
 static struct miscdevice ne_misc_dev = {
@@ -1762,6 +1763,7 @@ static const struct file_operations ne_enclave_fops = {
 	.llseek		= noop_llseek,
 	.poll		= ne_enclave_poll,
 	.unlocked_ioctl	= ne_enclave_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
 	.release	= ne_enclave_release,
 };
 
-- 
2.47.1

