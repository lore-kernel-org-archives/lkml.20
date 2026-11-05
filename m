Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891941;
	b=e7S3+Qt/eLB9x0Oz40y9PzMwpEDeB03UVquLXLy7jHrWaxYkLZTP2Gm7kYlZYoCSRf+4
	 4pborPdPkZ1HfF90l+tP++Dp0ghGb8Eabs8RE6ERtUNjMSUoyfjPXd+3H8n93aYMY8hUo
	 PxgepJHfEdUDVGVJLEAETuA70T/By3esF06ugUp8N+TKhHIzpKEqIpt+hMPiKceQj32va
	 111hDzCSDqngfwA8LiESNZrMDedSbMwyRRLNOGFWTuWSBQfdQ2XvbKkpyzC9DtZn1f2Xg
	 p8xDhVKBAJEwZXytbf1yaKSJMjB7dQwtjPkOi/KAeSvGWLkHgWrULUiGXvMkun9jujA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=29Wcn8VZVI0znrdWFKpYtEmcEmSy+Ph8VjBMpfbMViI=;
	b=pjjK+TM+EdMtuErOWeEFYU8a2PB7yMEjwCvO3PHMRnfl3YFomkgTyV+hIFeZCYTYTSkH
	 dyGKSCKhKP1V9VpcvooiVji8Feookm3BGQH51Ei2XhqaCqJkx1s8zEzhc0KHpPK9Lvb6v
	 gx/RsRN9l24HjHQguXW1q0HUpoxpfM3Xnj+ktRZsQNAGzFaqFmyt9XA06iDuYjiqO/TqT
	 JbL9rWSSfynNW+3A0ikIntK6rYMuMC9wLuunBS5KxrX63lLo9pXMI1uIMMoSfxg8N2Hzd
	 rqP9z7gAobyaq8SwxWWXDmBJBFsKAzqDOoiR1aC6f1z2CRwgJdWWKkIdVxQahlfwPew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ORzi628Y;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C7F606D805
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C7F606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ORzi628Y
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso1153705137.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891940; x=1794496740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=29Wcn8VZVI0znrdWFKpYtEmcEmSy+Ph8VjBMpfbMViI=;
        b=ORzi628Ywf7tkC7e5KuDc2beIANm/QHXKFAiEueOKJrw27BOvQLhVrkflptzGFQ1VM
         IF8+L3sJ5aFj6TKOg57TJAloXx6EN6Hh5Aus+INIfZXWc4Fu3hHEk6nl9g6NyctjgmYD
         I2syo7vmLVvYHlvRSLFi54LecuGfGwhhrimfI7AfXXVL+neULamQ3zBGAgug0psWQUj/
         xp+J3nO5VpT1V/ngImFEhC5ILi9S/+gmL+xD8djiNAlCFezV0OnsM+27rfqZd7miZxs2
         ocxF4KMlSbCB8dpGkdESMDDhU+P/IVhw3YNvJ2fKtg4BSxYYxoa92+1btM97rpAHokxb
         QBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891940; x=1794496740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=29Wcn8VZVI0znrdWFKpYtEmcEmSy+Ph8VjBMpfbMViI=;
        b=Kx0aFPRlE5lLYj+0hXr5ZyqID7YfuJwD8484qNYzdA8TmBEEOhQboSxDSleMcdArti
         NuOj8F4MOaWLPNoX7zw2Y0+ixQMoJaY69CH9M+zK3JkABMC52SyhOFkBEASegUw9+NSP
         YVzzNC+CcjhyvLOpe6acauZNeApaqyPHuDWN5v5XAZJj041U12x4tgosccWala2MKaxg
         zT2mBNjlZvfrCCaqzmfQ5qfbxOXefdvFl0G+I9y0SPY/s7x3Jh1V1IgrDq0BMUQBnnBz
         lvCQemR1yXxU7gQjGjbyiAdPw/IX8EFn6SDdicPT/MywMJPY+jFEzawWenSlQFKjCaYk
         wU3A==
X-Forwarded-Encrypted: i=1; AKwUvBx2x6WJeNnLvKMIN1uypPU45ULRWgBD88w7KCuQCJ1aUgZDR9dn8HlsSujsI/U0Si/f9VP9AG3irwPVm1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KDEq5lwXgtBW31X7NNxHasBeKqVcxvAGxgxnYMVSOkCUj47Vt
	L+wIuksB0ttMC+qCQUVpr6IpoJlUzOT+LnSJe9CkzrrAuRSMLb9Cttq+j5hWAPNFV6E=
X-Gm-Gg: AYBFou0WJrudweeAQ1OrkRo93tcRxdiIdLmpIqinh+R96aGtmx+y6jjbYcoa/QL/DPr
	DQuMiXQVQtSm9mh3fgjOJWrZ1Bg3SyrUPy9wPyXwLuZnms50r4fEzCmVZ1Emhd4hMOhwFIoPX5a
	KNAiXd5byAPMvPiirUBMEl5OtmP5g/eWaA+S7wzwKDaiktI7nnMrJFvBl79VsIOlZ1fGF1ggLhW
	fQCdjna5XpE9/RLJYKBYhFFhe7j/ZSa5qFGv8YPXbhR/q84H7AXaS7Vch0Kuk78DC9uNUrYShyQ
	VkO3rDhG4JMQjfsPww1ddpOUiGWJkoppZK5tLQdyGNbbqh7+BhaNmUYFKt2DGEvXn6HF9VMqiF0
	f3oBKc8BUyjXMU0LMnIYMU2DgmA3VGifEkoXqhYrQZAYVR7mXsm+Tl+Tf8gwcL7JVibapCTPzbX
	cj77nFf0E7EyBqqTlEfwThhREukzCjfcsjX5NooXD7xBkdOkHTdnvf2J0BUmO+im9I2odko69p4
	cBeqY3SLwO2B0+Ai5JYoOLpflOoEgakXr/vP0eDWEWzKNJgYP8FXYFwp40MAYEevfySTLztA0ih
	SqnVhyq/vJ8npfSuanFPAb3TAEPOkqpv9Ka6DLCIew1Y
X-Received: by 2002:a05:6102:8099:b0:7cc:bc0:b2d0 with SMTP id ada2fe7eead31-7d072d59168mr9241054137.33.1793891939604;
        Thu, 05 Nov 2026 07:18:59 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dacef6csm49276776d6.5.2026.11.05.07.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:18:58 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:43 +0000
Subject: [PATCH RFC v3 51/90] cgroup: let nothing but a spawn into a budget
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
Message-Id: <20261105-b4-cells-v3-51-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=2695;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=E++I0rAXM0ijSWOuo0ckD4Y6cZuxjdOkUDqziqSMyNw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGlbPkM+IK8ljt1Qf0FTASArh9RrYgt8UUeMbimWgrw517VCLhDoZ7AOVP9uJWgOZJSRpU8fvEe
 8w5+qebotsAI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A kill has to remove everything from the budget, and the cell is reported
dead once the budget is empty.

In its kthread mode, vhost attaches a kernel thread to the cgroups of the
owner of the device with cgroup_attach_task_all(). A kill does not remove
a kernel thread. So a cell that was given a vhost device could prevent
itself from ever being reported dead.

Refuse to move a task that is in no cell into a budget or below one. Do
this in cgroup_attach_task(), which every way of attaching a task goes
through, and for CLONE_INTO_CGROUP. Budgets do not nest and a task of a
cell stays within its own budget, so no other case needs a check.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cgroup/cgroup.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 1286f5d318b0..3fc1f9ac2268 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3087,6 +3087,30 @@ int cgroup_migrate(struct task_struct *leader, bool threadgroup,
 	return cgroup_migrate_execute(mgctx);
 }
 
+/*
+ * May @task, which cell_may_migrate() has no objection to, be put into @dst?
+ * Budgets do not nest, so a task of a cell is within its own.
+ */
+static bool cgroup_cell_may_enter(struct task_struct *task, struct cgroup *dst)
+{
+	bool in_cell;
+
+	if (!IS_ENABLED(CONFIG_CELLS))
+		return true;
+
+	rcu_read_lock();
+	in_cell = task_cell(task);
+	rcu_read_unlock();
+	if (in_cell)
+		return true;
+
+	for (; dst; dst = cgroup_parent(dst)) {
+		if (test_bit(CGRP_CELL_BUDGET, &dst->flags))
+			return false;
+	}
+	return true;
+}
+
 /**
  * cgroup_attach_task - attach a task or a whole threadgroup to a cgroup
  * @dst_cgrp: the cgroup to attach to
@@ -3110,6 +3134,14 @@ int cgroup_attach_task(struct cgroup *dst_cgrp, struct task_struct *leader,
 	 */
 	if (!cell_may_migrate(leader, dst_cgrp))
 		return -EPERM;
+
+	/*
+	 * Nothing else gets into a budget. A kill is to take everything there
+	 * with it, which it could not do to a kernel thread.
+	 */
+	if (!cgroup_cell_may_enter(leader, dst_cgrp))
+		return -EPERM;
+
 	/* look up all src csets */
 	spin_lock_irq(&css_set_lock);
 	task = leader;
@@ -7024,6 +7056,13 @@ static int cgroup_css_set_fork(struct kernel_clone_args *kargs)
 		ret = -EPERM;
 		goto err;
 	}
+
+	/* And nobody else forks into one. */
+	if (!cgroup_cell_may_enter(current, dst_cgrp)) {
+		ret = -EPERM;
+		goto err;
+	}
+
 	/*
 	 * Verify that we the target cgroup is writable for us. This is
 	 * usually done by the vfs layer but since we're not going through

-- 
2.55.0

