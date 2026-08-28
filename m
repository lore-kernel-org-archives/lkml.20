Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B809C395D8E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939119; cv=none; b=eynftaySWBD3VU5ngDTxOjGlf1t05sOkPgPlzePffjIeZ5DZFPNflt/z+UdFiGhP6IYplwu0ojjOLkdMdoV4NPQSUTjboG3c3wzFaQ6z/P+gbJIU/sxcLrSV72tdD2h1U6NR/bfpCvhW8JibRvUw46yLhgG7M0lUNJKxj2fdqjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939119; c=relaxed/simple;
	bh=htZYsknmaKglxEdP11yJuMBy0iYQlKpuXbCq7oMS5fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnEuobAXg43Wf8SOHUakp1hjRM6KThhTTVD5NS8pU1yn7Ra5UKUpfw1QjerLk+MJYC/AboVrordPLXYSGvdqGJivwptYfh49XDWqpBJckQzD3biveCG/3DKyRSz9SWPbcVy4IGO9ZcZyO+xOdBI9ePnGM+1e8RiaJHASc6gIjng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=e06FYy4/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="e06FYy4/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482db627cd8so836636f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1787939113; x=1788543913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldhPBd6gTP49jgwzRdZBbN0z+sgukl9cHOVoHnp8Uvo=;
        b=e06FYy4/Zwtrh3EYhn7yN77Fh5F/8wpSLc/5/0XIrUBOWiRQmmh3D9PaXMyHvpwWHo
         ILKODPj6DSsYFolMMn3rK06fAVQgXdxX1lQ+Uiu586GmdBQaOEf94IvqHNeWafBdHFPG
         Vo6s8TXEV4gUIHS1QLl4Ejx2fwU/ixu46hKsPLsmF3LFhMa39XmdMHfH9LxFsmA1hkut
         y9GOUVjDE2uQI5XgcYm+nd1Q3Mgy+gbHgFgHSeBDBQEovn122rDTuP2GjkUlywRF2znx
         XrqsNYws1WrUbaJtSj3tUE/bX7bAVUxBWiqvI+PZx0s+t1xC5rUVSrZ++jSDJrmPUc9C
         xDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939113; x=1788543913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldhPBd6gTP49jgwzRdZBbN0z+sgukl9cHOVoHnp8Uvo=;
        b=kX3geaxBNCQoWrEmP83jBiCHGYtmtML1AGlcn0NiZnBb9xqFVbRk/SFr5oVnCB5qv3
         MhMzM/7lORgvWqiwHM2Hu/ySgMdet8vLMcS4RVAChvIHIw9srD+KHuyfF8QCCv+YUg9/
         hrH7SU5jdxiI4AjeILpMf1OWbo7C2OdkbIs4+JEKb9dcu5R7WQTZTY3MpId9yaULBFC+
         dLpLPWbWqCGMhlNOGOrN9CLLG2gKHmN+fhfgt30cuGL57v1rdQEzBaVMIt4CcS0Vqsfl
         okCAtOiIka2XZEaga2aLHaWjeQi7EB+u+g96YKakhdnOMXXKDHjHOIFhXvvxciLjj6Ib
         P1Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rqe7E2p9MQb4kpK/FWeSI64G6YkdT4V7xp/ryx6X12LZ+QyII/U/7WmUuRFYymnTCXu/MipyPjdKLRgnUs=@vger.kernel.org
X-Gm-Message-State: AFuF++lcRaz+EL926auZMq7h6pe2ojM8M4abqLCMUHDdift77Ywh/YMf
	exfcwdN73eMqJjiQVSmXkV+OXLezRfnxfc3/0HuzXJt5kPmN5912NO77JqSRjovdF5w=
X-Gm-Gg: AR+sD11SzmEzakki/R1rC6MukUouLr6mPJQVb6Af+sXHSE3aGRrYfR34NawbCfuZhRn
	H5v95CJ2ra78EgMM/VITe2QlGImm9lwAme98YPhp/zDEbX5b4q6EZOIyXugU9YIlqmXAOLUHj1D
	Qut4SCPyuZWTe6o0+A8Zcg7JjwiPh9XgUSDO0YtroHYTwEWU/9UC99X96g8poW07N/p6mCIKxND
	0H9R6sJqe71XMYYGecLImfL9WrQjVzV9PED/LKltOszESRhvKLAp/7NNu+X3BBfX6SkT7PIHcH7
	koQO6ND17XScrn6MF2ogBTWQNP1cOz3LiXg6gZReud4gFkcjNYfWhNe5hM4QIi9sIulzQVlgmpo
	9N5MrGFwWb60T8BtYC7634HxEwnY+vAwutO1vLoKmPE8CFPeWJSJY8WipmGxqNVjE0FDPBrw1ct
	/JzHCp4nixBJgJbqZ/uE89ifkGXEtvqO3bNbqIPF8nzhHnqGcffYoBu4YJ1wTxGWa7s3rHRL8zJ
	mdXD1NoVgXinUHnkLIlohhUP4ncnR703Cr1SuP96c+aN8TqfnyvnyeE5wOVAH2sWBsbzIdOUMs=
X-Received: by 2002:a05:6000:18a6:b0:482:ea08:8c97 with SMTP id ffacd0b85a97d-482f79cb828mr11667503f8f.2.1787939113387;
        Fri, 28 Aug 2026 10:45:13 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f02b200023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f02:b200:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2794dsm5480678f8f.25.2026.08.28.10.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 10:45:13 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	xiubo.li@clyso.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v3 1/3] ceph/mds_client: pin sessions while checking a new MDS map
Date: Fri, 28 Aug 2026 19:45:02 +0200
Message-ID: <20260828174504.1247038-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828174504.1247038-1-max.kellermann@ionos.com>
References: <20260828174504.1247038-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_new_map() drops `mdsc->mutex` while it locks a session, prepares
a reconnect, or cleans up caps.  A concurrent teardown can unregister
and release a session, invalidating check_new_map()'s local variable
`s`.

Fix this by taking a temporary session reference using
__ceph_lookup_mds_session() instead of accessing the `sessions[]`
array directly.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/mds_client.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 3c692ad02c85..160f23e2edd3 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -5798,9 +5798,9 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 	}
 
 	for (i = 0; i < oldmap->possible_max_rank && i < mdsc->max_sessions; i++) {
-		if (!mdsc->sessions[i])
+		s = __ceph_lookup_mds_session(mdsc, i);
+		if (!s)
 			continue;
-		s = mdsc->sessions[i];
 		oldstate = ceph_mdsmap_get_state(oldmap, i);
 		newstate = ceph_mdsmap_get_state(newmap, i);
 
@@ -5813,7 +5813,6 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 
 		if (i >= newmap->possible_max_rank) {
 			/* force close session for stopped mds */
-			ceph_get_mds_session(s);
 			__unregister_session(mdsc, s);
 			__wake_requests(mdsc, &s->s_waiting);
 			mutex_unlock(&mdsc->mutex);
@@ -5841,6 +5840,7 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			mutex_unlock(&s->s_mutex);
 			s->s_state = CEPH_MDS_SESSION_RESTARTING;
 		} else if (oldstate == newstate) {
+			ceph_put_mds_session(s);
 			continue;  /* nothing new with this mds */
 		}
 
@@ -5878,6 +5878,7 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			mutex_unlock(&s->s_mutex);
 			wake_up_session_caps(s, RECONNECT);
 		}
+		ceph_put_mds_session(s);
 	}
 
 	/*
-- 
2.47.3

