Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117104;
	b=JW2UhTrJYCvZ/8Kzl0Y2uMbpb0Zj2gGyv2Yv9faR1yJKW9+3NnYSAWiEpBsQn4KuR0s7
	 202lAKmjJ7AfKp7JK33lN7Ka+kglFlmfJoZy+FDMqBqMxKXCXFEZbXiwWOVszli/Bofwh
	 GKh1ICqqlgbJRbR1Y/dXi4lDp/EbotDJ0YafnD8dOqJGmcy3UbOwV3Qk2uwg2jSFkBtcy
	 UBMQTV/0YeF0dyF/O38JHu/wRULu4Yyd7vNHxohkXnbn36P07SBa3GGHjLa8duH0WOKY1
	 U/tH6bsdBNF+BZTr2Tlo3j5htzfzXsDHjtEnVqnB21xIdPgvv+Wn8uccQ8LEDmPu/TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117104;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9mlQwRN7gsr0m5VGgfXJoYrjybDmUh9NiixmrYi/g/Y=;
	b=YFC5IavfgZe5WyjuhtaffdAFS2AqhlIvskyheA2aI4SRnKTM2PToReoAyCRPmxdlkt3y
	 CM9Xt2vnrlWuGPkq/QAJmjoxi2JOujXYEHw2FhMTv/wzTyEOWphF/5bvsceReKuQZhhZa
	 qkN+mPmF42vzFnrdgEDVNMY5fbKa5d0p1LAxixi/0ZEftLFvLr6FtZ6aQsYU8NkCS62WR
	 aJhOpVEamU3e2qxkzUULgRDkQUU4ZaPs4YTydMlHNheDORqf1D95mwdly8PierKRJUisx
	 bMsqwxbHXax1diXXalj7N9eWJrgivI3lzp4Awy2JJUBQBHZwIzJQwg1kHDDYjxX+Ipw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=D+U8r8B1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C6360A3814
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=D+U8r8B1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C611F01305;
	Tue, 27 Oct 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793117103;
	bh=9mlQwRN7gsr0m5VGgfXJoYrjybDmUh9NiixmrYi/g/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D+U8r8B1dRFoKzW+pS0umsUkfleVeRYWnP+gm5SuuSoGFK+NdRZFGKX2uMclMrt61
	 xWMaEkVsjiZJlporhcmBYtl2Xus4/c84+9DwICrAeJD/M8+k5OR218bMQtrEetdXRc
	 +rrayrx1cEtg1OrCyAjh7Sc30RZJQKJfmhnGGq9A=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:04:40 +0100
Subject: [PATCH 7/9] w1: don't hold list_mutex while a slave is torn down
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
Message-Id: <20261027-llm-char-misc-w1-v1-7-d2e6bfafb6a4@linuxfoundation.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=dV5OKHKU6qLZRVnP4xZQ/jLIoepH+W1p2g+w4Q+EhzU=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPTs88fTdGc43rm87mU4v5VvofL1DeGSH17ZL2Y9vPs
 /5umrx3Y0csC4MgE4OsmCLLl208R/dXHFL0MrQ9DTOHlQlkCAMXpwBMpDeKYb5bDsvDL3VKRRdr
 1jAcXb3saP6KgJMMCzo7FzH2bYk9K+N6Ybs97+W7G8MlngEA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

When the last reference to a slave is dropped, w1_unref_slave() holds
list_mutex of the master until the slave has been freed.  In between it
calls the ->remove_slave() callback of the family driver and
device_unregister().  Both wait for others: for the sysfs callbacks
which are running, and in the case of w1_therm also for the file
therm_bulk_read of the master and for everybody who is talking to the
sensor.  None of those can therefore take list_mutex, although the
callbacks of therm_bulk_read walk the list which it protects.

The mutex is only needed to make the decrement of the reference count and
the removal from the list one step for w1_search_slave() and
w1_slave_search_device(), which look the slave up in the list and, in the
first case, take a reference.  Once the slave is off the list, nobody can
find it any more.  Drop the mutex at that point.

The callers which hold the mutex of the master, which serialises
attaching and detaching, are not affected.  The one which does not is
w1_process_cb(), when it drops the last reference to a slave which has
been detached while a netlink command for it was queued.  Somebody who
attaches a slave with the same ID through sysfs or netlink at that very
moment used to wait until the old device was gone.  Now the registration
of the new device may fail because the name is still in use.

This is a preparation for "w1: w1_therm: lock the list of slaves for the
bulk read".

Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/w1/w1.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index fe7b73d2a553..4eb785c643c9 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -781,16 +781,24 @@ int w1_unref_slave(struct w1_slave *sl)
 {
 	struct w1_master *dev = sl->master;
 	int refcnt;
+
+	/*
+	 * Once it is off the list nobody can find the slave and take a new
+	 * reference.  The lock must not be held any longer than that: the rest
+	 * waits for sysfs callbacks and for users of the family data.
+	 */
 	mutex_lock(&dev->list_mutex);
 	refcnt = atomic_sub_return(1, &sl->refcnt);
+	if (refcnt == 0)
+		list_del(&sl->w1_slave_entry);
+	mutex_unlock(&dev->list_mutex);
+
 	if (refcnt == 0) {
 		struct w1_netlink_msg msg;
 
 		dev_dbg(&sl->dev, "%s: detaching %s [%p].\n", __func__,
 			sl->name, sl);
 
-		list_del(&sl->w1_slave_entry);
-
 		memset(&msg, 0, sizeof(msg));
 		memcpy(msg.id.id, &sl->reg_num, sizeof(msg.id));
 		msg.type = W1_SLAVE_REMOVE;
@@ -804,7 +812,6 @@ int w1_unref_slave(struct w1_slave *sl)
 		kfree(sl);
 	}
 	atomic_dec(&dev->refcnt);
-	mutex_unlock(&dev->list_mutex);
 	return refcnt;
 }
 

-- 
2.56.0

