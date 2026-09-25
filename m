Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED049F100
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341823; cv=none; b=Iv1IpH9ehdslZSZjfoNrIzNC4trljHYCVsKT3WHehJMZH23wvIBCnCyWJCjmMc0JfyXOKHmSuR+QRAiceY0vFAZcim/44LcF3l4rqHpAImNiIQHavsRiTbz2KnbXNfLwKEdgtWLm2cIp/Ftk0JJHWjkHTgArUcJ/F2kFDv5+hoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341823; c=relaxed/simple;
	bh=beLHbiL5rijpAN4t5schkNf8lA9/NjAcGigguh2qQl8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RhLQaC5Pi9PPY6j3/kknUUIM5Q/uxjheh6B6GGUKPUxyIBZEgqIQbk4xr5l8NLmN8lWgVqf2nDVRVFxj4vM6gkWv+yolsBudpjerPk1gm66Cpf2GV6kN6tbTbFQT+QoE4dTWMRCr5xuHX8o9Q/Nf76aFOUyOW76xJOaZ0ARqTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=dDTUQ+Tk; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="dDTUQ+Tk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0SbK/8DGJJHTLooN4JtSgs5FlSCjlm3Q0kBLos14rU8=; b=dDTUQ+TkYlMm3nmN3MAPD4xjzP
	75tZiRasaG4Pchltr36M48pRqMjAvwRaove7MPD9R9PYDM80FlKa5ITkhCrIPBT8H+yvT1Gh+q0Cf
	CAWlVN3sJEdhV8qIMTTqwUMkD6DjbmPT6B1rlvlKkoTLAoeZufv6bS9P/qIaKsBuOxNqk81FcVdin
	JRJXE1PFZw9pRLM1xkEDHNRCia5fXJK7hl0OnP6RgKAfjiwDFJDItternG+mveFGd0Vh80aCKc0wA
	Z+6EMHMsN/bNYTH33AHeprcyk69hRofwdskXhy18NApRjkBOKroDZrqjUaAXHZSL50ZlWTCQy12k/
	bJ3rwVNA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xA5gk-005KH1-0m;
	Fri, 25 Sep 2026 13:10:07 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH wq/for-7.4 v2 0/3] workqueue: Keep max_active and
 percpu_max_active in sync
Date: Fri, 25 Sep 2026 06:09:49 -0700
Message-Id: <20260925-wq_final-v2-0-860ee052169e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ1ytmoC/0XN0QqCMBiG4VsZ37GzOU3To+4jJLa56Q+x5RZai
 PceSND5y/NuSDaSTejYhmgXShQ8OiYzBjMpP1pOAzoGKWQt2qLi63x35NWDa+O0GUotXNMiY3h
 G6+h9UDes88mFyJu8Qp8xTJReIX6Oy1IcxQ+8/MGl4IKfTVUacVGy1uY6WE3K5yGO6Pd9/wJgX
 CnLrQAAAA==
X-Change-ID: 20260914-wq_final-bcfbcd3b0f79
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2391; i=leitao@debian.org;
 h=from:subject:message-id; bh=beLHbiL5rijpAN4t5schkNf8lA9/NjAcGigguh2qQl8=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqtnKqqIHyU26lCl+mEJ9CfjaLHWjR5uj2QhqPC
 hQZ2zKwpVqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarZyqgAKCRA1o5Of/Hh3
 bZ9rD/0TGp3mHTK1lFEfyufpzwaTOp04cxKwSG0uBBtrNT2W/VJlZ16RD2BPgWWF/Lf+tzE+/6g
 Sq2WgwToI5e4uusyTq4wQZB/SQOhS9I/rNE6/hoFLrgdglUKE3j385FN6NVF1AXlnvxOAEVP7zL
 xva2gzXQwydfnSNcOlgy4nTVH4q7vsM/x8vSzHFGJXkKH56Sb5zrSBkbtvsSprUONGObSYsto4+
 E6m8AAx3FxdwC58jp5iWx/XSxxux17W0cThGlVbo30CJ/WDDfGtesaBGS77zgc16E0t0y6cH56f
 +taQZXnuToy994zjPgMNdCkGGoBB/CYAgBJOm4mVWoU5pCCl/urTPMgCIYKPSAmysqZSGlyqmcO
 vWs7PTYtfv8vN8FeTmMA16k4Wg1DdsjCHCREF2qJl6UaJ2nokBkVzoz+PhWVQ12G3SIU9haWwZr
 KkJJM8t2DApvQ80deVVqjbtwn+VwbshWjYCnxNtRyPfxr387KWDROuKev38oTawqj4lixdV0DZt
 uNuUbVfdzqX5nFTBoGTkBU2dlU7el7NEESS6gtwf//pOBx8ZdOYNtPIESp6AaDLd/mqUMSLz/T6
 ddsTadctDT0PPXPStvsyvT49fycK5KwU3AHcAJulzOIuZ/jfRAERmi4iTUzrNAroQjHTiRuqdSN
 WymhwMRrJwPP7hg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues their own
max_active") gave the percpu backend a limit of its own, so a workqueue
now carries both percpu_max_active and max cpu.

__alloc_workqueue() only ever sets the pair matching the backend the
workqueue is created on, so the other stays at zero for its lifetime.

Nothing reads "the other scope" max_active today, so this is groundwork
rather than a fix

Two patches. The first moves the initial limit setup out of
__alloc_workqueue() into wq_init_max_active()

The second sets both domains rather than one, according to tejun's
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

Also, add the flag for CM in the workqueue attributes, as discussed on
v1. This will help will enable the introduction of PERCPU affinity scope
later.

This shouldn't change the behaviour of workqueue for now, but, enable
the new PERCPU introduction.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
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
Breno Leitao (3):
      workqueue: Move the initial max_active setup into a helper
      workqueue: Keep the limits of both max_active domains current
      workqueue: add a percpu_concurrency_managed workqueue attribute

 include/linux/workqueue.h |   9 +++
 kernel/workqueue.c        | 173 ++++++++++++++++++++++++++++++++--------------
 2 files changed, 132 insertions(+), 50 deletions(-)
---
base-commit: 9d4815c14f7faf789aeaa63515024168daf0390c
change-id: 20260914-wq_final-bcfbcd3b0f79

Best regards,
--  
Breno Leitao <leitao@debian.org>

