Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5EB3F7895
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519088; cv=none; b=YETZGIJ13ye0zdvSzXgfJ23573DIsN04FFWNKmA5vqn74a4xUfDn/lXM5WeeWaUThH1rhH4SSRIg01oP+95vOgPdYZ0R2FkYYgfDOLEPWdwrKVkzT4xac0yjnplwAFREwVaP9gLO5hQhU5Al8U1JgHaVwEczAK5KLnJr+CXX0vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519088; c=relaxed/simple;
	bh=1B7kYapCZpPFtgUkVhWVPxakfdU8+qYYCL4ZQ9DMlQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HV3lc/1O8dXW248pvoYG0FkEctsdmMt9efPd5ATrqnWKYwgGO4K151O52SN5cRXF5feZ5O3zwFU73hBdvnwHVGqJ9C0ZL54s9mDIZJBDdbxWHXEf7UpNsmQbXG1orRPPiz9IWUDRHWgGfPe29Bag+btQf6hFT7OZL+mpkhyGrOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LARR76NI; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LARR76NI"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-39e0e245eadso914580a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519086; x=1791123886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KoReSBu918TC7LfxH4R53EGW5VKxOHQwVKQfiuCg6QE=;
        b=LARR76NIMKliW+yUa2MyOaK8oRYVWAkZPm2i+R7j4X4LMZ4kFCxO6EY994tiaMQOkE
         p7flM/DSgQU4OqZ0nIoMd+IjrwxvajwzTeR56LKp0+/AUgOw/4Rs5/JA0dozTDYHply6
         NbRl+G1iqio/lznxdP2zLBRf4uVWcY2blr7OI+IUw7R3GCsryblTDaQESFyEB4nE2Bis
         Xu+c7DkM2nOd6XK3eBk2VB5uCao4t1QFnpkbUKaaN0x9uvwb7/OSTantAavb8UMiVPEA
         S7hhdK9AoLVkMlUL9YluFN6CDUTNfNlqYBVkwGSw4FRW20NA4xySSLXlBbpRdNFOvwsc
         kOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519086; x=1791123886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KoReSBu918TC7LfxH4R53EGW5VKxOHQwVKQfiuCg6QE=;
        b=FkVab4jv3h7y1DQ8/AgNaIBmcbDu7Gn/pmxLUSsPKy0njxFo6G6ArnuT82dMgaR8G+
         4BnnmWhquYYXB4gMkg9wQkQ/EutVNDxkoM/CpeCfowvGDT/+Wz+h6O+e7HWkiWUxhq0Y
         KyL9kcr2U6gc47YS1UTpwnXrp43hLKhp3Q9j+L23I12Dm/2K9kuPihF1nZ36HCiMfwvN
         3tC/OnLh67XT/HXjyFCq5lPq9QYgazsaWpTM/gbPuiBKu97pnwgcq6TLMZjhzcHa1XFq
         3KqMx8ySj8rOg7iIjPHrvtH+H5SxoXy8gAToHBOXB7A2kYwQi+Fe7mHSoXv4rPRdKxDn
         S7ug==
X-Forwarded-Encrypted: i=1; AKwUvBy65LAhajUzp7xfUbWsSeavLczLPPefi9/HoGyWrztlYtCpgtIVsmDYxQAyE7OiQlbnWD4k/PcQvXz9Kec=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs8YyESnpW/5Gp4hOjJxXnx/CI/fJlJXa+Mqa4RYDnAC5YPWDi
	y0mgI22fp5Nvyy0EnnsRngqQCoPpJ9I4aSo7M9kD0bPfe4urT+mJ59Ah
X-Gm-Gg: AYBFou1LJcBsd5JNPdl71gHYgebQXwXhlzVbTaH29eVPsmIoYJjf16JUk1+ZVC+TeEb
	wGda4GyjtH58zmFviy3mAiBd7LUCT6iA+0LtEH7KGv2GZB5WJtPq1uR+reZlewupMS5BCXxZL2+
	cca/jhLpKzG+hWS1iX9oR/X4oPPULskeGOa7deNWcU4YGODJcCzm5GiAlevQPlQMi4MQtLXnv1/
	ULzpRBY/iZAk7N6gKplKAN5M/AyadK36ownQWURw8nL0fpLuqbs4E8r5/M6Ty6HQRounsU1YKyv
	hC32lmY6nixYJyg51klYCd2XeSf+ASj9ImjIXWhIHB6bN5TTYs0kLNfVI6P2CzxBFZ0uV/ux+97
	KhaIPDNxcQiwWSvM6mdvw3f+YecMWQCucW/muGXn7vZssY5Zi4z6hNIyG8xeMNO5rkTttXu7uQj
	oTiac6h4lmBEeVpk0XsxnTCl3SzMF78jURbLV0/WWtqfOiiib1JFhYhpOfpMAw3HLLZV5xXpfXY
	g33xcKbMw==
X-Received: by 2002:a17:90b:2247:b0:3a0:ca03:3e1f with SMTP id 98e67ed59e1d1-3a0ca03447amr4203206a91.32.1790519085824;
        Sun, 27 Sep 2026 07:24:45 -0700 (PDT)
Received: from LAPTOP-QJLDGQ2L.lan ([47.82.103.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9892dbfsm15424701a91.11.2026.09.27.07.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:24:45 -0700 (PDT)
From: Boyan Liu <yymhvert@gmail.com>
To: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+7aebac19e62711ff@bugs.sh,
	Boyan Liu <yymhvert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] nfsd: Fix out-of-bounds read in clientstr_hashval()
Date: Sun, 27 Sep 2026 22:23:19 +0800
Message-ID: <20260927142319.12054-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clientstr_hashval() always hashes 8 bytes of the client name, but
since commit 6b1891052a3f ("nfsd: make nfs4_client_reclaim use an
xdr_netobj instead of a fixed char array") the name is a
kmemdup()'d xdr_netobj of arbitrary length. A 1-7 byte ownerid is
legal, so the hash reads past the allocation:

    BUG: KASAN: slab-out-of-bounds in nfsd4_find_reclaim_client
    Read of size 1 at addr ffff888010acf1a1 by task nfsd/141
    Call Trace:
     kasan_report (mm/kasan/report.c:595)
     nfsd4_find_reclaim_client (fs/nfsd/nfs4state.c:1622)
     nfsd4_reclaim_complete (fs/nfsd/nfs4state.c:5286)
     nfsd4_proc_compound (fs/nfsd/nfs4proc.c:3313)
     nfsd_dispatch (fs/nfsd/nfssvc.c:1038)
     svc_process_common (net/sunrpc/svc.c:1527)
     svc_process (net/sunrpc/svc.c:1682)
     svc_recv (net/sunrpc/svc_xprt.c:886)
     nfsd (fs/nfsd/nfssvc.c:919)

The hash only selects a bucket; compare_blob() does the real
comparison. Hash the actual length, like ownerstr_hashval() does.

Fixes: 6b1891052a3f ("nfsd: make nfs4_client_reclaim use an xdr_netobj instead of a fixed char array")
Cc: stable@vger.kernel.org
Reported-by: co+7aebac19e62711ff@bugs.sh
Signed-off-by: Boyan Liu <yymhvert@gmail.com>
---
 fs/nfsd/nfs4state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 18e17232c..6c50286fa 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -1619,7 +1619,7 @@ static unsigned int clientid_hashval(u32 id)
 
 static unsigned int clientstr_hashval(struct xdr_netobj name)
 {
-	return opaque_hashval(name.data, 8) & CLIENT_HASH_MASK;
+	return opaque_hashval(name.data, name.len) & CLIENT_HASH_MASK;
 }
 
 /*
-- 
2.43.0

