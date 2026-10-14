Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDF2524B18
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991172; cv=none; b=KMwGfheQDPkNNaV1IQZoA4F/HPW2K215OgojbsZFLLUh5LA0TctAlvI3ehY33SXx26FdGcHvHAyKwBFdEhZVjdHIm0ZRbcQx7NIGaWdxPg4FG88N4pntcmpi/4EBxhmdLW+rVVCv7BEXxFKUKVsneBdWftKtoacgm0RpnG2AK7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991172; c=relaxed/simple;
	bh=IFyaKeG8PqcZmLWzpXkqwho5yu30vxmgLPrGWSAnX+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oF8QnGCLL8nwYu37wWxHsGEvbxiIi+ba4bccFIi4TTV0dlZXnyRzrpyHPGFr09urIN7CL4KYX6Ju6Rw37EvzNFOrcQBFPSKksWNH/62mfNa4AAWRgQ9bR1gMMsl0ahwZFenoSiPgmpm7Lk5tHm/XBHogLItEM68SVYlcmbGBh6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=QQEf+RdE; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="QQEf+RdE"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso2423925a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791991169; x=1792595969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=srFWpE+TVCETelKCcIQxO8OekNsEmjBOESyjztjbwL0=;
        b=QQEf+RdEyeOZ39t8l7ub8jwhe/seu1fPHTnXH7NSaazUSTElQC7ErzsJz9uYchSKeD
         9o2pctw9prhtviu2ZFUL5pyqKS7Ve//Tt/pfg56pW5mGJTxB6YbYD/58X3ZZCgDCWsgQ
         99DXuz1APdPiyXjxX665vpdWJOfX+YkGWIWVFH1XqJ23poL21pDb0hHbRM5eEM5Aq6X8
         635UuRa+exUDQxNG0wtfO0CbIAy2yAy8kr15KyHbomQf6ym5otZlIXHyC15217i72iOq
         R7nDqMICimvb71VvZJD6X/5TIXd7F4jAOSDswaH75dLQvSkqTEpR6usMj6m0BUZ+quTG
         Hfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991169; x=1792595969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srFWpE+TVCETelKCcIQxO8OekNsEmjBOESyjztjbwL0=;
        b=XGvgbxrSH1AuA5wRQBrcVCLHQ3Fez5S8Ik+EDqiIcY7vHQUzqoVvg9s9CJxJmi6kL5
         kboeTc3pHQDF6n2wJMpl47ufIMvJCHlqbCL9zuCMBKb3RtYUUMUX1WTpoCkLVjeVw4i9
         opxCOBcOywxUKSM5gFPftZ3GFSsKpepJqxTYZtPRIOPvi8LQnYpgjz6MopYisK/UX/Fn
         4q6RdIDLAI1xN52SQiRmJ8/2fTCpVoqwuW4O17wjmdi+Gu5DCmn72LG6r3UBU68prQ2Y
         DqfDEjzB9PlIvsEtXYHoe8JJbo8dGHd0e0LxrHmX+JbX7ZHiGlgnu1rySoVsLMr0t40T
         hjHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7rDPlwwC30qC2a0X7ziRAEIX4MZgks0sFADRxOQMqKuqu6MAaxMxwjJ2hTCxIMMuleeeS7HRNaHa5RLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxKbvI0RUCsUrchAtwswtVbodWISJr/GtyLIqrPQe6P3IhWSHu
	tVIB0VuZoxFYzk7yH94HIbk4jOlOQyHfCXK0brg7CrfxP2F0rQFYnzKlCVZloTw48pE=
X-Gm-Gg: AYBFou27S3d/BAnkZWjXxyukDjr6mL8xO032hnH8dysZEDu5IfY+zwkwQivocOLJrPM
	c2T57ZMRlIhzHwAMgkH7QmgKhblDA13cFvKy6Xd4dnqQrbkPFyp6MQiOVsmEa3KJC3mv/Eyb8c3
	YVoRYOpItTh7NvlcDhoIpMoE/AU8QBN+2EmpRQquVEjP9W6SHZj1lKV7oap61ZIMB0oWRQ23ZoH
	zL2eheiH4N5I5X7hTGSIORyhMDhIusRgnDaqlx5gRf/OzKt93wTMuvCMl2X4w4WCnXPnYJQujyX
	Q6VV4dd+rKvjUBK2CN77OjmHRuuq3SYzwT/CS6/Y23zeedr34a1fG8MjTllKZ55bc/6kuttRqHK
	qkgoHyCTUBjS8Aph2zKIwRw2PKEgi4cRMO7mQ6H1mdOUXctyh+0Bj1R2IrylrEVtxnhKvD0+g7Q
	YnudAd9jt8hwHbcYWlw+X8DdPR0OVq8fPJnBXgf4gmriu47sub7BJAT4y4+LeeMOzWBgpiHG1Hx
	eILjoHPIlcbjG8kTjqjF92sVQjNpk0=
X-Received: by 2002:a17:90b:4b:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3ab3ac59383mr12662310a91.47.1791991168762;
        Wed, 14 Oct 2026 08:19:28 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:1c49:61ee:8c8:3f4c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac8d40e7f3sm622450a91.5.2026.10.14.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:19:28 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v5 0/6] scsi: mvumi: bound the values the firmware supplies
Date: Thu, 15 Oct 2026 00:19:08 +0900
Message-ID: <20261014151914.3632701-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This folds the two mvumi series I have on the list into one and adds what a
full pass over the driver's firmware-supplied values turned up.  It
supersedes

  [PATCH v2 0/2] scsi: mvumi: bound two firmware-supplied lengths
  20261013173145.3412863-1-yhlee@isslab.korea.ac.kr

  [PATCH v4] scsi: mvumi: reject handshake sizes that overflow the list
  allocations
  20261014134104.3528958-1-yhlee@isslab.korea.ac.kr

and both of those can be dropped.

Everything the firmware writes reaches the driver either through the
handshake page, through the event buffer, or through a response frame in
the outbound list.  The patches follow that split:

 1  event buffer: param_count and sense_data_length index fixed arrays in
    mvumi_show_event().
 2  handshake page: frame_length drives the checksum walk, whose counter is
    an unsigned char, so 256 or more never terminates.
 3  event buffer: the hotplug bitmap size drives two find_next_zero_bit()
    scans with nothing holding it inside the 512-byte buffer.
 4  handshake page: the entry sizes and max_io size three allocations, the
    list depth drives the ring index, and a reset reports all of them
    again without reallocating anything.
 5  response frame: the tag indexes tag_cmd[], and the value that is
    checked and the value that is used are separate fetches of
    firmware-writable memory.
 6  handshake page: max_devices_support is a u16 and the loop counter
    mvumi_flush_cache() compares it against is an unsigned char.

Patch 6 depends on patch 4 and patch 5 reads better after it, so the order
matters; 1 to 3 are independent.

I have no mvumi hardware, so none of this is tested on a controller.  Each
patch's reasoning is from the source, and I modelled the arithmetic and the
loop bounds of every case in userspace, including the values that should
still be accepted.

v5:
- one series instead of two; supersedes the two above.
- new: bound the hotplug event bitmap (patch 3).
- new: validate the response frame tag (patch 5).
- patch 4 also rejects an entry size too small to hold the frames the
  driver puts in it, which is what made the max_sg subtraction in
  mvumi_io_attach() wrap.
- new: widen the flush cache loop counter (patch 6), which answers the
  review of the v4 posting above.

Yehyeong Lee (6):
  scsi: mvumi: bound the per-event parameter and sense dumps
  scsi: mvumi: reject an out-of-range handshake frame length
  scsi: mvumi: bound the hotplug event bitmap
  scsi: mvumi: reject handshake sizes that overflow the list allocations
  scsi: mvumi: validate the response frame tag before using it
  scsi: mvumi: widen the flush cache loop counter

 drivers/scsi/mvumi.c | 156 +++++++++++++++++++++++++++++++++++--------
 drivers/scsi/mvumi.h |   3 +
 2 files changed, 132 insertions(+), 27 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

