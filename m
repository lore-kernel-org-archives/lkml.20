Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110997;
	b=maViD3QmCPfKPRqFoHkR56YmAF5JrtonTtycXzKW7oodE7+oNpLe6r8tfpv4Ee0LasFG
	 BXme2sBzYmvMpYF9UHTQFRY1Xf7lrtjp5FuDZupCh1pPINSXuqq0BMxqFqpbwgnK1tFna
	 hofLzY5c22Aysn6XRFB+F491Z3eCL7OpA9hxNgJRIegP58//cFPB0TjtbZsn18TehrPoa
	 fp2UYIWyCmPpKowr+VAmQehY/trybcrgaOll07zZ0CDXKcc+6S0RIQ+JxpIhtLVe2548c
	 Xj9k660xGdY2VgS39GHsvNGMk1z47I4euOj/QDp6vPCwh8j0VTiXeFLj/YAL5p17ZuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MixBdKDrKWIaD4vR9pKSroN8iOV2wkRTMyRsaYekuV8=;
	b=mOJAdsNxyv7sT9yRtpE6pQYVCI8VKpQNyxpu+jW3o3oiiqh8Ogr/crU7ZioGhn6XNhxy
	 I8a0ejnmP8db/OOk50B+gjHMMpoVYrZxHsyfXTrfYnbg0J1WGOLLvw68XhC6XJm1/66fG
	 TGaUvEn6XUY1p296juQQrfMtPeYyvup5i44QlD3RNajVf900S+R+RPUp/aYuQR+J9dZOF
	 gxwBaRtoDGU4/O+mEMY1lACnxAFANgS/EumK47zV9d9WthvJS57sDtVeW6Sv6pdgVXbQx
	 ACG5cfpOjixgKaIaOt7ZEWhSP7aTQOeEypMUhg975iTiXFVxqX7XiQekf8vadT50noA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=lpg837bN;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D36606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D36606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=lpg837bN
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so1490683e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793110996; x=1793715796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MixBdKDrKWIaD4vR9pKSroN8iOV2wkRTMyRsaYekuV8=;
        b=lpg837bNIJsHJTuEVsqCG1OTSUyr7sKOSALrAZornbOQareP6pphXzI0xqcgRiUabz
         h9rVo237nBkbSHhIU/obsUFhS6Z6BKjtHLSHpzyOwk7Eq4MWib8cYoutu9O1pOCMNkiy
         5ynxg6LQRgOotRx4da++qpdn45QIEPEcviuziuIEYe0OWcjvq4RLKpFY89fh7UnhsjG5
         f/AAE7M7MjuBbRID6jeZpwXF8VuNsaFDCrdeaK+ulCxZiK8NMpaUyVDLG3VvWVW/9DgW
         ru6sSq7F7iseI508cluD42NOplgsplUEeyDz7ord9Lv2YIbWGTgosaoxEBrBTpBlKKrD
         gU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110996; x=1793715796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MixBdKDrKWIaD4vR9pKSroN8iOV2wkRTMyRsaYekuV8=;
        b=UIrtih/Aze0QfZ7FgbMcsxAYZknON4w2nJkUBU1uy3vZoIC89Qheuu2fqH/i7WSXuA
         ZxPrDqwk/CCfyZYAqAjJEymMe1HVBGV3BLYdioSI1+Gx8s3SWamHeutH/D9s8qEspiU4
         TrGguaGcDiMPp+PS5Bf0hYYmtgV4LMzfVkE9Mjf/LoZeEb/gfAauCbjhkf5NhiRPP6xa
         UBsZnX0z5GvVA7NpzvtKMVfO+yNAYPWSzWL2KA0sefe1QYdUfq0UcjwsT0i+6DBMqX2b
         nXv2QIOLbSa2t8iU5Eu5hu+UfQsObNn9R0bbfPY0SCkK3OQhjbuEqzYVB7hq9L8pW38c
         tjiA==
X-Forwarded-Encrypted: i=1; AKwUvBzKyJf9eSYj8tlONFRLZ1t1dmEcY3o7Rz7vxoIifdX2hZWw2arvrcVPSI2vMcPL27Dc3oW7B5VYOYEa5wo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKArArQLBrEMtWVxrT2cpagbYE+hEooypd4cOET9dI2F92vYHl3
	qHrhdntf9EYHXtc3i3Q4TefnoICozOThvXe+/46vFkaUxZuK/EveiQO+VcFfjktrbg4=
X-Gm-Gg: AYBFou1GvS1fcYSRs4vX/EeXC6gMz4EcEBRGTY43ay0axtxj6ftTgwsLvejlpfMRIwz
	PoY9T03bZFsdp/o3Yn8vpXzM3tg8IgCmO5imuCvARXdtUWyfsaJC8ECG29mHP+qui7QA+h6yEuU
	guRErC07iM0eulac0Uhdi1NNrM2YLSk2pOeanu/UEMgVwiDMHKpkDnQXE3Klry1CHXiBoWZh4Ue
	CJKqZiNgdXCpg7uHWrIHw9Xnm6/BcYwPi8l+zDLMM6Oh1qbBo2BUpCKBCNj4LC1IEtU2puXTcAe
	WxTtdee3qHyrrylLyVpXnTjhfY7skEE81jKudJKbBHBHCMnAXn8EfnXVnQ2iNBf8r3pF7J7JQrm
	RpuE147lzha1dDQBRz1IDR0V/Z8rtDwJKt9IM8w69zopsm/S/MIuHaSgD9xloz5vKbYCBgfwV2J
	HAJ29gAz7q47nsSMr1pK7LpCTZqlkMfvsOqIdFiRoUoToH1RoRlOMvxG+qkGwuPv38mS6g+GU4L
	op8OTUCgdas87+PGEIgzd79sC7O03FzSrCRiQnWJrSc/050jfqGobTeAqoB7URXdXmBWTK6
X-Received: by 2002:a05:6122:1790:b0:5e7:e3f9:1322 with SMTP id 71dfb90a1353d-5ec23288d76mr3909423e0c.9.1793110995603;
        Tue, 27 Oct 2026 07:23:15 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9912da2d9d1sm75077241.7.2026.10.27.07.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:23:15 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 14:22:51 +0000
Subject: [PATCH v8 3/6] userns: check the opener and the writer before
 mapping uid 0
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
Message-Id: <20261027-b4-setfcap-userns-v8-3-2674adc63f3c@toxicpanda.com>
References: <20261027-b4-setfcap-userns-v8-0-2674adc63f3c@toxicpanda.com>
In-Reply-To: <20261027-b4-setfcap-userns-v8-0-2674adc63f3c@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793110987; l=6694;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Tq4QC700hpQ0XsVb6nesQjcXMRFBl8Nnhz0SoKNdw/Q=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDnI6R4VZy9xB9YQWBhtA8maRIyE4iwcJt2G/vdLCu+bEMVbGxtZDjvHN7mZchCF2DqoX2Se+YM
 NJf8JkgsCHwE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

verify_root_map() looks at the cred that opened the map file: it asks
whether it has CAP_SETFCAP over the parent, or, for an opener inside the
namespace, whether the creator had.  Two things are missing.

The writer isn't checked.  For every other privileged mapping
new_idmap_permitted() wants the capability from the opener and from the
task that calls write(), but a map that consists of the single line
"0 0 1" takes the unprivileged branch, where only the opener's euid
counts.  So an open uid_map file is a token for mapping uid 0:

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP
  fd = open("/proc/<pid>/uid_map")
  B gets fd by inheritance
  or SCM_RIGHTS
                                    write(fd, "0 0 1")
                                      opener had CAP_SETFCAP -> allowed

And the check only happens for a map with an extent that starts at the
parent's uid 0, and only asks for CAP_SETFCAP over the parent.  But the
root user of an ancestor can be mapped into the parent at any uid, and
the parent's own root user can be the root user of ancestors further up.
A task without CAP_SETFCAP that unshared a namespace, which a privileged
task then mapped "1000 0 1" for, can unshare again and map "0 1000 1":
host uid 0 is uid 0 of the new namespace, and nothing was checked.

Find every ancestor whose root user the new map contains, at whatever uid
it has in the parent, and require that the opener and the writer both
reach the topmost of them.  A task outside the namespace that is being
mapped needs CAP_SETFCAP over the parent, reaching that far by
cap_setfcap_level().  A task inside it needs CAP_SETFCAP there, and
ns->setfcap_level has to reach that far: a task in the namespace that
gave up CAP_SETFCAP would otherwise map uid 0 and get it back from
execve().

This only affects maps that contain the root user of the parent or of
one of its ancestors.  A write by a task without CAP_SETFCAP to a file
opened by one with it, and a map by a task whose CAP_SETFCAP stops short
of the root user it passes on, now fail with -EPERM.

Fixes: db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/user_namespace.c | 87 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 7bd3692c2f3e..db078dd6406a 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -881,15 +881,55 @@ VISIBLE_IF_KUNIT int uid_gid_map_sort(struct uid_gid_map *map)
 }
 EXPORT_SYMBOL_IF_KUNIT(uid_gid_map_sort);
 
+static bool map_has_id(struct uid_gid_map *map, u32 id)
+{
+	struct uid_gid_extent *extent;
+	int idx;
+
+	for (idx = 0; idx < map->nr_extents; idx++) {
+		if (map->nr_extents <= UID_GID_MAP_MAX_BASE_EXTENTS)
+			extent = &map->extent[idx];
+		else
+			extent = &map->forward[idx];
+		if (id >= extent->lower_first &&
+		    id - extent->lower_first < extent->count)
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * The lowest ->level among @parent and its ancestors whose root user @new_map
+ * maps, whatever uid that root user has in @parent; INT_MAX if there is none.
+ */
+static int map_root_level(struct user_namespace *parent,
+			  struct uid_gid_map *new_map)
+{
+	struct user_namespace *p;
+	int level = INT_MAX;
+	uid_t id;
+
+	for (p = parent; p; p = p->parent) {
+		id = from_kuid(parent, make_kuid(p, 0));
+		if (id != (uid_t)-1 && map_has_id(new_map, id))
+			level = p->level;
+	}
+
+	return level;
+}
+
 /**
  * verify_root_map() - check the uid 0 mapping
  * @file: idmapping file
  * @map_ns: user namespace of the target process
  * @new_map: requested idmap
  *
- * If a process requests mapping parent uid 0 into the new ns, verify that the
- * process writing the map had the CAP_SETFCAP capability as the target process
- * will be able to write fscaps that are valid in ancestor user namespaces.
+ * If a process requests mapping the root user of the parent ns, or of one of
+ * its ancestors, into the new ns, verify that the process that opened the map
+ * file and the process writing the map had the CAP_SETFCAP capability as the
+ * target process will be able to write fscaps that are valid in ancestor user
+ * namespaces.
  *
  * Return: true if the mapping is allowed, false if not.
  */
@@ -897,42 +937,43 @@ static bool verify_root_map(const struct file *file,
 			    struct user_namespace *map_ns,
 			    struct uid_gid_map *new_map)
 {
-	int idx;
 	const struct user_namespace *file_ns = file->f_cred->user_ns;
-	struct uid_gid_extent *extent0 = NULL;
-
-	for (idx = 0; idx < new_map->nr_extents; idx++) {
-		if (new_map->nr_extents <= UID_GID_MAP_MAX_BASE_EXTENTS)
-			extent0 = &new_map->extent[idx];
-		else
-			extent0 = &new_map->forward[idx];
-		if (extent0->lower_first == 0)
-			break;
-
-		extent0 = NULL;
-	}
+	int level;
 
-	if (!extent0)
+	level = map_root_level(map_ns->parent, new_map);
+	if (level == INT_MAX)
 		return true;
 
 	if (map_ns == file_ns) {
 		/* The process unshared its ns and is writing to its own
 		 * /proc/self/uid_map.  User already has full capabilites in
-		 * the new namespace.  Verify that the parent had CAP_SETFCAP
-		 * when it unshared.
+		 * the new namespace.  Verify that it still has CAP_SETFCAP
+		 * there, and that the parent had it when it unshared, as far up
+		 * as those root users go.
 		 * */
-		if (file_ns->setfcap_level >= file_ns->level)
+		if (!file_ns_capable(file, map_ns, CAP_SETFCAP) ||
+		    file_ns->setfcap_level > level)
 			return false;
 	} else {
 		/* Process p1 is writing to uid_map of p2, who is in a child
 		 * user namespace to p1's.  Verify that the opener of the map
 		 * file has CAP_SETFCAP against the parent of the new map
-		 * namespace */
-		if (!file_ns_capable(file, map_ns->parent, CAP_SETFCAP))
+		 * namespace, and as far up as those root users go.
+		 */
+		if (!file_ns_capable(file, map_ns->parent, CAP_SETFCAP) ||
+		    !cred_setfcap_reaches(file->f_cred, map_ns->parent, level))
 			return false;
 	}
 
-	return true;
+	/* The file may have been handed to someone else since it was opened,
+	 * so the same goes for the process that is doing the write.
+	 */
+	if (map_ns == current_user_ns())
+		return ns_capable(map_ns, CAP_SETFCAP) &&
+		       map_ns->setfcap_level <= level;
+
+	return ns_capable(map_ns->parent, CAP_SETFCAP) &&
+	       cred_setfcap_reaches(current_cred(), map_ns->parent, level);
 }
 
 /*

-- 
2.55.0

