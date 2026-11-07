Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077087;
	b=QvVi9c6QddDD0fr1mRbP2DG3SBqzYsmtMFxHYIbhyZa8fTFXCDJt5hvBpgA1npfzWj0j
	 FPRPBlgyypQtiJJ1ROnCMHR3INNk/3zYJT3trb50pzctCflLGknERGZndzzSg7FuCsBWv
	 C/E6Ub7iRgh3Q0eRn75iBWjxgk22wvQemGb+mJoZxgxFGtxfF6gowQ2tAlJR/fLQGiiCw
	 Yj0bHdPUd7VXPYg1n39F5dzdkSniW6hbVoneuF+gpX+VOlzXW1e55fnzU3hyaBERCOJTc
	 D/Vh/b1Jl51kShe53h/USxsOkY4vrDBca9i7ZmmLxeSVhVcdxSRY8KPq5pb/BWicjdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xYAGS+XY4LIyYAiAoo2wIS0oAg0GDCdOlyiXz1Uxi6Y=;
	b=KMXXHqy3mQB7Bdw4pA2QBqM21NPU7lgaP685MQ2ludWURI9V8jMm8tDg3qNP2Pq8t9Kz
	 BColE4mITNEmzdBXCqCSKugrtAzcG2xbFRFnhj8eKwoeP+0eg7OGScoVGRqQ+TXgYqa87
	 yz+Lis5T4X5a8Z9I4my9Wsbnm8NOAmifsBNpk5wQ8bSkPikgeKOa81yVtBNUeBzA6DlXJ
	 sHV/vdN2N7TOgUu4kTZRZW6vhI7Cgioua/ZhaCFKNnxdSizin4GfmV6T1saLNsB7Y6cPZ
	 PMDb2tQEEHdWESMHi06Dk7+ePH9G5MY2ByDL2IApUMns2IZfnYU4XoK0LwW7hClzIOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=mW3OgqQG;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072F0606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=mW3OgqQG
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2683541eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794077086; x=1794681886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYAGS+XY4LIyYAiAoo2wIS0oAg0GDCdOlyiXz1Uxi6Y=;
        b=mW3OgqQGvckxDTPr8OcA56Ms55gHjXrLKhi5iuO5IoPLaHAnfv1yxbCEJLIRBNrFJE
         P7F4QwYpptPXAb7OdXyFaLaImcLfrJexYbs2hlVhMIHb+2Tdxb6vo0WsvUha7I477aeI
         c3EgWMaUsX3uJUEcUZlj4vB707sGxVLRg/5QHPoRb7x7iqZoxL9jCPBC3cP2Puo0Y5iR
         sqHaUu6uJBegOZllvTkIAarYWtBxetaPc7TGD8qxuanzXe44+Rr9cCxWKRJTStD64T8y
         sEWh68igngypKW2lTS+k3mTv1PMvQgKs3RUWtlcQiq5JhB7cOq004TOg0uh2UfhGgyI+
         hc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794077086; x=1794681886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYAGS+XY4LIyYAiAoo2wIS0oAg0GDCdOlyiXz1Uxi6Y=;
        b=sy7iFeI23cDAIm0fGyBUBAq/BlIC6E0smbBTYGFWUuwbWzZh2ZcYVmPBx4V2D6tpfL
         DDUsiubyLL0U18iy/20suEJgCM8ron31Ww4y8Zkay7f+02G9uJogOXHRVHcUwLwWsT9j
         3yQPQ33rwh9/Cq0xeQZBQa3iAJgGVq5ed2R7oW6pGU3MFkgooH+PD81reeS8SvWrAucW
         ZGn3wjw+23ojM3LYK12IuqLuyjZpjAB1H3d5hCg4+pjUWFD9R7S0D46N01Yn02i4UG83
         H7R4+xeEIMpO+WSGTJUcCnq/ZiGuSFLShXzPk+/F4daEFtYUpEBOdkeq2l6DibKF0D4t
         wnLw==
X-Forwarded-Encrypted: i=1; AL+hErENMNDV/IfDjYc/RPVtKSEPuaFMAa0tzTsL3EoCZEtnnkq4boIrMbN5BFqBhGvn/bgVzKiOCDKedb++Ml4=@vger.kernel.org
X-Gm-Message-State: APuU4Z802N/6IQU99e9IcrrcVxlTMKGBWwvxpJBLkB3im5IaW2slZKRd
	83Ofg36QqprTGabUPGb9GepKoZNCvYrUBmJWmswFq9kjK2siGlbTUhbIkdXRgmTkU2I=
X-Gm-Gg: AYBFou1MvFYuM+s5Tw2ZKjjGRT9oc1F7ES4qloO3iwIveH7PLOUzxzxm+S4czE6fjBx
	hspXBNeAdRbIIS3W0Xv2pmZ2Jk1XT1NdbSSAbuWDz+A1s18ZYWi6/uWRAStd6UPOYd7et7v4w4M
	a1AAevgiWziNuHxgMphb5Iet7RVIDIO5HaEHlGQF0kCsP+ryyUb4S10b9hk3v7gCiUd1BdnYJjx
	lsKQoPHyf90VS1evB4IsOOY15oTga5t7iwAiXp5zwApORbU6XrdXLfb5i2g6jCE1uoEdlaZ9oGG
	D8bmMfvjmp5y92qyL0Tun+/kDmHySy7Qhs/t++Gf1NIYYjtsFlGxhLELexnXqRLuGcpIkayovdE
	t5n1ydfAwQgyBxQ2pcYRLsb14aliPFcO0qsPEAU3RZfGHyWUXdYQx0lV/OuXBJJyLKnahB5Xif5
	T8NI8SW8K6XgFN3qkJJGrjvHB+DU8Al7svijCHx1HUZjQDYwM0CmBJS+xHTeodNnEAPg7xrhl2f
	E3ZnYuem0pHfiF652evxn7MIbymi3mpiS5Na7EXkFuojo+bkpaY6G1a/oXa3wOFlB3gDr85jMRS
	EZLMTIcaOZboGlR59FGRTuLzHxzNnQ9fdtOHfz5thvYf5criHQcvufzh9sq7yqSTFRJ2qec=
X-Received: by 2002:a05:693c:80c1:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36f76d0f26emr8538567eec.31.1794077085833;
        Sat, 07 Nov 2026 10:44:45 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm17286897eec.9.2026.11.07.10.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:44:45 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	brett.creeley@amd.com,
	sgoutham@marvell.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org,
	Ido Schimmel <idosch@nvidia.com>,
	Satish Kharat <satishkh@cisco.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH net-next 2/9] amt: offload provider registry and lower-device lifecycle
Date: Sat,  7 Nov 2026 18:44:30 +0000
Message-ID: <20261107184437.2783174-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107184437.2783174-1-omar@blockcast.net>
References: <20261107184437.2783174-1-omar@blockcast.net>
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

amt_offload_register()/amt_offload_unregister() (EXPORT_SYMBOL_GPL) keep
an RCU list of providers keyed by the lower netdev. Relays are listed at
newlink; a relay in auto or required mode whose stream_dev has a
provider binds there, and registering a provider on a stream_dev binds
the auto and required relays already using it at once (counted). bind()
fills caps; a relay whose bind() fails, or whose outer family the caps
lack, stays unbound (counted): in software in auto mode, refused at
creation or left without carrier in required mode.

On NETDEV_UNREGISTER of the lower device (before amt_dellink), on
provider unregistration and on relay deletion, teardown runs in one
order: stop admission and wait out in-flight xmit, cancel programming
work, group_disable all, endpoint_del all, unbind, unpublish,
synchronize_rcu, software. A required-mode relay that loses its provider
drops carrier. Counters are under the relay's offload/ sysfs group; the
global required-refusal count is the offload_required_refused module
parameter.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c        | 425 +++++++++++++++++++++++++++++++++++++++
 include/net/amt.h        |  34 ++++
 include/uapi/linux/amt.h |  20 ++
 3 files changed, 479 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 201421ad0..034221e1c 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -20,6 +20,7 @@
 #include <net/icmp.h>
 #include <net/mld.h>
 #include <net/amt.h>
+#include <net/amt_offload.h>
 #include <uapi/linux/amt.h>
 #include <linux/security.h>
 #include <net/gro_cells.h>
@@ -3464,9 +3465,11 @@ static int amt_dev_stop(struct net_device *dev)
  * lifetime matches vxlan/geneve and the rest of the netdev tree.
  */
 static const struct attribute_group amt_upstream_group;
+static const struct attribute_group amt_offload_group;
 
 static const struct attribute_group *amt_groups[] = {
 	&amt_upstream_group,
+	&amt_offload_group,
 	NULL,
 };
 
@@ -4028,6 +4031,414 @@ static void amt_link_setup(struct net_device *dev)
 	ether_setup(dev);
 }
 
+/* Relay replication offload: provider registry and lower-device lifecycle.
+ *
+ * A provider registers against the lower netdev relays transmit on (their
+ * stream_dev); there is no net_device field or ndo. Every relay is linked
+ * into amt_offload_devs at newlink so registration can find the relays
+ * already using that lower device. Both lists are written under RTNL;
+ * amt_offload_providers is an RCU list so a reader outside RTNL can test
+ * for a provider without it.
+ *
+ * Teardown has one order, whichever side goes first (the lower device is
+ * unregistered, the provider unregisters, or the relay is deleted): stop
+ * admitting packets to ops->xmit and wait out in-flight callers, cancel
+ * programming work, group_disable every group, endpoint_del every
+ * endpoint, unbind, unpublish and synchronize_rcu(). The relay is then
+ * in software, exactly the path it runs with no provider at all.
+ */
+struct amt_offload_provider {
+	struct list_head		node;
+	struct net_device		*lower;
+	const struct amt_offload_ops	*ops;
+	struct rcu_head			rcu;
+};
+
+/* One provider-owned handle amt must give back on teardown. */
+struct amt_offload_ref {
+	struct list_head		node;
+	void				*handle;
+};
+
+struct amt_offload_bound {
+	struct amt_offload_binding	pub;
+	const struct amt_offload_ops	*ops;
+	struct amt_offload_caps		caps;
+	/* Cleared first on teardown; ops->xmit is only called while set. */
+	bool				admitting;
+	struct list_head		groups;		/* amt_offload_ref */
+	struct list_head		endpoints;	/* amt_offload_ref */
+};
+
+static LIST_HEAD(amt_offload_providers);
+static LIST_HEAD(amt_offload_devs);
+
+/* Relays refused at newlink for want of a provider in required mode. The
+ * refused netdev is unregistered again before newlink returns, so the
+ * count cannot live on it.
+ */
+static atomic_t amt_offload_required_refused = ATOMIC_INIT(0);
+
+static int amt_offload_required_refused_get(char *buf,
+					    const struct kernel_param *kp)
+{
+	return sysfs_emit(buf, "%u\n",
+			  (u32)atomic_read(&amt_offload_required_refused));
+}
+
+/* Read-only, but a load-time value still reaches ->set: parse_one()
+ * calls it without a NULL check (only the sysfs store path checks), so
+ * a get-only ops oopses the loader. Ignore the value rather than fail
+ * the load, so a stray modprobe option cannot keep the relay down.
+ * NOARG: a bare "amt.offload_required_refused" would otherwise be
+ * -EINVAL in parse_one() before ->set, and fail the module load.
+ */
+static int amt_offload_required_refused_set(const char *val,
+					    const struct kernel_param *kp)
+{
+	pr_warn("offload_required_refused is read-only; ignoring \"%s\"\n",
+		val ? val : "");
+	return 0;
+}
+
+static const struct kernel_param_ops amt_offload_required_refused_ops = {
+	.flags = KERNEL_PARAM_OPS_FL_NOARG,
+	.set = amt_offload_required_refused_set,
+	.get = amt_offload_required_refused_get,
+};
+module_param_cb(offload_required_refused, &amt_offload_required_refused_ops,
+		NULL, 0444);
+MODULE_PARM_DESC(offload_required_refused,
+		 "Relays refused at creation: offload=required and no usable provider");
+
+static void amt_offload_count(struct amt_dev *amt,
+			      enum amt_offload_counter cnt)
+{
+	atomic_inc(&amt->offload_cnt[cnt]);
+}
+
+static struct amt_offload_provider *
+amt_offload_provider_find(const struct net_device *lower)
+{
+	struct amt_offload_provider *p;
+
+	ASSERT_RTNL();
+	list_for_each_entry(p, &amt_offload_providers, node)
+		if (p->lower == lower)
+			return p;
+	return NULL;
+}
+
+static u32 amt_offload_outer_family(const struct amt_dev *amt)
+{
+	return ipv6_addr_any(&amt->local_ipv6) ? AMT_OFFLOAD_FAMILY_V4 :
+						 AMT_OFFLOAD_FAMILY_V6;
+}
+
+/* The data path's way in: a binding is usable only while admitting. The
+ * caller holds rcu_read_lock(). The later TX handoff is its first caller.
+ */
+static __maybe_unused struct amt_offload_bound *
+amt_offload_tx_admit(struct amt_dev *amt)
+{
+	struct amt_offload_bound *b = rcu_dereference(amt->offload);
+
+	return b && READ_ONCE(b->admitting) ? b : NULL;
+}
+
+/* Record a handle the provider handed back; the later reconciler is the
+ * production caller.
+ */
+static int __maybe_unused amt_offload_track(struct list_head *list,
+					    void *handle)
+{
+	struct amt_offload_ref *ref = kzalloc(sizeof(*ref), GFP_KERNEL);
+
+	if (!ref)
+		return -ENOMEM;
+	ref->handle = handle;
+	list_add_tail(&ref->node, list);
+	return 0;
+}
+
+static void amt_offload_set_carrier(struct amt_dev *amt, bool on)
+{
+	if (amt->offload_mode != AMT_OFFLOAD_MODE_REQUIRED)
+		return;
+	if (on)
+		netif_carrier_on(amt->dev);
+	else
+		netif_carrier_off(amt->dev);
+}
+
+/* Bind @amt to @p. 0 means bound; an error leaves @amt in software and
+ * counted. RTNL held.
+ */
+static int amt_offload_bind(struct amt_dev *amt,
+			    struct amt_offload_provider *p, bool on_register)
+{
+	struct amt_offload_bound *b;
+	int err;
+
+	ASSERT_RTNL();
+	if (amt->mode != AMT_MODE_RELAY ||
+	    amt->offload_mode == AMT_OFFLOAD_MODE_SOFTWARE ||
+	    rtnl_dereference(amt->offload))
+		return -EINVAL;
+
+	b = kzalloc_obj(*b, GFP_KERNEL);
+	if (!b)
+		return -ENOMEM;
+	b->pub.lower = p->lower;
+	b->pub.dev = amt->dev;
+	b->pub.epoch = ++amt->offload_epoch;
+	b->ops = p->ops;
+	INIT_LIST_HEAD(&b->groups);
+	INIT_LIST_HEAD(&b->endpoints);
+
+	err = b->ops->bind(&b->pub, &b->caps);
+	if (err) {
+		amt_offload_count(amt, AMT_OFFLOAD_CNT_BIND_FAILED);
+		kfree(b);
+		return err;
+	}
+	if (!(b->caps.families & amt_offload_outer_family(amt))) {
+		b->ops->unbind(&b->pub);
+		amt_offload_count(amt, AMT_OFFLOAD_CNT_FAMILY_UNSUPPORTED);
+		kfree(b);
+		return -EOPNOTSUPP;
+	}
+
+	b->admitting = true;
+	rcu_assign_pointer(amt->offload, b);
+	amt_offload_count(amt, AMT_OFFLOAD_CNT_BIND);
+	if (on_register)
+		amt_offload_count(amt, AMT_OFFLOAD_CNT_BIND_ON_REGISTER);
+	amt_offload_set_carrier(amt, true);
+	return 0;
+}
+
+/* Return @amt to software in the documented order. @cnt is the cause to
+ * count, or AMT_OFFLOAD_CNT_MAX for the relay's own deletion. RTNL held.
+ */
+static void amt_offload_teardown(struct amt_dev *amt,
+				 enum amt_offload_counter cnt)
+{
+	struct amt_offload_bound *b = rtnl_dereference(amt->offload);
+	struct amt_offload_ref *ref, *tmp;
+
+	if (!b)
+		return;
+
+	/* 1. Stop admission and wait for every ops->xmit already admitted. */
+	WRITE_ONCE(b->admitting, false);
+	synchronize_net();
+
+	/* 2. Programming work is cancelled here once the reconciler exists
+	 *    (next patch); nothing can program the provider past this point.
+	 */
+
+	/* 3. Disable every group, then 4. delete every endpoint. */
+	list_for_each_entry_safe(ref, tmp, &b->groups, node) {
+		b->ops->group_disable(&b->pub, ref->handle);
+		list_del(&ref->node);
+		kfree(ref);
+	}
+	list_for_each_entry_safe(ref, tmp, &b->endpoints, node) {
+		b->ops->endpoint_del(&b->pub, ref->handle);
+		list_del(&ref->node);
+		kfree(ref);
+	}
+
+	/* 5. Unbind, then 6. unpublish and let RCU readers drain. */
+	b->ops->unbind(&b->pub);
+	RCU_INIT_POINTER(amt->offload, NULL);
+	synchronize_rcu();
+	kfree(b);
+
+	/* 7. Software. */
+	amt->offload_epoch++;
+	if (cnt < AMT_OFFLOAD_CNT_MAX) {
+		amt_offload_count(amt, cnt);
+		if (amt->offload_mode == AMT_OFFLOAD_MODE_REQUIRED) {
+			amt_offload_count(amt, AMT_OFFLOAD_CNT_REQUIRED_UNBOUND);
+			amt_offload_set_carrier(amt, false);
+		}
+	}
+}
+
+int amt_offload_register(struct net_device *lower,
+			 const struct amt_offload_ops *ops)
+{
+	struct amt_offload_provider *p;
+	struct amt_dev *amt;
+
+	ASSERT_RTNL();
+	if (!lower || !ops || !ops->bind || !ops->unbind ||
+	    !ops->group_disable || !ops->endpoint_del)
+		return -EINVAL;
+	if (amt_offload_provider_find(lower))
+		return -EEXIST;
+
+	p = kzalloc_obj(*p, GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+	p->lower = lower;
+	p->ops = ops;
+	list_add_rcu(&p->node, &amt_offload_providers);
+
+	list_for_each_entry(amt, &amt_offload_devs, offload_node)
+		if (amt->stream_dev == lower)
+			amt_offload_bind(amt, p, true);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(amt_offload_register);
+
+static void amt_offload_provider_drop(struct net_device *lower,
+				      enum amt_offload_counter cnt)
+{
+	struct amt_offload_provider *p = amt_offload_provider_find(lower);
+	struct amt_dev *amt;
+
+	list_for_each_entry(amt, &amt_offload_devs, offload_node)
+		if (amt->stream_dev == lower)
+			amt_offload_teardown(amt, cnt);
+	if (p) {
+		list_del_rcu(&p->node);
+		kfree_rcu(p, rcu);
+	}
+}
+
+void amt_offload_unregister(struct net_device *lower)
+{
+	ASSERT_RTNL();
+	amt_offload_provider_drop(lower, AMT_OFFLOAD_CNT_TEARDOWN_PROVIDER);
+}
+EXPORT_SYMBOL_GPL(amt_offload_unregister);
+
+/* NETDEV_UNREGISTER of a stream_dev: tear its relays down before
+ * amt_dellink runs, and forget its provider so no entry outlives the
+ * netdev it names.
+ */
+static void amt_offload_lower_gone(struct net_device *lower)
+{
+	amt_offload_provider_drop(lower, AMT_OFFLOAD_CNT_TEARDOWN_LOWER);
+}
+
+/* newlink: list the relay and bind it if a provider is registered. A
+ * required-mode relay with no usable provider is refused (-ENODEV) and
+ * counted globally. RTNL held.
+ */
+static int amt_offload_attach(struct amt_dev *amt,
+			      struct netlink_ext_ack *extack)
+{
+	struct amt_offload_provider *p;
+	int err = -ENODEV;
+
+	INIT_LIST_HEAD(&amt->offload_node);
+	if (amt->mode != AMT_MODE_RELAY)
+		return 0;
+	list_add_tail(&amt->offload_node, &amt_offload_devs);
+	if (amt->offload_mode == AMT_OFFLOAD_MODE_SOFTWARE)
+		return 0;
+
+	p = amt_offload_provider_find(amt->stream_dev);
+	if (p)
+		err = amt_offload_bind(amt, p, false);
+	if (!err || amt->offload_mode != AMT_OFFLOAD_MODE_REQUIRED)
+		return 0;
+
+	list_del_init(&amt->offload_node);
+	atomic_inc(&amt_offload_required_refused);
+	if (p)
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Offload required but the stream device's provider cannot serve this relay");
+	else
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Offload required but the stream device has no offload provider");
+	return -ENODEV;
+}
+
+/* The relay itself is going away. RTNL held. */
+static void amt_offload_detach(struct amt_dev *amt)
+{
+	amt_offload_teardown(amt, AMT_OFFLOAD_CNT_MAX);
+	if (!list_empty(&amt->offload_node))
+		list_del_init(&amt->offload_node);
+}
+
+/* offload/ sysfs group: mode, binding state and the counters. Counters
+ * are monotonic since netdev creation and wrap at u32.
+ */
+static ssize_t offload_mode_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	static const char * const names[] = {
+		[AMT_OFFLOAD_MODE_SOFTWARE] = "software",
+		[AMT_OFFLOAD_MODE_AUTO] = "auto",
+		[AMT_OFFLOAD_MODE_REQUIRED] = "required",
+	};
+	struct amt_dev *amt = netdev_priv(to_net_dev(dev));
+
+	return sysfs_emit(buf, "%s\n", names[READ_ONCE(amt->offload_mode)]);
+}
+static struct device_attribute dev_attr_offload_mode =
+	__ATTR(mode, 0444, offload_mode_show, NULL);
+
+static ssize_t offload_bound_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct amt_dev *amt = netdev_priv(to_net_dev(dev));
+
+	return sysfs_emit(buf, "%d\n", !!rcu_access_pointer(amt->offload));
+}
+static struct device_attribute dev_attr_offload_bound =
+	__ATTR(bound, 0444, offload_bound_show, NULL);
+
+static ssize_t amt_offload_cnt_show(struct device *dev, char *buf,
+				    enum amt_offload_counter cnt)
+{
+	struct amt_dev *amt = netdev_priv(to_net_dev(dev));
+
+	return sysfs_emit(buf, "%u\n", (u32)atomic_read(&amt->offload_cnt[cnt]));
+}
+
+#define AMT_OFFLOAD_CNT_ATTR(name, cnt)					\
+static ssize_t offload_##name##_show(struct device *dev,		\
+				     struct device_attribute *attr,	\
+				     char *buf)				\
+{									\
+	return amt_offload_cnt_show(dev, buf, cnt);			\
+}									\
+static struct device_attribute dev_attr_offload_##name =		\
+	__ATTR(name, 0444, offload_##name##_show, NULL)
+
+AMT_OFFLOAD_CNT_ATTR(binds, AMT_OFFLOAD_CNT_BIND);
+AMT_OFFLOAD_CNT_ATTR(binds_on_register, AMT_OFFLOAD_CNT_BIND_ON_REGISTER);
+AMT_OFFLOAD_CNT_ATTR(bind_failed, AMT_OFFLOAD_CNT_BIND_FAILED);
+AMT_OFFLOAD_CNT_ATTR(family_unsupported, AMT_OFFLOAD_CNT_FAMILY_UNSUPPORTED);
+AMT_OFFLOAD_CNT_ATTR(teardown_lower, AMT_OFFLOAD_CNT_TEARDOWN_LOWER);
+AMT_OFFLOAD_CNT_ATTR(teardown_provider, AMT_OFFLOAD_CNT_TEARDOWN_PROVIDER);
+AMT_OFFLOAD_CNT_ATTR(required_unbound, AMT_OFFLOAD_CNT_REQUIRED_UNBOUND);
+
+static struct attribute *amt_offload_attrs[] = {
+	&dev_attr_offload_mode.attr,
+	&dev_attr_offload_bound.attr,
+	&dev_attr_offload_binds.attr,
+	&dev_attr_offload_binds_on_register.attr,
+	&dev_attr_offload_bind_failed.attr,
+	&dev_attr_offload_family_unsupported.attr,
+	&dev_attr_offload_teardown_lower.attr,
+	&dev_attr_offload_teardown_provider.attr,
+	&dev_attr_offload_required_unbound.attr,
+	NULL,
+};
+
+static const struct attribute_group amt_offload_group = {
+	.name = "offload",
+	.attrs = amt_offload_attrs,
+};
+
 static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_MODE]		= { .type = NLA_U32 },
 	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
@@ -4284,6 +4695,13 @@ static int amt_newlink(struct net_device *dev,
 	INIT_DELAYED_WORK(&amt->secret_wq, amt_secret_work);
 	INIT_WORK(&amt->event_wq, amt_event_work);
 	INIT_LIST_HEAD(&amt->tunnel_list);
+
+	err = amt_offload_attach(amt, extack);
+	if (err) {
+		netdev_upper_dev_unlink(amt->stream_dev, dev);
+		unregister_netdevice(dev);
+		goto err;
+	}
 	return 0;
 err:
 	dev_put(amt->stream_dev);
@@ -4294,6 +4712,7 @@ static void amt_dellink(struct net_device *dev, struct list_head *head)
 {
 	struct amt_dev *amt = netdev_priv(dev);
 
+	amt_offload_detach(amt);
 	unregister_netdevice_queue(dev, head);
 	netdev_upper_dev_unlink(amt->stream_dev, dev);
 	dev_put(amt->stream_dev);
@@ -4438,6 +4857,12 @@ static int amt_device_event(struct notifier_block *unused,
 	LIST_HEAD(list);
 	int new_mtu;
 
+	/* Before amt_dellink below: the provider's tables are torn down
+	 * while the relay and its stream_dev are both still intact.
+	 */
+	if (event == NETDEV_UNREGISTER)
+		amt_offload_lower_gone(dev);
+
 	upper_dev = amt_lookup_upper_dev(dev);
 	if (!upper_dev)
 		return NOTIFY_DONE;
diff --git a/include/net/amt.h b/include/net/amt.h
index 5b3405f04..7d70f30e6 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -379,6 +379,29 @@ struct amt_events {
 	struct sk_buff *skb;
 };
 
+struct amt_offload_bound;
+
+/* Per-relay offload counters, exported under offload/ in sysfs. */
+enum amt_offload_counter {
+	/* bind() succeeded and the caps covered the outer family */
+	AMT_OFFLOAD_CNT_BIND,
+	/* ... of which: bound when a provider registered on the stream_dev
+	 * this relay already uses
+	 */
+	AMT_OFFLOAD_CNT_BIND_ON_REGISTER,
+	/* bind() returned an error; the relay stayed unbound */
+	AMT_OFFLOAD_CNT_BIND_FAILED,
+	/* caps lacked the relay's outer family; the relay stayed unbound */
+	AMT_OFFLOAD_CNT_FAMILY_UNSUPPORTED,
+	/* teardown because the stream_dev was unregistered */
+	AMT_OFFLOAD_CNT_TEARDOWN_LOWER,
+	/* teardown because the provider unregistered */
+	AMT_OFFLOAD_CNT_TEARDOWN_PROVIDER,
+	/* a required-mode relay lost its provider and dropped carrier */
+	AMT_OFFLOAD_CNT_REQUIRED_UNBOUND,
+	AMT_OFFLOAD_CNT_MAX,
+};
+
 struct amt_dev {
 	struct net_device       *dev;
 	struct net_device       *stream_dev;
@@ -484,6 +507,17 @@ struct amt_dev {
 	struct socket		*stream_sock_v4;
 	struct socket		*stream_sock_v6;
 	atomic_t		upstream_setsockopt_slow_count;
+
+	/* Replication offload (relay mode). Everything here is written
+	 * under RTNL; offload is also read by the data path under RCU.
+	 * offload_node links the relay into amt_offload_devs so a provider
+	 * registering on its stream_dev can find it.
+	 */
+	u32			offload_mode;
+	struct amt_offload_bound __rcu *offload;
+	struct list_head	offload_node;
+	u64			offload_epoch;
+	atomic_t		offload_cnt[AMT_OFFLOAD_CNT_MAX];
 };
 
 #define AMT_TOS			0xc0
diff --git a/include/uapi/linux/amt.h b/include/uapi/linux/amt.h
index c04ed1fa4..de1ae1929 100644
--- a/include/uapi/linux/amt.h
+++ b/include/uapi/linux/amt.h
@@ -21,6 +21,26 @@ enum ifla_amt_mode {
 
 #define AMT_MODE_MAX (__AMT_MODE_MAX - 1)
 
+/* Relay replication offload (include/net/amt_offload.h). */
+enum ifla_amt_offload_mode {
+	/* Never use a provider. The default. */
+	AMT_OFFLOAD_MODE_SOFTWARE = 0,
+	/* Use the provider registered on the stream device when its bind
+	 * succeeds, it covers the relay's outer family and it implements the
+	 * TX path; software otherwise.
+	 */
+	AMT_OFFLOAD_MODE_AUTO,
+	/* Refuse to create the relay without a usable provider, and drop
+	 * carrier while none is bound. Unlike auto, also bind a provider
+	 * that replicates only on ingress. A bound relay still forwards in
+	 * software, with carrier up, what the provider does not serve.
+	 */
+	AMT_OFFLOAD_MODE_REQUIRED,
+	__AMT_OFFLOAD_MODE_MAX,
+};
+
+#define AMT_OFFLOAD_MODE_MAX (__AMT_OFFLOAD_MODE_MAX - 1)
+
 enum {
 	IFLA_AMT_UNSPEC,
 	/* This attribute specify mode etier Gateway or Relay. */
-- 
2.43.0

