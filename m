Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F8371056
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452737; cv=none; b=QPF/wCHaRTno72db4GBYwM7cpTC6WBJGwn0k5F3vlaEbd5wIPtV13v9mzFsaZYi4aIB1Bi49AE05Vf7ETPyP9C1s0zEQOVhbs8s2MaoyUhK072hUm4F1Ljg5XCd4HIS5J6W8KHNtgySWT7kyIUuVdDbOYeO2DRTUIXUrmYC69Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452737; c=relaxed/simple;
	bh=OSBsZUvrhwcSIuPOCdqNSnmPQ4GkNDnc04aQTzCNXic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwebMZ85PkQtdKaVzQpJDxy7v02TyK36tMZ3hHPHy80jstoM8gnbI3/b6uLx8o/RzMaEy0g7u9A6E/H9oQjdk/Mj8rbeQfRY8Ec00QUMRtYASGxtQFQlDWOVTvjQNh9WZnkZk4Ku5v92aPOMGxE9J2ii2da+0xfTRcuz1vuqhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBZ4e1J+; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBZ4e1J+"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cca96ec1feso533535e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790452735; x=1791057535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeIZwRgVz0RIdraMrjfODss1t6G6xITndUtYiEdrjvs=;
        b=oBZ4e1J+hJWrLghT3UMHZq+DBTguJR+miXWs6/eLKKbsuRnQyHkP08QOwpM62hCiWG
         EzKMEcTz//5CEyJaU101uS31TNdh6DZQPlVPfze2zGGc/ca49waIlyihIKReIYBXGMfj
         K6om+HdpeKaph+Klg9Z8PY/KMnDqBhYQw38Xr6Tk4VPJDfQATabyMqKCVLXyYdzI1ZrP
         Ir3uEUamKvuoT2nIZVPOYpPYAGD/DWTw25qf9OUSQUfbUak2HLGFW9PcUvOCa2UgMaNp
         gWUpG0MgTYTLJDEZZtB5Kb3gndvvu7SmXvMno5Jm9YLF+JvgXjKIQ2cN41WUAjWCr5Ts
         eHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452735; x=1791057535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeIZwRgVz0RIdraMrjfODss1t6G6xITndUtYiEdrjvs=;
        b=OAcBv3SSXTzO4E5BgOv0jya7jEBzBBIR17/bfV5K3UPtVoPoM0Qq2q51VUWolIiHBy
         KeM5Ytb3KOnr2/8h5Ht5pqpiW0KPf7l3fcdsr/g5+5wTfuDquuZPqKZQxvhnHtCU2X6j
         rVbqDlvIu8bRh8qXYpv2FQAO3ThY8UeR0vN8djdY+K+tYGgAmdOb6n50X4G6nd7nfUUf
         M9GlZD4v6Zwxh/z8fAchH1UHWaoAUlh1gRNVsSbNTa0tDJBOh3gi/e692Xn9BmFTg08H
         0IcyqqB5rzYaJnW/EgAlVtZXggz019F9NyvcrC+XAOIwbIyy0r+TkpBXA+vsPE/RaThS
         K1SA==
X-Forwarded-Encrypted: i=1; AKwUvBwjJhXmDWdxYLP8wNgBvjJimwB9+/qPmvqZk40YjZdGQbVGXxzZrNILtXfYUs8BpQpkZ3RaErE2PUbEGoM=@vger.kernel.org
X-Gm-Message-State: AFuF++nG3mpOS8szerlReTiAx3FKGTLG5ly15tW7WW0WFnfD36MDqU9C
	6AMHYhx/SnFZrq0KXxlDht5HQbfCtuNGa4eZkvYVwHtOIZBJd610TnZc
X-Gm-Gg: AYBFou1rg4p8jFs4vBM+c48wGegfqga0TjXrbvwYCWqCB9UBo1ltoi+AjJB81OjAcFw
	l0mAfDSuOOWsr64vDpvwGOO+gzuRh30rNd8NlT4H1IYbDsYI0DCsOg9l7JhLtUMhRNvF0bSFeq1
	QT7vBLdz971TdyPNlRmBfqNC2BQ/jPipdN74E+A6O1jSaYH1ckAVhQAxo2FQfYsxqC5uSXWgc7w
	VGWxXcar3F/8n1yVXbqtHGqVIjZQ1+weTQRfPY/o4qE8GYr72GQn2P8KKbog1S7ICPrGkLRr0o8
	JYE5QqJmFtRPiVnbY+ed8vPBp0aeXEtv+uWkAseraJ3YBNoz5NNWKs9whT8Z12FQkzMnOBoKDPK
	s591JSwRiOGQd9HuVZRJqtZdZ+o/Ydu6yXfuK3LYvl8TBZ0FIrJkTP4FesJHBng/WNG/t5/R7sQ
	zBFD53D+iqAt8rohoLV/TH9JxQ+M910Opp3j1MmEBH1N7zYjYziKfovcAd+rr9xSjKGbtkjXOwk
	g==
X-Received: by 2002:a05:6102:3912:b0:7a5:9a:3a31 with SMTP id ada2fe7eead31-7af1e0ef5f1mr3624522137.34.1790452735029;
        Sat, 26 Sep 2026 12:58:55 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afedba5sm7437742241.8.2026.09.26.12.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:58:54 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: johan@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v4 0/2] debugfs: fix UAF and double-free in debugfs_str read/write
Date: Sat, 26 Sep 2026 16:58:42 -0300
Message-ID: <20260926195844.1296333-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DLPDB44JJRGJ.3K6JNS746M71C@kernel.org>
References: <DLPDB44JJRGJ.3K6JNS746M71C@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v3:
  - Patch 1/2: drop GFP_ATOMIC as suggested by Danilo.  Measure the
    string length under rcu_read_lock(), allocate with GFP_KERNEL
    outside the RCU critical section, then re-read and copy with
    strscpy() under a second rcu_read_lock().  If the current string
    no longer fits the allocated buffer, retry with a PAGE_SIZE
    allocation (upper bound enforced by the write path).
  - Patch 2/2: unchanged.
  - KASAN stress testing with both fixes applied completed with 0
    reports; the concurrent-writer reproducer produces ~3900 double-free
    reports without patch 2.

Danilo also suggested introducing a struct debugfs_string with explicit
synchronization to provide callers with a proper synchronization
contract.  I agree that would address the broader API issue,
and I'd be happy to work on it as a separate follow-up series
if you think that would be useful.


v3: regenerate patches with git format-patch (v2 failed to apply).
v2: split into two patches, add Assisted-by, include KASAN splat.
v1: https://lore.kernel.org/driver-core/20260925175831.3701812-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  debugfs: fix use-after-free in debugfs_read_file_str()
  debugfs: serialize concurrent writers in debugfs_write_file_str()

 fs/debugfs/file.c | 55 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 20 deletions(-)


base-commit: 6812ce4e4379ffc99c52401ec28f0d7ffbc36206
--
2.43.0

