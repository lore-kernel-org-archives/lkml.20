Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792919262;
	b=1uI3SkpewyKhpr58bmF+kNgYVJFrhu7kRh1YRaBYIWZbcbcZ2chFC3GXkYogf+Ee6ktF
	 nZLGqAu1ML/Go1OSRnhkgL1h1QU8TA+e8DWmTFUMq32mnfMA9yc3VcOYHUnBwzgbZJ0la
	 vj/jRTRxMz47dk6S6hm3A13sNdl7hCHNO8oG+JHk2X2HzHnG1PJLLvRn2GYSx3Y+u/88e
	 umfThEhTeyV7EsmHgj+3ATwYi68Fn0x4VdMdBZ1kOP6M4XN+nWVL/oJZa+Sqy/hDHTpMp
	 ACq3gcoZpKkkw6E3Vvk26R4v+lOwLH2FDAodu0zCHrvlLpFGZOTW3q7CEdk0Ye3DUIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792919262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/dIYdqOLAkHeO2RCiPKPFUB8jMZrrEYZH4Bk6Bmq0Tw=;
	b=2AHECbs3ZW/Oxq5OP+lSaC1KkR333+yu57fAusFGzRZk+Pc1A4vzNPJxZPHL+o10czOM
	 y8+x+/SPI5zXUKJXJhzK85JIoeHVwETgNKFJfr/dhLyxwWUgOxanAOSumVEBx0qV/WxAN
	 QGDmrhLQrZaYanc19o0QkeLXPdwsxX3cug2ytt4/6l0Gf4k+4qxTniGMlsQxdWe5Rx0PZ
	 kGEgG7ccoFvQqwNwNIA2DgkfjVB3tgH0b8GhwFyVJCT9rZPsaQfRhLQ88fvKV8MRHnkAX
	 DLePTqMU0GPdTOfiBeHiEYLTSvmUUDNwmKMvgWcl8Qv9KC+OcS8bWMjlg3SzbWNsaHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reU3kH8T;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BE9606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67BE9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reU3kH8T
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4115333eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792919260; x=1793524060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/dIYdqOLAkHeO2RCiPKPFUB8jMZrrEYZH4Bk6Bmq0Tw=;
        b=reU3kH8Tibh8CvDEuQthjv2+W4rRV+cLOaFvn/VF1gieSmyp4esJxPUvsZhnBEpvhh
         ho/5xM8taJpiW+v7hs8vAt72EMkx/Kv/zFicXEqFAYKNUaPCUrc4mKRUOOlIzq3O8edu
         /8Jpr4WbPIbbKw0RDSGgq5TDjk/R0ExscsiaXmbg6NKw8uE8zxqig8dIXU5lMNYk6raf
         25dz+yC4eEJ6U5TyCG2wlrJGrf4Rd26erPHdGWxOT+AZMTijYMUzIx67NMgIPUqLniNG
         gUDUfnRMnPRqRhmYdEQn4vXYk06hpclzEBdbpxWbyaXirXOBHyD3VZX+zBaDjX4MkVaK
         FQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792919260; x=1793524060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dIYdqOLAkHeO2RCiPKPFUB8jMZrrEYZH4Bk6Bmq0Tw=;
        b=JT2ZPmYPAvvro58IXzevHKzbm6EXd+KSRs5OSizaYgdo/epjmomEi2wB8Ze4s7Wp3b
         cCD0HIboprnl2OJ6VKBJsTUED/CUQllqCrBOGs9rWLGbYU52ZA1qZ1PwW7ktxuhb3TEm
         WthA1k33K23018dkbxKhvjyAJ1kWIvJbhII10VD7FxqOPJI2Hzjmy4tRBNLJmszJZYHR
         Kxgk1Dm2uyajPsCM+4iOENsqrBtX/oHDvNvlzSydpKIXDyE8DqMRMluxEnZjIyK8qy/S
         /+IgVWfkf/qyAWweVZ82NX+uChBxn/0YGQvMebyTtrSKTtvq5k8wC/+RszAhXzvI7tH9
         0E5w==
X-Forwarded-Encrypted: i=1; AKwUvBw/RtQqNTqWiEF/XPxCdnEfzXlSw/rb+umNsMxYmfq/b+BwH1IZL1K5dmEoru5DACRnCJFAzJ4T+yctags=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIhJYjuLPRN9zNAR2w8i1fF1no0QKIeOOWnJACTXyK8ML7HpzI
	Quu6purMyBnu9I5jI9XQQx79xI9wOW/jfIHkwJmn9HlryLQ8+S3B9UYk
X-Gm-Gg: AYBFou3dyMvNtG75q7D5O/KxhpELbvLsa6ZzmYbkYtieOm80AgRTuvLWJ0vLJThey72
	1lln1/w4Y4emCEvrA/I7G05i+kKjf+UGN4myK+WPGS5RidyWoTcaoCFkbktaerj40yxE/wG/qnt
	c5kcIwnRNIJXCqcMn/GaJRrYwZWWe+I/cfr6ea4z3ZHD2vEYim+EgPKSB6oBZWnSujKOrH6GOSu
	MxS5j4HR3qHck5ocj92yJjtRoofj6fs5DpnnFlHX4Tbi7cwd77dUStw+J91INMAF1C6/QwzGHRa
	Sn8zPNGhSYmc44IX6RcAl+7DeTIB5rAMN+QkLR+kT1jt6CX57fklOfA8uwzo+a+i17W7taCEsHF
	J+poIPiyrTLE1tuUpIqt/XqESFH7Z+828rDnEIwsT4aoC53UZ+F+o7IT+FtGoj3JMtd6fjcxf5U
	f3h9qUmLU3iZOmWyeG3ETXPp380kjUPeXGfZB2UVRos26fc0Ro3avFKQK4swqU43SoF6izYp6Dx
	bDphQp0VApNd4ptO94ZSbZUlYU+K9rAhHpTy+ymL8bu+ZdJI3xOVjf1YIbfLnU2XFSVZa3tzvOs
	Louf4GBX2q1pR60ax7+247CuUZet
X-Received: by 2002:a05:693c:69d0:b0:369:f9b6:f471 with SMTP id 5a478bee46e88-369f9b70b8emr1360895eec.24.1792919260380;
        Sun, 25 Oct 2026 02:07:40 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec4d73sm19815122eec.22.2026.10.25.02.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 02:07:39 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>
Cc: linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve French <stfrench@microsoft.com>,
	David Howells <dhowells@redhat.com>,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org,
	co+24c7c12d69e63c6d@bugs.sh
Subject: [PATCH] smb: client: stop processing a read response after a receive error
Date: Sun, 25 Oct 2026 02:07:30 -0700
Message-ID: <20261025090730.2893106-1-bestswngs@gmail.com>
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

cifs_read_iter_from_socket() may call cifs_reconnect() before returning an
error.  The reconnect path aborts pending mids and invokes their callbacks.
The callback can then release the cifs_io_subrequest containing rdata.

cifs_readv_receive() nevertheless continues after a negative return and may
dereference rdata in cifs_readv_discard().  KASAN reports the resulting
UAF:

  BUG: KASAN: slab-use-after-free in cifs_readv_receive
  Read of size 4 by task cifsd
  cifs_readv_receive (fs/smb/client/transport.c:1284)
  cifs_demultiplex_thread (fs/smb/client/connect.c:1355)
  kthread (kernel/kthread.c:436)
  ret_from_fork (arch/x86/kernel/process.c:158)

  Freed by task 148:
  netfs_put_subrequest (fs/netfs/objects.c:267)
  netfs_read_collection (fs/netfs/read_collect.c:460)
  netfs_wait_for_in_progress (fs/netfs/misc.c:462)

Return the socket error immediately, as this path did before the iterator
conversion.  This also avoids adding a negative length to total_read.

Cc: stable@vger.kernel.org
Fixes: d08089f649a0 ("cifs: Change the I/O paths to use an iterator rather than a page list")
Reported-by: <co+24c7c12d69e63c6d@bugs.sh>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/smb/client/transport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
index e266859818a441..b7c0ec5d956551 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -1272,6 +1272,8 @@ cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid)
 #endif
 		length = cifs_read_iter_from_socket(server, &rdata->subreq.io_iter,
 						    data_len);
+	if (length < 0)
+		return length;
 	if (length > 0)
 		rdata->got_bytes += length;
 	server->total_read += length;
-- 
2.56.0

