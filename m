Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890724;
	b=1F5ZA4XhqAoBkJd7Zin1jm0UlPnCTVIlbI0XlJJ5uTTEd9V5hAi0d76cn46M1IWttcfi
	 zaDRwYOh39lEpIX6g/dHk4fDf++hC3wOYCLGWSxOL5WWtMOBy/9yS3eaeU3HGO7cqHNTU
	 FZy/VPnyzkEFbOwZv3wDGBSF5bO90VsknnAvrXHL7W9SpkwpRCqtl5hB+hRzIQFcfcV5z
	 U47ZJQvwJR2bQ8yV+f4Q6tvFbvkODRA96HVjsIo5588o7RWWjch02BjIQgkLLGrExcfGP
	 5eavOBAKULvTodDkzfnd6Uum5OQLcoma2Qq9x4l1HLybBnBgy/DF6qHlyzM47EOOrEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=buOTmB6dMBkT+g+e+VlChs8aFr20egJQvSL81OYURcg=;
	b=w3/foD/V0agMOyzoFG3mY6zYe6RHhcUBHPjrdWIiyZhmXHQwoOGmJOaK5tg9/r7GuwcS
	 NlFypLx4kGzcmRV03RkcVPpGtPWAU25llkEkxgh5VOMU5GvkIvnEgg5CE0WUWgmQJQ95a
	 BKFXGzKgrPXeF+iwsPxFDMUcYO2/bEhAZhMd4RBImEQrjfIHtDV6fwyzMKGmSV1YPVEm9
	 fGpH2nSZvbd8An2jaz0jPHPnDWh/CudlWWME1yl7smPBAY8e6gGkF0Ocj4gSoo1G9PopH
	 ErMf0J8sfbAtG1VhDRl5jfBtiTfWVuOCplM0ANJY1qshPWvYzbHD1Ar6ezjQYsR0mNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=erkvnXUk;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DBE6082BD4
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DBE6082BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=erkvnXUk
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8490a7d6696so1233272a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890723; x=1794495523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buOTmB6dMBkT+g+e+VlChs8aFr20egJQvSL81OYURcg=;
        b=erkvnXUkm8aB2WnNzJftRRZ+DY3KmyWhLQBiAKN1H+E+7MIfMDO4BygWkJitjRi0tL
         cnfkpd94djLeGz3mN70uZ33o0JmOLYklG8e0TwPcNsQIg1NYFGGAd6JWlVqIzAUeDcQ3
         pqqu34NBupkb5GpKm+UgO0gjR+83usYZ9gGULpRsYk/wa2s0m5nkhcjWf0DQavjoiuN/
         cy8XmZPnhKkPTlZecESnfgTDBgXPR+j69xMEHk4m68csit0fOUcImvWWIFIXKMC1oET2
         Xz2T13iY/behXTjKiAUgT6D1d+pxgcdhOBk96ojdwKohdM2q1JuItqbnKUj7JVvTvI1e
         OGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890723; x=1794495523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=buOTmB6dMBkT+g+e+VlChs8aFr20egJQvSL81OYURcg=;
        b=eth8oDssDeSQonGyicK+dwyaH4sSY5Hw3qAWmf6q+4EXOX74C4aFvfT7mQvB0WKbsY
         uFRjsTm1xn+3RZAId7ff14bJ8VZfwNd74pynuxGHXb+5N9VWu2lryJH3swQB5uEfWLOo
         8No1etleOjrJj5UZlpYZ7/SjV52CTCE4Hk+0hadMGiHQc/ixcUN6/vMOjW3UFpWfK5Gp
         CsxVu+JvvoT/BvUXqikwJYK6SRsa3uNhamdAhD7nW0G0xzkpNeguMpcZd5MeZAyautTi
         WMI12pMIw1zjY3k/Zkt0+WjV852LKo4NvKukXGiK7b7xQlFxkcUTznXS+U3K/8mDECni
         idDg==
X-Forwarded-Encrypted: i=1; AKwUvBzI0anOs6GL7GunO62Pwo/fpHi/FIp1u+qu5yI+ft0UPka2Xc+Ecs9EysUFP599XllAjQbO1Pp8h4TnOM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kk9Ya0VzhptShMYKwUC647DwYdxXYh0f5kauKHmY3Tt82ruJ2
	olf9xmjuC/pFUnqgC8hJ0h7netpWK07D945wMew5YtbjITb8smCYNYv+sAtz9FJAOJs=
X-Gm-Gg: AYBFou2VrDk+Ek6s+Jibd5qSy/55L5miSDtzbB7PkN7jcL1YAI1CXzlPEGm7lzTOdqC
	PthGWLBl5Ll7k1o0cddAN46Q/AwglEHsDT07bLGU6kBJUr73Q0UIGE1KJwLgMSK4OqU8YKLXKwA
	1SI0OhgG3JcahA63YZ35BIR6wRSh+Bd4pw6uDruhw5hnVtaXt/kqeGDA4yikII+edJRrEM2Scdv
	cUooZJtl/AqzjYT0xXRGQkFYMjbPDE62sbyOqt5oHpUX4gK4HUdTQ01BHFVvJ1lshmllmMqxoNE
	IFqiSUnkXe4L8fGh19FLowltt93IN21Tmk/prtEzWYqM4K/FAbgx/JSRjLLwgO+69hdPG9IqgD+
	GHg8Z94aoluV9BxvsJ2JQgs7POPzUOrFXyVDpZggM9lfo6QLqm21ilUvH9affmEv8MYJNQDiSV5
	Y1xuhx2CeDl/XlJSf7Qy3+KG68bf6BXuxVI3ZqPSMBD3vfcCXwCrJz7nhcEl64iQ2Gbed2W7jvK
	x8de24Cjou5SyH5ymnPYL8AMZcqW+L76OZSVLIWcBem84iqzKsJdZ+LplkHTjU38GlxTH17tiDL
	OGsNAawAfJY6cP960pN+uf0yTt6i8n3iSeA01BPeJQjbGQ==
X-Received: by 2002:a05:6830:25d6:b0:829:9992:20e7 with SMTP id 46e09a7af769-85d366454f8mr16577501a34.30.1793890723347;
        Thu, 05 Nov 2026 06:58:43 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e603b9sm4639148a34.20.2026.11.05.06.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:42 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:14 +0000
Subject: [PATCH RFC v3 23/90] nsproxy: build the nsproxy the tasks of a
 cell share
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
Message-Id: <20261105-b4-cells-v3-23-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=4299;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=0xMERCPZyIg8/DpTITYMjSEaKK9pIKI3JZmJ5dj+u00=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCAXUMNK5XT1BglVpSfYJxXcdL2YqKiUKoGCbB+p1RuwNLSINsd+5TtlA8aIZenFz5CtnZ5Gt3s
 UK/ZuPhPFrQ0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The namespaces of a cell are a property of the cell, not of its tasks. A
task of a cell can call neither unshare() nor setns(). So a single
nsproxy, created when the cell is sealed, can serve every task that the
cell will ever have.

Add cell_create_nsproxy(), which builds that nsproxy from the namespaces
in the slots of the cell. The uts and ipc namespaces are always new.
Objects in a shared ipc namespace would be owned by ids of the cell and
could outlive the cell. The time namespace is that of the builder.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/nsproxy.h |  9 +++++++
 kernel/nsproxy.c        | 67 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/include/linux/nsproxy.h b/include/linux/nsproxy.h
index dc2447f5f092..02101d96e4dd 100644
--- a/include/linux/nsproxy.h
+++ b/include/linux/nsproxy.h
@@ -12,6 +12,9 @@ struct ipc_namespace;
 struct pid_namespace;
 struct cgroup_namespace;
 struct fs_struct;
+struct cell;
+struct net;
+struct user_namespace;
 
 /*
  * A structure to contain pointers to all per-process
@@ -101,6 +104,12 @@ void switch_task_namespaces(struct task_struct *tsk, struct nsproxy *new);
 int exec_task_namespaces(void);
 void deactivate_nsproxy(struct nsproxy *ns);
 void nsproxy_free(struct nsproxy *ns);
+struct nsproxy *cell_create_nsproxy(struct user_namespace *user_ns,
+				    struct mnt_namespace *mnt_ns,
+				    struct pid_namespace *pid_ns,
+				    struct net *net,
+				    struct cgroup_namespace *cgroup_ns,
+				    const char *hostname);
 int unshare_nsproxy_namespaces(unsigned long, struct nsproxy **,
 	struct cred *, struct fs_struct *);
 int __init nsproxy_cache_init(void);
diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index 2dcf105e8ee2..bfdd392f4007 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -28,6 +28,7 @@
 #include <linux/cgroup.h>
 #include <linux/perf_event.h>
 #include <linux/nstree.h>
+#include <linux/cell.h>
 
 static struct kmem_cache *nsproxy_cachep;
 
@@ -242,6 +243,72 @@ int unshare_nsproxy_namespaces(unsigned long unshare_flags,
 	return err;
 }
 
+#ifdef CONFIG_CELLS
+/**
+ * cell_create_nsproxy - make the nsproxy every task of a cell shares
+ * @user_ns:   the user namespace of the cell
+ * @mnt_ns:    its mount namespace
+ * @pid_ns:    its pid namespace
+ * @net:       its network namespace
+ * @cgroup_ns: its cgroup namespace
+ * @hostname:  its hostname
+ *
+ * The nsproxy never changes: a task of a cell can neither unshare() nor
+ * setns(). It takes its own references. The uts and ipc namespaces are always
+ * fresh, the time namespace is the caller's.
+ *
+ * Return: the nsproxy, active and with a reference for put_nsproxy(), or an
+ * ERR_PTR().
+ */
+struct nsproxy *cell_create_nsproxy(struct user_namespace *user_ns,
+				    struct mnt_namespace *mnt_ns,
+				    struct pid_namespace *pid_ns,
+				    struct net *net,
+				    struct cgroup_namespace *cgroup_ns,
+				    const char *hostname)
+{
+	struct nsproxy *cur = current->nsproxy;
+	struct nsproxy *nsp;
+	int err;
+
+	nsp = create_nsproxy();
+	if (!nsp)
+		return ERR_PTR(-ENOMEM);
+
+	nsp->uts_ns = copy_utsname(CLONE_NEWUTS, user_ns, cur->uts_ns);
+	if (IS_ERR(nsp->uts_ns)) {
+		err = PTR_ERR(nsp->uts_ns);
+		goto out_free;
+	}
+	/* Nobody else can see it yet. */
+	strscpy_pad(nsp->uts_ns->name.nodename, hostname);
+	strscpy_pad(nsp->uts_ns->name.domainname, "(none)");
+
+	nsp->ipc_ns = copy_ipcs(CLONE_NEWIPC, user_ns, cur->ipc_ns);
+	if (IS_ERR(nsp->ipc_ns)) {
+		err = PTR_ERR(nsp->ipc_ns);
+		goto out_uts;
+	}
+
+	nsp->mnt_ns = mnt_ns_get_from_common(from_mnt_ns(mnt_ns));
+	nsp->pid_ns_for_children = get_pid_ns(pid_ns);
+	nsp->net_ns = get_net(net);
+	get_cgroup_ns(cgroup_ns);
+	nsp->cgroup_ns = cgroup_ns;
+	nsp->time_ns = get_time_ns(cur->time_ns);
+	nsp->time_ns_for_children = get_time_ns(cur->time_ns);
+
+	nsproxy_ns_active_get(nsp);
+	return nsp;
+
+out_uts:
+	put_uts_ns(nsp->uts_ns);
+out_free:
+	kmem_cache_free(nsproxy_cachep, nsp);
+	return ERR_PTR(err);
+}
+#endif
+
 void switch_task_namespaces(struct task_struct *p, struct nsproxy *new)
 {
 	struct nsproxy *ns;

-- 
2.55.0

