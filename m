Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015404E1C88;
	Wed, 14 Oct 2026 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979439; cv=none; b=U/3T38gYTOUXfdJMlSf0iUCxR0eMoGrd3N8qLupfqduC9nhFwOCSHpvRCnHogCUO6hkT6mM7v8I8QAVEDkKbFWMtW5eeSbqcD8+gvJw5lCH9+FSMtNNDSWGrMh5CZw9x5Oct6H+EDIos/moBYsg7PjtXBFafkIHsBjtY8ku4LIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979439; c=relaxed/simple;
	bh=V3MsK3mZwCjscrDxT54CJFRs7U+n0lNx9ZwcQxSKtbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kyMeACrHNFSVMHWUJV8v9v+3ThbS+y0rxgNKzMOkFUlrKCxScHO0pTF/BQEgT+/5Ls7ZFMbcBCTeWvjV7w6ZX3q9Q+t1HckL37Mbi4ckU2USGG6qXBKTxtJ+gwlU93aoicur9kzqEhws8p7AC3sN1oOFS3LLiSnXlFaCIHOh3ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USjF7rVO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USjF7rVO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30745C2BCC7;
	Wed, 14 Oct 2026 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791979438;
	bh=V3MsK3mZwCjscrDxT54CJFRs7U+n0lNx9ZwcQxSKtbg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=USjF7rVOv//NORVOa6FZbzNzYh7raDbXWw7kE9xtwdd0S2v+knAAN8P4JS+1uRrdv
	 4Z1Tkzt8UdkmrAnJlvfa38W3y/bU7qjmMlufhGl5G/1GpX6pc80kYjYWcM7G9+PTCX
	 OgrrJfKy9H38PB8RG9LN+1VjA+LcIzviw03Az2XgIv2DOBMN3FKrDvrUrO7uAegpVW
	 myjNIrRzBO4Ap10k5jKUpssjD+nB8UBItVCLVb0RNXo0voWlKdrWklFu+CbCywCpii
	 23PITYHNuPN3IjsC6ujHiIsDCBITsyHkVzoHgCHIXS+CRShp71ENCa5qpOPro1hMBG
	 o9PmNOEJNeZvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D457CC6B1A;
	Wed, 14 Oct 2026 12:03:58 +0000 (UTC)
From: Nicholas Velten via B4 Relay <devnull+nicholasfvelten.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 09:03:57 -0300
Subject: [PATCH] usb: gadget: f_phonet: don't free the net_device on failed
 registration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-fix-phonet-free-on-failure-v1-1-3c93c48e7527@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKxvz2oC/yXMQQqDMBBG4avIrDtgombRq5QuNPlTp5REJloK4
 t1N2+UHj7dTgQoKXZudFG8pklOFuTTk5zE9wBKqybbWmdb0HOXDy5wTVo4KcE4cR3ltCrYuDN3
 QexfcRHWwKGr9m9/uf5dtesKv3yMdxwlJZdLEfgAAAA==
X-Change-ID: 20261014-fix-phonet-free-on-failure-26d5354c6d6b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>, 
 syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com, 
 Nicholas Velten <nicholasfvelten@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791979437; l=4573;
 i=nicholasfvelten@gmail.com; s=20261014; h=from:subject:message-id;
 bh=XnUSJ2jOw7UNqCVAhMhTTH26vH3SvOgdGN6OPSHTtZw=;
 b=ssJSiLyu5Z086YYPOEXPh7TX4zzrvdYy6d266nubLXlUZ7z1js+HlT9HAUjGVutFQ0EmpSeoB
 UBU9gF5m5WIAmgEXczb+YVIx9vDCgvtTjspJqLqP538K/G9YpZJlWOo
X-Developer-Key: i=nicholasfvelten@gmail.com; a=ed25519;
 pk=WVTZgm6yXQ+XrhULAObg4lwcHPhhxAXrAY+YY6svXzg=
X-Endpoint-Received: by B4 Relay for nicholasfvelten@gmail.com/20261014
 with auth_id=1173
X-Original-From: Nicholas Velten <nicholasfvelten@gmail.com>
Reply-To: nicholasfvelten@gmail.com

From: Nicholas Velten <nicholasfvelten@gmail.com>

gphonet_register_netdev() frees the net_device when register_netdev()
fails. That made sense when the device was registered once at module
load, but since the conversion to the function interface the device is
allocated in phonet_alloc_inst(), stored in phonet_opts->net and
registered from pn_bind(), which only sets phonet_opts->bound on
success. After a failed registration opts->net therefore points to
freed memory, and the next bind writes to it in gphonet_set_gadget():

  BUG: KASAN: slab-use-after-free in pn_bind+0x49a/0x500
  Write of size 8 at addr ffff888003e785d8 by task gadget_rereg/86
  Call Trace:
   pn_bind
   usb_add_function
   configfs_composite_bind
   ...
  Allocated by task 175:
   alloc_netdev_mqs
   phonet_alloc_inst
   ...
  Freed by task 86:
   kfree
   device_release
   kobject_put
   gphonet_register_netdev
   pn_bind
   ...

This is the "slab-use-after-free Write in pn_bind" that syzbot reports:
its free stack also goes through gphonet_register_netdev() from
pn_bind(), so the object is freed by the failed bind itself rather than
by a racing phonet_free_inst().

Stop freeing the device there; it belongs to the function instance and
phonet_free_inst() already frees it when it was never registered.
Dropping the free alone would make the retry hit the BUG_ON() in
register_netdevice(), because a registration that fails after
netdev_register_kobject() leaves the device NETREG_UNREGISTERED and it
cannot be registered again, so also refuse to register a device that is
not NETREG_UNINITIALIZED, as gether_register_netdev() does for the
Ethernet functions.

Reproduced with fail-nth fault injection on the allocations of the
write() to the gadget's UDC attribute, binding again without injection
after each failed bind, with a fresh phonet function instance per
iteration: without this change KASAN reports the use-after-free above at
the 15th injected allocation; with it, 300 iterations complete with no
KASAN report, and removing the function instance afterwards frees the
device without errors.

Fixes: fcbdf12ebef7 ("usb: gadget: f_phonet: convert to new function interface with backward compatibility")
Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Nicholas Velten <nicholasfvelten@gmail.com>
---
This is the f_phonet counterpart of my u_ether fix for the same retry
pattern:
https://lore.kernel.org/all/20261014-fix-gadget-netdev-reregister-v1-1-0fb91999da06@gmail.com/
Both patches are independent and apply on their own.

Nguyen, Cc'ing you because your "usb: gadget: f_phonet: fix
use-after-free in pn_bind" v3 targets the same syzbot report. The lock it
adds covers a pn_bind() vs phonet_free_inst() race, but the free stack in
the syzbot report (and in my reproduction) is in pn_bind() itself, via
gphonet_register_netdev(), so I don't think it addresses this
use-after-free. The two changes touch different functions and do not
conflict.

The reproducer is a small fail-nth program; I can post it if useful.
Not tested on architectures other than x86_64.
---
 drivers/usb/gadget/function/f_phonet.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index b1ee9a7c2..43b10ce36 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -722,13 +722,18 @@ void gphonet_set_gadget(struct net_device *net, struct usb_gadget *g)
 
 int gphonet_register_netdev(struct net_device *net)
 {
-	int status;
+	/*
+	 * A register_netdev() that failed after netdev_register_kobject()
+	 * leaves the device NETREG_UNREGISTERED, and it can never be
+	 * registered again. pn_bind() retries on every bind until the
+	 * device is registered, so refuse instead of hitting the BUG_ON()
+	 * in register_netdevice(). The net_device is owned by the function
+	 * instance and freed by phonet_free_inst().
+	 */
+	if (net->reg_state != NETREG_UNINITIALIZED)
+		return -EINVAL;
 
-	status = register_netdev(net);
-	if (status)
-		free_netdev(net);
-
-	return status;
+	return register_netdev(net);
 }
 
 void gphonet_cleanup(struct net_device *dev)

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261014-fix-phonet-free-on-failure-26d5354c6d6b

Best regards,
--  
Nicholas Velten <nicholasfvelten@gmail.com>


