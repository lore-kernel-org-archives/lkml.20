Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221CD416856
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875682; cv=none; b=cB1y+ZIwKZpHXLOOB9Rpz+ruKe8lZ8QxKgboE6i7TPp5fmSK+l+czQkwihGZ9zbQMyEebTcXI3sRIOLifsMnHnroxWYUz/ClyPX4G8xgAwWbkjif6xl4p30roc1exuZD57RTd4kdFYCb2xbo2rK501hCtWRsGg4mnGtTtuCRo8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875682; c=relaxed/simple;
	bh=ZOUUoIgSOYNRh1kmukHuKPa6RYTQ4ZP1M72nJBr9Oew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cdPxJKkC4rQKXLZlUlZrGJKuI7garKgW7//EFRX9hO/7phKzDL+lKynX1dAxTtH26ScLsEQrTmxYWBCuWek0UsTnvd6hlA8U8S4mLLlyu1qo9iV9VdHnWVajXe870oRf0a0sZCerstthN4jZEvQg6259k6CribUmFHnlqcJkr6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7XN7TN3; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7XN7TN3"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-1497f78ebc6so743200c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790875680; x=1791480480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TF47lKOzbiPoHuusFqdrcEwF1pR+p+hIyKAY+xDTuFs=;
        b=i7XN7TN3WYcEGVDQrYOUc//pv4qZh4XJZ6N4H2dzoWn04vRjdz7iV1cWdGL27JXzG5
         P4VeXx44T+jLGjstKZEkkHxUp/QmgnJLjyPK3quukQ6cosCjIc5fZquNiig5h6+VzJ0u
         JuEm/ONkXKLrA74cgCHDrXLwrcPGV97j4+IyuQwSwfzAtzbYh7sFrongCbZCvwEoFcDF
         3X3LfRofaalpm6rgndmOnaErx14O9BOZx5JkgSY5628NRXsEEVbPcpNMrNRSL3jiYbE8
         J+nqpVjVkT5OCejNI4Q76YiBUNL3tGnOn/OVJPNf+25kKOoqJVebr3GuLm7757xnSaIk
         GAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790875680; x=1791480480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF47lKOzbiPoHuusFqdrcEwF1pR+p+hIyKAY+xDTuFs=;
        b=vpISQqW45GHTDqzLmMYeDbe+rawHnRg5fZmFu87Sw0CaLNZaqD2gn1AuBBAw4Bc46W
         H52BGAUrKMUk6WVhAK65qfwmvXQb98AqcJF6U1zlxf/zSC7mvr2y1cLwqP/UDFRj0GPV
         N8Ycvh3s9VtkjNswzwtFdhRCfm65R0oXaA6ZkbeyaRRv7EpAlYYu59FwBsGK+7wCiimw
         /cz6k0goxmfXr91Y3BSf/wf5Qgb95HQLZOUMRZgCQn9yXL904Gknq+nllLResnEwxlng
         rjNL3iNs0mTOII3U71HH7+sUI5+qCzYKppPicLxKvELQ1Ue8h6UXR2W5zmSiIDW7Rq1j
         01Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxZACSkptkRK1Iz8BerM/LL0v4EMMl2AbKR/UhiG4blqWNpI9yGkHaR7RLGRZLztjj8POHoPz3niVgyFHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lkpZwbX6DAy6W65qvQpAQ1LB5V6uKWTwXXmjCbPxav4CbD0R+L
	gUxdRIpBuwA+shLH1Rr/vyHXABFAUqynoOiFVJTOzzyavhYO42o2HHiD
X-Gm-Gg: AYBFou2Y4EsG5XwS2BbcItJgkDRqJ3jhYvUFvC37j0iLkiMokDl6mPp6/BsSNKTCqkE
	04hquB4fqo8ixO3gr4WJxyhNamEV7PVoHZo+6PlZtwq4eKwbjUjQWLWn/GF3RfzecddpYs4snfU
	7DPlhAUE07F6hlnmdeh+VIv3P9NL2ck4tfEHd5ty1mn4OwXapva3Xu+UngsaJUK0AanlswKAyE7
	ijXS8bjbyxmQTq8dSCmWcN9ZiSryK//wGSbY+wURgxwqNcXlURtUSJqqLvyXcMsDVAwpqFypU7M
	iZfLGdrWf56CUKacrlcDwkKsnFXVQ5QteWYVRhnTM4Nb4+b8dsahlY4kY3UIyJMNh9LkEDVjMfE
	zbbMWDEU6yopz8quGWcrfH4qDfrPvAWML4R3H+HbCvZ6Jt1HWUBKFfQNZNQHhL/zWresEuufUof
	hhvBDV5RfLs/CB8WdBm8UwlK+pAGmNhRrbuq8NH0BkjI7b/hv0RwQFaUHqRiKpgvLj5GnuyIoyR
	vLQXIF8iIBd/g==
X-Received: by 2002:a05:701b:4586:20b0:143:2974:bb04 with SMTP id a92af1059eb24-14d331a6ee8mr4881718c88.30.1790875679612;
        Thu, 01 Oct 2026 10:27:59 -0700 (PDT)
Received: from operator.. ([203.194.102.173])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f468c08absm53051c88.8.2026.10.01.10.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:27:59 -0700 (PDT)
From: Ashutosh Yadav <yadavxashutosh@gmail.com>
To: corey@minyard.net
Cc: openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Ashutosh Yadav <yadavxashutosh@gmail.com>
Subject: [PATCH v1] char: ipmi: Replace deprecated strcpy with strscpy
Date: Thu,  1 Oct 2026 22:52:09 +0530
Message-ID: <20261001172209.52028-1-yadavxashutosh@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() has been deprecated because it is generally unsafe and can lead
to buffer overflows. It is actively being removed from the kernel.

In action_op() and preop_op() (and related functions), strings are copied
into fixed-size buffers. Replace the strcpy() calls with strscpy() using
the sizeof() the destination buffers to guarantee NUL-termination and
prevent any potential bounds issues, ensuring compliance with safe string
APIs.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Ashutosh Yadav <yadavxashutosh@gmail.com>
---
 drivers/char/ipmi/ipmi_watchdog.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/char/ipmi/ipmi_watchdog.c
index a013ddbf1466..79d4958df6ef 100644
--- a/drivers/char/ipmi/ipmi_watchdog.c
+++ b/drivers/char/ipmi/ipmi_watchdog.c
@@ -1166,13 +1166,13 @@ static int action_op(const char *inval, char *outval)
 	int rv;
 
 	if (outval)
-		strcpy(outval, action);
+		strscpy(outval, action, sizeof(action));
 
 	if (!inval)
 		return 0;
 	rv = action_op_set_val(inval);
 	if (!rv)
-		strcpy(action, inval);
+		strscpy(action, inval, sizeof(action));
 	return rv;
 }
 
@@ -1198,13 +1198,13 @@ static int preaction_op(const char *inval, char *outval)
 	int rv;
 
 	if (outval)
-		strcpy(outval, preaction);
+		strscpy(outval, preaction, sizeof(preaction));
 
 	if (!inval)
 		return 0;
 	rv = preaction_op_set_val(inval);
 	if (!rv)
-		strcpy(preaction, inval);
+		strscpy(preaction, inval, sizeof(preaction));
 	return 0;
 }
 
@@ -1226,14 +1226,14 @@ static int preop_op(const char *inval, char *outval)
 	int rv;
 
 	if (outval)
-		strcpy(outval, preop);
+		strscpy(outval, preop, sizeof(preop));
 
 	if (!inval)
 		return 0;
 
 	rv = preop_op_set_val(inval);
 	if (!rv)
-		strcpy(preop, inval);
+		strscpy(preop, inval, sizeof(preop));
 	return 0;
 }
 
-- 
2.43.0

