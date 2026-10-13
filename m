Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A583C342F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862947; cv=none; b=WgXIBhlTT83BCTMZk3iSX6Hj1pA72yt12E3pkxUFaQOuksgnFSVtp2PkY9+RjpOAtjp8ijXOVKNCDOoP50ycU0d0zTmlPhtuAaxO+JyvSGi89pM0R5UFQNC+Wdfxh5WGwl+/Uyi/0l/HM6vCK5Wf8nEpT3AdRPgDjg5kCdvtye8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862947; c=relaxed/simple;
	bh=zYVFmzV22LMbZtP5WUybVQDb2eMNRFSPbUqPdU1ys/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3leCOsVE8qqOmMb2t7MhqzSQhbMHW1iLSluFu+I+V4Sc/edVDbnsX4F4wf6F64d+Q5OhiXQL+VydzwwRafN8De4KrwiwA6SKodUovsJOH1GX99/MDwUTybqZrUQpP1z3C6LIZXp5DRhJsqLv3WEbTDyzPgVSu3pCsydS/jmM2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ll+odRSO; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ll+odRSO"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4386952eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862945; x=1792467745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJc32pXZBasQUG9wrdA1x6ufeI2G8vaiz5UsHPslqsI=;
        b=Ll+odRSO/gR+LS40vSkaU336RcFVVQS7MFMASGZKplnEHagrswOtzARDgpX7dbDSmB
         AZU21QKYD8aHZZzBpwM9NZrgWW7EMNrgwTubV5aDhZ9we3VDr8mGpyc7aerKE58iJ4l5
         WwcFESIOmJXxcdbf1wrvEp/f9m+f3ve24xWS/HdkhxUHzYEH9WtwKxMaNYsOFnDxijTi
         TIFaljsS+mJVWjjFbQLdrr1BQ1td2CXrBnKx8Jy9jZ6l0a+VdtyTdmzPEgvlDiKhjpjG
         0IpPlafzi6JKcHoh7cKgBTQymUhldj0WMe5z/aAxiRpPWXC7OR9Pa46HcT7xYUhImO9c
         8fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862945; x=1792467745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJc32pXZBasQUG9wrdA1x6ufeI2G8vaiz5UsHPslqsI=;
        b=CZbtomSc340ZwK54XI/tNWwylwmLxPlOlUV9toi2YgF3tZtATbLzDvrvtIkBdJWAau
         hZY0mgNfU4jtYU9zftsIz4d4OqLY85TiQvp7/EqeVtjzfotMQIjmcHNSOw9zbSP5uXX8
         u6Qy1RZu6MTT5QOmjXW4V64UAe70gIBhFliwpFHjLEGdH2xEQvW4+2E9jwaNKBoPRZbT
         vtTM5uS39o3lf+WuwqQHtczUQZ3USQwBBEcLYC7xUmWAB2SVaOMsOkjTfMs0I9Il+FxH
         I4IgX89O5BB3Ubzw2lDK/sZi/DO+Kbu7MbXpEvTTnlMiymH1BmwwkqJzgjFEMJhJyQX7
         vhSA==
X-Forwarded-Encrypted: i=1; AKwUvByzWyCQ+4UMmZ2VS8/9hDg1GAcPhpruksYqcbRukI82VaJrQCc/3MAQIdRFrvopTBV7VJGFiqAl7tSc6KE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqc703eEsV7hNhn4ii83mTRXNYkXWSUn/hM5U5hZb1LW/jd5wD
	DOwUtxXdY3lJZIS3hA3DMuH7oKg291DII1gyb0kitpOv0VjikqS1ll/X
X-Gm-Gg: AYBFou0Hou3k7WW0raxe5Dhr9InpH9bEGwMkKfqUQZwzWKKkGopWeGvZoL/YZGGudV0
	FG+XcbcQ/8eQ+W3Ikzl96ENTSC6pPC6CC1WwkxXsdU6iUzFZVhRaFyHOrSuF4kK3tW4asVnSFaS
	TWR82mcnXjjAGjbxkW+HYYyb4K4arcSau5GdKux4iXkHF3CkfNA79cpKgC3ZByeWcE/s8Vm0O1C
	ljvxzeUqdlQB0PYtyFBPQmjdb6/S+SvZYsnyS7Zh7s77wJBmIAP2l9fsD6Mp+uM+dUebMWEEN1n
	PeXEta/0XlRov42/NNqHx0/AnZSSnTYrS8E9YoSzlQKikHkpTAKalQmvQIj3j491y4dXSXKGdOW
	dze1iFi5eQWlqXqqjA6QsOuifdq0Be8J7o8PuadtOfe0QsSNLDtotQcuB18v3uGUyxHCDsZrLEC
	pVXtBAuBiBkj+7x/290I4RPiSLQjCadiiEbr8kq3cRJHU6primfj1DZebphFoXkeFwO3BJEcndN
	nXyAi8XEUnsow3xxAIjQrJpnT/V82tVASWKIGG8hQ/uOapuNzOIr+NZogjl4Xc=
X-Received: by 2002:a05:7301:5f0b:b0:351:4648:3611 with SMTP id 5a478bee46e88-3537e1118bcmr14540646eec.26.1791862945215;
        Mon, 12 Oct 2026 20:42:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:679a:f35b:7c29:e0f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm35268677eec.29.2026.10.12.20.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:42:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 12 Oct 2026 20:42:17 -0700
Subject: [PATCH 1/9] Bluetooth: HIDP: Fix GET_REPORT and SET_REPORT for
 unnumbered reports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-hid-core-report-validation-v1-1-e0dd5cb60b2e@gmail.com>
References: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
In-Reply-To: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 David Rheinsberg <david@readahead.eu>, 
 Frank Praznik <frank.praznik@oh.rr.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, Even Xu <even.xu@intel.com>, 
 Xinpeng Sun <xinpeng.sun@intel.com>, 
 Roderick Colenbrander <roderick.colenbrander@sony.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Shashikirana H K <shashikiranah@chromium.org>
X-Mailer: b4 0.17-dev-e56a4

Internally, the kernel HID subsystem expects that report buffers for
both numbered and unnumbered raw report requests begin with a report ID
byte, using report ID 0 for unnumbered reports.

Adjust Bluetooth HIDP transport callbacks to adhere to this convention.
When fetching an unnumbered report, request the report without a report
ID over the control channel, prepend the report ID 0 byte to the
received data, and account for it in the returned length. Similarly,
when setting an unnumbered report, strip the leading dummy report ID
before sending the transfer while including it in the reported transfer
count.

Fixes: 0a7f364e8122 ("HID: Add the transport-driver functions to the HIDP driver.")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 net/bluetooth/hidp/core.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index f5bdf9f1ca63..004a8eed51fb 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -248,7 +248,6 @@ static int hidp_get_raw_report(struct hid_device *hid,
 	struct hidp_session *session = hid->driver_data;
 	struct sk_buff *skb;
 	size_t len;
-	int numbered_reports = hid->report_enum[report_type].numbered;
 	int ret;
 
 	if (atomic_read(&session->terminate))
@@ -273,10 +272,11 @@ static int hidp_get_raw_report(struct hid_device *hid,
 
 	/* Set up our wait, and send the report request to the device. */
 	session->waiting_report_type = report_type & HIDP_DATA_RTYPE_MASK;
-	session->waiting_report_number = numbered_reports ? report_number : -1;
+	session->waiting_report_number = report_number ? report_number : -1;
 	set_bit(HIDP_WAITING_FOR_RETURN, &session->flags);
+
 	data[0] = report_number;
-	ret = hidp_send_ctrl_message(session, report_type, data, 1);
+	ret = hidp_send_ctrl_message(session, report_type, data, !!report_number);
 	if (ret < 0)
 		goto err;
 
@@ -302,11 +302,25 @@ static int hidp_get_raw_report(struct hid_device *hid,
 		}
 	}
 
+	/*
+	 * In case of unnumbered reports the response from the device will
+	 * not have the report ID that the upper layers expect, so we need
+	 * to stash it in the buffer ourselves and adjust the data size.
+	 */
+	if (!report_number) {
+		data[0] = 0;
+		data++;
+		count--;
+	}
+
 	skb = session->report_return;
 	if (skb) {
-		len = skb->len < count ? skb->len : count;
+		len = min_t(size_t, skb->len, count);
 		memcpy(data, skb->data, len);
 
+		if (!report_number && len)
+			len++;
+
 		kfree_skb(skb);
 		session->report_return = NULL;
 	} else {
@@ -350,9 +364,12 @@ static int hidp_set_raw_report(struct hid_device *hid, unsigned char reportnum,
 		return -ERESTARTSYS;
 
 	/* Set up our wait, and send the report request to the device. */
-	data[0] = reportnum;
+	if (reportnum)
+		data[0] = reportnum;
+
 	set_bit(HIDP_WAITING_FOR_SEND_ACK, &session->flags);
-	ret = hidp_send_ctrl_message(session, report_type, data, count);
+	ret = hidp_send_ctrl_message(session, report_type,
+				     data + !reportnum, count - !reportnum);
 	if (ret < 0)
 		goto err;
 

-- 
2.56.0.385.gd3acb90ef8-goog

