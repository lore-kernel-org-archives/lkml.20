Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055715;
	b=wPWYr+wttZsqeZKjUy9FzzukxS7PzM/9/16dE8ZtK0hZ8skRaV08pAXw8fndvNmafWBM
	 2htmxGa1REmfEQa7Y4RFMsInszOr0qJQlkM7T/weh829qT6x1NjSLe8k0n+eF+fhZvr+G
	 7EnHBbYF40MGTVxbsXezWzJD2BmbYYPAyVfaU3TqaYmYzJSV8bTsNge23Jh/niacOMJiW
	 TCDQw3b7fTBh7yiyQ0loKKWiM+vgmGmKAEImllm6c2yIyTyJ2M/FnUv3ckc4tMJf8VQN2
	 p5h4xZ2P+ufzxtq/FFd5f2tGmEClz+4eXUWYPaRB9Vx3d1VQPeaiFpH/WKhyhN8HFXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c0h4dPwM7Lc2ThvwHjpwKfbW4C8bAJIrwdRbNwJK6ik=;
	b=BYnwaWK8sUk4yoz8fW6Zo9+fpJ+T3d34SQfdH8TacK4l7B/bqbrR+xTsvCR6BSvoZcef
	 feWPmN2BsUIq46zpfX74bS5vZQHqSXviRDXbpSfiJFvUAG5TfqlAzUJfd8Kx9BciqS/gF
	 ypqPIPMZkanOODDq3AZJt8lDMEeTjwf+ouh6H61R5eUDVdSgN+WPHDmmUvHTWSPDiW2GK
	 LY9PkqHSPZFI8tY2sRAtok+3LE2x0lTOC1bjN07EZYF9oV1YbO2lCbKZmDwCGQn0YBrOh
	 vO+X4vLODPdcUqMJTZIrOUj/jw6bK8kKX6gLSW7QX3cSxL0zrDXmScCFjN0rkPH5Gbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JJA4LueD;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BAB606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80BAB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JJA4LueD
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c5358fc28so3293015f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793055714; x=1793660514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c0h4dPwM7Lc2ThvwHjpwKfbW4C8bAJIrwdRbNwJK6ik=;
        b=JJA4LueDcJQO8MY4dVrb5Xb2+MSwjo5dLXPT75rPafojjir+k/OsWyG9+UrwTdhM+9
         pKIl0y/fpvExNndABZxIiVys+KKNt2agaeNb6vvMU8F4PMbPB0p406kPxzNBlu5s4sf3
         PFHyAnGP0t8N/Wuvna7ENMT7wsaLxaWJtoz1KE4ykuQGf1/cLEngOiapYlwtyNA/g4UA
         5eyTVqY4UTDfu0FyLphVkWzZdthBj2C+CoAM5MtYMrypUXtWIl9rmk51XucuQ/zYlbwE
         NpWpWL79pg1sYXtLkeAR3GngK3Pq2LBqDj8tsiPQ1rTO7z5ox3PMlpvgnZyNG8VYn9BR
         Gz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055714; x=1793660514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0h4dPwM7Lc2ThvwHjpwKfbW4C8bAJIrwdRbNwJK6ik=;
        b=FQ74zO3iat9WWIKD8h2t7E8FKqulqT3FFtflum5y0sMK86qfmRyf+m5RylBFNQN9sC
         Da42o6DkkUc9DGcS+oDthubiIhz+FnUhT/cIAtrDGYZpmFDrIbPj0X9iM2Rbv5r9xe2c
         xxBT5fEc4ItjbX1EFkq1I+AcnRzNgCQ9LWMFFtW/ez+CT2m170CbTGuq0I7+NhcJ5JsB
         877xSi6K34b84huX7BSoVI/lP9MKBEN1GGRFhk3tYMXVhOrmk07pZlQz6Hs3k4ZKeJtQ
         eBXFl+U56FO4CdP6xit476Ul0axAtrySMfNbcHucopNwm1y0H1/E7CSPHGXrHzBv9vf/
         St+A==
X-Forwarded-Encrypted: i=1; AKwUvBykFTSJQQrJgYUHTx0lO1KUzEF0I6B3FlYddThuH8+75vk7m0eOipuStsKdgAU7up1Jp+7T3SHMr+5A+nQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLFbvXiaY7C5+dZlDlQFdv8RLlvUYZdHFjGkoi7KD26vzXnm8b
	VWC8SXEebGvZjRuZIH37SBpnQbzBj0s5lxYSXfmeZUG+CzWrhEE+CUk=
X-Gm-Gg: AYBFou3ge0vi8g9YMyPXfirQy13Tn8YMoBBvW7cJWgiZQE0V8a22uMP0b1YtXCk2ajx
	XFKpVmBq4jgguklEn5/se7V2+M4x9DqHe4S+lvXT/V2IdNju4XkSTOIvxaykOkzaLNsEDHl8XGJ
	zktu/MupE/ABG9OhM3T+PAx71E5v1VqbLvhX5s26/h0Bl5c/mPRIyBaaje/EeOZTZ5MqncdIJDb
	NQQEMaV0ldwsVdZYF7odOWjvfA3fQG+glNPB57EVq/nP+2vMZE9GX6Sx6qzi17oblVoF+mAMdvz
	1HnvlQpHBxpEl9Cn9FyaZWw/RWoLBB6bIlpt10MrnO8znx+ojLCUBsgmqpMpSkAsVPbJTA8h+a2
	lGAhlNVh8hhVkaGshy9kKKPYgjfe4CjCky7L+h1CsuU+f+OOO3GyTFLERB5HewhTyfaF6jPs9Dk
	K0bu2ExaBlYt2/NetsXGc0wZQ+2hXpTRYb4MJ3mkkjA5hp9rwLXjYy2q7NdzXnVLvRpeSUUDMyX
	awKACS1bmLLDULnFeSO4m/gj+LKBC0nzLeIMA==
X-Received: by 2002:adf:fe8f:0:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-48e3eb8bdbbmr11263342f8f.32.1793055713530;
        Mon, 26 Oct 2026 16:01:53 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb40733sm14827198f8f.0.2026.10.26.16.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:01:52 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Cc: NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH] nfsd: pin client reference across async copy reaper cleanup
Date: Mon, 26 Oct 2026 23:01:51 +0000
Message-ID: <20261026230151.2474608-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

nfsd4_async_copy_reaper() detaches completed async copies from the
client list and later calls cleanup_async_copy(), which eventually
drops the stid reference via nfs4_put_stid().  That path accesses
stid->sc_client unconditionally, but the client is not pinned during
the cleanup phase.

A concurrent expire_client() or force_expire_client() can free the
client between the nn->client_lock drop and the cleanup loop, leaving
nfs4_put_stid() with a stale sc_client pointer.

This is the same missed pattern that Chuck Lever addressed in seven
other nfsd4_laundromat() paths with cl_rpc_users pinning (v7.3-rc2).
The async copy reaper was not covered by that series.

Fix this by:
  1. Skipping expired clients (cl_time == 0) during iteration.
  2. Taking a cl_rpc_users reference before moving the copy to the
     reaplist.
  3. Dropping the reference with put_client_no_renew() after
     cleanup_async_copy().

Export put_client_no_renew() so it is accessible from nfs4proc.c.

Fixes: ac0514f4d198 ("NFSD: Add a laundromat reaper for async copy state")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 fs/nfsd/nfs4proc.c  | 5 +++++
 fs/nfsd/nfs4state.c | 2 +-
 fs/nfsd/state.h     | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
index 50c07561e31f3..1f36afceb1fe1 100644
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -1501,6 +1501,9 @@ void nfsd4_async_copy_reaper(struct nfsd_net *nn)
 			if (test_bit(NFSD4_COPY_F_OFFLOAD_DONE,
 				     &copy->cp_copy.cp_flags)) {
 				if (!--copy->cp_ttl) {
+					if (clp->cl_time == 0)
+						continue;
+					atomic_inc(&clp->cl_rpc_users);
 					list_del_init(&copy->copies);
 					list_add(&copy->copies, &reaplist);
 				}
@@ -1513,8 +1516,10 @@ void nfsd4_async_copy_reaper(struct nfsd_net *nn)
 	while (!list_empty(&reaplist)) {
 		copy = list_first_entry(&reaplist, struct nfsd4_async_copy,
 					copies);
+		clp = copy->cp_stid.sc_client;
 		list_del_init(&copy->copies);
 		cleanup_async_copy(copy);
+		put_client_no_renew(clp);
 	}
 }
 
diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 9c4adf3110aea..10e864ca7407a 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -252,7 +252,7 @@ static void put_client_no_renew_locked(struct nfs4_client *clp)
 		__put_client_locked(clp, false);
 }
 
-static void put_client_no_renew(struct nfs4_client *clp)
+void put_client_no_renew(struct nfs4_client *clp)
 {
 	struct nfsd_net *nn = net_generic(clp->net, nfsd_net_id);
 
diff --git a/fs/nfsd/state.h b/fs/nfsd/state.h
index 2d00a411c6634..1d3a7e35bb9ff 100644
--- a/fs/nfsd/state.h
+++ b/fs/nfsd/state.h
@@ -918,6 +918,7 @@ extern void nfsd4_shutdown_callback(struct nfs4_client *);
 extern void nfsd4_shutdown_copy(struct nfs4_client *clp);
 void nfsd4_put_client(struct nfs4_client *clp);
 void nfsd4_async_copy_reaper(struct nfsd_net *nn);
+void put_client_no_renew(struct nfs4_client *clp);
 bool nfsd4_has_active_async_copies(struct nfs4_client *clp);
 void nfsd_update_cmtime_attr(struct file *f, unsigned int flags);
 extern struct nfs4_client_reclaim *nfs4_client_to_reclaim(struct xdr_netobj name,
-- 
2.47.3

