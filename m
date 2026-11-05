Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891519;
	b=IdirqN1YGPdCaZaNhaVZhPABFZcohuR/qYFsr38FdhK/qSjb7lAt3gKMuNls4/W+l9k6
	 t8T9f8bfQO23xGi1GYZ64l6eZF79KCfDy6kCGkOcmPKngWdvU/Bb0HbkCyzfzw2K+D4hN
	 54k7CJZHhusCEDpzLw4rey9tSGpkYk5BpZfIQnsR1xNSMq/6G79OEiRjfX+i5sllHoyb9
	 ikDALuw8rnGQxVgdGR/MWN/KOdUpQ/Bl0z9hr4HbE4MF7eegjnj3+wbAU7S6U2aEYpVsS
	 8eFRAPsd5H6z9lI0cCOV5qowd/jN6bWcdfyKkQzJSDWngvb94Te6R9hatb9S5ECKtig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=H45zSOjZjoenOo5+vQi3ctFFbpAK9DxH3RfSXKf38UU=;
	b=jqloomqETcyRA6xzIQF7d2R7BvA8vRqpGzryRp2kkUjHp4Nih826dtKGVjb1j/GPO4hK
	 IPcQMXlr7C5nN6dLwNVjTDrydYFXGL+wEBvKQ1cMU+VNaw8NW3gD713quAK4iPmjmDmnt
	 8646TcEen+tTrvnQeNxjyrOIrlPz9PL3QVzlmpkIum6CuLfgn0zaizL948wd7rTMGl0pW
	 QOyztovogSL3YF9MQeGBGL5m68N11xLd3YKC+s+NcA7BCkTho9wcW53lb7KeOPtNJx+uv
	 WX7YxPAB9WfEJnpb0OcHkaPMVs/gQkyj9YA+UWRNKLuAFnBqUD7DkC4w+x6E6rqtihw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Dz9cUGPp;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81558606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81558606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Dz9cUGPp
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0d91601bdso6125877b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891518; x=1794496318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H45zSOjZjoenOo5+vQi3ctFFbpAK9DxH3RfSXKf38UU=;
        b=Dz9cUGPpVp0YGFtu6qDl1ZUjxU7qrx8Nqw9fLY5Db1A7JCFVdZNz+Xyh/RpxR0SejI
         De2MZG5JdnY5Rv4Ks6wlZWSJuU5U47yDbNf2m9VdUFjk/ztqDhWSjhXYfBIcZedSu7yI
         3VGaOqYpYWVBOH7dV4VNIDrfDoT0vS9iT+norA4WF/e77T2RtAshP4NN9GyxuBQP0Q3R
         qEbLmORR1j1Z5U5HgQmnQXsAvqcT2vQIRQhZynfpVA/3DkHn09RxvkDzEuLd9nKxp2y5
         bN4mRSph8vrzbcqLl0llg31D1gSoqGp6OzlKWwnzL795MXT6DSeu97WI60aM71eNCNiV
         rohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891518; x=1794496318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H45zSOjZjoenOo5+vQi3ctFFbpAK9DxH3RfSXKf38UU=;
        b=2Zp1CSA6v3ftOc2rIXZJvLCHRGI/oOCYX1Dl0NdjWZMqq1nAptVm/761fH+eJHx1zW
         8BOivyPEX1ETIFnosDhoe+9KQg4ditw2sFqq8J6+5W7n02CkMosGKOqaq7Zlh5gLMSZ1
         H0tek82yEXVeVapXk5pQRHwdedY38SSVdzPPR96YL/jtTGDWAuUwQUwNfq5JIjDIUNAc
         3Yf837PAvwhBoAoaAkwPQ89pBWxY/0ELJpvj98HAyjsHHBh71OrAQ8oN6xQN136eZlkI
         meq5KeRsPRK6/DLckwB2dQCdfhHuQ2IbGCJN6mQ833lQEoI7nh57XZ6PgBDz57N61WW1
         Q+sw==
X-Forwarded-Encrypted: i=1; AKwUvBygA7bnAcngEFpMZedgIy4mO7sn03fLXvEgwZoBKwxlEKbCbS7cr6wU7ELFL9LQt/B6VnmW42Jc9HJyA70=@vger.kernel.org
X-Gm-Message-State: APuU4Z86MEQElIDOS7fcOVLuTVEEnDoSZrXPg93VBsKpCm2DQZTm2Loa
	N2WIAinxrBAnxxkxyrnxTMvUaUlLR1Ty/0FIwMR0psGfhI8mf9adgZC2A10T55xfetk=
X-Gm-Gg: AYBFou3LbCMdANyft5GuewWCU4z2u1hLOVg3GLbOHHCGZxhwFJ7/YoVvy4BBue9Ms7O
	hl/glLNhmdrfbMCELYDNTJaQ8wru6DthHeNw9jJyVn7EV+61XgABMPSY736TR3czBbNAoPwvI/q
	3OqbMjsnGlNn7RnBawwM8qjke/bcn1J94pr+0ckRKTU7MajYecZEKx0KusbIM7ec3bGU7+FNwQz
	6rouqHHdhcv0VDyP1JknuarmbfE2ysrP/pVW0qAcqargaCZY4Abi9aXJGZk85uC5DgHh2UBwTp/
	715mqEtGvhMY+d1d4tRWmkYlPxwHaS09w4SiF37SRxQ64CRSTNPAY1kphLdSpBCqujB6Zes4dS9
	aquOdO9D8x4Syq2Tq22gKRP7DnyovrgHk5uRRcM/FAD5WF13dnQ5nngmsgMp/Zel37bQElejnIR
	fnR6hVkc96OUL1zGHu8DI5LRclw7YrG7qimBMQ2J0ARQDnZucl4jeErj6QSYC1qEjpUey2lA5yH
	IHsf9sdzcdVhhpQ3+Fbnz0cLkrKpe20D6EiYvU2yKFtfYhVFNT1F0Hf5DOpC0wYxd8hV1F8tivF
	f1m5fLRdYPD0bUEUS5ZwLAoapoKd38XV16mNBnK7sXIr9Q==
X-Received: by 2002:a05:690c:f8e:b0:8b2:f8df:2974 with SMTP id 00721157ae682-8b328e2ba33mr15959347b3.21.1793891518237;
        Thu, 05 Nov 2026 07:11:58 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33201e32esm10503007b3.12.2026.11.05.07.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:11:56 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:24 +0000
Subject: [PATCH RFC v3 32/90] cells: add CELL_CMD_SEAL
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
Message-Id: <20261105-b4-cells-v3-32-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=4995;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=NUS4JBlb79Oq60txyDxRA3sMwj01Ez/XKn4+RaBQJ5M=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKarR2eXW0EvxraghfXTRNj0dPj7lNZEn6Bmuu9UOHLTaYF5j47dn6cZbfh7KPq/ZYLaOZ7DWfC
 dmrJr6sJw6Ag=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Sealing turns the contents of the slots into a cell that can run tasks. It
validates everything or fails. All the steps that can fail come before the
mount namespace is sealed, because that step changes the namespace in
place and cannot be undone. If the seal fails, the cell stays in the
BUILDING state, and keeps whatever the seal had filled into empty slots by
then.

A cell must have a root and a budget. For the rest there are defaults:

  - If no ids were requested, the cell gets a single id.
  - It gets a new network namespace that nobody has set up. The namespace
    belongs to the user namespace that the cell was created in.
  - Its pid, ipc, uts and cgroup namespaces are always new. The cgroup
    namespace is rooted at the budget.

In a cell with a block of ids, ownership of the budget is given to the
root user of the cell.

Once sealed, the cell cannot be changed any more.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cell/slots.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/kernel/cell/slots.c b/kernel/cell/slots.c
index 6ce8892f7908..81f43744e858 100644
--- a/kernel/cell/slots.c
+++ b/kernel/cell/slots.c
@@ -73,6 +73,26 @@ static int cell_set_root(struct cell *cell, struct file *file)
 	return 0;
 }
 
+/*
+ * The network is set up from the outside and handed to the cell, as the tree is.
+ * So a network namespace that is made for a cell belongs to the user namespace
+ * the cell was made in, as its mount namespace does, and no capability of a task
+ * of the cell counts for it, see cell_set_net_rights(). Nothing is done to it here:
+ * until somebody sets it up there is a loopback device that is down.
+ */
+static int cell_make_net(struct cell *cell)
+{
+	struct net *net;
+
+	if (cell->net)
+		return 0;
+	net = copy_net_ns(CLONE_NEWNET, cell->user_ns->parent, current->nsproxy->net_ns);
+	if (IS_ERR(net))
+		return PTR_ERR(net);
+	cell->net = net;
+	return 0;
+}
+
 static int cell_set_ids_binary(struct cell *cell, const void __user *uvalue,
 			       size_t len)
 {
@@ -109,6 +129,85 @@ static int cell_set_fd(struct cell *cell, const char *key, struct file *file)
 	return -EINVAL;
 }
 
+static int cell_make_pid_ns(struct cell *cell)
+{
+	struct pid_namespace *ns;
+
+	if (cell->pid_ns)
+		return 0;
+	ns = copy_pid_ns(CLONE_NEWPID, cell->user_ns, task_active_pid_ns(current));
+	if (IS_ERR(ns))
+		return PTR_ERR(ns);
+	cell->pid_ns = ns;
+	return 0;
+}
+
+/*
+ * Everything that can fail comes before the mount namespace, which is changed
+ * in place and cannot be changed back. If it fails the cell is still BUILDING.
+ * What was filled in for slots that were left empty stays filled in.
+ */
+static int cell_seal(struct cell *cell)
+{
+	struct cgroup_namespace *cgroup_ns;
+	struct nsproxy *nsproxy;
+	kuid_t root_uid;
+	kgid_t root_gid;
+	int ret;
+
+	if (!cell->budget || !cell->mnt_ns)
+		return -EINVAL;
+
+	if (!cell->ids_count) {
+		ret = cell_set_ids(cell, 1);
+		if (ret)
+			return ret;
+	}
+	ret = cell_make_pid_ns(cell);
+	if (ret)
+		return ret;
+	ret = cell_make_net(cell);
+	if (ret)
+		return ret;
+	cgroup_ns = cgroup_cell_ns(cell->user_ns, cell->budget);
+	if (IS_ERR(cgroup_ns))
+		return PTR_ERR(cgroup_ns);
+
+	nsproxy = cell_create_nsproxy(cell->user_ns, cell->mnt_ns, cell->pid_ns,
+				      cell->net, cgroup_ns, cell->hostname);
+	put_cgroup_ns(cgroup_ns);
+	if (IS_ERR(nsproxy))
+		return PTR_ERR(nsproxy);
+
+	/* The builder cannot name the cell's ids, so it cannot do this. */
+	if (cell->ids_count == 1) {
+		root_uid = cell->user_ns->owner;
+		root_gid = cell->user_ns->group;
+	} else {
+		root_uid = make_kuid(cell->user_ns, 0);
+		root_gid = make_kgid(cell->user_ns, 0);
+	}
+	ret = cgroup_cell_chown(cell->budget, root_uid, root_gid);
+	if (ret)
+		goto out_chown;
+
+	/* Two references: the slot's and the nsproxy's. */
+	ret = mnt_ns_seal_for_cell(cell->mnt_ns, 2, cell->user_ns,
+				   cell->ids_count > 1, &cell->root);
+	if (ret)
+		goto out_chown;
+
+	cell->nsproxy = nsproxy;
+	cell->sealed = true;
+	WRITE_ONCE(cell->state, CELL_SEALED);
+	return 0;
+
+out_chown:
+	cgroup_cell_chown(cell->budget, cell->budget_uid, cell->budget_gid);
+	put_nsproxy(nsproxy);
+	return ret;
+}
+
 /**
  * sys_cell_configure - change a cell
  * @cfd:    a cellfd
@@ -156,6 +255,10 @@ SYSCALL_DEFINE5(cell_configure, int, cfd, unsigned int, cmd,
 		if (!ukey || uvalue || aux < 0)
 			return -EINVAL;
 		break;
+	case CELL_CMD_SEAL:
+		if (ukey || uvalue || aux)
+			return -EINVAL;
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -194,6 +297,8 @@ SYSCALL_DEFINE5(cell_configure, int, cfd, unsigned int, cmd,
 			return -EBADF;
 		return cell_set_fd(cell, key, fd_file(slot));
 	}
+	case CELL_CMD_SEAL:
+		return cell_seal(cell);
 	}
 	return -EOPNOTSUPP;
 }

-- 
2.55.0

