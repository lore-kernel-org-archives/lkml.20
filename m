Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA02E20D4F0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244598; cv=none; b=urqVwxTvgWCqwDDqeaaNsbdyvznYuKqfdl9l3ogsGHtrqf6Pzk3khG09CdtyteGSsx/SH/7iirJH5iPhGJSKqIcbepj3FK2QYzqHotKuFu2yuBG1Xr97zUQGyd3OfgjNHUPPO9aUSpP9tFEjDgZ2m2qr+rCf+qOf3u4MdXuFEWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244598; c=relaxed/simple;
	bh=5ElyCADy86YGx8LmfNKyKR9rlYrYoGai5Bk7t6+Z1uU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1LVYB0iVISgVJ0Mx/eoyvuoPzAO4Ye1XLko5Zl31rMZ1uA83dbB/QfpY3R4aFIpfkPhj7PICFb6Bk0ZSogEXBb/nFDQFkeGpiZLA0dsYN7Ve4Mieune0rnd70ZGKhHv1AqRPl/zrRb0oBp1X7tVC1YNzMHuRjUfjW9fhk/iqqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4BUXm0k; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4BUXm0k"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so3518422a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244596; x=1788849396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYHq+ZU5PMyiId4alqJVSCjs93dNyfWLqqb7EGDh7Zo=;
        b=a4BUXm0khJ3tMsvLHtPNaAregRJaCGoCReO3aeaQKT24194QrsN4zpDjT2FEdA3BTA
         aTRUc6oOrUD8aKT3S4zV75LXt20rQvZ5pwCzQuDbDtsXxakXHZKLCiEc8ZnuSJX03C4Z
         YnJO5IGSlRXOt17NX3o2YrL7WNrHb5KgnjeckVQLszwWeyGfmrcd5Qwz6wRjS5NapIhn
         mxLfkrN30zaEr3MnXhywrgcu6ccoeBqSOCtYCN6DHqp8+rniV/x3juFkDXK+hdmmKP2N
         KNAt+5XmXheGIlXl8m+qsko/VDLUxYwES20HEWFYHjWQyiD5tJrTQDaxndJef1NLh3xZ
         HrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244596; x=1788849396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYHq+ZU5PMyiId4alqJVSCjs93dNyfWLqqb7EGDh7Zo=;
        b=AHujEOBnAif4AkNo2iHTuDWoYw5Bat8XvzIrI7IBqlcqfnJ/m4f8mpIkua6FCbd45H
         CWQCjwErTGZx7+Kllga5WlOGE2ICUKx7B0S6PuMrg4Ely2xFrGAGr613Z+tARbNweoHj
         DGFC+f9p1AmHHOgqwHGDXf1TiCeVtwlcfXEztPlL8LOO3kYVOcW/rJIGqSOzmazWppRx
         CyM+97EpbMmW7FzRbCE9Tu58vPSOGx3kjkFoO5t+L0ORJkwuSGUjXReNNY7BcqogzKKa
         E3PyS7Sp6hh3m6Lgj01ULgPgESvRubCrTpjo9RVUONxx5gIpIWdPz2CBWk1zjHRqSSKm
         eVPg==
X-Forwarded-Encrypted: i=1; AHgh+RpkXVPxPDKy7v8Grq7+Lh8KfcpufF4lpi7wnHACJX99/1jRUMEAF1AbyIk0vbV71sw2/sjrhj+ViMX32vw=@vger.kernel.org
X-Gm-Message-State: AFuF++nOXqlm1dpCV1q4yqoymtc71NeczNCI+Qr3FymUhD8p8saE5Stk
	deA2uyytgvDtWiC8cDP6iyuMuOE5t4Jo1qXsyzno4AU0WHbAQyayZby4
X-Gm-Gg: AR+sD131X/CpXQcsaRdD/nq+bTbr5XwBWB6EjdnWcZ+IVp8IKMktiteRLt3aCtucbDr
	gIGvNEB6raCgpkH4Ln20ofbToRqjeVncSbGUJ+LlQGFy25728K+jdvEtqQQE7ie9VnzVw8mL+El
	Qzjj/9X/sRHJM8LhFeE/56JBmAKR5thNRYnwTOtKQHRUzrWLp0V0XcCEuryzrmGNgQXIBNTq5XR
	Y28IUOy3M9qXEUjRlMOiTaRxMtnS16lTHWB8m5TnTQWH2JSDSKrc+r4TRedE628rdcffx74oZxK
	06paFM6jOfdOUUt1IHNxpCRycktu1KWF4IC6VclzfAmBr0dW2uH5hWAqoJ6MuwhJbxlzrf4/Kme
	ITWw8i24edAZJYXkynlOBjeTXwsu95iFvtdmX3JL6yblmVx2HJ0ZJcg0PBu/52QZHhm24eR4/sO
	xXsgCYiWuf0LFdui1GpOjtJlM6l7dGjOdqnoNgGYFVAT2d2gG4VxRGugVaBlCQ1lSLx9AkuDIQl
	uYnVXRRN61wzw==
X-Received: by 2002:a05:6a20:748b:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3d265a3ec4bmr37708099637.3.1788244595913;
        Mon, 31 Aug 2026 23:36:35 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.192])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm32694425c88.10.2026.08.31.23.36.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 23:36:35 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] HID: hid-lenovo-go: reject unknown calibration action
Date: Tue,  1 Sep 2026 12:06:07 +0530
Message-ID: <0c37a763177a5b8b45e94ac678094165cd965bf1.1788222001.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788222001.git.mradityadash@gmail.com>
References: <cover.1788222001.git.mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calibration action table includes 'unknown' at index zero. The options
attribute skips that entry and lists only 'start' and 'stop', but the store
searches the full table. Writing 'unknown' sends a request without an
action byte.

Reject CAL_UNKNOWN before building the request. Start and Stop both use a
one-byte action, so pass that size directly.

Fixes: 995887a10da1 ("HID: hid-lenovo-go: Add Calibration Settings")
Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 59b457683357..a6dec5490d17 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -1412,20 +1412,18 @@ static ssize_t calibrate_config_store(struct device *dev,
 				      const char *buf, u8 cmd, u8 sub_cmd,
 				      size_t count, enum dev_type device_type)
 {
-	size_t size = 1;
-	u8 val = 0;
+	u8 val;
 	int ret;
 
 	ret = sysfs_match_string(cal_enabled_text, buf);
 	if (ret < 0)
 		return ret;
+	if (ret == CAL_UNKNOWN)
+		return -EINVAL;
 
 	val = ret;
-	if (!val)
-		size = 0;
-
 	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, cmd, sub_cmd,
-			       device_type, &val, size);
+			       device_type, &val, sizeof(val));
 	if (ret < 0)
 		return ret;
 
-- 
2.55.0

