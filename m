Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311191;
	b=SLFDcQb1cQKCUy3CdAAXFFzpq9zSF4W521165w6v3oG/NuBkCBXTXLq/3OTKDN3Yk70o
	 VdoKVVv0Tv8wTKswykMfNcA35XpeppTbCYzvEEoYt0cLu/d0llXEoBrTtjbNrsaE3Y9Qo
	 QzM7isTS/vqavQDATdmmWrd6DnmF4Th2x5XqnohE/C1RUW8yk2kvB9rCIMyqf3H1imJV8
	 BvsV6xrozZUzr4yMCf///U4BZ4Ak8/Nc+Bvk+7KfcevUk/LvN0dn8uKNmsAHiu7N3Ax7P
	 75QaEOGz4eNEBf6VC/QYS2zVzLY7vI/GyKxKiMgA97UePGnrLz1vR39GUg02iFwzVTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PBZCd6YdkJxJ064F291tmqCngK50lIQhQHSwEALjDEI=;
	b=XTjp3uqsPiLs489pd/BimvScPVcTH3MUbvPzhBQ0IGUJXTTcD3e4JCGVX026CAvo590f
	 m3ESsMw3impf/rJK1B8dCpXqq5oTb19aL964U91SFRVfiKIfV8RVMF5MoRlsBhCKNOTpz
	 M5G6PU61cvYsXS4RIE6oZAjg4QiPAre92G5uS7a+0+tjH4eOS1EjeQ8lsm7bPbC/QC3uM
	 2SMQ1uyOirUkb5i+4K2aZsfpuM393r9sPTIbnoaE6ksSRZovOBsTTgc7Io7z/jhfLXJ7E
	 FPTHHIPSwmof2YoET2gx5fWuCVDFhYYvrNU6DBvOeO7PtIXhV0pE0i3+0cr5b9Igxgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N2JmzX81;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571A606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B571A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N2JmzX81
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b147e06befso861374a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311190; x=1794915990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PBZCd6YdkJxJ064F291tmqCngK50lIQhQHSwEALjDEI=;
        b=N2JmzX81TKFRZTtMxYTh8ssnFayP2VMKsoCo0yuwYe1NM9HD3yDfiYxDSzTiYg5XnN
         1KdPDK9jXLcjQGIBkrf/tCvdD4sgbLoJhfxHUw+fKnu7o+o7loe+qoV4ie/YBCm9UKyE
         vNJ2JU8Uk4zngh8ucwUPqvBjfInsaNC9wUUDDRMRmvzUNe/l2P75WITa4XJZuwC2oK/r
         HTt4HpG7EvdNGFkEIapT+1wQWRtD/MwIEftIWMZS3MA/01qf5sR0ji27YpxLIxkyHBQn
         nh3pZinRzP9LabFySk6gr4M7XtwCLKxCb84vmV039TxI61xi1wUgfS7wnc6sceXPg22n
         PZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311190; x=1794915990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBZCd6YdkJxJ064F291tmqCngK50lIQhQHSwEALjDEI=;
        b=H+lERL0d4EytP7FPb6esNt4ZQ4fBhsnElG2upaS6lI7hVBXRcLfychEpbKfmIGPHHT
         J3WlgDhiyZonSnRPwh8NSNx09WrHLBG+kVpV+t8kEba8KfQJtG3dcEEPMTHeu3aq7yNI
         OWBup3gxdiYrlEB0bl9IJxloPUiU9+TPYMxMx+5mmjA9b2pbibHryASBrJtEVRKBekBx
         nM6HSOGQDg8x7VvbFz0Jhdl1aMmW+kSXhR8vweMnfiCZywVkSm2HpiPahm1mP6cIl14h
         Mw2Vq0ZKCj5hxgCtvyIrwsbp38ju0RNHwzKm6zj0TYP6Ft0psABO5fP60Ib/irfPiR3M
         HsFw==
X-Forwarded-Encrypted: i=1; AL+hErHfv4GADY7j+uXz2hB0IIHIF/kHNF1sX8qDCy2Mo5OBudAQtavYPiN2n42AZ5MXMRaVmY9x8Kcv9dC8kC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AvQ1D1RYEfDD3qj/70NtXoThSFbg72Qy1z9QNFyvGdvIsekLt
	IqhWJ/a7BxY3Nvx9dGGYMOi+eBWb/B+6p4/mk7mIhfiJfTphO8sigC9x
X-Gm-Gg: AYBFou1ivB26NplGzioISyFzR2c6K2mETtNMc02loyZBbpXfkUMek87Lht7krgKPSFk
	hCwnfb+fFov4v5rEWxMdFFHEsfUG/ltGqP92/6AKuK/eGAcFPk2Tz9UMmFqYwoCO3orXpmv6RF0
	Vk3Qn3O3z4Wn1FLIg5yB7UXNLcZQg4O82Nwqb1rqleIan/jjdbLFWiulximBvaaAZfDl3cHdn18
	OvjpETvzDpEnJKbdAZsSiR6RKyxHtUciKB69JqQvgUEJIXWGCPFE2vADjm9zPuDy2MGIuTFq6U0
	QodqwC9Myckwxji2tUWyYREO4fKTb1E3jGTr2asd778yCInUHWWwjEidyB5K18psHUc65eTE4AC
	09t6+feDV9DbMzufZQk6JQehttXqYNnlmar2YL0B7JEbL47gOQ99yZCJ9ECln7NeKtK1whg3qw5
	jNnOaxHOZdrp0ixCJZe7rJAzlNuXkcvmCKmEwKRPH0/Oa3GnVjljzBIhGFvy5ZianJ5kZoaeGDt
	cySQV2T6yru1JLLHZKu3slX0qUyj6KeYDmXuLwQwAO0E7p1rpPa12wdJdT0fnS59Qak85h6V3By
	ODnxhu7oU3E96R2/02FRYtVlPkmXjfXKlyY=
X-Received: by 2002:a17:90b:3142:b0:3b0:92be:ea4a with SMTP id 98e67ed59e1d1-3b166d14ebamr2280964a91.45.1794311189808;
        Tue, 10 Nov 2026 03:46:29 -0800 (PST)
Received: from localhost ([240b:10:ff26:df00:c666:4b57:9ddd:d960])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167970669sm3391915a91.13.2026.11.10.03.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:46:29 -0800 (PST)
From: Yasuaki Torimaru <yasuakitorimaru@gmail.com>
To: steffen.klassert@secunet.com
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yasuaki Torimaru <yasuakitorimaru@gmail.com>
Subject: [PATCH ipsec] xfrm: account XFRMA_MARK in xfrm_sa_len()
Date: Tue, 10 Nov 2026 20:46:23 +0900
Message-ID: <20261110114623.2659197-1-yasuakitorimaru@gmail.com>
X-Mailer: git-send-email 2.54.0
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

xfrm_notify_sa() sizes its netlink message with xfrm_sa_len(), while
copy_to_user_state_extra() appends XFRMA_MARK whenever the state carries
a mark.  xfrm_sa_len() does not count that attribute.  Only the
XFRM_MSG_DELSA path adds it to the length separately, so for a marked
state the XFRM_MSG_NEWSA and XFRM_MSG_UPDSA messages are sized short by
nla_total_size(sizeof(struct xfrm_mark)), 12 bytes.  The other length
calculations in this file already account for the mark; xfrm_sa_len() is
the only one that does not.

Instrumenting xfrm_notify_sa() on an x86-64 KASAN build under qemu to
print the accounted length while adding a marked state confirms the gap:
accounting the mark raises the computed length by exactly 12 bytes
(348 -> 360), matching nla_total_size(sizeof(struct xfrm_mark)).

Whether the shortfall is reached depends on the skb allocation, which is
rounded up: xfrm_notify_sa() fails with -EMSGSIZE only when that slack is
exhausted.  km_state_notify() discards the return value, so such a
failure would be silent.  This was not reproduced.

Count the mark in xfrm_sa_len() for every event and drop the now
redundant addition in the DELSA path.  The message content is unchanged;
only the computed length changes.

Fixes: 6f26b61e177e ("xfrm: Allow user space config of SAD mark")
Signed-off-by: Yasuaki Torimaru <yasuakitorimaru@gmail.com>
---
 net/xfrm/xfrm_user.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index a2587c7e796b..5c6ee35bc012 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -4046,6 +4046,8 @@ static inline unsigned int xfrm_sa_len(struct xfrm_state *x)
 		l += nla_total_size(sizeof(*x->encap));
 	if (x->tfcpad)
 		l += nla_total_size(sizeof(x->tfcpad));
+	if (x->mark.v | x->mark.m)
+		l += nla_total_size(sizeof(struct xfrm_mark));
 	if (x->replay_esn)
 		l += nla_total_size(xfrm_replay_state_esn_len(x->replay_esn));
 	else
@@ -4101,7 +4103,6 @@ static int xfrm_notify_sa(struct xfrm_state *x, const struct km_event *c)
 	if (c->event == XFRM_MSG_DELSA) {
 		len += nla_total_size(headlen);
 		headlen = sizeof(*id);
-		len += nla_total_size(sizeof(struct xfrm_mark));
 	}
 	len += NLMSG_ALIGN(headlen);
 
-- 
2.54.0

