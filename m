Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117106;
	b=FHAU9OwNrs/W2wrIJISXqw9q8jN3aV1TXCmWh1JJ8cEf88DoPekXv8nlLlOABtuIPFGA
	 i8UzoJLUfL5JcPy9ZMGtYRON4LVJ0cEHVCBwy8awtsP8ygEny1t502OR38tdz8dF3p3Fv
	 g28HFKt7T7r8WRxLkipTXbAXpzJJ5jEx/PGF5+pLOcmJ6tv1uMmDGyGVwLtQnyVMFMcPA
	 ywnHybJkoNJEcf8074xUF+XeQ27ZCaScLr+iuH94/9TjbmKE7cp6NbSRQeHDku1bU+ikR
	 Qd5rFvfLYbvvgCiBBO3E7eIL6JyuQ/yJ9cWFVvSAhegoBaE6ixunOUK6+d8lrcbqSTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117106;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hOWFEi5+RZ/fuwWtlNOg8zbWImcoivTmK8uutxaIcpI=;
	b=sWYJbqDUmruvqdrS+d2sOoREDA28+mByD+uKerC0zZUwNWCh3+RQp2ja6pGfPRz35yiI
	 MtWAXAgtJ7FZ1LgV5aR4M6iMJykS2i8REg2D4PNi9caRTzRcvWOJTMFZjqC3OUHjNShjX
	 YeptfR2iqU68bJYA9tktdlNng4cGojRhU+dFUcLfScJ9HuA10PEdqoK1VQiM4TWWl3spN
	 mX8h99wG26+SiAeSr3u4NVQJw55wHvRcHtZXpplgmCiIYYzq9vXyq3zzLVWXgiph4jFYi
	 Mkf1BjqoNm6/jUsw0a25MXAIyOGfCIq8vxlcLgzwyx0KPqCFMXFV38Tk/ykSMCzEaDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ENoIZ171;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E160A3827
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ENoIZ171
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA921F01300;
	Tue, 27 Oct 2026 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793117106;
	bh=hOWFEi5+RZ/fuwWtlNOg8zbWImcoivTmK8uutxaIcpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ENoIZ171/FfBjbAz02wjVZv/IJ1ZvKNo3YOSlPHCEHd82LxCwnAWXEjIe5Nl5UIuG
	 h8UfQWvvnR5owYvuJywiFM8xcG1hCbt9qIEn1uaKgfxKhSBWsMMfJK6qBuxV0Wqz1j
	 E1uV5tyGrG22mlwTGaRMa7eA/nPUsF6/eg+XnHtQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:04:41 +0100
Subject: [PATCH 8/9] w1: w1_therm: lock the list of slaves for the bulk
 read
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-char-misc-w1-v1-8-d2e6bfafb6a4@linuxfoundation.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=3951;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=+/oBlo55X+AUWqotGYHYCruqRktMsgf0CBMkPB3/F3k=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPTs/UM5oiExrlKfZrlZX4nBt7Tgpnm3yZ0lJ1K1L9a
 e7sw0rcHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRkGMM8wwaHTq3zA71jZq9
 wd9FMnl3hOn/zQzzzEVbv1Y+FFmn67FGPCZmadW/Y58lAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

The callbacks of the file therm_bulk_read walk the list of the slaves of
the master, trigger_bulk_read() three times and therm_bulk_read_show()
once, without the list_mutex which protects it.  In the meantime the
thread of the master may find out that a sensor has gone:

  write to therm_bulk_read              w1_process()
  trigger_bulk_read()                     w1_slave_detach()
    list_for_each_entry(sl, ...)            w1_unref_slave()
      bulk_read_slave(sl)                     list_del()
                                              w1_therm_remove_slave()
                                                kfree(sl->family_data)
                                              kfree(sl)
      SLAVE_CONVERT_TRIGGERED(sl) = 1

The walk reads, and writes to, memory which has been freed, and follows
the poisoned list pointers.

Take list_mutex around each of the four walks.  No pointer to a slave is
kept from one walk to the next.

This could not be done as long as w1_unref_slave() held the mutex while
it waited, in w1_therm_remove_slave(), for these very callbacks and for
the readers of the sensor, who need the bus_mutex which
trigger_bulk_read() holds around its second walk.  Now nothing is waited
for with list_mutex held, and none of the other mutexes of the subsystem
is taken under it, so it can be nested inside bus_mutex.

Fixes: 57c76221d5af ("w1_therm: adding bulk read support to trigger multiple conversion on bus")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/w1/slaves/w1_therm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index d96b224e2215..6db0b534b338 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -1495,6 +1495,7 @@ static int trigger_bulk_read(struct w1_master *dev_master)
 	 * and compute duration of conversion for these devices
 	 * so we can apply a strong pullup if required
 	 */
+	mutex_lock(&dev_master->list_mutex);
 	list_for_each_entry(sl, &dev_master->slist, w1_slave_entry) {
 		if (!sl->family_data)
 			goto error;
@@ -1508,6 +1509,7 @@ static int trigger_bulk_read(struct w1_master *dev_master)
 					w1_strong_pullup));
 		}
 	}
+	mutex_unlock(&dev_master->list_mutex);
 
 	/*
 	 * t_conv is the max conversion time required on the bus
@@ -1534,11 +1536,13 @@ static int trigger_bulk_read(struct w1_master *dev_master)
 			w1_write_8(dev_master, W1_CONVERT_TEMP);
 
 			/* set a flag to instruct that converT pending */
+			mutex_lock(&dev_master->list_mutex);
 			list_for_each_entry(sl,
 				&dev_master->slist, w1_slave_entry) {
 				if (bulk_read_support(sl))
 					SLAVE_CONVERT_TRIGGERED(sl) = -1;
 			}
+			mutex_unlock(&dev_master->list_mutex);
 
 			if (strong_pullup) { /* some device need pullup */
 				sleep_rem = msleep_interruptible(t_conv);
@@ -1564,10 +1568,12 @@ static int trigger_bulk_read(struct w1_master *dev_master)
 	mutex_unlock(&dev_master->bus_mutex);
 set_flag:
 	/* set a flag to register convsersion is done */
+	mutex_lock(&dev_master->list_mutex);
 	list_for_each_entry(sl, &dev_master->slist, w1_slave_entry) {
 		if (bulk_read_support(sl))
 			SLAVE_CONVERT_TRIGGERED(sl) = 1;
 	}
+	mutex_unlock(&dev_master->list_mutex);
 error:
 	return ret;
 }
@@ -1932,6 +1938,7 @@ static ssize_t therm_bulk_read_show(struct device *device,
 	struct w1_slave *sl = NULL;
 	int ret = 0;
 
+	mutex_lock(&dev_master->list_mutex);
 	list_for_each_entry(sl, &dev_master->slist, w1_slave_entry) {
 		if (sl->family_data) {
 			if (bulk_read_support(sl)) {
@@ -1946,6 +1953,7 @@ static ssize_t therm_bulk_read_show(struct device *device,
 		}
 	}
 show_result:
+	mutex_unlock(&dev_master->list_mutex);
 	return sprintf(buf, "%d\n", ret);
 }
 

-- 
2.56.0

