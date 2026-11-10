Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297648;
	b=agG+BB063GiebyRBbP1zQNA5jiM8xCCpbQ7V4fKgzTaN7pJColjewu6Mq9BUcSuDdx9x
	 o60YMBVxO3dk0Nz9vdRIYZkaVD5IiOpoAr5viigRAOVy+hI3hU+0hhwd8gOEFHw9NCvUa
	 gMsScGP4EDlfzS5ZXuU/jJuK67vjuvN/co8Go+mlrkh+OS0HRqE1h9Fwjb368ysHKM+/L
	 hu8FzHDy+YHaum8IUu/0ITVyZS6UFPmVcYdevGHJLPr4pO/lbJg139oRERPUCey4NLcUG
	 bVg11gtV+MFRyBcMBgCoPf3a6s77V8dY5S+JT9v79kEPG0ehWTDv/OYVITYn6pFAF3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=80sWobsat/u+kRGlRXvi1m7JgYp74udJYP3vLOxAEw8=;
	b=Afn15qeY7egJUvLyLv/8hatVPe5YcysEucHiaRLbWCrEy/lhbbQ2N+vVWYJal3gWY4p+
	 HkSPe+hEFBm5dfNsuTJPJqRE/TRNcQaI6aXTIVEhJ1ARnCnd6wmMAulPzfu7HxrMnlBgI
	 j0VFAt25e1jHO32m6D46/wfIqtXUhu2F1RoR4cpYgQwNLLUtqRHBExR69re1bEgv3kvVf
	 sN9pn7pqLBms87Axk2ISNxWaRk5pLaFPwN3CyMqfru5+UrLtyoitetObsCxH8Odd7K3/j
	 9nMzktJW22goCLbos4vGij9cV6DQjZuqI/x28RDH6wCWJdcV6gwlSyrJv26WxEB6+gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHjdBMpW;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE161606A723
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE161606A723
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHjdBMpW
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso2451536c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297646; x=1794902446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=80sWobsat/u+kRGlRXvi1m7JgYp74udJYP3vLOxAEw8=;
        b=xHjdBMpWhSG+Kdu2FDryC2I3YpxM/MYVW27W7uevJDEpit0PBWkyd78AqN9ELhiA4T
         xcvrK35BDSKEBLZP9SpyFOKa8qLI31SP0XRNw/p4XDH9d0+lp2H0Z4KDr7j7ONvA9QR4
         qAzk2bXs04TLpRHq7v/SpWaeg+/AN4KKxNmUbPA+lU01zh+VxlpbTtTbxnNLPLU5LzxP
         KAtUgL8YnkxElSsqwKaBfvKKbgDqEvolc8vIzJYojvPXgEvXamTJwMTQUKLotmK8hgjI
         RKQ8ieVXqaGQlkSYf2jxHR9ldOa5fp2RfKbL+tBgeSfY7NIMDD/ARgytCCgZsFlZ+/5K
         GFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297646; x=1794902446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80sWobsat/u+kRGlRXvi1m7JgYp74udJYP3vLOxAEw8=;
        b=ZYGqTlPXGxFF6LYCjAVGNGVzoiBD12TReHrEFBo9EEwjzI5SyfKWUZRSgkanw5R4gL
         0aLheKP75MHBD3MxVQqpuOTKUuH0byo/XLwA8OB8+P791V62DsmI6Nc1WqSNILQJvUk9
         RpQ3+uhBGOUE//E3miusrng8tJljWYP0CPjzktb4oDDWuuqhBpAKZ54kRgHLhy27aYW6
         Ry4X/6JZvjNpNuv4L4Oz9o854r0BGboJ8CppAMqvf6cHdUrCCgshA2avCpknLhRXMmN3
         Dj1k24oWFw7rDI3AnOe9wEMXGWiYL+lSwbBEqQTekrL+C69J7R+3DBOL50cZmOB384q3
         PrQQ==
X-Forwarded-Encrypted: i=1; AL+hErFxl1waSgDGyX1ssSfEPMhfqjIw3eQ5EP3OuNWWWK0chcFCxdF0IVs41iEB7HWPamCka+W3oPcC+JgKNDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e48OV2IoaNkFdI22LQDmuI0TqP5NBKEYmyez2KUZZTZPZcFgq
	IlELR+Y0rf1kSVGi1MVRB0ouHaN1wKamzi/YhmAz3W9k3OXZ6DQAUC/L
X-Gm-Gg: AYBFou1KauBWDEDQ4EBz/ehTQeFmkGGV2QbrhlJJSqIwq9Unwau++Ke11qzfCdDyGrJ
	OrEGGL5HuZBL5sNbgqcL/ID3ilg5P0nyho5OuZQPcGwkvMhwC5AAJnzRQwHKftA+Oihes7hnFCH
	jLyDa4z98DGcj2SqCProODKrIonuNu+I2hfhhidikyDEh2a/aXIPXjQj9NISNCkBYQXtUPQDTZO
	vwXY4jktN8xbDvImXWvWgC3Bqff6j8q+A23Xc66oIaDvuTt1glDiMxHiU6nDCGdghjydaU/G+8D
	S2BkHfHSeOb5TMT2zxUWy31p26toz4PjFWKaqc3lsWmIVq2oSNobg3s4hzFV3N1FxZ+/h0CYdly
	QWEPVCsLQZczDjlMRBL1AKA4saX9ZA5D/H3aLD1V7uPbmi9z+MymlseAj7BPWdI0tsXVRQwZ9iD
	aHig70onmxYlzKvkKE8TxvC1Uguguk7yNiDKZM963khoZuEIAG2UQzlU8uoGkMGkZmztneEm9Nd
	r+Ia9K47vHFyiZ9lXsw9l8uRCTG3KxZ9T9WOFsxz2Q1npvFmOQBowE10Yn/zyacU+VBq1bByZdA
	xfGNq2PmfN3pFl4smxFugAFVCQyEOZe7RnqFJBqvopGnBps1GMVbwxbBTJZwMZHEI5G4
X-Received: by 2002:a05:7022:b0c4:b0:144:f089:b189 with SMTP id a92af1059eb24-1b3b618588fmr2363514c88.36.1794297645661;
        Tue, 10 Nov 2026 00:00:45 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm6139313c88.7.2026.11.10.00.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:00:44 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: cel@kernel.org,
	jlayton@kernel.org
Cc: neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] nfsd: don't block on a file lease while holding the parent lock
Date: Tue, 10 Nov 2026 16:00:38 +0800
Message-ID: <20261110080038.232210-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Since commit 2a60db3525d4 ("nfsd: (almost) always open file in
nfsd4_create_file()"), an NFSv4 OPEN with create that finds an
existing file opens it with dentry_open() while start_creating()
still holds the parent directory lock. The open flags lack
O_NONBLOCK, so break_lease() in do_dentry_open() blocks. Before that
commit the file was opened later by __nfsd_open(), which breaks
leases with O_NONBLOCK, and the client retried on NFS4ERR_DELAY.

A lease on the file now stalls an nfsd thread for up to
lease-break-time with the directory locked, and other creates,
unlinks and renames in that directory wait for it.

To reproduce, set fs.lease-break-time=15, take F_SETLEASE F_WRLCK on
/srv/g from a local process and keep it, and run "echo x >> /mnt/g"
on an NFSv4.2 mount of /srv from localhost. The nfsd thread blocks
in break_lease() for 15s, and "touch /srv/other" on the server takes
13s.

Pass O_NONBLOCK so that break_lease() returns -EWOULDBLOCK and the
client gets NFS4ERR_DELAY again.

Fixes: 2a60db3525d4 ("nfsd: (almost) always open file in nfsd4_create_file()")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
With this patch the same test hits break_lease_noblock and the touch
takes 20-30ms (QEMU guest, f66469d9905b).

NeilBrown's "nfsd: switch NFS4 OPEN to use vfs_lookup_open()" (v2
12/14) makes the same change; that series is not merged.

 fs/nfsd/nfs4proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
index 3a82af381a8d..e95258b44c72 100644
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -312,7 +312,7 @@ nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
 		.na_iattr	= iap,
 		.na_seclabel	= &open->op_label,
 	};
-	int oflags = O_CREAT | O_LARGEFILE;
+	int oflags = O_CREAT | O_LARGEFILE | O_NONBLOCK;
 	struct dentry *child = ERR_PTR(-EINVAL);
 	struct path parent = {
 		.mnt = fhp->fh_export->ex_path.mnt,
-- 
2.43.0

