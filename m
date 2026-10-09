Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8CC4D598B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548555; cv=none; b=SeAv9K8G9fnRcG/Dgouu8qDNw1naG8dYErhhrMxf3mk/VkBGGNLH1PadOds4y1V/lye+0XvGI/tkkg2TBWNG8RkXTHHYoGzZbp6Z+e4H/TcDapB1+sxN1u6v1G07+u6PQBU1MRP+c+qyCjqzeyt/i+2K7ryIMiROlsuY31ebzFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548555; c=relaxed/simple;
	bh=nFn8z+rlcuiI4arDFFP/mx/deyFxVpJKMpd28MOpwzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecoNcuwG8OytF+JLX7zXR+hy7A28i0vwOYAOQaMObrofqj7NvUIOpGAxB5S9WlIUqB8J1b/nXjIS5NIWw+o5qdm4vffvDupUETspHJWF/NCiI+YXgJbiWNYz+vDetR9syqvXsrr5ULCuO6ut/CM4BjN4Z734AZ/E70yluMIooYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=IkW/Cu4t; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="IkW/Cu4t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=ZPNO6BBto2A5RmSPR/yidY0R7Z5Tt7ti/Bgatn4+fl4=; b=IkW/Cu4t0lA5uvgmK/JLoxUMy1
	2+2BkqvBpC5EoMmZnEhCEL901QiyU32oUPpi6lpcjQ2DCUMgfo+wyGr4/zksPnmukF8k7Pa+dppTW
	zVNdZNjX4/+CVlgxnniyqwdN7EN3BGDOXroYFV4t3aeIFafHr7SfK/Ky2qFneD+YP4xX+7or1DYDi
	c7AEjVqrPFyzEd5MZx6nuVT5aI+tDeYyhiDKXwz386kytcRxjM9MzAPSYTiEScflBJuxfyGffI0oN
	akBkKuUdSGwyUE3D0WIFkr3YgeElFQoyr5KVSGX/xOE3cQJGlbjdiwceczIPq1AuVzuRXa/mGcdmv
	LOFd4Pcg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xF9cH-000Wju-2o;
	Fri, 09 Oct 2026 12:22:26 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 09 Oct 2026 05:18:36 -0700
Subject: [PATCH wq/for-7.4 v3 3/3] workqueue: Rescale max_active domains
 once CPU topology is known
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-wq_final-v3-3-eb0b095b9de3@debian.org>
References: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
In-Reply-To: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591; i=leitao@debian.org;
 h=from:subject:message-id; bh=nFn8z+rlcuiI4arDFFP/mx/deyFxVpJKMpd28MOpwzs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqyNxzozuFNvV9DkMY8s+2INFFuxGQ9/Fw4ib5O
 SJ+xCUECkGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCasjccwAKCRA1o5Of/Hh3
 bZvYD/4oZZRESCjkpZbJowrh1PtZSCt9OFfUS43XbXD+ieT0njQriH3Kz1VsHs7S8G0Sfp0LBSF
 HVi0Q4nQGDYnxnKFWJtqtjNwg7w/K9f4ktYNSWAeYo0CWfRBkXD9Np4uEAh/EkxnBJfKo3cud4k
 L/1PXuGqvinKIn3Va13+TcxmphzngB7r0K8VRoRr6sZTOP1wm/feVfUTe7EzXeFvVA93npNh7lY
 m+/k20J78fgNYNNGV71I2LfI5LF16VmAZWT8c6OjjXRxfwKiJ4uFaqwnqfj9g6vwG8BoRfv3Wj6
 ruxjTLUC6aT4ci5nWQSMGSUrqOmRPAHjYj468UY7l8Daj/stxSffCF9CZPH8LxTSlZG5XZz01KZ
 hzoLal9zkDPtHd7PzbsNguh8APXXe0vCbytl8QG36pFYCDN68CA4fFXonVnQkKvQch5+wR4Tc4V
 Ryip4brIqPaudZW4LRcQ+gTHN4SODWS5J7Eex9iYJJML3Vk0vztQYsG05KQWsdJW4GKLxbcnklp
 iDca30Q+vJmRtuuDs6NPSzbPTi73502ixFx17FKQyI/XakinbTlYxzQPn4Jofn32CHJesbFXmji
 9WyCej1MTKEPoiMxdUpjZdwCAA9azGMl/a5OSzBe5u+y/p35zn7CjCsqXR4v0lpwqUFHDttopgI
 mMmJ9uIiPBofB+A==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

wq_init_max_active() derives the domain a workqueue's backend doesn't use
(percpu_max_active for an unbound workqueue, max_active for a percpu one)
from the number of online CPUs at creation time. Workqueues created by
workqueue_init_early() or an early initcall run before smp_init() brings
up the secondary CPUs, so that count is 1 for them, and nothing
recomputes it afterwards.

Redo wq_init_max_active() once workqueue_init_topology() has the real
CPU count, in the same pass that already walks every workqueue to update
per-node max_active. With one CPU online both domains were equal, so
saved_max_active is still the max_active the workqueue was created with
and can be passed back as is.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 244a199f2dd61a..dd52a7d0999d17 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -8870,6 +8870,16 @@ void __init workqueue_init_topology(void)
 	list_for_each_entry(wq, &workqueues, list) {
 		for_each_online_cpu(cpu)
 			unbound_wq_update_pwq(wq, cpu);
+
+		/*
+		 * wq_init_max_active() ran before smp_init() for these, so
+		 * saved_max_active is still their max_active argument. Redo it
+		 * now that all CPUs are online.
+		 */
+		mutex_lock(&wq->mutex);
+		wq_init_max_active(wq, wq->saved_max_active);
+		mutex_unlock(&wq->mutex);
+
 		if (wq->flags & WQ_UNBOUND) {
 			mutex_lock(&wq->mutex);
 			wq_update_node_max_active(wq, -1);

-- 
2.53.0-Meta

