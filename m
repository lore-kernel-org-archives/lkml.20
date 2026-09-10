Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44E4A9D50
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054674; cv=none; b=MsWWpEdFUdQmjnu8Qt04E5qLBcVvgQ2P+Or9E1rJJ9yPHS7V6duTHLv94AtHl2mcDk0Bp+XXTe7gKy914ABzA41qQXKsMb+xFv2IPpHzwWExl8PJ9ulRocgKxRVE0HNQP37NCotixJNlVmcUwCLuhzjYiZcl/bWgmAPM4XFqVdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054674; c=relaxed/simple;
	bh=HQijiPlwvDLFO+zIPNo2HBbu3dtpiVeMOBm/adtycNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I9cahnvcw+L2ahDWmrpDX4mt/nCScdr77YGJJ3zFfNVF8AA8NnljihBJdTK2M9QIvxSjodIGVXvsI0dz1CbgNwQSk03kYvmjAdwmzTGAzAFyP6TWLogltC0d5lYVwrtvlnoNuS/+J6q+USIJBfFOrjOMWOLE8AjLaJbBt+FrKD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec/3s7um; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec/3s7um"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso2110611a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054672; x=1789659472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xf27/e13zSRzdWtLn2ZnVwbWOxwXcFNzloo83ia2tDo=;
        b=Ec/3s7um9niKH4ZQGpW77I0l8Wi0ooJnlbA9vQrVM2jtjZ0TNh5ZK2Cv1Z+ErO4IP3
         x8wPBynl1Te1Lul1+svaOTFxXokMbRiTwz7LCEmdNXKjSE1d4KBWKAIzc+9Fte6yU+Zg
         KLR3PcgnPR7NVqsHoG7GJtU/829CPN0q3ThDxFProQIKU8jDf0RSEI/zvboSdrWz8/9K
         77R914K5mvYiwewaT2GXaABu3wA7DTAu1UXLnLTEiqwvq+TixaQz2MrwFEhU5cjb29AO
         kh1GBNotoImdhEHDXiHKxe9R+TqQliIPLQg69VJvSJsOenwuacRc/UzNMtWpejDJx9TG
         YLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054672; x=1789659472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf27/e13zSRzdWtLn2ZnVwbWOxwXcFNzloo83ia2tDo=;
        b=bGAabH8UsnfOSuEZcDsfsKwxg4x5vljNv5VOh1RlK9EKH9soAYqr5Usdx9JJ9HQv2o
         zOanUiKljxEYrbE8H2q2oS73zs03HIS9AW/tIIdIKNnHk8hpLKvMwzaB9K+q1zitH5BE
         PCPWJ9sjjnWJ4K3BzimXBKiLTTt15P+K9t4TCZvO3cigH3eBbujAR6ZSX2VtmQu9YBEi
         v25Qzff+v6MzHo2M3tglTuPWukWrg0LJ6+W+TQ3zVln741qLa4JsHDjBeH9At9biFGJG
         dZHYfLjiFb3IIeFj0L8qxGBpWVt4pcki6jJ8r/b5Ts7oQ6vNLQUuYoHMVJxT/xFWBX5k
         HZZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUoYeKQNIHLCFQfeYTE9vv98mWEw8ODoXB61TQ9DM0fuTdaDZ+iItA9HwZKNgCTgGvSTRFMQNfY3rKqb4=@vger.kernel.org
X-Gm-Message-State: AFuF++luD7PtV02y7I/gmPs7FM5d+FMh9zFsvsDoXMZpFktrA2Q8CKVq
	P6UtKDMxmRYZfDGG/XKxcXx26uOUJ3jW8MXO19QbhZuX/XCoDjp44qml
X-Gm-Gg: AYBFou2nPz1GtXv6VxyjnImWyby3I4FJUwGBT9+ckU1LQ4T7MEnn4ejT2mrCc1XZzmm
	7JdmMMhUR8evKUqR/vY+f4bIZKRBMygfxUYSo3adOLMcn1xBF0l5mxGWMHzDx0sCJdNM7ABjRHZ
	HijgHxshDe3/8xdCqgd4c+XEjiyleLh4I9y23O1uMacL/rrgg9LQV6aGcXoVJExaW630pJyvo6+
	+uPm3wX7uy3Hgvdf4LlrKhruduyBoK0kBm6VkPmiKppGJcfxxsVXfWg6AsgI+xxeKH0RgpKJOtM
	PfZlsbeGCSv0ehaPrDeGX8NLvkL6Qnt4MSo4npGW+miO+2hI/88cRnlojsEgWdlY2sgCqJ9S1nJ
	97YBnvHlXkHNbx9/hkJRXYU7wJc/6+BcnEoTF15RGs6UuFHtmo2TDSusi8ZZtK6k9uqQCQUds9L
	hjQqaXrWWiBC5bIAT2qotPtfP572M1SSXClGDET9CscrsA2GSHu87NlPsbcbZOXf+8Gnuy3/HXr
	UuaHOAMHEX+HP10S1k=
X-Received: by 2002:a17:90b:3d89:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39bac3f9063mr21283299a91.20.1789054672086;
        Thu, 10 Sep 2026 08:37:52 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:ced9:ef96:e152:2608])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94b9334dsm170730a91.3.2026.09.10.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:37:51 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+093e05755c2d99caab91@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] HID: multitouch: use GFP_ATOMIC for report/application/usage allocations
Date: Thu, 10 Sep 2026 22:37:46 +0700
Message-ID: <20260910153746.16222-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt_allocate_report_data(), mt_allocate_application() and
mt_allocate_usage() devm_kzalloc() with GFP_KERNEL, but they are
reachable from mt_event()/mt_report() via hid_report_raw_event(),
which can run in (soft)irq context off a USB URB completion (e.g.
dummy_hcd's hrtimer softirq). GFP_KERNEL there may call into
fs_reclaim, which lockdep flags as an inconsistent {SOFTIRQ-ON-W} ->
{IN-SOFTIRQ-W} use of fs_reclaim, alongside a "sleeping function
called from invalid context" splat.

Switch all three to GFP_ATOMIC since none of them are on a path that
needs to sleep.

Reported-by: syzbot+093e05755c2d99caab91@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=093e05755c2d99caab91
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/hid/hid-multitouch.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2c41bacab1ca..6b68e43fd885 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -604,7 +604,8 @@ static struct mt_usages *mt_allocate_usage(struct hid_device *hdev,
 {
 	struct mt_usages *usage;
 
-	usage = devm_kzalloc(&hdev->dev, sizeof(*usage), GFP_KERNEL);
+	/* may run from hid_report_raw_event() in (soft)irq context */
+	usage = devm_kzalloc(&hdev->dev, sizeof(*usage), GFP_ATOMIC);
 	if (!usage)
 		return NULL;
 
@@ -633,8 +634,9 @@ static struct mt_application *mt_allocate_application(struct mt_device *td,
 	unsigned int application = report->application;
 	struct mt_application *mt_application;
 
+	/* may run from hid_report_raw_event() in (soft)irq context */
 	mt_application = devm_kzalloc(&td->hdev->dev, sizeof(*mt_application),
-				      GFP_KERNEL);
+				      GFP_ATOMIC);
 	if (!mt_application)
 		return NULL;
 
@@ -692,7 +694,8 @@ static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 	struct hid_field *field;
 	int r, n;
 
-	rdata = devm_kzalloc(&td->hdev->dev, sizeof(*rdata), GFP_KERNEL);
+	/* may run from hid_report_raw_event() in (soft)irq context */
+	rdata = devm_kzalloc(&td->hdev->dev, sizeof(*rdata), GFP_ATOMIC);
 	if (!rdata)
 		return NULL;
 
-- 
2.43.0

