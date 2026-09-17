Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AA24B4893;
	Thu, 17 Sep 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639236; cv=none; b=TNRne5JSJkUMyY1WH6xy5TNwU1i2Ryl7I4+m9+VsOUjBCMw3xDEeLrmVm+vSPMuLN9cJOaYIoaqQ6JBqdlZ23FaUawKyDCYPAyYVOJ40QUfLD5yjeWiE33nQvUVsSqt+EEsCzt++fo53F3D82rpEDoNFwBppF5rISmCqIRJ42aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639236; c=relaxed/simple;
	bh=JFvGJdYLcE+PpqMEvTmxD3+T+JMsQbZeOa/GAxlsjok=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gK8jqFk9U7sURdpwuuu7NWOYY46nXCr/FzxTA2h0mzw+7bsovq3uqa0M972/86oHZs9xw7H3NICQJqB3lbXQXE3ngkaHXMMnBtjel0+HC+odLyrcs0qgksc8MvqtpCe9EjokJxlyPYSEU59GIEltdFyK42tpAX0aybAT9buaQuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADHMTwquqtqXC5+CA--.100S2;
	Thu, 17 Sep 2026 18:00:10 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: bingbu.cao@intel.com
Cc: hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	lixu.zhang@intel.com,
	make24@iscas.ac.cn,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] media: ivsc: Fix csi_dev use-after-free in mei_ace_setup_dev_link()
Date: Thu, 17 Sep 2026 10:00:10 +0000
Message-Id: <20260917100010.2145775-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADHMTwquqtqXC5+CA--.100S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF1DZw43AF4kZrWkJF45trb_yoW8XryUpa
	yqgayqyrW5Xr4jgryDAa4UuF90qF4a9a13GrsIyws7Wa15Z347Jryjqa4UWwn2yr93Ja4j
	yF17KFWfAFs5Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBFb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48Zr
	WUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6x
	kF7I0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x07jbHUDUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgkNA2qrq3Y7uQAAsf

device_link_add() only takes a reference to the supplier when the
link is created successfully.  When it fails it returns NULL without
taking one, so the put_device(csi_dev) before the error check can
drop the last reference to csi_dev and dev_name(csi_dev) then
dereferences a freed device.

Move the put_device() below the error check and release the
reference through the existing err_put label on the failure path so
that csi_dev is no longer touched after it has been put.

Fixes: 765abb76f51f ("media: ivsc: Release csi_dev reference early in mei_ace_setup_dev_link()")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index b306a320b70f..bb57656fc85a 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -414,13 +414,13 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
 	/* setup link between mei_ace and mei_csi */
 	ace->csi_link = device_link_add(csi_dev, dev, DL_FLAG_PM_RUNTIME |
 					DL_FLAG_RPM_ACTIVE | DL_FLAG_STATELESS);
-	put_device(csi_dev);
 	if (!ace->csi_link) {
 		ret = -EINVAL;
 		dev_err(dev, "failed to link to %s\n", dev_name(csi_dev));
-		goto err;
+		goto err_put;
 	}
 
+	put_device(csi_dev);
 	ace->csi_dev = csi_dev;
 
 	return 0;
-- 
2.34.1

