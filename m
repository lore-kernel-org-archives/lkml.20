Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F054421245
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903329; cv=none; b=fbCaOHT9x8ficPLZEjVzGONl3AuZ3lBgCO8VQxoReF92z1P0dNYKWjKXxm6jGnCWQiS4jceiJhzB/6iN3KuVnPqpH1/zjr8/siPxjiS2yx/n316dcCKyayYzafKax4pgQnDD2UU/SfbRGNkjAMWKgfRLaT2z9H2fRpdxuV5hrGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903329; c=relaxed/simple;
	bh=sA+c0WYN2bPE37DjivosiMzZqIXScnG8RZ8vm73mDVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JY6jCFaBI/HUkGhU9L41e4VSGVYziNWVA2y6FyBzb3dFBjrYQjEqpEbMmwhYcJEEK9TkRJlyFV1B3o/YBvsK990c+d3xZCDnu6P1vSUABX9CTHWqgg4Bg7QSzMSk1+rygs50uywDIi/UAHh8tsi7XGgWvOQ5t5noJrJM7bYY1bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+FPW5ID; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+FPW5ID"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2a4e013a44so459499666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903326; x=1792508126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TF+nw/u3d0JmPL6ecEUe1KLmlN203omllzFb/e1Krk=;
        b=B+FPW5IDbVmXv5qoJIijVwHpsX4YU/QInEBDUpOqsLBmmX1MYRxMLEe7tnM3BE8jDj
         1erpU2ROG16qi0e1uMw88Bzp1CXiwSgjkLVaT9EEmESQW977Q8OfvXtGohEWDParWUVk
         TFEW6XzK6Jd94paY6E3C0kUsYWScYKQY6iRpZnS8ZQIEsh59aFyk6T/TPRFq9l94MmOW
         rnQ3AyIAqgj4v6oKe2dTSyf5XkZn4J+Di9sR/2bBfQzB0pnYHRFkJoaMUg26zdAr0XCM
         R794TcuD2yuMcnWmHNw5AgkXAXLB9G0zCWFjL2Z7v3A42ZuN01AJlt2BATc0gHOBQsBH
         3wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903326; x=1792508126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TF+nw/u3d0JmPL6ecEUe1KLmlN203omllzFb/e1Krk=;
        b=XnXLisxBhjQ61Gc8D3SdXuzDJ/zKiiP3B1+VF/rkOYpWvOpqRLV1F/FJRX/gIHtyBz
         zsuHHLyd6Qda9KZlzQZUEuQm/L1pA3JqVLsSo5GBYnQSTouO+2MezfoMf918/18fMnE/
         i9hnqmxrxjrQ6sf7AsOjmMrB92LNBfQmdMpZR+15Dy+iQVmXi9nRaxlbPbuotE9AU4nl
         P8nAEly7Fq7RdpFhrLSrRXjRqsoVIlxVLFeTrqyhS4gpF2UYpYT7NPoSGHiW0+uM20Vk
         m4BEsRcZQSwDDhaTs0oVSWTGFcUNN0uejPU8Z8xMJFgCmc8gUhMyCJ3VDsTaQDpbN0RP
         0ifw==
X-Forwarded-Encrypted: i=1; AKwUvByzUdMjXdVZCU+KLweA8KIQ/56OSRR+ld/HTAFCxgB4+ZF0fDCrwUGFLvlZPoQDztYHiw/vyqkZWnzGYR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK0WTqaEdGM1587KihQM4LnP/llMyGHq504oKbrDt9/M1o9CwG
	0gxvin+TzuvVS15GUa9LSNo4YdYE/GOj9jew+Zfvoy1znfBw/6wz8up6
X-Gm-Gg: AYBFou3/uq4QDBEBy62tOE90y0rm1b3KYH/p7ELjmBRmaAg4snOI8yR5VePRwjIJgfg
	/hpoKWH+zQqscFwoDwDWDDAT2UlbvvNshGdJtlo5U1lMZX2n9gAbxBgwDzWL/QFJI6W8gxjkkZG
	VZvUM7q1sJCGb2OYaqGMgGyAoY7nkIP/ENEJlFRALTuUPTIwj0Jw9L5b7XZcclShJbHYqy8kOiU
	fJn9s1sUG/ghDoKBx/mMR5ih091qR4GWd1ecqpPsSI39qhnoaHpgQTKwjuo00s/onYr4hfA3SOO
	cqyzb90Z8Do1UZWJUXdXDqSZ7WXT8mqBN6JTDgoMH7XasAeXx0B0FBaViDD3nTzgPBkunu3ywkw
	6GuSdoA51GyGNSDv0Ubmm+Ts1r+NEee78oLKb2G0pjy73jxglgW+htaAIpgI8P3nCsjlpeYOW+B
	nfnuMqS+Py/+vHyIFvz6WmkcZe3gEJAgtX3PKQHjJDD9P9kxET+y0KwaMaJBdnG7lGq8EAD9d4J
	KRsUXZ06QVNgfbBb4phjBuaWwPcqosELFYjBrtJYIxQzRc=
X-Received: by 2002:a17:907:cf93:b0:c29:4634:5c99 with SMTP id a640c23a62f3a-c31a9a06099mr1143506266b.4.1791903326142;
        Tue, 13 Oct 2026 07:55:26 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e03428sm6169161a12.37.2026.10.13.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:55:25 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dm zoned: back off when reclaim finds no destination zone
Date: Tue, 13 Oct 2026 16:55:19 +0200
Message-ID: <20261013145522.17499-2-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013145522.17499-1-illofspeed@gmail.com>
References: <20261013145522.17499-1-illofspeed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When dmz_do_reclaim() fails with -ENOSPC because no free zone is
available to copy the data into, dmz_reclaim_work() still ends with
dmz_schedule_reclaim(). If the target is idle, dmz_should_reclaim()
keeps returning true, the work is queued again with no delay and the
worker spins on the same failing pass.

Re-arm the idle poll instead, so that reclaim is retried after
DMZ_IDLE_PERIOD. The next patch makes -ENOSPC the expected result when
an idle target has random zones but no free sequential zone.

Tested on 7.3-rc7 together with the next two patches, on emulated
host-managed drives (scsi_debug zbc=managed, and the tcmu-runner ZBC
handler under md RAID5). Earlier versions of the series ran on 7.2.6 on
three 27 TB host-managed drives used as md RAID5 members.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Assisted-by: LLM
Signed-off-by: Kyrylo Biryuk <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index c041413c729..315f0da99f3 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -540,6 +540,14 @@ static void dmz_reclaim_work(struct work_struct *work)
 	if (ret && ret != -EINTR) {
 		if (!dmz_check_dev(zmd))
 			return;
+		if (ret == -ENOSPC) {
+			/*
+			 * No zone to copy into: nothing can progress now.
+			 * Rescheduling immediately would spin; poll instead.
+			 */
+			mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
+			return;
+		}
 	}
 
 	dmz_schedule_reclaim(zrc);
-- 
2.43.0

