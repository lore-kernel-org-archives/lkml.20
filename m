Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6658316199
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791012620; cv=none; b=RODFlj18gGbkOh/zjumOOpEsrXtkRZf99QpsAOdzfWc8Ig77WPqqRsjWHbNXhOSj6ViYRtPDftoNz+EkUZtG8tvy54sCtzFDSVHwOEmdhU6VMMVCl2i4cZPE7vEBrS3M4ObtNkJM8U8sPOw4pEPG4FEd48zrb/bMIEndl/i5DnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791012620; c=relaxed/simple;
	bh=LnxEf66efq5ClvHb8mJ8XP6ctEeYvZYYAThQ0YvTz/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVRdyF+IAA4znJU95NIFxzWTuoc8L2VuIROPzLS5p4JB9yFgJ7ywjvKq2EYybz8Tou1fFN8cDit+k/a0TTUpC/jsJxtLQzI5auyCW0EB0fre4k0WFl6/5cd7ntMwEEkM2cAUQXG37bTLNXyVAQWk1N8ZkOjzuBTTY9Ar8awLeq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNtkdzJK; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNtkdzJK"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-35104f34166so55941eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791012619; x=1791617419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNX8WzPm1xbL15gYTvgsxtiYlRVrGYOY+Ynh0OU8gUA=;
        b=YNtkdzJKh+CTHdYmHTMSq0tCqHTF47XwBrL+EWaAxEL1WFmgGaJSpRxUlMcRRhiyax
         N29AY1L7isIVDVqBJaH/HB+MRr+L0mbzc1dd7ZnbSi30eOQWIbldyvt0EE4qkBSt5Xjx
         E3EaR+efjB01XiaXAoDYuwDL/2RcPZdJNeb6iWxeLGMC9NptpVVrtqtPlVst46oHrFpu
         JNEA3pwwDJGCtgufBhLoJXGtxJy00zmQqHeHjuVYow+yRplhuDZdIlaKO2/5Sk4RKyiv
         ailhI2ZzwLo0lVVzT2OLY0J2mFYxT7h3sTi+bzon8ufpc+8d5oYaHyMrt+Fweo7HddaK
         FVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791012619; x=1791617419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNX8WzPm1xbL15gYTvgsxtiYlRVrGYOY+Ynh0OU8gUA=;
        b=F0Eh4jsX/cYApOHzHl7XWu9z43G2afDrF9j4IAGoiKGuM/NtCSQUIDU/eaMwo162LP
         3TboErU4LwjpyHXpbfhdokYQcTGcK+kSdbeD0T57zbqlMJuhFe5lwzlyyYEEoxWeWr6a
         l54HwWzKxmHmXQGVrEER0WhHCCGbdljZPwKtamh0lkPUr5w+MMmZm/6wMcz7xsSK+o8w
         QaeiSyZofFhLLj3QQApMs4vQsSzawVuc8+IojVP+S1YN3Uw2MHMTaRgJJznoNJ0CLn+X
         BkL8l+66Lt0HMlVSAuzhD8OdG02JQ1zrvaiRcFMgXrKcxqZknAhWMed/FijTAAz8VFil
         DWnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSCiFVsFCdV8yFM6aTP3A5tal8vNhpAflhf4FJkVqyKhfjPO3uHLZk/oXE1xhrqJ6oeb10wgy5Y9LRO8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdoi1XXnNiFm1A1jjv/JIHs+O9s8VNbDdwNCQTssuBL3AJU3ew
	uZYrKo1SVQbkTVfttiycdcnGw+lQLV4PRwYpBGy8CDNR/xsU10nShmA1
X-Gm-Gg: AYBFou1+dVBZ/rgmj2nHVbZLf7jAzrLw3ge1dowJ68gDAOIbBTGDr6hYlKiafugnbID
	iFfluBaByxr39W6kTwNJ9kP+jSaiccLjw0pXa5nLCpEK2eI3iQ3LRgtl4AeaNx7G28a0IzX8KVe
	e7dc5lBxcA/9JseUmXAvziIoH0a/ra8HPyAYczYMiMVcQEjk8GcsxZDVo2IQA79WUeHIbDEJAnr
	qD1Hi4WjzqpZIEFSU/eQjrDNi/bl+DqzLdzoBuFnQAtF9Prh5RxKgaA+uafEd7eGeoHZRr4W/X0
	P8XeKaACVvZ8nAzK1HgWSiXnD3tX/d9xMasDfKI/EtHWtejH0vzet38kZBIbQxqTojZvTskSzgo
	+4Dz1QtsxqFJkHzCqVXdQQrb7R6Lz9kutSVj+a3CpyJOxztHw0NSDP0IG0pOfuSC1BZ55yGAdHP
	TSpO+w8WolRNqe+Fo7W0umYhwiLeOQeW+TgyuckX52+KqrNwtjhbHgnc77AzbmR5sm3IvH61gLB
	ngGtGp4zw==
X-Received: by 2002:a05:7301:9e08:b0:34b:401a:4648 with SMTP id 5a478bee46e88-34f150e388cmr5276725eec.20.1791012618690;
        Sat, 03 Oct 2026 00:30:18 -0700 (PDT)
Received: from linuxmint.. ([2802:8010:9a2c:8801:3f96:aa95:7a0d:7d89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f15019999sm10911097eec.29.2026.10.03.00.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 00:30:18 -0700 (PDT)
From: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Aditya Garg <aditya.garg@linux.dev>,
	linux-kernel@vger.kernel.org,
	Nehuen Lian Bova <nehuenlian.kernel@gmail.com>,
	syzbot+5ad4fc9c8360b68e353f@syzkaller.appspotmail.com
Subject: [PATCH v2] HID: magicmouse: fix null pointer dereference in magicmouse_event()
Date: Sat,  3 Oct 2026 04:29:59 -0300
Message-ID: <20261003072959.388811-1-nehuenlian.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003011820.1295672-1-nehuenlian.kernel@gmail.com>
References: <20261003011820.1295672-1-nehuenlian.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a guard clause to check if 'msc' and 'msc->input' is NULL
before attempting to access its fields, preventing a general
protection fault.

Fixes: b8d56ef91cc3 ("HID: magicmouse: Apple Magic Mouse 2 USB-C support")
Reported-by: syzbot+5ad4fc9c8360b68e353f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5ad4fc9c8360b68e353f
Signed-off-by: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
---
Changes in v2:
 - Also check msc->input before dereferencing it, not just msc

 drivers/hid/hid-magicmouse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index d637c0477379..e6d4d4930526 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -553,6 +553,10 @@ static int magicmouse_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
+
+	if (!msc || !msc->input)
+		return 0;
+
 	if ((msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
 	     msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) &&
 	    field->report->id == MOUSE2_REPORT_ID) {
-- 
2.43.0

