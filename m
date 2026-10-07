Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FBBEADC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350984; cv=none; b=UpIwr+Zj2SdDBwRVp3OMVRjnY4MSvwFQDBQuLbxHXvZyZqZ4gg5qbupyD7vop/2oRdj0qawttgynVMbj73ENZ9qjfeE8+b731zh/bPZJ6OAtxt1+XB/rgGfG7EKyCqc8wckgOi/IHFebb2Dpgr655WrhCAUb+TxX8HScNeGxbJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350984; c=relaxed/simple;
	bh=J3+Pdn8knhCex/5fNHIbl42ZFNAf6bBBLl+gO8QW1UU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iv+FNljEJxvSuYklH82zXxswR29rXI7X9h85Ov5kfH4EgRvrreNiwJOSYHYXXnH4ACaM3MsOsPrX9gYOC6i2zNja0CexH0F6UyAYQKC5orPHcrPXsFtFcfMOTGD+qnWmmJZ/qmRwXXMNhE7VmB/HBakvnk4JSgJe0A7lnKjzqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=mzcIIKBm; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="mzcIIKBm"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381b831d535so3595955a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1791350981; x=1791955781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZzDXRTAPc24uvLKpEOQeiyaGaw6fi7o5w8ydbtTKHM=;
        b=mzcIIKBm1W2RkN3mE3XNCqxJjTqoagOnixLZswdwPK1dZBMDxxJppykYcxzarPnWzp
         XPUt6nT7fv/hypnigjNrweaZB6JJdLGkSDW/AWgSIrA1VORUutuqIZpXguxbzbnMEpQ2
         tN3iWaFF0oCf8f6BkwuJNgWpm20FnzcEr6o/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350981; x=1791955781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZzDXRTAPc24uvLKpEOQeiyaGaw6fi7o5w8ydbtTKHM=;
        b=JeUE8aBuBGqn/Oowt8UybeVvn1riXgSWQ93Ehoimd3rcVaOQe3nGbCOof5gihynWvB
         9P6fkFdazzizcfRpTKTXAq1fnNIKIHBvU9CnY6whkXEkqqgrlXqUBVHDxZEis6JKmIOL
         wW7jK9zSdyIBqSrI19OMPXMbuEsWeyZn1yhUrFpeUv2GIw7+eH+c/3L+lL2f6p5qxM7h
         QpaELJzNntnyG3zF2amiheNEDhHuSm2CfWbOf5OAQ2XItqwmBmJ3TR+XSWC54wE9XSMM
         UPN/NyLkHvdVW/+GAWxcJFVdkqdZIgfJzoaF1V+XYIx3ywvOOHHRmLb9kOZMVaTLbrxO
         o6sw==
X-Gm-Message-State: AFq9FYJt83QHlfFWAciCx4R+LGjPYIh79nst0IKwiatsxuQg62mS1RxB
	ZYNTYZ2QTht0lSp3SDz1gHkcp1UTsRKlHwC1vB3hdzUD5jpb1AMK6MI8OhUlqgFG+eZ+WrLIROj
	klxq3
X-Gm-Gg: AYBFou0mjwDJjBeDUkpd5JHdlkLG0Uxw92c41W9pJeeOJW/AvYOE0w0yLfh8S9aNHpH
	OsByQIbVCNaq2GXvOoJzQMfg1i+dxY3E48OZI13AU8gpnuKw57oQbPjExzsUn0fo/ig49J0kJjY
	9fnu0KdP4+unhhy2QH+iyWx92XNWbmDWldn7bGmDXNClTK9Iexone8foYtZjrsmZfHbzmPLtHac
	NX6cXFqeE4V8t043j0aqAoQmGl2eomdxG8Ss/oefZyDfhkGfqYDavd7n/BcIzHGXUJHLFgPtPfT
	EtjG2AtV0re2NuUsmXbd6mFGqxPGSENNHyoS7dzvjg/N9j6yP+8qKQ0++WdTw6R6/e5OfH2noqH
	AwWjKM1+G3fiEM46wbune5IYMJ/VwzPsRJz5fHqaSiYetyXHCa1NUdGnPyxpdugj7MrH1kBTOyr
	/UWruFl9yIuLZjBPmTclX70UZr3KolkDJ426s/T17JKDduDL8H0OuXwxgPr0m2sCyLDh0MW8K1B
	eNdXgBuqC0EaJDs8GGw
X-Received: by 2002:a17:90b:3809:b0:3a4:9f46:83c3 with SMTP id 98e67ed59e1d1-3a8a1b2f6c6mr1113029a91.45.1791350981252;
        Tue, 06 Oct 2026 22:29:41 -0700 (PDT)
Received: from kinako (softbank126255145177.bbtec.net. [126.255.145.177])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm8208425a91.13.2026.10.06.22.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:29:40 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v2 0/2] nolibc: Add dirfd()
Date: Wed,  7 Oct 2026 14:29:11 +0900
Message-ID: <20261007052914.888956-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dirfd() to convert a DIR back to an fd for functions like fstatat()
that take an fd.

Change log:
v2 - Fix the name of the dirfd helper, I debated over removing the helper
     as suggested by Thomas but it seems right to have the logic in a single
     place.
     Add test a basic test to make sure dirfd() actually does convert back
     to the expected fd and using dirfd() with fstatat().

Daniel Palmer (2):
  tools/nolibc: Add dirfd()
  selftests/nolibc: Add test for dirfd()

 tools/include/nolibc/dirent.h                | 38 ++++++++++++----
 tools/testing/selftests/nolibc/nolibc-test.c | 47 ++++++++++++++++++++
 2 files changed, 77 insertions(+), 8 deletions(-)

-- 
2.53.0

