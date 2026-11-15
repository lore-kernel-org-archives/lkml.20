Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745327;
	b=Ug7aosdk4H52dgygz7fhXQhGP68pqK3lU1pGgz9I7TDb2lWNLsYKven+cBeNDLXqgUhM
	 PtL7o2h5TTP3a/DId6wi4dGKyxvNkOqVXce/N2Mf/vZ5ndtmc3GzDkGFL47jb70Dpu6yH
	 Hk1Zf2jC2XAQIFwylN6KvjhHUNdt2p715RRoZ1cEVtp6XmIjEEosMHAQ0p8Qyg5nwzqfK
	 YC1OieJXJ3Qqq2pxYSmd4vUacoGDtAV7McrBo9YqLgw1Eb6gsVHJnbMDR4k2nIjOyELxG
	 QNNZHICc/VcJbtrBdALLFtzXqeBi8qTHK5iOKBNNG4N/MxNaNSHzPmm8rs7uGI1n5GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V+iHTxqWLAe/kGlFuuYa1byGYNwjkpUiH9I6TQaXj6U=;
	b=O0Q9JScrhY0u98XaMhW/OsQY45yBGn/GTQYDJn+Z7B4zGh/G4QeSFDJjzPVyMBlXdHOI
	 HSX8BGd96RKMZtGgM3zDWnsyoXLmWWnwKUmWF+SCQCP1IT3B9VbMbvQC5c7Fso7B6AP2A
	 X529jfUvFZLX19SGUbXNrucXUt7aY/2KIRM4PZtKu1BSjGGIbnCX1H9BVqAinLQC3A8Rl
	 oTHsnyX/9RNCs9yo3pxxL7h5FOp/08CJ7m8GxqicYUkFtZG8nyxk4sHliGvFEHb+0xS70
	 JiJwCAh/K0DAZgpWL2e7SdAPKuuB3bALHj+jIpRmb++sqz6Cj0xWphtjOF2tELY64NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LGNmQr0G;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA36606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA36606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LGNmQr0G
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1070092b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794745326; x=1795350126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+iHTxqWLAe/kGlFuuYa1byGYNwjkpUiH9I6TQaXj6U=;
        b=LGNmQr0GVfYIB04gnbPzEbs1s0P/x1X/0+F9jbFrB/ihtSkIGG+dzxjeuH3xVE12xo
         3UHtCVrysKRyflQxL/GueDCUA4Ng7r+N1ZjTUvf2IyvB+9hgJgeoa1ucfXb0YjLKMrR4
         Q1LOXqFs05bQs0oyzAbw4Sjx7d1WBMTydz2ZFQxOlCviJDPJM7DKae7wQf+DQSGn5Bmx
         /hvMl/v+Wq0TgXgdM7Fc9nyjtejw8ysqzlKiDLznhxdZFDTkLJZavFvjNsU7HJASaexX
         QQkk99HNs/m+/JsygaA9AIc512huNwNR/faj8QP/n497Nh0AFUKR8kQ3xkaBFmYIm3LS
         kn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745326; x=1795350126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+iHTxqWLAe/kGlFuuYa1byGYNwjkpUiH9I6TQaXj6U=;
        b=Rc5F4XXp0R8tkN57hw7kRa5ZCngBaThj+sE7gkBbU+W3drhmebYxS/PI3VyY5d8zP4
         GE5fZ15afarSB0RTcxmFr0zfVPE4x/m6b7yezBBbt8eMfURVoXbJlPM0/dpfnGBdUpMi
         Tltib71Z+SrExAd2KsnaJ5MMfhaT92epDfN4Vm4yeVZ8JSxSBT9c+TVJb+Tyvbs7bYPh
         AByFkor+5wQvi2ZFG8qPQyOioQQ0tg6dS7/FrRudYZvoQ+/wW/By5BS++2LuezcAw/2r
         YQKz40GV8mUGPRE+IoiNJHdyY6S7BrmaX0iupfmmr61bnU+kJ7Gyrhxw5J5E7bFUcLZA
         S6ag==
X-Forwarded-Encrypted: i=1; AL+hErF04muCu0Or9pd1nyDXoUjt0WSJgDpt7Ag5k5TSMg7A1sCRqJ0BB4QIl9vBXz2tV0tU/pWCHRnQikliCTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mEh9jLgzpdx/IfpA7UOFUQpZoJjmU4mycITh9vVtY2CBinu0a
	VTcBq4KjWDXJjauNuIpxPhRHYuK1o5OzVvyw9x6yhDKu8lDk31OFn8ElIws/bcPw+X/rttnH73S
	ErnR5iOc=
X-Gm-Gg: AYBFou2smoBxnopCskay83saBqGpGvdD7+8TsRP9Hsfox8rJECapAypSUETSyin5IsG
	elpyv/+hJ4Zd9cJ3QmNy5EniluaOMa06D3LuNn8mNuUxBODdoQv1BGeTzHVLFmuepr7UPcNpVXv
	t4Vjtt+ifmd+1avpUnqGAe7JwheaXyplISNgWfDUTJErQ4JEc0MORrHhUgPHi0hLXhSmtyxqL1T
	NZ7EwcTKHX4WIX/9phWXUlibZd/3Zu4LQr/1J+op1tWdHqSVgMHCwe9YZRgxiUmkjevc9cLAGae
	rCONrUUn0/Z1wLb9l17L2/ypctnz4P0xhgDNug544Q3RtYP4yTnEIz0dMSvLNwOBWEdyvzwt4K9
	2GasFHhdtDKisuRLVEnxzdBD0kGMJ66GoMQe8SaOw8+g8RfuR0j5IMXUQ+jxCH09FbQzx3yIibr
	7GwU3Yjk+McFZK/SXUvuudobOSJskPI72hEENz4H4wFZhna8ombvwvJLq2js+J9ZiqNFAGACrfo
	bUjhRZBlJ9fznCAo/m/KPwhT7/WHnW8tz3J68ThI6EfK4vbl1F9hyAo/NCDq5VrXTmFyt6X2ssq
	lcIhur1A7hiVNhkWF2UzvNV1DmIpTutethv50E/JQsdhx/MbrpP99G1+28sVu0ep6FUt9+wLKwm
	Poxd1MfIxcM8czETae/WNZBOj4kkI7goYtfuLfmA=
X-Received: by 2002:a05:6a21:38e:b0:3fb:1091:bfdc with SMTP id adf61e73a8af0-3fb1091c8d8mr732255637.37.1794745326564;
        Sun, 15 Nov 2026 04:22:06 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:35d0:694a:1071:9bae])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdded58a9b9sm1220520a12.12.2026.11.15.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:22:06 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] scsi: mvumi: do not free or reuse buffers a timed-out command left with the device
Date: Sun, 15 Nov 2026 21:21:50 +0900
Message-ID: <20261115122153.1446810-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

1/3 stops the controller bus-mastering before mvumi_detach_one() frees
the buffers it was given.  2/3 keeps a timed-out internal command's
buffers until then, and stops the probe loop from handing them straight
back to the controller.  3/3 waits for the event work before the host it
points at is freed.

v1 -> v2:
 - 1/3 is unchanged.
 - 2/3 also stops mvumi_probe_devices() after a timeout instead of
   asking the next target id with the same frame and data buffer, and
   frees the command on the duplicate-wwid exit, which returned
   without doing so.
 - 3/3 is new.

The review of v1 raised three things, and each is answered above: the probe
loop's reuse and the duplicate-wwid leak in 2/3, and the event work that
mvumi_detach_one() never waited for in 3/3.

Two more, both older than this series, are deliberately left out.  The DMA
address rebuilt from the command frame in mvumi_delete_internal_cmd() is
already in flight as 7/9 of
https://lore.kernel.org/all/20261015045213.3975845-1-yhlee@isslab.korea.ac.kr/
which deletes that expression altogether.  The unlocked sync_cmd test in
mvumi_issue_blocked_cmd() is a separate defect in the submit/complete
handshake - it does not release a tag twice, both releases being under
host_lock, but it can leave the counter at -1 - and wants its own patch.

Based on mainline.  It still conflicts textually with that 7/9 in
mvumi_delete_internal_cmd(), only in 2/3, and I will rebase whichever
goes in second.  I have no mvumi hardware; this was checked with a
KUnit model.

v1:
  https://lore.kernel.org/all/20261114014430.489668-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

Yehyeong Lee (3):
  scsi: mvumi: stop the controller bus-mastering before freeing its
    buffers
  scsi: mvumi: quarantine a timed-out internal command's buffers
  scsi: mvumi: flush the event work before the host is freed

 drivers/scsi/mvumi.c | 73 ++++++++++++++++++++++++++++++++++++++------
 drivers/scsi/mvumi.h |  3 ++
 2 files changed, 66 insertions(+), 10 deletions(-)


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.43.0

