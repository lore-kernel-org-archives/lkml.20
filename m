Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636010;
	b=Ql5gL19kYnKO4fhfwAI94CluPYUYo/LQYKKGdHSFSXxy/x9T0zeu/Q9D3Cp8UTxvGxA+
	 T24TQZn3OMgc+bEoV52sY2OgD1AnS2hHvR7iintwmpQ2ZmYW9SuHf+xf76tDORbS6XVGS
	 UFcJcZu4cXCXIbJTjc1vbQ/ueFRT04btZhUOsq4V8ajM2tkpDuvc63O/s2u2PcvVzM7RO
	 5usr0qOOGClvucxZXhzQcEtrGzGg4a5tZ+63z8SGP1sTWZmSu0Y2RlbgV9CFyZMjkJmjn
	 XSDu5W+MHrmEpD++c4FuoXvum+X+d+S1PbN598rGmNAywBMug+YsHIM3obRHanNqEBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+EEWNkE1a7hRMhlPQgcCbRa773ygILlEL18jSB5SYvY=;
	b=EeA6XZD5/3Uf2Pzf6gDV8LQP7nb5TBZepx9H4q2FE0suHpRZ3RgA7QJ0Mme1ybG/H0VP
	 iEbEYhrPJB+oIcyHOwTF9pNPzhjHAE5rqkpjDaN9FRoA4IRFkpDEBEZiQEkgiQYY1wPxU
	 kccxAyJgmBG96aRhFGObYhJKRyNCfyxNu3Bp8+T9ZCMreuyup/N2Qgs4VEzrbf8VDZUnA
	 +TiJFfslCo3WyTMmrKdEn15IRJNZqsAnnlZAF94eh8yNn8qnqh0Y7tCLTTZSMDQk3SIp9
	 hWRQ6xRmkRK6X+TRIuXX7JrQJmKdNC1JkrvC90VFq5JC0IlL+GgHyYBPae1h/2KEu4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oym8Q4iL;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A46E606A8B4
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A46E606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oym8Q4iL
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1599024c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636009; x=1795240809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EEWNkE1a7hRMhlPQgcCbRa773ygILlEL18jSB5SYvY=;
        b=oym8Q4iLseLDNoJ9gzRphRVkN5f2H/VqXyf6TcJh8o2j66G4TA8atN7qgJeLOtbrmS
         l9U9+c35mNZUn/u+QfnmMWfUpAN032Jam3YxC+rQ8IIbQBhtoShn8t9gAugOQuIthkSp
         o9L0FIIVcyPMM5sP/Vo1J27ynOVqF7hzkgT5brWML/FSoUWlw/1i/tTzHaUkJmR10BlT
         bVoqqURhruIM4H8p2ynZ4Ll5s4BN5NBmqi7fsijNj/hbQo81QHrEioQPwcE8jZuyYre+
         oIjtZHCRaT3jvDNXRJbX/X9PGlyZ5ALRsE+xqUHSKP+27ofcRr2Qnx2K+gZC49K8f4xu
         oYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636009; x=1795240809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EEWNkE1a7hRMhlPQgcCbRa773ygILlEL18jSB5SYvY=;
        b=bSzSRBNPBS8p/Qp3t68UQ8FKgO9XgV53eVkihIXLptyvlSfooeWnA6elMBiDyxR6lx
         oW0BATRtH3zSmLWM2/O20UDFIEQB/Aducj/pqrEXkKh0jo0SuA+vmmzVnbnkS14Eaas4
         /VielHiNOmJT9Qlz9Trhuz9talxhaaK6PkRirj+ALPXY2seJv7Nzv5n4WedoFmz7fTGG
         92gUuNFIm00HAbMDdJ9yGcOskig4UlZyjMqxLf8XmvrWe5UlYtnLBNsvXoylBf66XQK+
         3HzyMRX+dS9WEOI8snUlWNMJs9xnhvhH0x0FvkS5wQeo/nXvHVt1wLyW1S53kRtXLnpV
         g1Qg==
X-Forwarded-Encrypted: i=1; AL+hErGbzv3rKLAj3JCWyiW0mqp7CFAj3arnge7RLV7yC/MoF0UVsuGv5ywcGOzOpn+zqUUOcxr8IjBdf6AFA7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4jZrCmcWC162v4uVZaBTgumgZy8mhbNRnCVR0jchpfapBeCZF
	kv5559BmehUzYXO5UreFh5CLSfRlhpHpoYL4M8WNWwvhi9hyjecp+s44
X-Gm-Gg: AYBFou0Vc+IMtD6oKjR2TmkNUcg0MGhCxPaJ7UH8iy/eXxI1JTGqWr4jLQfrgEdrKOb
	vptLEgAhj2HPyfVpd+uV7qxA06Mg3XFwr4zoLLRReQu2KY1MLAHOu3bPMIn+1zSDBdKSRnBsZWT
	W2bsJcwusX44PPGPy7/kky7xGfC9TqsYM0toXbTtsK5W5LCqSlvXKb9hP9BJflz3tUZCTd77pjj
	MeN89Ecp381suzrG49d929rLbU3oyavc6JvAzPGE0Gse8r4xuUd3WjdNlvzfVOM4DK5DJl9zj/h
	u9zWxq+Dfdn3xCw6hw2R1fNSRAsa+v/yavjJcVXwUs7TVrKs1rEUa6Ek+4b1FFpfkdJyZp0vAdJ
	LmC7jLgVR5cMrvMxpYlRig+HANcLyvt0BO9Yg95gpUvZni4lePF5E7zI9J2EW1f8Fwa+sUE79PJ
	k1rMUlEf4e3to6ycLwOp4NQJwmt//INBB9+6JuxJDFbjs3y03KPBDUwkrKTOBBTHd4Uo/r93bq5
	K6yax8YcKkgiYLQVb8wt8Xb0nLf2/28M9HpKGDTQl9h1qY+jDdjdqAXrylVnn4CbPBAZOSiSrek
	PfsRKdOJfqnXFNVZDl8iINZ4VM3jvb5BwSIQX2jK2s9YfW1/zrIAz71NDdGzG7O9CPV5Yx+qE9U
	/TX4+EWhxW1G4EPOR
X-Received: by 2002:a05:701b:4507:20b0:168:e942:4e62 with SMTP id a92af1059eb24-1b503150bccmr3965798c88.40.1794636008600;
        Fri, 13 Nov 2026 22:00:08 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:07 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 21:59:55 -0800
Subject: [PATCH 05/12] HID: rmi: re-select page 0 across device resets
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
Message-Id: <20261113-hid-rmi-v1-5-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Hardware resets its page select register to page 0 across resets and
power transitions while the driver cache still retains the previous
non-zero page, causing subsequent register accesses to address the wrong
page.

Explicitly re-select page 0 when resetting device attention mode.

Fixes: 9fb6bf02e3ad ("HID: rmi: introduce RMI driver for Synaptics touchpads")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 8783edb7fd6a..d3e4ee0f62f0 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -321,6 +321,12 @@ static int rmi_reset_attn_mode(struct hid_device *hdev)
 	if (ret)
 		return ret;
 
+	mutex_lock(&data->page_mutex);
+	ret = rmi_set_page(hdev, 0);
+	mutex_unlock(&data->page_mutex);
+	if (ret)
+		return ret;
+
 	if (test_bit(RMI_STARTED, &data->flags))
 		ret = rmi_dev->driver->reset_handler(rmi_dev);
 

-- 
2.56.0.679.gc527c65306-goog

