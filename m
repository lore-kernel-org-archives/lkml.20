Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758003;
	b=zrxCdsC03OQc4XgqUfmW7IXue9bbx3Q6Gft/R4zaKuHX68LGgiG3IyOARQ6OAuvt1VTo
	 pZ1+vNntrDaScnOxtHHn7Xl+gDbt1c78rfL1vsVPzAHh/UJ0rVsPz4nhFlLZhQRRtpZZG
	 dey+jWrhWZjnSe0t0Z/Y47iw5pD7c5vBTdcL7bIzBQ9shiVusMkIJAmXGS/htH5CV0KhK
	 PpVs3DRE2lm/Fe3LV+Gi1q7ghGIy1ICN4EU9ijMDwY2KEguNNoTsVujqhJX5oPnlYVkq4
	 RKCu0VNQffBlZJn+mqgslytNNcIzY+rBVghPq9hG6Rbnd1VdLTQGCSnE4+WQrsYDOJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ldHbDUMagHOYiQx23XtR0esOWK6zkJ8t5xfGmLjURSs=;
	b=PaAWO/NJqX732i1nOYrUvfL06aRaU6jtDEaxQn+vzV8ZLjSwZt+VQWzqW5wkDhRp2r6k
	 /1iFUFA8wGQzRYRgzl+8nlXgY/vUsVVEMSCD6eESgYjbCKfUxQqiAaFsDxehD/3k5Ef5l
	 Edbjyf2yBOqfrm1sdpxNkCRGFgksAba63MlOI4/JgYV/03sYALhbHafkwfe8RBBJglznX
	 8FuSwDN18wKrBEShmt8eUIlyMeYdeQUJRVrN7HdQcN7QenZANYU0x8uR9Q9dSWph/SEPj
	 wg3tOzaQAwcCZGqJuAu9maqHnUIEqSBsX3XiyVnGpT31Nng05oL30RzSq/nWYqY1ZEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mp74SfWj;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639F606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9639F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mp74SfWj
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1300021f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794758001; x=1795362801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldHbDUMagHOYiQx23XtR0esOWK6zkJ8t5xfGmLjURSs=;
        b=Mp74SfWj/6yPQ2OxoZXwZHGeuzcILs4xrxNqhRnu2nw1d4TY+veEw7YFMUtAE+9Ls1
         8R5xOZUl7mKfEW1FteLjBDYrsJ5JWqW9Yv4yr+IGHmiaas4bSdjqjXcLhkcHMcZFKR/q
         c5MnZxde5oxPEuXm6QNwHYbXsC7WA11FVEdyw2ajm5v0+EwuJcH5M6XyV0acIevN2TKl
         4aq77CqNhjQFKJsmQNx2L20eDYFqQPC6d2DeN5s3Wt3FS6RPfTLpBj66erGaoPjnsxqG
         dtfL4Fi0RSyu8WPUp2UXQdfS8hWXNNio5J+FXvT+/dTg/qelKm9c5HdfRJJOnGndsS+W
         K+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758001; x=1795362801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldHbDUMagHOYiQx23XtR0esOWK6zkJ8t5xfGmLjURSs=;
        b=iSlBYDALDYEzOyfVvYaMI/bY20INn6+xumlwVgJVmKY3KedGl6mPNxKgbCCWzdzbAu
         VMqvyFzsmbrAd7Q7KW9CRNdjPwZdgw2P8Ej8gI+o3eS1qXRrtzXOKH67fkJAMt3hQm5Q
         SWk7RxTFwhlCiUKy85wByTm/VAZNnbhSsJwYBMOY5pBlaguYXAK+QLQNRSdzde+YH+h3
         kyZ8MFslDmUNhINGR6PwWYybDEOAMibsgzjMWTuaogRfyUWcZRGL9cBj8QYfTW0prxAT
         EuUT0Aw3BvC2meojypVOR2TtAv6Q65OBIx9nzA3/ezQaqpIIBhOklMqCLukKprj3O+9w
         S80w==
X-Forwarded-Encrypted: i=1; AL+hErHTxW1U9UfhQDUOEqhrp9AfsoR6/Q5lR4b2J/exkiyzlLe0qrlZFY0Ckb7sXKjZ0hCBbWf9sGhiiGk9Tbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fSUz9QCoMQo4YaUNMUCNkZ+qyzn4uOmWjomxuJxh9ZTRNL8Zg
	63l6EIsXDRtZS7wsZPfKNygtLvXZwGI937nyBq/ek1AxuVwfCvbWkJoI
X-Gm-Gg: AYBFou1ZWA+9jHL9cxHDUTsYpx0ELxXgbceDFyWd37LpIfUR0EFxVZNLkqt0GubBDgq
	7LJ78RDM8p/B1eZ7a68F2J8uhXrMJWwVDhloeIxkeoNGEkkKpMSVSwndmtQ6YuqDCg/SUsTEInO
	Yv0gdiVCPUwac8Z53gk62iq4YIaibpuhPySgXAhGJ2H3ETzqt7oImc2+adQxWWDIl4Ibr3fSgIT
	3CPEsTXiZ5yk94o88++WL9dDEjeaxoU4bVx18i3JlnZA/bA3kCOuXe3OmXrBQHMkZzPb6/Ph31T
	yfLZILfWjBqLiiBpUNxpaSAGSw6gx+8l5y+X+ZRrf/MKP4XLK0htdyjugBrpMfKU2BsuffZnefM
	/5OBdyQlOJXKGdvCp7nGhNcSUnzcSqm7spRKvAjn+9N5ixUfXbDLI2Ms1XV6rf86+Qc1FF8dB3i
	Qx6Eo3/9r0P3Bt99KErWp4r9GfTbZjrZvjPo7saSN/mBA4AFhISun8uTKPi4kp7xASp97fl2h5L
	v8gS0ACliqyQwNn55DIWc7LxJPM12eVFaTmphO9JMwpdfbIHwDOlwYwxALcALCcXKpYgzhln87K
	+36bu4yLEVvbkgYuLhf9SJQ9
X-Received: by 2002:a05:6000:2386:b0:48e:5071:420 with SMTP id ffacd0b85a97d-49c6e4a38e3mr20590911f8f.2.1794758000608;
        Sun, 15 Nov 2026 07:53:20 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm17215084f8f.23.2026.11.15.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:53:19 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH v3 1/2] ksmbd: decode and honor DOS attribute validity flags
Date: Sun, 15 Nov 2026 16:53:07 +0100
Message-ID: <20261115155308.415734-1-koray.fra@gmail.com>
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

Currently, when setting file attributes via FSCTL_SET_SPARSE,
FSCTL_SET_COMPRESSION, or FileBasicInformation, ksmbd hardcodes
flags = 0x51 (XATTR_DOSINFO_ATTRIB | XATTR_DOSINFO_CREATE_TIME |
XATTR_DOSINFO_ITIME). This injects unrequested creation time and itime
into user.DOSATTRIB on disk, even though the client only requested an
attribute modification.

Furthermore, ndr_decode_dos_attr() discards validity flags on read by
reading them into NULL. Because of this, modifying an existing file via
FSCTL_SET_SPARSE or FSCTL_SET_COMPRESSION stripped flags down to 0x01
(XATTR_DOSINFO_ATTRIB) while leaving the creation timestamp on disk.
Conversely, on a file with only XATTR_DOSINFO_ATTRIB set (and with
create_time == 0 on disk), ksmbd treats the 0 as a valid timestamp and
reports NTTIME(0) instead of falling back to the underlying filesystem's
btime.

Fix this by:
1. decoding da->flags in ndr_decode_dos_attr(), which will get carried
   over when writing the xattr back;
2. updating create_time only if XATTR_DOSINFO_CREATE_TIME is set or if
   da.create_time > 0 (to retain stored timestamps on files written by
   older ksmbd versions), falling back to filesystem btime when zero (in
   smb2_update_xattrs() and ksmbd_vfs_fill_dentry_attrs());
3. setting only XATTR_DOSINFO_ATTRIB and the requested attributes
   instead of injecting timestamps by setting da.flags = 0 on new xattrs
   (in fsctl_set_sparse(), __ksmbd_vfs_set_compression() and
   set_file_basic_info());
4. self-healing damaged xattrs by setting XATTR_DOSINFO_CREATE_TIME when
   rewriting an existing xattr that has da.create_time > 0 (in
   fsctl_set_sparse(), __ksmbd_vfs_set_compression() and
   set_file_basic_info()).

Finally, keep reading DOS attributes unconditionally to match the
behaviour in Samba.

Reproducer, with /tmp as the local filesystem folder exported as [test]
in ksmbd.conf and /mnt as the smb folder mounted with mount -t cifs:

  mount -t cifs //127.0.0.1/test /mnt -o username=user,password=pass

test with sparse (for compression, use chattr +c instead of fallocate):

  echo data > /tmp/sparse.txt
  chmod 777 /tmp/sparse.txt

  stat -c 'Local btime (%n): %w' /tmp/sparse.txt
  getfattr -n user.DOSATTRIB -e hex /tmp/sparse.txt

  # punching hole via CIFS triggers FSCTL_SET_SPARSE
  fallocate -p -o 0 -l 4 /mnt/sparse.txt
  getfattr -n user.DOSATTRIB -e hex /tmp/sparse.txt

  stat -c 'CIFS btime (%n):  %w' /mnt/sparse.txt
  smbclient //127.0.0.1/test -U user%pass -c 'allinfo sparse.txt'

  # evict cache so btime is read fresh again
  umount /mnt
  mount -t cifs //127.0.0.1/test /mnt -o username=user,password=pass
  stat -c 'CIFS btime (%n):  %w' /mnt/sparse.txt

which prints:

  Local btime (/tmp/sparse.txt): 2026-11-13 21:13:27.167926440 +0000
  /tmp/sparse.txt: user.DOSATTRIB: No such attribute

  # file: tmp/sparse.txt
  user.DOSATTRIB=0x000004000400000051000000200200000000000000000000209542d3b373dd01
     0x51 = 0x1 | 0x10 | 0x40 -----^^         |      unrequested --^^^^^^^^^^^^^^^^
   (ATTRIB | CREATE_TIME | ITIME)             |   creation time = btime
                                     SPARSE --^
  CIFS btime (/mnt/sparse.txt):  2026-11-13 21:13:27.167926400 +0000
  [...]
  create_time:    Fri Nov 13 21:13:27 2026 UTC
  [...]
  CIFS btime (/mnt/sparse.txt):  2026-11-13 21:13:27.167926400 +0000

test with setmode:

  echo data > /tmp/attrib.txt
  chmod 777 /tmp/attrib.txt

  stat -c 'Local btime (%n): %w' /tmp/attrib.txt
  getfattr -n user.DOSATTRIB -e hex /tmp/attrib.txt

  # modify attribute via CIFS
  smbclient //127.0.0.1/test -U user%pass -c 'setmode attrib.txt +r'
  getfattr -n user.DOSATTRIB -e hex /tmp/attrib.txt

  stat -c 'CIFS btime (%n):  %w' /mnt/attrib.txt
  smbclient //127.0.0.1/test -U user%pass -c 'allinfo attrib.txt'

  # evict cache so btime is read fresh again
  umount /mnt
  mount -t cifs //127.0.0.1/test /mnt -o username=user,password=pass
  stat -c 'CIFS btime (%n):  %w' /mnt/attrib.txt

which prints:

  Local btime (/tmp/attrib.txt): 2026-11-13 21:13:27.195647069 +0000
  /tmp/attrib.txt: user.DOSATTRIB: No such attribute

  # file: tmp/attrib.txt
  user.DOSATTRIB=0x000004000400000051000000210000000000000000000000f6cf46d3b373dd01
     0x51 = 0x1 | 0x10 | 0x40 -----^^       |        unrequested --^^^^^^^^^^^^^^^^
   (ATTRIB | CREATE_TIME | ITIME)           |     creation time = btime
                                 READONLY --^
  CIFS btime (/mnt/attrib.txt):  2026-11-13 21:13:27.195647000 +0000
  [...]
  create_time:    Fri Nov 13 21:13:27 2026 UTC
  [...]
  CIFS btime (/mnt/attrib.txt):  2026-11-13 21:13:27.195647000 +0000

After this patch, the outputs should be:

sparse:

  Local btime (/tmp/sparse.txt): 2026-11-13 21:20:25.856425751 +0000
  /tmp/sparse.txt: user.DOSATTRIB: No such attribute
  # file: tmp/sparse.txt
  user.DOSATTRIB=0x0000040004000000010000002002000000000000000000000000000000000000
          0x01 = 0x1 (ATTRIB) -----^^         | no creation time --^^^^^^^^^^^^^^^^
                                     SPARSE --^
  CIFS btime (/mnt/sparse.txt):  2026-11-13 21:20:25.856425700 +0000
  create_time:    Fri Nov 13 21:20:26 2026 UTC
  CIFS btime (/mnt/sparse.txt):  2026-11-13 21:20:25.856425700 +0000

setmode:

  Local btime (/tmp/attrib.txt): 2026-11-13 21:20:25.976415893 +0000
  /tmp/attrib.txt: user.DOSATTRIB: No such attribute
  # file: tmp/attrib.txt
  user.DOSATTRIB=0x0000040004000000010000002100000000000000000000000000000000000000
          0x01 = 0x1 (ATTRIB) -----^^       |   no creation time --^^^^^^^^^^^^^^^^
                                 READONLY --^
  CIFS btime (/mnt/attrib.txt):  2026-11-13 21:20:25.976415800 +0000
  create_time:    Fri Nov 13 21:20:26 2026 UTC
  CIFS btime (/mnt/attrib.txt):  2026-11-13 21:20:25.976415800 +0000

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3") # ndr decode/basic info
Fixes: f44158485826 ("cifsd: add file operations") # ksmbd_vfs_fill_dentry_attrs
Fixes: 159e727f763d ("ksmbd: persist FSCTL_SET_SPARSE state") # sparse
Fixes: 0fb327626ad9 ("ksmbd: support file compression attributes") # compression
Cc: stable@vger.kernel.org
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.3
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
v3 changes (based on v2 feedback):
- keep DOS attribute reading unconditional to match Samba's behavior;
- add backwards-compatibility fallback (da.create_time > 0) to preserve
  creation times on files modified by older ksmbd writers;
- restore XATTR_DOSINFO_CREATE_TIME on write when rewriting an existing
  xattr with da.create_time > 0 to self-heal damaged xattrs;
- remove itime validity checks;
- split xattr version 3 field decoding out into a separate patch [2/2]
  as IMO they were out of place here.

v2 changes:
- Check XATTR_DOSINFO_ATTRIB on read in smb2_update_xattrs() and
  ksmbd_vfs_fill_dentry_attrs() to prevent overwriting in-memory attributes
  with 0 when an xattr lacks DOS attributes (found by sashiko[2]);
- unconditionally preserve current attributes and set XATTR_DOSINFO_ATTRIB
  in set_file_basic_info() so setting CreationTime alone does not write
  zeroed attributes to disk (found by sashiko[2]);
- decode version 3 fields (ea_size, size, alloc_size, change_time) in
  ndr_decode_dos_attr() instead of reading into NULL so preserving flags on
  version 3 xattrs retains their values (found by sashiko[2]).

This should be (hopefully) the last of the fixes needed to implement ptime[1].
Thanks for testing all of them and merging them <3

Best,
koraynilay

[1]: https://lore.kernel.org/all/20261101015551.786044-1-koray.fra@gmail.com/T/#t
[2]: https://sashiko.dev/#/patchset/20261113221610.392113-1-koray.fra%40gmail.com


 fs/smb/server/ndr.c     |  2 +-
 fs/smb/server/smb2pdu.c | 43 +++++++++++++++++++++++++++++++----------
 fs/smb/server/vfs.c     | 21 +++++++++++++++-----
 3 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/fs/smb/server/ndr.c b/fs/smb/server/ndr.c
index 7e546c22e284..b5190528340f 100644
--- a/fs/smb/server/ndr.c
+++ b/fs/smb/server/ndr.c
@@ -256,7 +256,7 @@ int ndr_decode_dos_attr(struct ndr *n, struct xattr_dos_attrib *da)
 		return -EINVAL;
 	}
 
-	ret = ndr_read_int32(n, NULL);
+	ret = ndr_read_int32(n, &da->flags);
 	if (ret)
 		return ret;
 
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 9ef2d086fc4e..63dfbffbb575 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -3874,7 +3874,13 @@ static void smb2_update_xattrs(struct ksmbd_tree_connect *tcon,
 	if (rc > 0) {
 		if (store_dos_attrs) {
 			fp->f_ci->m_fattr = cpu_to_le32(da.attr);
-			fp->create_time = da.create_time;
+			/*
+			 * Older ksmbd writers cleared XATTR_DOSINFO_CREATE_TIME on sparse
+			 * or compression updates. Fall back to using a non-zero stored time
+			 * for backwards compatibility.
+			 */
+			if ((da.flags & XATTR_DOSINFO_CREATE_TIME) || da.create_time > 0)
+				fp->create_time = da.create_time;
 			fp->itime = da.itime;
 		} else {
 			fp->f_ci->m_fattr &=
@@ -9050,12 +9056,24 @@ static int set_file_basic_info(struct ksmbd_file *fp,
 	    (crtime > 0 || file_info->Attributes)) {
 		struct xattr_dos_attrib da = {0};
 
-		da.version = 4;
-		da.itime = fp->itime;
-		da.create_time = fp->create_time;
+		rc = ksmbd_vfs_get_dos_attrib_xattr(idmap, fp->filp->f_path.dentry, &da);
+		if (rc <= 0) {
+			da.version = 4;
+			da.flags = 0;
+		}
+
+		/*
+		 * itime gets preserved when reading the xattr if already present
+		 * otherwise don't write it as it wasn't asked for by the client
+		 */
+		if (crtime > 0) {
+			da.create_time = fp->create_time;
+			da.flags |= XATTR_DOSINFO_CREATE_TIME;
+		} else if (da.create_time > 0) {
+			da.flags |= XATTR_DOSINFO_CREATE_TIME;
+		}
 		da.attr = le32_to_cpu(fp->f_ci->m_fattr);
-		da.flags = XATTR_DOSINFO_ATTRIB | XATTR_DOSINFO_CREATE_TIME |
-			XATTR_DOSINFO_ITIME;
+		da.flags |= XATTR_DOSINFO_ATTRIB;
 
 		rc = ksmbd_vfs_set_dos_attrib_xattr(idmap, &filp->f_path, &da,
 				false);
@@ -11892,10 +11910,15 @@ static inline int fsctl_set_sparse(struct ksmbd_work *work, u64 id,
 						     fp->filp->f_path.dentry, &da);
 		if (ret <= 0) {
 			da.version = 4;
-			da.itime = fp->itime;
-			da.create_time = fp->create_time;
-			da.flags = XATTR_DOSINFO_CREATE_TIME |
-				XATTR_DOSINFO_ITIME;
+			da.flags = 0;
+		} else {
+			/*
+			 * Heal the xattr damaged by older ksmbd writers which
+			 * wrongly cleared XATTR_DOSINFO_CREATE_TIME on sparse
+			 * updates.
+			 */
+			if (da.create_time > 0)
+				da.flags |= XATTR_DOSINFO_CREATE_TIME;
 		}
 
 		da.attr = le32_to_cpu(fp->f_ci->m_fattr);
diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index 09dad151360c..da13f13f8980 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -1936,7 +1936,13 @@ int ksmbd_vfs_fill_dentry_attrs(struct ksmbd_work *work,
 		rc = ksmbd_vfs_get_dos_attrib_xattr(idmap, dentry, &da);
 		if (rc > 0) {
 			ksmbd_kstat->file_attributes = cpu_to_le32(da.attr);
-			ksmbd_kstat->create_time = da.create_time;
+			/*
+			 * Older ksmbd writers cleared XATTR_DOSINFO_CREATE_TIME on sparse
+			 * or compression updates. Fall back to using a non-zero stored time
+			 * for backwards compatibility.
+			 */
+			if ((da.flags & XATTR_DOSINFO_CREATE_TIME) || da.create_time > 0)
+				ksmbd_kstat->create_time = da.create_time;
 		} else {
 			ksmbd_debug(VFS, "fail to load dos attribute.\n");
 		}
@@ -2481,10 +2487,15 @@ static int __ksmbd_vfs_set_compression(struct ksmbd_work *work,
 		rc = ksmbd_vfs_get_dos_attrib_xattr(idmap, dentry, &da);
 		if (rc <= 0) {
 			da.version = 4;
-			da.itime = fp->itime;
-			da.create_time = fp->create_time;
-			da.flags = XATTR_DOSINFO_CREATE_TIME |
-				XATTR_DOSINFO_ITIME;
+			da.flags = 0;
+		} else {
+			/*
+			 * Heal the xattr damaged by older ksmbd writers which
+			 * wrongly cleared XATTR_DOSINFO_CREATE_TIME on compression
+			 * updates.
+			 */
+			if (da.create_time > 0)
+				da.flags |= XATTR_DOSINFO_CREATE_TIME;
 		}
 
 		da.attr = le32_to_cpu(fp->f_ci->m_fattr);

base-commit: 3bc1fb9c3b20cd478c83496ab16addecb401770d
prerequisite-patch-id: 049ae0eba275b5be35a238833107e0b251a55aa2
-- 
2.56.0

