Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30774358372
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432115; cv=none; b=I73ZWSm+CBsIOVXNdSnd2sMXx1sUpB/OisSv1PUZqB8PkdW32L187vV1MFLO6zCyR4cAvaW+8VyCRf6xGbeSoS/DYcY2culr9FmGWEzpZqXaWnWjxhZwl2i+qZLDYdQDXpAmtAKQhkwwXgQpixF4L4ZLl9jakASD8g3Wt67oryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432115; c=relaxed/simple;
	bh=HWGlhnjAsKdJcawkVeuPvrsKBkaz2dTusqjN5Q+J2tE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JvnHUNkKmNoVzIUWu3tNVbuWHkdTR+gm9v2VYaAL0VrUep61Jpx28PzCrFGDJ3XrM2A67rUxPb3cfQ7EyMF6GL75V59m1GN+LdNmjUlqruYgbRHGc7BCP1iz9ykVyyqYvrcGWySsz1xlcnPd7SimyGciwNbFE9yCeE4iLuQQCuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts9Piag5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts9Piag5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db18e5cb56so21725405ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791432112; x=1792036912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHUntJAA/mwo/FHuh8v4le2k0YfNGeacRBz3GsN1kMw=;
        b=Ts9Piag5xkkTz/RebI0HKYBI93yR5LQqs/UcuKYKQc8WT/UO7YBcryHjFgkEF5vneV
         ZhpGq7We16DJsWq5KNjWoPX6bLD7d2Z/kz7lWLp0kGFqBJ0OBMfhmiNfCUxfdF+BAne5
         apWlaX0bYrYqM2diHjkWe4XPB599bNVzPdTAgLVyIFH3cuxyJve/ctwQJ6sGfMiikwz4
         S3gmxfRw/kWz03aSIkzg35a4ra9zbzfAAnRBGM4xyMPYFdMmGHuYyE4EygOCkFUjuc/F
         qpgnBryJ+g59ZkY744uI5s66wLqOQVzPxvQh5ud7ixi86juljOTAsGEkmmQMEexzfCPC
         YGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432112; x=1792036912;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHUntJAA/mwo/FHuh8v4le2k0YfNGeacRBz3GsN1kMw=;
        b=fw1UZDtyILR2O+Qwy4RzB0oqQnAMRD2T5NHNibFs1gcp1EBga3jR1wmdh2jinZ6444
         B+B14hj61Y5oT/RYqRZfKpFfIvYXBYWQkk3Fdbyz5GU6JvMPB6APkbmsn6dset9OYxom
         d7d6R9x33ImZFyFefvm2qRxIFgdkH8rvgwmoZJt8XNo1SwqXabinrGxzj1580Du5IMQz
         SItOImf8o4PDUipvgNAcmbvlrMFGvMEesETwLfCtQGwF7v7+2l+7zmZnPuqK1pYjRTdS
         FABl5k75OWKTtM7rldsxIS4pYf/Y0Ax+fTKyqJ2gc7otsTlND64s5L7bGTV5xIfr0n2+
         5QLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJAx8ppBwEjhyInuW2LG+IqaDblbcv4ROW0DMBwgHc9Hb/jB60vthoZRgSH9iH34+Y/zfGaRdcMrEVjEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMlRCcC+uQvWnAFEmx4zjtUGP9yzy1zMmTY9WiEnpMfyKxVRuN
	ZHHCLBl5VyWG1/Jhu2htYH4cojOR75wIXt7ALmvcavEW9M3wckVRNz4lSCgq/Dfi
X-Gm-Gg: AYBFou3eNYqUyC+klkprOY2LQC6j7mEo/gJ5plXHdKrlorCD9lyB7p80emp9aNFKHqo
	LwNPjU4SCcQXlWcTLJ7XNRaGV/UgnTmIA+ptG7cDGkGb3PynpN680sFI1EZQo7T0DDxIoAyyjJm
	GX1tGXm0Xsr9ke4ORDySxdRgw3aiAGQ2jWXqnn2o8L03ylwU/hcp5iln0AtHqjigfrqpaCCBQa6
	qIgWS/NsznUJId7zepZ9kZmfv/PnCLVYZbOoDzgpmvqTHWGjm+z56ZeIRCSCKdAbw2E8yfmGDEV
	Q/iDLuB78xet1ecd1n48BmrHL2viLVbTtEUZ7dZZIPZ+nIszXMueqUmKrXYTKkNF66+c1Py9/in
	1UPoEGlEWIV+udLqvS2FvxjZjunWtUeU3h9M4LuTbzipdR4jlySGxTAWYcOmiWwLjmH1bZ4GEXn
	SgGh9dMO6xtzuZO38W3lJ1yBHNYNV6/mI2N3puaVRBle0sMc1YjDr8PvEySCO6EV+Pfg==
X-Received: by 2002:a17:90a:1541:b0:3a8:c0cd:57f8 with SMTP id 98e67ed59e1d1-3a8c0dcd10cmr1695006a91.4.1791432112448;
        Wed, 07 Oct 2026 21:01:52 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1bfbafasm2654738a91.11.2026.10.07.21.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:01:52 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] Bluetooth: hci_debugfs: Pin the module for open dut_mode files
Date: Thu,  8 Oct 2026 12:01:46 +0800
Message-Id: <pm-bluetooth-objects-candidate-0251-v5-7e4e8154d66ac0e60df2@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An open dut_mode file retains dut_mode_fops in the debugfs proxy state.
The table must remain allocated until the final close has finished
accessing it. However, dut_mode_fops has no owner, so fops_get()
succeeds without taking a Bluetooth module reference.

With CONFIG_BT=m and Bluetooth debugfs enabled, a descriptor can remain
open across controller removal and module unload if all other module
references have been dropped. After hci_debugfs_create_basic() publishes
the file, the following order is possible:

    File holder                     Controller/module teardown
    -----------                     --------------------------
    open dut_mode
      full_proxy_open_regular()
      fops_get(): owner == NULL
      debugfs_file_put()
    keep descriptor open            hci_unregister_dev()
                                    hci_release_dev()
                                      debugfs_remove_recursive()
                                    delete_module()
                                      bt_exit()
                                      free_module()
    close descriptor after unload
      full_proxy_release()
        read real_fops->release

Debugfs removal drains active callbacks, but an idle open descriptor is
not an active user. Its dentry retains the saved table pointer until
close. full_proxy_release() then reads the release field, even though
it is NULL, and fops_put() reads the owner field from freed module
storage. The close can fault in full_proxy_release(), as shown below.

Set the owner of dut_mode_fops to THIS_MODULE, matching the tables
created by DEFINE_SHOW_ATTRIBUTE in the same file. The existing debugfs
fops_get()/fops_put() pair then keeps Bluetooth loaded until close has
finished using the table, preventing normal unload with the file open.

Oops report as below:
    BUG: unable to handle page fault for address: fffffbfff8056f03
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    PGD 1a7ff6067 P4D 1a7ff6067 PUD 1a7ff2067 PMD 100ad6067 PTE 0
    Oops: Oops: 0000 [#1] SMP KASAN NOPTI
    Call Trace:
     <TASK>
     __fput+0x39f/0xa60
     fput_close_sync+0xff/0x200
     ? __pfx_fput_close_sync+0x10/0x10
     ? dnotify_flush+0x22/0x4b0
     __x64_sys_close+0x8c/0xf0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
Fixes: 4b4148e9acc1 ("Bluetooth: Add support for setting DUT mode")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Assisted-by: LLM
---

diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
index 2559fb6324d63d5fc84d530d2a19f2602ac06d3d..f17b5c960522cb22140322e4781775e4e2f6b711 100644
--- a/net/bluetooth/hci_debugfs.c
+++ b/net/bluetooth/hci_debugfs.c
@@ -1315,6 +1315,7 @@ static ssize_t dut_mode_write(struct file *file, const char __user *user_buf,
 }
 
 static const struct file_operations dut_mode_fops = {
+	.owner		= THIS_MODULE,
 	.open		= simple_open,
 	.read		= dut_mode_read,
 	.write		= dut_mode_write,
