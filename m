Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865342;
	b=maG+EtdwMO06KOAh5lWK1t7pnQue2UE+vtrCAKua++a1CLQzPZ4SSWPnf4Qz+QPdIYA9
	 71wA84kWU2BCKfruHn6g9eqm1DZs3uqoH6mMj/2Weh4jzVlJJtYg8TIIYU7kL3UO2MRVw
	 waFOjdBsZKXqL1FYY1GLaOV+13Vh7hqAPD2FC/uj2o0Kj9hwcEyGTgW6MhsxtHRAjhLmX
	 xrNslsVOCVuaXp3zalhqmf9t86FOPRVck1wcNmfD/gkhIL531XfSArSNaZjelNZIhWP/K
	 cnqrj7ObwCbQzEkOyyGC8q4A2ZrSgiXK2AfQbkQzvb3QJpvhQSzrxkCtDVAz+hs+SIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865342;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JR17ysjB+dtttW6o1pr6kLcc2D5Qt59i5GbUOQrs5uA=;
	b=MVXKf3+cxmGH5hoSJQsNpkxVuqjR8RjrVFtl4gcMofCV3hTUKKuHsy8q1pKDI2so79vc
	 FFjlr/iaNq2JT9VPb8f+4QoboelL+vYTUgry8qw1YOA3AO7VDk7/VIFM6/FNZjvi//2XO
	 TdJsXVyTh4GRuLDBrjhl7/hEbkV88BHVVTEGSanaeZZFyU7cHwfyERG9qjrIPD0+1mFm0
	 40SIw5IoVdXdtf1Sku9iLZaZnaYInypwMtjOkBbfwRKkyGT1ZgxRG8Cd1W2rUVwP/mcFE
	 PKsH0bEcaEoEYvWjPcyRLojfmMY8F9DbprNs0orWRtXZS+KfhEspc6dbqfHyUUorHhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YyPGO23I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056D2606A882;
	Mon, 16 Nov 2026 21:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YyPGO23I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68AF1F000C6;
	Mon, 16 Nov 2026 21:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794865341;
	bh=JR17ysjB+dtttW6o1pr6kLcc2D5Qt59i5GbUOQrs5uA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YyPGO23IFT/k8iVRP1nofSc5hTOeMPU9xH470QCw20tir3+wqVUzILIn4mnUFPcLl
	 znTBWm9G1AAKuH+x2Ob/CdsIGb1USJbGmw93XHLx6itxj2P/f13fKDQTGYxfDBuEjW
	 wImiKWW9KRBvC+1EI5VbLgs/uNn6Ap8+3FZT/1L/8lmdQLbXu1KdUQZ0yCpzFER3E8
	 WwkEDTp9aEgYkVqYrehMrZXPPk2lEqXWd9/zXBiF+CswfP0VpC/fQiGvUAlkUyBcRs
	 T1ZG5kAD/xk1Ss9AxvHuN83TdNhece8+Xhjrw7RW8GmnT0qVfGfn0VZpH2IaPADD//
	 p9RffKkFXE1WA==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Yongxin Yang <yangyongxin@kylinos.cn>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH linux-next] profiling: keep the error message in the mm-nonmm-unstable merge
Date: Mon, 16 Nov 2026 16:42:19 -0500
Message-ID: <20261116214219.470791-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avsnCFn0jCvbhtRw@sirena.org.uk>
References: <avsnCFn0jCvbhtRw@sirena.org.uk>
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

Commit 944b8062bc6f ("profiling: report it when /proc/profile can't be
created") in the vfs-brauner-fixes tree and commit 091be6dce28a
("perf/profile: report failure to create /proc/profile") in the
mm-nonmm-unstable tree both make create_proc_profile() return -ENOMEM
when proc_create() fails. The second one also prints an error, as the
return value of an initcall is not shown to anyone. The merge resolution
took the first version, so the message is gone.

Keep the pr_err().

Fixes: ac8dc2166a3c ("Merge branch 'mm-nonmm-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm")
Link: https://lore.kernel.org/all/avsnCFn0jCvbhtRw@sirena.org.uk/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
To be folded into the mm-nonmm-unstable merge, ac8dc2166a3c in next-20261116.

 kernel/profile.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/profile.c b/kernel/profile.c
index c6d5a2638a52e..818098cc094a5 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -245,8 +245,10 @@ int __ref create_proc_profile(void)
 		return 0;
 	entry = proc_create("profile", S_IWUSR | S_IRUGO,
 			    NULL, &profile_proc_ops);
-	if (!entry)
+	if (!entry) {
+		pr_err("profile: failed to create /proc/profile\n");
 		return -ENOMEM;
+	}
 	proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
 	return 0;
 }

base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.53.0

