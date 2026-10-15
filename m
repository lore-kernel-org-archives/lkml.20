Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005813790B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068443; cv=none; b=SVIZ2uP+EVIQEHBM+2Zh//1q/09DWOrx/AqMkBOsRkNxjdlbH1iU2cSDO9FvktaUjt1SnPvYI1duKvJIbkPO3apOJyl4+PjLx3PHc7S33EHbdgt1QX3a3wxiGIsFdMBmLmkTifSd6Bh74joVMu2EknJNL8oE/2kMetZzCmzf/xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068443; c=relaxed/simple;
	bh=YOJ0YMc8La/jNcbBC0eUdhX9rRv/PsC7NYu9zK8QHpo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=RIPlXKhoQqtKieE/DvQ64VA5l5ULr6C57LTuqoQZD9kWIkmXKAWu4HlKaayXDUaQC2MmW/ChrT4S+GNyAKBtqDueh64U/Z0EOQ2L9T49ukDTW2iScUmq8HRKYplqblkm6jC7zFxFGeW6zFqmtYJxSiIEC+4prFHo+41f5BHBGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oV2PyAfP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huFvi3OY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oV2PyAfP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huFvi3OY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSAS2809287
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=03X9ozMJs7HECVlV9S35rD
	2v2kz+KS+stKRC+hGL5Ok=; b=oV2PyAfPfzGtrc7hvmdJtmP5SJLJLKjQy418xP
	Z+kWiGqQRZLvz1CQdQc7/p5RSYXr3+oa0l+++ib2hEkAeAgPVTyCajRzn073VlZ/
	/FevjlIm2dZzhG6ngXOXr/+4JYezdpmD8cjPQqPp/oZkQn6oqtjlfgVbd9hPK0Zh
	WxBPLu7DQQ98unmB0doQk/n72JhJyjZdl8DPmQT+6aZvAHgiDekIWb9D591YOKrf
	FN2i7zWdPHFkxgvgfIqUxqIEsyE9tHZz5NfscqOiUlR8FG6EIx66+RKFS9q8cec8
	jUox++DFFZ57vNT1cz+On0z7t7nqqJY7KieXhDeQcDEtbQVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54tm88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:47:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso29771955ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792068440; x=1792673240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=03X9ozMJs7HECVlV9S35rD2v2kz+KS+stKRC+hGL5Ok=;
        b=huFvi3OY23hZcLkNyj1XtY3akI/RXE0rhxkrYrsSEQXu4XwzxphOCzddbdLBNtTtPa
         dJfRYf53WsDW1hIvl1eh23kgaD04zi8tMA4bil7Nk9Fch9ZUUIhJOhoAIeDxLvARJax6
         Vz+2fkVX3bSGD0JDWRZfB2Clk/fMVTvhJa6D3U5RbzMyGRv7Dqf4v3ZC7rYb759dj0aF
         D99jPRvznJrocrZ30Uu4xq76Yt1s1uWjUgzN6XLVyu088BF59dO9mYl7I5P3z3maQ0y5
         TXybXwtHQelCMsnlcGOZYMTPRdBKGh+MgtvRBnWFhbqnvc+k04oeuJD4+k9ft5wlGDdo
         A9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068440; x=1792673240;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03X9ozMJs7HECVlV9S35rD2v2kz+KS+stKRC+hGL5Ok=;
        b=Gm/Fn4uHJqa3+9yd6BNh9HTZs+UawTCwRUUcPubpHxBATllVP9xkvSAkt7yep3DoA7
         Dzsq+K0ecUekLktZvz7MuzxnmuWL/ZETd0uYPqo2cyH/nhplKmMzAbhWHCje6AEiJewT
         NM9X1OLSrC02VgASrYlfixOrZUBG34w3Qskj5KNSF71cdZRsDrKYnb5OjKPcGG43QHtT
         XB3bDw3krrTjIS3nhvtGk/dgQ4/RjGbemlTIiOUQjeCmaHHTFMxwm//8KqFcgAFk3BDq
         ZCBIeYRsbNjHGKkI3f+jRChxwbYT9QbC2M9XPcRKS81HXxmiwmjJlQhRSm5sbO8Jocst
         +ERw==
X-Forwarded-Encrypted: i=1; AKwUvByjFCauRfR1bxfKavXC27WkGK+ds5t2OJOryVECKwNmu6SjEnRaYJYKId+bx7ruP6ywKoSktP+/USRhyTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxq+WbOpuuswKHsvUGJdkrk7cCOIwAj0B06ct2WWLmrGOQQeV8
	X4de1jbOuCtXIexRNIs27BirS7IMAiigxCGHqNz0nWsH2vqrULwRv63ofXkNBN4hNReNT8xdKd6
	XmkPKSbVaeqPZrIT1LzX7PS+iQA1fwGgOPRzcqsbpkQgo/0VJYyzMl7GX33Pk9LNgOZo=
X-Gm-Gg: AYBFou1vZVt5SuGNurqTAQHHRVwIbaXo9aPqtwlVCpJMdYgk3GFsOcX08ENhT+b6s7u
	p/x5gFDSySJaLsSTQ/i/iJDojLX6USIAZ9/3DPsHrZZQ8b0/vdTNASX7CG+VjQn9joWH9tnWYI7
	cD4H35DrqQ/cWlzV9uAljg98LSVSngZkrh0PxuRsKivpADEiX5LHyJOrXrD2N4w80Ghd+CCv2RE
	oD7+rKxK7cJp3NVDpOi/8B46zDL2nCQcT9obeP7cd04lhNCXaFZmWlOSH1E4dy2n55fHZ1tXu54
	0HVNvZqCYZD9Sm7jytjL+MhzbeSzSGxhOdd8MHtZn2FlsRLb1QmYClwfW3Q99NHm38DKPc6j840
	EMabTa2yYcfaOQ5GhupiRC5pbrZtWpkmg4jHCUoUGLyyis2kClXGUIo1WOm82P+z74oMF
X-Received: by 2002:a17:902:e892:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2e842e1363emr183533445ad.39.1792068439766;
        Thu, 15 Oct 2026 05:47:19 -0700 (PDT)
X-Received: by 2002:a17:902:e892:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2e842e1363emr183532555ad.39.1792068438410;
        Thu, 15 Oct 2026 05:47:18 -0700 (PDT)
Received: from [10.133.33.55] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b160csm82646435ad.37.2026.10.15.05.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:47:17 -0700 (PDT)
Message-ID: <6b295276-4f42-4f46-b5a2-50c3ac83b412@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 20:47:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
        Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,
        Cheng-Yang Chou <yphbchou0911@gmail.com>,
        Emil Tsalapatis <etsal@meta.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>
Cc: sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        abhijeet.dharmapurikar@oss.qualcomm.com
From: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Subject: [RESEND RFC] sched_ext: Support RT task within sched_ext
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0cb58 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OGjWj8McAAAA:8 a=OhM-RmH_1B9f-UcPyl4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX8EmmseTO74+C
 ZoeZnExPz/o36vRdeC9uX8Ix6NNVppttK7ztyx7tJlKCWHEpQrU5qE/gxYN8PrOIh4LM/JegUXj
 TrnpShFWKzfTFwR4PH0Ag/imssGQN0aYh6WHvJGAaPqpuUYiNb3kaJ7MVuwnoRtjCf/RNJBFpdZ
 8DKd4phT3qlArI2t+yJTWeR1RPEu8fElIJhTOEaLb/z10zdocqqqL/JLOUefHa/UvE3/SJQToGK
 vD5oVSRx4MNbJWbeCeT6ifubdKJCBZ4oSm4XEtP/vzJr067e2531Ftz8Ut/+jir0Lc0lof+Qibg
 eE3vheTMwUVizzw4/kWRJ2/mm+oormZm9x6bYj4F7s1+yFJDBpLGobcgVX3xxaSMA9bd/SpqQqw
 03tRzDNihWvLZFM20m1a17U0xQHXFEHZe86FDOYiLYiAVoH07UlVGe0LmHbQAHu3102/8FMwdsE
 DqR39A4k3MQHrVGG7Yg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX2MjJHWZKBFOO
 u/6x6IWxfxs+JeeNEIgv4TWUfy5u+RpWaA1eCXc4qFHPRB/vx4imANaG2YBg4f+r5nvxhX5Y/kM
 ORngAVSfqKY3Aljv0vfKaY+MEkwTI9c=
X-Proofpoint-GUID: EVTPiV4lNsplVyp7my5H6FFcRAqwfski
X-Proofpoint-ORIG-GUID: EVTPiV4lNsplVyp7my5H6FFcRAqwfski
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150050

Sorry for resending this as plain text. The previous email was rejected
by the sched-ext mailing list because it contained HTML.

Hi all,

We would like to discuss how RT tasks can best coordinate with sched_ext
for cpu placement, cpu balance, and sched load reporting to schedutil
governor. This RFC is intended to continue the discussion in email list
from last LPC[1].

One of the options we would like to explore is allowing sched_ext to
schedule some explicitly selected SCHED_FIFO/SCHED_RR tasks.

We received feedback from Changwoo that the issue is valid, and in
LAVD sched-ext, they tried affining RT tasks to a limited set of CPUs as a
workaround for the scheduler placement, but we do know that it is not a
flexible enough solution.

We also had a discussion with Andrea Righi, that he acknowledged that
he understands the scenario and current problem, and he would suggest
not changing the current core scheduler, but instead using bpf ops to
bring the RT tasks under the sched-ext control. We are trying to explore
more on this path, and welcome to suggest or comment here.

LPC topic:
[1] https://lpc.events/event/20/contributions/2561/

Slides:
[2] 
https://lpc.events/event/20/contributions/2561/attachments/2025/4612/2026_LPC_Support_RT_tasks_within_sched-ext_.pdf


Here is a text-based description of the main idea presented at LPC.
If you already have that context, you can skip the section below.


Background
----------

In most of the Android gaming, video playback, and livestreaming test
scenarios, non-RT threads work together with RT threads to construct and
consume a frame. Finishing the frame on time without frame jank is a
key performance KPI. A balanced workload across CPUs with fewer
unnecessary CPU frequency bumps is another key power KPI.

More specifically, taking a gaming scenario for example, UnityMain and
UnityGfxDeviceW are the critical normal threads that have significantly
higher load and usually run on the most performance-efficient cpus in
gold/prime cluster. Other than those high load tasks, the other normal
tasks mostly have similar workloads.

It has RT threads like the display HAL tasks, SurfaceFlinger, and the
GPU related tasks. Those RT tasks have workloads comparable to those
of other non-high-load normal tasks.

In our tests, sched_ext runs in switch-all mode, with
SCX_OPS_SWITCH_PARTIAL unset. It schedules the non-RT tasks
covered by this mode. SCHED_FIFO/SCHED_RR tasks still run in
the native RT class.

Below, we call these non-RT tasks "SCX tasks".
SCHED_DEADLINE tasks are not part of this proposal.


Observed problems
-----------------

cpu placement:

In our tests, RT tasks can run on CPUs used by important SCX tasks.
This can cause the SCX tasks to be preempted, waiting longer to run,
or lose cache locality.

Here is a diagram for easier understanding:

         RT task + important SCX task
                     |
                     v
                  same CPU
                     |
                     v
               CPU contention
                     |
         +-----------+-----------+
         |           |           |
    preemption   longer wait   cache impact
         \           |           /
          \          |          /
           +---------+---------+
                     |
                     v
        SCX work may finish later

RT tasks have higher priority, so the preemption itself is
expected. However, from the whole scenario perspective, better CPU
placement could reduce this interference when another suitable CPU
is available.


Load balance:

RT tasks can be scheduled in the same cluster of non-high load scx
tasks. This can also be a preferred placement decision. While the
load balance within the cluster is also hard to maintain.

We sometimes see RT and SCX tasks on the same CPU while other CPUs
can become idle very shortly. We need to check whether those newly
idle CPUs can pull and run the scx tasks. While if RT tasks are also
in the same scx scheduler, it is easier to make decisions from a load
balance perspective.


sched util calculation:

We also see a difference in load tracking. Our implementation
uses a frame-window model for SCX tasks, while the RT load signal
in our setup uses PELT.

The SCX task load is flat and steady, while the RT task load
sometimes spikes. An unnecessary CPU frequency bump up can be triggered
by RT task load spikes.


Why CPU affinity is not enough
------------------------------

We could use CPU affinity to keep RT and important SCX tasks
on different CPUs. This could reduce the time they compete
for the same CPU.

However, CPU affinity is fixed and strictly limits how tasks can move
between CPUs. If the number of background tasks increases, CPUs perferred
for critical SCX tasks may still have spare capacity. With fixed CPU
affinity, non-critical SCX tasks cannot use those CPUs even when doing
so would help balance the system load.

Ideally, the scheduler should be able to choose CPUs dynamically as
the load changes, while still keeping tasks within their allowed CPU
masks.

CPU affinity may still help, but it does not provide the
flexibility we want here.


Possible options
----------------

One option is to let sched_ext schedule some explicitly selected RT
threads together with SCX tasks.

This could let one scheduler choose CPUs for both selected RT
threads and SCX tasks.

For example, if other cpu is idle, or running a low priority scx task,
or running a low load scx task, an RT task could use that CPU instead
of a CPU running an important high load SCX task. This could reduce CPU
contention for the frame important KPI and help balance RT and SCX tasks
across CPUs.

Such placement should remain a preference rather than a fixed
rule. It must respect the RT task's priority, timing needs, and
allowed CPU mask. The other CPU must also have enough capacity.

It could also allow RT and SCX tasks to use the same utilization
model. We would like to study whether this can make the load
signal more stable and reduce late CPU frequency changes.

Another option is to keep all RT tasks in the native RT
class, but provide enough information for the two schedulers
to better coordinate CPU placement. However, this would also require
placement and load synchronization between the RT scheduling class
and the sched_ext class.

After the LPC discussion, we'd like to explore option 1 and use
BPF-only hooks to achieve current needed RT tasks within scx class.

One option is to have all RT tasks with a priority lower than the SCX
  helper thread go into sched_ext.

Migration thread, sched-ext enable/disable threads and IRQ threads need
to remain outside sched_ext. With this option, we will need to verify
more common scenarios. We can explore the first option first.


Open questions
--------------

* Can sched deadline can used to optimize those scenarios?

   It is possible, of course, so we put it here, welcome to share the
   possible configurations of which tasks goes to deadline. However, here
   we discuss only the topic of plugging RT tasks into and out of
   sched_ext for these scenarios. For different scenarios optimization,
   there is of course no single solution. It still can have different
   scheduler optimization to make a specific tasks a different sched-class.

* Other ideas?


We would appreciate feedback on the problem, the possible
directions, and what we should try first.

Thanks,
Tengfei Fan

