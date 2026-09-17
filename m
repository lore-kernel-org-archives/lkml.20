Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925A04DD3D8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645563; cv=none; b=IXdPnWG20E3ICSyZJPWNiCjYYxdue6kDOaU22q3FZxOF3c6sUc6E/PuqZgNvO3Vbl0xC4OBsQgzw4dKcFZKkwUkQz8+THMbT7dqRPu1EWN8EAcL13fYDpWr7HYslTunkQIgEp8Fq1STn758EKepfXARV2VFpUOIee6fmhfMC5JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645563; c=relaxed/simple;
	bh=XoCNKh3avr1vbPszp0DFF5P7sdLgXW+7ysUJYNoTYl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOdHGCitSvuzjPM+5ORqnA31Z0aKehXwsSmxcC/ZrCfO4KH44EQfPhgFR2e+frJ8SL0a/tzT1HJad0Fiw2DBfvkYQTWrpcPJzX6868u7yXSX/Xi3twQ2c9mChO1hFExBEFaOQXyEnM9x4FJzT3W6pHIdWDPykmSGSQi6nb42m54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZlHqCtLV; arc=none smtp.client-ip=91.218.175.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZlHqCtLV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XoCNKh3avr1vbPszp0DFF5P7sdLgXW+7ysUJYNoTYl4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789645553; v=1; x=1790250353;
 b=ZlHqCtLVz61x1ppMwJL3OUseRGO4gzL/ogKJ6PPJeDtRCzbpC0vsW0U6tX6NoVM3HEnvCOhE
 NgEn1pPFWiM8uUV8DicDlDF6KXG9vzOyOHopLNCmoRrDt1kBmUogfLaVJDX6vEeNQWNnsb2lK47
 pZcSRTVS4NZV+A59YqBq/6Y8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fd273b443532bc7d;
	Thu, 17 Sep 2026 11:45:53 +0000
X-Mizu-Trace-ID: fd273b443532bc7d
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com,
	seanjc@google.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH 0/3] KVM: selftests: access_tracking_perf_test fixes and cleanups
Date: Thu, 17 Sep 2026 19:45:40 +0800
Message-ID: <20260917114543.85044-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

Patch 1 fixes a deterministic failure of access_tracking_perf_test when the
host page size is bigger than the guest's, e.g. the 4K guest modes on a 64K
arm64 host: page_idle tracks idleness per host page, so walk the test
region at that granularity.  Patches 2 and 3 are two small cleanups found
along the way.

Tested on an arm64 host with 64K pages.

Zenghui Yu (Huawei) (3):
  KVM: selftests: Fix access_tracking_perf_test for larger host page
    size
  KVM: selftests: Add missing newline to access_tracking_perf_test help
  KVM: selftests: Remove destroy_cgroup() from access_tracking_perf_test

 .../selftests/kvm/access_tracking_perf_test.c | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.53.0

