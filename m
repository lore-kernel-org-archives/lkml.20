Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365482;
	b=gnhSNEbgI8D+CVarkq6lluisEieevotlWwlqvh5b7N4j+ozYPyvS5l5DKcnyPDyawAsO
	 9n99nJ/F7ygu//K7sCue9oQH9iagIqwD8k+EACG9tM+Z9+KsUumj8z0w7mXh0Lc69+9Oe
	 i8IM1nYEbNmkc2Gynrr9ayCi2qsfQ+LgrQvi81sawFTajn5Nbxn9NB7sldBgFezyvonJw
	 O7PWXG0QXYyxE2M1RoXjJVbqirC7/pSLP5t25wuWnvHONs4iF3myIBQ0Cn8B19X6OUwDU
	 z3Wdpi6i39cCWxJyJnGZOUdFbp7Wj2XQlV+mk4QDUwAupWKTQrQaTTDgWyjwVJX97DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365482;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=POJglWsOd0C3pzp1KN60odd/Wby87Y6g44OQ6dyI31A=;
	b=laHhEeXIoivUS8VHp5hQxBjVeWGnlRTnqFlkYGECTLJeOFVt+3vwCfBJk3qFpvWM4RZt
	 KeWQx7FsKiegt6EFulq+Ok1kt/e6pap3+tp3z3SrECeVTjXhK2gP73jajfnMEmmShRzmr
	 vRHlrPv/exr3YlkWf5D7u3fodw2BwUV3yZCokZ2RJbKs6Z4kAoAs6KB/spJ6UP1cjU/Si
	 gpIrjidB5zJ6HoEoetwepqq/LcmOS/rGVMJyFlDnL7qDmCe+wrpyMp98WNZ6SYYJ1LigN
	 NBwyqzyt2a/YRBzPaVOf61UxHP98CZmLnPQUkWF7wCmvPgR2MrC8BS3JTmhesK9PoxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xfLJVlIJ;
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55697606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55697606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xfLJVlIJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EpSYygeoVdwkuLHNVBx23+7itpMe9kwYUNbAO8Xzgoc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793365474; v=1; x=1793970274;
 b=xfLJVlIJW9381JwXITNssd4rld05UHaoHCbtzezH4i/H3e/p5qM3O0n6GFqHL8s+IPMtbXZ3
 TOsK6yDr9gTleDF8mK3oHQ9eh3PPXHEBSONUrrv+FBc9hR8Kdn3AkpjqdlP8Qo1JkIxpijD9mde
 eDOPIlAe44Wo02C0trDhQDfc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fac8c99ec764dbd3;
	Fri, 30 Oct 2026 13:04:33 +0000
X-Mizu-Trace-ID: fac8c99ec764dbd3
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tycho Andersen <tycho@tycho.pizza>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
	Andrei Vagin <avagin@gmail.com>,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 0/2] nsfs: gate pid-translation ioctls behind ptrace read access
Date: Fri, 30 Oct 2026 21:04:20 +0800
Message-ID: <20261030130422.738277-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
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

From: Tao Cui <cuitao@kylinos.cn>

The four NS_GET_{PID,TGID}_{FROM,IN}_PIDNS ioctls on nsfs descriptors
only check that the fd refers to a PID namespace; they never check
whether the caller may inspect the task being looked up.  An nsfs fd
is freely transferable (SCM_RIGHTS), so an unprivileged process that
receives one - the way container runtimes and LXCFS hand namespace
fds to less privileged helpers - can use these ioctls as a task
enumeration oracle across pid namespaces, bypassing the ptrace-gated
/proc files.  With hidepid=2 on the host, a measured run of this
scenario resolved every live container pid (the init and its
children) to its host pid.

Patch 1 checks ptrace_may_access(PTRACE_MODE_READ_FSCREDS) on the
looked-up task.  The errno (-EACCES) and the check itself mirror
proc_ns_get_link()/proc_ns_readlink() (fs/proc/namespaces.c) and
PIDFD_GET_*_NAMESPACE (fs/pidfs.c).  The legitimate holder - the task
itself, or a privileged runtime daemon such as LXCFS - is
unaffected.  The check is per-call on the target task, not at fd
installation: checking at open time would authorize every current and
future task of that namespace at once, which is exactly what must not
be granted.

Two residual behaviours are worth stating explicitly: ESRCH is still
returned before the permission check, so pid existence remains a
1-bit signal - the same residual pidfs and /proc carry today; and
with hidepid=0, translating a same-uid non-dumpable task now
fails, aligning nsfs with ptrace-gated /proc files.

Patch 2 adds a selftest with four checks: root translation of the
container init (lxcfs path), full denial for an unprivileged
receiver of the fd on all four ioctls in both translation
directions, a root-side re-check, and same-task translation.
Test 2 is expected to fail on trees without patch 1.

Tao Cui (2):
  nsfs: require ptrace read access for pid translation ioctls
  selftests: namespaces: test nsfs pid-translation access gate


 fs/nsfs.c                                     |  14 +
 tools/testing/selftests/namespaces/.gitignore |   1 +
 tools/testing/selftests/namespaces/Makefile   |   1 +
 .../namespaces/nsfs_pid_translation_test.c    | 399 ++++++++++++++++++
 4 files changed, 415 insertions(+)
 create mode 100644 tools/testing/selftests/namespaces/nsfs_pid_translation_test.c

-- 
2.43.0

