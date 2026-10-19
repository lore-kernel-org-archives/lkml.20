Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426904;
	b=Qequiq9LUVWgnMDe7SNmC61LQGlTPQKDFF0Ev7i5mifgsHJxuJfahkD49Y8SujpuwlNE
	 ZBKRCbfaFMRatAMMtJ8Gkf/AO/8hIwMAQl8uEkgqkNWktOpsET8HjE2XvpypWnMfWJM1A
	 C4TAuxy2vEA1iyviRvsgmRxu6OYcjJSRLMhTNWw5m4+jHPMO/1LuwwuPfGvRfAmsTUdCp
	 F8BOvKWe/1T4h11iW19M6r8vMULeeP7vGI0M93ye7eLh+rLxT/vg2fJjJ6B+CmMMlARYd
	 HySqeZZHoEgY4pRzaHkfaU1yCDCgqlHNoBDx0VM+GzB/uC/+GDnLT99xI1d2XswJD9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AXALzYiDlqNLgw2O3tAb14ubqs9EH5rpsxDv02Io52g=;
	b=MwatuWJDvINOXatYQvY2rTdmTd2Ns3bn/7MllfPSnjlLsx/liTn9FkrQ56TM73Oqjooo
	 k8JvORC2evrSbKKpoxIV36hIOYfWhksaRuSCY0yz1yyxzkvQgFteak2WHwLPpLLSB9EDT
	 CkPrWBWPYni8f/KCNO2YPdunZ41wxxcEUSzELL+SCrK2mYYg24ZMNi+4YW31yaEpbJknB
	 tKZJGoESA3mueczY9SJsj+EYgEazCyQnU6DnFJxCwmS/RKkwvg2bRvn8Yyo94Q436dJnj
	 mJm+KZZMv8lO8p35IL2IdYb/CvQ88UWb8UFwnjEdJEIansuILjcAhI6xWIVrnx6kk9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=H5phoMDY;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8D606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB8D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=H5phoMDY
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93a40a9a01aso451668385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792426903; x=1793031703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXALzYiDlqNLgw2O3tAb14ubqs9EH5rpsxDv02Io52g=;
        b=H5phoMDYTzRbKT2WQq6v53aaHIsZvm1oxzEgECPunKwtKkbsSkCE4MZxkn3xcEJxR0
         fiG9OVJ7vkjQVXNajJY0aqT84jQrovr8c6S0wljKhLKPpFPb0SyY0/vyWAGnU8G5moAx
         8fvA/aKfZSXKPjrxjGyt91Wl+Gu7f33xJtLuX2g/ZpAMYM0JxV5M0346QUsIK67D7i5K
         vnUOI7rghz/gEcqY2A0ZS8nVFU9w3I85sbau0/gmmL4PH4CTRs8XX/nc2A5uTm6Q8Ux7
         VNWBxxiDeYkDZjlZIt7Aap2r7budsQqPO9TLhv4BjSi/UeAk2pYZ/cSEMPZBa0r5V/Wd
         XsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426903; x=1793031703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXALzYiDlqNLgw2O3tAb14ubqs9EH5rpsxDv02Io52g=;
        b=I9+sLwnw0qhsHjb2xtFOYa06XGC+iOQIDQm5wR9tN0CSPnz7I90yzYxFymJ5bitijj
         vmxa6mYu3psdU272llFVVLwsEtpEul+cOTTPodELG3hxDq+L6ahDXJvxpSli5MTuQU5D
         m+M1qb9QTY+PM70vazPNj0J3D4bW5hn7bhCuXDTQFCc7mDum8K5TqFO/UPKSjWdBIr2Y
         vFBcdH0QBOeMARvLiM4eMW4ImQFjQVqzeOdlCRh3eoD6GB5okrAqbCeM9/k6KQOK/Koy
         1RqKSdob4DSFFLkTzMr1SxPP6Zwe7p8HKbpvX5TZjC1vAkCqFky3pzuE5B5KQfG6eRJZ
         kpmw==
X-Gm-Message-State: AFq9FYK29DUaicDpbRxCw3frm3AsWs7ngu3NoL2t4ILygloAmkNIKKia
	pSW6d08ELItRdB9uJuiGcC1EJFxJE44Rngt2ROvM9LBAAr0zy+ebyQwsdbYWb9hD9kEL0qHRy5P
	vdC2bEfw=
X-Gm-Gg: AYBFou2MkJw/zZSCEEjKhVgZQUV0jP/jc4zhaPny1FBGZnENL/RwJYGSG8x0aAb6ivO
	Qsd66UyoxEYDv/DbcNCaQPS8bo7rsHUQ8Tf0YtA0YTYceqqfYZTmNlEvROSLW5H8pffQrcjXPFr
	ZH9tuldgi4lvjWq6fUnDmqqWtLU06gVm4uAhxD4q8OX6DvXSS7xVe/AsKbUM2Ht8Ncy7VY2AJrd
	1wFq4JW0YJwkrEeIO7XLangUU0q30JU+tE9+qIM6YEpX4EWtCibiHgPRvfN24tUBNkybMw4MTvo
	9FDxmyDssO2bcFILxZT5T3+JqQ9mdnauz4j4i0FfVKP0+AiwuPPN+lHunYuSC7zaR+CeYon7GHV
	RrtDsWMBt2QTFslv2r7KbNWPIQiOo/6+p5e39XGsqNIkase7NnY2MTjLGPhQ9woTcPW34Pb4qv8
	tP2NHY52wwUHRL72diYQ1hW34Fe4QdXZ9wSSU/YdbBAG6b2Ez4o6tLYF17akJyL+KNhmO8xNoEe
	nCeCa+Ll7e6o1M8RPhlGzEFhYaCx9okSTqGZ1JJFam0k8YkMCQcx2vFQjdBNByDN3ynre4=
X-Received: by 2002:a05:620a:6cc4:b0:93f:2b65:593b with SMTP id af79cd13be357-93f2b655ed6mr1165985985a.38.1792426902714;
        Mon, 19 Oct 2026 09:21:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9e1sm102394026d6.14.2026.10.19.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:21:42 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org,
	cgroups@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	akpm@linux-foundation.org,
	mgorman@suse.de,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [PATCH v2] cgroup/cpuset: use mems_allowed_seq when checking a policy nodemask
Date: Mon, 19 Oct 2026 12:21:38 -0400
Message-ID: <20261019162138.3271947-1-gourry@gourry.net>
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

A cpuset update changes the task's mems_allowed and rebinds its
mempolicy in separate steps under mems_allowed_seq, but the check
reads both without it.  This can cause a spurious numa placement
miss under some cpuset/mempolicy combinations.

A reader that loads one mask before the update and the other after
it can see a spurious empty intersection and drop the nodemask.

For example, a task with cpuset.mems={0} and MPOL_BIND={0}.  If the
cpuset moves to mems={1,2}, the policy is rebound to {1}.

The allocator can race and compare the old mems_allowed {0} against
the new policy {1} - which will result in a dropped nodemask and a
misplaced allocation on node 2.

Simply retry the intersection until mems_allowed_seq is stable.

This covers the task policy, which is rebound under mems_allowed_seq.
VMA policies are rebound afterwards by mpol_rebind_mm(), outside
mems_allowed_seq, and are not covered by this change.

Fixes: cc9a6c877661 ("cpuset: mm: reduce large amounts of memory barrier related damage v3")
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Reviewed-by: Waiman Long <longman@redhat.com>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
v2: there is no real update here, i'm breaking it off of the page_alloc
    series so the page_alloc fixes backport collectively cleaner.

 kernel/cgroup/cpuset.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3f52717c19654..8ee239d5c6b48 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4354,10 +4354,21 @@ nodemask_t cpuset_mems_allowed(struct task_struct *tsk)
  * @nodemask: the nodemask to be checked
  *
  * Are any of the nodes in the nodemask allowed in current->mems_allowed?
+ *
+ * A cpuset update rebinds the task's mempolicy and changes mems_allowed in
+ * separate steps, so retry if an update raced with the check.
  */
 int cpuset_nodemask_valid_mems_allowed(const nodemask_t *nodemask)
 {
-	return nodes_intersects(*nodemask, current->mems_allowed);
+	unsigned int seq;
+	int ret;
+
+	do {
+		seq = read_mems_allowed_begin();
+		ret = nodes_intersects(*nodemask, current->mems_allowed);
+	} while (read_mems_allowed_retry(seq));
+
+	return ret;
 }
 
 /*
-- 
2.53.0-Meta

