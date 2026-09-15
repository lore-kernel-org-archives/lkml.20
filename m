Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4342841A574
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470900; cv=none; b=Dx0gRgHoHvnOKMUen9O5SDNXpsKMTVznJ9omwO0NfMU0f5JzR9dpmehZn2T2QD+VUZvIes2vsn0hh+gnJGgAEhtdcWcvOKl8PaUWnzEzR5SzPrx7dawTdMFFvyFPvSEj7N5YfZEW08g8HX/hZs/G/Z48xqOggs9obt7gW4URsFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470900; c=relaxed/simple;
	bh=5AHgHgB6VH4XZX3hvyx2pZkcJi0cNjv4poJfNW/ay0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fna5z85dAscbAdamYnLrnmQ4skBTlrEGGTgMBNahFfMFjbRViVZdvSTWk4u/+72iGa0p/KWrnD4c9OJjsNLuLfLoinzMvpoNbIaQJ+WV7v01hQYSw+69cLsEy5TiqZqhLBKjNqaKnelqeJZuMfAgGeysxdo52xsSwgpDcZRNhuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbY9B1GQ; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbY9B1GQ"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c979c5eca8so107861e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789470898; x=1790075698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCdw27tCyzyXJY8Xvi6GCDTblnDPWCBRkFu5Pb3g100=;
        b=sbY9B1GQAYWt8J0WtYrDr8cwkrGAD5VL1ltK8gS8fIhdf7VyzejtTmqUuNeo7bV5/7
         UAjFx7+JO/GJH/T8+VfFFfga+6EReTR2lSOiKodaPLlfKw/82vJvEjKRqNzavpvrvfC3
         S/M73QmH18u61P1/njNb2yzsttBwPonQRr4WxT4GKZ/RNp/V7vaI+AfecPqSf0osGUUV
         OJDQ9/L41LEkbs4mQd2AY6jXC1qKYMWLSv5O/AT2MtSWFvRPwmjOHBIIodjftlI1u7Zl
         muTV86X989k5PtV32bv0LTTnCYyIX8HWgADRewgghUCO+IHphgXVCOLDZ+96QsTP7UTQ
         UwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789470898; x=1790075698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCdw27tCyzyXJY8Xvi6GCDTblnDPWCBRkFu5Pb3g100=;
        b=IMdEpZJlxjzJOoF7HOcO/Gx5rJDhMRsui/JjlE8yGr9sTptqpWsSvRz7Bi2IAOomYK
         BJGTYyJnai83IkMHVyeUtW9dm1NbL2F8lR9b/xZWe1gAzUuj+N9nrYKiA4t3QDsr/ktw
         Q2rXzl8sQYuQBD5tARRYqe9e0Syz2stDy+JGbttvAHg6xP/kbeFIxo3C5Jen5S+oZvyH
         xRZKU8VWYPfa8bbwCYS+JVsZdz6eonGDmWCU0TtetBTpDysldJUfgZ3/CwjTCTyBS54P
         6kYPrTwiDNOjZhPrvI8PFvdfEVZBjrEyFt9Wf9tP5nSCIC+ShapaS2czPjy0XsqAzPIA
         Da8w==
X-Forwarded-Encrypted: i=1; AKwUvBwB6asxhVb6NqcHq5xr/DPUOQDHG3CC3TxfblRAWOE64Wwioy/QfNhx4UdQ2uRDJBvE0znqDLmuaXLOxYM=@vger.kernel.org
X-Gm-Message-State: AFuF++mHy7A3lyGyBwez7wen+9U0Uzm3/PhaNUbrHmL2LUJXnPAd+JBI
	YUey1ne4t/D53kVrfidZvLTvurfssQ8UhqklJ7oXMLZ/AHd2SGTNVKXN
X-Gm-Gg: AYBFou1vo0i0uV+4WSzAFPrBERntDUXuwl1p1v8sRFfxBBLcuv1jucFkKQQwJSaShNn
	xCjKcWGhDGclS99VL9EJ6OisLtk6x++Q+9H5foBQ+eiuHy6/9JJ5FQgf1Um2LvbT8SyefCOddQH
	V7fNkl3R7tjGaK03J6/SFdcrWnv4ZHV8ZaZGrBr6DvfQyQNhUTpTsRM7IhtB+pMT9cqvdEULURr
	+g97bsuUr/E+KMOFKcGkVlh/jCuN5FJ7X+mzVxs+uCTZP3kfh0SdOLml+riyzaZUbtmaJtfhrto
	vVvy+jzLaQb+L6PK0AIjxBdXNXOsyX+VAn3peaXZM1Gb6Pge7EDxUKMPEBtMeb4DK9twIE0T3qz
	0yqJF88ov3k/8rxDgblaFbILE36nXh9BwgKkt0nieGj5N63QnSfO6BFOL0Kxji5IiYAJsa5ZX51
	xL55aSWIGOHfU6w9Kwjl+hng3oXlSVJ6Xru4F2TDewrubFWdQ5WyxCtmy0GQPULMWO
X-Received: by 2002:a05:6122:1d93:b0:5bd:a5e1:c7c7 with SMTP id 71dfb90a1353d-5c99393b389mr389978e0c.1.1789470897998;
        Tue, 15 Sep 2026 04:14:57 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c99149d764sm739548e0c.3.2026.09.15.04.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:14:57 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] HID: wacom: avoid overflows in sequence number tracking
Date: Tue, 15 Sep 2026 08:14:47 -0300
Message-ID: <20260915111448.2726869-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dropped-packet calculation derives the sequence range in signed
int arithmetic. A sequence field whose logical range spans all signed
32-bit values makes the range calculation wrap to zero, so the following
modulo triggers a divide exception.

Do the range and delta calculations in s64, and normalize the delta after
the modulo. Also avoid overflowing value + 1 when the received value is at
the logical maximum.

Fixes: 359673ea3a20 ("HID: wacom: Support sequence numbers smaller than 16-bit")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/hid/wacom_wac.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index da1f0ea856..39ffe5e7c7 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2530,13 +2530,21 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 	case WACOM_HID_WD_SEQUENCENUMBER:
 		if (wacom_wac->hid_data.sequence_number != value &&
 		    wacom_wac->hid_data.sequence_number >= 0) {
-			int sequence_size = field->logical_maximum - field->logical_minimum + 1;
-			int drop_count = (value - wacom_wac->hid_data.sequence_number) % sequence_size;
-			hid_warn(hdev, "Dropped %d packets", drop_count);
+			s64 sequence_size = (s64)field->logical_maximum -
+					    field->logical_minimum + 1;
+			s64 drop_count = (s64)value -
+					 wacom_wac->hid_data.sequence_number;
+
+			drop_count %= sequence_size;
+			if (drop_count < 0)
+				drop_count += sequence_size;
+			hid_warn(hdev, "Dropped %lld packets",
+				 (long long)drop_count);
 		}
-		wacom_wac->hid_data.sequence_number = value + 1;
-		if (wacom_wac->hid_data.sequence_number > field->logical_maximum)
+		if (value >= field->logical_maximum)
 			wacom_wac->hid_data.sequence_number = field->logical_minimum;
+		else
+			wacom_wac->hid_data.sequence_number = value + 1;
 		return;
 	}
 
-- 
2.43.0

