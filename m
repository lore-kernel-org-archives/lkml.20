Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3C13B2D39
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146582; cv=none; b=IHY/C0oxA/10i1M8OztYQGEVcRSQcIP0tMUZKVEQfRYHuzsWt0IYnitqO13VRd9Yto7N5nkt0YmHMVAI67f7hZ+/JDFMwUw4NCf4zaZ9W01QIteTsAwHree2d48HUWaCbOMbTPt+EIo/hxKf6ZlrSQ3qKJSQCnhc8Z8OIzYxIbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146582; c=relaxed/simple;
	bh=qSM6L8Tt3Bo6L6FvVJnkZL8zE3lNbmNDUjzd5ZZnFUQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EKry2xcMTcvquiB9W7Ye6oGsgGB+RpTXWEjXuYzLzpw/UZu4lofCE9KsQwt5ld/cUYXFYhzDwhZqk/d6NRhrMSUwpXmYwy26MinIGw07oLiQOiSIGPnkvewSqHgvWHTBBh0RnrELsX8LpiHdZwvSvMY8vH2P28ai9cH39ppzEY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h6bR4ahW; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h6bR4ahW"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so6764265ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790146576; x=1790751376; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93ESgb5epDnv42DkJ10ZS+s0RrMivyUc06fbtYjyWtw=;
        b=h6bR4ahWE7rcBTDXRq3CVjKuPEu8aVwyXD+umoRXjaUSUmrIogEdxYYcJtk5zJmLXX
         BYskt+n4hYl+spdtR4gzAhlvqrabrg3zZps8wMuYxGoEnTG5U6SKtfJkk1FG3/OFsgRK
         gLIZ4slcZ14hmDb5EaFZ6GRQdVDImx9vrdtxgargKZWh/XRmO4TnqpSZLUr+PN2ZPSlQ
         YvaWS4fgBjhXphgN4k8ueHXI2TGkhvaRYzTuEl9yslPoC3O5UgxWka2vPW9w1074ll0x
         TCCZ7BbETGU2B/L/i/aO0z0AB/qsYKAwQGjZYwVnPxX4cgIPYMOV7cbOZjcTccGsOy8X
         nbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146576; x=1790751376;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93ESgb5epDnv42DkJ10ZS+s0RrMivyUc06fbtYjyWtw=;
        b=QsIwkpXXfg9cNkCKBERTvl7qq0R7O4JvrGDr8cqRep9oA0IvUU/KWFZqNLhMYmV8Ur
         MCcs2i9WqhH8Vp2WnWdWf3SE4viYl8LIrzHoRhQDTPi7aqHmLq5mgPra02nmF2mKRHqQ
         +tY8eS3qai/OS/eV65p+ZQtRMeTi6Hj8tpdpLZb1uVvlV8t8mNAesXmwBKxmSIdRdr3Z
         pf2MKaq0pPpXpyIZxIQjKMuumSel4WhTuBLsu5/1doiIXOc3suKQfYGuzy+766kH7P/E
         XzFgD1xHXx/M8K6LoZrWRC03MyfUfZ9yt0tLB4SehgymG1Le9+MhmevHO6vo85XjEvBd
         7UaQ==
X-Forwarded-Encrypted: i=1; AKwUvBypJAgksGGTPTtyY6lftrTFzw0FtqJBnQb2+U9WGH2yoOsZAIQmK0kLB0AyBMU6FHsycDH+5saVyxXaFzA=@vger.kernel.org
X-Gm-Message-State: AFuF++nSNyfs89bMmGdiArnyo1fRJ5AUCe/PQ3pWvANMUKO3qM4cuGU2
	CJ+hnzfT2eUL5OWr96N246dBEB4O9mBWN7WWa0elKJj0mPCzVKlKY/q+xlESw5gjctKPlbsT//L
	0
X-Received: from pldy20.prod.google.com ([2002:a17:902:cad4:b0:2df:3fbc:5137])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a6f:b0:2dd:c053:82f3
 with SMTP id d9443c01a7336-2df69dc5153mr13412295ad.42.1790146575481; Tue, 22
 Sep 2026 23:56:15 -0700 (PDT)
Date: Wed, 23 Sep 2026 06:56:12 +0000
In-Reply-To: <20260923063114.2683575-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923063114.2683575-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923065612.2707049-1-morbo@google.com>
Subject: [PATCH v2] HID: bpf: add __counted_by_ptr attribute to device_data
From: Bill Wendling <morbo@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	bpf@vger.kernel.org, Bill Wendling <morbo@google.com>, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

The 'struct hid_bpf' contains a 'device_data' pointer field (of type
'u8 *') and an 'allocated_data' field (of type 'u32') that specifies the
size in bytes of the allocated memory for 'device_data'. Since
'device_data' is a pointer to 'u8' (elements of size 1 byte),
'allocated_data' represents the exact count of elements allocated for
'device_data'.

Annotate the 'device_data' field of 'struct hid_bpf' with the
'__counted_by_ptr' attribute, pointing to 'allocated_data'. This enables
bounds-checking sanitizers (like KASAN and UBSAN) to detect
out-of-bounds accesses to 'device_data'.

Because the count 'allocated_data' is always set before any access and
accurately tracks the allocated buffer size at all times, adding
'__counted_by_ptr' will not cause runtime panics or false-positive
bounds checks.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
v2: Reorder the assignment of the buffer and the count field. It won't
    generate an exception during execution, but it's a good coding
    habit that also satisfies LLMs' paranoia.
---
 drivers/hid/bpf/hid_bpf_dispatch.c |  2 +-
 include/linux/hid_bpf.h            | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
index d46779b63660..fb302d0b9797 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.c
+++ b/drivers/hid/bpf/hid_bpf_dispatch.c
@@ -255,8 +255,8 @@ static int __hid_bpf_allocate_data(struct hid_device *hdev, u8 **data, u32 *size
 	if (!alloc_data)
 		return -ENOMEM;
 
-	*data = alloc_data;
 	*size = alloc_size;
+	*data = alloc_data;
 
 	return 0;
 }
diff --git a/include/linux/hid_bpf.h b/include/linux/hid_bpf.h
index 19fffa4574a4..f45fb9cccece 100644
--- a/include/linux/hid_bpf.h
+++ b/include/linux/hid_bpf.h
@@ -185,10 +185,12 @@ struct hid_bpf_ops {
 
 /* stored in each device */
 struct hid_bpf {
-	u8 *device_data;		/* allocated when a bpf program of type
-					 * SEC(f.../hid_bpf_device_event) has been attached
-					 * to this HID device
-					 */
+	/*
+	 * allocated when a bpf program of type
+	 * SEC(f.../hid_bpf_device_event) has been attached
+	 * to this HID device
+	 */
+	u8 *device_data __counted_by_ptr(allocated_data);
 	u32 allocated_data;
 	bool destroyed;			/* prevents the assignment of any progs */
 
-- 
2.55.0.1082.g2b9226bbc0-goog

