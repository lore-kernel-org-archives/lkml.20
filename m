Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277396;
	b=xU9WEzTybm5GyiXshYhrmKqMcSJeGDtSvhfPtGiaIfUriMvliTtbAficot+j92T6/yQ7
	 yA1vUdAiW91wGABtJVddLyO3u9Lt45QGU/D12LXF9q6QUgRDwyqFcoI7y3+RlAAQktbJd
	 HHSPwaJMNbQ2DvWVj0bD5kHh9YNbz9ac9ipVdUD2jCVm5oOOfEOFuxdvAjtNVWpDlxOt+
	 YHtAK0W3q3ZbCeWHwPg7yB1Gsf1L0Sjym54hel2echMelxJx52sB6PVX9pYXbKGLzvpUb
	 wodsa1YfIJoQsNXjhDgRX1JWdW9v+EzjECR4wBtvO2FI3QB4e8xVWGWL7hdzo76rhwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277396;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=SEnuiR/AnMLoDycMTt1fZiDSUY2PJGdhRalvSAploXo=;
	b=nCtDviYw8kaMhM9hMsVMFu+6DOg+Q2RjkuY7D4JfBNJvtUrhfSDfTAHJghZ3hCPby9QN
	 ppb1M3VtwYS+SOzBmOPDQCuFGwoqbmVOcJOXDUaWR0J8ZJ3gA0mR+N0nnmhtFPJGsNURb
	 oi4jQq4ecHtKN8Nn3IQ4v0cIkxgLaHO251Idcw24YztmIYln2Qu74XDgyf+CArZFQg37u
	 VuuHvhJmiWrQREHKd9sA/doZCxsngiCz1+lLuO1jZntLDKz6E6GFK/C+XoD9YSxColqvh
	 bD69q9bw8+eBO/ba4pAAMxIMojg0q0NPYxHG2aVc1++5Qq5HNNpWRs+QANffpyN9IaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=OMHypTUg;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4657606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4657606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=OMHypTUg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SEnuiR/AnMLoDycMTt1fZiDSUY2PJGdhRalvSAploXo=; b=OMHypTUgtmOXBdWgdng3c+Ge2T
	2zt4qtef9QWPFWoE9axsOgoYwcs+Muq7TDPrfSGH7gGsWs9rL3EkCGEg7poGRtLiVfUKFkZ9Wgoa6
	vT6qkJCSebaDVhku2VMyt0VOKVKkOjZ0cwd99uxkKuVRe1nVZXE9j2sJg3ZFT6b5t2xm2FbC5WFPt
	I1yZbl1ebzSikmCoark5M/dzu4l+7GskY1D5BDIB4UdQHsWDT1LOO309+9KwWODsdeMAt7XdfJloQ
	iqkCZjVFzzXGJERlPAHmySyicLzvw5XZ1KuyGGP9w/NrsiMec/6Zn9vhTBE1Etg7jE0guJc7P3EVt
	4bjgEGtg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMPMs-0031XO-2r;
	Thu, 29 Oct 2026 12:36:32 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH wq/for-7.5 v4 0/2] workqueue: Keep max_active and
 percpu_max_active in sync
Date: Thu, 29 Oct 2026 05:33:44 -0700
Message-Id: <20261029-wq_final-v4-0-2985ea9f24fd@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC4942oC/2XN0QqCMBTG8VcZ59pTZ5sz51XvERFuntUgNGdYE
 b57IFFG99/v/z1h4BR5gEo8IfEYh9i1UIk8E+BPdXtkjA1UAhSpgqzM8dYfQmzrMzofnG+0o7C
 xkAm4JA7xPqd2cOvXoUu4WRnYZwJOcbh26TG/jHJevIPlNzhKJDQ+157KWhXObxt2sW5XXTrOl
 VEtpDILqZCwLIiZjJKF5T+pP1IS2YXUSMiOHFnjbMP6R07T9AJezXoxIQEAAA==
X-Change-ID: 20260914-wq_final-bcfbcd3b0f79
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4351; i=leitao@debian.org;
 h=from:subject:message-id; bh=TSwJ9ZRFzUkOwx/8atIrIn0qtfGFtixpyvxKZ0dBc7g=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq4z3LUqX2jj4h4/ozIvjAfYw0WDFi21iGltSiG
 SnKSpDk+W+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCauM9ywAKCRA1o5Of/Hh3
 bcOVEACmn8MHT4YaSN5Rs0n0fTzafj0YhMo6hVaO5Huf7YXQjpLqNGxf4clhuBL1N8pcWz3XmCF
 860UxEh//Lmu1i3/wFOpR/ihYlGVjC4FmAk2/dx07RGNK+n2m2KQyV33G/SkpdCLcYrM8g8pdp6
 DTiUOsx7tV60QQT1eyo/G8zrXSbeHK+fDHW1wthhgBSogJq+AXFFWojwIhNb2n40XSLRKURZW/V
 /0Im81iAMSdeBJYmNhBAjm5eTrqLY4kIu+jrD1fWyajsAzJ9yzFyNiUsM619qH8GKXHK3R5EAI7
 H0R8m51c7bo5+d4Lbe+Hg4qOwOPSwI5Vhni+RnYcNsb4+Dq8KbnWGyrNpjczd96TmpcZcvdlooU
 fWnDpZwZ+YQCW5RbeWds6mdSY513AUPjbbaicRGsXAiDS4J199iAcJFEMxU/rfYmD0kklDNp/ix
 IHE78ocomu0QHt3WXR5DcF3vnVMcG/JYXelpZVutNZWHpnJtO3NZtNriHnnSeLYZ1v+a6FQMULH
 oui7akQ+lZIaAs0EUfj/117o0A476hqz1W7EX0uHo72lISjEYPRAzcEvTUOFO0L+/MvlBSg/KXB
 GtYvvtSz08JVSD4oak5bftPbwuO4uAvpWpquZ4yAbWN8ks4ni83hIu/G42vHINt7M44jMXB4IJl
 qjLDmk3Blj3dI0A==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues their own
max_active") gave the percpu backend a limit of its own, so a workqueue
now carries both percpu_max_active and max_active.

__alloc_workqueue() only ever sets the pair matching the backend the
workqueue is created on, so the other stays at zero for its lifetime.

Nothing reads "the other scope" max_active today, so this is groundwork
rather than a fix.

Two patches. The first moves the initial limit setup out of
__alloc_workqueue() into wq_init_max_active().

The second sets both domains rather than one, according to Tejun's
recommendation:

  U = unbound max_active, the system-wide target
  L = unbound min_active, the floor on each node
  P = percpu_max_active, the limit on each CPU
  N = online CPUs in the effective unbound mask, at least 1

  Setting P:
    U = min(P * N, WQ_MAX_ACTIVE)
    L = P

  Setting U:
    L = min(L, U)
    P = max(DIV_ROUND_UP(U, N), L)

  Setting L:
    L = clamp(L, 0, U)
    P = max(DIV_ROUND_UP(U, N), L)

It rederives the other domain when the cpumask changes and once CPU
topology is known, as workqueues created before smp_init() count only
the boot CPU.

This shouldn't change the behaviour of workqueue for now, but keeps the
groundwork correct for the PERCPU affinity scope work it's meant to
enable.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v4:
- Folded the topology rescale (v3 3/3) into patch 2 (Tejun)
- Added wq_rescale_max_active(): it derives the other domain from the
  backend's own saved limits and publishes both through
  wq_adjust_max_active(). The setters, apply_wqattrs_commit() and
  workqueue_init_topology() call it, so the topology pass no longer
  passes a derived limit back in, resets min_active or writes the live
  limits directly (Tejun)
- Rederive in apply_wqattrs_commit() so N follows cpumask changes, and
  set only the backend's own limits in wq_init_max_active() (Tejun)
- Test WQ_UNBOUND in wq_nr_effective_cpus() instead of installed_pwq()
  (Tejun)
- Pair the READ_ONCE() in wq_user_max_active() with WRITE_ONCE() (Tejun)
- Reworded the wq_adjust_max_active() comment as a contract (Tejun)
- Patch 2 changelog: spelled out the conversions, explained the
  wq_user_max_active() readers and what is not resampled, dropped the
  CM/RCU wording (Tejun)
- Dropped the PS from patch 1's changelog (Tejun)
- Rebased on wq/for-7.5
- Link to v3: https://patch.msgid.link/20261009-wq_final-v3-0-eb0b095b9de3@debian.org

Changes in v3:
- Dropped the silly percpu_concurrency_managed attribute patch.
- Fixed N to come from the workqueue's own unbound_effective_cpumask()
- Added a patch rederiving both domains once workqueue_init_topology()
  knows the real CPU count.
- Handled BH in one place: wq_init_max_active() sets the limits of a BH
  workqueue through wq_init_bh_max_active() and returns, instead of
  giving BH its own branch further down (Tejun)
- Set min_active to percpu_max_active when deriving from a percpu limit
  instead of min(percpu_max_active, max_active), as max_active can never
  be lower (Tejun)
- Changelog of patch 2 now refers to the new PERCPU affinity scope
  rather than WQ_AFFN_CPU (Tejun)
- Link to v2: https://patch.msgid.link/20260925-wq_final-v2-0-860ee052169e@debian.org

Changes in v2:
- Cut the series down to the three patches that change nothing
  observable. The runtime scaling, the affinity scopes, the backend
  rework, the concurrency management attribute and the sysfs files are
  all held back.
- Set both max_active domains instead of holding them equal, deriving
  one from the other rather than duplicating the value (Tejun)
- Link to v1:
  https://patch.msgid.link/20260918-wq_final-v1-0-5c43c08a26bc@debian.org

---
Breno Leitao (2):
      workqueue: Move the initial max_active setup into a helper
      workqueue: Keep the limits of both max_active domains current

 kernel/workqueue.c | 186 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 141 insertions(+), 45 deletions(-)
---
base-commit: e92304919f8104ef1452a6389fc54311e857b953
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-7.5
change-id: 20260914-wq_final-bcfbcd3b0f79

Best regards,
--  
Breno Leitao <leitao@debian.org>

