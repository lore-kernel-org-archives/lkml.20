Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=146.20.161.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979113;
	b=XDcaUG/GU8dx7DNAnerG1/VO/6uZ5qrDcj2aSU5BumPnFbeu3LOpU05gWL6j3aOL5d+P
	 lKwYJo49uleFAYM7/IwtEfwjxrX7RBed0MKrfA7uDmPvH8+jYF+G34Avr1MQ4wgkz1f1u
	 fAmx+1fEZAAvobM6LrydTN6W8EG+fmlnuWjpSf/w8v+ve+PA/aIGu7B6Xq9wlxkuEbumS
	 972n4NvQpg7t6BYZepFACfBB38M03XuNjY8nj20bwKA2tSjSlQv9B9e/ZoUrTgIPenfeG
	 D1XPWtQ0u8W14RrPGpRs9pNgWFyF0WpRQEKtg76k5UDVdfQPq9kqAeD+T8Q40MObE1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979113;
	h=DMARC-Filter:DKIM-Signature:X-Auth-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Classification-ID;
	bh=gt61fOTtSF3NDWNXcGDgaynKw7+TKZltIBBPx+zHl54=;
	b=SM20HVt3KOrxLt/iISGy2J1bDpOpJrkFJxyIVOIyrTjIHG3Q1+lC1ghzNUjV1HZlqZUp
	 or1G9bfL3c1LyM01RUTj04nUQ/sbiuQ8KV0A9UyF6tx/WNgDmLCLruoVdK5QqCuqksEDy
	 ik3+0+474mbaBIkXGqeTBHJjcYbMmRCGsf0XrU6l5eSeCTt6Q1JUVhTaETp06NlV9vEz3
	 YQn1tPKyuP0xQi8NbjpX/KU2cqYWfw4rfg8lBNxGqyr8vTvWmBItOQGpI0SPq5ZqMyoBa
	 sKWhiKuKuB1s2332hIjqDT1SPAMiEmPoiIQtXHCJWRRGmxOUIaa0wwbO+9xqOEyc2fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mev.co.uk;
	spf=pass smtp.mailfrom=mev.co.uk;
	dkim=pass header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=IaZUq94l;
	arc=none smtp.remote-ip=146.20.161.100
Received: from smtp100.iad3b.emailsrvr.com (smtp100.iad3b.emailsrvr.com [146.20.161.100])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890E606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C890E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=IaZUq94l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1793979106;
	bh=L1YynxPR3WQRJPgwCqgruH3INW4Lanm8Rr5X+ZDQYzo=;
	h=From:To:Subject:Date:From;
	b=IaZUq94lPDUVBITppLGPd89whD5YapW1hZXFAMBig3LbkDN7+FQ2i7EGncUbj8nxh
	 1qg3T7uiEU9nE2SZhgoXiPg6yddqDLEE2/7aNIQ4EfGRdkntcgbzbYBDHG1VMIWV5J
	 tjDKCccqD2ox4Q0oUNj0MKPYPSPuAHaXBYs/nDY0=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp21.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 5307E2035D;
	Fri,  6 Nov 2026 10:31:45 -0500 (EST)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Eulgyu Kim <eulgyukim@snu.ac.kr>,
	Jaeyoung Chung <jjy600901@snu.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] comedi: Fix race condition when updating struct comedi_file
Date: Fri,  6 Nov 2026 15:31:26 +0000
Message-ID: <20261106153126.103826-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.53.0
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
X-Classification-ID: 6e8e0f76-6120-4c86-acfa-749b6bec59cd-1-1

struct comedi_file holds per file object settings for comedi devices to
allow user space to change the "read" and "write" comedi subdevices
locally to the open file description, using the COMEDI_SETWSUBD and
COMEDI_SETWSUBD ioctl commands.  If there are any subsequent changes to
the status of the attachment of the comedi device to a low-level comedi
driver, the references to the "read" and "write" subdevices in the
struct comedi_file become stale and need to be reset to the current
defaults for the comedi device.  That is done by comedi_file_reset()
when comedi_file_check() (called by comedi_file_read_subdevice() and
comedi_file_write_subdevice()) has determined that they have become
stale.

The tasks calling these functions will have either locked the main mutex
for the comedi device, or will have read-locked the "attach_lock" for
the comedi device.  In the latter case, there may be several tasks
executing the functions at the same time.  Unfortunately, there is a
race condition in the access to the struct comedi_file members that can
leave it having stale pointers to "read" and/or "write" subdevices.
Reorder the accesses to the struct comedi_file members and add SMP
memory barriers to fix the problem.

Fixes: 20f083c07565 ("staging: comedi: prepare support for per-file read and write subdevices")
Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
Closes: https://lore.kernel.org/lkml/20260819174614.3857878-1-jjy600901@snu.ac.kr
Cc: stable@vger.kernel.org
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/comedi_fops.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index 68eddf853465b..069656bab7e2c 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -66,7 +66,7 @@ struct comedi_file {
 	struct comedi_subdevice *read_subdev;
 	struct comedi_subdevice *write_subdev;
 	unsigned int last_detach_count;
-	unsigned int last_attached:1;
+	unsigned char last_attached;
 };
 
 #define COMEDI_NUM_MINORS 0x100
@@ -293,10 +293,17 @@ static void comedi_file_reset(struct file *file)
 		if (!s || s->subdev_flags & SDF_CMD_WRITE)
 			write_s = s;
 	}
-	cfp->last_attached = dev->attached;
-	cfp->last_detach_count = dev->detach_count;
 	WRITE_ONCE(cfp->read_subdev, read_s);
 	WRITE_ONCE(cfp->write_subdev, write_s);
+	/*
+	 * All tasks that call this function simultaneously will store the same
+	 * values in the cfp members.  The last_attached and last_detach_count
+	 * members will be checked for not being stale before assuming the
+	 * read_subdev and write_subdev members are valid.
+	 */
+	smp_wmb();	/* matched with smp_rmb() in comedi_file_check() */
+	WRITE_ONCE(cfp->last_attached, dev->attached);
+	WRITE_ONCE(cfp->last_detach_count, dev->detach_count);
 }
 
 static void comedi_file_check(struct file *file)
@@ -304,9 +311,11 @@ static void comedi_file_check(struct file *file)
 	struct comedi_file *cfp = file->private_data;
 	struct comedi_device *dev = cfp->dev;
 
-	if (cfp->last_attached != dev->attached ||
-	    cfp->last_detach_count != dev->detach_count)
+	if (READ_ONCE(cfp->last_attached) != dev->attached ||
+	    READ_ONCE(cfp->last_detach_count) != dev->detach_count)
 		comedi_file_reset(file);
+	/* caller is about to load cfp->read_subdev or cfp->write_subdev */
+	smp_rmb();
 }
 
 static struct comedi_subdevice *comedi_file_read_subdevice(struct file *file)
@@ -2227,6 +2236,8 @@ static int do_setrsubd_ioctl(struct comedi_device *dev, unsigned long arg,
 		return -EBUSY;
 
 	WRITE_ONCE(cfp->read_subdev, s_new);
+	/* comedi_file_read_subdevice() => comedi_file_check() => smp_rmb() */
+	smp_wmb();
 	return 0;
 }
 
@@ -2270,6 +2281,8 @@ static int do_setwsubd_ioctl(struct comedi_device *dev, unsigned long arg,
 		return -EBUSY;
 
 	WRITE_ONCE(cfp->write_subdev, s_new);
+	/* comedi_file_write_subdevice() => comedi_file_check() => smp_rmb() */
+	smp_wmb();
 	return 0;
 }
 
-- 
2.53.0

