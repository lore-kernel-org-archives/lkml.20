Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856244A4998
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483972; cv=none; b=L4VliSBykKoLYSrC39RSNr3wHuZjiRUGBPz3AL9DpAy8nJXbtc4rVuoWb6DgXgjDLT5acbpgdbs5jJErATnxYL7NYxGGrULlGygFdXZHyDPVWfDdkgAottuzeahYtr+9X8G0g23AgXOglT4IjBQbk2lHHywh8+wk1M/ScgmUkHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483972; c=relaxed/simple;
	bh=YhMG3fUk/XjIoLHujEEjCo8Xx/HTzgB3tQ6DnSl55zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LXVO7QxX41aEiyQtezp2KSpyQEWQX4PhZKwPUrza/fg+pTCHuwz6GvnR2H5ZBAmTHF3g1YYVtuMRJPFMEVPwCi805NHKfgA/AluAKzehVpq0q2xKvayfs2O5XRWmlzPZ2pqgdvU3tJzQmyrh0+Xlh2iL4gmEnTbfxXFCNW0Uo3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSIbLynl; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSIbLynl"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963a787c9so1241289e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789483968; x=1790088768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F87Nj6cbUlhN8QRz95TtuecHNAPdmCP6EjjN+M7wdxM=;
        b=MSIbLynlHZ8B6MpNrb7NQ6YMUvpug/Afg25eeHj/I7tIl0u2A2YF6P03IwZIz9vkKy
         5mdaHLXYsvZzkQ6SeKHbiQig+r2TSywFGB6Zy3nwqyeGrKndSxCjImmcc92bH/bRPpQb
         HF4VDGWwGmFkuO46L+8I5uyTKhI3TkyyQurPuQn+NzThChPDkEwY0QpC+w6bB59mSk0n
         Mfd5h/wD/kV8NipVGntbIy3tbkWgKsSf2KmZ2C/PMdXLLKQIK7XvI/ufyZv7rLSJ5wg0
         JKfjGDSzl91+zO5WiExCBP6QIf+H+ceypuQ4yIrnyPkNzxhDziDTMiesQUH1UtgaZy/N
         sZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483968; x=1790088768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F87Nj6cbUlhN8QRz95TtuecHNAPdmCP6EjjN+M7wdxM=;
        b=ltAjIHgyu/fvgKtv27aImI17fOCKfxswhGNMODuanF6J5E/1rOZxiIh6OwnsR2M5nR
         YWnBX/8uVH4zeTGTL3WngvprJ8tEbvl5VkmlkeP1qdtESZzgNZQ8Sxda5Om4lSxn1a1F
         LoYn7U0rVNFC9RR4yltCA5KZvcw4THJCqywQJ/thQxa8EvLNR/2mjcDip+6FXTC9xjRB
         h/SCX7mBabsFgmxUZUjM2NK5X0vpHXbpGIMmRcPpD0kI4wmShnFben+aXF2MFnkyqGu9
         dfOJ304PmXA6MrfDUYpmk1MQaMd386xyH/IjNNOegCy8nTqnW2w/onvM2OxwyP2kPOn/
         IC8A==
X-Forwarded-Encrypted: i=1; AKwUvByZ5cX/x59hmSTFXIIm4wsiHlRwee5h31XZ0fjxw/WkntKYG3uarC9EnMl/d/HgNza3TiXmSxJrrYeusUU=@vger.kernel.org
X-Gm-Message-State: AFuF++lzKewsLkX91VnIjlv+DC+j4xX0XrFZxYJigbaWhYsGRnHoIgMI
	RVkfyCouKLjl+ZVgtkQXvI8XdH8TSQ1jhXqInLIy2Eq1s2lcxqD4ZKlj
X-Gm-Gg: AYBFou34C1SZ+4gNd3XX076uitY1L5QdieHFkf3MnGoyZWEmJ6i5fbfsF/ls1JK+akZ
	2bqhUkRF1TSbM4G8tDuU4qtIyFw/RYBqVmot03cOo/rDkJZc56uFbbPq5s5yJz03+lcpy4q1QQ7
	UxcuzFVVA6+diFLJMdeTPuVrGQHH6Lc1rDHFIvv+rbQaH+Yeg0o2Nc8lKO1QdGVmgocOrBQAE6M
	SXQ3qPWSCJokkOXzJyi/769qRewyDeLNFIQsgsWugqOhTayO1xC/s0WXO7TVwVakPmWtwD+vgJx
	eiP4ZxMJO9M6uYE9syH0tB4Bky54n3l7iaB9WcLResFPV68fGWwbPnhPnA0W2wLz4PnI9cs7kIy
	qEd8KoWp9g6NO8qiLWygymDAwgbDCpcs0MWoahP0AK7HhI5EZY3L5g+hFozMVISX4nl/R/wtoSM
	KGpukG55iacUVmSauZyorK2/A/u/UqkFUKGsQPTctyi66VLiTkH62Kfo5fn/yakiBo
X-Received: by 2002:a05:6122:4f91:b0:5c6:58df:5826 with SMTP id 71dfb90a1353d-5c981d5fca1mr10648335e0c.5.1789483968151;
        Tue, 15 Sep 2026 07:52:48 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c84714c380sm15063108e0c.15.2026.09.15.07.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:52:47 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v3] HID: wacom: avoid overflows in sequence number tracking
Date: Tue, 15 Sep 2026 11:52:29 -0300
Message-ID: <20260915145229.3036596-1-qwe.aldo@gmail.com>
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
signedness rule, and keep the sequence state and arithmetic in s64. Use
div64_s64() for the remainder to avoid __moddi3 link failures on 32-bit
architectures. This also avoids overflowing value + 1 at the logical
maximum.

Fixes: 359673ea3a20 ("HID: wacom: Support sequence numbers smaller than 16-bit")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---

Changes in v3:
  - Replace raw s64 modulo with div64_s64()-based remainder to avoid
    __moddi3 link failure on 32-bit architectures (i386, arm32).
    Reported by Sashiko AI review.

Changes in v2:
  - Normalize logical_maximum/value as unsigned when logical_minimum >= 0,
    matching HID parser signedness. Store sequence state as s64.
    Fixes unsigned 0..UINT32_MAX range that broke v1.

 drivers/hid/wacom_wac.c | 33 ++++++++++++++++++++++++---------
 drivers/hid/wacom_wac.h |  2 +-
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index da1f0ea856..af94f59a5d 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -7,6 +7,7 @@
 #include "wacom.h"
 #include <linux/input/mt.h>
 #include <linux/jiffies.h>
+#include <linux/math64.h>

 /* resolution for penabled devices */
 #define WACOM_PL_RES		20
@@ -2527,18 +2528,33 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
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
+			drop_count -= div64_s64(drop_count, sequence_size) *
+				      sequence_size;
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
