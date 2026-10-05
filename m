Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C765B34EEE5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 19:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791227584; cv=none; b=beOv07RbsADCixicct0IDcX+iXrz+FwCnqJi9W2/TME4PW0zQERSLi25ySvFzqV5t+LX8bwoxlzyg9lfJ8Vx0mD21yKwhILg+6mpU9MFdetLtwmZyJ/3Pi8ODsq932c5fYMFjq1tJoGlnPgVkEfWpZtTQ7RVGDaFmW3cMVd/mr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791227584; c=relaxed/simple;
	bh=BGMwkFjT+LLKb/t9OZ6A8jAn04l+gtGoLYbfaDbzehU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tXQX7o5Be7IgJR360VNAGV9uIz9iagB9IhC7qDXlAoBDr3P6rVJxXQSIiLpu7UQX+GG4KKl7lyciJxe5cSQs8u89QWrT7RspqKW76+3xc7w3g2bbw81CKlUn9EbHFbtOKFOvJbBotToDp4/r469SPlgEmk3Izpzwkbutu1WGWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyspmF7v; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyspmF7v"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso1167961a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791227582; x=1791832382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQ5MRPC4I9fA9ZFAcaPBErsj9RjadP4yXm5H6MNvFrM=;
        b=XyspmF7vdzieI6ZinGGYx1IR5UHbzCvxoApu9tBDSvmfP4eubugj0WIZYCyNW/gkgI
         VIFLejKMTm1TChpbysUFB6J3a5p84/i48QKMUOizOHqB10dduIq0Ty9MxEDnlkLe1hBh
         wj73fG6nPk9A9HHX1/3Tk1RL5aNc+vhZ0gZ3VIzaim/bCLL1LQzBUcy25rc2vGUqHdeW
         AXDhvzSDpw8PLS6s7GLlc5NG0JaQoZxfYTU89GmsxJufiBDC+mGsP4FRYX4H+0Vzj/mz
         KIOwUBKRyum5I8L4VZKEc6vysOl3QV3ahfcwXI3gGjH6vDxCqZ7I3scn5v32Izf/3V7B
         hkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791227582; x=1791832382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQ5MRPC4I9fA9ZFAcaPBErsj9RjadP4yXm5H6MNvFrM=;
        b=gXz6y+Gl3oLdMWbl93thGSOfR+89SPTZ9aBkPNTxs6UlTEUDJcBo2aNUcWCrYtQKO3
         WQOEUMisOxyfXBUsTW1JdAzx85ZPqwoUyEcDmGBdmWrZcCxDMWervVUcBCKeuR8Ga39v
         nO746Q5Z9IpbBzOpif8VWKIAYpLi6t9ZK9Eo52YGBJiUIxBWbH6W/RnJ6/PhePc3GKqT
         1RBdEdqI5Q6Mr4GBWqAVzA8acUhl/aB+hq1DE0s5yh9/gizr06ZaRp8HesygLt2olMMS
         qcS5//b+ukhklklWM4EdW1bGwavg5ZzDQY3SGRmdxMWHMSOuWlAmHggGsXB0AELrUVqG
         DuQQ==
X-Forwarded-Encrypted: i=1; AKwUvByFQBMhWh3iUumRF5zZRekUTw1YpzyB+haOYWnMiIun+kuMOOFG1sYQ/lfnv1MLqw7LDLVOswnj+GfyDuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYImM1YCntNAsrnBT+BMjNxfnTTAf7z5hJXPhoZ62XJerZOnoDJC
	g6MRPLaWHvvlFL0sEA59KxJ8vqwVeGKoT7mFjyM5MGfbIo8psuK8ewkU
X-Gm-Gg: AYBFou3+L7dfvwwflyAAt1f2LyacoMMaJLwCioN/8oBn7IMXn1FgFRTtuiwmdUIxffE
	zZV+hg6dB6vsnuBYkjt3UlmCKH7TA0hcZYnFhtdvjRBwgtWpsOFFnl4U2BQ2wKFymLh/vdsPCwm
	AUDgP9lSZ9BcL9uxSFiz5gwXmamcJIqEPYHfDJ9E6kdlyWRci7RLFze9kWaOqR2xxxNbAMarsKm
	BJdG1Vh3XNGNMPSrPFm0gPE/iK7svaFzY/WOAh5ei20imSU4pKW6hGQRmQrbOhY6UQ7mD2kYH6d
	iaHhrFVPl1I6ZPIjNcd8BH6FfRQ3aQ9EbRpPizyspH6xawJNdsCukbdwSnczVXp4FrAnVqIXeQF
	LXX1y+CdhVBqmI120DljT7k7qotpL3FnApKA6Lss7CTzOAXHNTImIdzSB1FgQHSRFQSjczX+NAD
	RJtA03bGcKHQudZvDts46Nqf7jl2I4Pcce9vaimLsERXbphnowE/tmJ8/TxYTYKfr4L2L6ZTWlZ
	JnPpTlfzuYQXFCWXO6OPRFgjiVkuCUyGZRj27RB//AVs3+NbeSQTocS9Bmam08vuLd+b+jE1zWf
	8Qn/IRoJTD2nq+diqNUSOPbuMLWpKfA9Y3ikR4ymqb3EJCOF
X-Received: by 2002:a17:90b:1fc7:b0:3a7:9afb:78c5 with SMTP id 98e67ed59e1d1-3a79afb87cemr3208892a91.30.1791227582073;
        Mon, 05 Oct 2026 12:13:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543bf138sm801736a91.15.2026.10.05.12.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 12:13:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH v2] HID: core: use flex array allocation
Date: Mon,  5 Oct 2026 12:13:00 -0700
Message-ID: <20261005191300.80818-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of embedding a pointer in the struct, use a flexible array
member to avoid the + 1 trick to point to allocation after the struct.
This also shrinks struct hid_field by one pointer.

Annotate the array with __counted_by(maxusage) so that FORTIFY_SOURCE
and UBSAN_BOUNDS can check accesses at runtime. maxusage already
holds the number of allocated usages, but it was only set after the
usage table was populated, so move the assignment into
hid_register_field() right after allocation.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use __counted_by
 drivers/hid/hid-core.c | 8 +++-----
 include/linux/hid.h    | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index ec7c2860c93e..76bf4da89d2c 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -130,15 +130,14 @@ static struct hid_field *hid_register_field(struct hid_report *report, unsigned
 		return NULL;
 	}
 
-	field = kvzalloc((sizeof(struct hid_field) +
-			  usages * sizeof(struct hid_usage) +
-			  3 * usages * sizeof(unsigned int)), GFP_KERNEL);
+	field = kvzalloc(struct_size(field, usage, usages) +
+			  3 * usages * sizeof(unsigned int), GFP_KERNEL);
 	if (!field)
 		return NULL;
 
+	field->maxusage = usages;
 	field->index = report->maxfield++;
 	report->field[field->index] = field;
-	field->usage = (struct hid_usage *)(field + 1);
 	field->value = (s32 *)(field->usage + usages);
 	field->new_value = (s32 *)(field->value + usages);
 	field->usages_priorities = (s32 *)(field->new_value + usages);
@@ -357,7 +356,6 @@ static int hid_add_field(struct hid_parser *parser, unsigned report_type, unsign
 		field->usage[i].resolution_multiplier = 1;
 	}
 
-	field->maxusage = usages;
 	field->flags = flags;
 	field->report_offset = offset;
 	field->report_type = report_type;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8d17b741638c..16e8f19d42c5 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -524,7 +524,6 @@ struct hid_field {
 	unsigned  physical;		/* physical usage for this field */
 	unsigned  logical;		/* logical usage for this field */
 	unsigned  application;		/* application usage for this field */
-	struct hid_usage *usage;	/* usage table for this function */
 	unsigned  maxusage;		/* maximum usage index */
 	unsigned  flags;		/* main-item flags (i.e. volatile,array,constant) */
 	unsigned  report_offset;	/* bit offset in the report */
@@ -549,6 +548,7 @@ struct hid_field {
 	struct hid_input *hidinput;	/* associated input structure */
 	__u16 dpad;			/* dpad input code */
 	unsigned int slot_idx;		/* slot index in a report */
+	struct hid_usage usage[] __counted_by(maxusage);	/* usage table for this function */
 };
 
 #define HID_MAX_FIELDS 256
-- 
2.56.0

