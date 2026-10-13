Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771764718CF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862952; cv=none; b=iIVgIHQ8d82c7m5ioVu/uUvNN4bereuPv9oB+DouDkiY0X+ybssPcL39rTopkdsaduv8azWleapftn8UnyjbEIU5BgR62ycYkX/YYKb9NU026z3YmPyIo/Q043RVYzjvmqS0Wq+pBIt8RAKqCkOLQLOrehCJARliocEhq+oQUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862952; c=relaxed/simple;
	bh=MW3pyeNZaeTw696bnv759T/r7OXQCBFEDxtk0xrWJu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qTORg3Ef1225vJkFY5aD4P7M4uuDx76gn5l/yPJp8/yP5yyxxyfMD4DklchI2/o/5tMamQfYRX3B7tSf6SZO6O4Lnuxu3gnvH56ItORNko7Vu4fdwTLex9EkWWxKK9Rv7/wXH8fz9csWsQrqTindB3tsv+MEPN4mJ1LzEkyOxnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvTS6z9d; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvTS6z9d"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so4784077eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862949; x=1792467749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRRv98G9cn0AlpTayBXQFsFs2oRDwoIU3+IQF5Vkek4=;
        b=NvTS6z9ddnomUVb+xpfL3J4iJgBwGQjFiSH5xHwT8J+Sa8qImtpb+vmaTVF/tZBm1r
         8GeEGIgakQJGcuVqPE3S4sjpSgEoSxg51rA/SEfqR4Q1sLd+Q8lJf0xnTn7mM/+t5rhT
         V/79Jh7JBFhuP/HRmYGopf8VYWe1PhKE4LCX2UvqwM68deuhagRlb7oeZnWj/JDHH9iF
         nuAPkwLXe4VVFQ2gSBYw5xlxVaeywV5QwEJDvb2kbYAwwoYUtFuLdy5N3ruaCCzasehQ
         Glfn5GqwbV2jq88HF3tQGHQ7bX1/Xza9uMhYD0G4D2WciLhPofLzXgFgWG4N0FQ87Oq/
         X+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862949; x=1792467749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRRv98G9cn0AlpTayBXQFsFs2oRDwoIU3+IQF5Vkek4=;
        b=ymehR4jYliAguXukd4kAw4HMmH7F6UFXbT7ltS+pOGnImOhRY5E3L/OWc7TpEfP6iD
         tr+4VRcsKyHNbMXOjmfHpkmy1l+x4VOs8rh03HTE4Dj8HEfeeyQODRq2A6+ToPSsPyhI
         RpstywqssKF5HdePTd1IfiUJlUsWqlaR6DLssOOP3SU99FTGfpZVVPBaO/WDf/RN4oVo
         N5ahyB6Mo1p0vEgiaOJZ1x1wtwoXsxHgO28nREp+bscNUIV0ySZpxicpxkGUvhAigAvO
         1rqvBU1t6FBVfL6ZXrYocI4UuAS1dcy6V1iFtQi7cIBkpn2BHgBMPYReNBeYS/UKwZRp
         n1+A==
X-Forwarded-Encrypted: i=1; AKwUvBxHx9xmhlktd3iArQ36lhjokkOGhluJRJDeVg+gqlzFCN2fmPoigY8eNXX6gnYROOhgvW0CrDyAL5HQczo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6EhJsFvT6Jvrl+mlFDVA93QBopd5AJPposioHty5r/T/vedBf
	eSjzBIILYUIg0ZDxTUt2g5QvC8btAuR3SII1m1hpl1S+X73HDSJlqLs7
X-Gm-Gg: AYBFou0MfDpDMS81FhgTBhqklM2rGLjofeCCw+87zGuEZ+g6GtBIhneeKMamgA5gnGs
	869AB2RT47jZbDmASeyMR2QGEhwDQvgJJdMr7ncBMfYyB7kJ6/KL+mH4qp0i38WaoXMAnQwee8J
	Avx85kKdvhfDhKciO+qdF59g2Cs3SFXRAxpCICyjPAWufGhJj460tbxkIptBnaFl2xufAsJ59PX
	91RA/akuShGy257n0Mn9RA0OSUEWEeuULPZf46O8xGOuWAmNyFNrQAX4k7atapnulsb+ZO07Va9
	GJeheLCwjwnxUyE7JnIUXtC3np/hdeK2hdEnz4uh8foQw7/MSh59ydrQpNnnKRYBjStSQtFxKcS
	2iuhNXNGY1v34EVYkd2aLrEY7vs0LYCbWFnfMzYAVyfGVtI0SwVkRfYAGq7yBNupNiXW+AJiUEs
	2wUM3aj/Uh/hsZHyB+/sg8nkz+VvqQtLLdfgTF2KrEmC+Mt27C7pN7pqeNqWtjdqfF7tf9jOIfR
	nSO94vdPp1q8rFc1T8b521k6ksRjKWwiVzA3l1VElT/+NKRC6rgiFwNDnEf80E=
X-Received: by 2002:a05:693c:41c7:10b0:353:5cf0:df09 with SMTP id 5a478bee46e88-3537df8d300mr16954343eec.8.1791862948560;
        Mon, 12 Oct 2026 20:42:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:679a:f35b:7c29:e0f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm35268677eec.29.2026.10.12.20.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:42:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 12 Oct 2026 20:42:19 -0700
Subject: [PATCH 3/9] HID: core: Reject mixing numbered and unnumbered
 reports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-hid-core-report-validation-v1-3-e0dd5cb60b2e@gmail.com>
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

According to the Device Class Definition for HID, if any report of a
given type includes a Report ID tag, all reports of that type must
include a Report ID tag. Mixing numbered and unnumbered reports within
the same report enumeration is invalid and causes confusion when sizing
and parsing incoming and outgoing transfers.

Reject descriptors that attempt to mix numbered and unnumbered reports
within the same report enumeration by warning and aborting report
registration.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a33e864a25f9..3a9bd56dbf85 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -96,6 +96,12 @@ struct hid_report *hid_register_report(struct hid_device *device,
 	if (report_enum->report_id_hash[id])
 		return report_enum->report_id_hash[id];
 
+	if ((id == 0 && report_enum->numbered) ||
+	    (id != 0 && report_enum->report_id_hash[0])) {
+		hid_warn(device, "not allowed to mix numbered and unnumbered reports\n");
+		return NULL;
+	}
+
 	report = kzalloc_obj(struct hid_report);
 	if (!report)
 		return NULL;

-- 
2.56.0.385.gd3acb90ef8-goog

