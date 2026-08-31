Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787703DDB1F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169190; cv=none; b=H0DahKgSbQv9n+44HY6ZWbl6xDDf3yaS0RfwUjvkoNrEnb+HaKfwbWkDsFbYNORpsEQcgvPgHRRwe6Wq7FylftrA+WMKwYdoxzqxakYfdMANkGtIPF/4EWLRim9Jn8tctrmRIr5FRBpnRAqWhS9EX+pSORiK+JjgQ1BGKYAh4b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169190; c=relaxed/simple;
	bh=byJBOBt/tR2tYDXtPyEeunwPUn6CVenvRXOn8is+8AE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahh6GQ22r/DuSuWaoEBzerw4eShFUu44pEkUB5O9qf1ghOsu9ibTHZSWI8tMJE6xNb/hCHAIE7JgzP6BtYdTyqL3XEZCyyBKKPkFxSHGwO7mh1B9qh694ziCBr2GuCb+ix7cnEb9EAGF22wL4bp2SqgNx6TX4J1TNaLzwi7WNKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=P0jTwe8H; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="P0jTwe8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788169003;
	bh=v9/UAjiuPxVgMyeedaks9B3wmR8pswsO8wt+LHQBfXk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=P0jTwe8HY+MLna8zODxZe7RPRXnNyx03295Drpli0AHK45VECPyGZ+AkCG0cQR/WD
	 JNQqtn5ataB23k8GmgSGLUKT04yZVf/uk4jJI/k+eOZgHhvNOJaK+YbYIyeyjqZmJy
	 5+uoCQih/Zqelz8MoIJagcpylUP2lLPFJCF1qUBw=
X-QQ-mid: zesmtpgz7t1788168983te1bde3d2
X-QQ-Originating-IP: im5pLOGF9MTXPq6UNTUPnnQx+ZPtpYKJcihSEfObd8g=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 17:36:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9484404449190021099
EX-QQ-RecipientCnt: 14
From: raoxu <raoxu@uniontech.com>
To: andrew+netdev@lunn.ch
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kuniyu@google.com,
	maciej.fijalkowski@intel.com,
	raoxu@uniontech.com,
	diego@giagio.com,
	agimenez@sysvalve.es,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] net: usb: ipheth: stop data URBs on ndo_stop
Date: Mon, 31 Aug 2026 17:36:19 +0800
Message-ID: <8DB5FB95051A2E5A+20260831093619.838403-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MCHGquX4Y4ho80gSL9xH8vlNYP0D3gHVcddaNBPDiLi4qhuGwD+je0eY
	4dujT0G1YUEdxs2cZDS926ms+GgYLx6AwhOnP7zTb6a3yNe7q+SurZRVeYDcgulTREJ1CNN
	fzB34bp4k599BdBXnxqdQusU+WEpY1VKuG26DlppJx1P9zkwya3WkQXe5xNaJi/ckM+j21B
	/N2HlO4QV28xhLtqLXlQsNVEGO0K8KdZdX+hEX2gmcdMGhq9YReZlWG7REma/Gz0whLtUAP
	vS9L3mz7mF9SuThnue+1hkfV4J9faxD0P9ksvVn4XSznaIaHZKqqUmFdKeBAqxTetUV5i7t
	faG9nm4LfiXHTmXOS46vEqYbUSfPrCZgjWvgDnJ5l6bKlFmiBM82pRaAiBwdYicW/bGDb4W
	ij9VUiWlj/+y4yhozXcf9YjuRKMLUWXrpMaJ5XQdLSwi53eLgY2HMDu9DzzgIfnhLoLycHY
	fIR2Bn3AbN8AOGZ6wxufQQthzAYJI7ySYB+CNu16k7jdY5VHTJwvcMg1uUps/euXt7kmcE3
	t7VJgNI8xvpyGkgQhGpily9MYC3yCQOeCCmiy9VwH6xZU70H2+OwWzxQ5fjlhqXgDFPJSRe
	boDhof5s9igqRt9OGZDnDVnoJkJyz6Srj6ppJXwVCVfVfXpteL2La+rG68dkdL22JBbsFk6
	RH7CjkVThW5kRo3oUv/32L6Ruc39z+jd6iOOfnz+Ja0g2g/s0+FEnk5nqs+gG8eikKaYHQM
	5/YsZgCFwYMQ6zW/CdHa+sv/kT3DWPdk3lg4daty4qIPiIgiaDbnvdK2smEtahCyfWkNtvE
	FG7A4n8BP6CRmCqJhWctcpX7OqLiKniftgaqt8D9FURU7LQjwIzRpWNjv9McpeOBE3bWMl4
	AKVvKodyO+85gKn6SGwYX0aLdZsVt48M7zLPmNl1yjzFM3cnJy/4Xt+67zHB1aFJkQqAylY
	EMPRfRHCFQ+CHdsYX6rioHtn/VfuAWFaEnFoyCwJI5FM0toiPx8xZlX5RmpIyP4mJyeafF4
	LLpeWlXEWhjj01uGFN80pdqiA7v/BdNu2SxPdZg+V1a5UXijFoRpoFGl+aJqB/c5wSXGNqj
	NUI6XFi3g5hPDY//v94bBB7zykl8Mhz1D92hUeKV52n8uGcrvrQzPk=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

ipheth_open() submits the RX URB and ipheth_tx() can submit the TX URB
while the netdev is running.  A successful RX completion resubmits the
RX URB from ipheth_rcvbulk_callback(), so the receive path remains
active until the URB is explicitly stopped.

ipheth_close() stops the netdev queue and disables the carrier work, but
it leaves any submitted data URBs running.  After an administrative link
down, an already submitted RX URB can therefore complete successfully,
account the received packet and pass it to the networking stack, and
then submit the RX URB again even though the interface has been stopped.

The disconnect path already kills the URBs after unregister_netdev(), so
unplug testing eventually quiesces the data path.  The gap is therefore
specific to an administrative close while the USB device remains
connected.

Kill the data URBs from ndo_stop as well.  Do this after disabling
carrier_work: ipheth_sndbulk_callback() schedules the work on TX URB
errors, while disable_delayed_work_sync() prevents a completion caused by
usb_kill_urb() from re-arming it.  usb_kill_urb() also waits for pending
completion handlers and prevents the RX completion from successfully
resubmitting its URB.

Fixes: a19259c3d589 ("drivers/net/usb: Add new driver ipheth")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/net/usb/ipheth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index 2b490114d232..f127aeab7031 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -505,6 +505,7 @@ static int ipheth_close(struct net_device *net)
 	 * it, so that such a schedule_delayed_work() is a no-op.
 	 */
 	disable_delayed_work_sync(&dev->carrier_work);
+	ipheth_kill_urbs(dev);
 	return 0;
 }
 
-- 
2.50.1

