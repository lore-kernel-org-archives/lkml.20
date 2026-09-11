Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10641B362
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110130; cv=none; b=cN3OsXtzmfgSKkLE4DF2Z4zNB94tPMXCEG2mJNuZaTOH5n3hv0+iLRrsDMb9KQBhG0MFiK9RuNvjffXlrpYUPLbylto3/wmPzTQAwkVxebS0ztKst6oEiOyft9oOVCENAT70mTYssefOx/A8azxrKj+KEIrPXs6ok7RbJ60FyTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110130; c=relaxed/simple;
	bh=P9jxrDpaV54ySC7U0tV00k06VLLWdkHZGIv12HwM76Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WFJgvII7nBEyCrPvkH63Rq3FPU1/C/Vejg53+Kq7TfKHisxEQFnB9soB7gZbDC6PCKAq6/xM/Ad9InEan/ZXKG/hjbpJtUS1i8xxhBu0DZpC9juSwg5G3AAMAK6k6gOnpUGBt6qJFDlKYdJo0cKk4dpT7z2vvjFazPiJe20307U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lu6LPUsU; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu6LPUsU"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca7c1176317so592416a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789110118; x=1789714918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzbEi/V1CwFrFrFwgvIKsmJKCXogoXWxxHQNHJL82hw=;
        b=lu6LPUsUXTvkcgKpWJkilaLlgYF8wSVoRgjR8RBWSPI1SvW4X8PRZSAsdnjHQgueiZ
         OQU28G0E9KZG0hTn7t8MtjpKv/++HWUKSpBwSeVMkgXIUjNbpw2cRzoDjnNcWN6Ed57K
         tXiTgoBgjbsdkEYWQ2YQxkMeYehOaYeA0+PD7lFujtnxjKHd8HA1/ogZxLHF/xMo9MYm
         Pgccqz3m2T+OForFRtIkRkCVPkT1SgUE9EySiIOuvKuELQ+MjcVqkBEhbo/xMZxoBwRa
         VduHRaTe/GCABGbaaH9KasaP4iJsLN8CEtAqyeGcrlyFJZqLE19RQCsV26vLycqJ2HkT
         6Taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110118; x=1789714918;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VzbEi/V1CwFrFrFwgvIKsmJKCXogoXWxxHQNHJL82hw=;
        b=F9EPsxIgPD4SH2iq6HtBXO9AUxR8BL0Uk7vxDXnzxsCRYdBFm/TwtacNb8Ey7hBMvM
         vW1/uPqF8CMznpm2A950m/eIR8IjhuWRFYHtdgdun7spmUjlBarVPFYCpejCBknraqK5
         qJBLKVYFAIQcPvRFVOz3TV3sg81ckXk2QCK6Pve7Pjq68Hv456rRFnq8KadEV2Im/NMM
         p31mYBB3gchb1iyRXPtsZOeRyzptf6tHIaWJiv8+KrmhYaugBGNFpsJcbYz8FrJMs9fg
         BTJZB4jkxwF73pPU4XoO5Bpu9zR49U0Q7tKyCIruAZ64r9m12TkZATE/nfpBCW1PkKBA
         Scmg==
X-Forwarded-Encrypted: i=1; AKwUvBzvMfh2IlGC44r+8KIBc2TBsvTfZ0RTA82MPiXX0TUrnBbTkopo40TcW+QdhbE2YtUqTZNqm3c52wW64bo=@vger.kernel.org
X-Gm-Message-State: AFuF++k2jTiYsIWK1FtoAEUsHf07+7AycFu2TCrZsMresLWlnk7rvEid
	aui1rDimyubvG8Y/T1vyV/0nSW8Z7ZIyF9TnfKFyop2Bo8zC7t9zW7xs
X-Gm-Gg: AYBFou093EdEch0bA13eVB5GshwauRItjVyP5YLng55sxHY1BhatOU1Hrx7IKKLryfS
	zlq0WjW+9ZkD9i+bXqZAzvsHfUiSbUYuSYC2nluXNYHCMkEX7om9vlQ3cmYbJ+mYP2xMB9xCUxo
	La8av6fUCT9UG2vV4m9M8423spswLtUpTmIcnx/DHxsYE4bYm7pbKHzpT/fhBHKqdLJgg0UvK7u
	THJeGd+HHW5eAz01qHEsSt+ED15uXHwvcHW5NdmDn371wYQbbp8nNzbDDfMjzVa37MQCZGdMfDd
	ZBToxP7mLO3G0ti/hjhYXi6byEIKQbYf01ImKE3E9eF10uw8e1OX3q8hNLiA64tae7/CeQzM4pU
	7Hr9s0JTPkIPhY+1uqe7k8XLhWT4CC2+ekX7K7L2W645Iv9rfOJzzOy212bGwAJIIfLFsNbTd1F
	inwxSngc3xQmZjzOkvIyJlNRMTuEqNwtqMcpPvTGC+kB0W5jlLvVP0HtqNmGZJP+UoUh9TzOnQ/
	Ezk1iNIAnXEh4qvRt34zVp0GobCKZdSq0Y=
X-Received: by 2002:a17:90b:1f8e:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39d9bd987a6mr4612505a91.6.1789110117795;
        Fri, 11 Sep 2026 00:01:57 -0700 (PDT)
Received: from localhost.localdomain ([180.101.244.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d950913a6sm3531349a91.6.2026.09.11.00.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:01:57 -0700 (PDT)
From: henrymei <ljp1205831794@gmail.com>
X-Google-Original-From: henrymei <henrymei@tencent.com>
To: dhowells@redhat.com,
	marc.dionne@auristor.com
Cc: linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aohan Mei <henrymei@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH] afs: don't re-queue expired servers in afs_finished_fs_probe()
Date: Fri, 11 Sep 2026 14:59:36 +0800
Message-ID: <20260911070146.3516452-1-henrymei@tencent.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aohan Mei <henrymei@tencent.com>

afs_finished_fs_probe() unconditionally re-adds server->probe_link to
net->fs_probe_fast/slow when a probe round completes, while
afs_server_destroyer() removes a server from those queues at most
once: after afs_remove_server_from_cell() sets AFS_SERVER_FL_EXPIRED,
every later destroyer pass early-returns and can never dequeue again.

If the probe dispatcher dequeues a server and dispatches an async
FS.GetCapabilities probe while the destroyer is between rb_erase() and
its one-shot list_del_init() — a window the synchronous
FS.GiveUpAllCallbacks RPC stretches to a full RPC round trip when
AFS_SERVER_FL_MAY_HAVE_CB is set — the completion callback re-queues
the already-expired server *after* that one-shot dequeue.  Nothing
ever removes the entry again; the call release then drops the last
reference and the server is freed via call_rcu()/kfree() with
probe_link still linked.  The next afs_fs_probe_dispatcher() run reads
fast->probed_at and writes probe_link/ref of the freed object:

    BUG: KASAN: slab-use-after-free in afs_fs_probe_dispatcher+0x520/0x640
    Read of size 8 (fast->probed_at, fs/afs/fs_probe.c)
    refcount_t: addition on 0; use-after-free  (afs_get_server)

Skip the re-queue (and the probe-timer re-arm) when the server has
AFS_SERVER_FL_EXPIRED set.  The test sits inside the net->fs_lock
seqlock critical section: the destroyer sets EXPIRED before its own
seqlocked dequeue in program order, so any finished-probe critical
section serialised after the destroyer's is guaranteed to observe the
flag, while an earlier re-queue is still removed by the destroyer's
own list_del_init().  Live servers are unaffected: an expired server
is on the destruction path and must never be probed again.

Fixes: f6cbb368bcb0 ("afs: Actively poll fileservers to maintain NAT or firewall openings")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Cc: stable@vger.kernel.org
Assisted-by: CodeBuddy:Kimi-K3
Signed-off-by: Aohan Mei <henrymei@tencent.com>
---
 fs/afs/fs_probe.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
--- a/fs/afs/fs_probe.c
+++ b/fs/afs/fs_probe.c
@@ -80,6 +80,16 @@ static void afs_finished_fs_probe(struct afs_net *net, struct afs_server *server
 	bool responded = test_bit(AFS_ESTATE_RESPONDED, &estate->flags);
 
 	write_seqlock(&net->fs_lock);
+	if (test_bit(AFS_SERVER_FL_EXPIRED, &server->flags)) {
+		/* The server is being destroyed and afs_server_destroyer()
+		 * dequeues probe_link from the probe queues only once, so an
+		 * expired server must not be re-queued here: the entry would
+		 * outlive the server object and the next probe dispatcher
+		 * run would touch freed memory.
+		 */
+		write_sequnlock(&net->fs_lock);
+		return;
+	}
 	if (responded) {
 		list_add_tail(&server->probe_link, &net->fs_probe_slow);
 	} else {
-- 
2.43.7
