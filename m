Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951412;
	b=2LbXRiCPDAVungOJJ2qx28YRMT5ZAdcE6d3i+SbYpj8uOm3/OYtpI+NXU0Jg5gMDuOs7
	 D+3tnEEy7UzjK/4mt/JaUkffIM+5dxakmSLLOa7BLGJBwJHi/uPT26P81SvfkBNEyMUwI
	 P8zmu6IBV7oYNsQDR9pRRU306bjOgqdGowfTrCOZ6NTs6woEKGL/BibfjQzmQ5FOWtEE5
	 cKw6zcrugNciyaaUiC3uM108jy3AZ2Q1pudt3v2Qy3Kns4o9hYn8LC5b1bFlIG4Vd0fqK
	 FMBjJVhTsqVXpDcTha/urQOJbB1wZERRnKWqcFDhTr1WKQz0HwCfTwOdxS525Y+KoBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ibB05X29AOxiO6eN+tzSsFBh2h9+iozgZjegt4o/0I4=;
	b=vjPi8bEnDEz2FAjnHajpMIUaEdnJCRUVt79boCgRf5qvbYnRd8wnHE+/nAU0QpZL0rsy
	 pUOSfdOuW0+wbbjfCwRsMik9Fk/xP2X7WxWodHgiYiKtBxL1Rf/K/caXbI/q0H4wnJQiA
	 HKo4Uuhk0THIOLeISB0V+eYUlrBG0f83h3ZaNm6MB4l/SIf6sSiAEA9sNLvqbE5D2OfJs
	 mLLM01SMfTFj8ZIQNivXcOJFyi69btnqngpUc/ztmju9yaU6X3teevk1+1dla+51vElYV
	 mCncnBBI86T3RD7aNYtaGCtb0mLdLSFpDaepv9nBGo1CjF73TleAvS+fu6zsarj46sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rczi1//C";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4D9606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4D9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rczi1//C
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6707573eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951411; x=1793556211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibB05X29AOxiO6eN+tzSsFBh2h9+iozgZjegt4o/0I4=;
        b=rczi1//Cve/pm0JBj7VD8mvoblYohSSibn7m358EW4h2aQF2zXOmWfmZMnB5x1kSHe
         ND1fcRr1wa0ggqkVGzwLcuRmq39Vw3OQYrQAzm8DZlD0C/TRfSeoODVJiGGmuQf3hKTi
         0lD+zG08VwdSoDIERsYjecq21QDZXJymzOjZU0eULxue5rL47fbXnS5nk1GTcerJDPxC
         R1OvlyA7MKX9Pdbv7/V8fR5i5iWir7RtGEi0aaG3mSVR1ysrGMs987G9xHyQge+U5Ptd
         6CmED/1WAqwnRdnW5SXeK1J+aQ2cc7aNIlYubeO79GjIogmjD9dbagO0ggKZqWteYwkU
         5YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951411; x=1793556211;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ibB05X29AOxiO6eN+tzSsFBh2h9+iozgZjegt4o/0I4=;
        b=R4VsJZExV/PJdJ3KoRPPQjwH2+DN0e75R7ioi9oFoTpEWFLW4048ZEF/aFl/IQevyf
         69K6ZjFEDf3qyPZr4xL7Xcg9jAbrnlUThYlvCyX4z2xItwY/Ig9BF6WMqcUM2RTV3fbZ
         ZFpg/RlZa7xtjzl9VVxdCMwNmAbjaFKY143NyCh9Tt+pPLkz9dcbWpcw/0lPvfl2HUeP
         BA6JZ3+5L/x/YOstSramBEzu88et29BZ8469TP1jJ3zyTMEF1+eTV/NSTfAx+rqLUrog
         dK9QWbbYveG4VK9nixoPRxIC//ZRZnpl7FxsQYhQ6BPZkz3kWCp8aB4HM9UE0u6pRTiz
         OHsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAQFVQcI96AEUfqOen+ovZ88g9ayzCesKWkLt6kC+lvTIfX9lN2O5AsKE3sa93s4xXNz5DWS2oC5rsRc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Hg9vVZiSdd7wBTgQJ9jGl2LOe/tcRhAF5zP8buTNNPtv9rea
	Pg6hWMVT8mHUrqPY5q3w8bMH3F3j4GHvxftlHLpSTnB7O8HnMC2JpXQ1
X-Gm-Gg: AYBFou0vIiszNrPNoZnPQfMQGd7SKvhaQTHxTBrQhYG2UZ4oYejLuHZmJRfTTLRDnWZ
	QvPzUs759jh9RWxvl9LIIPfJYNBruDfDs5bGGIB2u3pf33yHCp0TAv1u6cCr/kxxFZpJa3fSnmm
	brEItuAcSAslDpMw/mPtVy9LLY0x1fTp439qsi94TRhAmtLDcsigT0NVjYDeZWo1d9WWKj9A/+7
	VjeJb0cGKyJ05tSdi9bUPe52Iei2OXKmvci3ccqGs4khnMWOfTU3qD6ZWOAMiKOSVRDv7eXIJ6c
	+hoUynRqnEz95yo3NuTqZL69mW8wI+hLsgZAMbfhdxvliKKhdQXBR74bhee8vQ6CiK7CBjr7rIr
	iNivuUCr+zoMrlWNl6++Y4e/mrIiGDkZrpIiErjy8HCWlgs26MEzz9jpVV8ieBR+J1gPsUGh5GT
	gxjAFNBiYrHonRRsq69lhNOWNNo6tzruEdC2H8Ze1XBH7Z7kWVK2B+Xe1RF8xke03CTHAVI7d1U
	VQkMizNvMPboPoTlKtMxQhUgXiMlvN/dn+t7Yo+7oYGme32z5tgJ85gbIJsmCzsvo1gewxvxElj
	vulLq7rzr1JmyzxkuKof
X-Received: by 2002:a05:693c:62d0:b0:369:9af5:7bc7 with SMTP id 5a478bee46e88-369e848143amr6347728eec.12.1792951410877;
        Sun, 25 Oct 2026 11:03:30 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db450bsm17323338eec.17.2026.10.25.11.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:03:30 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH] NFS: pin the superblock across migration recovery
Date: Sun, 25 Oct 2026 11:03:23 -0700
Message-Id: <20261025180323.349533-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The NFSv4 state manager walks clp->cl_superblocks under RCU in
nfs4_handle_migration() and nfs4_handle_lease_moved(), then drops the
lock and calls nfs4_try_migration() without holding a reference on the
nfs_server or its superblock.  A concurrent umount can therefore run
nfs_kill_super() -> nfs_free_server() while migration recovery is still
inside nfs4_update_server(): the server is removed from cl_superblocks a
second time (DEBUG_LIST BUG), and once freed by call_rcu() the migration
path still writes server->mig_status and touches server->super->s_root.

Pin the superblock with nfs_sb_active() before dropping RCU, as
nfs_client_for_each_server() already does, and drop it again with
nfs_sb_deactive() on every path: umount then detaches the superblock but
cannot reach nfs_kill_super()/nfs_free_server() until migration recovery
has finished and restored the server's list membership.
nfs4_handle_migration() releases the pin after nfs4_try_migration();
nfs4_handle_lease_moved() releases it on both restart paths and before
its final return.

Umount may now wait for the migration attempt to finish, bounded by the
mount's RPC timeouts, the same trade-off as the other nfs_sb_active()
users.

Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/nfs/nfs4state.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/nfs4state.c b/fs/nfs/nfs4state.c
index a5dec04..ff866f6 100644
--- a/fs/nfs/nfs4state.c
+++ b/fs/nfs/nfs4state.c
@@ -2169,8 +2169,12 @@ restart:
 						&server->mig_status))
 			continue;

+		if (!server->super || !nfs_sb_active(server->super))
+			continue;
+
 		rcu_read_unlock();
 		status = nfs4_try_migration(server, cred);
+		nfs_sb_deactive(server->super);
 		if (status < 0) {
 			put_cred(cred);
 			return status;
@@ -2212,13 +2216,20 @@ restart:
 			continue;
 		server->mig_gen = clp->cl_mig_gen;

+		if (!server->super || !nfs_sb_active(server->super))
+			continue;
+
 		rcu_read_unlock();

 		inode = d_inode(server->super->s_root);
 		status = nfs4_proc_fsid_present(inode, cred);
-		if (status != -NFS4ERR_MOVED)
+		if (status != -NFS4ERR_MOVED) {
+			nfs_sb_deactive(server->super);
 			goto restart;	/* wasn't this one */
-		if (nfs4_try_migration(server, cred) == -NFS4ERR_LEASE_MOVED)
+		}
+		status = nfs4_try_migration(server, cred);
+		nfs_sb_deactive(server->super);
+		if (status == -NFS4ERR_LEASE_MOVED)
 			goto restart;	/* there are more */
 		goto out;
 	}
