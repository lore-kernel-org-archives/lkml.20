Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900006;
	b=T9S3o5G+Dd3Q38dpugGyjWNbomhOi1lGipd9XN4xH4li3D6T4kgGGIVP6h+3p/+FP5sU
	 nn8lY9Zeqgz6CAwObJZ0jr0wuR4Ry/7OtY6XOhHvLrlnPPYhRddm30lLO5TRn0WOPqeH+
	 NunlwXwQLG1Jt3KsT4BZpdTO95Fyuk8wzziiwQPyqMekVpgmXMvZfLhS7JMZF9Ku26cEn
	 38+su7vBpJHU77ut2hprIubnngjO9Vqe62/WJDOiuiGA66lqsvEL6DhUqpTHgZBtpF6GK
	 6u5KGAMVxBjrd/L9RjqFcBfZDjdg8X5L8JinJVjRt5qFaTv2K2jlcFLTz6iM3zWTmiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0DjpnDmTLBwb0Qluwo4pY0uoN7St0QxG6Sq2VRXB7hU=;
	b=nlnExOKJMpBF0Bg0SSkumc5Elk3sOlsuG5igkiDx6sfLD9/axaR95rCEr5OIpgPjPMqX
	 UMO3gAOn2Cubu4dsZJ/3yOoppUCOaJpC0NzevbaMY9x2/9GOdULOli6Mk4vW5t0S+zFPI
	 G9CWFw1hCc0iiKS4qhxa1t/LCWMUxepLSINIGbD7EvCKr06hwK1/Kp9ajhKBeXZMsAmAV
	 YjPExJ5JtcJIx7uwQ+kOi3TQ8dlBHV0MaIfkEnGFrhtNB+yhXOzHZsVoUxW1sN+wt3c0O
	 l714thH2RltmZ4Frozg4gDIMHezfyXPT+pRzWww9SRmXb63oO+z0pqTT0c+QVNawcpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl8zBgpd;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1097606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1097606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl8zBgpd
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35c76e9614aso2900960eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900005; x=1794504805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DjpnDmTLBwb0Qluwo4pY0uoN7St0QxG6Sq2VRXB7hU=;
        b=Hl8zBgpdCIoWaoGQoYVGCjVPg5h7tjfSvjKAOmLw87rB/ZBeEm3Jra6B3hRuW7X+P1
         3+gcD+dbmXdsRRM8i5tlkeCYwjrsBeKXabliqzIpMdxnO7/vRzv8ExRDwNVxSqhkIB18
         K5ABxsUBoyuJLNP1N21c54tAM/o4NitjGmEtQ4qDjixYlDDKPAWXGQb5YWCeVzsFcQ2h
         XtKxqjM/pQs/qQmxFuHUohwnTgWoJfjrlkMjXslc30ZAD7QV+xMzyogfRYQBAySjxdI5
         5w+aZomT/z8yxIUl3GgMmqrAdpUHPIf695ZIWgpK8UKL8WcPDuAoy9KabmoJ4192skl3
         Telw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900005; x=1794504805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DjpnDmTLBwb0Qluwo4pY0uoN7St0QxG6Sq2VRXB7hU=;
        b=YoLwAmHK7opZGXXPOJk14E1bwNNkW3WhoBXMXXZ2BQmsj5Uk1sVeqnWovbBQ39pyrQ
         bd4gGXyjCFaYO2Wv0iZr6NXQnP4KQ0VAmafjLUvwCQJACxs/Gn1QcENWW1mDfKVX97wR
         DCQQfLPXIIjAYMqp+22iNk2upNBgheQZtHjG2HB+DLqO902NyBtBoYdjVQwLO8BEh8HZ
         w2+5VRxhwO5G2fjWjdUGCEoMd8Im6GPFCnT/pX09rQo2GvjdfYmIZv67Z/fZMyDvh6wd
         xCr6PoEVHhyTLh3Rc79vfAcgmv/9BWDwgMG96iY8IWcblXQtjE6OPq47m7X5wJQlYzo+
         y7fA==
X-Forwarded-Encrypted: i=1; AKwUvByzLoARcfGOmY2fW3gig3nxKz6Qh+1z8DtcfwT23zjx4BlhdMCWNJA4aE0JPvaS6QnwNu7F2yQ7tSMMPsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9miM88Zzm9XcTv3kNejPUXJaPaqsuqG3OSS3AJkbMIx68HW9Om
	oZEnLyO0LlNq8watz8cYOxVNdjYM5wk5xPia0jequI8B1QNhovUhYCsr
X-Gm-Gg: AYBFou1sISlCtDjKhfNIjq/s3VPkiDK1kyACFp1gHg3VbpSOcVygjFNEmQ9r3cz6bOC
	bz7/Yr6oToOkI7pw5wwmWWd3NPEkDoKDMWqRJRSlrHuDdEvLjzKnaCtzYslMyKxT1m1NRKHbIt8
	v49YlxcMdpT3cZ0g1ErXB1chnp8pYl6K/TKPtHnM4vuctmAtHMW0ugCZe18siMGhGhVFRteOXYr
	NO+RHDMFlsDb/WrcOjN0jZmy9GClH5ugNaKiAGWmfJH+p/sk21J8J01eiMyA2kge0hnCmWg1yhM
	9DnGCtrrVRl5CZli0rFMevCUiBvfK6SLzTGCHINotEPB5NlHJI0fJvKPe4P+e9/P7QFIozAYW0o
	OBd4yFKU0ckFyTZWq2SXZWb8subGUZ93LPl9F/xCsMQU8+vhbpte6owHGlUS/bTPmsh46wJisVP
	DpacNCZ69Z59eM3J6F+5fEnNy4+MUwTu/icHdh9B7+aLD/Seq+cf4td1m5k4T7KiU7OulB9tAuj
	n8HvTAhvJaNTAQ9zUgZeGTwfCultqynzHYX8+THgqPbS28kNjgyYgpipZyt9gDLqR870NfKefKf
	bPlVDW3nZ6wVGJGU8+t5GRebxj/j
X-Received: by 2002:a05:693c:2802:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a4220407bmr26567580eec.5.1793900004587;
        Thu, 05 Nov 2026 09:33:24 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:aef7:efba:dcd3:a664])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39c5f0csm16530514eec.29.2026.11.05.09.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:33:24 -0800 (PST)
From: mdshahid03@gmail.com
To: trondmy@kernel.org,
	anna@kernel.org
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] NFS: idmap: fix race between key revocation and payload access
Date: Thu,  5 Nov 2026 23:02:51 +0530
Message-ID: <20261105173251.30389-1-mdshahid03@gmail.com>
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

From: Mohammad Shahid <mdshahid03@gmail.com>

NFS idmapping retrieves the user key payload after validating the
key, but does not hold key semaphore while accessing the
payload.

The key revocation path acquires the key semaphore for writing
and clears the payload pointer through user_revoke().

Without holding the semaphore ,revocation can race with payload
access.In this case,user_key_payload_rcu can return NULL.

The existing IS_ERR_OR_NULL() check passes this NULL pointer to
PTR_ERR(),which returns zero and incoorectly reports scuccess.

Protect key validation and payload access with key semaphore
and use user_key_payload_locked() while holding the read lock.
Handle a NULL payload explicitly as revoked key.

This prevents concurrent revocation from changing the payload
while NFS is accessing it.

This issue is reported by smatch as possible NULL argunments to
PTR_ERR().

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 fs/nfs/nfs4idmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/nfs/nfs4idmap.c b/fs/nfs/nfs4idmap.c
index bc397110d977..06b193722660 100644
--- a/fs/nfs/nfs4idmap.c
+++ b/fs/nfs/nfs4idmap.c
@@ -317,16 +317,16 @@ static ssize_t nfs_idmap_get_key(const char *name, size_t namelen,
 		goto out;
 	}
 
-	rcu_read_lock();
 	rkey->perm |= KEY_USR_VIEW;
 
+	down_read(&rkey->sem);
 	ret = key_validate(rkey);
 	if (ret < 0)
 		goto out_up;
 
-	payload = user_key_payload_rcu(rkey);
-	if (IS_ERR_OR_NULL(payload)) {
-		ret = PTR_ERR(payload);
+	payload = user_key_payload_locked(rkey);
+	if (!payload) {
+		ret = -EKEYREVOKED;
 		goto out_up;
 	}
 
@@ -337,7 +337,7 @@ static ssize_t nfs_idmap_get_key(const char *name, size_t namelen,
 		ret = -EINVAL;
 
 out_up:
-	rcu_read_unlock();
+	up_read(&rkey->sem);
 	key_put(rkey);
 out:
 	return ret;
-- 
2.43.0

