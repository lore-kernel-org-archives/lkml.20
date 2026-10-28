Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197051;
	b=HyQWNFtTkkRCmdb8TObo0z4c7TO4lXACUTbzjqoiQ3pqjJoepWxboMGw5WmyFqz0j00K
	 zsSO68pJjzII4wP+Vm5Iu8d3LbII7E7tg6/MCjPas9aan77JzKHEgMwJyk8rOjmYpL9eN
	 rNIJ9AWAL+MldXJ+iYdMxoLu+w2+qN8gKmdSmAEOPclujVp32//+GuP+bYaVVGFxVBUa3
	 kcWagikPAODkjM9qmopZyZMP78Ycv1uAeFnYwtiteXilkzOvsBMbTREj3QDzlCk8t8aSP
	 yzyPE4Xy8qPmvNmfISFOx9sDEHEagQ+z51H0gyz7oe5SvLwOYB1PparG4l+0unjKwJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=400J3GHcIQLYwc1sIdmefx5I/Bqi2GbTm1mkxszhp6A=;
	b=KaufmqDDUrm5OIFZzs7p8hf/UDLnkIGEIuSnkJmPMSSMFmCOjYtjbqQO/BXgsQ8ssVrt
	 5n7cfhF+yOFpKlcm0qJKzti32QxfAcA6txQCSkptwn+Pl5APGi4nZml9wyTsiuQr1kgiA
	 nlL+n+z/i5bnnv8dXUC/EMQ8ODk3DienzReiPkGfxNu7WPhRNr/UEpl3skI3ZFkKBzvFb
	 ibA9ZBbiRhIOm/S0HBlmnhiI9XXHEsk1DLMWLOOTRjdGFddmTre9Id20KUtc9BD7TH7Oi
	 x7GEgpc5NcjhMOv2U5nuhNvbnedVobKTlaTSt4L25HC4c16j/+IA45HAs3yrdb1d9fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXYDhQyP;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B188606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B188606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXYDhQyP
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5378b281aso5332945ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197050; x=1793801850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=400J3GHcIQLYwc1sIdmefx5I/Bqi2GbTm1mkxszhp6A=;
        b=DXYDhQyPBdB+66SGq5pe4HNqA7llbQQiVEhcYQMMEPtK6oNXB6ldbDG10MbPNB7CNO
         aVArXI/j0nIa9vUh9PwsdlfIrqAkdy/c6HfY0v7X5QrV+HLrjycExkRtiaEfxEGrVUKY
         NtBkwW5x2i0mCLvIHwZWzqaRklYkVabxm4ix1PZ6eaY99yJVEOdFoyCFmVPqzumzSz7F
         MvWLFuJ0Ndl+UfThsEwJLtrxMxRjMF6MPJ8WCdNVsA38Fu+0Yh1DxPfZNeYJMgMFpC+3
         pybBmYTrNyTcAGj1zaZqUS/nmWKXmPKTG3tNAQecnDch2OdIxy63hjn3eHArAlqwTwAv
         3bHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197050; x=1793801850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=400J3GHcIQLYwc1sIdmefx5I/Bqi2GbTm1mkxszhp6A=;
        b=I7Xpgz5MBefLodaBTjpfsHJm6HR5PojcIkEr6cpNzwI9UzFwqKCoS2fGint6YTi3Ts
         UgBlpFQesG5Iv2eFSYiUTBCgnWB/phvHPCe4XfTyooiYX2la0YGLEVFN0fkzgcZSdQfT
         Kr1OEBgd5Q8qj2gaib2acyS2liUaXnaMGWewLeHR1wKLZGbOh6GY4bkfCn7Yg6HVzZi+
         nAxLawkzzuK+wYh6XZb+52/PjEZzfVWeGu3epg2Deo+MG1ZSZknX6VhNgq89Nl7YRiXi
         iHDxOFmwi7sGvkgEfZmRMJ1kYqMHBilSadCkuNn4lkymz08/d7XUbyUyjn0CB0GcPk8b
         HveA==
X-Forwarded-Encrypted: i=1; AKwUvBzlDx8OtD7J7wRIlksg/7TFUjvlTGfwJqsfjKi6TXJ6qHr5rZfEEPMGFtO5U8bBNFUP0B/4fhvlAkeQ5n4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4scubOkJcvtK6RZySlhWaASYTK1iLyJdUs0Qilev/SDQxDgkQ
	2iyuTQFJKIg7PrzVxModOEDZ2AkFl5/YkCKEa6KyiSr1WMb7b+NE6UU1
X-Gm-Gg: AYBFou1hrnAs6ynQorx3hLZbqpvFAb74xNblPqEhdMmh9EpOu/0QZbPNXJLoY851DQ2
	HpVd5CMAc8kz1pmbUcKM8W1vFZO+vO2jHrd1vuNX5LZjMw79QDns2gP5JJ/Ax1vv7tnZnQ6x5h+
	HwNXCM07gf07kDJOyjoIVDEioOZyoDVlVnlxEq9cCI/4zF6trDOA68oOxZntD+TLsa9ZLvZV9+g
	z+TtLQNsaP4K/ngHgJt/7w1jMOfZO4yGLB9yK6hVNHJo7ra4y/SOSquy+aB/dx4FpEFyCori6oB
	K7j38mbEX6kjk7HMKTX2KGc3byIATRNAcqqSxWx5hY050/RtdYTJFLfzVoWo3ezPB0sNnTuMf8K
	CFUbiIEUbJf/Ruvlnc3lTmc4ihVeLNeM+ug9aIzgoQyebibFts0bKYq07SZsMDRwqXMXMiadvjQ
	msEDR1OoCE1xEFdIjXHb5YtuP7usDmwjkh0+DLPBH8wzUg6v7TmaHR8MYIYnCJmQxBw1BkD9XI0
	8XDq4OJR5ZQJiEoHebm0nR1p0KOeeyG3vONJkpfFY4N5/3U9ApSNlo0tSeQxX57hs5nG4sndCwA
	iew/fvmsWSyRndmvtA98vSBhBqqcfgP+AbOpWz2lOZFn1oPhvowMzJVGbvolUlRczOVh
X-Received: by 2002:a17:903:2447:b0:2ea:71a7:7f21 with SMTP id d9443c01a7336-2eb002e2967mr23279075ad.13.1793197050082;
        Wed, 28 Oct 2026 07:17:30 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm22396935ad.18.2026.10.28.07.17.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:17:29 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mac80211: drain link readers before stopping removed links
Date: Wed, 28 Oct 2026 22:17:08 +0800
Message-ID: <20261028141708.5532-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Removing an MLO link can leave work queued on its link container after
the container is freed.

ieee80211_tear_down_links() stops each link before the RCU grace period.
A reader that fetched the link earlier can therefore queue work after
ieee80211_link_stop() has canceled it. ieee80211_request_smps() and
ieee80211_csa_finish() can both reach this window.

Record each removed link while removing its keys and debugfs state. Wait
for RCU readers, then stop the recorded links so cancellation includes
work queued by those readers. Free the detached keys after the grace
period as before.

LLM assistance was used to find the bug and review.

Fixes: efe9c2bfd1a8 ("wifi: mac80211: isolate driver from inactive links")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. In a QEMU KASAN
guest on the declared base, a built-in test reader held link 1 under RCU
while ieee80211_vif_set_links() removed it. Each of three boots reported
22 unique use-after-free reports before the change and none after it,
with no lockdep report. A reproducer is available on request.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

If "wifi: mac80211: free keys asynchronously" lands first, the key-list
context will need refreshing; the RCU wait remains necessary for link
readers:
https://lore.kernel.org/r/20261026125145.68153c510dfe.Ieaf95b8e1336f07866f54d174f699c6aa079d9b8@changeid

 net/mac80211/link.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/link.c b/net/mac80211/link.c
index 931950a10508..41c7dfc49a24 100644
--- a/net/mac80211/link.c
+++ b/net/mac80211/link.c
@@ -191,6 +191,7 @@ struct link_container {
 static void ieee80211_tear_down_links(struct ieee80211_sub_if_data *sdata,
 				      struct link_container **links, u16 mask)
 {
+	struct ieee80211_link_data *stop[IEEE80211_MLD_MAX_NUM_LINKS] = {};
 	struct ieee80211_link_data *link;
 	LIST_HEAD(keys);
 	unsigned int link_id;
@@ -205,11 +206,16 @@ static void ieee80211_tear_down_links(struct ieee80211_sub_if_data *sdata,
 			continue;
 		ieee80211_remove_link_keys(link, &keys);
 		ieee80211_link_debugfs_remove(link);
-		ieee80211_link_stop(link);
+		stop[link_id] = link;
 	}
 
+	/* drain RCU readers before cancelling work they may queue */
 	synchronize_rcu();
 
+	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++)
+		if (stop[link_id])
+			ieee80211_link_stop(stop[link_id]);
+
 	ieee80211_free_key_list(sdata->local, &keys);
 }
 

base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0

