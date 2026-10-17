Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7575738237B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201210; cv=none; b=e7iI2uI/qESndOARDtKHvoJRUKCMjrBaiNQcqAyAzXvP8Hms1cOYSBergXeGF/EvvZHnzZEnYZ58NusUrNK5WDN0/oqj076c5PWFW5P2vHdfuPrxAzHTUI3hyLnH9jniHUwVBOUun5iGnPfnF37z6TUfQX5pyWS2O8IeZu7ARts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201210; c=relaxed/simple;
	bh=B5NcsJqiM6ca6zoKCCSiRnmiGiK51EUO/f+42QeBqzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5CMk0aMz3+nyfeZJt1qTG2cJ35SuP3yBF7LUCS7QDfccQ7cPPkdS0VPZ2rEU8aLzODYqHUTznrx4t0TOIh+RuaLhLVqPu18OcznZx5swgLVxdmrB0ZDKERQik+BaHKfw8bPGbi8OSMHrwemRuAvHrMwzQqrXKO4ZEzPCO8BfQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBqIxRNB; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBqIxRNB"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f1f76ea84so760315eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201208; x=1792806008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cket7DPZv1j5YnyOIveBa4NpPNYaScJjvnuFzxjWh88=;
        b=WBqIxRNBUqBRRhN6b7EfvbJPWt6hwGRIlRYS9Qf57HMtBDdB7YOqqF7LSkXOZ272cb
         Y4Ur9MaxHuCDIjGl95MejJfqlwhOH6DNbNrSiFW/lUQsqW3kQHjIc4AsYUvIAEdR1Kv6
         qs5o7XJqW2gv1rCEhbo60Nu0/+UPO97Qf3FRErUP3VUBx5Xekknkn7tBOhOhlWCF+fj1
         pED7QO7Udl2PBu3HbMtqK7r9IP8ltoc3bnQurCc6LAWdJQYHS/MGaj//5XJVX4umkEcc
         /8iV9933xXySzoTwS9m56dFDaLVXiuGVPillMcKWuJ2FhdQxSahzVd0ixF9YHMyQ+ok7
         csOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201208; x=1792806008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cket7DPZv1j5YnyOIveBa4NpPNYaScJjvnuFzxjWh88=;
        b=Ke9B2KUR+DRpo5iS23MnLnli5Zf4wM7LlgFdVvoSKHz1e91P3oozeFwktPtg/LVPw4
         uV/O0/uPxSZOOs6WSQCE4Jm/ZOsI9fUacfNV0GvvazJMy69deJ4q0rBgtpOrvcfHPznc
         HuhP2eZTco4VLrDIkeZRubh3RkTXZKDcMIV/PgMc6UPx88NRpNJsef6G0Qu02aGFyNeV
         yhc5WdXqtLF+CSe6FTvYSKf7wgIEo5kLQOYAvQSS+fjurnkrF7HbdwKRqWBuS22jmy7X
         MPZQUoiSPs5AmyRBRldFpgnF2ViF+d7/Rw83md67bHWbzgYZtgAq2XFXSlbTYdktQLl5
         387w==
X-Forwarded-Encrypted: i=1; AKwUvBytYe9NXpKxsCa9FaZ/NNy4Re2fBFjkoAyk+A/+NfSm2nx9M6NREgG+d2agFYQmEnDoNVVjy+emdc/TsuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFF2gxaRIKIQnbWlLhuDjmXnS76YmYboMk+gTIqeZjCt+csbys
	PEfoudTVCvHTo4d73jVoTN5eppSKh534N8QdmvOH1m5wAPtszDG8YhE7
X-Gm-Gg: AYBFou03OAslWfwtwbk3Id/ge7tnAkv7ZXgW5HM/8J1Fg7B+fmyoJWy1ofrhqUE2kqk
	oDf46KxLYqGaMsDbJibHYONMFVLptQOR62cNYiDh2okzjeoVVn068jx+zrkNbc1X8r2v6e2zdIc
	8QjCUq1f9Zt75glOvbuf4xaKaBCGCDYPPIXszx80rAGbAqFV+mPFp6vUJTFh09ry1Idv6KGpQDz
	8Bp4jH0IpAEf4Dh3ErO2cOgCFWDn2NNrK0khZqJyJHpbuwrAksrq+mhfJNJLYdKzH8ctUbfv+UW
	gGafcUrFsjWJGv0fbIyHggOa0Rzxcg2Cw9HwxVJSeCk1ILv+NHThhiTL+XSjG4C2Z7jN7A55YFL
	rcuJ1DT1dOPyUSu298wCIaix72qC1H7cGLhu/pbQcIoPZ/2C8a9qYP13mCMofjfdtul3LSW4Vfm
	1OBeRTrNF9B4oSDLHh7qCaLJWYWbXqNujPQ/+0LxhgpqpCQvFRMmlnawgB+yt0ayLJvIQy93226
	+gTuXgPy1/RrW3qahROPWhCT8raO9O0/yhUi8H85XfqaUrKVEAWVd96P99gG+Eqqf0qVJ5lApw=
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr2235374c88.45.1792201208381;
        Fri, 16 Oct 2026 18:40:08 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm12128429c88.13.2026.10.16.18.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:40:07 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH v2 01/11] HID: hid-lenovo-go-s: Return ret instead of 0 in mcu_property_out()
Date: Fri, 16 Oct 2026 18:39:46 -0700
Message-ID: <20261017013956.2440130-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
References: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mcu_property_out() blanket returns 0, discarding the ret
value and any errors with it. Wait completion returns a positive value
when it is not timed out, which would error on all successes, so if it
is positive return the ret value from the raw event handler. Only if
it is 0 set it to -EBUSY, otherwise pass the actual error.

Fixes: a23f3497bf208c59ad ("HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index a72f7f748cb5..68301d4c762a 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -38,6 +38,7 @@ static struct hid_gos_cfg {
 	struct led_classdev *led_cdev;
 	struct hid_device *hdev;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
+	int cmd_status;
 	u8 gp_auto_sleep_time;
 	u8 gp_dpad_mode;
 	u8 gp_mode;
@@ -435,7 +436,9 @@ static int hid_gos_raw_event(struct hid_device *hdev, struct hid_report *report,
 	dev_dbg(&hdev->dev, "Rx data as raw input report: [%*ph]\n",
 		GO_S_PACKET_SIZE, data);
 
+	drvdata.cmd_status = ret;
 	complete(&drvdata.send_cmd_complete);
+
 	return ret;
 }
 
@@ -474,12 +477,10 @@ static int mcu_property_out(struct hid_device *hdev, u8 command, u8 index,
 	timeout = (command == GET_PL_TEST) ? 200 : 5;
 	ret = wait_for_completion_interruptible_timeout(&drvdata.send_cmd_complete,
 							msecs_to_jiffies(timeout));
-
-	if (ret == 0) /* timeout occurred */
-		ret = -EBUSY;
+	ret = ret > 0 ? drvdata.cmd_status : ret ?: -EBUSY;
 
 	reinit_completion(&drvdata.send_cmd_complete);
-	return 0;
+	return ret;
 }
 
 static ssize_t gamepad_property_store(struct device *dev,
-- 
2.55.0

