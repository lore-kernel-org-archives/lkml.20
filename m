Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74470485930
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328857; cv=none; b=cQyJ8FqrPNyWnC001vyGdWYU038ERTFp1bMnBB72tQmI0TkOYD1hQ/6cDWkedZGWI57NdT74DeRrkrYMw0d3yHmwMuT+Oq0JmaZlZxKxYxQBg0QRByfSME7qBQOgnYlEX5gRW7BhGnEu3XARCZDhwbhnhdWYC6KzJg4tpSnNXCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328857; c=relaxed/simple;
	bh=x8kQvifncaReIPCultnVOVS2r5/7Y0D0aF19GdSakMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPZiFjcJ2Aq8tbCMQByyCFtkquaHInKM1CLQyPSnBPWFpdxiAiUhb3dQpcqBZo60hqk8xytxSOY+tOCRl9+xVxmnSs33QANTx19KxkZ12YjmIBuJcI10DkvP4kiX062F5NYRqalOPGXXwA34C3czLP0aVqatgpU7FtY/XY9Yakw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrIUKk9X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrIUKk9X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EBC81F00893;
	Fri, 25 Sep 2026 09:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790328856;
	bh=fEVZuUK/hY/WdGHFH0G++LIKfhjhPrGfX5BLv53tG/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hrIUKk9XbAG1XOxO2iSrszicDGWf3KK5RBON2FnGA7xA1giGMwIZ0YITx3wi6HCsk
	 znyA357t28e1zPv+Y40DSI5QjeyY4UxDMEEnJ6fFRWt1S75A03divYMbbkUJKpeGxC
	 lBuK0lbsAxbS2Vh29q6fBsHEwRD1vSPV58PP1pnN2mwuE1KB9ywKj5/MXKkcXVnuMp
	 CqROJ/EP4UQL3nRXmZBOEJLSF1HJWaQDVuwP5dusgyZ2m74vCMRI9zbBFfu/OsczSt
	 G2ig7hNJGQz7ssngm0XUQSfUcZ1cRs1nojNubI4rMqwbK6UytJTdGt0rXfcwetscdy
	 LU47kg3x/FI+Q==
From: Christian Brauner <brauner@kernel.org>
To: frederic@kernel.org,
	longman@redhat.com,
	juri.lelli@redhat.com,
	peterz@infradead.org,
	kees+treewide@kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: Re: [PATCH] kthread: Annotate lockless to_kthread() flags access
Date: Fri, 25 Sep 2026 11:34:06 +0200
Message-ID: <20260925-legieren-eloquent-semester-e4a05b18baa3@brauner>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920070750.2871923-1-kunwu.chan@gmail.com>
References: <20260920070750.2871923-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090; i=brauner@kernel.org; h=from:subject:message-id; bh=x8kQvifncaReIPCultnVOVS2r5/7Y0D0aF19GdSakMI=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRtcxAUUMre/ufbTfESh+AJM1uf3n/09rdU2h/NHecNX G7z6c9W7ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiI7jWG/xma09bwSkjMsfi9 /G1oygeW52tvCv/R92dcv/Weg38YkznDf8fnjrxp2YnzOd5XRXye48K9cfPd1Zw82kGFm3gm3+Y L5QIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Sun, 20 Sep 2026 15:07:50 +0800, Kunwu Chan wrote:
> do_exit() calls synchronize_group_exit(), which modifies task->flags
> under sighand->siglock:
> 
> 	tsk->flags |= PF_POSTCOREDUMP;
> 
> The sanity check in to_kthread() reads the same flags word without
> holding that lock:
> 
> [...]

Applied to the vfs-7.4.coredump branch of the vfs/vfs.git tree.
Patches in the vfs-7.4.coredump branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.4.coredump

[1/1] kthread: Annotate lockless to_kthread() flags access
      https://git.kernel.org/vfs/vfs/c/fd00a46e36a1
