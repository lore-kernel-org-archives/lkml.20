Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0159493D2E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059349; cv=none; b=NSNUR6SUlaRXkoHx3zus2WVrrrBiKaO/v5rLERAKn4ucq7/wTuB0JOAmTyHOev51dfpUMnS0fsUnsAGadAD6srus9dPMkKAsoboMY0UkAuYhOk03Q9k2AQoIoAW+gTiad1iqzAN7IH3CwUSbzq6qaygU2FYTVTqJP29gLHcpJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059349; c=relaxed/simple;
	bh=rz3yn+C2eMXZq6DDOcOzTXjjZhcgJFRoGT8TBDOfLM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8vCXl2VvtT4aIe24nYrXoPtjf6XKIg9OZQaxnQutTqlbXJunpOpG5GMgMNenRgSUOc7DD0jG8fvUbN/DDY2iSRtUwAbElPSj/6MHJgD+iwTA9cFI5qCjAAY1upetGQSwBU9w2aHZX/yXy7wgoI8VO9DnhuflU6B7EzUX5pkEHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAHyT+iS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAHyT+iS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caced6038eso178495ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059347; x=1789664147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhI6MBvRN0gP2RgUEHdvGpUA0bye96IQsEzTBS/VwdM=;
        b=VAHyT+iSi6/EwZsmASElUloGOoXv6X54zDBElHMQxmydoDshiN1jN3bPeaYtsSTvnJ
         6YZi3ZFoPFBkoKy7+r7Olpa6zAxKdhZdPjG2moPL/CRR3ccL3Njc3vIfAb4ABeC00o7N
         J+iVGmwknW6CXluVtYuWNj4/nJGI5vO/n95Mb7AtXQ4BUKWYsqbjJyIojBuYW3/Yr7qH
         gjZt9EgjwUmARucjVV68GRf1zp12cL/HPGWcvLWdDC11KVqPPuCLfAyDRqn/i5yMNxdV
         jVvpWKAHHfbJCnzsZKJRx3lRQY0ThK2/yvYGcTiOAugwjZtQsjtDQ6n0Di9/d2Txofy4
         Bsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059347; x=1789664147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhI6MBvRN0gP2RgUEHdvGpUA0bye96IQsEzTBS/VwdM=;
        b=BSylOF8WnB7kap/Og9gP69UHOcTlbUIVUh4B3b+EviksqwxtPyLCZWxjmnY2Tn1n0z
         EIM7W+BcyzMhXsgIFo649p5VOyIupSltcYo23N+k9Np6SlgBLo4cqp2aqYnfzGDeunlM
         jXPIVYFL4qYMyVWp8Zu+orufFnNoA4zufpg+viCdVS7cN6K1WewgYfo815eYto2M9T9X
         G6Cro014SnYQljbO1y0b03xg15lc8KcfPurJBoJCoprswxkYJr8yjftZBu5LFpaQz+fN
         DMhqz52i3dHpQ8VScuJ+OyLYSlJAKT5oWcA3idfNuPS5I5Tl1IL7of9zqUNOleIEKAKB
         lAyQ==
X-Forwarded-Encrypted: i=1; AKwUvByNPSiHJiYqdclSf1KiShzPI1wyQhzRwd0DKi56lA2kJH1Wim+/88+4Y4LPAZHH5fjhkYCSZpMpY2sDe3o=@vger.kernel.org
X-Gm-Message-State: AFuF++kyr7+PejHmQ9++19Aqg6sXcVXcBzf/woCR9D260cix7v6Lpv2s
	e9eA7zuUfb6LbiNNKMOm1XVgGzKUiXSxJ7Q08eJFF4/xrbxd2xKyGIc4
X-Gm-Gg: AYBFou3ws7v/EcwKrU7Vofy8Rffe8GEVdIMmLG9ptvP8Awjbn5+0zhwnpAq1bQHTk8l
	cIJ8xR1hpnvJp7jSDuXtBhXEbPbd8MH3UCI16qU9ucNbQxewAOj+VFUINoJYGhZoaMwxu9wROe8
	E8AKRRrvHIhz5rmF30O8uXNg8wfD09veqnQN27qz7NYlHOaGKAWH2USsntdwRpBVeeN3da8Hf4M
	DsqYT4ASQ0uG4Z0FQafY887Z85gwx/sBUsB8c/byNF9HpbOa6i+dMDW56y1EEgv7VDRf0G6NKTs
	tAixRoCmZhZ75y5EC4zJTN7NvVyLgXP+uL89Bdqt9KEE08+LBTH1f668gqjNk+sWaElJxM7hhGB
	SccApNZFPAXkCiO+V9c7KQhKaf3YmdyoamUW0/0xoA6kmBIycv3YCwp0ybSamZv1aKCEP6FlbkL
	QXzULGTt9gqW12WDPYJU1Z21+Cn3al7yHZi2iJy5u+dRhBAofxEIhDE4nrDpt18JUYW3DwgVdkZ
	xM2JLQDu7kHnfbHELs=
X-Received: by 2002:a17:903:2308:b0:2d8:d4d2:d13a with SMTP id d9443c01a7336-2dd0eec8eddmr58642945ad.22.1789059347086;
        Thu, 10 Sep 2026 09:55:47 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:ced9:ef96:e152:2608])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm32600640eec.5.2026.09.10.09.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:55:46 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+093e05755c2d99caab91@syzkaller.appspotmail.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	sashiko-bot@kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: Re: [PATCH v2] HID: multitouch: use GFP_ATOMIC for report/application/usage allocations
Date: Thu, 10 Sep 2026 23:55:41 +0700
Message-ID: <20260910165541.37601-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910164229.CC7E51F0089E@smtp.kernel.org>
References: <20260910164229.CC7E51F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt_allocate_report_data() and mt_allocate_application() devm_kzalloc()
with GFP_KERNEL, but they are reachable from mt_event()/mt_report()
via hid_report_raw_event(), which can run in (soft)irq context off a
USB URB completion (e.g. dummy_hcd's hrtimer softirq). GFP_KERNEL
there may call into fs_reclaim, which lockdep flags as an
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} use of fs_reclaim,
alongside a "sleeping function called from invalid context" splat.

Switch both to GFP_ATOMIC since neither is on a path that needs to
sleep. mt_allocate_usage() is left at GFP_KERNEL: it is only reached
from mt_touch_input_mapping(), which runs at probe time (hid_hw_start()),
never from mt_event(), so it does not need the downgrade.

While auditing that same softirq path, td->applications turned out to
be walked and mutated without any lock: mt_allocate_application() can
list_add_tail() to it from mt_event()/mt_report() in (soft)irq
context, while mt_release_contacts() (timer callback) and
mt_set_quirks() (sysfs write) each list_for_each_entry() over it from
their own, independent contexts. On SMP those can run concurrently
and corrupt the list. Add application_list_lock (spin_lock_irqsave,
since one user is a timer/irq context) around every access to
td->applications, and hold it across mt_find_application()'s whole
search-then-allocate sequence so two callers can never both decide to
create the same application.

Reported-by: syzbot+093e05755c2d99caab91@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=093e05755c2d99caab91
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v3:
- Add application_list_lock to serialize td->applications against the
  concurrent softirq/timer/sysfs accessors flagged by sashiko-bot
  (pre-existing race, not introduced by this patch, but fixed here
  since it's on the same softirq-safety path).

v2:
- Keep mt_allocate_usage() at GFP_KERNEL. It is only reached from
  mt_touch_input_mapping(), at probe time, never from mt_event(), so
  the GFP_ATOMIC downgrade there was unnecessary.
  (feedback from sashiko-bot)
---
 drivers/hid/hid-multitouch.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2c41bacab1ca..dd17bf4abfae 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -37,6 +37,7 @@
 #include <linux/hid.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/input/mt.h>
 #include <linux/jiffies.h>
 #include <linux/string.h>
@@ -186,6 +187,11 @@ struct mt_device {
 	bool serial_maybe;	/* need to check for serial protocol */
 
 	struct list_head applications;
+	spinlock_t application_list_lock;	/* protects applications, incl.
+						 * concurrent add from softirq
+						 * vs. list_for_each_entry from
+						 * timer/sysfs context
+						 */
 	struct list_head reports;
 };
 
@@ -477,6 +483,7 @@ static ssize_t mt_set_quirks(struct device *dev,
 	struct hid_device *hdev = to_hid_device(dev);
 	struct mt_device *td = hid_get_drvdata(hdev);
 	struct mt_application *application;
+	unsigned long flags;
 
 	unsigned long val;
 
@@ -485,11 +492,13 @@ static ssize_t mt_set_quirks(struct device *dev,
 
 	td->mtclass.quirks = val;
 
+	spin_lock_irqsave(&td->application_list_lock, flags);
 	list_for_each_entry(application, &td->applications, list) {
 		application->quirks = val;
 		if (!application->have_contact_count)
 			application->quirks &= ~MT_QUIRK_CONTACT_CNT_ACCURATE;
 	}
+	spin_unlock_irqrestore(&td->application_list_lock, flags);
 
 	return count;
 }
@@ -604,6 +613,7 @@ static struct mt_usages *mt_allocate_usage(struct hid_device *hdev,
 {
 	struct mt_usages *usage;
 
+	/* only called from mt_touch_input_mapping(), at probe time */
 	usage = devm_kzalloc(&hdev->dev, sizeof(*usage), GFP_KERNEL);
 	if (!usage)
 		return NULL;
@@ -627,14 +637,16 @@ static struct mt_usages *mt_allocate_usage(struct hid_device *hdev,
 	return usage;
 }
 
+/* called with td->application_list_lock held */
 static struct mt_application *mt_allocate_application(struct mt_device *td,
 						      struct hid_report *report)
 {
 	unsigned int application = report->application;
 	struct mt_application *mt_application;
 
+	/* may run from hid_report_raw_event() in (soft)irq context */
 	mt_application = devm_kzalloc(&td->hdev->dev, sizeof(*mt_application),
-				      GFP_KERNEL);
+				      GFP_ATOMIC);
 	if (!mt_application)
 		return NULL;
 
@@ -667,6 +679,15 @@ static struct mt_application *mt_find_application(struct mt_device *td,
 {
 	unsigned int application = report->application;
 	struct mt_application *tmp, *mt_application = NULL;
+	unsigned long flags;
+
+	/*
+	 * Hold the lock across the search and the fallback allocation so
+	 * a concurrent mt_release_contacts()/mt_set_quirks() never walks
+	 * the list mid-insert, and two callers can never both decide to
+	 * allocate the same application.
+	 */
+	spin_lock_irqsave(&td->application_list_lock, flags);
 
 	list_for_each_entry(tmp, &td->applications, list) {
 		if (application == tmp->application) {
@@ -681,6 +702,8 @@ static struct mt_application *mt_find_application(struct mt_device *td,
 	if (!mt_application)
 		mt_application = mt_allocate_application(td, report);
 
+	spin_unlock_irqrestore(&td->application_list_lock, flags);
+
 	return mt_application;
 }
 
@@ -692,7 +715,8 @@ static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 	struct hid_field *field;
 	int r, n;
 
-	rdata = devm_kzalloc(&td->hdev->dev, sizeof(*rdata), GFP_KERNEL);
+	/* may run from hid_report_raw_event() in (soft)irq context */
+	rdata = devm_kzalloc(&td->hdev->dev, sizeof(*rdata), GFP_ATOMIC);
 	if (!rdata)
 		return NULL;
 
@@ -2060,6 +2084,7 @@ static void mt_release_contacts(struct hid_device *hid)
 	struct hid_input *hidinput;
 	struct mt_application *application;
 	struct mt_device *td = hid_get_drvdata(hid);
+	unsigned long flags;
 
 	list_for_each_entry(hidinput, &hid->inputs, list) {
 		struct input_dev *input_dev = hidinput->input;
@@ -2077,9 +2102,11 @@ static void mt_release_contacts(struct hid_device *hid)
 		}
 	}
 
+	spin_lock_irqsave(&td->application_list_lock, flags);
 	list_for_each_entry(application, &td->applications, list) {
 		application->num_received = 0;
 	}
+	spin_unlock_irqrestore(&td->application_list_lock, flags);
 }
 
 static void mt_expired_timeout(struct timer_list *t)
@@ -2127,6 +2154,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_set_drvdata(hdev, td);
 
 	INIT_LIST_HEAD(&td->applications);
+	spin_lock_init(&td->application_list_lock);
 	INIT_LIST_HEAD(&td->reports);
 
 	if (id->vendor == HID_ANY_ID && id->product == HID_ANY_ID)
-- 
2.43.0

