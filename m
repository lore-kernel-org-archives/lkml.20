Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net [23.83.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66D2FE56A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.212.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790551308; cv=none; b=Vgwt9457CnFk8KWsM1Vz53Bt3uHQgF3d6UZyzWb4TG1e79QyWXKglTk7kvCUhsB+D5zJHfEsomVQD534mbiqqT2QrNOZw/2JkLg9o48emoZBbGO+rI0uCP8MkBrZ5oM1WqV6VnYtSVcfQgYgQOv6jSRHgexpRmLlq1a5o0svV0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790551308; c=relaxed/simple;
	bh=mUu0/DBtr8kVBFjAigknAdGULEkAk97/SoYRyGISW38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9DQBvWniEblpme0iTnadMOiM6cdkODkuQLcJW0WIKOBxUDtPaox3J4GZlGiq9OhgIgeqUiriH77aqcb6WavKtfJB5ftTihDdsjEamTLybQI2kgiOPmaaQH9CNNESKh6xQgrxXhDVNMttwiZrXjThzWgU9PErloOJe17JPVuD2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=p6j5AQQo; arc=none smtp.client-ip=23.83.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="p6j5AQQo"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 02DC47A04F3;
	Sun, 27 Sep 2026 23:21:41 +0000 (UTC)
Received: from pdx1-sub0-mail-a257.dreamhost.com (100-96-11-224.trex-nlb.outbound.svc.cluster.local [100.96.11.224])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5627A7A1F7C;
	Sun, 27 Sep 2026 23:21:36 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Wiry-Chief: 41dddb1b6fc693b1_1790551300781_4061377477
X-MC-Loop-Signature: 1790551300781:2423337548
X-MC-Ingress-Time: 1790551300781
Received: from pdx1-sub0-mail-a257.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.11.224 (trex/8.0.2);
	Sun, 27 Sep 2026 23:21:40 +0000
Received: from offworld (unknown [172.58.116.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a257.dreamhost.com (Postfix) with ESMTPSA id 4htL6j5995z104l;
	Sun, 27 Sep 2026 16:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790551296;
	bh=SwQbYI+bY99g1ejEPX/a+Ge6mlBgGLkJ4XTFloG11TU=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=p6j5AQQoTAl8TyeHmGBrv2YM0bPu6H+StLIwctD/vIjwYiSb42R592+joK0nxu6AM
	 EOJR0qlV+n/6qaLGP5z+3HT1aGKis5bYz92NORjbsvFbY1m3Gi950JrqDM4RMDDHii
	 /L+mgEQZlNAK0bEw65bJ1OTeqoc09dp2cs45IbQW2MAnlcNwyTeHTzn/Huqi9lPqwK
	 6j2yi0CnX448/5EdNKGPuM/MW2fXTqBRq+/nQLodmFFXikbAP8EFCzZJgy04WXdhXg
	 87uVIlmGqC2Xw5EoBS1hBELXVXwQM6/XL/0zMFvjruvmnWLu4nJYU2njoeIKM8wuhs
	 GyQyMHiHmTx5g==
Date: Sun, 27 Sep 2026 16:21:30 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Bharata B Rao <bharata@amd.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com, gourry@gourry.net,
	mgorman@techsingularity.net, mingo@redhat.com, peterz@infradead.org,
	raghavendra.kt@amd.com, riel@surriel.com, rientjes@google.com,
	sj@kernel.org, weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, ziy@nvidia.com, nifan.cxl@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@kernel.org, byungchul@sk.com,
	kinseyho@google.com, yuanchu@google.com, balbirs@nvidia.com,
	alok.rathore@samsung.com, shivankg@amd.com, donettom@linux.ibm.com
Subject: Re: [PATCH v8 0/8] mm: Hot page tracking and promotion infrastructure
Message-ID: <20260927232130.smxstw7f474k2qcl@offworld>
References: <20260911210859.1359875-1-joshua.hahnjy@gmail.com>
 <f871efd2-06b4-493f-87cc-919b6e0945c0@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f871efd2-06b4-493f-87cc-919b6e0945c0@amd.com>
User-Agent: NeoMutt/20220429

On Wed, 16 Sep 2026, Bharata B Rao wrote:

>On 12-Sep-26 2:38 AM, Joshua Hahn wrote:
>> - I also found a bug where the kmigrated thread isn't created for nodes
>>   that are onlined later after boot, like CXL nodes that get onlined
>>   with memory later on. I've been using a small hack commit in
>>   pghot_memhp_callback that just checks for the MEM_ONLINE case and
>>   spawns a kmigrated thread.
>
>I will take care of this scenario (CXL node online after boot) in my next posting.

I was also running into this for chmu integration. I have been carrying the
below in my own testing, fwiw.

Thanks,
Davidlohr

-------------8<------------------------------------------
diff --git a/mm/pghot.c b/mm/pghot.c
index c7f523a61683..2f1e16e5091d 100644
--- a/mm/pghot.c
+++ b/mm/pghot.c
@@ -602,6 +609,18 @@ static int kmigrated_run(int nid)
  	return 0;
  }
  
+static void kmigrated_stop(int nid)
+{
+	pg_data_t *pgdat = NODE_DATA(nid);
+	struct task_struct *t;
+
+	t = pgdat->kmigrated;
+	if (t) {
+		kthread_stop(t);
+		pgdat->kmigrated = NULL;
+	}
+}
+
  static void pghot_free_hot_map(struct mem_section *ms)
  {
  	struct pghot_hot_map *hot_map;
@@ -707,6 +726,58 @@ static struct notifier_block pghot_mem_notifier = {
  	.priority = DEFAULT_CALLBACK_PRI,
  };
  
+/*
+ * The first memory block of a node is onlined before the node gets
+ * assigned to a memory tier (memory tiers react to
+ * NODE_ADDED_FIRST_MEMORY at MEMTIER_HOTPLUG_PRI), so at
+ * MEM_GOING_ONLINE time for that block node_is_toptier() still
+ * returns true and pghot_online_sec_hotmap() skips it. Backfill the
+ * hot maps once the node tier is known.
+ */
+static void pghot_alloc_node_hotmaps(int nid)
+{
+	unsigned long section_nr, s_begin, start_pfn;
+	struct mem_section *ms;
+	struct page *page;
+
+	s_begin = next_present_section_nr(-1);
+	for_each_present_section_nr(s_begin, section_nr) {
+		ms = __nr_to_section(section_nr);
+		start_pfn = section_nr_to_pfn(section_nr);
+
+		page = pfn_to_online_page(start_pfn);
+		if (!page || page_to_nid(page) != nid)
+			continue;
+
+		if (rcu_access_pointer(ms->hot_map))
+			continue;
+
+		if (pghot_alloc_hot_map(ms, nid))
+			pr_warn("pghot: no hot map for section %lu on node %d\n",
+				section_nr, nid);
+	}
+}
+
+static int pghot_node_callback(struct notifier_block *self,
+			       unsigned long action, void *arg)
+{
+	struct node_notify *nn = arg;
+
+	switch (action) {
+	case NODE_ADDED_FIRST_MEMORY:
+		if (node_is_toptier(nn->nid))
+			break;
+		pghot_alloc_node_hotmaps(nn->nid);
+		kmigrated_run(nn->nid);
+		break;
+	case NODE_REMOVED_LAST_MEMORY:
+		kmigrated_stop(nn->nid);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
  static void pghot_destroy_hot_map(void)
  {
  	unsigned long section_nr, s_begin;
@@ -891,6 +962,11 @@ static int __init pghot_init(void)
  		if (ret)
  			goto out_stop_kthread;
  	}
+
+	ret = hotplug_node_notifier(pghot_node_callback, 0);
+	if (ret)
+		goto out_stop_kthread;
+
  	pghot_sysctl_init();
  	pghot_debug_init();
  	pghot_src_enabled_init();
-- 
2.39.5

