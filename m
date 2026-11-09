Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251417;
	b=GO21l/WrLmHQdPbixbKMIcrMQyl/X2e6bljvMG6CN1bIE+4dDY2KIfaeitu97ASxvzGE
	 VpqoJXckJ012EQ8vu+7PdWWKk47OSFrqFukmCLU30pt7tK+/bQ4yjb6VyiC2MIwPLc4ue
	 YlQVPIFnYAM+rDUJlmTzKwI+ZuZGS415u/z3ErQrc5k6mC5OwWZAI/HOnJO3tqbhP4mTR
	 O9E8iYM5E8oLWxp6gwSGH5d63avOkPWUT1mGa6NIFm1sgB3Hey02bkzwSl00E20e9E/Ex
	 YKvkSeJPQPp9upQJf413E17fxfiZubUyHWbeGolfFvVB5OhR8O2WWisMLiAe+cd7ouQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251417;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=1+VGOzdszmEm5r9Dtb+uNL8xaPZUQtUCtTE44595/w0=;
	b=SLwdLJWD5Bkp5HG+mRxAzKpMPrmbwsOa/YDcmFXTwD6FN6iypE8/FTg+0tOnW/UK7nDP
	 8xOItIpnRBB3L4hxcTkD9xrTAq9rq4PjZOGemrIRV8IhONiOV3iFA3waj40OtJFUaAgS1
	 Pj+BCQ62FISv2Te7i5AVNKaiCV5u+XnsxMIGchFW+TSN1iMXOdK4YHR+JDm+Tbs7DL85q
	 Ux/hl3x01QyuDR5mgmPzS7IJI3e4ZMu5YqnMFQjr0OQVnhMqG6DWMpYrQvDDZ7ZOKNofl
	 kT6g2cAOWUndYJBMlexjaMZw5FKKADbXBS6F55lJlOZfLEaZzTLAqmQ2aRUkZGuzGHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iBBcUN7f;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7FC606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iBBcUN7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794251415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1+VGOzdszmEm5r9Dtb+uNL8xaPZUQtUCtTE44595/w0=;
	b=iBBcUN7fRTLuaJ4VjpNi/CAGEpXwkjfiaALp1ejDeJmeFRLNjAFJxPZZ4QxTiEeWSwNWVb
	w9P2kbPE96Z7f87kD3aSaL8TAkt+3Zvwt8MOPeJ6DobcNlV9HzAhGMwGAcf5r/gQteh0Lh
	PRYeYq5DFaAwLn/QzH/4xg7QrZCLdR0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-iGvRxo4pMDuyUzyBPWroFA-1; Mon,
 09 Nov 2026 14:10:11 -0500
X-MC-Unique: iGvRxo4pMDuyUzyBPWroFA-1
X-Mimecast-MFC-AGG-ID: iGvRxo4pMDuyUzyBPWroFA_1794251410
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F5D4180060F;
	Mon,  9 Nov 2026 19:10:10 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E65EF195608C;
	Mon,  9 Nov 2026 19:10:07 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next v2 0/5] More fix patches
Date: Mon,  9 Nov 2026 14:09:50 -0500
Message-ID: <20261109190955.1398611-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

 [v2]
  - Reorder the series by putting the original patch 4 before patch 2.
  - Update the Fixes tags in patch 1 and 5 as suggested by sashiko.
  - Update the new patch 3 to remove obsolete WARN_ON_ONCE() and update
    comment as reported by sashiko.
  - Minor fix to the test case in patch 5 as reported by sashiko.

This patch series contains an additional set of cpuset fix patches.

Waiman Long (5):
  selftests/cgroup: Fix "test_cpuset_prs.sh -v" failures
  cgroup/cpuset: Correctly set cpus_updated in
    cpuset_hotplug_update_tasks()
  cgroup/cpuset: Fix incorrect partition invalidation logic in
    cpuset_hotplug_update_tasks()
  cgroup/cpuset: Protect current->mems_allowed read in cpuset_fork()
  cgroup/cpuset: Correctly set isolated_cpus when switching partition
    state

 kernel/cgroup/cpuset.c                        | 77 ++++++++++++-------
 .../selftests/cgroup/test_cpuset_prs.sh       | 20 +++--
 2 files changed, 64 insertions(+), 33 deletions(-)

-- 
2.56.0

