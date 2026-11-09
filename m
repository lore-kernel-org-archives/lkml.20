Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208285;
	b=O6ngXIKGoOx+qoeLeSQG3TShUMFPpEdUW1wp66QNPMn/fTSWXSso89djJXwJiIHiK7sZ
	 0fbnuf9SBVoKRaNLDz+8KaCiAdqzC+Wz5BfErnu6d0nmHYNH6H1tegjvMrW1j+ZyNOTyN
	 5D4HLzFFbFlioKMDPhnADZ7shpeuLWuJYjxwgrvFDhi6qrRSgpv3LBtwrO/mYnqkEJCsM
	 lKhFB8+8dtPJw69BbG808YpHyBJmuhvqTDB6qiFnr5Spw7dyoyxJmAKQSbkl4xC2ukgYn
	 yIs0PGy7zYAgI62LxPeYtynxgbv3UYBM2K1ClRVTVyKjwq1IAll/J4afdo6L2HrAZNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208285;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=fIix5kkSG2Hp/hhlQkdsjgCaiO3SGOl+pbqaM4JgnHo=;
	b=JryMHQE/Bag4TDllxmXHr0jpT8WvLPjc8O3wk5W2aBpRXkn7ncvii4EA/pDCSrn6bkFV
	 9mm0V50dV9a4qvPEEER9QM751aNx/mY43TjuGRTjanvtEdEddrOS1oK3BU1ruBocETxGM
	 oxlTfJOGrKAG4sKjkXPwrDUZUC1K6ibByZfVUonnf2IgGX3qs6fy9YtCWrCcfKKDoC3yI
	 +sYA6MOXH7OdtcsolKbhTwnkQ0kg/OG8K8MH42mrRjrqNh7HNwfhOOGWLxCmJL23g04oM
	 3CZgnYAidO7dLyUuzkXuWt99rnVPmtaIOOOuOhUtYGKaq+XpliJ1jBhrzfoWCxvIeMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.99
Received: from dggmsgout11.his.huawei.com (dggmsgout11.his.huawei.com [124.71.93.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A410B606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A410B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggmsgout11.his.huawei.com (SkyGuard) with ESMTP id 4jNLXg6VDgz1c1ST
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:10:43 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 23AEF40AA1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:11:20 +0800 (CST)
Received: from [10.67.109.234] (unknown [10.67.109.234])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgB3ev0XcvFquAB0Dg--.36272S2;
	Mon, 09 Nov 2026 15:11:19 +0800 (CST)
Message-ID: <c5cd8987-be55-4cab-84bc-1ceff3b6a836@huaweicloud.com>
Date: Mon, 9 Nov 2026 15:11:19 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] sched/cache: Reduce the overhead of
 task_cache_work by only scan the visisted cpus
Content-Language: en-US
To: Chen Yu <yu.c.chen@intel.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, tim.c.chen@linux.intel.com,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, chen.yu@linux.dev
References: <20261009032943.95091-1-luogengkun@huaweicloud.com>
 <20261009032943.95091-2-luogengkun@huaweicloud.com>
 <atjnyuXpcvFZ0xpz@chenyu-dev>
From: Luo Gengkun <luogengkun@huaweicloud.com>
In-Reply-To: <atjnyuXpcvFZ0xpz@chenyu-dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgB3ev0XcvFquAB0Dg--.36272S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF45AF4fKr1fGr18JF4rAFb_yoW8uF1fpF
	ZxGFyftF4DJry7Jrn7tF18Jr4UKrWfAr4UJFy8Xry8ZryY9r15Jr43Ga95ZFyUCFy0k34j
	vryDJr1Uuw1UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
	GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	UQ6p9UUUUU=
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

On 2026/10/22 0:26, Chen Yu wrote:
> On Fri, Oct 09, 2026 at 03:29:42AM +0000, Luo Gengkun wrote:
>> The overhead of task_cache_work() is high, especially in multi-NUMA systems.
>> Currently, task_cache_work() tries to find the pref_llc by scanning all CPUs
>> in the system. However, most of these scans are meaningless, such as those
>> for CPUs that have never been visited or were accessed a long time ago.
>>
>> To address this problem, introduce visited_cpus to track the visited CPUs
>> and evict them once they have not been accessed for a duration exceeding
>> llc_epoch_affinity_timeout.
>>
>> Now that we know exactly which CPUs to scan from visited_cpus, we can remove
>> get_scan_cpumasks().
>>
>> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
>>
> 
> Thanks Prateek for popping this patch up, and thanks Gengkun for the continuous
> optimization on this. I asked AI to launch a full hackbench test on a Xeon with
> 4 LLCs per node, especially to test the case where the LLC is saturated, under
> which scenario the contention for the visit_cpu mask is high. The test shows no
> regression. So from a code design point of view, this change is a good optimization
> to reduce the potential overhead, and also paves the way for the multiple preferred
> LLC/node work that Jianyong is doing IMO,
> 
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Chen Yu <yu.c.chen@intel.com>
> 
> thanks,
> Chenyu

Hi Chenyu,

Thank you so much for the review and for running the extensive hackbench
tests again on your system!

Best regards,
Luo Gengkun

> 
> =========================================
> Hackbench comparison
> BASE: cas_on_base
> TEST: cas_on_visit
> =========================================
> MODE     G  FD |         BASE(s) |         TEST(s) |   DIFF% | RESULT
> ------- -- ----+-----------------+-----------------+---------+----------
> process  1   4 |     0.329/16.1% |     0.302/27.8% |   8.21% | IMPROVED
> threads  2  16 |    222.206/2.3% |    215.147/0.9% |   3.18% | IMPROVED
> threads  2  20 |    26.031/14.3% |     24.097/7.4% |   7.43% | IMPROVED
> threads  4   8 |     4.338/26.6% |     3.965/31.5% |   8.60% | IMPROVED

