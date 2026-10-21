Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564440;
	b=DtjxMOwVjgnr/1WKQ+1ilVeSOsD2F1qokNXCGrSpPEbw8/SgYcNqCCqg7VJZtk28+Yam
	 yAS4yp3+TjQvVisLHCcqbGdADaSZZ93hH/6uJ+6HATIEJ0imKpIp5Pph+lae4ZU57yU2w
	 57IlrQte5av3Q5N2xcjeyg9EVhbO/G2xFeuWRYGTXBXthNwMRnxbF9ecTtQ4mgVhOcYi9
	 lc2QJqvxprODZiU0Y9GCMCOLzxrqfcbPat7DLKzNJZ+3BMmBodvu4gBw1injR3/mq/fCk
	 QTBlgtAM4zSJ1JnolI0ZcQSyIEi6hhW+qnkVQYecKLsRLwgb8IOc7Kv5zoF68PsFVpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564440;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vaam/ALx4CdqVcSAP/pijmolIFXuCMaRyfcRj58bxsA=;
	b=at5tz1/gYCCyWHJ/Yamf/+1Lnwtj/uzI1mDV6rvz0yO/8LGc12qjwobckHzOy05QSYHJ
	 9MBTOZvy7NGZRMwE44IxteJQDQkzW38X/H0qHqNVLZYXXjKlW4iquNSwG67eMZNe4r6wf
	 2g1lk2ZUXPzgYU3N+c+47BYRoMoVTRdoE4VDpCcJzvM5c6ofgO4f0Ud5nzA9aoViEe5gV
	 UhqjuyoFn9V8gX6YoAh7PsyNgzqhvwxutxdwuL0IRTTL8Ns6KDPT4X80nLrjqMnQnBlnD
	 4s4qX2Ww2fDxsK4qIWyLH+sPXJF/5YHZDKzMM4OrOSgnczYWc+30Bh3FI45rRHSXXdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WHUEiMkr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aJ0zqFiM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F92606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F92606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WHUEiMkr;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aJ0zqFiM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792564438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vaam/ALx4CdqVcSAP/pijmolIFXuCMaRyfcRj58bxsA=;
	b=WHUEiMkrikxf7r8GwYEUUCe53OxvcHlrpDPMKiSimk+XivWk0PEP2y03Xh+6OLkJ3Z/hIg
	IBB+YR+w+nWV4Zs0kbgbbO0cqHHeM8uGlmD2vh1rs3N5oQ0QMSHkN/PvJwhheS0/5QgSIS
	cx4ET0GNMaPtQDJTBNPWlTQ8jqJ27dI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-Ruz4VG2rOweqLFYB8QsdlA-1; Wed, 21 Oct 2026 02:33:57 -0400
X-MC-Unique: Ruz4VG2rOweqLFYB8QsdlA-1
X-Mimecast-MFC-AGG-ID: Ruz4VG2rOweqLFYB8QsdlA_1792564436
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so2209565e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792564436; x=1793169236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vaam/ALx4CdqVcSAP/pijmolIFXuCMaRyfcRj58bxsA=;
        b=aJ0zqFiMkIqsi+s+g+eDk5wM1BLioqIhlBb8eyhsSxr+VR+Te2CIv+Haq0mmTc7npE
         oj8r1t2PvTnyGeoIi58ZtzsuByYHW6EJjjOuCLqwBXNKVdjP5rThHm+iizZB6mNdHUkf
         NGNF7MmlxiScK82FRX5SSLYd17qObtxxp0POVxW+HtUSdL77DIecOvYVuIkT/Ji2u6Y6
         A04AKutUmnwtG0vDvJgJGW6BzbN9VQGZO5/xUVnjwB9lr87I/ezw0BZVqcIKSoubKWJi
         fjhbVZksmMmrHouIjL+wOARmVrU2Y/y97HwxzfQhH+xldso+GTDJmspqqjFwaIrAAeGg
         CYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564436; x=1793169236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vaam/ALx4CdqVcSAP/pijmolIFXuCMaRyfcRj58bxsA=;
        b=CfaNSOfEicIUc6PwwRD/92uW5sVTqFWQTMkbxIWfGCuMAQU3/FeU4eyZcBG+NY7kvJ
         lkhL+FzuuKSlzzGbFIDiml3mXsNIdO1u1Hg6/E0co1zFUSfajrePG1ykz9c0NNrkk7WZ
         DPs10GT/FTCByiSB0Ej0Nh5rE0cByM81gsUJbGld+HsISHjKiy7EipODEfJ+kMfq+JYM
         /mQL7qfQWN83HETxloMaBiB5EuKJd9vH/qhM1rKtsKrS2vqKzEqvrTiZaMXOr7fKXl37
         H4wUWPEBVH24zjnvOsfyuUNIY6qTHeiJnbAIctOPRSqhW+Y3DV9f/OBpdhFLgldXw/pc
         qsCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBTl9MY8u0+AaXsMk+Kpj6rFE88uEOzKF4JqEzp9hP8ZlyiStmaPt3ASYxCD1YFOSLBfpe5sy3lits/u0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDaj4KMp4sak8nEJ1HSfgohj0Sa9KjEE3FJXFp7ePbx4AHM5MN
	uLMhDeHUGMhM8VvVcM4gfodfvAChec61pV/Xgxsx2QAAWkfhWG7T5v60yYFi6QhPRCG11uhQZD9
	PmaxIgaVltYNDjHIaOtj5+OE0cMSx4PaDDN3Al+SzOw0StDYODL2UitCdC19iR9iABQ==
X-Gm-Gg: AYBFou0dSl3a0A4M7DfUDAfnMFcibrMzlAoFRykYjqoliuLjQOoVJI02/qOLTzDbioi
	Hlp7dzzY/Ay2fWdJGCPY0OkdkvFoWlGUTLjaA9Xsgi1ExmvRNWX30XHowClr7ejugaCg7/bdmYQ
	tdtip03UCqPPbOB4jOpHI95WROk4fu0zaSy4rfyXQpwIRsu9uU/rgRCGuNGefvzdGbVM4B+UHOt
	ykouO0I/G0mlAUqta0+SeNS4oOQN6Q/VHIjrtuUYy6mwkJx/lhPAWF5N+zKZD3jqV1wKlheUiab
	2n7CoPigNBYI8ZZa+6BgV7k/NgEQm6AAjcAZOKVmfTMAzJZ8LuVm0MZvw2xaym9PU83X054s67y
	X1X/FofBBkWs+xz92oByc97ifugjdvMLvfcCsTynTXTKWlSo1XSPKdhKgJSBkC5TsdPjnIpVWML
	v5RSNuI0ijlHDz
X-Received: by 2002:a05:600d:82c1:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a1fdb0a0b7mr21253105e9.17.1792564436007;
        Tue, 20 Oct 2026 23:33:56 -0700 (PDT)
X-Received: by 2002:a05:600d:82c1:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a1fdb0a0b7mr21252765e9.17.1792564435675;
        Tue, 20 Oct 2026 23:33:55 -0700 (PDT)
Received: from ibm-ic922-09.lab.eng.brq2.redhat.com ([85.93.121.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb864dacsm51763965e9.12.2026.10.20.23.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:33:55 -0700 (PDT)
From: Ravi Singh <ravising@redhat.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Chinner <dgc@kernel.org>,
	Ravi Singh <ravising@redhat.com>
Subject: [PATCH] xfs: mark i_mode=0 and shut down on attr fork inactivation failure
Date: Wed, 21 Oct 2026 08:33:29 +0200
Message-ID: <20261021063329.2853484-1-ravising@redhat.com>
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

xfs_attr_inactive() can fail on an I/O error reading the attribute
fork's btree blocks, for example from fault injection such as the
dm-flakey errors used by xfstests generic/475. On failure,
xfs_ifork_zap_attr() zeros af_nextents without freeing the attribute
blocks or decrementing i_nblocks, leaving the inode in an
inconsistent in-memory state.

The inode is marked XFS_IRECLAIMABLE and remains in the cache. If a
concurrent operation (e.g., XFS_IOC_FSBULKSTAT) calls xfs_iget() on
this inode, xfs_iget_check_free_state() will allow recycling if
i_mode != 0. The recycled inode reuses the stale in-memory state
(af_nextents=0, i_nblocks=1).

When the recycled inode is queued for inactivation again,
xfs_attr_inactive() sees af_nextents=0 and skips truncation, leaving
i_nblocks non-zero. This triggers the assertion in xfs_ifree():

  XFS: Assertion failed: ip->i_nblocks == 0

Clear i_mode so the stale inode cannot be recycled, and force a
shutdown so log recovery frees the still-unlinked inode on the next
mount.

Suggested-by: Dave Chinner <dgc@kernel.org>
Signed-off-by: Ravi Singh <ravising@redhat.com>
---
 fs/xfs/xfs_inode.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index 05a14da28..fceedb699 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -1481,8 +1481,17 @@ xfs_inactive(
 	 */
 	if (xfs_inode_has_attr_fork(ip)) {
 		error = xfs_attr_inactive(ip);
-		if (error)
+		if (error) {
+			/*
+			 * Attr teardown failed, leaking blocks with no in-core
+			 * record. Clear i_mode to block xfs_iget() recycling,
+			 * then shut down so recovery cleans up the inode.
+			 */
+			VFS_I(ip)->i_mode = 0;
+			if (!xfs_is_shutdown(mp))
+				xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
 			goto out;
+		}
 	}
 
 	ASSERT(ip->i_forkoff == 0);
-- 
2.56.0

