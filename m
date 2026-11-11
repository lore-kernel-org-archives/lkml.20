Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380217;
	b=3WiD8Nv+w/rbu8sJbARG//SiTiO9P00pGlLeQ5pfBx7FdwBICzMwdAd/CPEnMaxNuGRk
	 AKh41y3FWadP/GwV6z4CTZqUDTLIl257OR7MMaNEssqTq7QLh5uV/wM9mExTK8TL+t4tp
	 W7yjuIfXuPJE/U/f+aBsmZbvZzyIIjT04hkzwns3IM+F6h6oB9UMGUlUNWYA6PRmQQ9Vt
	 xl80aBWBoRdRowadUTcOvQyM/0804K+nTm4EIie3vEWOvnLkfQk9qDlpX10DJLsLNOHAJ
	 l6e/UxU83izWH6bpb643rClKGUZNG0DQE0t2wA8kXkBbemMVldNCf1wEqZ0hB+CIqFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=m/vebEqz2w6ZNJzMJ8e2xDVPOuO4IxFjt3QmRcF/LLM=;
	b=JZ3frWec5rvU9x4Gksobj5FU7AA6fAaih2VQmTj4uiH7t04yGdMMJV7v7OOym/M0njfs
	 WGJO5u0cgT0hKy80CkqlsniooxcpfhwL3HM9hlI1251ZQvRWzo5zd4RH9/6tu1HUdIvbJ
	 7/SuTvOUFauD2taCnnE6+XnJ68elNt3WdWUWVyyI5O4s/BElrhbOG3OS5447aQ/eV2Zy4
	 fLG//VCRI+7h6MBwuxaf9XJ64yMl31eUcTgDVDWQUs1Fgvwh/DOceTxL5LE72Ke95pvnG
	 5gk8RLxJfDiyE7z21umEB/0+zwMbBiqIAFaFVcNsIQb26RC96VFk0HnGlJGGyRrykhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKx1Ujs+;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC25760A3806
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC25760A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKx1Ujs+
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so4048150c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380216; x=1794985016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/vebEqz2w6ZNJzMJ8e2xDVPOuO4IxFjt3QmRcF/LLM=;
        b=nKx1Ujs+5U1U8X1mi/BAefWZ1Ed9hrAxnXhUkKRxKzFhf//RP4PgBTl87RTX2WJYYl
         qiOJjWmLEuNVM3d34h3DzJxnCxhVGXnil0EGoTFl7EZLM+3dFMgM7hLBb7jQbUp6ZyPD
         Voc97HjOvRto13OOdSgSTboy2ze5lcpi4llXPbUa4qo8jYYsOxaFfTTZg9LZPjQ2hAiE
         Gw4TON+4roUGO/ztIDqEeDArKoK92RkCsDRwQ0nfnyBnGiFWvaou1MvwdPLeAA6ooUf6
         DeDgdECepcSblz4SrPGBWVKOVeR2o09j0gJ1WrRyNq57kP82YF41GGXb4eBPZHMBZuaW
         NLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380216; x=1794985016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/vebEqz2w6ZNJzMJ8e2xDVPOuO4IxFjt3QmRcF/LLM=;
        b=WjL17mR5rWPQ+bk3RD+lECFgQFEjZdMM6J2R/xVRUu1cabAWriDrrG87tFrIrRQDJx
         EucDF1hJcMNe8NC0AL6kvBsr/tKGCkaP6hlZWehKGyLRJCuJc47cCUR1jiix88w3dWBw
         ga0IDaRm8Gy/39HRRFdntiR/TnuKOX1fO3ZCaARhCUlWWW9IJaPpHNetAFwlT0/pPGEY
         QSP/DqnhFAXu/Rvf0APg6sA0FiVmsPc2QoGTO4Jr3FOTKoFjL4j5ZpxK+clemJuVHIRd
         PJjpUFWexj/ZgIvmeP7Vj3kh42J08xo7YtImeow7Poj9wJKzFDZAYLz8wt2f0LqMOUau
         yTGw==
X-Forwarded-Encrypted: i=1; AL+hErHUSjiPZURZTLrG+Qt6G//q8n75er7RwueRN6KHyU275mnEoo3PD1B+71DlgEgbaD2M2FJkDdBjQSN16Ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YttuQTXULPZxulkPBoacTs30OGKDkpqYsJKMOQh0MNuRRnlAL
	SVqyRsl6umaALCbL2B5uo8KAXn31NtjXfNwAI+WLz5PZaxkkygvFIBCh
X-Gm-Gg: AYBFou0T/ZXtjZojzgngRIX+hkzNG2A1iCtk9S+/KVYS50u0iKQWZWTFspjNWQ1WoEB
	8VmZrB5Ec0F4qRllsCgYla53uW80vRRj2ixl/u3nfM34y6E6wwKQ3DsWOp8JvOEotyxbGeCnUNW
	kKhFySjvzv5pGw4jgcWd6HyHJgkm48WC//38n0xm2Z599wcTaR9gvgtuXU8ic6JqTdXSODDD8Y3
	TwZxMqeJw6MSsRI3CDVrJ1Wx7kys7nVvA17BZuQMw/hMUlj2CvAYrEsssIQsrC0ES/LaGp8ViSR
	lZsL7QYe3PI9c1qJepy4foDxoxRbklZN6qMu6MnDCrSjCGT1MnCvNtBdFmxivgeJBrtB4F72RSy
	dmYWoBn0m7olrLRZGIVKyvmANXbfWXZbT6kBbToiRS+gBC5hsRItKIBEtHjT8qbpHk9S/lb0M2+
	kR4Y0DMyWhK9gFjryzwMsVZkO+15cND/ipr9A89XtkgpcZVsm9nzwRBE2z3FBDCnuXWG2gK+9/X
	iSFEqcmhHZ61h9KIdLdCFOmXcpjoLFPFX31dPZqzMguLLjbTGEsqBbK1CGsXxd0WOds135+mdUb
	E2+ZfYZXiFBbwyzHRL5GSN+OnyNrkNra6iQeMFJuIqKBbl5JXh2gM0lSlM1VDH2p6U420NSWy+y
	os4fZfk7s38Yo3JDHTy7AwZXPTmxrbk9wINvOm4w=
X-Received: by 2002:a05:7022:1706:b0:151:d6e5:596b with SMTP id a92af1059eb24-1b3c02ec796mr1384328c88.9.1794380216020;
        Tue, 10 Nov 2026 22:56:56 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:55 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:19 -0800
Subject: [PATCH v2 21/33] HID: logitech-hidpp: execute G920 range sysfs
 store synchronously
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-hid-logitech-hidpp-v2-21-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Writing to the G920 range sysfs attribute currently queues an
asynchronous work item to issue the HIDPP_FF_SET_APERTURE command on
the force-feedback workqueue. Because the sysfs store returns success
immediately without waiting for the hardware transfer to complete, user
space cannot know whether the setting succeeded and a subsequent read of
the range attribute may return stale data before the workqueue drains.

Execute the aperture setting command synchronously within the range
sysfs store method. Open and close the underlying transport around the
command, clamp the input range between 180 and 900 degrees, update the
cached range on success, and return errors directly to user space. Read
and write the cached range with READ_ONCE and WRITE_ONCE to prevent
torn reads.

Because the sysfs store now sends the command directly using the HID++
device handle, the backpointer to the force-feedback private data is no
longer needed in struct g920_data. Drop the unused pointer and simplify
the attribute visibility check.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index f24fa70d272e..f7fefff0aed4 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2348,7 +2348,6 @@ struct hidpp_ff_private_data {
 };
 
 struct g920_data {
-	struct hidpp_ff_private_data *ff;
 	u8 feature_index;
 	u8 slot_autocenter;
 	u8 num_effects;
@@ -2473,9 +2472,6 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 	case HIDPP_FF_SET_GLOBAL_GAINS:
 		g920->gain = (wd->params[0] << 8) + wd->params[1];
 		break;
-	case HIDPP_FF_SET_APERTURE:
-		g920->range = (wd->params[0] << 8) + wd->params[1];
-		break;
 	default:
 		/* no action needed */
 		break;
@@ -2724,7 +2720,7 @@ static ssize_t hidpp_ff_range_show(struct device *dev, struct device_attribute *
 	struct hidpp_device *hidpp = hid_get_drvdata(hid);
 	struct g920_data *g920 = hidpp->private_data;
 
-	return sysfs_emit(buf, "%u\n", g920->range);
+	return sysfs_emit(buf, "%u\n", READ_ONCE(g920->range));
 }
 
 static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
@@ -2732,15 +2728,34 @@ static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute
 	struct hid_device *hid = to_hid_device(dev);
 	struct hidpp_device *hidpp = hid_get_drvdata(hid);
 	struct g920_data *g920 = hidpp->private_data;
+	struct hidpp_report response;
 	u8 params[2];
-	int range = simple_strtoul(buf, NULL, 10);
+	u16 range;
+	int error;
 
-	range = clamp(range, 180, 900);
+	error = kstrtou16(buf, 10, &range);
+	if (error)
+		return error;
+
+	range = clamp_val(range, 180, 900);
 
 	params[0] = range >> 8;
 	params[1] = range & 0x00FF;
 
-	hidpp_ff_queue_work(g920->ff, -1, HIDPP_FF_SET_APERTURE, params, ARRAY_SIZE(params));
+	error = hid_hw_open(hid);
+	if (error)
+		return error;
+
+	error = hidpp_send_fap_command_sync(hidpp, g920->feature_index,
+					    HIDPP_FF_SET_APERTURE,
+					    params, ARRAY_SIZE(params),
+					    &response);
+	hid_hw_close(hid);
+
+	if (error)
+		return error;
+
+	WRITE_ONCE(g920->range, range);
 
 	return count;
 }
@@ -2764,7 +2779,7 @@ static umode_t g920_range_attr_is_visible(struct kobject *kobj,
 		return 0;
 
 	g920 = hidpp->private_data;
-	if (!g920 || !g920->ff)
+	if (!g920)
 		return 0;
 
 	return attr->mode;
@@ -2784,12 +2799,10 @@ static void hidpp_ff_destroy(struct ff_device *ff)
 {
 	struct hidpp_ff_private_data *data = ff->private;
 	struct hidpp_device *hidpp = data->hidpp;
-	struct g920_data *g920 = hidpp->private_data;
 
 	hid_info(hidpp->hid_dev, "Unloading HID++ force feedback.\n");
 
 	destroy_workqueue(data->wq);
-	g920->ff = NULL;
 }
 
 static int g920_input_open(struct input_dev *dev)
@@ -2861,7 +2874,6 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	}
 
 	ff = dev->ff;
-	g920->ff = data;
 	ff->private = no_free_ptr(data);
 
 	ff->upload = hidpp_ff_upload_effect;

-- 
2.56.0.542.g3ef89b7020-goog

