Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECB632F749
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888037; cv=none; b=fZAuTYIa+sTY2GLoiXdC1sI7Vkg89ZUeRuqosnZGz3oY8s6lM/JY1WSaUJied7WECzK6YM/nj/erFWSCMJXZQ/oIWuUiptZUsIZTEa0g3H4kEHlBFisLZ0H07OckA3Lc9uSBiRxZN2krxOtnb6z0rvVhvG4Q93R7tXIdPtDfI/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888037; c=relaxed/simple;
	bh=O3W5OLmm62pgM3CpEscJNvH3qzmki9b+xvjyTSf3kDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNCALyZmAi0SYcsUrPtUmIFqyIQqnH29Uys+S92ok2LQWm0k3FG6FXnJiWVjpacaqWjZIW8qGzmPKcvgADXD+C3x2TlM871tLAqhFGOC60H37fsjQi0KvvDQxVAeferELsS5dRYmrUVu5tgXkwTwlHAbcUn6ctdJyqgKCPTytMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4JJH539; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4JJH539"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e347638adso506299a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787888035; x=1788492835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2kWriAmVnRHA0BfpSMWspXCORRWDebvQgjhpMlIH/M=;
        b=P4JJH539rleEnVHOnsvJayV1l7Pa0KoLHxg15S1UMQYmPOrAboYOmLhQM37GIZaCyw
         rAdWgsXzpdUv6knad1o++llKqQYe7c6yqygqdt+6zLT86+YORESFiPerxSTzx55KMRHJ
         +IGsL441UPiRYVgyzDoZXF4LhK69oe7v55/b0+AWUjgrpj2ocAhIvmKNxFCgr0Sec9U+
         INXCUgYlaNpiOC1YBo4YcslwLnQq1qMbH3qJ8a6s6fT0Qs3ed+3jbyCVq7J+kmzrvdVv
         HQ8hAluCl77iv/Infl4nj/FIGIO7cbRPcE6lLlclKPdgrAXvmPXWvwYIHdkvxA0gTd9e
         6DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888035; x=1788492835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2kWriAmVnRHA0BfpSMWspXCORRWDebvQgjhpMlIH/M=;
        b=oRJcT04QGA8r32jbcIkKW2MPGl5Xr3PahIqzqONFNQOCsIM0r/vaEiRFswz0J6PArt
         Gr4kUYFTBb72sJI8SFoRF6ES5fEi0+1AYRiQdtSEOJNHzBn//wbiveXSamrKuaAr7/26
         hQJMyGs691HMmFrOXRX7E2r7UuQJ6T5ndHKvHM5sTMgwYYRDkJngHPkZxj8vbQ6zsz5I
         TwfsK3QUDsDnM6aIKZeWtMK5IfiiniUAghwQUh2kdnzBUbikdxbtYF24CaidGzpV5ExW
         BLGwGnyJ0tmX5xO5gbEdZuLp44l+Ms7I4p1SE+LEa+jlgMQ+2QArmpUbgYox6W4KzRo3
         wP7g==
X-Forwarded-Encrypted: i=1; AHgh+RqKm1KL3FZWJG1n5HcLTCOToSjQDWcdAufqvBoU46ho8in4+nTr92NbmyOVQptFLQK+m9KnUkoDhNMQD/M=@vger.kernel.org
X-Gm-Message-State: AFuF++nlqEoJEMfgZ3fY1mCBMoJ1ez98cp5Cq3mhHrpY42bM93Pxxs+6
	Ev6D6iNTc35XRtu2ZJp4H+VEtxrecFxZOZk2zqmevkQ1DkFfj82WdCQErIqNzj4Z1wTCGA==
X-Gm-Gg: AR+sD113jyzBR1guXLw7XFcviSR+BxfrRukShMb/kVqLp2al4SpR6uWZFIfZPHC0cBY
	ZMPVsvwey0Cnmzqob67ofIOLVtYDw2Qvqep5MVjo0efYNb4ZCNjtaYSAEFWIEsK17tPWzfmboMJ
	S7o0bfVW02gqcd9v874/1rHm/hGk/fbXZmJineHlq+zkNBqy3tQ3QWj9ZsUxqyDH+yOniVPlE36
	bC12GWqolbceBUV4kjbrTIw8B6mMUCZ4vOGHBmu41190zQNKbC353kSAPwEA4fIN2n6LUukq3as
	itH9He3uTy+937jRbnTTFBDmbe4aIQToOMz+bRORuwh4S2yCezYqLQzF9uOdMxZZykwLqCMkZMR
	STeuoYW+Yh3+j8o8xPtMY0RB2ZAiz9UIpU5jMDSF3CL6Yeo+RiOL79pJbVvEkTPzPJspvEKLR8X
	gJrtha6qzgmmyOyXwyXiFF9bAwTT3enMXE2M2zMP7+iTHBzSadp6i4BVSq4VAF/knypFlaQ/tNN
	LHtISSrRveMPluxqAK6gop722lRITculW0THxT6RKSZ6EH0J7hFHrQb9FHd6wyKfg+9cihM1A==
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr7783691a91.14.1787888035408;
        Thu, 27 Aug 2026 20:33:55 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([203.125.131.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddca5bfbsm695369a91.17.2026.08.27.20.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:33:54 -0700 (PDT)
From: Wei Jie LAW <98lawweijie@gmail.com>
To: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jason Gerecke <killertofu@gmail.com>,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH v3] HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()
Date: Fri, 28 Aug 2026 11:33:23 +0800
Message-ID: <20260828033323.82958-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANRwn3TWTHxP=ZEpgZzjRweC8vqifoi2koKgSQTEuPuY4FZxcQ@mail.gmail.com>
References: <CANRwn3TWTHxP=ZEpgZzjRweC8vqifoi2koKgSQTEuPuY4FZxcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Jie Law <98lawweijie@gmail.com>

wacom_wac_pen_serial_enforce() iterates over a field's usages (up to
field->maxusage) but indexes the report bits by j * report_size, the
position of value slot j -- and only the field->report_count value
slots reserved by the Report Count exist in the report:

	for (i = 0; i < report->maxfield; i++) {
		for (j = 0; j < report->field[i]->maxusage; j++) {
			...
			value = hid_field_extract(hdev, raw_data + 1,
						  offset + j * size, size);

hid_add_field() sizes the usage array with max(usage_index,
report_count), so a report descriptor can declare far more usages
than its Report Count reserves room for in the report.  One listing
12288 usages against Report Count 1 has the loop extract the usage
at index 12287 from bit offset 98296 -- about 12 KB past a 2-byte
received report.  The value is stored in wacom_wac->serial[0] and
can reach userspace as an MSC_SERIAL event, making this an
information disclosure.

Clamp the loop to field->report_count, the number of value slots the
report holds. Value slots past the last declared usage are still
scanned; they reuse that usage (HID 1.11, 6.2.2.8).

Verified on v6.12.105 with a UHID reproducer: a 2-byte report from
such a descriptor trips KASAN before the patch and not after it.

Fixes: 83417206427b ("HID: wacom: Queue events with missing type/serial data for later processing")
Suggested-by: Jason Gerecke <killertofu@gmail.com>
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Assisted-by: GLM:glm-5.3
Signed-off-by: Wei Jie Law <98lawweijie@gmail.com>
---
Changes in v3, per Jason Gerecke's review:

 - reworded the explanation: the usage array is sized for maxusage;
   the descriptor just declares more usages than its Report Count
   reserves room for in the report, and the loop trusted maxusage
   over report_count

 - bound inner loop to field->report_count

The reproducer is available on request.

Compile-tested on 6ba2c27cb9aa (x86_64, wacom_sys.o); the runtime
verification used the identical wacom_sys.c built as a module for
v6.12.105.

v2: https://lore.kernel.org/linux-input/20260825103104.12090-1-98lawweijie@gmail.com/
v1: https://lore.kernel.org/linux-input/20260822120926.153849-1-98lawweijie@gmail.com/

 drivers/hid/wacom_sys.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 0eafa483b7f7..40770affdbde 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -113,8 +113,9 @@ static int wacom_wac_pen_serial_enforce(struct hid_device *hdev,
 
 	/* Queue events which have invalid tool type or serial number */
 	for (i = 0; i < report->maxfield; i++) {
-		for (j = 0; j < report->field[i]->maxusage; j++) {
-			struct hid_field *field = report->field[i];
+		struct hid_field *field = report->field[i];
+
+		for (j = 0; j < field->report_count; j++) {
 			struct hid_usage *usage = &field->usage[j];
 			unsigned int equivalent_usage = wacom_equivalent_usage(usage->hid);
 			unsigned int offset;
-- 
2.43.0

