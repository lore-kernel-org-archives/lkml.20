Received: from sg-3-112.ptr.tlmpb.com (sg-3-112.ptr.tlmpb.com [101.45.255.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD243F8C9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829477; cv=none; b=pTKXw3zM+F9bbeIa0yQkrSKkAxmbc0l8JjxFOy60VUGJgKpi1Ntu8KokCsC+YjX9Y8fuLcA4sBdHxtVTyfzFyL08APtgyf4oLbQw0AV/aVaWcEVBrQncM0ibb4vra0b4pXQejvou0isbNy2SoFK+ads3afqyEKyYf2URBwFLYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829477; c=relaxed/simple;
	bh=wCm1eVnYAO/EO+owrR7lwDdvGU0g5n1lXtZK1GmOx9I=;
	h=To:Cc:From:Message-Id:References:Subject:Content-Type:
	 Content-Disposition:Date:Mime-Version:In-Reply-To; b=HVzqFvpmpE9JeWtJp0SN8ls+MGGDqILJI3YUuYTB2AoZEfvyDVu849vzljMzWL8yZRd4LKY6+e26OtccqZNIIMjunmWVbStUpT2ArJ4/M4h6Cg9uW2QOuKRMxbIk58OEohUJY8YzVdBOy39ryDbDBYtL7zTV7UUAwAFqUiPbVfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eLuS0Yv6; arc=none smtp.client-ip=101.45.255.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eLuS0Yv6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787829417; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=C+ZVonszOQgEzuNk4+rgdYKom9BpXgO/p1jeWf7hvoE=;
 b=eLuS0Yv6d5uqyXpYrma5tLjHaTu1ySTmuP+Av4Pgf8jDIt+dEPtjYjaPk7p4jQ1/MxXl20
 1ZOVmfCVdIZedncSlwmfA51byjZJDlN17CJPdQI4XfPKb+vcjpK04Q/LvG0WAFY8RkBfG9
 JNmh/sCGBMm2r7xuzZp5CTV0dvNVcO+iQLXqEu6rWIi2LvGG1w9EjwSv4ToiIKEiIHUpvs
 cbiQTxIzZDg7sTP3b8808yfOER2deJCF9jhQSGkoMrM+d/1/Uf2pwNQBhBJKNfkTWP2jF/
 SXAb1gqQq3pRg5kAsWZEs9ndnuIFLJ/jVbE4gSCPibYdu+7pQxDujWAfbdEypA==
To: "chenjinghuang" <chenjinghuang2@huawei.com>
Cc: "Ingo Molnar" <mingo@redhat.com>, 
	"Peter Zijlstra" <peterz@infradead.org>, 
	"Juri Lelli" <juri.lelli@redhat.com>, 
	"Vincent Guittot" <vincent.guittot@linaro.org>, 
	"Dietmar Eggemann" <dietmar.eggemann@arm.com>, 
	"Steven Rostedt" <rostedt@goodmis.org>, 
	"Ben Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>, 
	"Valentin Schneider" <vschneid@redhat.com>, 
	"K Prateek Nayak" <kprateek.nayak@amd.com>, 
	<linux-kernel@vger.kernel.org>
From: "Aaron Lu" <ziqianlu@bytedance.com>
Message-Id: <20260827111557.GB3616635@bytedance.com>
References: <20260825120629.2472938-1-chenjinghuang2@huawei.com> <20260826100009.GA3616635@bytedance.com> <bc90cc67-93d0-463c-adf9-53b00a932d56@huawei.com>
Subject: Re: [Question] Userspace throttling + "sched/fair: Combine detach into dequeue when migrating task" causes guest boot hang
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
X-Original-From: Aaron Lu <ziqianlu@bytedance.com>
Date: Thu, 27 Aug 2026 19:16:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <bc90cc67-93d0-463c-adf9-53b00a932d56@huawei.com>
X-Lms-Return-Path: <lba+26a901ca7+7f51d7+vger.kernel.org+ziqianlu@bytedance.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 11:36:33AM +0800, chenjinghuang wrote:
> On 8/26/2026 6:00 PM, Aaron Lu wrote:
> > On Tue, Aug 25, 2026 at 12:06:29PM +0000, Chen Jinghuang wrote:
> >> Hi, I'm seeing a VM boot hang on mainline, and I'd like to understand =
the
> >> interaction between userspace throttling and the scheduler patch
> >> "e1f078f50478 sched/fair: Combine detach into dequeue when migrating
> >> task".
> >>
> >> Host:
> >> aarch64, 96 CPUs (0-95), 4 NUMA nodes:
> >> 	node0: 0-23, node1: 24-47, node2: 48-71, node3: 72-95
> >> Mainline kernel tag: 7.2-rc1.
> >>
> >> Guest(libvirt/KVM) - described in words:
> >> An aarch64 (virt-6.2) UEFI VM launched with `virsh create`; key config=
:
> >>
> >> - 128 vCPUs (statically placed, oversubscribed =E2=80=94 the host has =
only 96
> >>   physical CPUs).
> >> - host-passthrough CPU model; GICv3; 64 GiB RAM.
> >> - <cputune> has <global_quota> set to 400000; all <vcpupin> and
> >>   <emulatorpin> entries are commented out, so there is no vCPU pinning=
.
> >> - Storage: qcow2 on virtio-scsi (cache=3Dnone, io=3Dnative). HPET disa=
bled.
> >>
> >> Userspace throttling:
> >> The VM runs under a CPU-quota cap applied on the host. The actual valu=
es
> >> from the cgroup controller are:
> >>
> >> 	cpu.cfs_period_us =3D 100000
> >> 	cpu.cfs_quota_us  =3D 400000
> >>
> >> I also found that if I set cpu.cfs_quota_us to -1, or enlarge it beyon=
d a
> >> certain point, the guest boots fine.
> >>
> >> Symptom:
> >> The guest hangs at some command early in boot and never reaches the lo=
gin
> >> prompt.
> >>
> >=20
> > I tried this on an x86 machine with v7.2-rc1 kernel and with quota set
> > to 4 cpus, the VM booted fine; when I further reduced quota to 1 cpu, t=
he
> > guest kernel would dump a ton of soft lockups during boot. I also tried
> > running an old 5.10 kernel(which doesn't have per-task throttle) and it
> > behaved the same as v7.2-rc1.
> >=20
> > The x86 machine has 64cores/128cpus and the VM I created has 128cpus an=
d
> > 128G memory.
> >=20
> My host is an ARM64 machine without SMT, so 96 physical cores correspond =
to
> 96 logical CPUs. The VM is configured with 128 vCPUs, which is indeed a t=
ypical
> CPU oversubscription scenario. In my machine, if I configure the VM with =
96 vCPUs,
> the issue don't occur either.
>

OK, so this looks like it has something to do with the task number. More
vCPUs translated to more qemu threads and that caused your guest boot
hang. I think there should be softlockup dumps in your case, is it that
the softlockup detector is not enabled in your guest kernel config?

With this said, I increased vCPU to 256 on this 64core/128cpus Intel host
to see if I can reproduce this. With 4 cpus quota, it managed to boot
the guest. There are several softlockups during boot though and that is
an indication the qemu task is in need of cpu time. I can imagine if I
increase the vCPU number even more or reduce the quota further, it will
eventually hang the guest with tons of softlockup msgs.
