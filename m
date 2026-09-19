Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86848033E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817124; cv=none; b=n2yhx2t87RGq4d+oP4ntl9biwEK2r2fAgpeioJO7E1kMgPOc5U8DpqQ4MsFuIBNOVCKsYgW49mkWzvdkAQ1BaMgxafTA4d09lEE7yylmbhH6XtOlyUBbvQlySeJhHdZsSz25aZ+W99G+7AqtvGJ0N6n0XkExOmdmnIq5+WmLuZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817124; c=relaxed/simple;
	bh=S0Ql9ytONkuw+Z5WVaoo3b5wAdX6Cm4FEOlh6Gz8VaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZmHXqVTHOLRNj1BLArhj635IFghKXdWbHJPmERRZ8xVR+Tz0HO8f/oAPIwxomy/K7r1yAbZnwgyGz2xFsLSyccGIK8Z20bASyNbJS9a4MzluW7mghirbdIANBhyurfY6rYz+z+fOieQbPOYrmACJI5HUhD0tEG9w+biFJ7UTFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2mzPoML; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2mzPoML"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so671653a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817122; x=1790421922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NPj5CHhCIqadQUJC108X0zWB709uEAZIyAJtf3Zc+c=;
        b=f2mzPoMLVTd0YPT0zLDgpqOuA4aTv0pUtB27aEX5jr2M90r/pwpjZLaW1wKZ9Xj7r7
         DPYbLxyWliJ2gqgbNcDalYxusTDjBWowmT0ec4gtFyVhvHXA5GXWfRnbgiodl/VY4wdc
         EsZmpL+qkR1Eyu6kcLXiZ8bI1pl8x9G26bfV41UdWk5CcaXjaYLtUbWQ5MpxIf2Lv61e
         FM62KUt94wjD1tTcMAlIgy6SbwwNtzQZ9eYRKKuPB/HOJW7Qt2ANysJhHLXI501br/ZG
         GJuuLF8mj4NwHtUgCzg7K2mPyCDbrrl7h43GRCJ8DwHJ0YT2NrxU0928ujqdG0hfEvbO
         i4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817122; x=1790421922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1NPj5CHhCIqadQUJC108X0zWB709uEAZIyAJtf3Zc+c=;
        b=J7s/y+9ouK1isPqMYSv0TsGz8noFWiTE37U2xqOnOr9XJm2QguLMvU+n/7y41t7R+p
         mQL3DFA/zElBxQE2zuZXTtE3T4OxnP+g64mH6D7/rKaQ2epbhZ5UZMb+jBOC7IWqW1WG
         Rx0CSnpg9dYp+EXvI3t9Ju3CZEMJO4Nbayh8+gRFbEcWzBNbHojSZdXV71Q9JupSU2Im
         gaPDEuVYr+5gnh7T0pkJ4YGtTD23iBbXYcQYsuvZqIQAdlfag4ZNynvYnc9SbXIjBvPD
         icPgc9IWF8ELkG1akeGGxTw5q4dLlCs/mfHquJzoNKPpD0ChTw1q91racR5aT6vqf7Vs
         im+Q==
X-Forwarded-Encrypted: i=1; AKwUvBytPUYfMW6m9m0wap9iWDF1k8MEFaBFWsdjFDKoFAMWAzSck5+K74jbvHhDE06iuCeEZAcB/ToM4nNatV8=@vger.kernel.org
X-Gm-Message-State: AFuF++mg/e8VisBcblDqP5OFIhDrVuFAP2hSjkl5ct3L8DUrQD2gYBvB
	K48MuhPHVxowyj11FhrIdOh/e36lcyf98hKdbzOARtvzsmceSC1zNqeik/GL9MOZ
X-Gm-Gg: AYBFou3DV+qnjfi6hHakkiKIPLnpO1JdnA1aAePNS1RygfAyunr4RqHCt62N1f4hnRa
	FyCVfELxS/uOOevO9xnWzd4zcG18koYPwGsrmZ8eHkF3F/VUjEhqhfzjLqdwqnYLD+pVaNcpwGo
	TH2IliB/2cQGEfyb96oOGAAIq0dbr2EeJUvLmqEGjs7C913St0A+Nu5xf8a/cQuPaZvkj+qdvp4
	49WmTa1WLN6eQAexBmpt1L/5IDBFhopUypBTB6CxO8ugjF+qM1ipZmt28sjMODRUGGk26x8iXPI
	1N2JP1kfzOZ01bd1EcxL5qmLbpZUkBvx63xFFR5ZvFPa4sLvPl9mpbdhkZ3OFc34oMmjBjDVbb6
	hj4BoyErT5M74RRmoUyt0m8TaLFSmh6HB+CHgUPpiBaULNNnYp5yW5+yRSnUFetivuxUO9QVssp
	y6w8n8eWUhHVnvih4SYNJoWTDnYtURG/5JyPdz2le1Bz/Wqgh6mCiBqZSefGZLLDks/7AdkbTUH
	8OSOZ/nVjr8XJylH2ByOguLD7FdHugiJ0JzhHl2OjfSdEYPfZUtzT8vzt+FEoA0+DZpoDCd3W4i
	YCFXtdzAeFNlSyqjScHp
X-Received: by 2002:a17:90a:fc4b:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3a02900f85dmr588594a91.29.1789817122024;
        Sat, 19 Sep 2026 04:25:22 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02900f84fsm2048195a91.2.2026.09.19.04.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:25:21 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	linux@armlinux.org.uk
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] adfs: validate bigdirobnamelen in adfs_fplus_getnext()
Date: Sat, 19 Sep 2026 11:25:21 +0000
Message-ID: <20260919112521.3872252-1-benquike@gmail.com>
In-Reply-To: <20260919090319.3238583-1-benquike@gmail.com>
References: <20260919090319.3238583-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adfs_fplus_getnext() reads the directory entry name length straight from
the on-disk F+ big directory entry:

	obj->name_len = le32_to_cpu(bde.bigdirobnamelen);
	...
	ret = adfs_dir_copyfrom(obj->name, dir, offset, obj->name_len);

obj->name is a fixed size array of ADFS_MAX_NAME_LEN (260) bytes inside
the on-stack struct object_info of adfs_fplus_iterate(), but
bigdirobnamelen is fully attacker controlled and never validated.

Mounting a crafted ADFS image whose big directory entry declares
bigdirobnamelen = 264 and then calling getdents64() on the directory
makes adfs_dir_copyfrom() write 264 bytes into the 260 byte obj->name,
smashing the stack frame of adfs_fplus_iterate(), and the subsequent
dir_emit(ctx, obj.name, obj.name_len, ...) reads the same out of bounds
range again in filldir64(). adfs_object_fixup() may then append up to
four more bytes for the ",xyz" filetype suffix, extending the overflow.

Reject entries whose name length exceeds ADFS_FPLUS_NAME_LEN (255).
That is the maximum the F+ format can represent, and it also leaves
room for the four byte filetype suffix appended by adfs_object_fixup()
(255 + 4 = 259 <= ADFS_MAX_NAME_LEN).

Reproduced on Linux 7.3.0-rc3 (5dd1818b15d9) with KASAN by mounting a
64 KiB ADFS image (loop, MS_RDONLY) containing a single F+ directory
entry with bigdirobnamelen = 264 and calling readdir() on the mount
point:

 ==================================================================
 BUG: KASAN: stack-out-of-bounds in memchr+0x82/0xb0
 Read of size 1 at addr ffff88810099fcac by task init/1

 CPU: 3 UID: 0 PID: 1 Comm: init Tainted: G    B D    7.3.0-rc3-g5dd1818b15d9 #1 PREEMPT(lazy)
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
 Call Trace:
  <TASK>
  dump_stack_lvl+0x70/0xa0
  print_report+0x153/0x4c6
  kasan_report+0xf1/0x120
  memchr+0x82/0xb0
  filldir64+0x56/0x5a0
  adfs_fplus_iterate+0x1a6/0x2c0
  adfs_iterate+0x1bf/0x4f0
  iterate_dir+0x1c1/0x560
  __x64_sys_getdents64+0x13a/0x260
  do_syscall_64+0xda/0x4b0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

 The buggy address belongs to stack of task init/1
  and is located at offset 380 in frame:
  adfs_fplus_iterate+0x0/0x2c0

 This frame has 1 object:
  [32, 320) 'obj'
 ==================================================================

A matching splat is also produced from adfs_object_fixup+0x3f5/0x480
for the write side of the overflow.

With the check in place the same image is rejected with -EIO and no
KASAN splat is produced.

Fixes: da23ef0549d4 ("adfs: add hexadecimal filetype suffix option")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Add a Fixes: tag. v1 claimed there was no single commit to point
at; that was wrong, so here is the reasoning.

The missing validation itself does date back to the initial git import,
but it was not exploitable then. Before da23ef0549d4, struct
object_info::name_len was an unsigned char and ADFS_MAX_NAME_LEN was
256, so truncating the attacker-controlled 32-bit bigdirobnamelen to
0..255 clamped the copy to within obj->name. da23ef0549d4 widened
name_len to unsigned int (to make room for the ",xyz" filetype suffix)
and grew the buffer only to 256 + 4. That removed the implicit &0xff
clamp, so the full 32-bit on-disk value now reaches
adfs_dir_copyfrom(), which bounds only the source and not the
destination. That is the commit that made the overflow reachable.

For completeness, git blame on the copy points at a317120bf7f8
("fs/adfs: dir: add generic copy functions"), but that commit only
replaces dir_memcpy() with adfs_dir_copyfrom() - same destination, same
unvalidated length - so it is not the right tag.

Backporting: the surrounding context (obj->indaddr, adfs_fplus_offset())
only exists from v5.6, so this will not apply verbatim to older trees.
The added check itself is unchanged; a pre-v5.6 backport just needs the
context adjusted.

ADFS_FPLUS_NAME_LEN (255) rather than ADFS_MAX_NAME_LEN (260) is the
right bound: 255 is the on-disk format maximum and what super.c reports
as s_namelen, and it leaves room for the up-to-4-byte suffix that
adfs_object_fixup() appends (255 + 4 = 259 <= 260).

Found and verified with a QEMU + KASAN reproducer (crafted ADFS image
mounted over loop); the fix was rebuilt and re-run against the same
reproducer, which then reports no KASAN splat.

 fs/adfs/dir_fplus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
index 4a1592401..517ffcc91 100644
--- a/fs/adfs/dir_fplus.c
+++ b/fs/adfs/dir_fplus.c
@@ -192,6 +192,8 @@ adfs_fplus_getnext(struct adfs_dir *dir, struct object_info *obj)
 	obj->indaddr  = le32_to_cpu(bde.bigdirindaddr);
 	obj->attr     = le32_to_cpu(bde.bigdirattr);
 	obj->name_len = le32_to_cpu(bde.bigdirobnamelen);
+	if (obj->name_len > ADFS_FPLUS_NAME_LEN)
+		return -EIO;
 
 	offset = adfs_fplus_offset(h, le32_to_cpu(h->bigdirentries));
 	offset += le32_to_cpu(bde.bigdirobnameptr);
-- 
2.43.0
