Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=146.20.161.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727392;
	b=SV5IEdMHS/v8f+iFAETKiSWML72+76mZStaAhaNA2IVTLyZJcDLKCVMZ4i0amnAg+rUY
	 LGQ0T/UeFJMhXOPqG9ayRVY+BKXk8lucna1cYlEjkL4d6RBGVrcDufjtFzFxJs3444v9L
	 qdjbJCIiL17noVZvdo57+OuInRx3WscxdzZ2lrIPKrg5gAjRasSHOypUs217PRnJzWk1o
	 VsA10bYThc/k91pT7qaOJUq4RAb/MxXs5luRj/OogacBHSFOKv+PbXFPYQtTRcL4DrlRx
	 elL9OSdvmckyZMvv7qbavf9Ec4acqVBgzsgWCPEt38DC+xK/o0nBhHwEPgUsHXKaoOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727392;
	h=DMARC-Filter:DKIM-Signature:X-Auth-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Classification-ID;
	bh=mlwVKzQaz90cP2VvYbc9QKywyDPuFpi3+lO6nVGa5Ug=;
	b=c9w2d0UNQK2vuguywZBH0ZBSrxXKQSzqxqch8LNoGrvvDo7vQJJgZJ72sFBjMlp7Lb0+
	 iv+vYjAzGwwTAinGRVBvEN8rF7mKJMiXMNgMAETrOj4sgQIBif4K/S6V0aMp/szcNK5Tb
	 MmHhtUnR/02ozkj7o+swoE9swAq6f0UifBtRSqpJ8895DczjHxlP3U7WE4TRkC1WGvnUr
	 0S0yG2fP4HYTjDC18Px+wxxYaULZ7uRWwKZoMB9VAfBQZZlEfWaBo9/LGtWrEQAlIGHYL
	 Jx7mFGBSn6GhvkiFKyqT+INLrldOGK/6272Bq0eOQahq0fvdKwwnUrE4vE8a7KI4OCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mev.co.uk;
	spf=pass smtp.mailfrom=mev.co.uk;
	dkim=pass header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=pr4iv9aa;
	arc=none smtp.remote-ip=146.20.161.82
Received: from smtp82.iad3b.emailsrvr.com (smtp82.iad3b.emailsrvr.com [146.20.161.82])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FCD606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FCD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=pr4iv9aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1793727385;
	bh=YP4gSfMUV4rgJVshnWyKvF49f9AjiSmen+6i99ocz7U=;
	h=From:To:Subject:Date:From;
	b=pr4iv9aaasc4oFc3s7eeX1PQLXGBJbpggmI0PJkfYApO+3yzCJSP/6uLlp0vHkYuk
	 KopDKNZjIukD6HsJq4Dq5m9lez7VsYMo7d8r8EW1rE1XfgkCoViEgdMOyVcfyqlKU5
	 iBeSiknB2Fq8DplinyrKS/joV7LHKfrZrsG8EyRg=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp3.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 9CEBA403D4;
	Tue,  3 Nov 2026 12:36:24 -0500 (EST)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] comedi: comedi_bond: Fix leak of opened device references
Date: Tue,  3 Nov 2026 17:36:10 +0000
Message-ID: <20261103173610.89687-1-abbotti@mev.co.uk>
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
X-Classification-ID: 09818d2c-3d59-417d-b5b2-d1f13afcd2d5-1-1

bonding_attach() calls do_dev_config() to open other comedi devices
specified by the user and tries to make use of them as part of the
'bonding' device.  If it successfully opens the other device but cannot
use it (either because it does not any subdevices of a type the
'bonding' device can use, or because of some error that occurs while
dealing with its subdevices) then it is left in the open state and the
fact that it is open does not get recorded by the 'bonding' device, so
the reference to the opened device gets lost.  Fix it by closing the
opened device if it could not be bound to the 'bonding' device.

To match previous behavior, if the opened device is unsuitable then
ignore it (after closing it).  The opened devices recorded by the
'bonding' device will eventually get closed by bonding_detach() even if
bonding_attach() returns an error.

Fixes: 3cf840f65ad5 ("Staging: comedi: add comedi_bond driver")
Reported-by: Wentao Liang <vulab@iscas.ac.cn>
Link: https://lore.kernel.org/lkml/20261103063301.1025860-1-vulab@iscas.ac.cn
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/drivers/comedi_bond.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/comedi/drivers/comedi_bond.c b/drivers/comedi/drivers/comedi_bond.c
index a10cfbd04c728..3764ece90f826 100644
--- a/drivers/comedi/drivers/comedi_bond.c
+++ b/drivers/comedi/drivers/comedi_bond.c
@@ -184,7 +184,9 @@ static int do_dev_config(struct comedi_device *dev, struct comedi_devconfig *it)
 		char file[sizeof("/dev/comediXXXXXX")];
 		int minor = it->options[i];
 		struct comedi_device *d;
-		int sdev = -1, nchans;
+		int sdev = -1;
+		int nchans;
+		int nope = 1;
 		struct bonded_device *bdev;
 		struct bonded_device **devs;
 
@@ -223,11 +225,14 @@ static int do_dev_config(struct comedi_device *dev, struct comedi_devconfig *it)
 				dev_err(dev->class_dev,
 					"comedi_get_n_channels() returned %d on minor %u subdev %d!\n",
 					nchans, minor, sdev);
-				return -EINVAL;
+				nope = -EINVAL;
+				break;
 			}
 			bdev = kmalloc_obj(*bdev);
-			if (!bdev)
-				return -ENOMEM;
+			if (!bdev) {
+				nope = -ENOMEM;
+				break;
+			}
 
 			bdev->dev = d;
 			bdev->minor = minor;
@@ -248,14 +253,23 @@ static int do_dev_config(struct comedi_device *dev, struct comedi_devconfig *it)
 				dev_err(dev->class_dev,
 					"Could not allocate memory. Out of memory?\n");
 				kfree(bdev);
-				return -ENOMEM;
+				nope = -ENOMEM;
+				break;
 			}
 			devpriv->devs = devs;
 			devpriv->devs[devpriv->ndevs++] = bdev;
+			nope = 0;	/* keeps the device open */
 
 			/* Append dev:subdev to devpriv->name */
 			seq_buf_printf(&s, "%u:%u ", bdev->minor, bdev->subdev);
 		}
+
+		if (nope) {
+			/* Opened device cannot be used, so close it. */
+			comedi_close_from(d, dev->minor);
+			if (nope < 0)
+				return nope;
+		}
 	}
 
 	if (!devpriv->nchans) {
-- 
2.53.0

