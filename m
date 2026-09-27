Received: from bsdsz2.pd.infn.it (bsdsz2.pd.infn.it [192.84.143.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99C2DB7BB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.84.143.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503350; cv=none; b=E2zsNdQSTpX8KRTGYYYruDEpPB6E88w80qCYcIBhvjuPuUCntqfwVR+rUoDVmzyinIJXYIVK5GPM5DwiuY1NUpf1bcGUrk5h+ZQkwNZL3J/bJYY4ek0p82Kd8C2exEneI2duOD/YZsLz6dOHAkV3AjdS6QOs3q21wbjAjt0Ogdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503350; c=relaxed/simple;
	bh=HxfMr9LiejgLVI2i3QndhxOxek1Qe9xtk3zFWSfOkco=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=f7pZbB2WbhV3j3bpy9qJ5bpnO78GrkUoGvnIZRnJUFI9K9gYJMtUI4z1Oq3Bx/2UinF7WvYSWdrEeTyZMAR1VSzr67luZH5vFfcS+67DPG5BXvHkR7OYN2gCTxmIzkPMr5dawhaUsKG1o8EmsGoor9Kt/gr3MAnke//qxIzf7B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pd.infn.it; spf=pass smtp.mailfrom=pd.infn.it; dkim=pass (1024-bit key) header.d=pd.infn.it header.i=@pd.infn.it header.b=q+3ATSaf; arc=none smtp.client-ip=192.84.143.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pd.infn.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pd.infn.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pd.infn.it header.i=@pd.infn.it header.b="q+3ATSaf"
Received: from [193.205.57.134] (wlecastellani.pd.infn.it [193.205.57.134])
	(authenticated bits=0)
	by bsdsz2.pd.infn.it (8.15.2/8.15.2) with ESMTPSA id 68R9xsof047325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Sun, 27 Sep 2026 12:00:00 +0200 (CEST)
	(envelope-from lorenzo.castellani@pd.infn.it)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pd.infn.it;
	s=bsdsz2; t=1790503202;
	bh=CzUZX/nazn6zAeR2jBTELSD0auTwcsnaVqr7BwlQ3z0=;
	h=Date:To:Cc:From:Subject;
	b=q+3ATSaffKZdyMZUMJF7laMPpgEcdPdfW9dSdlqBQToi0JtHyNt2wut6gsaqYkoJs
	 4x8aKDBBM8Inzoko6YWlXuWcmjEBXVgsf8/sSaDYtCkzGZnixDJCmt+QwK9XAPREAM
	 OsP94q7DbnznTq8uZYC+Q4wLMT42M1PaWn4BzizQ=
X-Authentication-Warning: bsdsz2.pd.infn.it: Host wlecastellani.pd.infn.it [193.205.57.134] claimed to be [193.205.57.134]
Message-ID: <5b2e042a-a4b6-41e1-a779-13a49003fd45@pd.infn.it>
Date: Sun, 27 Sep 2026 11:59:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: it, en-US
To: w1@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
From: Lorenzo Castellani <lorenzo.castellani@pd.infn.it>
Subject: [PATCH] w1: w1_therm: fix missing therm_bulk_read sysfs attribute
 with multiple bus masters
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (bsdsz2.pd.infn.it [192.84.143.16]); Sun, 27 Sep 2026 12:00:00 +0200 (CEST)
X-Spam-Score: -1.098 () BAYES_00,HELO_MISC_IP,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.83 on 192.84.143.16

 From 32e145b49cf41ce150a97ce52c63f5aae1bbbea7 Mon Sep 17 00:00:00 2001
From: Lorenzo Castellani <lorenzo.castellani@pd.infn.it>
Date: Tue, 22 Sep 2026 11:12:30 +0200
Subject: [PATCH] w1: w1_therm: fix missing therm_bulk_read sysfs attribute
  with multiple bus masters

When multiple 1-Wire bus masters are present in the
system, the global module-level counter causes the
therm_bulk_read sysfs attribute to be created only
for the first master where a bulk-read capable slave
is discovered. Subsequent bus masters fail to expose
the attribute because the counter is already non-zero.

Fix this by replacing the global static counter with
a per-master helper function that iterates over the
slaves associated specifically with the given master
(dev_master->slist). This ensures that each bus
master independently correctly tracks and exposes the
therm_bulk_read sysfs attribute when bulk-read
capable devices are present.

Signed-off-by: Lorenzo Castellani <lorenzo.castellani@pd.infn.it>
---
  linux-rpi-6.18.y/drivers/w1/slaves/w1_therm.c | 30 ++++++++++++-------
  1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/linux-rpi-6.18.y/drivers/w1/slaves/w1_therm.c 
b/linux-rpi-6.18.y/drivers/w1/slaves/w1_therm.c
index 832e3da94..4c8e67ec8 100644
--- a/linux-rpi-6.18.y/drivers/w1/slaves/w1_therm.c
+++ b/linux-rpi-6.18.y/drivers/w1/slaves/w1_therm.c
@@ -44,9 +44,6 @@
  static int w1_strong_pullup = 1;
  module_param_named(strong_pullup, w1_strong_pullup, int, 0);

-/* Counter for devices supporting bulk reading */
-static u16 bulk_read_device_counter; /* =0 as per C standard */
-
  /* This command should be in public header w1.h but is not */
  #define W1_RECALL_EEPROM    0xB8

@@ -968,6 +965,19 @@ static inline s8 int_to_short(int i)

  /* Interface Functions */

+static int w1_therm_count_bulk_read_slaves(struct w1_master *dev_master,
+    struct w1_slave *exclude_sl)
+{
+    struct w1_slave *sl;
+    int count = 0;
+
+    list_for_each_entry(sl, &dev_master->slist, w1_slave_entry) {
+        if (sl != exclude_sl && sl->family_data && bulk_read_support(sl))
+            count++;
+    }
+    return count;
+}
+
  static int w1_therm_add_slave(struct w1_slave *sl)
  {
      struct w1_therm_family_converter *sl_family_conv;
@@ -992,9 +1002,11 @@ static int w1_therm_add_slave(struct w1_slave *sl)
      if (bulk_read_support(sl)) {
          /*
           * add the sys entry to trigger bulk_read
-         * at master level only the 1st time
+         * at master level only the 1st time on this master
           */
-        if (!bulk_read_device_counter) {
+        int bulk_count = w1_therm_count_bulk_read_slaves(sl->master, sl);
+
+        if (!bulk_count) {
              int err = device_create_file(&sl->master->dev,
                  &dev_attr_therm_bulk_read);

@@ -1003,8 +1015,6 @@ static int w1_therm_add_slave(struct w1_slave *sl)
                  "%s: Device has been added, but bulk read is 
unavailable. err=%d\n",
                  __func__, err);
          }
-        /* Increment the counter */
-        bulk_read_device_counter++;
      }

      /* Getting the power mode of the device {external, parasite} */
@@ -1040,9 +1050,9 @@ static void w1_therm_remove_slave(struct w1_slave *sl)
      int refcnt = atomic_sub_return(1, THERM_REFCNT(sl->family_data));

      if (bulk_read_support(sl)) {
-        bulk_read_device_counter--;
-        /* Delete the entry if no more device support the feature */
-        if (!bulk_read_device_counter)
+        int bulk_count = w1_therm_count_bulk_read_slaves(sl->master, sl);
+        /* Delete the entry if no more device support the feature on 
this master */
+        if (!bulk_count)
              device_remove_file(&sl->master->dev,
                  &dev_attr_therm_bulk_read);
      }
-- 
2.43.0


