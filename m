Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044392;
	b=cfs4z7bbQ4wEpmvsPqrbIGtvmt0jWdhBNB7zQGFfF+BZTci9GMDVTqJsJbkiYw7t1qok
	 tOifFHs3pNUzdSrPuTtq+9HUuUYU/bYPYsE9eKJFFMiVgPkcLDXZu6mrHGwzKYAiWEV4Q
	 apN8O0QpPBHesAHxjrwgY880w5nip7LnL6p+NbCSyZp9wjcNoPyx3WJfqgCpqhumrbg63
	 QyjoSEct3PK/oQQkLVp1bo48ehlmcUqpY9UVnjSqPRcxrw0GlJujTtfgdhqxtzLrCclNY
	 0cr6HCxUFTZsGDb99boYkrPWqTfyqiZAcg+EvbMyQIZtL6N8gVwZhCCIcWkB/tfG2TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z4jGd5Zh1+L1LJCrBnBDsKwIyWcB7a2BkfTKeB8G4WQ=;
	b=mAuTXEw/31yFV/LCikSEpRKPmD8JCyKKanILRnx+6nJafBMWVr6PHeI1L2BB4jqriVq3
	 Th7z68kt1dXRyAwy8zQYAMzmttnKZb9tTQu6Njagcyim5dVagJdsvZG3+B/e2yzq5yKsQ
	 QdjpRbOHgwyIdHApa9v2rI959J7aYmbFQfWQigwFizP0Axbl3ZIJFQncyhDydpmyumf+6
	 ovS9CxHz6nAJNd1AMXOGkS4hi9Sz60WMD0SnkZH4bFEOSMyytcTcCw1G7pI/S3xFXMGcC
	 MV+l1bfIw554JMnkMqkRILYv7Ibo7OhKMDmsunE2hrz1OsItJLj4CTbLqUkCim8Tn5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=f608s+15;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 894F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=f608s+15
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jD46v05BVz1XM30g;
	Mon, 26 Oct 2026 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793044386; x=1795636387; bh=Z4jGd5Zh1+L1LJCrBnBDsKwIyWcB7a2BkfT
	KeB8G4WQ=; b=f608s+15EKsPZtFmXhhYUAiBVIXES8fzj6bK/qGB943CfTh6eEs
	ecd5l40Hyi3/1IsPB1s4Lao0bJ+DxapF1ze3CgxwEASzPJEn0ehhKWg/aNVUt/Ks
	xk7BLFiuVO1nop0PFWAMvSxHzcHte88DLBKUITv3CHD56x3mfG3pAAV6fBLYaau2
	8Sc05/VI7DjJWwM39/K5OHPKcZ4cnzwksBnIjeRpV3BhJqs+QblQrAvr3UBJiMrY
	54oYPATb78o+Q2CHVW7hUJcxCRyPnre5CcfVf29Hywjb6UugVahxV1fhJE8ZSlNv
	7vggzIrgXJIiZjnmU1RNf1bO4C4/B7qqTDg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id H6DJu_4K8ou7; Mon, 26 Oct 2026 19:53:06 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jD46n5QVqz1XM4Tl;
	Mon, 26 Oct 2026 19:53:05 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Qian Cai <cai@lca.pw>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] powerpc/iommu: Fix an RCU read lock leak in mm_iommu_is_devmem()
Date: Mon, 26 Oct 2026 12:52:50 -0700
Message-ID: <56f0c45723ee53149a21ceb599010e957457afd8.1793044370.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

mm_iommu_is_devmem() returns true from inside its RCU read-side
critical section without calling rcu_read_unlock(). Neither caller,
iommu_tce_xchg_no_kill() nor tce_page_is_contained(), drops the RCU
read lock, so every successful lookup leaks one RCU read lock. Fix this
by calling rcu_read_unlock() before returning true. The pointer to the
list element is not used after the RCU read lock is dropped.

Fixes: b5952f8125ae ("powerpc/mm/book3s64/iommu: fix some RCU-list locks"=
)
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3=
s64/iommu_api.c
index 60d00c9e7f19..e1e43573e8a8 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -371,6 +371,7 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsigne=
d long hpa,
 			 * and the caller needs to distinguish this situation.
 			 */
 			*size =3D min(1UL << pageshift, end - hpa);
+			rcu_read_unlock();
 			return true;
 		}
 	}
