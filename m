Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E047283FE5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548545; cv=none; b=PEBfT0KnTVcfBourgHoNzINNvReJH41isiTaDB+S7G3omj96I/EEOl+H+WJdnYWNILG4EZ0WBKrsgr+u09iRHvMqz9KrYG0kR3yAgOXzgsa1siqcuvzKzRq2TSGz1t4UlBLjQ1Wh1bK8U7FiH6/mgXufwS4jqTYexmNI8TYnXIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548545; c=relaxed/simple;
	bh=W8aDCU57pyg1sEIwBUYJfR2HCl+j9IoeiNI3saqRcDI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U4Wh6pmZu412KIWFMPxTSWn7u/+6MMjgm10l2ovwMcu0nSs8eHcRRWxd61QXkShG41f9J65NS44dmTVbmx6qlLPW2TMBT3ta2/eULZQabRActtjiFJLdFjdxV2Zs2x/5Viwl20DWjRb2Y1qsIvZSe0kv94eraZxzYOg2wo+dmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Qs0GQ97a; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Qs0GQ97a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=gaeTMLlbey2LMiX1Gv3nVSAkM2Vcm//pXrSZZzdDCDA=; b=Qs0GQ97aFEqt1R9PeOibxMZDaA
	VyTl07SvUpqF+4B94kPWdjLnDGHE1LmOZFDSwDeyOwGfCoJ7aDTVxtGTaiuXvGrBrdOj1EhhrJvDZ
	vJF3yOlTXlHELyYFrQcuI6MvIx5bOnXLyVe8RVogGsUaTpfq+9dAnZJeZLUlITY9CorO122EO6M/E
	aZnR1CTS23EA/7hfDBKm2P7za+1JOFImU0dwCrkMF7m0J/By0R4GkT4yrz4+T/4Z11XhfAA/Y+OCn
	rbvrl0ZBGMINivX5jzLmuygeAkEIR0XojA+fCFV95mXTZ6hx3RtmQUWKc0m+5QfTwhpGt35wF1mYX
	xsRcKmQg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xF9c6-000WjX-1M;
	Fri, 09 Oct 2026 12:22:15 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH wq/for-7.4 v3 0/3] workqueue: Keep max_active and
 percpu_max_active in sync
Date: Fri, 09 Oct 2026 05:18:33 -0700
Message-Id: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJrbyGoC/1XNywqDMBCF4VcJszY2iXdXfY9SiokTHSixJiW2i
 O9ekELt/vzfWSGgJwzQshU8Rgo0OWhZljAwY+cG5NRDy0AJVYpG5nyZb5Zcd+faWG36TAtbNZA
 weHi09NqpCyzzyU6eV2kO14TBSOE5+ff+EuW++IL1D4ySC16YPDOi7lSpzblHTZ1LJz/sSlSHU
 hWHUnHB61IgikLJssG/ctu2D7QnrnznAAAA
X-Change-ID: 20260914-wq_final-bcfbcd3b0f79
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=3244; i=leitao@debian.org;
 h=from:subject:message-id; bh=W8aDCU57pyg1sEIwBUYJfR2HCl+j9IoeiNI3saqRcDI=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqyNxz5ulh1v/vN2JuQ2uFiZHz6GstnOD23LgyE
 8cEZRRgl2aJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCasjccwAKCRA1o5Of/Hh3
 bfYID/oCs4Yuol9zk8VEbojl0PLC3ROAdm5x8y/Qr1NZv9Y+gSCooB41J2gHuEKN31tk06a4Med
 tCQYu9Nt80k8sM4NApM5PVbq/pm8+Xf9o4EllgEyiuWm8FgQ5n5HFPnYVwKl3HqLBeHKaTX7Nco
 Ktcg6MACMt8dxmcTbkGZTjQvWjre/NAzSMBG6a0kf92WLkciUCF28IldZxWNMmPhRZN7GyRhbaS
 W1XRdHDgOi+XdrhDFFSae4ZxyHo4sboU1KHtnMlX+C5i20r7y96p3TlpAO3nNMddfLss8FCHQiY
 s3hGsoG6aarwU90ZCXf2g5/LIPRH7J6IKIuAIxi2JKprK6Yy6EQvpB2O9V4lHqrFIATk5MBvrMg
 bobgbS/0KjpfKkY29VuaoRSWm63Q50Ft5VQiS3W3IteOmL0P8NCqq1c58GsFHqscUq1Jwh5pFCI
 uJBClFcjIoV+3R4fSLq53OZz8DDXaGirAue9a4djAXUWQlMCw+gQRkgwx3h+tYj/0Xnl238eOaP
 5LEAQpjIxg3e6SnbfNassFB6VPHseL1lckKqRgiLbVehM6CaBFd1GyWMefufZ+bo4+4kzJr1Niu
 7PetNwlE8NU0u/cJtZjLersvBb5Ep1e4gpZ79AjW+8o4GtG+ShywdpBqpr0tl+QJ769oinFKRL6
 +tbOxtCpU2zoj5w==
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

Three patches. The first moves the initial limit setup out of
__alloc_workqueue() into wq_init_max_active().

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

The third rederives both domains once CPU topology is known. Workqueues
created before smp_init() brings up the secondary CPUs compute N as 1,
and nothing revisits that afterwards.

This shouldn't change the behaviour of workqueue for now, but keeps the
groundwork correct for the PERCPU affinity scope work it's meant to
enable.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
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
Breno Leitao (3):
      workqueue: Move the initial max_active setup into a helper
      workqueue: Keep the limits of both max_active domains current
      workqueue: Rescale max_active domains once CPU topology is known

 kernel/workqueue.c | 168 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 129 insertions(+), 39 deletions(-)
---
base-commit: 9d4815c14f7faf789aeaa63515024168daf0390c
change-id: 20260914-wq_final-bcfbcd3b0f79

Best regards,
--  
Breno Leitao <leitao@debian.org>

