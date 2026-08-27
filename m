Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2808E27AC57
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787801807; cv=none; b=VTItTl2+dnsGtpCWUKQzAUcQMSwpB+jJEVcf0liqOqlYNSElU0RceOCKDleHBahi8v9+CY5BjkipuXsQTYISnVtsykqYTMll5R4iq92dqyg30uAB97NqP3l+G1S4lS4FVrpZIVAYD8H9dBeb8L3wkKt+Bg3s2fpTsQVk/TGmvP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787801807; c=relaxed/simple;
	bh=S6ku115fgK7hNhwt1nQXdIbhL6C4zTBdrrZhzHrrbfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nQdnPLoZYJI6NKph8uZ5VopTzB4saYxHMBn4TsEiA7K/jynYWJ/HOGvVzZ+vDO672VPX1dPoN4ZZYOX4iwsbjRNrpx9bAEFRq6raWg/aKdkgYGXyYe+IiDO7EW28uwqcRJTH6eJGDPFGlGuZZInKI82kQ6epwTCYSpjZVN4HyJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=VqOffWoi; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="VqOffWoi"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NmH+uaRozgGfS8fVoR2maINoHC0fL3tOgbKNMdD6DtA=;
	b=VqOffWoi1TheiWS5s4Jnf9HzIcShvHJd9rXsp3sdb9Ga3+Q+S4RyznamWoKqczg+XfhuKPQ9w
	+xkwpOIM2L2qUM1yeot5X5rrJwovU+ih1lc65iTbvdOoQOHp7/6nuWPi0EcWurS4qeQ2J9TR1ek
	L6q9hri/W5jLUOqw5eMOnKA=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hVn3D5c0ZzKm5m;
	Thu, 27 Aug 2026 11:25:44 +0800 (CST)
Received: from kwepemr500016.china.huawei.com (unknown [7.202.195.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 8920040573;
	Thu, 27 Aug 2026 11:36:34 +0800 (CST)
Received: from [10.67.111.161] (10.67.111.161) by
 kwepemr500016.china.huawei.com (7.202.195.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 11:36:33 +0800
Message-ID: <bc90cc67-93d0-463c-adf9-53b00a932d56@huawei.com>
Date: Thu, 27 Aug 2026 11:36:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Userspace throttling + "sched/fair: Combine detach
 into dequeue when migrating task" causes guest boot hang
To: Aaron Lu <ziqianlu@bytedance.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, <linux-kernel@vger.kernel.org>
References: <20260825120629.2472938-1-chenjinghuang2@huawei.com>
 <20260826100009.GA3616635@bytedance.com>
From: chenjinghuang <chenjinghuang2@huawei.com>
In-Reply-To: <20260826100009.GA3616635@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500016.china.huawei.com (7.202.195.68)

On 8/26/2026 6:00 PM, Aaron Lu wrote:
> On Tue, Aug 25, 2026 at 12:06:29PM +0000, Chen Jinghuang wrote:
>> Hi, I'm seeing a VM boot hang on mainline, and I'd like to understand the
>> interaction between userspace throttling and the scheduler patch
>> "e1f078f50478 sched/fair: Combine detach into dequeue when migrating
>> task".
>>
>> Host:
>> aarch64, 96 CPUs (0-95), 4 NUMA nodes:
>> 	node0: 0-23, node1: 24-47, node2: 48-71, node3: 72-95
>> Mainline kernel tag: 7.2-rc1.
>>
>> Guest(libvirt/KVM) - described in words:
>> An aarch64 (virt-6.2) UEFI VM launched with `virsh create`; key config:
>>
>> - 128 vCPUs (statically placed, oversubscribed — the host has only 96
>>   physical CPUs).
>> - host-passthrough CPU model; GICv3; 64 GiB RAM.
>> - <cputune> has <global_quota> set to 400000; all <vcpupin> and
>>   <emulatorpin> entries are commented out, so there is no vCPU pinning.
>> - Storage: qcow2 on virtio-scsi (cache=none, io=native). HPET disabled.
>>
>> Userspace throttling:
>> The VM runs under a CPU-quota cap applied on the host. The actual values
>> from the cgroup controller are:
>>
>> 	cpu.cfs_period_us = 100000
>> 	cpu.cfs_quota_us  = 400000
>>
>> I also found that if I set cpu.cfs_quota_us to -1, or enlarge it beyond a
>> certain point, the guest boots fine.
>>
>> Symptom:
>> The guest hangs at some command early in boot and never reaches the login
>> prompt.
>>
> 
> I tried this on an x86 machine with v7.2-rc1 kernel and with quota set
> to 4 cpus, the VM booted fine; when I further reduced quota to 1 cpu, the
> guest kernel would dump a ton of soft lockups during boot. I also tried
> running an old 5.10 kernel(which doesn't have per-task throttle) and it
> behaved the same as v7.2-rc1.
> 
> The x86 machine has 64cores/128cpus and the VM I created has 128cpus and
> 128G memory.
> 
My host is an ARM64 machine without SMT, so 96 physical cores correspond to
96 logical CPUs. The VM is configured with 128 vCPUs, which is indeed a typical
CPU oversubscription scenario. In my machine, if I configure the VM with 96 vCPUs,
the issue don't occur either.

>> Observations:
>> Only reverting both of the following together makes it boot (neither one
>> alone suffices):
>>
>> 1. The kernel patch for userspace throttling.
>> 2. The scheduler patch:
>>    e1f078f50478 ("sched/fair: Combine detach into dequeue when migrating
>>    task")
> 
> I'm curious how you found e1f078f50478, just because it touched pelt?
> 
I located these two commits via git bisect:
- Comparison: On an older 5.10 kernel, the same test case (Quota set to 400000 with
  a 128-vCPU VM) boots completely fine, whereas on the mainline kernel, the guest hangs.
- Bisect steps: Without userspace throttling, git bisect pointed to commit e1f078f50478
  ("sched/fair: Combine detach into dequeue when migrating task"). Howevert, reverting
  e1f078f50478 alone on mainline v7.2 still resulted in a hang. Futher bisecting led
  to the userspace throttling patch("sched/fair: Switch to task based throttle model").
  I found that only reverting both e1f078f50478 and the userspace throttling ptach together
  restores normal guest boot.

>>
>> Reverting only one of them still hangs; reverting both together boots fine.
>>
> 
> On top of v7.2-rc1, right?
> 
Yes, the previous test was based on v7.2-rc1. You can also try reproducing it on top
of the official v7.2 tag (commit 8d3ae59288f1).

>> Question:
>> I don't fully understand how these two interact. My rough guess: e1f078f50478
>> ("sched/fair: Combine detach into dequeue when migrating task") affects the
>> PELT accounting, and the userspace throttling also has logic that affects PELT
>> accounting. When both are combined, load balancing and subsequent scheduling
>> behavior may end up misbehaving, stalling the guest.
> 
> Is the host busy? If the host has many idle cpus, even the pelt is
> wrecked(which I doubt), it should not cause the qemu task being starved.
> The PELT accounting matters when tasks have to compet the same CPU, but
> if your host system has many idle cpus, that should not happen.
> 
The host is not running any other workloads besides the tasks associated with starting the
VM. However, because this is an oversubscribed setup, tasks are running across all 96 host
CPUs(even though the utilization on most CPUs is below 10%), so the host don't have many
idle CPUs available.

> And from the log you posted for the cpu usage, it appears that task
> group is getting cpu time.

It seems possible that the task gets throttled shortly after receiving a small time slice
in each period.

