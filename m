Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396641;
	b=ZvdE647fdrXjwLgUiaMiK2YFbeP48eIP6emEdcZ+wfRW/y6eGXccapd/CqEYrLk60cO7
	 +Sb4WFIG3xyyAsewCKfB5MrgbC81Bw+XoisUtc9qoRwCQBgHgpC4r1qxEySEura359Bj7
	 +fcdDhPT+tv4B6lXOKr7QKzy0iB2eZHDgvMlf0HTLxIo5idbXcLblydE3txcF04T+J+Rt
	 uDiw40DXAuhzqaQkIwkgaKp9Lh8mNwUWJmIDkBY6vXjIzcRQuI6N9jnDymVQbKOyHL/mL
	 8JhkMpvlXaf6FHpao8CQQkFhe3g8Sadx/Ty10vxZut94FtEgVSuNMvu6zX5m6wVtHlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BR3C7X5L79A8iSQFZKFRMc0cQ3J+KtB6+sTRGC/NFlE=;
	b=xodJP93qt1Mb+mBPVaegRwU7TC4ffGk9ZGnnUFA7buO/lG5HFXQYlJwgIEUaDnkn62GP
	 n4+70AyQ6MswejclES7zwQWb88Xbm/EZoa1urJycsLEPU3i0AonFeu+x4jicgVCsAjxKv
	 d0CNksMq7Dwhu8QSDSVsexhVkLMmwLXTCHJVfkvS6RWNiQ0hU4IY60HgB5FTeFwzmN1pI
	 F+mPmGBX7LUtXBd+GbBvS54Ij7/5JodbbWJ/DnLrDhRM81TfDYnas/G8Vw8L2MKO2/1Pr
	 W2HW1puXDpqQlo1XQiQ+8079rGxqyZSJhKxao9nCa5X07NxccsbRMjbtB//He2Pwysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=ZkHo62if;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD049606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD049606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=ZkHo62if
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492f563d1c6so1176745f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794396639; x=1795001439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BR3C7X5L79A8iSQFZKFRMc0cQ3J+KtB6+sTRGC/NFlE=;
        b=ZkHo62ifmcuJUtylp4XDkQj48Cq1eIVrNjJUmhzuVRZI4EFKmh6+AdJD4N8fLb4I+q
         QA3oNat9Tf0IX75M0A2qeE3AR8lDGbA+EQ0RTcnfnSJDIJ70j1nQkn7EDfB9LwG+M7hO
         vZQKHWCD+phtyXlyEjrxGdJ/SK3TOrBf+WeKNN+3FwqReLFqU9Ge3AIUFS/rc3nUb7gj
         R0RAwO5jQBasn+CyCpgzeZzF0M5xtUiPtH7QBH+n4qeJhpEkZKtWsEfUPVW5df9JZv13
         vESRig50GhfUGkjaB4Wqh73fFh9wiMsc6wpBP4P+4lw7FbAKVjOKMKcaJir9KBwh9KtD
         jjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396639; x=1795001439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BR3C7X5L79A8iSQFZKFRMc0cQ3J+KtB6+sTRGC/NFlE=;
        b=HIhhTgwE6buoP+OZiCgrMgEAOSPM3LrgIehqGMqcnKpToeeXi2VeOLeOfbvg4IX8uP
         9S9zgHygap76yFVPsp/8tEajrEFXa2eB51zxnQVxLYT9DNx8P4rv/zeFPqMh79URS9wZ
         bEV+43GjN1BIxwOAp87T92ogsQH86uUSc2ERLOqRhV4m6OwakSfLI/+fJ1G2ODoYIGy/
         ctjTwobYVtZ5wqt8YdlZlzlhjtlIUu+FqUsrgVCsy2KfJMypuNeb/xVsoEaPHaz9GLIB
         YszY6SaPf7hYgq7903oBaJ3/g1+WbrLxSRqW3vwCL9Pds6D0/HNxujwYccgWZU2KhJMZ
         Q6YQ==
X-Forwarded-Encrypted: i=1; AL+hErHw4YO/NJUQt4ot7MuGrPMz+9r5/GSfpfasDk0GHVB6URSULoIrDBxU1bkPb8DGP4p2UelaUNs7RtCoZZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9In3ssuiChBo5x5mVbXo6pmz54lMtvNT96heQvnlbpG+lOYN2K
	IDkYupDpRZA5IaCFQBw+nFwUUok27tMJ7ebZdlquKgP6F2SIuI78fUTD8Mt9wizepYo=
X-Gm-Gg: AYBFou2cjWTLqBIppH7BF2t7NNTf0UwEGwhEWGxFcQ1SBSrhUGohEiEd3tK+IwoD1oi
	mxOQEL0m6LkGuq7xBWeoPlEulwEYXZXgLmYlX+vpxGuLoVlfrRxLP3nCGyPdjRV5nkvbh/MiW7j
	8cruCYDeIjaS6WVMcxIycrjn1Br8gtXrVDfgOdcNWVOAO5BEkr1OExAHUHXe8vNJX7q2yRTM+bT
	ULUIw/TQpMJMFXx9y0zlIXbvONUOqzJHy2tl4fq+uJlRZc1Rnac4QNQJs3aHz2+fowOazj/37/q
	uG69LLjllsekn86e9pSBVKn0VG7sXOQD8y+kwMfJW8OjiWDi6sE6PBDUxC+hlKcwbPZALcP+oDL
	m9JQRohkqmImfNamrsosTvno8/xHw8t/tPNtxFihfA3bGtNfoT7rROp3JkDiJf7oEL8G9GDLbBo
	E4eA+1zZ0Jx3o6w5pDwHgCuTC7rtFSS6QojNeveCTqrVuvn42c6ScRfPxZtoGTZ1VLi++iUX/k/
	fxiBDHpB7xCaYxWHxQMgOip+NXDRlMRDw7utzkBF8fVCdvXVQP857Bavmw8E5rtTlHomsRjLBq0
	t62CeyCcer+ebyGtfxcu//18yNwrQNTDcXsALWjhwoRTky/+INWXGNMhf5vhug4quDNJh9GjQba
	X1e/MfccLm6KJmUbg/kf6AfQnUBMnc/w=
X-Received: by 2002:a05:6000:4008:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-499c6e979camr3766412f8f.31.1794396638819;
        Wed, 11 Nov 2026 03:30:38 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498357648f0sm10959991f8f.12.2026.11.11.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:30:38 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	xiubo.li@clyso.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH] ceph: fix d_lock leak in debugfs mdsc_show()
Date: Wed, 11 Nov 2026 12:30:29 +0100
Message-ID: <20261111113029.959595-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
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

mdsc_show() walks the request tree under `mdsc->mutex` and prints the
request's dentries like this:

  spin_lock(&req->r_old_dentry->d_lock);
  seq_printf(...);
  spin_unlock(&req->r_old_dentry->d_lock);

(same for `r_dentry`).  The pointer is loaded again for the
unlock, but ceph_fill_trace() can change it in the meantime:
ceph_fill_trace() runs with req->r_fill_mutex held, but not
mdsc->mutex, and:

- after d_move() for a rename, it swaps `r_dentry` and `r_old_dentry`
- splice_dentry() replaces `r_dentry` with the spliced alias and drops
  the request's reference to the old dentry
- a lookup without a locked parent assigns a new `r_dentry`

If an unsafe rename reply is being processed while mdsc_show() is
between spin_lock() and spin_unlock(), mdsc_show() unlocks the other
dentry, and the `d_lock` of the one it locked is never released.  The
next attempt to lock it spins forever.  I have seen this on a
production server, where our monitoring reads the debugfs "mdsc" file
periodically:

 watchdog: BUG: soft lockup - CPU#67 stuck for 48s! [kworker/67:2:3746175]
 Workqueue: ceph-msgr ceph_con_workfn
 RIP: 0010:queued_spin_lock_slowpath+0x4a/0x240
 Call Trace:
  <TASK>
  ceph_fill_trace+0x7a4/0x910
  mds_dispatch+0x9f4/0x1ac0
  ceph_con_process_message+0x66/0x80
  ceph_con_v1_try_read+0x392/0x17e0
  ceph_con_workfn+0x329/0x590
  process_one_work+0x146/0x2b0
  worker_thread+0x182/0x2f0
  kthread+0xe4/0x1d0

 watchdog: BUG: soft lockup - CPU#55 stuck for 49s! [cm4all-kernel-e:16346]
 RIP: 0010:queued_spin_lock_slowpath+0x1a2/0x240
 Call Trace:
  <TASK>
  lockref_get+0x47/0x60
  ceph_mdsc_build_path.part.0+0x85/0x2a0
  mdsc_show+0x239/0x3e0
  seq_read_iter+0x11f/0x480
  seq_read+0xfd/0x130
  full_proxy_read+0x50/0x80
  vfs_read+0xa4/0x340

Both CPUs were waiting for the `d_lock` of the same dentry, which
nobody is locked but nobody will unlock it.  The first CPU was in
update_dentry_lease(), called after the rename swap.  The second one
was the next read of the debugfs file.  Since the ceph-msgr worker was
blocked, all requests to that MDS hung.

Replacing `r_dentry` with a spliced alias also means mdsc_show() can
call dget() on a dentry whose last reference has just been dropped.

Fix this by holding `r_fill_mutex` while mdsc_show() uses `r_dentry`
and `r_old_dentry`.  Taking r_fill_mutex with mdsc->mutex held is the
established lock order; __do_request(), handle_forward(),
ceph_mdsc_wait_request() and ceph_lock_wait_for_completion() do the
same.

Fixes: 76aa844d5b2f ("ceph: debugfs")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ceph/debugfs.c b/fs/ceph/debugfs.c
index 6a9a5551d9d7..83506d9207fa 100644
--- a/fs/ceph/debugfs.c
+++ b/fs/ceph/debugfs.c
@@ -109,6 +109,14 @@ static int mdsc_show(struct seq_file *s, void *p)
 		else
 			seq_puts(s, "\t");
 
+		/*
+		 * ceph_fill_trace() may replace r_dentry (dropping the
+		 * request's reference to the old one) or swap r_dentry
+		 * and r_old_dentry; it does so while holding
+		 * r_fill_mutex, so hold it while using them.
+		 */
+		mutex_lock(&req->r_fill_mutex);
+
 		if (req->r_inode) {
 			seq_printf(s, " #%llx", ceph_ino(req->r_inode));
 		} else if (req->r_dentry) {
@@ -151,6 +159,8 @@ static int mdsc_show(struct seq_file *s, void *p)
 				seq_printf(s, " %s", req->r_path2);
 		}
 
+		mutex_unlock(&req->r_fill_mutex);
+
 		seq_puts(s, "\n");
 	}
 	mutex_unlock(&mdsc->mutex);
-- 
2.53.0

