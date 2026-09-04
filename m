Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74DB4E8E1E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534197; cv=none; b=CCqcTJuFsCF/CVywRsKE55gkTQcvKKLcAgyXAoAikcdgcyeaPB+FfKopdgYdUL74HCG4ySvsogB2PqRKKgXnrFM/rBc1szr7Y5WrKA8QGJIMiEzWY2ljMWtdq84wfpablcVJ2mPvNhmUqY9/upZ/F/FpnLqoQGNJxUvHjiENLvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534197; c=relaxed/simple;
	bh=RaXX8VJyPOJNRhZBa3bCoTSLDAkhaKdHEayJvkI1wiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7NinsnOp5bgOPXaUAyOFlyV03hr4gNjZYdL+I5YE2E3NToAUw+Ubv/7S1qn2h+Fp0UMSZ6FgawKiZHLt0MxOPprcO60HoH19FJ9qEgVj6iN9TjFSm2Xl57+g3ecvJOd8/G9juP/U0M1v2mePMEFYY0k2L8+SKq5aGWFSWRwL7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=bU+1iRh3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="bU+1iRh3"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1629948a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1788534192; x=1789138992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wHU7q3pRFtkKql8fEyqkLOSTSzzZohiVwSCb3KFef/E=;
        b=bU+1iRh3L54e2zbgbo5LDZ6pzXO4k+4SdX7gTmzc26AWX/bocayi+xvPpIf+lKNuke
         IpJbRYD8Tsp6GvIVtmnksDXgxyHQJEU7GgzE4uTyAcrDNSzXPhZe0egZ2TJ6PB9a0FHl
         iL+EqkLDRvOxhGzD3XtxFl20kCAKkG6TTGYT0DaQYFs6hDf6m6usnWsmz6q5+fUb0mpX
         weY1GAvwhNl023jzuaN+gs7E+RE55b/HQGX8QPP4DF5R2S+PpTHHhMfFZLU66GobfU4o
         00mdiTSJVqm/c2suXs6T2UQq5svuwFkE/GOPKBe0MEIDiwwqqfkRwaJSs4NWnbsrW1S5
         hj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534192; x=1789138992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wHU7q3pRFtkKql8fEyqkLOSTSzzZohiVwSCb3KFef/E=;
        b=QzfqFXyY8+c+NSOYtczJZ2Un7W3G5BXizkz/ripTTRkVQnvidwvKeh3M0j3l5x3Uug
         F0JUyYW5BVQmUQXCaW9Qje99vi5VpEgJoqxzG5JxbtGtedhLrkDXcEV3am7hjZzB3Dv7
         L5asaocRiVCghPhUXpPb2sqC3GpkqrMvnZGNYyXUP5yJDvW9SwyYbfhDsN/avIN1bY0K
         Tt0n7tlTeo2DvbOfUX+bMFJ2RaKyZgiaekXciLEZYL2xSgd3cRZjcNLMRH0xas599CuI
         71BFZKkHCw40wNxENcPHajfJ6zZH7QPo3VlULFSbusokEMQp5q8MgaJY6ZOg1nYi+xs+
         xZjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl9Wcxx8dCR4eBfOvuFsoI9lI2ZOYqEhL+3tfQRyS8aPSo6ql1Nc9YHtt1VHOAmYENXstYZRQlwfHP3Gk=@vger.kernel.org
X-Gm-Message-State: AFuF++lsoxRjPMvxlTbZ8AuO42KpRyvJgFqOmi6hCHt6laG3F1E5Ngf8
	/l4pgD4Z19z9vZr9pciLhHT0fMrfh3NnJ9WlA1V20/yXSOk/QHW2jP0uzsJjbskTmmI=
X-Gm-Gg: AYBFou31lK/hPTGy7Wb6khaLYrdBuqWjYl7rwpulWiQLoJzAr0UipRwkjjIn9mXVfYx
	WDwsAemQaPQvqou+AwhgkwpvNZ4zIkPL4JhO8i/xrFJzVoCqBcSt12QdknH1gXkH+pZgN5fUETW
	MgiWa15SQcGvlX/qAmzyLjHwz/7iPoTNZ7z0A2o8wBI4vmn09H/Nv2ztwSmqHP6Y+tDPReD+Uhh
	84Cs8OZ9TapYBrHylUokZNTjgjD1GPveNb2JltTow+XTykSkh9Wgfl4IN4S0Xhio2vsLrazwrUY
	lRj37+19AiP2fum11k/QMArYoZsOMkJIZ/CZm3djlr/puDHOYnH5JoVUK0qULcC/Tb5PqZumMWL
	HX4ZlTO74YGmEU2TCSV34Gq44gaMgTveoTO6oRUgvLNWZnDafGYXFQQgnCzg7o9VZ0E+DV/F6Ib
	z0QNW0eGLpO7Ipg0wBblggT2oCbD3FRHNAJJK9cmCDCRbdaC0brPuCqgLUO84xnykSrH/B3cF49
	IYWfcBQKCjaWKIcmJz13gAUbmrQpmEtzNCRflJESX0m/vvGikT95WrFQ+zIetlx
X-Received: by 2002:a17:907:3f95:b0:c25:ee8d:99ff with SMTP id a640c23a62f3a-c260cb45800mr321415566b.21.1788534191627;
        Fri, 04 Sep 2026 08:03:11 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm122438866b.63.2026.09.04.08.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:03:11 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	xiubo.li@clyso.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] ceph: stop checking a stale MDS map after dropping mutex
Date: Fri,  4 Sep 2026 17:03:03 +0200
Message-ID: <20260904150304.49104-3-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904150304.49104-1-max.kellermann@ionos.com>
References: <20260904150304.49104-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_new_map() drops `mdsc->mutex` in several slow paths.  Another
map handler can install a newer map and destroy the map being checked
before the original invocation re-locks the mutex.  Continuing to
dereference newmap after that results in a use-after-free.

Use the `mdsmap->m_epoch` field to identify stale maps.

Fixes: 2f2dc053404f ("ceph: MDS client")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/mds_client.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index d36a114747ae..86d592f06196 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -5844,6 +5844,7 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			  struct ceph_mdsmap *newmap,
 			  struct ceph_mdsmap *oldmap)
 {
+	u32 map_epoch = newmap->m_epoch;
 	int i, j, err;
 	int oldstate, newstate;
 	struct ceph_mds_session *s;
@@ -5887,6 +5888,8 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			ceph_put_mds_session(s);
 
 			mutex_lock(&mdsc->mutex);
+			if (mdsc->mdsmap->m_epoch != map_epoch)
+				return;
 			kick_requests(mdsc, i);
 			continue;
 		}
@@ -5898,6 +5901,11 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			mutex_unlock(&mdsc->mutex);
 			mutex_lock(&s->s_mutex);
 			mutex_lock(&mdsc->mutex);
+			if (mdsc->mdsmap->m_epoch != map_epoch) {
+				mutex_unlock(&s->s_mutex);
+				ceph_put_mds_session(s);
+				return;
+			}
 			ceph_con_close(&s->s_con);
 			mutex_unlock(&s->s_mutex);
 			s->s_state = CEPH_MDS_SESSION_RESTARTING;
@@ -5921,6 +5929,10 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 					       "mds%d reconnect failed: %d\n",
 					       i, rc);
 			mutex_lock(&mdsc->mutex);
+			if (mdsc->mdsmap->m_epoch != map_epoch) {
+				ceph_put_mds_session(s);
+				return;
+			}
 		}
 
 		/*
@@ -5936,6 +5948,11 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			mutex_unlock(&mdsc->mutex);
 			mutex_lock(&s->s_mutex);
 			mutex_lock(&mdsc->mutex);
+			if (mdsc->mdsmap->m_epoch != map_epoch) {
+				mutex_unlock(&s->s_mutex);
+				ceph_put_mds_session(s);
+				return;
+			}
 			ceph_kick_flushing_caps(mdsc, s);
 			mutex_unlock(&s->s_mutex);
 			wake_up_session_caps(s, RECONNECT);
@@ -5991,6 +6008,8 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 				       i, err);
 		ceph_put_mds_session(s);
 		mutex_lock(&mdsc->mutex);
+		if (mdsc->mdsmap->m_epoch != map_epoch)
+			return;
 	}
 
 	for (i = 0; i < newmap->possible_max_rank && i < mdsc->max_sessions; i++) {
-- 
2.47.3

