Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA50382381
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741297; cv=none; b=ug75Z7THO3jGumKepgxi0pvWELf4fuLBCPvyHPQAqdDJAEs8Ek1TZorz5pGh71thlpPFjn9EJ6af774zvfFO3d/wdpSmSZNvNjOaug9kx1DxV7j/2o3z0UCgmHInZV57Bw0+RTKjILgxFMSHKDlVHx06/SjsqtHubDeODrsuHSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741297; c=relaxed/simple;
	bh=K0CZG7xuPILHEy3PPebGGH33gpysZhnHLPL0yIEoyVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJ7r1MatJ58ehhp56/U10doxf8w0ppjDV9KXB/mY0MrPNTk/L5XZocyOogQ2oPDXmHy03QM0F1wqe7h2+gIzU0CY6NsHL8VcqkA+kPGicxse7l/U7LKOUb2LaOKqhfBSJ/QQUqarQTr+0sqmFQrvf+mYFGb5QDMn5BK4JDRtFDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snb2eJkK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snb2eJkK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e3846d1caso209783566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791741294; x=1792346094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSdAx+YZhxSx7N8hRcIJeT1HZY3ybyZ+3/WgKoWE36w=;
        b=snb2eJkK3vuHMQqrvgtNB1JA6+nyfRmPOzpIaRkrmlk3LIIOrvPjulwaaFJ2yg2vMU
         etYwyoZQb6WWHMBL5uSYX9Zcd3jeux2lUwO2H83h9i3i8ayOnoZIqvs/HofeTqo1Cvij
         Esez4fOJGSImkQcm0RS352ojAo4cy5UO8dnfBL/H61dpVMZpQJxmOiYg/N44Ft896UeI
         5CrBSDvqMEKfE83wSV22tfStsIldwNql5QvrL7XTgiD1Y4MYX+mH7Niq80CLj22JpcRq
         Xxcr95aJmKKBeFz8LzEaEFpYlQGB5Vsl+oT2po9zDCewW6JDqRQZnU56h65JfEVAcAL6
         yuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791741294; x=1792346094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fSdAx+YZhxSx7N8hRcIJeT1HZY3ybyZ+3/WgKoWE36w=;
        b=GEWRmZ3BlPm0+tiVPmFpsneaY69L4WrgXNDbTB9bpQM4mAUI8KNnpYbFe77D8wpdrG
         0y/jdQ07i5R9kwy/qGuHi6BNHq/AeQl2gJIY+vahIWBk8BUl1eg9+/pEDEU6PMFsdndZ
         u/t8org7+47QaBQ6CETwBIRD5viDJu25r0hEy+cwKU7y4WQYCo2GNlxXRoghgWCj39TH
         T8f2Dp3Z3TlrhPYx+HP8B+pC6u7JMen4mUBxX36MmNHljQZm2DK8NfK39FHwgKW7mZPN
         UyXK44v55rNCEZeNRzKaJ93JJNWTGCLn0SAWDukyXlvZi1JGdBgDZ9ImwTWXKems5eOq
         CU1A==
X-Forwarded-Encrypted: i=1; AKwUvBxrNNwxOY7rT+zhmGm2PlyQP1slNCDh/bKKuhuqnC+d59cX5qh0aPyAxl5LJiC2W8QJhNEkpxOhFK8zf8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuWvjlXf0FDHj4PlvDM6JaTGwu/VduswTg1F1m62Jc/JYw6UTT
	kMwb2lkNx7khPOfxupf2MZlwvUFiSwAnegeiWfUx6t5FtXQ3VB8S17JT
X-Gm-Gg: AYBFou3dJcovcC2YVbEWWWOilOduzVfrmQcOLRUZY7kGfRtE+YeDgzOY4GGPxti+Lzj
	JDS0Fu22UGwTaGHCEnJNhnKXu7rqNTdCSCn7dRh5LqyyW0wtJE5a9hN38FnoMyGIle988q59kyl
	LVglvEmlOzj3RMx9evDaj8ShyZngtUcQYhvW7I3KqonrFXDUObgGcFpc7qruSPyCxImbWJ3vlGJ
	MadpTAQ2pVcyiXqkpRxDH/QUG1D5k783s5YkAuiFG65TjZme5jIAUvFS2mBOjBoHrJlz5I/9t9A
	yNpbflj0xCxS5KeLsAS5y9cq9MzpwzYKj5OsADonvtPql93odhT113f6BkrpL5sdy0LRrkYyasB
	a9BQa3x1pG3Fgi9zxtsbyOT6vOWJkrUIZ4hof6sTAiyLdM2mBl3GaZlaHls9b5/k53x3BHVHBd9
	P6iATfVH6rUlkkWxjM1VgtiZBt9hEFYFCz68v5HmjZPNJtpHG3E4solJXKZfsE4J5ZKLCZjeUjb
	oobq801Kscel5p6SQjCTdIY0er9jVQlwf37QhnA6SZS45o=
X-Received: by 2002:a17:906:d54f:b0:c2e:7fe7:289f with SMTP id a640c23a62f3a-c31a9d31c9dmr763732566b.25.1791741294120;
        Sun, 11 Oct 2026 10:54:54 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm376806366b.48.2026.10.11.10.54.53
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
Subject: [PATCH v3 2/3] dm zoned: do not reclaim a random zone into another random zone
Date: Sun, 11 Oct 2026 19:54:49 +0200
Message-ID: <20261011175450.952-3-illofspeed@gmail.com>
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

dmz_reclaim_rnd_data() falls back to a random destination zone when no
free sequential zone is available and the target has cache zones. When
the target is idle and the cache zone list is empty,
dmz_get_rnd_zone_for_reclaim() selects random zones of the zoned device
as well, so a random zone is then copied into another random zone. That
frees nothing: the next pass picks the next random zone and copies it
again, for as long as the target stays idle.

Seen on a two-device target (256 GiB regular cache device plus a 27 TB
host-managed drive) used as an md RAID5 member: after a full rebuild
every chunk was mapped and no sequential zone was free, and the idle
drive read and wrote about 72 MB/s each without pause for hours while
the free zone counters in "dmsetup status" did not change. Reproduced on
emulated host-managed drives (tcmu-runner ZBC handler): 340 MB/s of
copying on an idle target, 0 MB/s with this patch.

Only switch to a random destination zone when the zone being reclaimed
is a cache zone: moving it to the zoned device still frees cache space.

Fixes: c5c788595292 ("dm zoned: start reclaim with sequential zones")
Assisted-by: LLM
Signed-off-by: Kyrylo Biryuk <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 315f0da99f3..88d56d3c86d 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -288,7 +288,13 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 again:
 	szone = dmz_alloc_zone(zmd, zrc->dev_idx,
 			       alloc_flags | DMZ_ALLOC_RECLAIM);
-	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
+	/*
+	 * If no free sequential zone is available, a cache zone can still be
+	 * moved into a free random zone of the zoned device, which frees cache
+	 * space. Do not do this for a random zone: moving it into another
+	 * random zone frees nothing and, on an idle target, repeats forever.
+	 */
+	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_is_cache(dzone)) {
 		alloc_flags = DMZ_ALLOC_RND;
 		goto again;
 	}
-- 
2.43.0

