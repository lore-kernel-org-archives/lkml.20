Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B793B6BF4;
	Tue, 15 Sep 2026 12:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475995; cv=none; b=kRn9PmmeYSMfhNmXdDFavoSc+g1JTLmRj75JJEnklYrMiOgzW6f9OAnAQKFh4EEkxbL32pB2O0xEpxmGqD0JUnvnx5A95iVvhlmoUyPiKfq5VIcqrhQl5WIW/R/l9ElMYuHPyc58C1qx0omTxMQIhnxMLlGoIcVcyy+hBkOXLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475995; c=relaxed/simple;
	bh=Egakq25gJHXak7LQY+RvqVAB11rZnHQIMgMrzAVXNFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HbW3gDX9ilOVPQvBSk6GiTkSdtIKha/GN433zkZZ//YdUiU3nUPBJ5ZGCFzlcsYWSFs98+SHMvbmbPu8AQnNDGmNieyBBJShk4ocyWRxvnJyO8xvpKBy79Nf5I8UnSWYwIM79xZSapODitMvn7KswOkxCcWX1J2alJOXUu3E8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IB2omJI2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IB2omJI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EBD1F00893;
	Tue, 15 Sep 2026 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789475994;
	bh=CwbRfgd9dCZvkwIasjy8dmwPwy2Eynj7KtzOQj5ZzZM=;
	h=Date:From:To:Cc:Subject;
	b=IB2omJI2R+o+j8lxKswhkpaXw0QTrkihl77TNs5lOOUcHvD5RvKv4CMssR2YfzBwg
	 uA61lUBHeaXngXUbgJ5Zv8R15LUOzfnYMauhhEMncyrbYxOpprNHrdbHzvie7tWu0u
	 tojCGLAu1vT7lg183QTx3V+g/muIiDZhpPYz/vtCvNZaAxyYxhk5EC5umPFojuN9Lp
	 HvmMg/E4klAB823Mf2E9zirfaKV+j2Aewkw4xXaHsWGGBkqj9ZmySJVWsJTVWhI4ff
	 BVlyNUjk2L4AlS8hg7n+iOIAhs5Feg6sfMgY0vwNR9XsMXHbs6xR0iU1Y61CzRFmCR
	 eFxtqhDChv/nQ==
Date: Tue, 15 Sep 2026 13:39:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <aqk8lgbBXNArYeia@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3y3XF04vbQKK4b/n"
Content-Disposition: inline


--3y3XF04vbQKK4b/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build
(arm64 kselftest) failed like this:

  CC       acct_syscall
  CC       cgroupstats
  CC       taskstats_fill_stats_tgid
  CC       breakpoint_test_arm64
  CC       step_after_suspend_test
  CC       test_cachestat
  CC       wait_inotify
  CC       test_pids
  CC       test_hugetlb_memcg
  CC       test_kill
  CC       test_cpuset
  CC       test_kmem
  CC       test_cpu
  CC       test_zswap
  CC       test_core
  CC       test_freezer
  CC       test_memcontrol
  CC       clone3_clear_sighand
  CC       clone3
  CC       clone3_set_tid
  CC       clone3_cap_checkpoint_restore
  CC       proc_filter
  CC       unshare_test
  CC       close_range_test
  CC       coredump_notify_signal_helper
  CC       coredump_socket_test
coredump_socket_test.c: In function 'coredump_socket_coredump_thread':
coredump_socket_test.c:677:35: error: implicit declaration
of function 'get_peer_pidfd_thread'; did you mean
'get_peer_pidfd'? [-Wimplicit-function-declaration]
  677 |                 fd_thread_pidfd = get_peer_pidfd_thread(fd_coredump);
      |                                   ^~~~~~~~~~~~~~~~~~~~~
      |                                   get_peer_pidfd
coredump_socket_test.c:752:17: error: implicit declaration
of function 'crashing_child_thread'; did you mean
'crashing_child_memory'? [-Wimplicit-function-declaration]
  752 |                 crashing_child_thread();
      |                 ^~~~~~~~~~~~~~~~~~~~~ crashing_child_memory

Caused by commit

   b956027e73bee (selftests/coredump: check the dumping thread's pidfd)

I have used the tree from next-20260914 instead.

--3y3XF04vbQKK4b/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpPJUACgkQJNaLcl1U
h9Btqgf/Z9ElleHfyVBtUQW7D/Bxrr2/kmm8qWdKCUOremTzzs/c5zq0czuzBtQ0
sQ2EcUHDPN4lrusAjtmxgm3N10guHjPt0TpIpvm3KEjYUkm88Ki2VIiwVUhyuINf
UVi1fiDoECu/FSAn4xow6TNoC7FQVBWwaokkjJzyKhYUV9fQnq7GGdUP1rrIJAoJ
/rDf28zVa7gWixrMyKoZNm2dgQT+JS5LwujgJb7PzHYD5Xun3dpy3c/v7UVfAGMt
YGG4QyQNEs6tMraKRwwm5Ol0vlcPEAEihd/lHZSiCWxFzq3cZCk1W6bjEwrQPH13
Q7xqxNM4N66NfGtLmOBZLVdH6KrjVw==
=0VmY
-----END PGP SIGNATURE-----

--3y3XF04vbQKK4b/n--
