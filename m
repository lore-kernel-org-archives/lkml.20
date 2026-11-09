Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232572;
	b=wEKIjm2z3x8E0o7OL/a/H49Kse6X/uP0t9kChFc8qLpjI2SVVEyonNnrAMnqRh7LxSUs
	 RrgIs5AlMahYvZU00bY9oJTdFUBWaMreActCkKhQsmYng+YMY1C2a+SygeHLDIuS6SYvH
	 xYNLVfskBeWsYDdRwXOkPMoGzBDQs+JrqklAU2ikcfkA7qfCcVrMh2kYGCfDAbmAkPIp6
	 Nr18Ccn1eq3AdypVbSudJCE0vDDJFfKR3HhsmLNeNmo3kLfVVnfaUlUVhddwELnOIuHaV
	 RpMf5o3ZIosmz32o6FW3MDYcpOi20rX99A5S2WvcXcCXiDnND7PgiVFJ/RZWlsQcFlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RHv3gURbuO2W+jg43SVbmYLuoiZHrEg+KszD86+zH04=;
	b=i0R088PgmWr5TjUH1QRXs1FpkcUdV3KW+HBRosTPIFYTBcBibw9f+UJ1V43aRWewitu3
	 byd22ZBQqbGVZTQz3kp1T0Xe+D6ZqMdZc5KCcCD+j78j/fRTMNg6tRij7dAwgvP0L8w98
	 /P2ox+rhESMaSs7fjxE8oELeihMxFZUTzC8VN8MJyk0gpkicXngzO4dgKTpJKQ5QgEEWC
	 wva9Dxe4Tfx2Xi88sgxUJvGEsH+AKwz0V3mGeHNw5nb8/u+/7yRDhsvzOfMoCrcn+r7FZ
	 1i7exHOecr2aXzVUGpsQzhgwMrfQg3a7ueX4JKy6ZSVFy5VvSIlisH4tw0fiKDsdz6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OsIuLNLN;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E492606D80A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E492606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OsIuLNLN
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1931ff67a29so2300099c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794232570; x=1794837370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHv3gURbuO2W+jg43SVbmYLuoiZHrEg+KszD86+zH04=;
        b=OsIuLNLNaww9tz5lJyUoPqpk4Lc1G/AO1Wqv/1Y+S+O5X8VY5Hrj8OCu6Xl/019yjh
         q1ND+5fT6g12NhRlt4hgOfcQvOm8LCBvM5RdvhVR6bGEON/7Jq1w+rJOWvX66fA7bWw3
         P18uG38RC9qZLBWCF4acC6fg38y7t0EX/krt0ukaLRD5xhY8DPXeNvO7Z8TptWXII2ou
         qMSMOoZuolmIU/jr1IHWlM6HM2qxT+9ckq/3LrVXdfrmhaAoFoiKzX5f59CIEifQW5tX
         30dd6b2pkA/t0E6sZhckaDNCYhicdvyQXipUM0TkrLCq5eV10DQWqeh/7zPz2+zbmjD5
         1sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232570; x=1794837370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHv3gURbuO2W+jg43SVbmYLuoiZHrEg+KszD86+zH04=;
        b=M5+Q1gwOo1tp2f98xcbbAvURI4to5hxkkIavP2BhN0Bc00r0xbn/ZpZfwubkfNTvtd
         ybQkoMcHVOa3m60n9RTvsak3Ie/Txvn3uS4wm3q/wZ1oPBA/meYlwtAH8HONn7SuUWZT
         fKXvA6OuYLmaK07Au7eWDyqvlJKZb+u6OuBX+LLHpC1EAXabrdSEYnXp8S5SscFZD8kB
         oo4eTSQlWP8uhh2BryU3aNMcqq/9ECyCVEIHRa9ekXOIN9MpuYYQUKCyRz/uuZZEKEZc
         +cEM99PpHaZC3xA6C6KIM40IkmC2CcO5nCWBok3D37s5Z1CcwCuBDyBjpyCAUyajTcBM
         8c0Q==
X-Forwarded-Encrypted: i=1; AL+hErFnK/CoUZZJjqakPOG414tacztSyii8hXuupOef9vCMLHaw0QEiFGcoON55AdyCOhUrCExeRxoxYhDmGkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FkcFjfKnvW6fRdL6+GH104rXklmhhFT4SkfOpcy/UJV5BcN9p
	2CAT35Pvn7TbObyCzRvE257AwZC+JTRxYLA0np3JocOf5E47xzPaf1sI
X-Gm-Gg: AYBFou32Stq/uk0aN8cEsq//ezyzPZN9jgMuJmtn4fIEQ1RxD46RncuzVa3ZR9WeGTI
	ZZ+pMJBzeYoLw8jzVNIsa90CpApDtdiSTRKO9bTuPPWo5XtfMC056QbYzTKCQ0c2SUVtQ0gT5bs
	toSuPhCYuTwTjAzeUlBe2b7udplp65S6uqWZrDl0Socs07y7TBZWXHkeem0ZIdrsv9vE4z7hVu4
	8qwxS22wHNN2nXuw/r7hz45UhTqeXAPpjTqkC+tnC034Zr8KlTf8sz+x8P19rLmtPvC1IxUdb1b
	HI6iEacOGrMDFBu6CdQm1+CESrW8IshtiacH2YGodJSFd0FVxfmgYRNp66honRG7jB2joGJ3PAk
	tYh5eYbuO6DvqBLQKXKpIUdlDpZxmY3/TmaLOSFZV3skIBwujS9l81lKSsA4ysVuP8u+oWL5LrY
	ENJujT931NdHLcGCGB+n+OaFUaaPrOpGb+1a4B2lWLCTT87K4Pkpl3A/zqyW8CWOKvOnzPAv6O2
	Sz1+BqX3BZDSssCTDiDmqLnqvfNToCJOHKLWitMUYacfHeVhzF6g7KSR6IVt8veHDRi4UPt2bbA
	BG85CDUCWC4cOC+gnheKwcw+DSKhzT5tgqVH1iPb3cq6SZ+Q4Q==
X-Received: by 2002:a05:7301:f10:b0:36e:a11a:b2f1 with SMTP id 5a478bee46e88-372573cd51dmr7024741eec.30.1794232570369;
        Mon, 09 Nov 2026 05:56:10 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d48bdsm21677471eec.28.2026.11.09.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:56:09 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kbusch@kernel.org,
	hare@kernel.org,
	hare@suse.de,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] nvmet: reject invalid write-protect feature values
Date: Mon,  9 Nov 2026 13:55:36 +0000
Message-ID: <20261109135536.2772-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The Set Features handler for namespace write protection currently
accepts unsupported values. The default case in the write-protect
switch leaves the status unchanged, causing the command to return
success even though no valid setting was applied.

Return NVME_SC_INVALID_FIELD | NVME_STATUS_DNR for unsupported
values. This also prevents issuing a namespace-change notification
for an invalid request.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/nvme/target/admin-cmd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index f12d83098644..ee8be237485e 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -1223,6 +1223,7 @@ static u16 nvmet_set_feat_write_protect(struct nvmet_req *req)
 		status = 0;
 		break;
 	default:
+		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
 		break;
 	}
 
-- 
2.55.0

