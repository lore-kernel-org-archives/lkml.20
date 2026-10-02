Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FE7343897
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922970; cv=pass; b=nvvAiuiPBs8fwaUwjceQonkxoVpCCxdHER54aFMUFjUe4+wWb6PO6LsonyYXmxwedpSkKAOObV84vV8rLuuHdK2rLqvw8x1I5i2butKQ/eN0ncPtVMSNuKLOdmEXORMlleFNm9NAltKCnJrTgTChWMwnjTnrggA8IlK59QSqXaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922970; c=relaxed/simple;
	bh=3S1uZs1hII2pWOKPYQNkil7Fn4cNrtQ1UC0K0UrYm/g=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=WOfEKuah9saFG0bBcRnT273mugq4NhMqbMYDJfyJjp6oAwxd2bVf3FYohQ9qqqT8lUgfrRKaHrtVGYQc8fQTGfn3FGjuaGLgACwCLld2ml9ZBuEA1au9J0w578KxLF79LxeJORi2/BEMp6EbqYm8UUNgCPInEB3P7iChVaY8x/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rB/jwKfq; arc=pass smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rB/jwKfq"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-917ae0d5298so16686866d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790922967; cv=none;
        d=google.com; s=arc-20260327;
        b=pzH+B7N0pnKEQ+A8Ump8djbw3kz33e3SP/Z/kXbWKIDpvybf3lMj4Jzxmnqr5cCKZN
         HDFGyV0EwiTIbj/Aolsr90I4Y2MdPRZAR40W6Se64DgsT+wEKG+ndtqE2SIawm8/kSNl
         o390dzUoL0kzUz8OeFMcFQj/KUt0yNx06p0oNfmFCHNGLYuyCe6CFAonN3y1Ugo7k5W8
         nECa5l46wYElcSRP+wgfiOIGLdweNgMPTdT6NmfJh7/O1IYpVStdbVRXOA/RozYzmuKR
         WTXo4gvnFRKfXoDLVxZiV9fspPiiZ4joUkChAHIRJSNM2A6UcCyK9Ipj0NgKGruDuo2Y
         M3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=XEUnD7DqqTtUtcDjYvQugZu8ealQJ2hIum6Bu4MZjiI=;
        fh=uUZ37uKULDvMUpVprQ6Ffl3A/q5N5+z3ML3/rILH5nc=;
        b=O4HEBhUAMn5LOkn3kP6PgmW3+sr1SG5B0BqE3rxo/6GxtuxQed7ONiwEWZugsyqG0n
         0guH4KW9V93krZp89DovvLQwXsiil9V/1cCQTwhTIt/oSWP+H2FGtCVfBL5PjNEvO0xY
         54mEEJEdCGBqXa/DY9zorcH4sFzXaRKgZ4XFhpUxVig1rtOGdSwNtFJL9gRdwjZxJFIM
         PaD1KTpZZpn+QrhkV84DU/lbvxUVp82sTLod+NGK+KmWqJcQNyAIQYZuOoRZ3EgTs9aU
         548g8YxxoO2X+ap3Q2sShnAjJSPOeTyLuiP/TDjPSRZJGyidWWOi+AZBFeQ71AM5qsGG
         q9Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922967; x=1791527767; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEUnD7DqqTtUtcDjYvQugZu8ealQJ2hIum6Bu4MZjiI=;
        b=rB/jwKfqAc8b/Mimi6xHXJ0Y1EjA1k9uFGQxlxSUJP9DY5KS9/JQeAXRKyRkqeSn8o
         P60PWpZ/yZfu+glJ8qBJBFZyCTgLTKuH1yvRR3Ms6kL7g1yULX6B0hlsPR7ejpMADZY9
         om9LFohlBug3ELBeXaoIsgq/yMU6gqc26CvtSwiheRmgX3V6haELGWS9orhdTWFwyOPa
         1o2gbmJIIogrS0fbyi2EvRozrjDRk5avtc1ozHHBSsE7sm/zV76cCi4erUyK3mOD0o1H
         1Vs3FHQb1Wj7IvIQJJmw780oLJLnFS+ESP2MddA+po2sf75Ny3+sobXs+mdKMmMJ+15Z
         ioLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922967; x=1791527767;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XEUnD7DqqTtUtcDjYvQugZu8ealQJ2hIum6Bu4MZjiI=;
        b=l9sNoMgg4JG3vm9I0x/nMYIaEfQ/4VGZlc73/7YGY0YdIklDUiqaSM2kDzGauKXIZL
         H9mXLOpLqCsFc+gvqz/2vkPN+UHacMPu0zZV/MV78WlMKQSKbD7kBnGKjK1e74ZPZqoc
         0UEknZQ+Zi8SDwfS1myVVNwRemr9Q+3EuIaakfcvrH5U68+8UJrwSVVLuOxVIs4eYhE7
         6hrvpR4+DOKj7yDX9DKpJbq4FPlrnLa5cjz6Spck0c3ioSQwGGDTlfyQgpgKIalBfsDQ
         xkrklzX6lcbHQA89nX5Re/Yts1AzTVxvupNbGxCct5hNllTdXQ23kpL4+EoztpPzhMoo
         oYQQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+0Nr4O0Sy3K9aJws7baOW1jnhp1TiZbS9PbGZH7g9KuHWCXRZRykdeURsEuFT/bE1Hncx17HPBDBN6Y4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkRfSO2SpYTJDaU17ZoGuEcHVbnMRfv+IP9039QaX5w8ot5U89
	WASKgI/V+Bro1wgQpgLaSsXfkmAub1QzRsKTmK+A1S+pnKjUkMO5F/RN1qHIFu7QNy0xcKlEJ6f
	R3L8Ub0Eukv5R9Op5gL/FLv7jGVIIHdU=
X-Gm-Gg: AYBFou29I31uLYltdm08+6ewMqPMg4CO3eC+n/zaSRRRUCueds6isX8pYznkN0qaYzi
	MP6XWkufquywsvkGK5mwq3evGc5Dmd1IP/Z/RW6p11jdZq+Mtim1xqWr/vu0YO3wxF4NQWz3sQo
	9rLgQVfMC2lS1IJRabHE7bKmjjGZG88ZAjH0l8AxE2/6neDrCZtiD2KlQYe5RXwZU+A7Zsiz6LY
	4fuowcaVH0NgidIAwQDkk4p+pjbHB/QlMroVyahC7gRHDFHLMlSa2OpcUmvvUICVPUuKrBlRU3/
	gmfOFdRWux8LOt+MYFvxYYViY4BFCGZNAkqTeEjl2AX08EjeG4mNrH2AvinxZqe/hHmpb578XqF
	3QzT2Xl8=
X-Received: by 2002:a05:6214:250b:b0:917:9407:ebe6 with SMTP id
 6a1803df08f44-917c01f8f37mr34918186d6.45.1790922966450; Thu, 01 Oct 2026
 23:36:06 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 01:36:05 -0500
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 01:36:05 -0500
From: aljojobypls@gmail.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 2 Oct 2026 01:36:05 -0500
X-Gm-Features: AclHuK-eOHG-KjrKk1EnhSAW8Anv2gpdAShX7kyS6osGEORvuk9-xVyj6NCHZdM
Message-ID: <CAPNiJxAHw90Ndv_NoEi5PeqO4mRnw9S9vx-es3F0NNt2nbV2cw@mail.gmail.com>
Subject: [PATCH] ntfs3: do not trust setuid and device nodes from WSL metadata
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ntfs_get_wsl_perm() copies $LXMOD over the inode mode, including the
file type, setuid, setgid and the sticky bit, and $LXDEV supplies a
device number. Those attributes are stored on the volume.

A crafted NTFS image can therefore present a setuid-root binary or a
device node. cp -a and rsync -a copy that mode onto a normal Linux
filesystem. The nosuid,nodev flags on the ntfs3 mount do not travel
with the copy.

Keep the stored owner and the rwx bits. Keep the file type already
derived from the MFT, and drop setuid, setgid, the sticky bit and
device nodes. -o permissions restores the previous behavior for a
volume the operator trusts, such as a WSL disk that really contains
setuid binaries.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Aljo Joby <aljojobypls@gmail.com>
---
 Documentation/filesystems/ntfs3.rst |  9 ++++++++
 fs/ntfs3/ntfs_fs.h                  |  1 +
 fs/ntfs3/super.c                    |  7 ++++++
 fs/ntfs3/xattr.c                    | 35 +++++++++++++++++++++++------
 4 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/ntfs3.rst
b/Documentation/filesystems/ntfs3.rst
index 2b86a9b3a..260f73228 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -109,6 +109,15 @@ this table marked with no it means default is
without **no**.
        Kernel. Not to be confused with NTFS ACLs. The option specified as acl
        enables support for POSIX ACLs.

+   * - permissions
+     - Trust the WSL metadata stored in \$LXUID, \$LXGID, \$LXMOD and \$LXDEV.
+       This includes the owner, setuid, setgid, the sticky bit and device
+       nodes. Without this option the driver still applies the stored owner
+       and the rwx bits, but it keeps the file type it read from the MFT and
+       drops setuid, setgid, the sticky bit and device nodes. Mount a volume
+       with this option only when you trust it, for example a WSL disk that
+       legitimately contains setuid binaries.
+
 Todo list
 =========
 - Full journaling support over JBD. Currently journal replaying is supported
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 5811d89d6..267d980f7 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -111,6 +111,7 @@ struct ntfs_mount_options {
 	unsigned nocase : 1; /* case insensitive. */
 	unsigned delalloc : 1; /* delay allocation. */
 	unsigned ads : 1; /* ads support. */
+	unsigned permissions : 1; /* Trust on-disk WSL uid, mode, devices. */
 };

 /* Special value to unpack and deallocate. */
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index f4a42a0c7..863126e87 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -275,6 +275,7 @@ enum Opt {
 	Opt_delalloc_bool,
 	Opt_ads,
 	Opt_ads_bool,
+	Opt_permissions,
 	Opt_err,
 };

@@ -303,6 +304,7 @@ static const struct fs_parameter_spec
ntfs_fs_parameters[] = {
 	fsparam_bool("delalloc",	Opt_delalloc_bool),
 	fsparam_flag("ads",		Opt_ads),
 	fsparam_bool("ads",		Opt_ads_bool),
+	fsparam_flag("permissions",	Opt_permissions),
 	{}
 };
 // clang-format on
@@ -432,6 +434,9 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
 	case Opt_ads_bool:
 		opts->ads = result.boolean;
 		break;
+	case Opt_permissions:
+		opts->permissions = 1;
+		break;
 	default:
 		/* Should not be here unless we forget add case. */
 		return -EINVAL;
@@ -805,6 +810,8 @@ static int ntfs_show_options(struct seq_file *m,
struct dentry *root)
 		seq_puts(m, ",delalloc");
 	if (opts->ads)
 		seq_puts(m, ",ads");
+	if (opts->permissions)
+		seq_puts(m, ",permissions");

 	return 0;
 }
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 594ef6860..5db154513 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -1036,6 +1036,8 @@ void ntfs_get_wsl_perm(struct inode *inode)
 {
 	size_t sz;
 	__le32 value[3];
+	struct ntfs_sb_info *sbi = inode->i_sb->s_fs_info;
+	umode_t disk_mode, type;

 	if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
 			sizeof(value[0]), &sz) == sizeof(value[0]) &&
@@ -1043,15 +1045,34 @@ void ntfs_get_wsl_perm(struct inode *inode)
 			sizeof(value[1]), &sz) == sizeof(value[1]) &&
 	    ntfs_get_ea(inode, "$LXMOD", sizeof("$LXMOD") - 1, &value[2],
 			sizeof(value[2]), &sz) == sizeof(value[2])) {
-		i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
-		i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
-		inode->i_mode = le32_to_cpu(value[2]);
+		disk_mode = le32_to_cpu(value[2]);

-		if (ntfs_get_ea(inode, "$LXDEV", sizeof("$LXDEV") - 1,
-				&value[0], sizeof(value),
-				&sz) == sizeof(value[0])) {
-			inode->i_rdev = le32_to_cpu(value[0]);
+		/*
+		 * $LXUID/$LXGID/$LXMOD/$LXDEV are stored on the volume.
+		 * A crafted image can claim to be a setuid-root binary or
+		 * a device node. Those bits are copied onto a trusted
+		 * filesystem by cp -a and rsync -a, even when this mount
+		 * itself is nosuid,nodev. Trust them only with -o permissions.
+		 */
+		if (sbi->options->permissions) {
+			i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
+			i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
+			inode->i_mode = disk_mode;
+
+			if (S_ISCHR(disk_mode) || S_ISBLK(disk_mode)) {
+				if (ntfs_get_ea(inode, "$LXDEV",
+						sizeof("$LXDEV") - 1, &value[0],
+						sizeof(value[0]),
+						&sz) == sizeof(value[0]))
+					inode->i_rdev = le32_to_cpu(value[0]);
+			}
+			return;
 		}
+
+		i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
+		i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
+		type = inode->i_mode & S_IFMT;
+		inode->i_mode = type | (disk_mode & 0777);
 	}
 }

-- 
2.53.0
