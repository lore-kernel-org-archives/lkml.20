Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A68B4FECE9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188422; cv=none; b=HjheHvnDaD6kUAPDrvF/0gxBTViN91pbgf8iGape5MPDKYRCQ3gWexveeuM8Km2mXALrtTkfwdrRNX1W9kJezeIQx6ylmjfdqinakRLt1RE6cEeiUgAYB89wV2g/zYE3Nx0DUjmsChgNMOVCNh+DoYg3+IKDj7BVsXIX4FOv/JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188422; c=relaxed/simple;
	bh=fPvKQuDavmYJkKbFES3kYx/V3SZddiqGrWAf9c0rtvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOb/lO69VIPP52bV04VaCUNKNoDACiwNX3OhJpN+FfCbWSKZ/flhvs26W1fL4sJ9KJICC3tEfrnBUCRqPRhq5j/GwpVDx9QI7JY2O3Au7/Kp5Dmi7Qr3fEx4NxPNgFxUASXcDLoRm71Xq0RQ+NPAzqq6vyqPyb+dxC2ZFKRJ8CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrN7h+zN; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrN7h+zN"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-85aeb506b78so45714617b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188420; x=1788793220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9vg9u75aczYS2NdokKyQvYBzY1IUPtCFLk4j1zgxQI=;
        b=lrN7h+zN+/T3izk1jddtcvNzFhT/58FdaKvN7kxOYh1avtFZOzoE6g48uXPKNH7Rcy
         HLXeVYwLJ08nrALkdQhQgQEqEFCGaROxV2hCf4527rEOvhOBSblg8Eaj6dTVRVjjH9ve
         k/ntKYu+O3ZOdJ4n4nXDm8hVq9HxDoXjcIw+v7zx7wFriGr72CmHDz35MbS8HNoII5ZY
         8PyKR4/NurYfYDDmqj7gcrD8D/hjIbU7tB6vIElmbm15WP9vbNG1/jWxhPyOxCjOHTky
         HZvDc75B69/XihDxNbrH27nekxIt0kfYO/tsUNVBlFQgdU+uRfNoNQw2SJszQi4TwzRU
         8Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188420; x=1788793220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9vg9u75aczYS2NdokKyQvYBzY1IUPtCFLk4j1zgxQI=;
        b=S8zP2wKUku4tKm2YQqHxvSLfpvSbx8tg+1V+BU69hL1uMXajdjhQFoOpJ2hnE/3qeP
         SEtqBYi+I839koVCskwlM/7JdiSpRmtMxmOE/qTfpQ+vbhhRVHrLnV3JtaUJEQH/aJ14
         nBs94DoQXGQK4T8IR+gWdIavSmGb5UbpZh5gRqKYaJPXyNkwREbqfN4eq77V6dD+Inkf
         fGRLRh6hJlfH2gOnpMFtRRhBQQTDza0JM2eEP+Xo754AoHdqRT49p+2apHnXvwj12TSQ
         jFDfSP2VzPox/DHy4h4FVTMNdVhxacy+cWdgBWpfs/s+KzKUUI+dcBGc0ef+34JUgrzR
         XPnA==
X-Forwarded-Encrypted: i=1; AKwUvBzP2sp1CH8lNk723hxQjhU37Nz/gQwLG1WaUEsy+iJAXyWvVxPQD+kjkz8kvg6E67ea40vEIFPfMeXFyZg=@vger.kernel.org
X-Gm-Message-State: AFuF++nwjqoweO1Gxx8QWXB/xOF1aoT2FUzX7T23xMDDoUT9PwkrsFoH
	NtHikSf4dbf/N84pok2FB5vMKBIisagYSPLzMDDYz/6lX++8JfkPa8/7
X-Gm-Gg: AYBFou2LnK+xpDdfXtzdPffBR07GH/DBMIdM+nBQcs8T3TgPVDaDpz/YHVp4tko74NV
	/aHaClBuuZLMIx2BR4tfonCOVL3PyWc/iGKtFcdnWG21Zyu5aU0P7Rd0+PhwH8eB+WMOb7UXGxk
	IOJ10nlA1LzUzztNghO0fE9mAUmVSet8ggJPA/VIWCVH+DnOZluZcBaHwI0wNtAN6HJDJjL08Tp
	ssoGfEHcORArK0bBCPs1hVSPF+o/umL2wKDECoDb90Ggy4UI8/jtAxu7iD/h9jlxHZhzA+O8v2g
	c+XA0lVA0cWhD1321gbuiRsrs8HpaVqKjL3BhJFUVv3j7txTKWxaU+z6DM83B8jpbUQXzV1gG+J
	MF7KMCEmOHid6YX7oJO7tz4/j6g385kIlMgRkstR9XiB2Qo+IWTTOfe1t5xOUpVjRQSfOwVpgyz
	DX6aVvuojezfuxZYzKfVH1K6GHvSvpc5W8EX5r+l7/ltdXHnf2GRd3ANcF1oP140YDJeczckSh1
	iz+bIJsOoirt4zqlA/A47w=
X-Received: by 2002:a05:690c:c3f1:b0:81e:98d3:cac7 with SMTP id 00721157ae682-8686f52fe19mr6867327b3.12.1788188419607;
        Mon, 31 Aug 2026 08:00:19 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f6fc:b424:b1bb:6ff0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm53903827b3.0.2026.08.31.08.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:19 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	paul@paul-moore.com,
	mic@digikod.net,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	kees@kernel.org
Cc: gnoack@google.com,
	jack@suse.cz,
	song@kernel.org,
	yonghong.song@linux.dev,
	martin.lau@linux.dev,
	m@maowtm.org,
	bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: [PATCH v2 08/15] lsm: Document the LSM policy object interface
Date: Mon, 31 Aug 2026 10:58:50 -0400
Message-ID: <20260831145858.3869191-9-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831145858.3869191-1-utilityemal77@gmail.com>
References: <20260831145858.3869191-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the split of responsibilities in lsm-development.rst: the
LSM framework owns the BPF-facing kfuncs, an LSM opts in by embedding
struct lsm_policy_object, tagged with its lsmid and an LSM-private
type, and implementing ordinary LSM hooks, and the lifetime contract
those hooks must satisfy comes from BPF's execution model.

Cc: Paul Moore <paul@paul-moore.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 Documentation/security/lsm-development.rst | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/security/lsm-development.rst b/Documentation/security/lsm-development.rst
index 5895e529da7f..190d9b8f2346 100644
--- a/Documentation/security/lsm-development.rst
+++ b/Documentation/security/lsm-development.rst
@@ -15,3 +15,52 @@ see ``security/security.c`` and associated structures:
 
 .. kernel-doc:: security/security.c
    :export:
+
+LSM policy objects and BPF kfuncs
+=================================
+
+The LSM framework implements an interface for individual LSMs to
+expose their policy through BPF kfuncs and kptrs. An LSM may not
+export any kfunc or other BPF interface directly.
+
+An LSM opts in by embedding ``struct lsm_policy_object`` in one of
+its own objects, setting its ``lsmid`` to the LSM's ``LSM_ID_*``
+value and its ``type`` to a nonzero value of the LSM's choosing, and
+implementing the policy object hooks (``policy_object_from_fd``,
+``policy_object_get``, ``policy_object_put``, and per-operation hooks
+such as ``bprm_apply_policy_object``) like any other hook, resolving
+the containing object with ``container_of()``. The ``type`` namespace
+is private to the owning LSM, which uses it to tell its own policy
+object kinds apart; the framework never interprets it, and 0 is
+reserved as "unset".
+
+The kfuncs, defined once in ``security/bpf_lsm_kfuncs.c``, dispatch
+each call on an object to the single LSM matching its ``lsmid``. The
+fd translation has no object yet: the framework offers the fd to
+every ``policy_object_from_fd`` implementation in turn, and an LSM
+declines a fd that is not one of its own with ``-EOPNOTSUPP``; any
+other error fails the translation. A program that expects a policy of
+a specific LSM can read the returned object's ``lsmid``. Either way,
+a BPF program reaches an LSM the same way every other kernel caller
+does, through an LSM hook, while the BPF verifier tracks the object
+as a referenced kptr.
+
+An LSM opting in must satisfy the lifetime contract that BPF's
+execution model imposes: the containing object is reference counted,
+``policy_object_get`` acquires with inc-not-zero semantics and fails
+once the count dropped to zero, ``policy_object_put`` may be called
+from contexts that cannot sleep (map destructors), and the object's
+memory is freed only after an RCU grace period, as programs load
+policy object kptrs from BPF maps under RCU. Hooks for operations an
+LSM does not provide are simply not implemented: the corresponding
+kfunc then fails with ``-EOPNOTSUPP`` at runtime. Whether the LSM
+providing an operation is built in and active is likewise a runtime
+property: the kfuncs are always registered when ``CONFIG_BPF_LSM`` is
+enabled, so BPF program loading is independent of the boot-time LSM
+configuration.
+
+.. kernel-doc:: security/bpf_lsm_kfuncs.c
+   :identifiers: bpf_lsm_policy_acquire
+                 bpf_lsm_policy_apply_bprm
+                 bpf_lsm_policy_from_fd
+                 bpf_lsm_policy_release
-- 
2.55.0

