Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7238A71F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481801; cv=none; b=SbDhLuN+r2Z/fTJVyoNJBD/ZVqQh4I18a55zBgBEmRiduPOiDh8Y+Q/0uH/+j+y8Nyi5Im+hbDjuB+cWRxDVrpKSdEXRfEzRB5xJARbLtqNZYzEH24TqBADM5gXQPVpZHed32ysXbGQfVYLcKwtTzGoj2TUcG/bq/pz2376AyGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481801; c=relaxed/simple;
	bh=ZGcIqnBUb+2WGa9UWiN5MGaIiQ5CNl6v15OMyE1yvh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzlfwWqDvi/qb6tzuPhvCncnigAzGd92b0j8n+2qMVMwGtBqQTkOjMYo3dkQt07In9CsNOj/QIc9jMU8BoLx3jWx+//n7o10se43ua0JJXzxQWvwupmNb+Poq8vGP/LZxACxtBaI3xVQ8xnkB7dvjsnyaSnZStYcsToMp2ojYHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyN+53+N; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyN+53+N"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e53002bso220779e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481799; x=1790086599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vy7TxtxABNySXdH9M9RGQIeskiOhNozoxbsdlpLAGo=;
        b=fyN+53+Ns8gVbQXCSiWXtU3xLEoKpYUpkgHEuasxSFQdXn7rf2kzpE6YzCF2XG5hvv
         ar/hc/B/BPjE01V0SciseYaJ7FFqbtuvDsdkIULMtDTBFk2aymkM0eVpLBC8w+5emlp4
         6juWNPduSJKv2JARdQsaoVkNEzPV/WSvZULv/Wu0ruxDXT/JGnoX/gV+HhqDolZgQhs1
         K1EI//wTi6vIRtwxvD74qd6LNHFsdgq7l1f3hBK1cvUqSshR/2ZLz5v2JTcmOwhuptm6
         7t6KfN9loGEp2DTeF8V3HERTvfZt49Pt/eSqGl1zX39e2W7Yhm/GqvuqTxC76pfKZIx3
         fmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481799; x=1790086599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vy7TxtxABNySXdH9M9RGQIeskiOhNozoxbsdlpLAGo=;
        b=y3Be6X+gvMKuwVOP+6oWDUlWtrfVqk9hoUU29uTWdJ8WSzqOKTLzfFrXCm6axTpjXo
         uOx4V/ZY/xJL7nwppGg/+0Qh8CIAlz75zmSrq93TdOSugyvN4CMIXHvEbO9nm21ULzvF
         9RBIEh7SUxpaLAfOJVvVrxtoLKhMbkIkavbWaKTXSVnMl4LS3VM+/Q2dnm0jjHTFU32v
         grjlihBVt+Odmm7A1K5nyxBJ9vtkr8oJIEPN6YgcSNbbfKnGCYBe7U8CH5EJMYs4pnkN
         viiBe5XERWKXJUkBDie5F7AiNNLGgv705jsVKyWcJzK8lV548S+L6ib/VdcWsD5wXoZx
         wOfQ==
X-Forwarded-Encrypted: i=1; AKwUvBy++RVGfZP7RrlKV7CY/5MIkWaFcAfqSWluu1/4DHIwm+Ufu10BoZpEA551kRBFDrlkcNZz+PgEJrLAMfM=@vger.kernel.org
X-Gm-Message-State: AFuF++kniQy1UuvC6lhrL9fqmWDYRx0JYsurVVhDrjsKNmxrn0Nw5b/p
	u5am1fTnJSCvsPvPDnAtt3Wus6wISDDCbiNUfkCFlJMTRuWew8ZHvQQ/
X-Gm-Gg: AYBFou3gQYjIjL690jOXH3UfPxIp/2D9/V9il4comQuStMunhX/6A7mXwgBjASVGFK5
	imZ5KqNq6OXoB9lokCQ7nejBiW83bgWWpT6bBDlLlWX5b4DhTRB+ufcKFOkSbq74H/P0zRUqwFn
	fCVIt2WfkqCUGhueMQQbZDv5CJRguuBahqmPGTjRILqUPrKcjtFqmAc2nfgny213PiLKHKxjFlN
	VjxCBA5ihNP47jcKczpzvsQLhOep3yEzYZ+KaG72uUdeYoBrWTzX/ErX6al9B+Y+xW1AYqLrjG8
	zh+G9SBG2r53BYkSif3Z99DG/j/4ZlhK7vyMZ2ZzA5WVw2kvaEjsgH6FFAD9NgMHgqvgWdxrtu6
	OvJsMaLMNS/J+H0f7UT9igMaGgQBqLS7Nt4b+QJjVZRfvaFGgzBOzJNylL+X2b63rQqOZPNyQ5p
	iGQPpokl4CT1E5mQSj55tLCDHSqJercQwt8G5o0AwfDIAYBUpTfkzHI6Yhql0M5dI+
X-Received: by 2002:a05:6122:3402:b0:5c8:228:5ea6 with SMTP id 71dfb90a1353d-5c993acb5b3mr2115305e0c.5.1789481796316;
        Tue, 15 Sep 2026 07:16:36 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470d661bsm15018810e0c.8.2026.09.15.07.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:16:35 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v2] HID: wacom: avoid overflows in sequence number tracking
Date: Tue, 15 Sep 2026 11:16:21 -0300
Message-ID: <20260915141621.3011011-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915111448.2726869-1-qwe.aldo@gmail.com>
References: <20260915111448.2726869-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dropped-packet calculation derives the sequence range in signed int
arithmetic. A sequence field whose logical range spans all 32-bit values
makes the range calculation wrap to zero, so the following modulo triggers
a divide exception.

Normalize the maximum and current value according to the HID parser's
signedness rule, and keep the sequence state and arithmetic in s64. This
also avoids overflowing value + 1 at the logical maximum.

Fixes: 359673ea3a20 ("HID: wacom: Support sequence numbers smaller than 16-bit")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/hid/wacom_wac.c | 32 ++++++++++++++++++++++++--------
 drivers/hid/wacom_wac.h |  2 +-
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index da1f0ea856..428ac7077a 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2527,18 +2527,34 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 	case WACOM_HID_WD_BARRELSWITCH3:
 		wacom_wac->hid_data.barrelswitch3 = value;
 		return;
-	case WACOM_HID_WD_SEQUENCENUMBER:
-		if (wacom_wac->hid_data.sequence_number != value &&
+	case WACOM_HID_WD_SEQUENCENUMBER: {
+		s64 sequence_minimum = field->logical_minimum;
+		s64 sequence_maximum = sequence_minimum < 0 ?
+			(s64)field->logical_maximum :
+			(s64)(u32)field->logical_maximum;
+		s64 sequence_value = sequence_minimum < 0 ?
+			(s64)value : (s64)(u32)value;
+
+		if (wacom_wac->hid_data.sequence_number != sequence_value &&
 		    wacom_wac->hid_data.sequence_number >= 0) {
-			int sequence_size = field->logical_maximum - field->logical_minimum + 1;
-			int drop_count = (value - wacom_wac->hid_data.sequence_number) % sequence_size;
-			hid_warn(hdev, "Dropped %d packets", drop_count);
+			s64 sequence_size = sequence_maximum -
+					    sequence_minimum + 1;
+			s64 drop_count = sequence_value -
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
-			wacom_wac->hid_data.sequence_number = field->logical_minimum;
+		if (sequence_value >= sequence_maximum)
+			wacom_wac->hid_data.sequence_number = sequence_minimum;
+		else
+			wacom_wac->hid_data.sequence_number = sequence_value + 1;
 		return;
 	}
+	}
 
 	/* send pen events only when touch is up or forced out
 	 * or touch arbitration is off
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 126bec6e5c..74e7c5a04a 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -324,7 +324,7 @@ struct hid_data {
 	int bat_connected;
 	int ps_connected;
 	bool pad_input_event_flag;
-	int sequence_number;
+	s64 sequence_number;
 	ktime_t time_delayed;
 };
 
-- 
2.43.0

