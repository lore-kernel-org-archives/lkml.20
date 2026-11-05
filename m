Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892008;
	b=fsL5QB/qA9RaPKof8tmPmEl3Jw/tN7SttY2LAmT6UcAPXW8lr39E4nL905kpsK4/Appc
	 zTQdGDBDrb8wUnRzhii+H2Ekl7306GQmcEXkEC96ffEjk2TjXctW2Yh9WvjxeQAMBJOBT
	 Jka4y50pMU1A82VxVi4pdCLYcvG9FiK+c4F/4VpBROcyhjeCj/BFfgimfOfGhOYAS7Buy
	 PR9cyxgCluV7KY0BG5YUCjWU0JSx2fOiwhAQ10nzzxgX6YO/lqFK8iKp8ymW3DNrqkVtM
	 bpFOhpLGHV4UqPdWOM5/C49NxLovg2Jd5LdPpVf4vOXoAcoegTib79skX4XIhGhf1Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=r8FaPeA3g2MwMDYscdMf9Z/dM0SNFU2kGC/MByXbCsc=;
	b=wMMf4FoCbR1pH8uyYB7s+7jxjKpwo3/oP5XRGy+XQtvfdIBD5c0ZwoHRnu9EpqX/K4hh
	 bbhqx3OJYvu4i0M243luq7IigP+rmvKIa3y9+hy4tugVaeaB9iERchlN/8r2D1hXoeCr/
	 hhUFKD2aX1ZCHeelqGPsWLRL7DyBdKxO9ERNwOsk85trAw2UKGqdBKpWHtYQLdmlbxHF+
	 exD0pxiFxzHIlQ7NwL37AY3xKW2B1nGSToZXQErhstzVX/K9zS6nWCWeoluHKvkI+q2qt
	 IfPDqKyL2sfXvdg31zqZPZz47ju9ubTND/n1QuoHoQyRvBInotjbC25wAwP1ohOmWgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=DqNX65Xn;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A46606D812
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7A46606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=DqNX65Xn
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91c63449320so20313876d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892007; x=1794496807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8FaPeA3g2MwMDYscdMf9Z/dM0SNFU2kGC/MByXbCsc=;
        b=DqNX65XnAasEzvBonH3UUIfLkjOnOOpyPeMPKejtQ9Rhv11bkh5VRmptp7hjNjjyQ+
         6Mt0fgZ5GW07kC8N9ayZaRuH78rHz2nu4EMqqxEVFdIKrZFtvimwaHQzE2ooBx2SYHkr
         eb+D76FLOlcARPtdRsqVEp+tsALwx6C9NCIpG6ybzS9vFVY1CL0LCmq2QZtQNpRN+j6S
         XoV8eYkLfdaRbdH2UcqDG4hOA90QF5i4Y7VT6zWnVvDK2v0dfdc8VOk34ZvGBjE63jfN
         cLdvePADNsU6ny1rH7Agb5U2p2Qmr5i77Y5nhqdyxfiOWmmHMyhQbwMjUgDVlHBW3A0V
         O3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892007; x=1794496807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8FaPeA3g2MwMDYscdMf9Z/dM0SNFU2kGC/MByXbCsc=;
        b=09UMaEiPo4l4Ilf15MosZiYD+vENpTeW1iOivsU9e4FzfhXbfH+IE0uIv0V2z9Qdjk
         dmiMRBvLX5yqpD5MinWaXtGpOYw6DsEm+2azv4xL4b1kr66YVCitkb2+j8OUQvcLqs+g
         uK92GLqv7rpGmdjLZwyIWaAM+JdPpqR9CjVCreEmcq12Y6tF/8YDLfreS1YjrOqztbn5
         nNGaBzUdPVAterHXT59L3F7knL/auQEd/XZO4B46sXRt5XtkNBZQi8kF6Pj2u/wEon1v
         mo7wCe2zRKKtmYRZThmEJuLAL61EXngCXYjeFNbUx37iUcFM+DXMvonB3WBfHrPsIRmX
         KSgw==
X-Forwarded-Encrypted: i=1; AKwUvBw7+1UBYSroCHIsZTvZsKmGr+R0eYRsqdatSyvlCLYPlgOBn7Oa7nzcwhrdJTqTTfhfTHuzrp+/dKdunr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DiG0auSA4E8hDdYLJJwVxtRkc5+hLa+c7YtAtlHVGst3w/6rC
	1y93nbT/KDTmqrqanwqrF7IjnKcXSl5ZNaoMU9qyzdqKPcFfdo6HNFkH3e3IOAS9y9Y=
X-Gm-Gg: AYBFou1rf0TkEPLfHFtrWtBfnHdZs6Zx0RywUeVwABIGC+oYgCgvJzdd1w+p+pTlKGu
	Jun8Tx9PmJBzHAvVSJkJHGSVdYzT603iHz5LiNgejXpskNVTfpqfD8Xhj3sZMNR3WYWR9mSrkso
	ume18SU+q2UTv9z3NSsoWsg6PiW1qGTEmzJyt6VejmEw9sCMjjvNv94zVQP7VJ4yYKKAFEtKs6I
	XtYv6tBxlPt0KPVTyUXcTeiXMz78ejZilhmtBgise4Il0j5q0AtdpgH+lXf5PSl0xL/SDXYiw1H
	npFmoX/4yMvQijiM+c/I/KhWchWv6xKqn3CI2UUTU2g/i4FLFSywbyEvS0rebdBSvDx3Ho7e+bm
	wDITNGSLEKKdzZksGzXvmVVOik4gMSXiWjqyz+2H4iOTU7waOzDo28hUOTSQI7WxJdnWJzPsK0o
	g+yyZazr6NdLP2O7sPU+nyP7ebcmtxy3Ha1cIPa9ynx6/o4wBFQeMJJPsmzHOLU+wcBpoieec3f
	HPUFPerxbofUKcxPPNOKrs7YkiKDbcwdRJrLVSSiCMP++ICT75ErkOwbO+xt5CGrtGpOcp7Xcwy
	b18/lZdAMTe4Iztq3kQjxzVKm0pkcrss
X-Received: by 2002:a05:620a:8088:b0:93e:f9ba:6902 with SMTP id af79cd13be357-94421581766mr3216527885a.9.1793892006294;
        Thu, 05 Nov 2026 07:20:06 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d47e5dfdsm485922385a.17.2026.11.05.07.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:20:04 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:46 +0000
Subject: [PATCH RFC v3 54/90] cgroup: leave the limits of a budget to who
 is above
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
Message-Id: <20261105-b4-cells-v3-54-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=3164;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=6vzKkOEq7igqZTpW20nvePOWGbvjWlle0iz1kbWCdas=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLtF+UGftIJzVvE/VGpipyFLfSOgDIncCf7UkA/3RZKB4EhMVoWuGifntrWxrH33E8t1HpEL8k5
 4i/QRrCNhlA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The budget limits what a cell can use. The limits are set by the builder.
The seal gives the root user of the cell ownership of the directory,
cgroup.procs, cgroup.threads and cgroup.subtree_control, and of nothing
else.

That relies on modes and owners, which is not enough:

  - The files of a cgroup belong to whoever created it. An unprivileged
    builder creates the budget itself, so it owns the limits. A cell with
    a single id runs with the id of that builder, so it can write whatever
    it likes to its own pids.max and memory.max.
  - A cell with a block of ids can do the same through a file that
    somebody outside of the cell has opened and passed to it.
  - The cell owns the directory, so it can make it accessible to everybody
    on the host and set extended attributes on it.

cgroup already has the right rule, for cgroup namespaces with the
nsdelegate mount option. From inside of the namespace, the only files in
its root that can be written are those marked CFTYPE_NS_DELEGATABLE. The
cgroup namespace of a cell is rooted at the budget. But that rule depends
on how cgroupfs was mounted, it looks at the task that opened the file,
and it does not cover attributes.

So apply the rule to every task of a cell, in cgroup_may_change(). In the
budget itself such a task can create and remove cgroups and write to the
delegatable files. It cannot write to any other file there, and it cannot
set attributes on the directory or on the files in it. Below the budget
there are no restrictions.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cgroup/cgroup.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index accae30a901d..a0836b115c79 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -6488,9 +6488,25 @@ int cgroup_rmdir(struct kernfs_node *kn)
 	return ret;
 }
 
+/*
+ * Is this what a cgroup is handed to somebody for? Making cgroups in it, and what
+ * is written to across a delegation boundary: see CGRP_ROOT_NS_DELEGATE, which
+ * goes by who opened the file and leaves the attributes to their owner.
+ */
+static bool cgroup_change_is_delegated(struct kernfs_node *kn,
+				       enum kernfs_change what)
+{
+	const struct cftype *cft = kn->priv;
+
+	if (what != KERNFS_CHANGE_CONTENT)
+		return false;
+	return kernfs_type(kn) == KERNFS_DIR || (cft->flags & CFTYPE_NS_DELEGATABLE);
+}
+
 /* Whatever the modes say, and whoever owns it. */
 int cgroup_may_change(struct kernfs_node *kn, enum kernfs_change what)
 {
+	struct kernfs_node *asked = kn;
 	struct cgroup *cgrp;
 
 	if (likely(!current_cell()))
@@ -6503,6 +6519,10 @@ int cgroup_may_change(struct kernfs_node *kn, enum kernfs_change what)
 	cgrp = rcu_dereference(*(void __rcu __force **)&kn->priv);
 	if (!cgrp || !cell_may_change_cgroup(cgrp))
 		return -EPERM;
+	/* The budget is what bounds the cell. Its limits are not the cell's. */
+	if (test_bit(CGRP_CELL_BUDGET, &cgrp->flags) &&
+	    !cgroup_change_is_delegated(asked, what))
+		return -EPERM;
 	return 0;
 }
 

-- 
2.55.0

