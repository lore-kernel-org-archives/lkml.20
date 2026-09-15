Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24E9411A04
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475394; cv=none; b=ZdYaGK1t2b/TmiMLhtOV4Ywa1eo2yqL/fWook9r7/J8y1HdEc11aWuyJD8y2khcdRNFPIPau/TR00RnzqjJt1LRD2j9RV76Oo8K/R0Yyb67oZUsrM67D6wtmpvcLY59clZHZV/krn2b3JFn/GKG3lWzN6iDDKnQ5Sd9HTOiYdVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475394; c=relaxed/simple;
	bh=vJAM9sutsq7sJnkb+/yMxn6NGAItDTVxLg3sByYc9PY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=c1EGTYDqvIxT+0twqCVOtXNTzpSph3fn7ob+5cLlrO0vsQIIYZp0rA3aArpV04MllaqIUemlDM4uEJrg2cAEgEzfPS9z4bOA9c266qj/vmZxDPQbXqvqDRTQ7xy5ZFEKlg6GleqmSbRfNAeJ1gRLfYUf9XMRISyXUUAXZMEyT/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8056a93e0e3so5817839a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475391; x=1790080191;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M3dv1eSc3nwTLlwFKEjDi7G5MZ29vl+2KOpG8VBkbf8=;
        b=AC0jH7sPRnxKhsvXLUPzFgYzYpCuJnpoWF7yYIVWDBs0tzjEk5dCRftU4riUgbOtOB
         WpNRCmsOoXtRzxqgLYKBiuYVA95g6EbyQmZuE91bL9yMC+V4sl3g0cGOCDl6SG+ryyR7
         sVGu1dTeteYRNCIFKZ9TkdrraseLnNiLOKgrajmBgflfbFA3zDbpoQlqnAvy3biRQAyz
         eNcriBHhmpPgfnVGjlpmxRL6Ew8bXKC8iGkJLSDiy4zCwhGQhqc3DsGpb4Z0Q/KEiV9V
         EwydAi4M1CwMQ67a6Qj95Szg7qUAD71JGH8+sD8/+G6Z522dMHhhUm6zsAq1cvJkef7E
         iJLg==
X-Gm-Message-State: AFuF++l/2CEUNBs0XvKhAK5O7eSvV+TFUuCHdB3uxzEBQYXlhFbTzwsS
	zdhRParq4ViaRJZALKu7BGO7TvXm4xTpEQTs4rFXLsxX8Zg8bS5nsLFWTC/3A/UafAWXhvoMaLO
	8BrNG1ZC80iRRFxDcN3QkpIS/m1s21FXYQHhuVwhAlINO7fXYq2LPiut+Mzc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198c:b0:6c1:a5a7:ab0b with SMTP id
 006d021491bc7-6c53f5578e6mr6684094eaf.10.1789475391615; Tue, 15 Sep 2026
 05:29:51 -0700 (PDT)
Date: Tue, 15 Sep 2026 05:29:51 -0700
In-Reply-To: <6a00e81a.170a0220.1c0296.0218.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa93a3f.f81106d8.2ab401.0066.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [net?] unregister_netdevice: waiting for DEV
 to become free (9)
From: syzbot <syzbot+e2af46126e0644cbebdd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [net?] unregister_netdevice: waiting for DEV to become free (9)
Author: penguin-kernel@i-love.sakura.ne.jp

#syz test

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 87cafc932e9e..d518338cd074 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -2153,6 +2153,8 @@ enum netdev_reg_state {
  *
  *	FIXME: cleanup struct net_device such that network protocol info
  *	moves out.
+ *
+ *	@netdev_trace_buffer_list: Linked list for debugging refcount leak.
  */
 
 struct net_device {
@@ -2312,6 +2314,9 @@ struct net_device {
 #if IS_ENABLED(CONFIG_TLS_DEVICE)
 	const struct tlsdev_ops *tlsdev_ops;
 #endif
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+	struct list_head	netdev_trace_buffer_list;
+#endif
 
 	unsigned int		operstate;
 	unsigned char		link_mode;
@@ -4498,9 +4503,16 @@ static inline bool dev_nit_active(const struct net_device *dev)
 
 void dev_queue_xmit_nit(struct sk_buff *skb, struct net_device *dev);
 
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+void save_netdev_trace_buffer(struct net_device *dev, int delta);
+#else
+static inline void save_netdev_trace_buffer(struct net_device *dev, int delta) { }
+#endif
+
 static inline void __dev_put(struct net_device *dev)
 {
 	if (dev) {
+		save_netdev_trace_buffer(dev, -1);
 #ifdef CONFIG_PCPU_DEV_REFCNT
 		this_cpu_dec(*dev->pcpu_refcnt);
 #else
@@ -4512,6 +4524,7 @@ static inline void __dev_put(struct net_device *dev)
 static inline void __dev_hold(struct net_device *dev)
 {
 	if (dev) {
+		save_netdev_trace_buffer(dev, 1);
 #ifdef CONFIG_PCPU_DEV_REFCNT
 		this_cpu_inc(*dev->pcpu_refcnt);
 #else
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 96848fc1f02b..20c4c92708b8 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -2566,6 +2566,10 @@ static bool rcu_do_batch_check_time(long count, long tlimit,
 	       local_clock() >= tlimit;
 }
 
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+static noinline void rcu_do_batch(struct rcu_data *rdp);
+#endif
+
 /*
  * Invoke any RCU callbacks that have made it to the end of their grace
  * period.  Throttle as specified by rdp->blimit.
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 7980a4a232f9..ad9889563288 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -599,6 +599,10 @@ static inline bool lockdep_softirq_start(void) { return false; }
 static inline void lockdep_softirq_end(bool in_hardirq) { }
 #endif
 
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+static noinline void handle_softirqs(bool ksirqd);
+#endif
+
 static void handle_softirqs(bool ksirqd)
 {
 	unsigned long end = jiffies + MAX_SOFTIRQ_TIME;
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 3c034cbc5bb3..60daae1c6f17 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -3259,6 +3259,10 @@ static bool manage_workers(struct worker *worker)
 	return true;
 }
 
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+static noinline void process_one_work(struct worker *worker, struct work_struct *work);
+#endif
+
 /**
  * process_one_work - process single work
  * @worker: self
diff --git a/net/core/dev.c b/net/core/dev.c
index 38336858c168..93a7594d586e 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11639,6 +11639,14 @@ int netdev_refcnt_read(const struct net_device *dev)
 }
 EXPORT_SYMBOL(netdev_refcnt_read);
 
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+static void dump_netdev_trace_buffer(const struct net_device *dev);
+static void erase_netdev_trace_buffer(const struct net_device *dev);
+#else
+static inline void dump_netdev_trace_buffer(const struct net_device *dev) { }
+static inline void erase_netdev_trace_buffer(const struct net_device *dev) { }
+#endif
+
 int netdev_unregister_timeout_secs __read_mostly = 10;
 
 #define WAIT_REFS_MIN_MSECS 1
@@ -11721,6 +11729,7 @@ static struct net_device *netdev_wait_allrefs_any(struct list_head *list)
 				pr_emerg("unregister_netdevice: waiting for %s to become free. Usage count = %d\n",
 					 dev->name, netdev_refcnt_read(dev));
 				ref_tracker_dir_print(&dev->refcnt_tracker, 10);
+				dump_netdev_trace_buffer(dev);
 			}
 
 			warning_time = jiffies;
@@ -12121,6 +12130,9 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 
 	dev->priv_len = sizeof_priv;
 
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+	INIT_LIST_HEAD(&dev->netdev_trace_buffer_list);
+#endif
 	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev");
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	dev->pcpu_refcnt = alloc_percpu(int);
@@ -12223,6 +12235,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 free_pcpu:
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	free_percpu(dev->pcpu_refcnt);
+	erase_netdev_trace_buffer(dev);
 free_dev:
 #endif
 	ref_tracker_dir_exit(&dev->refcnt_tracker);
@@ -12292,6 +12305,7 @@ void free_netdev(struct net_device *dev)
 	free_percpu(dev->pcpu_refcnt);
 	dev->pcpu_refcnt = NULL;
 #endif
+	erase_netdev_trace_buffer(dev);
 	free_percpu(dev->core_stats);
 	dev->core_stats = NULL;
 	free_percpu(dev->xdp_bulkq);
@@ -13418,6 +13432,12 @@ static struct smp_hotplug_thread backlog_threads = {
 	.setup			= backlog_napi_setup,
 };
 
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+static void __init net_dev_refcnt_tracker_init(void);
+#else
+static void __init net_dev_refcnt_tracker_init(void) { };
+#endif
+
 /*
  *       This is called single threaded during boot, so no need
  *       to take the rtnl semaphore.
@@ -13426,6 +13446,7 @@ static int __init net_dev_init(void)
 {
 	int i, rc = -ENOMEM;
 
+	net_dev_refcnt_tracker_init();
 	BUG_ON(!dev_boot_phase);
 
 	net_dev_struct_check();
@@ -13529,3 +13550,254 @@ static int __init net_dev_init(void)
 }
 
 subsys_initcall(net_dev_init);
+
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+
+#define NETDEV_TRACE_BUFFER_SIZE 32768
+static struct netdev_trace_buffer {
+	struct list_head list;
+	atomic_t count;
+	int trimmed_entries;
+	int nr_entries;
+	unsigned long entries[20];
+} netdev_trace_buffer[NETDEV_TRACE_BUFFER_SIZE];
+static LIST_HEAD(netdev_trace_buffer_list);
+static DEFINE_RAW_SPINLOCK(netdev_trace_buffer_lock);
+static bool netdev_trace_buffer_exhausted;
+static unsigned long start_of_handle_softirqs __ro_after_init;
+static unsigned long end_of_handle_softirqs __ro_after_init;
+
+static int netdev_trace_buffer_init(void)
+{
+	int i;
+
+	for (i = 0; i < NETDEV_TRACE_BUFFER_SIZE; i++)
+		list_add_tail(&netdev_trace_buffer[i].list, &netdev_trace_buffer_list);
+	return 0;
+}
+pure_initcall(netdev_trace_buffer_init);
+
+static int trim_netdev_trace(unsigned long *entries, int nr_entries)
+{
+	char buffer[KSYM_SYMBOL_LEN] = { };
+	char *cp;
+	int i;
+
+	for (i = 0; i < nr_entries; i++) {
+		sprint_symbol_no_offset(buffer, entries[i]);
+		cp = strchr(buffer, ' ');
+		if (cp)
+			*cp = '\0';
+		if (buffer[0] == 'p') {
+			if (!strcmp(buffer, "process_one_work"))
+				return i + 1;
+		} else if (buffer[0] == 'k') {
+			if (!strcmp(buffer, "ksys_unshare"))
+				return i + 1;
+		} else if (buffer[0] == 's') {
+			if (!strcmp(buffer, "sock_sendmsg_nosec") ||
+			    !strcmp(buffer, "sock_recvmsg_nosec"))
+				return i + 1;
+		} else if (buffer[0] == 'r') {
+			if (!strcmp(buffer, "rcu_do_batch"))
+				return i + 1;
+		} else if (buffer[0] == '_') {
+			if (!strcmp(buffer, "__sys_bind") ||
+			    !strcmp(buffer, "__sock_release") ||
+			    !strcmp(buffer, "__sys_bpf"))
+				return i + 1;
+		} else {
+			if (!strcmp(buffer, "do_sock_setsockopt"))
+				return i + 1;
+		}
+	}
+	return nr_entries;
+}
+
+static void dump_netdev_trace_buffer(const struct net_device *dev)
+{
+	struct netdev_trace_buffer *ptr, *tmp;
+	int count, balance = 0, pos = 0;
+
+	/* Update trimmed_entries field. Do not modify nr_entries field
+	 * in case save_netdev_trace_buffer() is called again.
+	 */
+	list_for_each_entry_rcu(ptr, &dev->netdev_trace_buffer_list, list,
+				/* list elements can't go away. */ 1) {
+		if (ptr->trimmed_entries == ptr->nr_entries)
+			ptr->trimmed_entries = trim_netdev_trace(ptr->entries, ptr->nr_entries);
+	}
+	/* Merge duplicated entries using trimmed_entries field. */
+	list_for_each_entry_rcu(ptr, &dev->netdev_trace_buffer_list, list,
+				/* list elements can't go away. */ 1) {
+		/* Skip empty entries. */
+		if (!atomic_read(&ptr->count))
+			continue;
+		tmp = ptr;
+		list_for_each_entry_continue_rcu(tmp, &dev->netdev_trace_buffer_list, list) {
+			if (ptr->trimmed_entries != tmp->trimmed_entries ||
+			    memcmp(ptr->entries, tmp->entries,
+				   ptr->trimmed_entries * sizeof(unsigned long)))
+				continue;
+			/* Skip empty entries. */
+			count = atomic_read(&tmp->count);
+			if (!count)
+				continue;
+			/* Move count from non-first entry to first entry. */
+			atomic_add(count, &ptr->count);
+			atomic_sub(count, &tmp->count);
+		}
+		/* It is safe to call cond_resched() because this function is
+		 * called from schedulable context.
+		 */
+		cond_resched();
+	}
+	/* Report all entries for this device. */
+	list_for_each_entry_rcu(ptr, &dev->netdev_trace_buffer_list, list,
+				/* list elements can't go away. */ 1) {
+		/* Skip empty entries. */
+		count = atomic_read(&ptr->count);
+		if (!count)
+			continue;
+		/* Report this entry. It is safe to call cond_resched() because
+		 * this function is called from schedulable context.
+		 */
+		pos++;
+		balance += count;
+		pr_info("Call trace for %s[%d] %+d at\n", dev->name, pos, count);
+		stack_trace_print(ptr->entries, ptr->trimmed_entries, 4);
+		cond_resched();
+	}
+	if (!netdev_trace_buffer_exhausted)
+		pr_info("balance as of %s[%d] is %d\n", dev->name, pos, balance);
+}
+
+static void erase_netdev_trace_buffer(const struct net_device *dev)
+{
+	struct netdev_trace_buffer *ptr;
+	unsigned long flags;
+
+	/* This function is called after free_percpu(dev->pcpu_refcnt) was already
+	 * called, which means that no more __dev_put()/__dev_hold() call can be made.
+	 * Therefore, no more save_netdev_trace_buffer() call will be made, and we can
+	 * safely return list elements to netdev_trace_buffer_list.
+	 */
+	raw_spin_lock_irqsave(&netdev_trace_buffer_lock, flags);
+	while (!list_empty(&dev->netdev_trace_buffer_list)) {
+		ptr = list_first_entry(&dev->netdev_trace_buffer_list, typeof(*ptr), list);
+		list_del(&ptr->list);
+		list_add_tail(&ptr->list, &netdev_trace_buffer_list);
+	}
+	raw_spin_unlock_irqrestore(&netdev_trace_buffer_lock, flags);
+}
+
+void save_netdev_trace_buffer(struct net_device *dev, int delta)
+{
+	struct netdev_trace_buffer *ptr;
+	unsigned long entries[ARRAY_SIZE(ptr->entries)];
+	int nr_entries;
+	unsigned long flags;
+
+	/* This function is not NMI-safe. Give up if called from NMI context. */
+	if (in_nmi())
+		return;
+	/* Get stack traces. */
+	nr_entries = stack_trace_save(entries, ARRAY_SIZE(ptr->entries), 1);
+	/* Trim traces of process context now if called from softirq context, for
+	 * we will easily exhaust netdev_trace_buffer_list if we don't trim traces
+	 * of process context when trying to compare with existing entries.
+	 *
+	 * Avoid kallsyms lookup, by using cached address resolved upon boot.
+	 */
+	if (in_softirq()) {
+		int i;
+
+		for (i = 0; i < nr_entries; i++) {
+			if (entries[i] >= start_of_handle_softirqs &&
+			    entries[i] < end_of_handle_softirqs) {
+				nr_entries = i + 1;
+				break;
+			}
+		}
+	}
+	/* Compare with existing entries at best-effort basis. Since duplicated entries
+	 * created by race condition will be merged when reporting, we don't use lock here.
+	 */
+	list_for_each_entry_rcu(ptr, &dev->netdev_trace_buffer_list, list,
+				/* list elements can't go away. */ 1) {
+		if (ptr->nr_entries == nr_entries &&
+		    !memcmp(ptr->entries, entries, nr_entries * sizeof(unsigned long))) {
+			atomic_add(delta, &ptr->count);
+			return;
+		}
+	}
+	/* Add a new entry. We don't re-compare with existing entries with lock held, for
+	 * duplicated entries created by race condition will be merged when reporting.
+	 * But we use raw spinlock here in case this function is called with some other
+	 * raw spinlock already held.
+	 */
+	raw_spin_lock_irqsave(&netdev_trace_buffer_lock, flags);
+	if (!list_empty(&netdev_trace_buffer_list)) {
+		/* Remove one entry from netdev_trace_buffer_list and initialize it. */
+		ptr = list_first_entry(&netdev_trace_buffer_list, typeof(*ptr), list);
+		list_del(&ptr->list);
+		atomic_set(&ptr->count, delta);
+		ptr->nr_entries = nr_entries;
+		ptr->trimmed_entries = nr_entries;
+		memmove(ptr->entries, entries, nr_entries * sizeof(unsigned long));
+		/* Append it in RCU manner, for readers are lockless. */
+		list_add_tail_rcu(&ptr->list, &dev->netdev_trace_buffer_list);
+	} else {
+		netdev_trace_buffer_exhausted = true;
+	}
+	raw_spin_unlock_irqrestore(&netdev_trace_buffer_lock, flags);
+}
+EXPORT_SYMBOL(save_netdev_trace_buffer);
+
+struct timer_completion_struct {
+	struct timer_list timer;
+	struct completion completion;
+};
+
+/* Resolve address of handle_softirqs() and cache it, in order to avoid looking up
+ * kallsyms every time.
+ */
+static void __init netdev_addr_resolve_func(struct timer_list *timer)
+{
+	unsigned long entries[40];
+	int nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
+	char buffer[KSYM_SYMBOL_LEN] = { };
+	unsigned long offset, size;
+	char *cp;
+	int i;
+
+	for (i = 0; i < nr_entries; i++) {
+		sprint_symbol(buffer, entries[i]);
+		if (strncmp(buffer, "handle_softirqs", 15))
+			continue;
+		cp = strchr(buffer, '+');
+		if (!cp || sscanf(cp, "+%lx/%lx", &offset, &size) != 2)
+			continue;
+		start_of_handle_softirqs = entries[i] - offset;
+		end_of_handle_softirqs = start_of_handle_softirqs + size;
+		break;
+	}
+	complete(&container_of(timer, struct timer_completion_struct, timer)->completion);
+}
+
+static void __init net_dev_refcnt_tracker_init(void)
+{
+	struct timer_completion_struct tc;
+
+	timer_setup_on_stack(&tc.timer, netdev_addr_resolve_func, 0);
+	init_completion(&tc.completion);
+	/* Schedule a call to netdev_addr_resolve_func(). */
+	mod_timer(&tc.timer, jiffies);
+	/* Wait for netdev_addr_resolve_func() to be called. */
+	wait_for_completion(&tc.completion);
+	/* Wait for netdev_addr_resolve_func() to complete. */
+	timer_delete_sync(&tc.timer);
+	timer_destroy_on_stack(&tc.timer);
+}
+
+#endif
diff --git a/net/socket.c b/net/socket.c
index c05d86e63abf..b3ddcc283cbb 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -723,7 +723,11 @@ struct socket *sock_alloc(void)
 }
 EXPORT_SYMBOL(sock_alloc);
 
-static void __sock_release(struct socket *sock, struct inode *inode)
+static
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+noinline
+#endif
+void __sock_release(struct socket *sock, struct inode *inode)
 {
 	const struct proto_ops *ops = READ_ONCE(sock->ops);
 
@@ -795,7 +799,13 @@ static noinline void call_trace_sock_send_length(struct sock *sk, int ret,
 	trace_sock_send_length(sk, ret, 0);
 }
 
-static inline int sock_sendmsg_nosec(struct socket *sock, struct msghdr *msg)
+static
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+noinline
+#else
+inline
+#endif
+int sock_sendmsg_nosec(struct socket *sock, struct msghdr *msg)
 {
 	int ret = INDIRECT_CALL_INET(READ_ONCE(sock->ops)->sendmsg, inet6_sendmsg,
 				     inet_sendmsg, sock, msg,
@@ -1145,8 +1155,13 @@ static noinline void call_trace_sock_recv_length(struct sock *sk, int ret, int f
 	trace_sock_recv_length(sk, ret, flags);
 }
 
-static inline int sock_recvmsg_nosec(struct socket *sock, struct msghdr *msg,
-				     int flags)
+static
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+noinline
+#else
+inline
+#endif
+int sock_recvmsg_nosec(struct socket *sock, struct msghdr *msg, int flags)
 {
 	int ret = INDIRECT_CALL_INET(READ_ONCE(sock->ops)->recvmsg,
 				     inet6_recvmsg,
@@ -2653,9 +2668,12 @@ static int copy_msghdr_from_user(struct msghdr *kmsg,
 	return err < 0 ? err : 0;
 }
 
-static int ____sys_sendmsg(struct socket *sock, struct msghdr *msg_sys,
-			   unsigned int flags, struct used_address *used_address,
-			   unsigned int allowed_msghdr_flags)
+static
+#if defined(CONFIG_NET_DEV_REFCNT_TRACKER) && defined(CONFIG_KALLSYMS)
+noinline
+#endif
+int ____sys_sendmsg(struct socket *sock, struct msghdr *msg_sys, unsigned int flags,
+		    struct used_address *used_address, unsigned int allowed_msghdr_flags)
 {
 	unsigned char ctl[sizeof(struct cmsghdr) + 20]
 				__aligned(sizeof(__kernel_size_t));
-- 
2.52.0

