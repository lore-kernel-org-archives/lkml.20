Received: from smtp153-168.sina.com.cn (smtp153-168.sina.com.cn [61.135.153.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197A83CEBBB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438016; cv=none; b=dXbTbWp0TFGFPLpfY4ru86Bqh7GlBWhgsSWzuqh18W798owue4aZPI8QFx1rr+jTa5s8VQq5Q9NW8fvthVJIOMYHvZkA4x3v9lGurO+7/HiLWBT41OGZTbCH7bicUCBVSB7HZ6nDDeAihtGRMT5XiD4FCDp0V0bs2Z01rmWQ+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438016; c=relaxed/simple;
	bh=seEUaTreJEox0Qb5XUep+CsfbF5QeMRJZomP68NTRUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwsKdyFoin/UFtGNuB3LyAjluXpn0LbyH6aczvCH6vlj5UdopMk3cwd+S699QEx4ifek0IUco3kmapVHB2BO19eprGdcOSFjc1T8XjRhPYXYwCMuVLV40BPK6jtVuwemTH0jl72mKw5FDikG3+rFjDhUD99Z08iONCuGDDECfok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=QehUrCTt; arc=none smtp.client-ip=61.135.153.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="QehUrCTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789438009;
	bh=sJ+/yuJ1SlJec4lxDYxNlSN5jEAaC77VuPE6RZVsWqs=;
	h=From:Subject:Date:Message-ID;
	b=QehUrCTtPpeqt7aLhe2OzJXHlE2noY4Ky3IoM0iYH1r2PGPNt2id8Bfs+DEWTN44q
	 2maWR5Yj2jlFdTCc+Z7G20Sl10Uai9Y+cLv+Kk1AZxNz49j1XaWdsJluHKhUl6gzDc
	 xUzdSEuBE+XIKfQP0CiCVTULbhVo0lQHYsO89PD4=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AA8A80900001A1D; Tue, 15 Sep 2026 10:06:03 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6810626685426
X-SMAIL-UIID: 9B0460687509472F97F9A35651447826-20260915-100603-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+237f670105a254a230d4@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] BUG: unable to handle kernel paging request in write_comp_data
Date: Tue, 15 Sep 2026 10:06:01 +0800
Message-ID: <20260915020601.899434-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aa87111.f81106d8.2ab401.0057.GAE@google.com>
References: <6aa87111.f81106d8.2ab401.0057.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 704340f1cd0d

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 35420f0ac524..479a84921833 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -236,7 +236,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 {
 	struct task_struct *t;
 	u64 *area;
-	u64 count, start_index, end_pos, max_pos;
+	u64 count, start_index, end_pos, max_pos, tmp;
 
 	t = current;
 	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
@@ -254,7 +254,9 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	count = READ_ONCE(area[0]);
 
 	/* Every record is KCOV_WORDS_PER_CMP 64-bit words. */
-	start_index = 1 + count * KCOV_WORDS_PER_CMP;
+	if (check_mul_overflow(count, KCOV_WORDS_PER_CMP, &tmp))
+		return;
+	start_index = 1 + tmp;
 	end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
 	if (likely(end_pos <= max_pos)) {
 		/* See comment in __sanitizer_cov_trace_pc(). */
