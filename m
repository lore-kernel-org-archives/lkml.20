Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8D24FECE9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566858; cv=none; b=rEnSFzX/RYh7bZUq/odyB7PH25qqND7Bq/xJ/ATZakoYrpw0hDt7OZ60ek20rRWKQtJH34FZa19na+ayILMHqblIKgRZzCx6f9PSrqVIV5y5iz9bQHvJ52zFghJe/gBAt+J9+NJIPVK3KpgLPN44HpRX/XHa6BC1t9sBho6E3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566858; c=relaxed/simple;
	bh=gaP3oZ/AnBH8rs+Ktf9u2PAyvt0WSCNjXDKQ1OyNg/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jjhKKrSSoIzkRohwBn49VILF6ePte9fA09bpCnHaCVgxp+wNcgLppxKmLIuf5xIVlLBt1jGvNG0ebSBZeCAc2IE1+IMJcxFPhn917Fy5jL30+w5TDr73knPrrPdY2MdBnOvb0d7osCuCK9zGhfr5N735S0KNZUlKmKm77Hyjges=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOg1Udvd; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOg1Udvd"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d561173f9fso39673815ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789566851; x=1790171651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qc/rLQY/xgi48oS7JinasFyBURKLxLOAJ3bkaqo/Vho=;
        b=YOg1UdvddSDhe9z6zxDSedHQZT1oyNdfcXHU5qxjrEj/NhwU9Az0pS3lcvgR/lpqX3
         vLGndEKINmFmmFhi5e5QqxnobqeOEp7r7LgpH/xAbmyAwS/S8iTVCl2WDuHdTC3/zHNd
         ehkl4HebKmn2KPV1KJEANGEoe4OQ+ytnyTERrDTdB4iF8z0RdRbBEy4f+UCuGuk9N3aY
         nNhmetkZxci9nne6tuej87d2LIa1myqpL3gAkPmauG/AA/ais4NR5qZMpqTJ5NsW7w8m
         7khSe0Uruz2G3zwpP6FTancqnsNOVixmTnlvtsad1uMsRgEz9yOneltdaTz4zfiEQTJ0
         tAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789566851; x=1790171651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qc/rLQY/xgi48oS7JinasFyBURKLxLOAJ3bkaqo/Vho=;
        b=vFfYMxS5LQTdtCEBepKD28JQJDylYzCndDCZfUcSJYPud0mjOlkLIDZRcC0QG61G1b
         66qJdKyrTCFLetvdnSBfvDOuBY3loQ9ke708/EHy4TjCLmFdRrAJZmf3g1hoOOAzTqVM
         rVU8h2xF2jthXkMB9LNKJUQm67bzdINqjBjE349svuza3RpH277kHav6ypJ5Km40rl4J
         Zn/Uvyxs2xHAZIjZZ/BxxGV8K3x5cXi/GDIO+bz1rjCMHyHlKvVlSnMOYzFG8Fttx6vU
         Q6T/R7h3OWxTAvg+m/ZYpqd2GXLXOE/mkODs1fvKP7Xk+y7Nf17G9F457xfdfkLZJP7+
         iyeg==
X-Forwarded-Encrypted: i=1; AKwUvByBrcStYlPXFY6dxbVITck18P3wEXfSZK90E1B17XR9CBjkH7j3o2NXBGDJicJGVVh9dkWhdQ0WqacaVto=@vger.kernel.org
X-Gm-Message-State: AFuF++lYzkCgbj0XEx1vWqmITYNgJANbIBu+Jz9/Fq5alsjiHdzQoGq5
	qLhemcmAdRMh+u3zXcIdJV5McB2JhFssqVDy5xKHfiDF/x2lpIYOCDrp
X-Gm-Gg: AYBFou39ZJQSED/JH6TDHkKwHvM+Dq2VcjJagy1vojhu19OS1TskJ0LB/Tm6/q6cb9I
	H06XKqKZ8Uoimr1PHAOFuJG74ZPdgCJJ0k/PjxdTFJAw0SoUafiv4rdZCjj0n1kHsIPsw/gjS32
	7vbSkyxOXp+iG38AQ1BvtgGEIEuxGlRWVG4W8aPiFu1L4eLLv+V7EKk+X8eO2qvO/0PyJENaa+P
	zByC96nbnEHtwWTrWwpDjtErFMsg0UlGlOHHZMNoKD8D2NxQn61sNsPtzuYNw+b/0PaLmMp1oQ1
	yfKJfLZ25Z6HY4MC/a2Eq9SCyC/dAQuBT5W0fKaf0k0R/ug/cVhSn/ADuXzB4KDrFQjgpy8D0jl
	c3upL9QzSVorhCh+65A0Q06j+ILOt4D6MTzOst/5pCe7pCQZDhiJdc0G9cB6lvmb2shcSxblWLM
	okaJVHz1QtTl0E1jcEtd9f3DUPwIuI/k9qQtNwqLTyIPb922aUf0IacQ9T5LW6jvlhi7FljzI20
	BYc+adklelaRLqFl0nbVC5+D+9mmW/vXEQTHNzjmB4+quWH4bg=
X-Received: by 2002:a17:902:e551:b0:2d6:fee6:65ae with SMTP id d9443c01a7336-2dd8dd0a955mr59563295ad.4.1789566851371;
        Wed, 16 Sep 2026 06:54:11 -0700 (PDT)
Received: from localhost.localdomain ([38.60.126.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm12070425ad.62.2026.09.16.06.54.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 06:54:11 -0700 (PDT)
From: Haobin Wu <853555@gmail.com>
To: ericvh@kernel.org,
	lucho@ionkov.net,
	asmadeus@codewreck.org,
	v9fs@lists.linux.dev
Cc: linux_oss@crudebyte.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	aneesh.kumar@linux.vnet.ibm.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	jack@suse.cz,
	willy@infradead.org,
	dhowells@redhat.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org
Subject: [PATCH v2 0/2] 9p: handle long directory entry names in readdir
Date: Wed, 16 Sep 2026 21:54:01 +0800
Message-ID: <20260916135403.15789-1-853555@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dominique,

Thanks for the review, and sorry for the delay. Here is v2 with the
changes you and Jan asked for; details below.

A host directory entry whose name is longer than 255 bytes currently
makes 9p's readdir fail with -EIO and hides every entry after it, which
is how this was noticed on WSL (Plan 9 shares of Windows drives).

Patch 1 drops the copy into the fixed 256-byte p9_dirent::d_name and
uses the string p9pdu_vreadf() already allocated, so the listing no
longer aborts.

Patch 2 then skips entries whose name is longer than NAME_MAX instead
of returning them to userspace, as discussed with Dominique and Jan on
v1: the VFS only enforces PATH_MAX in verify_dirent_name(), and nothing
can operate on such a name afterwards anyway.

Changes since v1:
- Use my real name in From/Signed-off-by (Dominique).
- Split into two patches (Dominique).
- Reworded the subject and commit message of patch 1 to describe the
  existing readdir path and clarify that no allocation is added
  (Dominique).
- New patch 2 skipping entries longer than NAME_MAX (Dominique, Jan).
- Dropped the bouncing sripathik@in.ibm.com address from Cc.

v1: https://lore.kernel.org/all/20260826064819.52523-1-853555@gmail.com/

Haobin Wu (2):
  9p: skip intermediate directory entry name copy in p9dirent_read()
  9p: skip directory entries with names longer than NAME_MAX

 fs/9p/vfs_dir.c         | 17 +++++++++++++----
 include/net/9p/client.h |  2 +-
 net/9p/protocol.c       | 12 ++----------
 3 files changed, 16 insertions(+), 15 deletions(-)


base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.54.0 (Apple Git-157)

