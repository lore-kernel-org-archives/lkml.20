Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540538237B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201219; cv=none; b=gqE0Gk8ILmljcduFWJIelm2xrX5f2aw/Jb0bd/ULyMBJgPHdd7uvJpofUZC0L5UY4rUJRsPiaovsRyxna5wAxIuWAriuDeRih/oNJSI6C+WBlRrrezGgt5l2Aki+AIfmEuwoFvqnurJwwIvNDErMs8etzHmdQ/0gpdm09ghXl8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201219; c=relaxed/simple;
	bh=03d2guiWqC1X1aeqO35/Sp8MAuCwdb5LIMkIfyXcbdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uR9nhiNtpKkipK6v5R0oZIfDlURjBJ2+vhiJs6qc3FzSX6saO0R4cGW2spV+s/LjVzeBS+NGU4ekxoo9iL6j9WgGk+SF3CVicyztLGnLxEJ8vxBJBwHnKJZul4tObnD9uC1jXZ78ephqJhKj4b27xt5ZRNl2lkof6xs+mHHOVag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V04wgNz0; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V04wgNz0"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso725402eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201212; x=1792806012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ft0AbSsRy9AcaQSCKpocR5zMuQhawmF0bk8dwTnAFcY=;
        b=V04wgNz0yIAxx8EGVx8CPycmVz2ayi9gJRKGke87trcTAEGqZvq9HvOxbYjqzZgiD0
         DC6+tuduQuSMS3XrzVlXDiGcaION0cL+53pbU+0GexB4aF988wy6bHuWePFGXZkabH1z
         tyyOWFUJS1uFOaCE3gIwF8L6LpFSYpTHBTqWfbNc4a/cAnxnu0r3rHY3Fyb0M9oJqrM0
         FIRlJ1dgZJb4VMGHGo64kGeQu8S9MxSbarVhGNNfdM7yFJBJlg8dhSeURHLdbNitwYT+
         /O8QZMcumXWwL6mOI//NHc/0BviRRovWBXtDahGB+TiXDxF2XWSmS5dXpV2A7frb5gLv
         cCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201212; x=1792806012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ft0AbSsRy9AcaQSCKpocR5zMuQhawmF0bk8dwTnAFcY=;
        b=d0pXHkRnvNFyADE8lPMcdnNOa6cI7z6aDtpiK9vaO28Zx9KO9JBMCaojibIfI7thCn
         hx7NYn1JF0Ohj9dEqSfW7lyduHzHgN2cbgh8HeTj/S5q18ro1Nj5H0+fD//aWKkPePay
         +f6eaG0hzjtyHJc7n2E2MHacG5YGulvl99L6X5vsg7JPVrn4aSTUEqFRQUPO5f7mlrx2
         Jht/R1j0p/wAOH/tYkkD2vt0wIErQ75e2ygbs94ugS+7CrmAZPN8NRz0mn7N/XgbHr17
         LTzI+wpFgHIhglWH+/j38XS4kkX8Qj7TlMbyUpTJbOvIESUfvjXNGriyIVQI0AqucqLW
         Ox9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9fjYQTZ2x7AplZ0gISfOXRh71hf5xXJdenSjQ2dyGTJs5VsERDmZdav2tu7QxlXaYzisxBFNfWe6hl1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/o/1TpL8KMpw2PcYizlQzQLxYc/ujhaQuI5iKyq4l9WStyKF1
	SgvJmGC9CqzfAGYGgIyFpGSRGBGJJME93lDj4SF/YoYcQn+DqXGXTFAr
X-Gm-Gg: AYBFou32uZI1ws+8cA5jIFCTV3VmaVPPdaVN6ra8HTK4yUkxCgEFPJTdFKn3EWnblOU
	IzRXq0o/3d4Psrir6/YOITe3O8BmowaGoPQmIPiH8NHf8zD8Xi/INtMjSC88uOfIiQG9h4W3REM
	uEfkvJ6El5z+POVkljmmldj4h1GjZTBm07tGyKU8+NnssU56LthReALGHG4l3r4TJQ33X/6hYh/
	9MTdrWMfhF9yLiWeK2QvVF8RaUTZiKoSmWFmQb8qXlJWIVFyPRRiQ2Ifdou1PotLg7KX83mghdl
	jXk1iYu0x1nP1fTPSu0G9cCYSzvotU+Ws9G1NxWj5EuI1fSlF3BYlhSBe2cVGETQ/fQXbQKFlyz
	bxjphumg87h+T4AFl6Jj6O2VdXior0P9MCGK+64KIgj5y3SnRe8aHVeSfTfpAAgXxhdNotTBNTq
	OSTOV+BXjs3x2NIOotNu/n2fBEgzdNrbl2TWmqNRIPoZ8XoMvJAU4TE4A7I6IWb0Clm0ASc3ZFT
	OVWZlTLhpPnNUGII+usHlT6n+heiwnob2fSumSVgh8ynYgLtlHE7nL36yEPCfjN2GBfBTl9SzI=
X-Received: by 2002:a05:7022:ea8c:b0:151:2e62:fe6d with SMTP id a92af1059eb24-1851238aed8mr1925843c88.22.1792201211913;
        Fri, 16 Oct 2026 18:40:11 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm12128429c88.13.2026.10.16.18.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:40:11 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH v2 05/11] HID: hid-lenovo-go-s: Add kobject_uevent notify during reset-resume
Date: Fri, 16 Oct 2026 18:39:50 -0700
Message-ID: <20261017013956.2440130-6-derekjohn.clark@gmail.com>
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

Adds kobject_uevent notification after setting os_mode attribute on resume.

Fixes: 3524900cc571bd922a ("HID: hid-lenovo-go-s: restore OS_TYPE after resume from s2idle")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index a16733edad5d..ed08200e3571 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1471,6 +1471,7 @@ static int hid_gos_cfg_reset_resume(struct hid_device *hdev)
 	if (drvdata.os_mode != os_mode)
 		return -ENODEV;
 
+	kobject_uevent(&drvdata.hdev->dev.kobj, KOBJ_CHANGE);
 	return 0;
 }
 
-- 
2.55.0

