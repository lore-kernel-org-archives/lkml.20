Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D7B499F06
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968568; cv=none; b=P0RTop+OmUuhIwPv6+Esi17MaoRGoe1lMjXRe0Hiv05AxsGOX1P4aKE8mibnUbpyjljYCgUzXwEYfimnW19eL+0qwvmK5qbfLHVj1DGmRf+CZKoRmUqfgo72RZWdXffvtsQcXhj8bZjDak4wWPU8g4C6DPGBHrpznEb16Dy6Hnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968568; c=relaxed/simple;
	bh=lHYdUy+fPjbDIamKXXSZVXQStz7GcmUwURwRKXS+W7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X5fZPSM7MVpbmqS/12eO7oFUdsCnL3SXEeP1gSbM24vXM+pI93scn9OteeoCyVEjEF8Ba8a/bXbiRg7se2eqBBLFi5xGEohJFOUjr6vfLLbBNEfJVB/3598qtwBUDJeHrsAznjJI7OUie0EAJnY5khIZVTlcCEPBxvSNYIUS8Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tC+fjkXX; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tC+fjkXX"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3188904a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791968563; x=1792573363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvGRNBwDPobPO7nwXeOj3RUpnQAXQpmRmyxD4LJ1RXU=;
        b=tC+fjkXXbvq5eJSFTnotBr7+xWNHh3NFqqKKDMkgnpYtgtjeuN20fCst7enm4nyhQD
         zTgbcdEmj2LvoyWiArFQMnWrIR0EL9xM4AMcSiufKSrHgRLXKyAsg7V4nOpspgNGnztt
         gtlYLhScbq+gtrbpNJHVZC2E7V/F73u+REiWxs74rJCRmVDZ7X85cuUD2GVh61diw4aT
         xUJ+xmdFIsfg0zPZYPknJKxY5/sY6R1hgY77XvViR59AsYddICBRsrTzRXFFOU96nndO
         QtCvaRJ/XOCXlEUqdJ7Y/5fNk0nGCgKkMGph11c1RVnF3gxCUeqgVLkJ3fYdtI/z7gn8
         xzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968563; x=1792573363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvGRNBwDPobPO7nwXeOj3RUpnQAXQpmRmyxD4LJ1RXU=;
        b=dSifjU65I8YRX0n3heVF3BpImTEfZ6nq8J7o01fkI3254BnyTd1TmyUonNTrD0AHUT
         NNR0YnG/OiJv3xkNwnnnYgiQ3Rha9fwZCe+mtF+2QEm56NnzDbfs/eBM8U1enFyb8MH0
         2CPe8KRAx5H/TUYDAS1cDFL/Ds0JD22rjJyEY4AqhaZkKUOSmjHf6TYaeFm6yWErKflT
         6lxAlazU0DUmMaU91D312GMXTm8gVw+EUQPtVmZf8StBZURe8k515QWdyGhhxyQ1RYsT
         TPqnacCG+gcSe4Jb9dTma9JZ2R9BJgiGk+Tcx6XDPbl20azKhexx4TcNP0RfLYO+fLeb
         5uGA==
X-Forwarded-Encrypted: i=1; AKwUvBzY4fRHYfl/JBAuwlM/M7r1JKP6CpJU6fzbFumO8bzocRF37u9SlXwb5+4PTQKAJ1XmV5xkSybIAQrBUTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgQPpvefmA5nHyKRP9zvH6htdRSFY0mWbg8Cxq1UwkNbhkwB0e
	O/5+evvSeFuNBi8Tbx6GMIiQU1Yuiy7E6/d7RPFyMIXollmQlbkXaDBb
X-Gm-Gg: AYBFou1YSSMhiM5rvV4BCOOQARm1CkDHjIz2egJKAXdzSd5zFso4+lHD2JyjKlUNhNO
	n6CMYmJeLEgfbHBNCNhKHpV15cjZcL+bhE2flWwZ1s+zlrlDO3O1FRyy62K3fzyBrSmSKeOlm/S
	nKCmE+ctAkClUh/ko2R1TC6hZKRXlwdtSPicGr0K9fVX4EMvgEgIg1rErvozlHndH4fn0rMBcjs
	ztYru6nBDwvHKq2GNvtCEQ+Ym89oC5vmk8pkCl7jnhVEwhW0zEaUF8edEofxXqgju/cOF/P2Vs4
	qUTgDUS7q9UYDlurWzNWOku2MXkKwOTK4rLzvW1jx1b/Kj9LondR5XhPyPunhgsYgftCD8oSxDM
	OoPbvbVtY/ZMjvqeFgpYmTIqYHe9jKWqNfOY7I9uGAalARXDZzio8DIacv9GZdIFdUeRN34ZnvW
	CHl905+loIoR836VLgczujlKQZrUW8lx9OxS0b0LGn1vl2QEnEJBMDt0WR63AtYPJzwY6a+EzGF
	SxYUz4bhJULCAUrFpXSipK340cX3FrO9w==
X-Received: by 2002:a17:90b:4b:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3ab3ac59383mr11813233a91.47.1791968562735;
        Wed, 14 Oct 2026 02:02:42 -0700 (PDT)
Received: from DESKTOP-UCPRL76.localdomain ([113.200.174.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac84150036sm440921a91.17.2026.10.14.02.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:02:42 -0700 (PDT)
From: vienna-0FFH <viennaoffh@gmail.com>
To: Alexander Aring <aahringo@redhat.com>,
	David Teigland <teigland@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	viennaoffh@gmail.com,
	syzbot+04dfbd15d442517e713a@syzkaller.appspotmail.com
Subject: [PATCH] dlm: don't warn when closing a node without a connection
Date: Wed, 14 Oct 2026 17:02:37 +0800
Message-ID: <20261014090237.395-1-viennaoffh@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Opening and closing a configfs comm entry without ever configuring an
address for it triggers the following warning:

  mkdir /sys/kernel/config/dlm/cluster
  mkdir /sys/kernel/config/dlm/cluster/comms/1
  rmdir /sys/kernel/config/dlm/cluster/comms/1

  dlm: closing connection to node 1
  ------------[ cut here ]------------
  !con
  WARNING: fs/dlm/lowcomms.c:1455 at dlm_lowcomms_close+0x12d/0x470, CPU#1

Since commit 6f0b0b5d7ae7 ("fs: dlm: remove dlm_node_addrs lookup list")
the lowcomms connection has the same lifetime as the configfs comm
entry, but a connection is only created when an address is configured
via the addr attribute. Removing a comm entry for which no address was
ever set up is valid and the resulting close call has simply nothing
to do, so it must not warn.

Reported-by: syzbot+04dfbd15d442517e713a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=04dfbd15d442517e713a
Fixes: 6f0b0b5d7ae7 ("fs: dlm: remove dlm_node_addrs lookup list")
Cc: stable@vger.kernel.org
Signed-off-by: vienna-0FFH <viennaoffh@gmail.com>
---
 fs/dlm/lowcomms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 2aff1c7..86c7af9 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1452,7 +1452,11 @@ int dlm_lowcomms_close(int nodeid)
 
 	idx = srcu_read_lock(&connections_srcu);
 	con = nodeid2con(nodeid, 0);
-	if (WARN_ON_ONCE(!con)) {
+	/* case of dlm_midcomms_close() for a node which never had an
+	 * address configured, so no connection was ever created and
+	 * there is nothing to close
+	 */
+	if (!con) {
 		srcu_read_unlock(&connections_srcu, idx);
 		return -ENOENT;
 	}
-- 
2.43.0

