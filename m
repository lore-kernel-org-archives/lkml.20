Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989867;
	b=XaerAoNyKJblZAzJ4cdeYPlJZAqSEGIPBEjj2V00Z3Lhas2f1hD5WHCeY3tRvQ2ykX8A
	 iQjpytnvVxh8ChPzY5Li+OK9JJ1YzMAHS5a1fpDm0EKqbPQT0fJNN50/7YnAWFSH94P0z
	 E5viDMwkwUBhYBx//PW7KjR4/0tqGEEiY0wcntphaMr6+8/UNnokn5TSa0OZ6JNr5GjjD
	 K1/CkvWunnseLrnLtPDQ4HLNsvjHFCumooETF+KpQSgZJBQMuTxfz+T0Kk0QJVh0bNrU7
	 8/dAKEHw5DxTU7wr+DK+RClRaKD1UTqmjMOCjpriWrHs9h3jUeByEkB1ELAI418oGjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989867;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=lINQSLp1Gq3CX+BO3I8pHckQ/LjZgO4rP/j0aJx7QU4=;
	b=b2rxl1hT3neKv13P17ZOLCz99DGyDCDTckvcLwyCUMRbZQioa4mEsJbcE81dCIGB6cW2
	 gurik7WCjmBpzfmZmfK925d3L3hDEujfIAi0/mndYjEItbYV/NIN3ejR4yBj78EOzkjJq
	 Ix2u0GYoAdCtY0i6kywoXoIrqGx3m5i7+03IXrAYjUyZh5cEkfWYhzGBa3m+5Oq30pgGB
	 wZi9Q6IXGg36UFHtMwQAYhae4Bnz0bLKa5tIgShEtPZu004riR52VTTan27u9VG4i2Jnv
	 7fVYMXtVW7vSvEuO8LehjQSZ7Y47ghPvWJpPTosaWZuI7SDU6o2DGokF5HukJIH/usA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="ZrW/N5+W";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8A7606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C8A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZrW/N5+W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793989865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lINQSLp1Gq3CX+BO3I8pHckQ/LjZgO4rP/j0aJx7QU4=;
	b=ZrW/N5+WiVLEc6geZf7/eEo/ThnBI0A6ulJBLeK3OJt1Wb+YyKpJSGBTbg8ic8NZv1NSQp
	UUIDLFODj6gzROlJHyTDAGVN9m76fWbpeDvk4QifpIm3NqvGQes2Fkg+PCulk8MRkJNBBr
	rVqSUfjnK94S6OjAG58b8f7/gKY+t7s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-271-mjTvFoKZPCy_EKI3ipHfLA-1; Fri,
 06 Nov 2026 13:31:04 -0500
X-MC-Unique: mjTvFoKZPCy_EKI3ipHfLA-1
X-Mimecast-MFC-AGG-ID: mjTvFoKZPCy_EKI3ipHfLA_1793989862
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C97D1944D29;
	Fri,  6 Nov 2026 18:31:02 +0000 (UTC)
Received: from dechen-thinkpadp1gen8.rht.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3EBD3195608B;
	Fri,  6 Nov 2026 18:31:01 +0000 (UTC)
From: Dennis Chen <dechen@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dennis Chen <dechen@redhat.com>
Subject: [PATCH] powercap: intel_rapl: Expose package CPUs in associated_cpus
Date: Fri,  6 Nov 2026 13:30:46 -0500
Message-ID: <20261106183046.208283-1-dechen@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Commit 525e0064f3d8 ("powercap: intel_rapl: Expose all package CPUs in
PMU cpumask") expanded cpumask to include all CPUs in the package.
Since perf opens an event for every CPU in cpumask, the value returned
for power/energy-pkg/ is roughly scaled by the number of CPUs.

On a single-socket 72-core DMR machine the reported value is roughly
72x higher than when perf is restricted to reading from a single CPU:

$ perf stat -e power/energy-pkg/ -- sleep 1
 Performance counter stats for 'system wide':

          8,052.48 Joules power/energy-pkg/

       1.010483558 seconds time elapsed

$ perf stat -C 5 -e power/energy-pkg/ -- sleep 1

 Performance counter stats for 'CPU(s) 5':

            112.15 Joules power/energy-pkg/

       1.009685587 seconds time elapsed

Revert cpumask to only include the CPU with the lowest ID in the
package and instead expose CPUs which can read from the PMU in
associated_cpus, akin to uncore PMU drivers with per-package counters.

This retains flexibility for userspace tools while maintaining semantic
consistency for perf's use of cpumask.

Assisted-by: LLM
Fixes: 525e0064f3d8 ("powercap: intel_rapl: Expose all package CPUs in PMU cpumask")
Signed-off-by: Dennis Chen <dechen@redhat.com>
---
 drivers/powercap/intel_rapl_common.c | 43 ++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/powercap/intel_rapl_common.c b/drivers/powercap/intel_rapl_common.c
index 70cab5f08bc6..4197f7146afc 100644
--- a/drivers/powercap/intel_rapl_common.c
+++ b/drivers/powercap/intel_rapl_common.c
@@ -1139,7 +1139,8 @@ static struct rapl_pmu rapl_pmu;
 
 /* PMU helpers */
 
-static void set_pmu_cpumask(struct rapl_package *rp, cpumask_var_t mask)
+static void rapl_pmu_collect_cpus(struct rapl_package *rp, cpumask_var_t mask,
+				  bool all_online)
 {
 	int cpu;
 
@@ -1151,9 +1152,15 @@ static void set_pmu_cpumask(struct rapl_package *rp, cpumask_var_t mask)
 		return;
 
 	/* TPMI/MSR RAPL uses any CPU in the package for PMU */
-	for_each_online_cpu(cpu)
-		if (topology_physical_package_id(cpu) == rp->id)
-			cpumask_set_cpu(cpu, mask);
+	for_each_online_cpu(cpu) {
+		if (topology_physical_package_id(cpu) != rp->id)
+			continue;
+
+		cpumask_set_cpu(cpu, mask);
+		/* Stop at first CPU in package if not all CPUs are requested */
+		if (!all_online)
+			return;
+	}
 }
 
 static bool is_rp_pmu_cpu(struct rapl_package *rp, int cpu)
@@ -1430,8 +1437,7 @@ static struct attribute_group pmu_events_group = {
 	.attrs = attrs_empty,
 };
 
-static ssize_t cpumask_show(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+static ssize_t rapl_pmu_cpus_show(char *buf, bool all_online)
 {
 	struct rapl_package *rp;
 	cpumask_var_t cpu_mask;
@@ -1444,23 +1450,36 @@ static ssize_t cpumask_show(struct device *dev,
 
 	cpumask_clear(cpu_mask);
 
-	/* Choose a cpu for each RAPL Package */
-	list_for_each_entry(rp, &rapl_packages, plist) {
-		set_pmu_cpumask(rp, cpu_mask);
-	}
+	/* Choose a set of CPUs for each RAPL Package */
+	list_for_each_entry(rp, &rapl_packages, plist)
+		rapl_pmu_collect_cpus(rp, cpu_mask, all_online);
 	cpus_read_unlock();
 
 	ret = sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_mask));
-
 	free_cpumask_var(cpu_mask);
-
 	return ret;
 }
 
+static ssize_t cpumask_show(struct device *dev __always_unused,
+			    struct device_attribute *attr __always_unused,
+			    char *buf)
+{
+	return rapl_pmu_cpus_show(buf, false);
+}
+
+static ssize_t associated_cpus_show(struct device *dev __always_unused,
+				    struct device_attribute *attr __always_unused,
+				    char *buf)
+{
+	return rapl_pmu_cpus_show(buf, true);
+}
+
 static DEVICE_ATTR_RO(cpumask);
+static DEVICE_ATTR_RO(associated_cpus);
 
 static struct attribute *pmu_cpumask_attrs[] = {
 	&dev_attr_cpumask.attr,
+	&dev_attr_associated_cpus.attr,
 	NULL
 };
 
-- 
2.56.0

