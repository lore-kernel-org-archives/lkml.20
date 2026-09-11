Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CD83955C0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133498; cv=none; b=V2GBbNb2H38Z6uGUtMCl1uJ2Kw+xhL2aL2wPj0fnkPStyVkXBROA1cSHWFjMPcpBMXQuCz7OldEkyHDXW/r5/5sPJIhU70XJpDk3JZHgLcaLGz0MftseXvXoMzW1olDnn/My1A390sub+OFeh8HxmoGb+8OOdbrLXrj0Mo1AcfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133498; c=relaxed/simple;
	bh=2X+A03Pv0LYSgb5yLMQ9XQBAPaOxElKWw3TJL0ADSzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kRvIoOL9bt3jvhNisLxpAYrkz+t7sBg6j0spklbCKsKBSEkNql4MKFHFk6LMPdbrrT68C+cx09iZZHY4ttXNfVx53x8xpfPDgXS+Ds7rT9gQVru5ETD5yi1cGTENscFmTt0FJq0ivQt3aXHv1gD5mcnsjigZj/gXVlbfiNM4Os4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4FsQxDH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4FsQxDH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6e954afbdso6253285ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789133497; x=1789738297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bs0qoIDTEbciN12ky9jw1GqCxhD7HHbqHEWQ/QwGLt8=;
        b=r4FsQxDHLQi0jG7HSfxpYpzR8+1JK/h6hS2h3SKxSCTdfkzY5h/aQmwTnMGmeCGBZl
         zJyK6hBSaQES+DSyhDx+1/TcQclsVW2LET0oVKuefsDGF3//aRqKadCxKC9B/Rgddn9x
         EQTpjBKi2G4NV3RZQO7JC4rWf58eTWjiGq8uWaeK+EH+r93yFm8lcuiAMaCMTSxZjnQR
         VQGUAQ0PfPHaDmsuDpqfm1iTSgcgU77YUsoe5VLPqTlb6MzXREhADsqBAeAW+zV+oIQJ
         v6IxQ7XBdMns9M3XIc5DwgTeOocLO4ahsVV9uAuyEx0GfPcmjwRWFH6EEdPjTiEJ2iu/
         KYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133497; x=1789738297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bs0qoIDTEbciN12ky9jw1GqCxhD7HHbqHEWQ/QwGLt8=;
        b=j9PaP4E4Hl+EiLhmLu7oFdPwvi7G2ABkTU4DEtGQL7Y2FqfnGnFIpOUW758DH3s3aZ
         xzRKaRBbArxesR0Lm5EdAf26w9raC1xFXMXy8VQ6o1p8Z9WHXRHXxqJ5zeTKIF5+qhTB
         8bAHDFvTQIBeE5CBWlaGpuXt1d2RNaEmCM9aRb1taB65l6kqCYtLxGGpt/JcCC+RHhYY
         sAC2RxdEhuOMLfpp+2hQbRTkXGYYZqD8gHbdk2ffu/JV/1FGoVvk61l7XoC10FfwNZOC
         Mwmkf+k/PZlc+cZVYd+fzGshyMbTRwnAVjmLT9xnEysXNQcTLsxrlmJ6WKCSGJGhKymq
         M17w==
X-Forwarded-Encrypted: i=1; AKwUvBy/yTErds1L/ouSY/fRHMl/mS890PAHSKs/AIY8LsTuBj4wpgu1rr1Z4fSVOqRN6Qu8xz+b1Zen7Xpc7xg=@vger.kernel.org
X-Gm-Message-State: AFuF++kq1CD7RxaUR/TJHQO+GLKj1sVQERbvHlQ5lw0vSxkxC1JiX0NH
	Z9pgH29USHkAbykK2Qn40Pyf2PmzDOT8Vx4BmgGAinskifptlF7jg1jB
X-Gm-Gg: AYBFou2lXChjU4UIrcD3VrKuTEuRbGkmo5Y19cNZ+fnsVEamIiubWXlC866+vpCcVEF
	65pfLu2HcOJh4oAeFPQKm8Va/BVS3T6eCYLWkZ7lgWvH3b6W8TbMhp8ljJNfOWC4w1BamhbNcUL
	NgcnSiKxEKq1if/kbyiOePQuHlbBNrMAA+Yuwalv7LxdtY+IAsqkKcyaMQoIVTM6ZzamTv6nAcz
	TV8ybA/Rrx/iGX4tkYR2Mm/5XfF9hBgSWySV0Cu9pcbwH1Ow8gA81bGcBlm7kthD0kvx7OGhpUe
	VHMYDSQ4yCXkjObIavKf6a4Pz27UmQBZn4IvMbEBlOOxh5ZzSJT+1brD3sSoQmePz+K5vIEJI0J
	Xq9RL/k240DGOFE9hjGA+fquguv4noRtB5WpSV0ACMvnANFEc6fWjXPcUJmAt0h5CmpbyXM3EeL
	5/aO/W4DlCSWZlLOJajzFbRJga9evh+hMizS/ISSCa3BWGpMDkDX3we2OlxE3Yi8V+ScVuz8CPk
	qHB9BVmDG8huCUHjQTXBagkyTmspiPIGBY=
X-Received: by 2002:a17:903:1ac6:b0:2db:331b:e187 with SMTP id d9443c01a7336-2dd2a1e0a15mr87471305ad.8.1789133496571;
        Fri, 11 Sep 2026 06:31:36 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc5c7bsm11349015ad.51.2026.09.11.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:31:36 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>
Cc: Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>
Subject: [PATCH 0/2] ceph: don't let a bad mon_addr= reach the empty-monmap BUG_ON()
Date: Fri, 11 Sep 2026 19:01:08 +0530
Message-ID: <20260911133110.2218-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot can panic the kernel from fsconfig(2) by mounting cephfs with a
mon_addr= that does not parse:

  kernel BUG at net/ceph/mon_client.c:211!
  RIP: 0010:pick_new_mon net/ceph/mon_client.c:211 [inline]
  RIP: 0010:__open_session+0x60f/0x740 net/ceph/mon_client.c:245
   ceph_monc_open_session+0x46/0x60 net/ceph/mon_client.c:534
   __ceph_open_session+0x135/0x590 net/ceph/ceph_common.c:798
   ceph_real_mount fs/ceph/super.c:1173 [inline]
   ceph_get_tree+0xd98/0x1fd0 fs/ceph/super.c:1362
   vfs_cmd_create+0xd7/0x2a0 fs/fsopen.c:231
   __do_sys_fsconfig+0x55a/0xcb0 fs/fsopen.c:463

  https://syzkaller.appspot.com/bug?extid=1dbed5969931c19d3eb5

The sequence is fsopen("ceph"), fsconfig(FSCONFIG_SET_STRING, "mon_addr",
<something that does not resolve>) - which returns an error that the
caller simply ignores - and then FSCONFIG_CMD_CREATE. Two things have to
be true for that to end in a BUG():

 1/ ceph_parse_mon_addr() commits the string to fsopt->mon_addr before
    validating it, so the rejected value survives the failed fsconfig()
    and satisfies ceph_get_tree()'s "No monitor address" check.

 2/ ceph_parse_ips() never got as far as writing *count, so num_mon stays
    0, and build_initial_monmap() happily builds a monmap with no
    monitors in it. pick_new_mon() then trips its own invariant.

Patch 1 closes 2/ in libceph, which is what actually stops the BUG().
It is the same rule commit 40480eee361e ("libceph: Reject monmaps
advertising zero monitors") applied to monmaps arriving from the wire,
now applied to the one built locally from mount options. Patch 2 closes
1/ so the bad string is not kept in the first place and the failure is
reported where it happens.

Either patch on its own stops the reported crash; I think both are worth
having, but say the word and I will send just the first.

Compile-tested only: x86_64 defconfig + CONFIG_CEPH_LIB=m +
CONFIG_CEPH_FS=m, net/ceph/mon_client.o and fs/ceph/super.o both W=1
clean, checkpatch --strict clean on both patches. I have no ceph cluster
here and did not run the syzbot reproducer, so this is reasoning from the
code and the report, not an observed fix - please treat it accordingly.

Yogesh Gaur (2):
  libceph: reject an initial monmap with no monitors
  ceph: don't keep a mon_addr= that failed to parse

 fs/ceph/super.c       | 9 +++++++--
 net/ceph/mon_client.c | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.55.0.windows.5

