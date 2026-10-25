Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792953773;
	b=iSStj2Bu0FXoW63ySxn3wI/LTk6Uk5QzuSBXVRufzdZeW9cFw+410E9NcaVZjmFQOC9l
	 Lnfl0r6OSvAFjYFMBsWIhQHWv+kjHcAo9xU8qno0fuFANukhao6wopyH88HOCICKMl47P
	 HSCPUJNsaanSN2Q2qPW1dJm3+/SEIhPu9LGTt1hFDDHUE4DjIgdIKuLzTJ2KRQftggtdq
	 0zKXL56XjQGeBvyeKUdlxFs+5e5EAr3rqwclzJdbg3JZ+vUl1sJLL4N0uVC5DydZk1P4E
	 TQ3K9H+27qDTH+Ai8f7t1laJf0OuV+HwTF7jO9wzNauhc7MKgDTr9BRrQIfD+o0gEwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792953773;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N1DCLvfOjDC42wmhEz6PCJeC1Bo8We6n6LwkJZv/JOA=;
	b=IZZnUwd7qua9S8WNz9pMu7tf0n1SZPUtYIOy5M0l1W5Vl6evqf8lnk7ePFiKEh4TcQIQ
	 ViWcpXAGSuWkHtSX65X6bsNMhoa3LYx0J54rDwgEAgxIt9wAnYJ0AV52qod1umwIJlFzV
	 KJ1PkOBhq4KFJSYr3xEyasrKTJmqCccM2wsCFRW38Rii0lJ5H3lA+RRhEKVNKymOT41Iu
	 Ljoq2JJ7Wu++tTIlPMvLij/d2cgqem6Ezy/0xTabBsoRBquMskEmnQpyPXISKWFciA24I
	 I5kQZhaynzAF+HWTaK99Dt+yLbXilk+UmKd5gWNwW8JJO+5I0CJrW7DqViuOyzpQNew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gw2Zf1wC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VZw9ic3X;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FFE606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gw2Zf1wC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VZw9ic3X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792953771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N1DCLvfOjDC42wmhEz6PCJeC1Bo8We6n6LwkJZv/JOA=;
	b=Gw2Zf1wCHWvvt3YMia2Jm0NThtpgphKKYovnZ7Kg5icHbB6O4dvGjhJuSVJHVLxh3zxS4g
	zqiHhLYzOdrBMbYar7O6lbz870L9e6eF33HDc68nzIZXOvTPXlvH3b5edQuSObl8eZ9Shi
	IPBnKqDgDp1gDSA7BVb/KIbMpfHpPDc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-7FWZV9LQMKyw9ASEpAo8vQ-1; Sun, 25 Oct 2026 14:42:49 -0400
X-MC-Unique: 7FWZV9LQMKyw9ASEpAo8vQ-1
X-Mimecast-MFC-AGG-ID: 7FWZV9LQMKyw9ASEpAo8vQ_1792953769
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c41e4057335so254859166b.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792953769; x=1793558569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1DCLvfOjDC42wmhEz6PCJeC1Bo8We6n6LwkJZv/JOA=;
        b=VZw9ic3X3a7UhX7gS/PKYUJhJw/npTrWYwFh4PSVJR7FzwU17ojJ06OL19l6qe8gFO
         nnctHZTJEEcbPzvqTqhj42B8XmW4WCW8zbrZApyczMa1W6EWM8V9LqRai/luJEY4hh6c
         ecEMM6sSkwz7qIJ2c+ndDO1NIIWxo6Mii0YReNz0cU6RqG/HiMO7Fe+cv0ulcAaLGljy
         0KJwKOgRliIoyk6pfaponjJKgsoWxd0jaBByiGrqbKKqViFuuHXCygjTGYGcKakzYn0Q
         Wcoj8GtVkT9VQD8xdcQCkfxFWRZTANEPmTYnRorN3g1INy8GyKOmLQZtT7EaZyxLxlL9
         vCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792953769; x=1793558569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1DCLvfOjDC42wmhEz6PCJeC1Bo8We6n6LwkJZv/JOA=;
        b=zXTN1KOIaCvXf5arxAYoCIIszMxdoRnx+BRw06KaMY5EDbFSn04RQ1b0xBxG3dEFAN
         aiAThWlYa9YPZqw232xUjMwtsZ/eY61qYXrjKeE4WZKQswcUHLA3XalJbHZE5rBU2adK
         ZlEjMVq72HkipeIC0Kqt7UnN3UbJvdsNEHqP2+48ge24eUkcIQ1HNLtbrWw8lz5d5ElS
         eaC34N8f+u3nb0S+Tjjmw1Uw6XF2bpiWnbeA5RWaQke8aa5TkwJ+c6eKct7ZOOG8uNu+
         V/Wc3MGlCZMqCevi+5agO7Dll5jTeZOWMV3s9cfg/bvrnBes1dwvzJEwBKhjNxMffu4W
         65Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzklwPhqQ9+hi06Ilvw5SRoeHGsJtbNWjs0RR3E9tPqTh3GnqMfdbUiVMIPJWoyjayUhmt6iGWISTSvlWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAh7KH/jfDXnE9ugUaQStd9T3PgI4AzWCqDT67SMlIYy/aUNKP
	M8wRjNg4/QEIa8nPliARMLb1EwSOYROXVM5AojPLNhsO62fEsN2ZTH/TS9zyC5ufePz2mqg5W5N
	2S8a49l5wEeWySgXnbThZ/EwBuQP6a7G7VhE7N5budeSwdPzCsbyG0/GarSxTYCtOig==
X-Gm-Gg: AYBFou1VZQ2ic84EGk+Y+8rCv1JZk01ekzl+L1Gff5ulx+2U+d0b+uzvQzArh3W2C71
	XyMMXTb6Tff1QulPRUw+wmkumvBRjIX8R6p+IUnm1m0gSP5CsuUTYhkv7WNaSi/BygpytUvJRWg
	fSKmf+o9saqm1f8U0QOklI50bbRbUsxGLEBIc8ixflo2dkIVkdid7vmSsK/Hjne04Ly/Dyp7DGr
	52KnVe9JekMUsRKQI5iFbKGDS58OUbHofEDALE2VSSPxQ5EaU8wVFLvZQ/S26ouZeC77jMV70l+
	l9s8gJuIa//FyE100x+Rv0TH8JsmSo+WSQtop3N+34Q6AU8CkMh7BbYyW9sAzfvC8Ilj3a/Q2Ew
	XMa9eeGMFr53o5YNkmf1lL+ej8Bjsx5xUMND4JNvvxtr1LqBOLtGCYhNnXqru1mO/JIMRiJGhoG
	crKSh6/iZj3QPdxc63G8rfXL54SzTW84D8mOkfHMgc+GOA3o65US5QnRQsFYzzG/wr8VFHj8LtP
	+Y=
X-Received: by 2002:a17:907:2d92:b0:c40:f9ea:7375 with SMTP id a640c23a62f3a-c46bddaed7cmr640681166b.15.1792953768798;
        Sun, 25 Oct 2026 11:42:48 -0700 (PDT)
X-Received: by 2002:a17:907:2d92:b0:c40:f9ea:7375 with SMTP id a640c23a62f3a-c46bddaed7cmr640678766b.15.1792953768403;
        Sun, 25 Oct 2026 11:42:48 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm230750866b.64.2026.10.25.11.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:42:47 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: idryomov@gmail.com,
	xiubo.li@clyso.com,
	slava@dubeyko.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org,
	ebiggers@kernel.org,
	tytso@mit.edu,
	jaegeuk@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] ceph: support subvolume quarantine
Date: Sun, 25 Oct 2026 18:42:40 +0000
Message-Id: <cover.20261025T182649Z.ca9ae7a18449.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
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

CephFS subvolume quarantine restricts ordinary access while allowing
recovery clients with q/Q MDS auth caps to operate. Add client support
for quarantine notifications and enforce them on cached access paths.

Based on the testing branch of https://github.com/ceph/ceph-client.git,
commit ed0502cb11f8 ("ceph: validate encoded xattr name lengths").
The full base is recorded below. The dcache and fscrypt prerequisites
are included in this five-patch series.

Changes since v5:
- Describe the dcache export as a prerequisite and remove Reported-by
  and Closes tags for it.
- Reject foreign, disconnected and unhashed non-root aliases in ancestry
  walks while accepting the live, unhashed superblock root.
- Reset quarantine state only when the lost or reconnecting session is
  the reporting MDS rank, including when its cap is already absent.
- Check saved authorization's generation even when no inode is marked.
- Check snapshot path access and acquire normal wanted caps after
  quarantine authorization.
- Clear detached xattr-buffer ownership after releasing its reference.
- Use synchronous CREATE for new inodes with an LSM security blob,
  before async preparation, including before feature negotiation.
- Keep an existing quarantine mark across a zero-error IMPORT while
  processing imported caps and negative quarantine errors normally.
- Use the incoming wire cap mask for clear decisions, so PIN-only updates
  cannot acquire clear authority from capability bits retained in a merge.
- Update encrypted-symlink and capability comments to match their
  interfaces.

Validation: GCC x86_64 builds with fscrypt, ACLs and security enabled
passed W=1 vmlinux/modules for the final tree and the recording patch.
Twenty-six extracted-code quarantine state tests passed, using mocked
kernel context. Live cluster, boot, KASAN/lockdep, LSM policy,
failover, performance and LKMM validation have not been run.

Previous submission:
https://lore.kernel.org/r/cover.1792527529.git.amarkuze@redhat.com/

Alex Markuze (5):
  dcache: export d_find_alias_rcu() for modular filesystems
  fscrypt: allow filesystems to disable symlink target caching
  ceph: add subvolume quarantine wire definitions
  ceph: record subvolume quarantine from MDS cap updates
  ceph: fail quarantined subvolume access with EACCES

 fs/ceph/acl.c                |  33 +-
 fs/ceph/addr.c               |  72 ++-
 fs/ceph/caps.c               | 323 +++++++++++-
 fs/ceph/crypto.c             |   1 +
 fs/ceph/debugfs.c            |   1 +
 fs/ceph/dir.c                |  54 +-
 fs/ceph/file.c               |  82 ++-
 fs/ceph/inode.c              | 956 ++++++++++++++++++++++++++++++++++-
 fs/ceph/ioctl.c              |  13 +
 fs/ceph/mds_client.c         |  26 +-
 fs/ceph/mds_client.h         |  30 +-
 fs/ceph/super.c              |   4 +
 fs/ceph/super.h              | 101 +++-
 fs/ceph/xattr.c              |  60 ++-
 fs/crypto/hooks.c            |  28 +-
 fs/dcache.c                  |   1 +
 include/linux/ceph/ceph_fs.h |  13 +
 include/linux/fscrypt.h      |   7 +
 net/ceph/ceph_common.c       |   2 +
 19 files changed, 1706 insertions(+), 101 deletions(-)


base-commit: ed0502cb11f84fff29f374238e526ae94d9bdfde

