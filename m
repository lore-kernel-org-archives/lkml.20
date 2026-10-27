Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117089;
	b=19qv+ZG4TZe/tDRwcBHMfR9FUEekmX5qEICzkdU5mGT8/29oZTeUEZ79rbZ85RCcOxWv
	 htuqQzU8YAxj0IfZyRIpM/0gN4xzsLk/avhjGvEBTRo+Tw8qHn15pU6p+QJQjHbQQrPXX
	 ON7UfXT9FrH6pXATq4jjPXYrM2rUQCNQtlt+J5eTCMg6RxAyCNQ8bEQqJ/9DWRRXZL2dC
	 i2FgXeKR5N6LBRGLC3kQG1ezmKlT0zjilqE4QUHBeRYw5btxmo6S06zX+grKNodkoZph2
	 cZsfXIKxMmLPcRo4fA5xflaxsN44+xUkqJUSDyUoyF7Pv2kfTp2b50YQmfW/Aj3nqzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117089;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zpQT/XbUSxEDtOVrxaL9Ibsj+nYf+cIa2eYS3GPPCuY=;
	b=dR97es2SNql8dNdIRS+FHDfjdVclweztM4m/76B6k34KaXID83UiCSI52ioxO/L5llLY
	 rtYSrdjx6R8cb8ogBN4yiBWHn47m5CCN8L+OK/jWvOfWtfT4NQZtV/im7aGRDkpoF3QiQ
	 FQAjETRI0r+Odoh+EjTDe3KL8/vT6nIm23dfZSzp4kQgWbJSuUGtDQFOo2WMwDgAXXYaQ
	 Kg1c7SW2MN45XgCnkFXEnA99Zsgtkbb6sIFFNNruaObuObeWeFvairA3c08FXpa37JU80
	 q6E4TeSR1veYIbK+Wtc1lqeaCFWlNwnF626RBVBa7doSgr2cl0bVa7M5Wlbo+fPzxMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WS9Lgqa0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D78606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WS9Lgqa0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDC91F01825;
	Tue, 27 Oct 2026 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793117089;
	bh=zpQT/XbUSxEDtOVrxaL9Ibsj+nYf+cIa2eYS3GPPCuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WS9Lgqa0LXoW9e6kLEU99TpXhj/iOfSzurL5nkmyiXTP2pLbY8P0/LHTUb8EsEGwI
	 KiqqZnbsB+DUeongHGfHFnhV3ZRlWnDPfpVrYTD3+CYoEhWi+cpf8zh3EP4yUsbTYz
	 sL5BgM1yYFG2xgg61prbfYdiDz2jlhJntTYHK7l8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:04:35 +0100
Subject: [PATCH 2/9] w1: remove the master's files before taking its locks
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
Message-Id: <20261027-llm-char-misc-w1-v1-2-d2e6bfafb6a4@linuxfoundation.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=GF85OO1oEn7P5MZE2whNWy+v2Y8p7ds9pAh/UhtiHgY=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPTs+YmDtRQnARl9Clw+Ityi+d38ktWOfhMftWff/eL
 c36YQv9OmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiNSkM82wPMm3nPrn/j5ro
 cvbaa58iHVlslRlmMevf3h/KbnUwg+/XyUm6Ibv5jz8tBAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

__w1_remove_master_device() calls w1_destroy_master_attributes() with
both the mutex of the master and list_mutex held.  Removing the files
waits for the callbacks which are running, and nearly all of them take
one of these two locks:

  __w1_remove_master_device()           read() of .../w1_master_slaves
    mutex_lock(&dev->mutex)               kernfs active reference
    mutex_lock(&dev->list_mutex)          w1_master_attribute_show_slaves()
    w1_destroy_master_attributes()          mutex_lock(&md->list_mutex)
      sysfs_remove_group()                    waits
        waits for the reference

The files are readable for everybody, and a bus master goes away when, for
instance, a DS2490 USB adapter is unplugged.

Remove the files first, before the locks are taken.  That has to be done
before the slaves are detached and not afterwards: as long as the files
exist, a write to w1_master_add could attach a new slave behind the back
of this function, which would then wait for the reference count of the
master for ever.  And it is done before the thread is stopped, because a
write to w1_master_search wakes the thread up.

Fixes: c30c9b15187e ("W1: fix deadlocks and remove w1_control_thread")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/w1/w1_int.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/w1/w1_int.c b/drivers/w1/w1_int.c
index 19a0ea28e9f3..3fcc9ee56727 100644
--- a/drivers/w1/w1_int.c
+++ b/drivers/w1/w1_int.c
@@ -176,6 +176,13 @@ void __w1_remove_master_device(struct w1_master *dev)
 	mutex_unlock(&w1_mlock);
 
 	set_bit(W1_ABORT_SEARCH, &dev->flags);
+
+	/*
+	 * This waits for the callbacks, which take the locks below. One of
+	 * them wakes the thread up.
+	 */
+	w1_destroy_master_attributes(dev);
+
 	kthread_stop(dev->thread);
 
 	mutex_lock(&dev->mutex);
@@ -185,7 +192,6 @@ void __w1_remove_master_device(struct w1_master *dev)
 		w1_slave_detach(sl);
 		mutex_lock(&dev->list_mutex);
 	}
-	w1_destroy_master_attributes(dev);
 	mutex_unlock(&dev->list_mutex);
 	mutex_unlock(&dev->mutex);
 	atomic_dec(&dev->refcnt);

-- 
2.56.0

