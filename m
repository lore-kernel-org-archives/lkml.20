Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195262;
	b=HdapZp3OpwgrElYjxaGLk2mmkIaZoc86vjgFpq9T7C2pkKfpAl1/GBCEIf1tCf/pUhH3
	 eV6lTH5Yys4RYW/Dfz3HCQanfQbIYsRgqAyC0j/WAf0OpHrmKC5c65mW2L5CrGZo5HPnl
	 T+QlbEqrA/Lbrr36ljU/t02p1iCz5kS4CGr/Ne/XLP8IjCDDE/Qv93w5lvtSf+96gZwq4
	 b7IRMRUczdAZzOboUSb/BxcTKyY7kiwAJSFReZMo7uKQh6tqliDZmszEhBN2Ddi78NhKm
	 CKYWqP5oYC1KPz3eV4Wm/nSUlcZr012L3fo5OXDNU54+URVNWcor2zZvHWTYWgz7Vtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7g2SJ+wOfq9sRV8snpEm8KQlGKS1nPNyY3GC+DoZQY4=;
	b=1BB9FPI/rbSVtQVl19qlp68zd9Q2HEvsad+MHX933WrDJ8qeRWqE/x0i68+E8LCw+QXe
	 YWeWGmqk719Op15eioTu9/Cl5kRedqj1/Q6+rsTga/RseTmOq32VVkgygeCaUD67hcVTQ
	 jDhurKIWHNXy1li+QsPITSGbTcV7OuSlb6f7X1wujrIwXSMeshAZiCdRpWBUnw0w3eZ0V
	 ANeC5vSoYmWHitik9ls+2dPompcR0gs+5Dbu7IZalayvrOhTV5RM4rjrilp+Pcmt4JzvB
	 2EsOsgzBCNI4yKEC5LbdqukOPXMauRXju2KW2ViZnhZ3YPD9V/wboRbxxIXi0qukjuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MbVHe/tr";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA96606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MbVHe/tr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so11957755e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195260; x=1793800060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7g2SJ+wOfq9sRV8snpEm8KQlGKS1nPNyY3GC+DoZQY4=;
        b=MbVHe/tro9g1wXs57VqA0jvP4MOx9hxzYUPS3zpcoXrvK3Mw8iig12z5c+XzqiEz1P
         QVzp5bn9Dup3gduPxZWVSfKuLpZnxyVPXQ3zQIWzYIKINE79/zvdTJ8J6NxrFO+CJcE0
         +CZOftBiPauH72KgCXkms4zKD9r3ZSxT2J8SfHcSSyN8JtPfYw9MReDEkY9qVQ7IItyO
         rYmaWSdA4BGtXWpOECMySSuay4lLF220gmkjRmBoUjnchQFsXCWsJ+NrWcknyUCEtHOe
         yd28p9AL8OETjciC8rL2bGVvd6c0KVotwCiJeE2MP4mUr76Vt0INTrB29oUWO8Lq7dBP
         NHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195260; x=1793800060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7g2SJ+wOfq9sRV8snpEm8KQlGKS1nPNyY3GC+DoZQY4=;
        b=Nhu2S2ZHy2khbK2kfs12GQYJzSZ/3Z2nO8avQ3pN2L/3JiQh/nfVHjKzZQZRlWt+8M
         oj4Lu4rn5P+GWkdQryd5gOhaG3CODP7C3xxs21LglN1Bxnkwo6am9Zn8kRaQJadKcjXo
         BQiwyGzJW/hq6vD65i2WBebH8fBUv0ZSdoTmvhvMZIbtKnJlO4DSESu7CgtzZs6oeK+K
         HoNDh4FiEJ6v2jUPzFbjMO1tSBM8JfY2F6N/6T34cvAYc/CCg4BqWCi3uvzLFwdFveal
         ymWECsWfI4OcdzfQ2QJTQhhz0PiQNVf/N9O9U6IZ3wmcitP023DY6GgLyc7j8sL4NShU
         8vJw==
X-Forwarded-Encrypted: i=1; AKwUvBx7uteovme9JRpca8f7MqFh8RD9xS2G/SfRT82CCqlbmZAp4HDEexL9UP5mU9lz5oTNV5SFWDNkF59UfHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH48JzjCixQN8EHkAu+JhJnLRk6aFVFYI4dvUXrGCaToHggcKV
	MqMICG9YV9TPehLWiZZ5HUdWpzovxA8IikhRSxWRLgPy1KBYlKq152nz
X-Gm-Gg: AYBFou364EblBYdsRIkIAmFvvs5MsoPbfUpQMQIuiPAbB1+04PMwed0jvTGpM4KyVr6
	tMkATCFJFtlZMix801nZEqn7vovsLNX5d3gdGVNfffsIStl8ikeIps/LGYcc7WBsbUsahtII2bs
	KTtl0snPaNtCGVIWjvWzm6CSl+FnNeSLJeozTAhMxl52geFvdLAmPjOEP5qaUQUhYADSe7W3k4k
	ymCPTjnT9ygg3LT1ij7NyIyDWphxLOhAtP1+gYlkkwZInT1WPdpNIrRktIPou5CU4sxzlhIznXw
	k4VixcNkQN4ab5XAxKDZLASoPI2uGSenOrBOL5ed1Qx9wtmLeOkSPRVHXh/mHHgeXMe+0vZpPJz
	sHzZ01x1CM2ToJAvAVLfGt9LafBh57TmS+OUbcYlFSCQhxqfqgf4DSb435QhRxsi30tkUnrXr2u
	41OHAJTygIssjIktzJs/rHWUEcrZJNWe4UiXSTqR41Cm3n8ppOp/clzx4jTwD5so1E1zTShEUSy
	UCqY1rcH/7x5Jyt/C+mzeSXkMZE6VhFwHH46wbCbRHQht6Q+f0tPda6Ag8LJRcOS4ZWCziKS6uL
	ymixtNBR+lkGLD7owoRJAnHa6A==
X-Received: by 2002:a05:600c:621a:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a996b9812emr41947295e9.8.1793195259973;
        Wed, 28 Oct 2026 06:47:39 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29077715f8f.12.2026.10.28.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:47:38 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chris Mason <mason@kernel.org>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v2 0/2] add provenance time (ptime)
Date: Wed, 28 Oct 2026 14:47:26 +0100
Message-ID: <20261028134728.294127-1-koray.fra@gmail.com>
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

This is an initial implementation of a new timestamp to indicate the
time when a file/directory was initially created.

This patch series takes inspiration from the one by Sean Smith
<defendthedisabled@gmail.com> [1], but using
file_setattr()/file_getattr() as suggested by Darrick J. Wong
<djwong@kernel.org> in [2].

The semantics of this new timestamp should be at least these:
- it should be the same as btime on a newly created file
- it's user-settable, so it can be preserved for backups, filesystem
  conversions, archives and any similar operation
- it should be preserved every time mtime gets preserved

and the correspondence with the other timestamps is as follows:

ctime <-> btime
mtime <-> ptime

Examples:
1) a .zsh_history file created in 2019, then after a few years the user
   decides to switch to another filesystem, copying the .zsh_history to
   the new home, in that case btime would have the timestamp of the copy
   and ptime would have the 2019 timestamp (just like mtime would have
   been preserved)
2) a symlink created in 2020 from the home directory to a /path going
   through the same process as the .zsh_history, in this case it would
   also make sense to sync the ptime to the 2020 timestamp instead of
   keeping only the btime (so the inode creation time).

The proof-of-concept code (for testing) for stat(1) and cp(1) is
available at https://github.com/koraynilay/coreutils (master branch)
(Note: these coreutils code changes are a prototype and won't be
submitted upstream as-is, but they work as expected in simple stat and
cp -a/--preserve=ptime tests)

Lastly, the name "provenance" and "ptime" are not final, I personally
don't have a strong opinion on any name, but while testing with stat(1)
I noticed that "Provenance" is definitely too long for the normal
output, so another option which would fit well is "Origin time",
abbreviated as "ntime" (OrigiN time) and not as "otime", as that would
conflict with btrfs' internal naming and create confusion.

v2 changes:
- fix permission bypass leading to ptime update on immutable and
  append-only files (found by sashiko[3])
- normalize ptime timestamp as done in fs/attr.c:notify_change() (found
  by sashiko[3])
- fix wording in vfs patch to be like the cover-letter

Thanks.

[1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmail.com
[2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
[3]: https://sashiko.dev/#/patchset/20261027220532.736352-1-koray.fra%40gmail.com

koraynilay (2):
  vfs: add provenance time (ptime)
  btrfs: add provenance time (ptime)

 fs/btrfs/btrfs_inode.h          |  4 ++++
 fs/btrfs/delayed-inode.c        |  6 ++++++
 fs/btrfs/inode.c                | 17 ++++++++++++++++-
 fs/btrfs/ioctl.c                | 12 +++++++++++-
 fs/btrfs/print-tree.c           |  1 +
 fs/btrfs/tree-log.c             |  3 +++
 fs/file_attr.c                  | 29 +++++++++++++++++++++++++++--
 fs/stat.c                       |  2 ++
 include/linux/fileattr.h        | 27 ++++++++++++++++++++++++---
 include/linux/stat.h            |  1 +
 include/uapi/linux/btrfs_tree.h |  3 ++-
 include/uapi/linux/fs.h         |  8 +++++++-
 include/uapi/linux/stat.h       |  7 ++++++-
 13 files changed, 110 insertions(+), 10 deletions(-)


base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.56.0

