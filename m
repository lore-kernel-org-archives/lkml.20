Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5A3B388C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622399; cv=none; b=gm0Ou6XBv6x72P5ayCITSyUVP0cXTOXOYYlkzZzomoArnz4qf0uyo8nnkZ6c+19LPDOxfyM/Zb65QxB+Aa2PZLLa35FNwx7iyucQQJYjMXEfLWrRaZHlEQnAGHX3uWSZZ38SJiorOETM0Bn7lzpMykLH9dpaSz5Z0iziqAEKup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622399; c=relaxed/simple;
	bh=lA4VVckwZyDUviaHA5qDSJSGW+JBfmccZu+VKDJm210=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyjyrKcaD1TZW1g+VGfRrz0TBbEx8LV/D2+piKNL0KALK8Jznl7lXeW15GeTGlESOhWDQjyANMZAZO/IdPM2ExCxOACWFFuW2DclhRcOAjttByt6UqZYcelEo3Ea/K1YngIdZ9hnO53BAWS16AFl20A7ef3jedmHl39pINItA40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlnuLsKs; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlnuLsKs"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c83397eeeeso2351857e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790622397; x=1791227197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=37h0dgQHnE/SfMF6D6xYZ3lFDCaYhtl79yfdJkjwAFE=;
        b=XlnuLsKsUlHngx50nCbN0IoSWTn0S0fGv1eRKIJG+SSI7UpaE1/k/zrlVsm0LlK0IW
         yPtoE2NXZVpETS7uvWpc4bL8Lu3lXsUkMifMnW4d6Z0Rye/7/MOpzVCpgrQQ7jLHEvCW
         AeXX7ZqhrOnRqatchQhaHnkw5ljs6trjMsPxbe1nYW+Iembk6pYjOXCwDH59RFMqjM9S
         njnGm99GlEClLpDkC+N7rei4AHKy8DvW0WogqZMd4tGcUZCJGRWw2uSaxQPGM5/2OMwJ
         /IvNfgFRROEyxBho32MV/xcwLZTkpSh4wdAQQYv1MGRjd7JfYLdRpNgngUvems9bezFR
         yfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622397; x=1791227197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37h0dgQHnE/SfMF6D6xYZ3lFDCaYhtl79yfdJkjwAFE=;
        b=Cj+fUa0xWgmmUt8D/T4HIxeHo123wTkJy/7jvOobrfgDInGj6Y6Vm4MsOp5tJSzze5
         yWtzS3cd9tTUHEHrBFahhwbdoNFFL3bf6iN+yATXos0J/go3LDWRSgGkCwbel4K3wsY0
         SMmkdOmPyYMlZy0wXasmW2yHu/YDa+BZ8W7XmXmtg2f4Uf8EVJyavQtR7h4kg8/Uvzt3
         n87oKVnYEo6RzrqDJ9NsUrApR1os46lqFQwqNhTzFFa7QRfxei+61k8z/A3XUUynVHHH
         7aG1juAoIpnWwwu7HKVWHblen+ZYMTvvoMSRaM7BlbmF7S6ZM0iHXT2BZPoHz8kqOr2F
         PGzw==
X-Forwarded-Encrypted: i=1; AKwUvBytbakC/EK4zE1Qxs5AbDbWW/eACR2Aslszxk2RlxOS2PMN7ao8H4WKER1iL2QvkB7TpfyuWbTgkJfIOPw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXNrHKG//GhkpzJgyXWTkxzbmYe2b0v5wwJtHgCwAmWaenGWKa
	9RmdGzMFRC5d2lCgPfRIbbucLkhtLJEmm8pbmblV2xAhSC+wkecSB9Gf
X-Gm-Gg: AYBFou2TOYcAGSka1QvER3GlIfkG9gfgW6iWuco8DAv5YlEWi6xtxFSpwHAa3w0vMuf
	Yulh6xT29j+JSAvZfM+wiSZEuVIVhZPQOZuerOzayKpwC3ajpYyFnkcTYgRmNeyQl9In0QT0KgO
	vCcsZm8h9+3Q0enYYX56MqkgyuaDoKARo4pGyvrPU3IG5nDRHnP/wlTcaMqPxa8NofF7g3I4LI9
	A+PKiW11VsDLWUtLpfvyOE0fADjdyND4bjVmFVZ3tfwefvvtiW5K80hczZqf5bvJcQQUZlvm4TC
	e5Mwsi5CEOg7lqk7xzF7tyKYtJwodPq3D02jguf/4+0KN1av95QJVV4OA0li1LPGoPZ/u5OAoAi
	DH6HMsmWVS2pihCpfJRBiDkvNC68lxKpou4pqD+OCfP8sTJ6qXLyqnmtr1nPXXR0WkJjufw5jSe
	V31ZQ7LT7oG/voNJBZL0+fv3YbQFWEs+2J+xviZc4c1huFwvf9OnrSfVh0eHkjIsLp5n0lcdQX2
	KQ=
X-Received: by 2002:a05:6102:4b11:b0:7a5:e455:182f with SMTP id ada2fe7eead31-7af1dce60b5mr5365884137.26.1790622396723;
        Mon, 28 Sep 2026 12:06:36 -0700 (PDT)
Received: from adriano ([2800:300:6531:5ab0:8a1a:ad67:2d9c:5936])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b08b6fdsm8042370241.4.2026.09.28.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:06:35 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
	Georgia Garcia <georgia.garcia@canonical.com>
Cc: apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH] apparmor: resolve pivotroot paths before the failure audit
Date: Mon, 28 Sep 2026 16:06:20 -0300
Message-ID: <20260928190620.1154576-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

build_pivotroot() stores the new and old path names in the audit data
while it mediates a transition, but it returns early for unconfined
profiles and profiles that do not mediate mounts.  Resolve the names in
the failure path in that case before the audit record is emitted.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 security/apparmor/mount.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/mount.c b/security/apparmor/mount.c
index 4ed7b9136beb..cd869a07335b 100644
--- a/security/apparmor/mount.c
+++ b/security/apparmor/mount.c
@@ -698,9 +698,18 @@ int aa_pivotroot(const struct cred *subj_cred, struct aa_label *label,
 	return error;
 
 fail:
-	/* TODO: add back in auditing of new_name and old_name,
-	 * needs lifting of name lookup out of profile cb
-	 */
+	if (!ad.name) {
+		struct aa_profile *p = labels_profile(label);
+
+		aa_path_name(new_path, path_flags(p, new_path), new_buffer,
+			     &ad.name, &ad.info, p->disconnected);
+	}
+	if (!ad.mnt.src_name) {
+		struct aa_profile *p = labels_profile(label);
+
+		aa_path_name(old_path, path_flags(p, old_path), old_buffer,
+			     &ad.mnt.src_name, &ad.info, p->disconnected);
+	}
 	ad.mnt.trans = target->hname;
 	error = aa_audit_perm_error(label, AA_MAY_PIVOTROOT, error, &ad,
 				    audit_cb);
-- 
2.51.0

