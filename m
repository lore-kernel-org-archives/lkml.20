Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A82F3B8BC4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790205287; cv=none; b=W1OluT7q+GxLmzpwBg5pJYlcC1DyLswRWKQNxoJfMBt3MRZ0U/hddqNxtUg5ISKEZR15cbPJLT1aJEdt635hSzfI0pjTQ1qtgn/MuPDN8KqefvZ7njdKunMOQEZGSDqXLQsB5U+UTihiTqKsa254Mr2KrmqHbCrW34A+o1kmyRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790205287; c=relaxed/simple;
	bh=EK51NjMzQHzwpR3piJOOqa0700+n87ImY+APSTHLnpQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j4ggpHe52xKQoykjBUiDnfOJVQNDEiSWWKgdXvmcKwhseWTDC5WXt1fExa6podPz8fU3WzNIzFKStj60Il4Z+rtkoMo2YmtR0GK2XyDght5R1LklCWHPHiVfrh6IifipXUaOaNoaD1Zbb6ct2Mx4B/UkJYe44Mhtzl5VDsyi4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwCaB5PB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwCaB5PB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6007E1F000FF;
	Wed, 23 Sep 2026 23:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790205286;
	bh=PunvAU+DlMDl9/ZMTsQFtHIX6hxmtTujipDeh0Nhe6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GwCaB5PBF3E1FC7ficVZunVcVFP0VTS4+2Bga9Zh/QWOyuH+hyzsTGLPyEMk96WMf
	 +kc/oK1keREe/0gQBuzQyoZq3CDbecwLRM8O5ySUTnSGYs3dHQt/PCXL+l3pnWCzBq
	 8v5YXQQoz+eqdXYFpCyp8o1nU7W1tw2hhUZEdsZJx03gNAcoNu+/pHkyJUyiL7aMBM
	 G0y2Nxbed1B9b5RMeUi6BRWNr3yCLvxgYDZr4S9Xu2xYatq12zK0sn/yBPtbjplq5S
	 /jp8m9DH1r6h8OKTYOgvj3UBZI5WVdk9hcvn/8OeJLddtZZzBqRBs9kQ3fI0ky1imT
	 UdSPO5heLxLVw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 6/6] selftests/liveupdate: add tmpfs kexec test
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "David Matlack" <dmatlack@google.com>, "Hugh
 Dickins" <hughd@google.com>, "Samiullah Khawaja" <skhawaja@google.com>, "David
 Hildenbrand" <david@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Alexander
 Graf" <graf@amazon.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20260923224408.3745689-7-pratyush@kernel.org>
References: <20260923224408.3745689-1-pratyush@kernel.org>
 <20260923224408.3745689-7-pratyush@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 23:14:44 +0000
Message-Id: <20260923231445.6007E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] selftests/liveupdate: luo_kexec_tmpfs fails on persistent rootfs
--

commit 656981de91db4b31da49ddcf77d65f446841090b
Author: Pratyush Yadav (Google) <pratyush@kernel.org>

selftests/liveupdate: add tmpfs kexec test

This commit adds a two-stage kexec test for tmpfs preservation. The first
stage creates a tmpfs mount, creates a file, and preserves both. The second
stage retrieves both and verifies the contents.

> diff --git a/tools/testing/selftests/liveupdate/luo_kexec_tmpfs.c b/tools=
/testing/selftests/liveupdate/luo_kexec_tmpfs.c
> new file mode 100644
> index 0000000000000..608a6eddbd7ba
> --- /dev/null
> +++ b/tools/testing/selftests/liveupdate/luo_kexec_tmpfs.c
[ ... ]
> +/* Stage 1: Executed before the kexec reboot. */
> +static void run_stage_1(int luo_fd)
> +{
[ ... ]
> +	ksft_print_msg("[STAGE 1] Mounting tmpfs at %s...\n", TMPFS_DIR);
> +	if (mkdir(TMPFS_DIR, 0755) < 0)
> +		fail_exit("mkdir %s", TMPFS_DIR);

[Severity: Medium]
Will this fail on test re-runs if the directory is left behind from a prior
run?

> +	if (mount("tmpfs", TMPFS_DIR, "tmpfs", 0, NULL) < 0)
> +		fail_exit("mount tmpfs at %s", TMPFS_DIR);
[ ... ]
> +/* Stage 2: Executed after the kexec reboot. */
> +static void run_stage_2(int luo_fd, int state_session_fd)
> +{
[ ... ]
> +	ksft_print_msg("[STAGE 2] Attaching the restored mount at %s...\n",
> +		       TMPFS_DIR);
> +	if (mkdir(TMPFS_DIR, 0755) < 0)
> +		fail_exit("mkdir %s", TMPFS_DIR);

[Severity: Medium]
Will this unconditionally fail with EEXIST in run_stage_2() if the underlyi=
ng
root filesystem is persistent across kexec?

> +	if (move_mount_empty_from(mnt_fd, TMPFS_DIR) < 0)
> +		fail_exit("move_mount of the restored mount to %s", TMPFS_DIR);
> +	close(mnt_fd);
[ ... ]
> +	ksft_print_msg("[STAGE 2] Test data verified successfully.\n");
> +	if (luo_session_finish(session_fd) < 0)
> +		fail_exit("luo_session_finish for test session");
> +	close(session_fd);
> +
> +	if (luo_session_finish(state_session_fd) < 0)
> +		fail_exit("luo_session_finish for state session");
> +	close(state_session_fd);
> +
> +	ksft_print_msg("\n--- TMPFS KEXEC TEST PASSED ---\n");
> +}

[Severity: Medium]
Does the test exit successfully here without calling umount() or rmdir() to
clean up the environment? If so, does it leak the /tmpfs directory and its
mount on the host system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923224408.3745=
689-1-pratyush@kernel.org?part=3D6
