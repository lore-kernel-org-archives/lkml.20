Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F9D42E013
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536439; cv=none; b=H76LQRgQZxnsZfH68LOH5V6kjbjcLNqRtYAq2rV01+kXFZtWQGNrvsMSgd8kEG8KFWWol8ztn337h0OEeN//3Q8GN5oIFybWGT3Sq9jropd/fu24brRPBYdJl4BGWGpcxVIQ/PfvFSjefOXG8rcXBTqikJ/RyCxGy1YlwGVWnYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536439; c=relaxed/simple;
	bh=rpU7IRwg82mYGW78DVGD7XuOMsxHe9fuobloRGa5dGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMZLWfNJKW6bEFY9wlkXKeghKxYUOEctovTsaSBc5GpjV8LtfUrhIcaeoVDx1fx7C8R08lPMUEIVZArlvQpcYGccv4veibBOBZB1YFmwn8d+1I+16npE8pSHVp4tGuSYSuuwlN6sY1IjllyR4fQaWOxnH1E6gWLkB1+rVIDwo2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=ttG1Vu0E; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="ttG1Vu0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790536430; x=1790795630;
	bh=LrkvP3pOwzlFNWHfOqIfXe/+PPygsLNzJ+tWmsbYbx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ttG1Vu0EDQbWgSqbdO2ewLCVCJqa9aSde58E36inji4UyQ+UnIzltofDBKHb3K9He
	 YLAlK4zxXiXfyhV8Fb0oEvW8MCA4WGobnX1JzNeEWEdY/hsXvKd4NRdwH4qqwB3O6K
	 4+OE7etWHLspPPnZYcqlZfiPDI8GXLNwqoU/TG+PWi5pN7SaTM/+5DGGiD35drhFF6
	 BU44EaDPSAQlGH60pcPrKiVmqzXL/Uh7/rMzRTgiXv3XszJtLgq5DsUq2rN7uVfMEw
	 5Y9ySLzimAbFEEz79dPgRodZVYRfx55QdK9hox9bVH2PbV2dh5ph3//8qA2Eq4g9pQ
	 SGboZyByS6Ilw==
X-Pm-Submission-Id: 4htDcr5nljz2ScPL
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5 3/5] hwmon: (aquacomputer_d5next) Validate incoming status reports
Date: Sun, 27 Sep 2026 22:13:14 +0300
Message-ID: <20260927191316.4137752-4-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927191316.4137752-1-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The raw-event callback runs before HID core pads a short report. Check
that the report is an input report and that its length matches the HID
report descriptor before decoding sensor fields. Otherwise a truncated
report can be read past its received data, and a feature report with the
same ID can be mistaken for sensor data.

Apply these checks to every device using the shared raw-event path and
check the report ID byte before updating the cache. Legacy devices keep
using their separate feature-report read path.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
 drivers/hwmon/aquacomputer_d5next.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 0bd1886ef..f80027b27 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1334,7 +1334,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 	int i, j, sensor_value;
 	struct aqc_data *priv;
 
-	if (report->id != STATUS_REPORT_ID)
+	if (report->id != STATUS_REPORT_ID || report->type != HID_INPUT_REPORT ||
+	    size != hid_report_len(report) || data[0] != STATUS_REPORT_ID)
 		return 0;
 
 	priv = hid_get_drvdata(hdev);
