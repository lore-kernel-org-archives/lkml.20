Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890703;
	b=Sw1Q1z38Y7HPRvpr0w2WNnEu3v0J62W/095SkTuR8pTOADP5eqPIlf4xB2rDQyCgD2PR
	 7V34FdQKBq1ivdYX5P0EJwqsClb7483ST49zv+a1X0HoDKue1+hIo3XTbJlOMXJI87HJc
	 rPUkf/lbbCrqEWLFEawC6wsQCqUZgYsdM/Z6PoyiigDaL/HhnIUa4nZsGoQicjA8keeeb
	 g9A6DTegKk1VfdJ0B04qAAnL/BTtNPiUsx1sC2RX/MQBmgqK7iELeBUkD4MKF5bfqUl4F
	 uSsogPd2OSHRzzCtD13eHMXnzy2WoJoPjH8647Q5A1eDxiR0QV+bi5CG3opOTiqkEHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=YD4MKzjuGqaVW34jYm41tg1pLvXJAa1EZJPAY0d5628=;
	b=ORya2ErZvsBzLp3NZod8YXNISlPVUXniPpho41dqgpWPOABfn1/H6kJJexwDFwnv/Ats
	 iNcBhp+Ys6kRjLNW0WweBhEmqvr/jq7zwmqNLtV/Rr+FGIt7CMC7ui3rkg7wMKEMsNqmt
	 mNZO7IpITyjAN20nrDY3DQH+FPFXtT+34k4DEnuXGD+SGzpWlqXBEs5T4OQml2TALfTYB
	 sy/eQM4roe3VxYtpKSk14zVyt3j/BLZ6tsNoGZfXSCDXEnlR51ZJiyZeea/WdZ/CjUDs1
	 J/l2fH1YIbg+fDXCnk93y0pwQsZ2NmpTan17R00gzLjhlxMBYo7+UP0fs4ExPR2csrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=clholjk+;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298E46083616
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298E46083616
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=clholjk+
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8470d7d430fso835741a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890701; x=1794495501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YD4MKzjuGqaVW34jYm41tg1pLvXJAa1EZJPAY0d5628=;
        b=clholjk+NpSEYKTt4ABkOe0qowBaAriDH5iE3ssE6sCYPBAnTHzVV0dHXXf7rU1Mxa
         Euf6f8RXCQxQaioBZROE7lSTSNHWlTJVOlCA2wW4RbtVhzWujc6x+3MbE6MUQbXoBo/R
         5JiwAz+soG1TNJ8QzZPd0+96EG+GOVMvMbU7FsmrR9sGq+Qfk7tWnhDiGJYUEIf+poOb
         ZnyMYMw8dSh1mm+ATTbseRYMIrORGXqeSSGlJIBKx2ICjSAGScb2Hi2HvV71NtIsgjJt
         39TYguwxRwzuadshz/7LUJ/Qb/SpZBLB9A8orIONj3GSZ/YZc2BoBacvqXOq5KOmTSve
         qkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890701; x=1794495501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YD4MKzjuGqaVW34jYm41tg1pLvXJAa1EZJPAY0d5628=;
        b=vHqRTLtvLPU+6S/DnWh/l9q1gdcfrQjZF++5BQpnDc3e2FAJxzzbvKPbtUxXjTLbPs
         wlFBT2l7Q3WDkfjBfJQfZpwkyp2qvH5sHh+2yHfCGXrR5ZvRxKr5+yryV3NN34d1HYFk
         XVKCtwL0JSpq1ChyPS1LFLBS7z7+arrLDrX4qBp29z/UFl1rqIb74lrxljgK2M8kuwb7
         1N5HT3l6mrfEU2FYQRFV404czyOL/6dGidd8hcK4NqwJ0NvrVeDW9oupNkjHzvncKNkP
         Qq8NdEkSSA7qe1Z6OPodheZ7FrkcYIQ+pUr6h6/PjUbV21YQWv3A1A8dQlvPT15FmbB0
         7+Qg==
X-Forwarded-Encrypted: i=1; AKwUvBy44r3m7WodfXZvSawqgEvCPnf2cAMp0p883uxXfbzC+p4IKe/J8+kV1MAD7GCtNL1nYwpi85+zDMSIL4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ved/FepYb/7MZdnTH4+K53NOqjFn5YHIihLMXNF1C6QNRCFM3
	Rk65gRIh44SSwuSgg73vFTGheVv9N8B9sMjRu6sw297T9XDajMyYLZttGsB6U94hzVA=
X-Gm-Gg: AYBFou2O3z+Z0IwbyZeFOx2/rjFAWYIXwc7wm0LcPD1cwDgmPgn5CSluuHmX6mjnyBg
	6UQGCdyEzRAy+H9KwkVlInml+GEyGr1Gft7L3qisUlUeYXa4Et1fyAgxaXI5nl/xR0ldsAJOD9m
	JOnTvsEnf6Lt+hTpMJYqwFsbx9lTkTlrE97aoKrWyG0EZE/cw/2suqskGAKtemBiQOXWPvvtdeT
	aDrG3T6j96PGgoKP52nbYNs32UKw8g9fI/gnjXgX/PzHDAwT+BkiK59SxJ8wT+oqmqitqHP+dpb
	99BvVq4mcQKoYwtohGKPIZXHc+eE9ZjMPWaKAHDAo1VCRalqRS9t89Ds4GyzoN3Gn3ByK9l0bDZ
	x3NqDEABt5/9rS2Ttujqy5iAT5ePb4wNvihgN9KIB6URlJfaF7CpWioDotVgk4bW7ukPrMdt5NJ
	b1z25z0YAxJ21TS5rXIcCuUlfQFJ/7DYVcK0OzaZv1sIbYoR9KnKjBMYH0MOhACYgNQzRmZtkBl
	X+x0z3JM7UkKn+cd5Eu6VqzhPa5Ln64JwzF2s1rmRDKW43U1w4j7mp0mh/ZTqt42xntDKxbJW+E
	TrKmu7fji0DYhMyGybLtNsbOR2/Y7mftpZ8cT+VJILZ70Q==
X-Received: by 2002:a05:6830:4391:b0:85b:c75:dc65 with SMTP id 46e09a7af769-85d364a5597mr16805624a34.7.1793890701047;
        Thu, 05 Nov 2026 06:58:21 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e74f50sm4721807a34.21.2026.11.05.06.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:20 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:04 +0000
Subject: [PATCH RFC v3 13/90] fs: never store an id that was lent to a cell
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-13-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=5662;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=db1fPjvY2edvd4YYcZ+XdOK2IgL0ZatDWIixhMxnSdA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPngFOJfoyKpAK4teTG+textNYYmHTtI8NzAnwvzi+U9vftpCf0pFYYs4jGbzYzWdO0tSt3qoEy
 R/FiJ8v7G6wY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A block of ids is lent to a cell for as long as the cell exists, and is
later lent to another cell. Anything that is still owned by one of those
ids at that point would belong to the new cell.

Today a task in a user namespace can create a file on a host filesystem
that is not idmapped. fsuidgid_has_mapping() only asks whether the user
namespace of the superblock can represent the kuid, and the initial user
namespace can represent every kuid. The raw kuid ends up on disk.

Refuse to represent an id of the window in a filesystem that the cell does
not own. Do this in the helpers that decide whether an id can be
represented: kuid_has_fsmapping(), kgid_has_fsmapping(),
vfsuid_has_fsmapping() and vfsgid_has_fsmapping(). That covers creating a
file, chown, ACL entries, copy up in overlayfs, and the uid and gid mount
options of tmpfs, fuse and bpffs.

A mount that is idmapped for the cell keeps working. There the id has
already been translated to the on-disk id before it reaches these helpers.

Some details:

  - The vfsuid and vfsgid helpers do not call the kuid and kgid helpers. On
    a mount that is not idmapped they do not check for a mapping in the
    user namespace of the filesystem today, and this patch does not change
    that.
  - The check looks at the value of the id, not at the caller. overlayfs
    creates files in its upper layer with the credentials of the mounter
    and the fsuid of the caller.
  - The check is not in from_vfsuid(). That would give the inodes of the
    kernel internal shmem mount an invalid owner, and notify_change()
    would then fail every ftruncate() of a memfd.

With CONFIG_CELLS enabled, the host can no longer chown a file to an id of
2147483648 or above.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cell_ids.h      | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/mnt_idmapping.h | 13 +++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/include/linux/cell_ids.h b/include/linux/cell_ids.h
index dcb0a559d0e9..9bdd98e73a9d 100644
--- a/include/linux/cell_ids.h
+++ b/include/linux/cell_ids.h
@@ -62,4 +62,42 @@ static inline bool cell_range_in_window(u32 first, u32 count) { return false; }
 static inline bool userns_is_cell(const struct user_namespace *ns) { return false; }
 
 #endif
+
+/**
+ * kuid_storable - may a filesystem store a kuid?
+ * @fs_userns: the user namespace of the filesystem, sb->s_user_ns
+ * @kuid:      the kuid, after the idmapping of the mount has been applied
+ *
+ * An id that was lent to a cell must not outlive the loan, so it never reaches
+ * a filesystem that the cell does not own. Through a mount that is idmapped for
+ * the cell the id has become the on-disk one long before it gets here.
+ *
+ * That @kuid is an id of this cell and not of another is for kuid_has_mapping()
+ * to say. Nobody but kuid_has_fsmapping() and vfsuid_has_fsmapping() has to ask.
+ *
+ * Return: true if @kuid is outside of the window, or @fs_userns is the user
+ * namespace of a cell.
+ */
+static inline bool kuid_storable(const struct user_namespace *fs_userns, kuid_t kuid)
+{
+	return likely(!cell_id_in_window(__kuid_val(kuid))) ||
+	       userns_is_cell(fs_userns);
+}
+
+/**
+ * kgid_storable - may a filesystem store a kgid?
+ * @fs_userns: the user namespace of the filesystem, sb->s_user_ns
+ * @kgid:      the kgid, after the idmapping of the mount has been applied
+ *
+ * See kuid_storable().
+ *
+ * Return: true if @kgid is outside of the window, or @fs_userns is the user
+ * namespace of a cell.
+ */
+static inline bool kgid_storable(const struct user_namespace *fs_userns, kgid_t kgid)
+{
+	return likely(!cell_id_in_window(__kgid_val(kgid))) ||
+	       userns_is_cell(fs_userns);
+}
+
 #endif /* _LINUX_CELL_IDS_H */
diff --git a/include/linux/mnt_idmapping.h b/include/linux/mnt_idmapping.h
index b5e0772aa190..dfe35b570317 100644
--- a/include/linux/mnt_idmapping.h
+++ b/include/linux/mnt_idmapping.h
@@ -4,6 +4,7 @@
 
 #include <linux/types.h>
 #include <linux/uidgid.h>
+#include <linux/cell_ids.h>
 
 struct mnt_idmap;
 struct user_namespace;
@@ -149,6 +150,8 @@ kgid_t from_vfsgid(const struct mnt_idmap *idmap,
 static inline bool kuid_has_fsmapping(struct user_namespace *fs_userns,
 				      kuid_t kuid)
 {
+	if (!kuid_storable(fs_userns, kuid))
+		return false;
 	return kuid_has_mapping(fs_userns, kuid);
 }
 
@@ -164,6 +167,8 @@ static inline bool kuid_has_fsmapping(struct user_namespace *fs_userns,
 static inline bool kgid_has_fsmapping(struct user_namespace *fs_userns,
 				      kgid_t kgid)
 {
+	if (!kgid_storable(fs_userns, kgid))
+		return false;
 	return kgid_has_mapping(fs_userns, kgid);
 }
 
@@ -183,7 +188,9 @@ static inline bool vfsuid_has_fsmapping(const struct mnt_idmap *idmap,
 					struct user_namespace *fs_userns,
 					vfsuid_t vfsuid)
 {
-	return uid_valid(from_vfsuid(idmap, fs_userns, vfsuid));
+	kuid_t kuid = from_vfsuid(idmap, fs_userns, vfsuid);
+
+	return uid_valid(kuid) && kuid_storable(fs_userns, kuid);
 }
 
 static inline bool vfsuid_has_mapping(struct user_namespace *userns,
@@ -221,7 +228,9 @@ static inline bool vfsgid_has_fsmapping(const struct mnt_idmap *idmap,
 					struct user_namespace *fs_userns,
 					vfsgid_t vfsgid)
 {
-	return gid_valid(from_vfsgid(idmap, fs_userns, vfsgid));
+	kgid_t kgid = from_vfsgid(idmap, fs_userns, vfsgid);
+
+	return gid_valid(kgid) && kgid_storable(fs_userns, kgid);
 }
 
 static inline bool vfsgid_has_mapping(struct user_namespace *userns,

-- 
2.55.0

