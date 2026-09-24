Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4899836F434
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224055; cv=none; b=rdcfNBI64xE8IEuxRhRFVevsd1Bi7uDhWf4//fRgW5rHkTgGoYtO6o9/Xmpdt8HG03cSPrioZpBZcuc0oL5L04zb9jGnbEwmz5y3y1p7LOFKNnkUi87xLIr3P933PrEy2h3PXng8/0inxOhWPK6FnzVOmNSRkn7LeiY9PmOcT+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224055; c=relaxed/simple;
	bh=SlPzGPDevJ712yV3K8dLA8Akc44d66oXNW6JLxeKPxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSRs4H26qXHpIVznEHD6fJBdM3Owxm48441e8Cjzfvu3uK8lV4cvsr6pifXi2vYvUmH1wmPsdJhIoTR9irF3zU5GwOzjANNgApDhva8rTO+kkhuMlQ+CHS3WOGPW3DXooVPnV71+sz2N85Iu31pL04H7SNZ+s6jiXTmh+5ziO1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MR2PlY+h; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR2PlY+h"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso10013535ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224053; x=1790828853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dF6lxsisMCHm/KxhSC1onb0PhKT95yZ7vVRGieeLH5c=;
        b=MR2PlY+haYYzIFjabcl3HIPSmBOFopJfZpkMUrd5tIrFmuoOdT/QKNp5mPzvpVfNgZ
         ck4DOOH8HhQ+l50epqiUcqMmggFbcU2RAQnXCWeqf1YOu2M12EdZW3sDv+voJm3/yXa1
         lHGCXBtcyT9Ttwcs25vJFpYdUBzd7QFEHLh3Gr+liLau8VxDgmPI+RK+SfExHiYHGzh1
         pvG6Enk5ggT+xdlYAuR0foDzCPqzhmWAFioOCaKMWOy6EZN20X4epoSRroQw6jwAZd3/
         kpv1tPoPSry5nXA2Chcfn39m+k655KPVFoHXq88a2QSCAIyeWpZoLsjZXHt9OnRhPtAU
         zPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224053; x=1790828853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dF6lxsisMCHm/KxhSC1onb0PhKT95yZ7vVRGieeLH5c=;
        b=TXEWQAcxkJx9Q+8HnPpWpFQQ6oy2wXoctagl1VNMdNCR4Ycx5Zpg2u4kuUlGhQLNHn
         JEspuVF3WxFmld9TFNiszqhonaGNyrz30hvS0lnzmRn0z0gyRW5mYT47P05GCRyFfmOa
         mPad7y1AB6MKoi2zqt1tOculEDLlxd6remYSnx4gcinLR89MlfBewXJGzGKejwNF0kjM
         8XQNYpohfsszfaT++VfbPI0uh/WG/UyOmpz8KZJt8mWwNfWpMNoIwCl0cRV9LLox4VLV
         wlo9zgOqohBC3qIrI26fDOOa8EMsHhIcYWbs7OpfHkioTDwsF4xE22U8CuleGSj2TdQZ
         D0nA==
X-Forwarded-Encrypted: i=1; AKwUvBypL9h0/PW5EEtrNzRfgTrxiSddgfv/TOz/THbk6n68FJNTPB4+CfxJDci/J58mmC7maIKwP4nh1AyJGgg=@vger.kernel.org
X-Gm-Message-State: AFuF++m8kgDjCLfxx7xcBnmq4u5BVEFBhuHSJxj22TxeqQ7idFyEEWNP
	WyJnp8sDkpVJxWc4i42Gn5Z0lZcweSAEQ00Y+SY/e1S4jTIKKPACNTJs
X-Gm-Gg: AYBFou3HJcQX+YFOsdnqCNZ6QHJwCwTsAvCjYX+H2+d1eFTOjwEN6JZAfom+vzSHSYy
	/R0FPpPRPHd5trYYJLK+6Wwfx4cvIEGJPMqwTRrwVrnubwhN8keMfjywsxFYB/A/FWt/y1ZNbGl
	TlpUNDMDvlaKGnmH3rk3JPcZbA22VU7K2nQqT3ApdW5YGnuSAD5CHZPgNGaDjbERFmTfaPdqoLS
	TX3yyaHcOJqxybxgkjXN6ysk9Ttolm9gwgHqtK1a1WISIC7Nv5YoQgZRnsVfNUX0FLpm4uc9xUs
	nPKpACCyOX+px3tgB+TU9G430eZLpupoYAre1zN/ulPADtAdVD3LJJJvwejqThD3zi0P5i3YJ3k
	3KYQLpAtqXT5iXCIujqKXW6gOONcSkKEM8AF9F6Lvy3AbyYjRszCXkq2Fsfkv3Se31OEdxwT7A0
	nWlw7BefiajFifw/AxOpbIUK3sTsBW7xDSMJjwmdEdFgKhjGPY/0rys7e+25P5745ZtLMLxDsx4
	b06iz96RArN/cgyNFwjZ8pkOmyc7SddO+qN2S3rHM18wjsk9fuDovVUaNhLiP0d1W5rd9ERKL1n
	6YittizWRw==
X-Received: by 2002:a17:902:d481:b0:2dd:b83b:fe1e with SMTP id d9443c01a7336-2df7de9309fmr10196965ad.22.1790224053300;
        Wed, 23 Sep 2026 21:27:33 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a4997sm19710685ad.27.2026.09.23.21.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:27:33 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Chen Ridong <chenridong@huawei.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 3/3] cgroup/cpuset: check sibling effective_xcpus in cpus_excl_conflict()
Date: Thu, 24 Sep 2026 04:27:29 +0000
Message-ID: <20260924042729.1908863-4-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924042729.1908863-1-benquike@gmail.com>
References: <20260924042729.1908863-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cpus_excl_conflict(), when a valid local partition A1 uses implicit
exclusive CPUs (cpuset.cpus set without cpuset.cpus.exclusive, so
sibling->exclusive_cpus is empty while sibling->effective_xcpus is
populated), a sibling cgroup B1 can still set cpuset.cpus.exclusive on
the same CPUs because cpus_excl_conflict() only checks
sibling->exclusive_cpus.

Fall back to sibling->effective_xcpus in cpus_excl_conflict() when
sibling->exclusive_cpus is empty, and add a regression test case to
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Tested in QEMU on Linux 7.3.0-rc3 using
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Fixes: 2a3602030d80 ("cgroup/cpuset: Don't invalidate sibling partitions on cpuset.cpus conflict")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 kernel/cgroup/cpuset.c                            | 5 ++++-
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 7c5b4a8f1f3a..f46a51f07938 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -713,7 +713,10 @@ static inline bool cpus_excl_conflict(struct cpuset *trial, struct cpuset *sibli
 		return true;
 
 	/* Exclusive_cpus cannot intersect */
-	return cpumask_intersects(trial->exclusive_cpus, sibling->exclusive_cpus);
+	return cpumask_intersects(trial->exclusive_cpus,
+				  cpumask_empty(sibling->exclusive_cpus)
+				  ? sibling->effective_xcpus
+				  : sibling->exclusive_cpus);
 }
 
 static inline bool mems_excl_conflict(struct cpuset *cs1, struct cpuset *cs2)
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index f4d1822d4e21..f62155cf6162 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -445,6 +445,7 @@ TEST_MATRIX=(
 
 	# Changes to cpuset.cpus.exclusive that violate exclusivity rule is rejected
 	"   C0-3     .      .    C4-5   X0-3     .      .     X3-5   1 A1:0-3|B1:4-5"
+	"  C0-3:P1   .      .    C4-5     .      .      .     X3-5   1 A1:0-3|B1:4-5 A1:P1|B1:P0"
 
 	# cpuset.cpus.exclusive cannot be set to a superset of sibling's cpuset.cpus
 	"   C0-3     .      .    C4-5   X3-5     .      .      .     1 A1:0-3|B1:4-5"
-- 
2.49.0
