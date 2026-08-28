Received: from sg-2-5.ptr.blmpb.com (sg-2-5.ptr.blmpb.com [71.18.227.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48D13DDDC0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904588; cv=none; b=Y/HNus1pkgIvsYrg7HST7IsiTqop4QrYufzxfhG6idPcqVwsPDodjCHY4sU7yIloxVnNHw+Z1XnAb/87X97njfSxOETb66YJTunCP4jAJZn1jBoNzLNtrQp4vLnFRO9G17V0J7Fnyj/N05VqEDhmloh4m/KUkjt9Wtrj4FCGTes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904588; c=relaxed/simple;
	bh=sYZOuS5bdKiPDKa8vVkK+d9Ee9FAX3CLv0HydD51KCA=;
	h=Date:Message-Id:Mime-Version:Content-Type:From:Subject:Cc:To; b=ZoiD3Qg1VbnuHhvKUEqGMJYBfJinXCwje/VK1mzjRKKwkWdVcxw0o5d6xIxkvO+8Xl9ibhdX41ksWBXHod+wK2vHVZYDgIX80izSfNd4RfzY15STUi9DnS/k6Vqk1sMnb43MiryB0vkkAH3JkZNSnp+682baN3BMEL0UF2r3MZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=TIhU1c0t; arc=none smtp.client-ip=71.18.227.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="TIhU1c0t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787904573; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=HR83UriVsIUTznJzO8x3qhujDb3DFBhw9+CN77nXxOE=;
 b=TIhU1c0t7ikw1kXIfAiO7jZ2Kfp60Kc9mmD+8TCocWWJnfi3RiLqouEeYauGvHoM/UQHgP
 puIPPLYCHR+ieELSa32qF8W4V3NzzN696PTsPlGxVbQfPKVYFz+nhMTab8s+pWtL7i6vyg
 49kNqix+fr4GDgcTaJIfK3WYgEygW4ilS+e9WyFLrjmcHmbKg3JrsWnJBBREwm2nOWbGnv
 CW6QDDyY/hVN6LVkjrjJKSw842TpKyweZ4IG//+Zy1ZOR8div5prr4BwY4nOCQMf6Rzgxi
 cfcOmxbbFC07EF4ExUM3kfM6IKEc44KWFuNoX7TiR06gg9wNEZLsSktXRK4mrw==
Date: Fri, 28 Aug 2026 16:09:27 +0800
Message-Id: <20260828-cmt-speech-uaf-v1-1-1fed740dd225@cherr.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset=UTF-8
X-B4-Tracking: v=1; b=H4sIADZCkWoC/yXMQQqDQAxG4atI1g3YAU3pVUoXNv5TU6iViUpBv LujLr/Fews5ksHpXiyUMJvbr8+4XgrSrunfYGuzKZShLm9BWL8j+wBox1MTuY1BpRJRCChHQ0K 0/zF8PE/79PpAx/1C67oBbcvcrnIAAAA=
From: "Shengzhuo Wei" <me@cherr.cc>
Subject: [PATCH] HSI: cmt_speech: Fix crash on device removal with open file descriptor
X-Change-Id: 20260827-cmt-speech-uaf-df2c7577ce7e
X-Lms-Return-Path: <lba+26a91423b+7a9ed7+vger.kernel.org+me@cherr.cc>
Cc: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Received: from [192.168.9.107] ([111.42.148.195]) by smtp.feishu.cn with ESMTPS; Fri, 28 Aug 2026 16:09:30 +0800
Content-Transfer-Encoding: 7bit
X-Original-From: Shengzhuo Wei <me@cherr.cc>
To: "Sebastian Reichel" <sre@kernel.org>, 
	"Kai Vehmanen" <kai.vehmanen@nokia.com>, 
	"Aaro Koskinen" <aaro.koskinen@iki.fi>, 
	"Joni Lapilainen" <joni.lapilainen@gmail.com>, 
	"Carlos Chinea" <carlos.chinea@nokia.com>

misc_deregister() does not drain file descriptors that are already
open, so after cs_hsi_client_remove() clears and frees
cs_char_data.hi, the ioctl and write paths still dereference it
without any lock or NULL check:

  open("/dev/cmt_speech")                          [userspace]
  rmmod cmt_speech                                 [removal]
  ioctl(fd, CS_GET_STATE, 0)                       [userspace]

Fix it by reading cs_char_data.hi under cs_char_data.lock and
rejecting calls with -ENODEV once the interface is gone;
cs_char_release() now steals the pointer under the lock like
cs_hsi_client_remove() does, so the interface is stopped exactly
once between them.

Fixes: 7f62fe8a5851 ("HSI: cmt_speech: Add cmt-speech driver")
Cc: stable@vger.kernel.org

Assisted-by: GLM:5.3
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
Verified on a KASAN kernel with a software HSI controller: opening the
character device, unbinding the client and issuing the ioctl gives

  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:cs_char_ioctl+0x29e/0x340

and with the patch applied the same sequence returns -ENODEV.
---
 drivers/hsi/clients/cmt_speech.c | 47 ++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/hsi/clients/cmt_speech.c b/drivers/hsi/clients/cmt_speech.c
index 7226677ebde7..4325152a5a62 100644
--- a/drivers/hsi/clients/cmt_speech.c
+++ b/drivers/hsi/clients/cmt_speech.c
@@ -732,6 +732,17 @@ static int cs_hsi_write_on_data(struct cs_hsi_iface *hi, unsigned int slot)
 	return ret;
 }
 
+static struct cs_hsi_iface *cs_char_hsi_get(struct cs_char *csdata)
+{
+	struct cs_hsi_iface *hi;
+
+	spin_lock_bh(&csdata->lock);
+	hi = csdata->hi;
+	spin_unlock_bh(&csdata->lock);
+
+	return hi;
+}
+
 static unsigned int cs_hsi_get_state(struct cs_hsi_iface *hi)
 {
 	return hi->iface_state;
@@ -1180,6 +1191,7 @@ static ssize_t cs_char_write(struct file *file, const char __user *buf,
 	u32 data;
 	int err;
 	ssize_t	retval;
+	struct cs_hsi_iface *hi;
 
 	if (count < sizeof(data))
 		return -EINVAL;
@@ -1189,7 +1201,10 @@ static ssize_t cs_char_write(struct file *file, const char __user *buf,
 	else
 		retval = count;
 
-	err = cs_hsi_command(csdata->hi, data);
+	hi = cs_char_hsi_get(csdata);
+	if (!hi)
+		return -ENODEV;
+	err = cs_hsi_command(hi, data);
 	if (err < 0)
 		retval = err;
 
@@ -1205,8 +1220,11 @@ static long cs_char_ioctl(struct file *file, unsigned int cmd,
 	switch (cmd) {
 	case CS_GET_STATE: {
 		unsigned int state;
+		struct cs_hsi_iface *hi = cs_char_hsi_get(csdata);
 
-		state = cs_hsi_get_state(csdata->hi);
+		if (!hi)
+			return -ENODEV;
+		state = cs_hsi_get_state(hi);
 		if (copy_to_user((void __user *)arg, &state, sizeof(state)))
 			r = -EFAULT;
 
@@ -1214,6 +1232,7 @@ static long cs_char_ioctl(struct file *file, unsigned int cmd,
 	}
 	case CS_SET_WAKELINE: {
 		unsigned int state;
+		struct cs_hsi_iface *hi;
 
 		if (copy_from_user(&state, (void __user *)arg, sizeof(state))) {
 			r = -EFAULT;
@@ -1225,7 +1244,10 @@ static long cs_char_ioctl(struct file *file, unsigned int cmd,
 			break;
 		}
 
-		cs_hsi_set_wakeline(csdata->hi, !!state);
+		hi = cs_char_hsi_get(csdata);
+		if (!hi)
+			return -ENODEV;
+		cs_hsi_set_wakeline(hi, !!state);
 
 		break;
 	}
@@ -1239,12 +1261,17 @@ static long cs_char_ioctl(struct file *file, unsigned int cmd,
 	}
 	case CS_CONFIG_BUFS: {
 		struct cs_buffer_config buf_cfg;
+		struct cs_hsi_iface *hi;
 
 		if (copy_from_user(&buf_cfg, (void __user *)arg,
-							sizeof(buf_cfg)))
+							sizeof(buf_cfg))) {
 			r = -EFAULT;
-		else
-			r = cs_hsi_buf_config(csdata->hi, &buf_cfg);
+			break;
+		}
+		hi = cs_char_hsi_get(csdata);
+		if (!hi)
+			return -ENODEV;
+		r = cs_hsi_buf_config(hi, &buf_cfg);
 
 		break;
 	}
@@ -1334,10 +1361,16 @@ static void cs_free_char_queue(struct list_head *head)
 static int cs_char_release(struct inode *unused, struct file *file)
 {
 	struct cs_char *csdata = file->private_data;
+	struct cs_hsi_iface *hi;
 
-	cs_hsi_stop(csdata->hi);
 	spin_lock_bh(&csdata->lock);
+	hi = csdata->hi;
 	csdata->hi = NULL;
+	spin_unlock_bh(&csdata->lock);
+
+	if (hi)
+		cs_hsi_stop(hi);
+	spin_lock_bh(&csdata->lock);
 	free_page(csdata->mmap_base);
 	cs_free_char_queue(&csdata->chardev_queue);
 	cs_free_char_queue(&csdata->dataind_queue);

---
base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
change-id: 20260827-cmt-speech-uaf-df2c7577ce7e

Best regards,
--  
Shengzhuo Wei <me@cherr.cc>
