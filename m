Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833396;
	b=i8/sq7OxzWqNt+OOMHuTp7C+C6spPALl0vpg1C/aBaRI7YRKQOBM6gh2wX0WAeF5paaV
	 J/iUhQOV0X1QeEHyBulfJQgSpw1ZNYnrskIH+Kq9HwkwByk9hobkq+oIkvwWXJkK22CjI
	 PGxJEMgUKZSTywZRjemeIliQwQ3s1xqgK8pOkTzPp6MIUOLtCbR3G1XksWy6wpa4TfFly
	 1k+GXXsqfQU1bcWTXTeFmvHq3JkIWqT79QZ6rU4YT/bryQbL8tALkbe/d7e4ayryeEcp1
	 yoO8n76/aHsXleckBv4oVLGA2BLC1RO2asag9IdeKi4gorJW4Xvje5LfjHW/GFTquWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JheZtoBiAYlT2jI3FTLiO1Qwu06oef/SS/C/KJIK8ZU=;
	b=SLvLGr71FpfZd+lS+gwTITmhaNMXtVt6hVmOy3CFODWD4do88/hYEXrsj4g/HvL9dQBt
	 xAu8ZBxTkAO70CgPjgixuTGcVy9DbLp7bgJDjWMEizstxAp7cg92KS6CnsocAB1XdXvIp
	 wU+XAZ/iZnv0bB3MZKduBINAp50XGjEMoP2oiXXf0UwI4mjrVu3OrMPrKcIgVq7ETMA/A
	 7Z+YYDFO+RAdxcLeVhEFZkz7SqRWu7ZrxvznUeBFIHJO9ykME5j4Qw1PPjugmU7QBUaLl
	 UVrzYkvcdB4XG+Wk0uoMv8MXMhvUZ+3WXcU5gRQdRPwbN2qpFmiu1CqzSeRuF7Gix8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AKXjinT/";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B97606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B97606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKXjinT/
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e977109392so7839315ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833395; x=1794438195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JheZtoBiAYlT2jI3FTLiO1Qwu06oef/SS/C/KJIK8ZU=;
        b=AKXjinT/IN5dD5KMqtpAd7333JAl3cBRxVNNUV9bfOv8vfwHlpgfWk5PMA+/JD1e4p
         +fA9BsO1qv/htHJQCmT+1DgSoC34T8r44cXwHiQr6EgrO3oHxZdAtsFMcCVMYQa3tx0S
         tcfctxGODhB1X28MBjHezcAgQbg3B25t0Nb1wdKZN5Xxcnme4YYY1wZrjZhD7U9PP3Q0
         c2xJjv/vqAZpXoAsGBHmXQkS4aBwEaasUSjKvr8XS1wBTJosuAl4RqX4e8y36hurQuUX
         lgnhyGauV5OofxoEtwW0/9272B15PYvaNsF1u3cI71j/ZO5Lb0wSEsf0YTCijjcD+bUu
         3dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833395; x=1794438195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JheZtoBiAYlT2jI3FTLiO1Qwu06oef/SS/C/KJIK8ZU=;
        b=wRqVQXgOoMcyGl1jpjG8eOnclv84QiCte3WNsFz6r0nx3YP++W5ywGXsQjfCnrHYwk
         mMCt/z11lXSV+rdCMlMjnATKFs9tzrgWu/tt3iVniuyeJksqL8tlnLnugxsqkqw3YErN
         EVtVRQFiIkDp9Y3z60yJ4X9JcGaMehDvWK8DqxyJCXoFE+Q5r3A992Ao76D0dU4KdaJO
         T7wFyf2RzXwmWR8mCq0O9teBidnSQYnWQJyKiLDt4t9wKIAbmVIDJw0++7/MiSATJXyL
         v4t8aVx/efazqo8R/JqMvHpF+LFn2QpJZeU3n9yEB1ksSs+F0cCwXMSjk2LXzoeZS1Ht
         k4Mw==
X-Forwarded-Encrypted: i=1; AKwUvBzBvUaJ2Xazbj9YkT8oG928ajU9oH/q4LXj2l+psQHc6XXLw0LK3siHOIa1grpFXI+EIYe8UNDaRwKZITw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SZXUVImxRnpWmBcDw8AcXp3cOHiDfoEPsi89MUKpl5YzyJpSk
	lOjFsGyLEViuw08YmgEEzXPuIYQSTFHVf3o81EYh35Y5ZrtLOPKac8Vruu/rA9Up
X-Gm-Gg: AYBFou2sG6SSqYcJVtL+a1bQUgAWkqg7btggA3K6L7psZ7CFjqnp4bPZ8lJBrMJCa83
	PTv/gCWesMxVdmqPoMzBwXseB0pefKrBwTf2WqFpLiEARfR0Kr5e03L13WZ6arMQpTfE/UG6iJf
	RoT8sXQ/MjdNEOvx9Ay0oqTodrxdRgmu562pl6vy3OVPQ4N7TELeeJToeGajy6/wo7a9yyDJ7IH
	KlJ5AoYP9XtbpV0Pxl/xVe9QAa29eOYUO+ISSdY6nW06gEb4yDojOBghZ4Kd79qXW00Uot8vaYt
	2e1EO/oH0MQzvgaOzVLFMkzf78nSf/tTO3DCTv+2K3hi1Uyv/XjeZxNQb93zbx2DbkKhCchLFhP
	ymZCsZafGbZ+4ABkY8kc/zK+ZT7m5kuTCrDnzJOLTxlLRrEZnQDUuxHfLRlqEb+Jztb9hkbwL1t
	fZT/Ty/ZFp/tfYHq7CTQn2+5pfUWJQ+/tjBQ+Gn8Y7ma5/n6LUgsUBUZwDZI3Iso6/XC8tCM+yb
	P7VK+VD6PcBIrUyFuvjziUfgtYr65CF+keNpkt4/GE4JWp2SuYF00iA0qb7AxrTcYwvIiM9E3L8
	C/n/oLwYIp3hiKuqHcY3/YrJnio7tQ==
X-Received: by 2002:a17:902:d510:b0:2ea:1b9b:b938 with SMTP id d9443c01a7336-2eb364852abmr160514515ad.55.1793833395260;
        Wed, 04 Nov 2026 15:03:15 -0800 (PST)
Received: from cxlqual.. ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0908587dsm10999175ad.36.2026.11.04.15.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:03:14 -0800 (PST)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>,
	Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>,
	Anisa Su <anisa.su@samsung.com>
Subject: [PATCH v1 13/14] cxl/mem: Trace Dynamic capacity Event Record
Date: Thu,  5 Nov 2026 08:02:37 +0900
Message-ID: <20261104230445.66625-14-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104230445.66625-1-anisa.su@samsung.com>
References: <20261104230445.66625-1-anisa.su@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <iweiny@kernel.org>

CXL r4.0 section 8.2.10.2.1.6 defines the Dynamic Capacity Event Record.
User space can use trace events for debugging of DC capacity changes.

Add DC trace points to the trace log.

Based on an original patch by Navneet Singh.

Signed-off-by: Ira Weiny <iweiny@kernel.org>
Co-developed-by: Anisa Su <anisa.su@samsung.com>
Signed-off-by: Anisa Su <anisa.su@samsung.com>
Tested-by: Wonjae Lee <wj28.lee@samsung.com>
Tested-by: Junhee Park <jh9934.park@samsung.com>
Tested-by: Heesoo Kim <habil.kim@samsung.com>
---
 drivers/cxl/core/mbox.c  |  4 +++
 drivers/cxl/core/trace.h | 76 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
index a18b41ff5d23..c60c10d7bd31 100644
--- a/drivers/cxl/core/mbox.c
+++ b/drivers/cxl/core/mbox.c
@@ -1041,6 +1041,10 @@ static void __cxl_event_trace_record(struct cxl_memdev *cxlmd,
 		ev_type = CXL_CPER_EVENT_MEM_MODULE;
 	else if (uuid_equal(uuid, &CXL_EVENT_MEM_SPARING_UUID))
 		ev_type = CXL_CPER_EVENT_MEM_SPARING;
+	else if (uuid_equal(uuid, &CXL_EVENT_DC_EVENT_UUID)) {
+		trace_cxl_dynamic_capacity(cxlmd, type, &record->event.dcd);
+		return;
+	}
 
 	cxl_event_trace_record(cxlmd, type, ev_type, uuid, &record->event);
 }
diff --git a/drivers/cxl/core/trace.h b/drivers/cxl/core/trace.h
index 64c6ce0878e2..d7b237203bb5 100644
--- a/drivers/cxl/core/trace.h
+++ b/drivers/cxl/core/trace.h
@@ -1108,6 +1108,82 @@ TRACE_EVENT(cxl_poison,
 	)
 );
 
+/*
+ * Dynamic Capacity Event Record - DER
+ *
+ * CXL r4.0 section 8.2.10.2.1.6 Table 8-229
+ */
+
+TRACE_DEFINE_ENUM(DCD_ADD_CAPACITY);
+TRACE_DEFINE_ENUM(DCD_RELEASE_CAPACITY);
+TRACE_DEFINE_ENUM(DCD_FORCED_CAPACITY_RELEASE);
+TRACE_DEFINE_ENUM(DCD_REGION_CONFIGURATION_UPDATED);
+
+#define show_dc_evt_type(type)	__print_symbolic(type,				\
+	{ DCD_ADD_CAPACITY,			"Add capacity" },		\
+	{ DCD_RELEASE_CAPACITY,			"Release capacity" },		\
+	{ DCD_FORCED_CAPACITY_RELEASE,		"Forced capacity release" },	\
+	{ DCD_REGION_CONFIGURATION_UPDATED,	"Region Configuration Updated" } \
+)
+
+TRACE_EVENT(cxl_dynamic_capacity,
+
+	TP_PROTO(const struct cxl_memdev *cxlmd, enum cxl_event_log_type log,
+		 struct cxl_event_dcd *rec),
+
+	TP_ARGS(cxlmd, log, rec),
+
+	TP_STRUCT__entry(
+		CXL_EVT_TP_entry
+
+		/* Dynamic capacity Event */
+		__field(u8, event_type)
+		__field(u16, hostid)
+		__field(u8, updated_region_index)
+		__field(u64, dpa_start)
+		__field(u64, length)
+		__array(u8, uuid, UUID_SIZE)
+		__field(u16, sh_extent_seq)
+	),
+
+	TP_fast_assign(
+		CXL_EVT_TP_fast_assign(cxlmd, log, rec->hdr);
+		__entry->hdr_uuid = CXL_EVENT_DC_EVENT_UUID;
+
+		/* Dynamic_capacity Event */
+		__entry->event_type = rec->event_type;
+
+		/* DCD event record data */
+		__entry->hostid = le16_to_cpu(rec->host_id);
+		/*
+		 * The Updated Region Index is only defined for Region
+		 * Configuration Updated events (Table 8-229); report U8_MAX
+		 * (not a valid index) for other event types where the field
+		 * is reserved.
+		 */
+		if (rec->event_type == DCD_REGION_CONFIGURATION_UPDATED)
+			__entry->updated_region_index = rec->updated_region_index;
+		else
+			__entry->updated_region_index = U8_MAX;
+		__entry->dpa_start = le64_to_cpu(rec->extent.start_dpa);
+		__entry->length = le64_to_cpu(rec->extent.length);
+		memcpy(__entry->uuid, &rec->extent.uuid, UUID_SIZE);
+		__entry->sh_extent_seq = le16_to_cpu(rec->extent.shared_extn_seq);
+	),
+
+	CXL_EVT_TP_printk("event_type='%s' host_id='%d' updated_region_index='%d' " \
+		"starting_dpa=%llx length=%llx tag=%pU " \
+		"shared_extent_sequence=%d",
+		show_dc_evt_type(__entry->event_type),
+		__entry->hostid,
+		__entry->updated_region_index,
+		__entry->dpa_start,
+		__entry->length,
+		__entry->uuid,
+		__entry->sh_extent_seq
+	)
+);
+
 #endif /* _CXL_EVENTS_H */
 
 #define TRACE_INCLUDE_FILE trace
-- 
2.43.0

