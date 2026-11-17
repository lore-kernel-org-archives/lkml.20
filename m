Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922971;
	b=Wk9RTT95clnf2b/fAYYNQW7J1YJafO1XGCxXjV30XivhyBmrl7obHMpbF/bwW7/TzN5s
	 qJZeatvVTVzTY3/LuBc5iY04RNzs67Pkwz6uhUSefKSdUBslMPPaF/k9c14deVLZZsY+w
	 0IrFZ77mREI8BDhmLqRfu60QrMaCuwFyEuEj+zeUXOVE23kCbilBAqG4TzZxGw6g+pUkG
	 2/H7VP2zIVjm63bEumi9Od/AVybHFAgM4WxVpF4pG5ZeHoI88+JPsXgly+KcYDWBPFmne
	 imyesPUB+wYw77RsZEPwAeKGZSxmiNuxCUyoI9bAfzzTqqoH5pw14sJz+H7iLE2sn7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYvyOgeDLhWRH71wL6BvrJmUkU6oMEvaRE2drZaf37U=;
	b=EJZi0nJxNoz1pjN5+eLKhRE7gPu6+VPgHnehPgmaGlVjZZl6TiJUAprgiD/6UGyS2JfL
	 gzC2KzwXCELVusaAULzcsDRWNv196uFy+g4aPh/nC2v4uKQ06iBQzJBVqaEBVoNXqadRL
	 mubJq0edk79llZQViaimelZ8ct18/yeunqjmr2gWwWXZNtW5ROtC46Rb42cGf1LZg2V3M
	 oR5xNDroPprgbHQ05aCm5YLBdILPDwhY7CRL/6q6n5gicKlUizK0n7qJ3aZys/Fi5weTJ
	 KLVMGCCCwE/wOXjZkafz6DyXZTOeps1dzFQ8ymbhKlYXV2rOO9TVN/n1vDEUliPGaZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="FJ/gNqVY";
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA296606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA296606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FJ/gNqVY
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so2604611b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794922969; x=1795527769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYvyOgeDLhWRH71wL6BvrJmUkU6oMEvaRE2drZaf37U=;
        b=FJ/gNqVYyrVQqVNQp24+Mvcm2/Fswm3iWpTCbYFvz0mLTfjWb2EkFBahcNFhIytZpX
         oJ2NTGEZiLB9dJJLFGHQAIN3o2Z1XJ4tUDbFUrgXSGkcolgSv6x8WtsMygqbFfBJqvRs
         hDjYyoV6SbCHBB2yHjUlRcOb6V2xDsi0HFIiWtE/vDP9RxC0QJTcZGIMHDVTWhDe7xoY
         1h6b0OhZ1/kMSrYQshblurkr2FYZSUKSSvpwlUtovdiH9yjS9bG8/FRqqdHNf2SreFgh
         Bxkd4jnPyupdvIw/hJ+oCaodZMmEILOkHTYkhySeDPbbPCBE9cFDIUiqgjLGrW5lZLPm
         AmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922969; x=1795527769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYvyOgeDLhWRH71wL6BvrJmUkU6oMEvaRE2drZaf37U=;
        b=BUGbxHvP5u0LLosIvnW+8O5PtLW5xJGxJIC8/TXLyDT0j6NJwaa1ew9xKWRwsKxVBW
         LNkpcrIYWYwtnH+jpGmIhEMpFmRQI1ns8isfsMcSHch4SlFRB7rMOYo7SNIEws5Db5v0
         deU3eR/wtKlalWgQhk7Y3xqO39OrtLxGWiEx7p97+pDiceepozHmTQ62++W3ArPsFmoo
         xab9tBaV201985ZTDZ+3NEh+A5MfgYBX6OOGHZRE33E3X9lKqq+1MdyBQJkKfRZYvqPu
         oSYOiAq2a2sVevHT7bytaRgGssEY1nbJteEsT/3Ein6UEulF1orhrHudFOGX+1n+sa0v
         OzFw==
X-Forwarded-Encrypted: i=1; AL+hErGPRt9EhEcT7zE4wAzBe32mIbdygDnqSicZBi1qqn+irEbBCs6HJJZoY9ZVS97Jf7csGYgrXOPUOSiMwKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gPk+tnrJ875A7Ztvh9e/34mh0YvkeaF20UWqwNGMHG1jPQuUe
	2NA0XijEB7LasR7ru9ggKIGtcXvBTQPUhSvvAIGh4OTutwetPATmvBhnF1UF0AvRnGLEmklO9BI
	E2xXQqvw=
X-Gm-Gg: AYBFou00utUJOUstWzlX3EZ9UNlw5pYg/ww8HNuZOWJ1m+Y6wyXKhdrqho05z1k2t1T
	6lYZSWLaxCgr8GbzopIrrzhDwFOaTnmxF9oEWrxm5NNp1rvTKt8Z7seH6pGxsdx6kbbgVTCqlHF
	IAOqN9R8dfT8Q1BNe7SR3tg7dxBJjD8W93OKYP4Xtx75RAWGIohUIvXE/AeIJO0/zL5lk75i3CB
	8usRTeL7PviC+0Lyv5xZiem1il+Qvpry3zGGZ4I0dcy+9BBJCFmd2iDuQwKNzeop3kD2e0JH7oM
	4bruPNtoIVYvufvh12QW0EqiQ9tR3E6l5cZ3W7tZUaDFLe3cBTclN6BFFdhQWtSD1E9aMA6xCMB
	B6sgHSEGCTTfOBwe1R3m+aHi0lMxmWa7dTAkM/FuAN4EeJcaVmOy0E4Tf3YYMBqa07RskuHqG8u
	m4FWwgwTb8K+gnWfFU/8cP98ns7ywZqSC2UXDffqnrVtUFRN4ZAtKRftcXSnLjpydSUdv1gdNqs
	YdRzdfgfnOzFMWamSN1jU5CeA1c9J0KbNZMhMWr2vsrlKSHxQUgUPAJVlVujYJFfo/MqrsQSDJe
	AIXzed+cFZX/Nd39vBI/G55+tuOrIDuVzWfA4IQ+Eg2j/t+QB/hh+TP8+Sp3cMQNRM5uGgxOgjp
	E/KINuHOtbMnvKTcZ5+HBSlbc9KrgSi5D7fBDHg==
X-Received: by 2002:a05:6a00:340f:b0:857:7317:cff5 with SMTP id d2e1a72fcca58-8beb6197550mr11801170b3a.22.1794922968711;
        Tue, 17 Nov 2026 05:42:48 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:73df:c7da:8e76:82c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8024sm5040714b3a.11.2026.11.17.05.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:42:47 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zilin@seu.edu.cn
Subject: [PATCH v3 0/3] scsi: mvumi: do not free or reuse buffers a timed-out command left with the device
Date: Tue, 17 Nov 2026 22:42:24 +0900
Message-ID: <20261117134227.2077013-1-yhlee@isslab.korea.ac.kr>
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

1/3 stops bus-mastering before mvumi_detach_one() frees the buffers the
controller was given.  2/3 keeps a timed-out internal command's buffers
until then and stops the probe loop from reusing them.  3/3 waits for
the event work before the host is freed.

v2 -> v3, from the Sashiko review of v2:
- 2/3: free the mhba_dev_list entries an aborted probe leaves behind.
- 3/3: clear bus-mastering before mvumi_release_fw() on the probe error
  path.

Left for separate patches: the DMA address rebuilt in
mvumi_delete_internal_cmd(), which 7/9 of the series below removes; the
unlocked sync_cmd test in mvumi_issue_blocked_cmd(); and the same
bus-mastering order in mvumi_init_fw()'s error path.
  https://lore.kernel.org/all/20261015045213.3975845-1-yhlee@isslab.korea.ac.kr/

This conflicts with that 7/9 only in 2/3; I will rebase whichever goes
in second.  I have no mvumi hardware; this was checked with a KUnit
model.

v1:
  https://lore.kernel.org/all/20261114014430.489668-1-yhlee@isslab.korea.ac.kr/
v2:
  https://lore.kernel.org/all/20261115122153.1446810-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

Yehyeong Lee (3):
  scsi: mvumi: stop the controller bus-mastering before freeing its
    buffers
  scsi: mvumi: quarantine a timed-out internal command's buffers
  scsi: mvumi: flush the event work before the host is freed

 drivers/scsi/mvumi.c | 97 ++++++++++++++++++++++++++++++++++++--------
 drivers/scsi/mvumi.h |  3 ++
 2 files changed, 84 insertions(+), 16 deletions(-)


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.43.0

