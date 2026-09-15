Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CD23DB96F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484906; cv=none; b=Qk3JUovy4aU8E0ghwwEcPk90LULB2fU+Ozs1xEVyVY55KTDy98msLhQBO1gtRDvxardNhrCGpp+cMbH2htSkw/EXILtdZzIt7YtIGG67uz3RqmoeoFPk1K9q2JXRwDkoKD1oFF2UGt6FkH4m1YSuhbbdMYH8dswQIZBM/Wzvlzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484906; c=relaxed/simple;
	bh=BIXCQwePZmq9pzeBXw6sT067TW2VLRk/luFJ48fOjZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ktrf5IHaMgSJtvj2fTVARSDluakYCzVx5z7GS1qfdV4uoxxO4Bncyf3WBRTeJK1kZoUEaqBLPFoTVP9N0vsoGwzOS9B+9BADkS92+bB0TscWYk2aKjQpzJdTNBb3AsKisFNsp6/VXCGO25+55+uJgleN9s8hrPSPRVpyK1Cuysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5JgSP2B; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5JgSP2B"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d9004a1ac0so3118475ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789484904; x=1790089704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTMF0M7Jt2pGNQ6d+nnjaz6wV/dDyvlPby7Z56dRO+k=;
        b=j5JgSP2BfullCfqPlIOb8nSng1zKZGpXi2yWxVyxNtz+cx7ag7bWaWp+7uyndbYDY8
         /1wSk5WNtdsJArjWnJB7SHTLBnZUMHtAS9mPhlw3eiThOGWRHlPi+OKL/kBq1Xqug+wV
         WJ2XtxGsNSMulYWCgggZIuNI/PDWJWv+gfRFagspQa+Rw7Rb0dRs5/vZwNlFH7puJQCY
         h/sDGwlFrnp+eTCO6flyT+venzB0rkvsm4kLjZVqCii+jEWE9a/T0NeCRFCn2yAE9rgP
         /3Jyhrb5J/c9OP7EbBSGxmoGW8NLbo8dgCQVm/UKezrKi3GsmWTAAnS6yGPcRfpwUVjq
         zBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484904; x=1790089704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTMF0M7Jt2pGNQ6d+nnjaz6wV/dDyvlPby7Z56dRO+k=;
        b=ZDgds3y0jAaIGX/MrHelj47QcDVkAw+udz5CS2iIMKWW01EiDb1qQEaRaDi7IiPAea
         z+c5QxClO39SUtfd2Hc7N3wsK/t3gdtcCEuhnjLF3k5UD9KlwYpuzkF+J/EYCWQIqnXT
         xJCnr4C/2ppjfITdQ1D5XuJDsr+oJEDqYwIdyyCobsNwB50PvLsiIr8wsbGb8Q+UZUkC
         GN28jiFGsBIg8/mb31AQswoASfd5dHNKHGMqVkTSsacsonxBltyPCCeuztpmeCqwkm4J
         pWHqhJGA2Mp9Rp63K5Kianqy4kC1gtzhvCdUjavmZh9l7oLXAxsq6US4co+AkQkQlax/
         s2sA==
X-Forwarded-Encrypted: i=1; AKwUvBzrDf3wAGCuInDrlBMdGHRIfTfLRufgZzm/AKuUzJZHIZmLaeIhYrAIQTQ3nMZ837Vq7EJGEJQL3sFp6Dg=@vger.kernel.org
X-Gm-Message-State: AFuF++mbKUXjodTNne/aNU16C1QxnyJ9eK0DJWHII0zjSE8Fku/woWjY
	U7PzRqq5ANxZzBw5t72ZILb6UMD03KzIlSfjCTcklFLo6zfAqZTqCpIB
X-Gm-Gg: AYBFou1aJacon53h8L1M0NgYSVKpMN8gfBnrS+GFkiaoijPZnsTLP7DU5DN/4lxbypK
	q39OuJa7bmQjA5a3s/iG9LCsjOYaf7g0vquUoP+W1EfFyb11lhB4oojv2Q1ic7IZ+4ksis7tKgS
	OsPUKSbik6mF+T2yxM1f68VLLBrsoQ6tAdnN95Ash4m+uRUodpb4yH9Zte3ISB2ehhHJPXHw8+g
	hrCVlQ4cVIKgTp7OPcBR2t7KAvGYZjN1qpMnHME6zcg9DYDjwsU11yfHUIuF08dPheWmo/JB/Ca
	ovEFF8YOJrTrSc/siTL5EHPyQNccyln3Wb2UDA4qLg7M/3zkZYLxUHC7UJ2an4nb284czVIeKvu
	MgdrZmkErAgKf6BMVkbR4ohqzMIpDm5oKBKyMWO03z9B1YSWidfD126XS1Esk3+0l0y6zIyWy0q
	PCtwrBWwrSx/RAL52b3duAriIUaO+uhwJfYOBqTqIWZ26Ny11KncRh+t0INXvQxKfmB0GJeng3I
	e7Hr8tjukjuEb0Juw==
X-Received: by 2002:a17:903:37c6:b0:2dd:76b1:3509 with SMTP id d9443c01a7336-2dd838537c4mr27005015ad.14.1789484903625;
        Tue, 15 Sep 2026 08:08:23 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:2bac:b2b4:e60b:1459])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd760a7f13sm18984065ad.13.2026.09.15.08.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:08:22 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Paul Blakey <paulb@mellanox.com>,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+6cc37aba98dac721c415@syzkaller.appspotmail.com
Subject: [PATCH net] net/sched: act_ct: don't WARN on benign flow_offload_alloc() failure
Date: Tue, 15 Sep 2026 22:08:16 +0700
Message-ID: <20260915150816.36487-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flow_offload_alloc() returns NULL when the conntrack entry is dying
(e.g. raced with a conntrack flush) or when the GFP_ATOMIC allocation
fails; both are expected under load and neither is a kernel bug. This
path runs from softirq on every committed packet, so with
panic_on_warn=1 an unprivileged user can panic the box just by racing
a conntrack flush against a `tc ... action ct commit` classifier.

Reproduced with a custom repro under QEMU: a small, fixed set of UDP
flows through `tc filter ... action ct commit` on lo, raced against
threads flooding bare ctnetlink CT_DELETE (flush) requests. Hits
WARNING: net/sched/act_ct.c:437 (tcf_ct_flow_table_add(), inlined
into tcf_ct_act() in this build) within ~15s on the unpatched kernel;
same setup is clean on the patched kernel. The fix itself is
behavior-preserving: both branches already did `goto err_alloc`
before and after, only the WARN is removed.

Fixes: 64ff70b80fd4 ("net/sched: act_ct: Offload established connections to flow table")
Reported-by: syzbot+6cc37aba98dac721c415@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6cc37aba98dac721c415
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 net/sched/act_ct.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/sched/act_ct.c b/net/sched/act_ct.c
index 9080cb386c16..55f3521edb4c 100644
--- a/net/sched/act_ct.c
+++ b/net/sched/act_ct.c
@@ -432,11 +432,10 @@ static void tcf_ct_flow_table_add(struct tcf_ct_flow_table *ct_ft,
 	if (test_and_set_bit(IPS_OFFLOAD_BIT, &ct->status))
 		return;
 
+	/* NULL if ct is dying (raced flush) or the atomic alloc failed. */
 	entry = flow_offload_alloc(ct);
-	if (!entry) {
-		WARN_ON_ONCE(1);
+	if (!entry)
 		goto err_alloc;
-	}
 
 	if (tcp) {
 		ct->proto.tcp.seen[0].flags |= IP_CT_TCP_FLAG_BE_LIBERAL;
-- 
2.43.0

