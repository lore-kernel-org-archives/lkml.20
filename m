Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAF37F33D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790046756; cv=none; b=uCe3tLW/sqrAHAwEh00XkIWN1LDKgU9LIa8eeuPjjoZ4LqAa4Y/c/hveBj/vVfJtBI0VKZstByqgt3aE0ys1Gf/gpS6iFd0FcMIV1bozKh5MVElFDf25biSVMxCsXZAUtVPpqrJVJL5J8Fqfcgk588urO4iejhuhQO1rP9296cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790046756; c=relaxed/simple;
	bh=9B5L81kvVSXlVKSqFNeGPUoI3a3c4odt73AUe65yXX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l2OYP63v9ldZj6lFakGr1cDruiXBXDiq/yHowQN4kMwx44Lxh3rEWgqTYXYoyHD+8pILDhVW/maF0A4jjwEgJO59tYIK232jdviwH1TDmLGvPgKwb2B+NBqtqT4Ueqi6Kd15HiMflxCt1GFvGdrR2epjDpPIyvpeH44sxxMPZaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oI852utW; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oI852utW"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so1542076a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790046755; x=1790651555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7jvHxTv14GtRHevnUIJSj/4ENOuym9r9hmNx9q8r8M=;
        b=oI852utWqgN1AoQJn9zVJil6aaWCIi/MYzdESr7UhYzu4f4eqa0pl/Xnu6xB/gnaKN
         /liNrUJCN69ebkEzo4UW3ms/ZUcfmW54VMrporansmc3M2kw+XSoCg4ZN2JffWB8AvQM
         WQAkpiETikh+IGxG40W0EhZlQpF+cTcIskEJJlAp10w2pxKZMPtNAkg/la4u9j+3PsH+
         x2V04HHzvpoTNqE7cpbLfWB1rgJgehb8kPzE0iAJF0CUQlvTQqoNgDfAiDFYWHJmhAGB
         ChG7mQzua8mmr7MBCKAfHVuQHyYNS1lmuDocBI2JeUuu5b9z7lEv5MrE0m2pIjasp7Ot
         EXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790046755; x=1790651555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7jvHxTv14GtRHevnUIJSj/4ENOuym9r9hmNx9q8r8M=;
        b=czhAxwSos+YHgeKNLiCyMQbixmtkpBh+TqTqSmFkO4PFDGdbcfMRSpPyjaZWRB6l6W
         k8Be00zC1OfvM7KamUyDzphB6CPbrHwKMq11hBaGmGpVjVWVED/bTfVWCp397rSdLLgm
         /hitL8MK0XIueO6vLQ35tRKLlRpOZgPR+RIgAkRA0aH6cuEpF+6KWIjHZu8lYA4g12rq
         2+3pG0F3z3eajtp/ptD6LNy7z7y0fNSaC8Znly01LrKqBYfn/5zZzwcKBCyqGiYGkz9g
         MU4eENbsz3Kv/9MoQVBlEi3EHwALUnHG1DegLbyeXUgTDA+D+yk8pu3WVdM2d5Yv63qg
         s5RA==
X-Forwarded-Encrypted: i=1; AKwUvBx3+gKsJpbB++PU1dBPf27nBccp3D79e41uMKi9+lg99oc3X/YAz19us89CmO06T95Ox4hA3i0lYnVkiMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nKGvwOMKW1jgeLWQ2A9Frj9xAeP1q+vr3wfy+/HA6ghvXVF8zx
	FHPYhkIw7uMRvh7Qd5/26JelMhcyNYmuQScfTZwQOOZXSZNHXO+1yHjy
X-Gm-Gg: AYBFou3sZEuWl8tZLcrfa9h9nN22dirUCyxcgBHZXThPSQGMbUqUzsmn90a3f1ZKgBs
	LtAKVEIWc4YNnf9OM4p2FNB3BbQy9olki0mwK8PJiqC0JCXQ/0iSeQm+o/86pnfGZ3fLNkwIOR1
	svAIAgsPd58F601hlbk0dxjQ/0LVGHqcjpeE6Ds1HQJtSnc3MSQHOPb9w4OErImpJ3VVKhpa3wl
	vLroQdiyTi1BM3AuHWNoVDM1qmMp54eMqIPhSKOfBHPVw8nWjvWDs37HneXZ5NYVV7xBV5yMtKD
	XKgQRd39cm3t+QSFtY2MZ6i7H5009cAP00Hrqknzgp/aS8TXDPRRoPUAtvyO+B56xLZZT8AbIiX
	49PbeGghHWX/Qs1JT7oYub6DuMI0Y8gRyLR3X2NxtTChkfejeAmTS2PhuJHGpdLwVxWyRlrwsST
	TsIx/arBvK4VzHp/xKoDWlOOItVyn/MLnuxCbfKUY1eeEfwA1bLQAJNs7Us0aAAB099rqHSJu9H
	97IGB3XQC4=
X-Received: by 2002:a17:90b:3ccf:b0:39e:4c7f:7309 with SMTP id 98e67ed59e1d1-39e550784ecmr18060387a91.32.1790046754990;
        Mon, 21 Sep 2026 20:12:34 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06cbe3714sm294627a91.0.2026.09.21.20.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:12:34 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: kees@kernel.org,
	joel.granados@kernel.org
Cc: kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 0/2] sysctl: Two jiffies converter regressions from 2dc164a48e6f
Date: Tue, 22 Sep 2026 11:12:26 +0800
Message-ID: <20260922031229.2300283-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following commit afdf35cfae0d ("sysctl: Fix type truncation in
sysctl_msec_to_jiffies") I went through the rest of the converter family.
Commit 2dc164a48e6f ("sysctl: Create converter functions with two new
macros") dropped two guards when it folded the open-coded conversions into
macros:

  - the read path hands a sign-extended int to the converter, so reading
    back any negative value produces a wrapped number

  - mult_hz() multiplies unbounded, and the caller's INT_MAX check
    inspects the product, so it cannot see a wrap

clock_t_to_jiffies(), used by the userhz variant, kept its own saturation
and is not affected.

Tested on x86_64 at HZ=1000 under QEMU, writing and reading back
tcp_fin_timeout, tcp_keepalive_time, ipfrag_time, icmp_ratelimit and
neigh/default/retrans_time before and after.  I did not test 32-bit or
other HZ values.

One thing I am not sure about: afdf35cfae0d carries Fixes: b96b5c6708ea,
but the "jif > INT_MAX" guard the ms variant used to have also went away
in 2dc164a48e6f.

Zhan Xusheng (2):
  sysctl: Negate before converting in the int read path
  time/jiffies: Saturate in mult_hz() instead of wrapping

 kernel/sysctl.c       | 2 +-
 kernel/time/jiffies.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)


base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

