Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449351;
	b=Slnt4nTuYsLUbk0p5pQDuZNNJn5vtZbMsUlDRD11PYdmvI7GEoaneXeaRs1PuYciFq9t
	 OIgUtcbLH5bpfMxKWPyyZwVGUATHOodRvD1x6OgwSyQh7IaUUbGYXP2gAPGB0QkkFIQvI
	 gMgf/YQ0ZQVroFYNp7ApRsOTyXstKWycuvupQr+fl0THY0e5aJe/qvaNdWef3TuTf9qhj
	 dW+y86L0cFLzfZn4R1fDzI9hlRlHpYxrqXPqhrMPfpTt4AtkKbIjkH0pVfoIUYa/mqaJI
	 WmW4fsVLcrARkASL72SuZNgNBy1xSAIuv8MUoJ8jDUeBvQsqIjxfMF69wWOrEePWG4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4lkK+MSkES5wvh82VxF8M2qBGmgjlmTgHuUFRptrIZM=;
	b=Xt1v5cQI+DC20QTRnspP0/XLhpdMLzQ8Joby7zvg94bmwO+62qpmA5r/Oy6BkGWqiRSv
	 hpeTHgmNrpabsGgybsRC9vxYtVGkZ4boJ2J3a4WZfK0bjMH7ZgROiSII1QKSWpmANmd8c
	 d8Z3qoSYYpGv7NH08NmmVm0iBlNdSGo52nw33NTuygVEVJMLf6bkF/FBlk2BY5msWkR/J
	 GZ2jFDfhRJbzqoFztecR5k95FFeKeG0kBULIN3orLgkz+JN2rn+YbuOM+46Mp2DUoY570
	 6PCHy1/0kxnMUQbFeKFeAkznAeQZVDHyRmJk168WRpEMBwtXTImB9KlKemeHZ7Tt5qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MELguBSR;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFB3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MELguBSR
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so1294007f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793449349; x=1794054149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4lkK+MSkES5wvh82VxF8M2qBGmgjlmTgHuUFRptrIZM=;
        b=MELguBSR6j5uo5JEHTweez9q/Sg06UfOas+d6V3ON0MC4q4X/WI3qEWyd5nMOIottr
         d02dwPmEaUy9YCwshKzLy2S5mw1Pdu4LO1fZDP1tnPyySCb5qPiii2aY9YE+CVGEL4IG
         7RBuHPCm21i69AmDk2Uc+wnwG4ar+lHEgfgxxXA2mIBz/gcV+ltcOjoe6rlezYYBBWtk
         hqMkt6FKQ/eghMeqAonwx48xXMHD0vkKmsdd1rrwnV0IqV/VS45eVo6ggYvE8WbVZ2Bb
         LnVbZs7jj4dzKyesS1UKeUQxzMikQU6XgV0ljW97VXRqUxtYof1Nn4wzlanbxMz6kqG7
         wNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449349; x=1794054149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lkK+MSkES5wvh82VxF8M2qBGmgjlmTgHuUFRptrIZM=;
        b=AmRJbJUMI4RJiSyULtYV1Ghpihl65qq9SZ3kkZQiafaGQM9oITYLFdHCmmyIDVbFtC
         3574XLA3i+ihLmNz3dP4zZBM8k/kXEYbd4sYMbq0be6LtuHSAywWlFmx7JCltGB4qzJd
         zBlQNow47MPYG8UI2Cn9aMrI1bWXpyg1Z4/j/JJlXRt1aT3G6h5IviePyN8+Z243dmTh
         vrNxdu140o9PBOQZLzUAcFZRRPP7HNrMHbwgj5u8oN5L4QTdmNCMa2zCbkbgnxe+58az
         mPzJEC7vKj79s3mx2zFa3sWB7qfjnKAxUYvLHk6qQ2KYzp941Tt79K7RUp0lDHLbOmdh
         AmdQ==
X-Forwarded-Encrypted: i=1; AKwUvByRe2I4bzGfiOMoqhECvxKd1E4I9JqIuNwi5jKLmerYw5xP7gE6NyHfyF+NIihVsiZrkSl/l79gJgkLUg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJozNiW63+5NoOJPJbKuHFLmUsEL18N8oAlaR9Br/DyBRJWZnIr
	7E1UX9TwzZyQQTvgLJsqX2rCJJVvrs2DvVyb/RQ8PfCQRMh6HGyuvhsS
X-Gm-Gg: AYBFou11PJL3+cy7LWIhiBI0lxVLojqgOnwZ0KStvcaz7k8uzj0DeSuacfUmLe5fjo3
	6dBBAnXP+EhKwYowlIqtBaILXSesdAMXw5BzmTRvpE/7LVN8/AonHh2QuzlH3UlFczQspZUWXZW
	EliaiBV0sEFZkJZJJZf/NF3Q+kjCdevLzu85GP6o4dHCvCRocXb65ES2DiT/ICKjszTReMl1k1O
	CzA+AgwAftQxizf36w5XGlgYvA6aDTcyxRgIJO1MDg3XqK6d1u1PgdFpudN+ahofX/y5+5OkZOc
	X9nkeVH6Q0kg3dZm9qhEUVxL1CedEz1QwsZiS7F0OG0rU/EOAYwPQ9wSNrhunOzlpAf0+Sdis/F
	z5AQQc7KhYy1YbiHsXDxrQdc0DWoU4egNfFSaWr/jeU5hmw0Q7Am2Ixq+2JgOrxi324oUqCXdiX
	VqIPExcfgflP8XBAXJSuRyI34zkTVFNvlguN3Dxw0IcqW/fRFn603WYJw77mF5738biA3xXonmQ
	2SW9f1FLO60bELdaC9lDcJX0WmN/xCq829Abx9KYm6MyPS33CIpR/LFc4hm3gIgm+5aq/Dy3hc0
	bP0ouzqh/pdnNPrPnLGorod94+sD
X-Received: by 2002:a05:6000:4287:b0:488:7df9:3898 with SMTP id ffacd0b85a97d-48e6e30ba37mr11837908f8f.56.1793449349518;
        Sat, 31 Oct 2026 05:22:29 -0700 (PDT)
Received: from thinkpad ([2a06:c701:4773:6f00:d8a5:fbc7:98b2:c0e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm8442627f8f.47.2026.10.31.05.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:22:29 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] timekeeping: Reject cross timestamps for invalid AUX clocks
Date: Sat, 31 Oct 2026 14:22:17 +0200
Message-ID: <20261031122218.118921-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

get_device_system_crosststamp() accepts AUX clock IDs even when the
corresponding timekeeper is disabled. A never-enabled AUX timekeeper
has no initialized clocksource, and a previously enabled one can
retain stale timekeeping data.

Return -ENODEV before calling the device timestamp callback when the
selected timekeeper is invalid.

Fixes: 9aebde8af6fe ("timekeeping: Add support for AUX clock cross timestamping")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/timekeeping.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index dcf47f1ffdcf..7817c97dab61 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1600,6 +1600,9 @@ int get_device_system_crosststamp(int (*get_time_fn)
 
 	do {
 		seq = read_seqcount_begin(&tkd->seq);
+		if (!tk->clock_valid)
+			return -ENODEV;
+
 		/*
 		 * Try to synchronously capture device time and a system
 		 * counter value calling back into the device driver

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.53.0

