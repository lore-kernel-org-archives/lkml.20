Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F337361977
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741296; cv=none; b=sEZTemwsjlBbPFMLEzUxb2MX/pBq8H5/OOj04c7puDjnYVILDTInNB+CEkaH3XP67X/ytZYn/Vx4ZMQ0zydCkIoWTRGCsLE6bagEK5fq6BqKEwpxpcAA0av4PkogAj9qibRVAbMddipEYcCbZc/Jhzhie7Uo8gQE7RN3A8DRIwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741296; c=relaxed/simple;
	bh=hnZPPxNjNP3M+NNFcM7Wule6SFZ3tVs/Key1ofFfNtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBvmXdjH1ZMEsR4/lO1KvGSApLeivnfSoMU5mTl/DLoRiPmFc7sZrs2SNg6SFJM4mn6UIX7lliIpp6V/PyftGi5Wh1LRdp8QEzBj5b2Crf1AEG9/gbdT50T6lMW9MiNRI05DMe6pQcExYN6rN7oxPuqZFxppiDI6QAIEhWR9uaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boIXmj+K; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boIXmj+K"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so202186666b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791741293; x=1792346093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHXmKJc8K9MpQJ3EOpjUbD2g6SFTRQKUsqdSG2/4nEk=;
        b=boIXmj+KIwCQ+tCu5OA8FY4+2TbXCOkwaerBlHD1E+TUQHniIv1H/g+4keJkOnvOkb
         EIDwAJbIBN7Ohs6D3pqMt5Qh58r2u81WqLRiOpnsjTwV/Zf9VybIaGbW9IpOECF1zYdy
         lc6TFTyI6HHXU3r0WAAg/mkyjI2nN8obWiAhUl4dDn0R+pT9u/FmoOnHnb8ESYUpckUj
         OvfBp1L/qdvm8vDO7MKfGRV7Rq0YoqldHV/7FZdzhW55QgOeAnLsq4jst3Z1D5BZkjvo
         gqZDlxpXr3EyrDQTlZDD1Yvzhd39odBxAwJahwxrluceB/kbe7UeZMealoG6ypxyaxBK
         0/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791741293; x=1792346093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kHXmKJc8K9MpQJ3EOpjUbD2g6SFTRQKUsqdSG2/4nEk=;
        b=rAngDz0K4vPDdrgs3QecX0W8lfwjbcq9yLW1re5iI3GK+UWmUyvYMkyLqT4vP2+sLJ
         MO/BlnakGXQNw+aPv3O8bPmW0ZVTMZcY3QfgwxIUgpCILAfUo0iUweVTbNURTtf5MOmc
         9mswh2VwHFdG6zGz6m+z2ASRAZesnjgHb4Sz6zKNI7lrX/GfE+dIs9VZ8zPQryhOrZw9
         w8FUyYoyA5pggAjfaqH0imZOJKVgoBNwrKgh2AkuYBRbIh5JEf9M2OVdS6erFmDpNhvY
         +civvkSqWGLziIVJr+bHBBKX8fE844Hgzcl13n6CKqXs3DaWkRjcNrrNfKbp/06QDngf
         GLjg==
X-Forwarded-Encrypted: i=1; AKwUvBwIZN87KKbxVPGsibEUF+GIf/tPjXwKpaA6zR5F2ianZt811srMuHBDLaoEyCENzo5A+mr6ufrTR4XVff0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcfol60E/tbNo7oszubCzqshqVZNzngKuYhg/rkytdMGshBfVC
	qpV8FuAHaBJfE3PZ+REvM1JZRql3OiIqBvCi3gnWgjmA8zGyAeIDM5yB
X-Gm-Gg: AYBFou12RpoP09SEBUypAamlilFxKMbjw3csFqAJYORjU+QEZfQSppLftYvPw3Law8D
	1NfE44/JXxTpRiDfCkS0HK/976vmOXPDD2aKjgqT7AMJ8XNrRP+ALeQp+PnpQPqmJ7QIt4u19jT
	Y8FL9f6sUQ4N1Q2QHLu5k4glzeWUh3cQLHBSq/XT5C0uyD8rYXm3DFTyyNW2+xCuDVTisTVX1ML
	TuHuWV9vT9udkhRFJTc9NMg4dxsdHcUeD4DCZVpffmUg9GzYRgSksbt4GVdd3SQM9fW3AJhXkIC
	2RmwEPRUX2lebPXiXHjBuKz/A+y5tsCq2SYrkEQLN512Otbo46Swh8AtTIOLSWNCQVXWJO81dMp
	NoFyXi1gaF4NZ3TA6NgiAJCOzQeJ+xoo+O6GgyLb4t8gRlpNDoRPsqvvlkJeA/W798E57Cn8NEe
	LFGHX+WZ8GOtx/lKdd5cvsF7HUvusrY/7fn3hpccWMFDJ2ULUwt6/K1feKWS/WDPM503ffYSQpT
	F4AJofzxhSqzbGSrCBURteoZpdpLVGSxAcufCLy2grwfwM=
X-Received: by 2002:a17:906:f5aa:b0:c26:19de:9ac5 with SMTP id a640c23a62f3a-c31aa0960bamr707128866b.29.1791741293351;
        Sun, 11 Oct 2026 10:54:53 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm376806366b.48.2026.10.11.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:54:53 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dm zoned: back off when reclaim finds no destination zone
Date: Sun, 11 Oct 2026 19:54:48 +0200
Message-ID: <20261011175450.952-2-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011175450.952-1-illofspeed@gmail.com>
References: <20261011175450.952-1-illofspeed@gmail.com>
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

Tested on a 7.2.6 kernel as an out-of-tree dm-zoned module, together
with the next two patches, on emulated host-managed drives (tcmu-runner
ZBC handler) and on three 27 TB host-managed drives used as md RAID5
members.

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

