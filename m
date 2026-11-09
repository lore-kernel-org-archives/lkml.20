Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207878;
	b=3+3wN3L3FDakh1HTIdX/0r+HjMtudzu/jdqfhSG15vrq//R4mV4lcuR6b3M82FHo9LrH
	 D0aHNZO/mkr/8+cU5iIqvn56gYBhyyKGd/uck6QROSVBQokpJM59XfjZR60tfQukd2QX/
	 Juj+f3phTfzD4UnVp7KidWXrMmpnrLplWz2UtY7z+giNepoBUDdgufN1Ac65jR3IH+23e
	 kupCPPpkDZvuSUJWlSJlWF505CivMvH0hbyrnrWiuIY+UzjjUYCvgC0/xflcpEa4hEzzX
	 ZNdZZs6AhJUjepHSGjgZxn1mOMjrxwSE1EGRIHdztB23Irc9kJcTX5ZPc4ei7qhBvEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207878;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=/2iXZjYNHfDM8Qsvu2OEmC+mt1LyKTYWg7yIEhGTQbU=;
	b=2iItuo5bZzaL9lEcDYh6NPG/XRDB6PKY9V+m4aqT3VsLrsZihxjS3OUKYB/OzlwtaTID
	 nsOO1VeG50XGzleYRoBiwc1+xip+PJwaKfVT4UmG2rBe8MgyBxfztNdBDNtGLVwojLy8+
	 ZIX4XB/t+puy8pSyVdjGO8qDju4QjzCE3IYgFuE2khQB83sIqcD6ft6j5aM+ROEPtguHH
	 U8eiwTyowII7MV/6IkdGoWvIl4koTvORdZvPcjQmBtDFauJjriM+45ZjEvaURsjrnl9Xr
	 li2kEbClMux8lJi57C7Aw5tVR177/f+tPH8bgBlh6J/oPP+75VQ8P/QLJc2JaIXJEWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.112
Received: from dggmsgout12.his.huawei.com (dggmsgout12.his.huawei.com [124.71.93.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F72606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggmsgout12.his.huawei.com (SkyGuard) with ESMTP id 4jNLNr0zMlz1yHB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:03:56 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id DF93740C81
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:04:30 +0800 (CST)
Received: from [10.67.109.234] (unknown [10.67.109.234])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgD3+_59cPFq7GJzDg--.49930S2;
	Mon, 09 Nov 2026 15:04:30 +0800 (CST)
Message-ID: <0cb3d965-1eb0-41fe-8abd-67292bc2cfeb@huaweicloud.com>
Date: Mon, 9 Nov 2026 15:04:29 +0800
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
To: K Prateek Nayak <kprateek.nayak@amd.com>, peterz@infradead.org,
 mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 tim.c.chen@linux.intel.com, yu.c.chen@intel.com
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20261009032943.95091-1-luogengkun@huaweicloud.com>
 <20261009032943.95091-2-luogengkun@huaweicloud.com>
 <1e9259b5-0758-4387-a572-37e2d32c47c0@amd.com>
From: Luo Gengkun <luogengkun@huaweicloud.com>
In-Reply-To: <1e9259b5-0758-4387-a572-37e2d32c47c0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgD3+_59cPFq7GJzDg--.49930S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF43JFyUCFyDZw43KF45Wrg_yoWfJFWfpF
	WDXryxJr18XryUAw4UJr48Jry7Jws0gr1rJr1rXF18JayUtr1UAw18tF4UGrnrCr1qkay5
	Xa1UGr18J3s5tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
	GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	UAwIDUUUUU=
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

On 2026/10/21 12:30, K Prateek Nayak wrote:
> Hello Luo,
> 
> On 10/9/2026 8:59 AM, Luo Gengkun wrote:
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
> 
> nit. Could you include the performance numbers from the cover letter
> in the commit message here to keep it around for the record.
> 
>>
>> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
> 
> I gave it a spin on my 4th Generation EPYC system (2 x 128C/256T) and
> I could see small improvements and no regressions greater than the
> expected run to run variance. Feel free to include:
> 
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

Hi Prateek,

Apologies for the delayed response! I have been away on a business trip
for the past few weeks and am just getting back to this now.

Thank you so much for reviewing and taking the time to test this patch
on your system.

I will include the performance numbers in the commit message and add
your Tested-by tag in the next version.

Best regards,
Luo Gengkun
> 
> ---
> 
> o Full benchmark results
> 
>    ==================================================================
>    Test          : hackbench
>    Units         : Normalized time in seconds
>    Interpretation: Lower is better
>    Statistic     : AMean
>    ==================================================================
>    Case:           tip[pct imp](CV)      cpu-track[pct imp](CV)
>     1-groups     1.00 [ -0.00](14.00)     1.02 [ -1.98](11.49)
>     2-groups     1.00 [ -0.00]( 4.92)     0.91 [  9.49](11.67)
>     4-groups     1.00 [ -0.00]( 2.01)     0.99 [  0.51]( 2.98)
>     8-groups     1.00 [ -0.00]( 3.13)     1.02 [ -2.16]( 3.25)
>    16-groups     1.00 [ -0.00]( 1.52)     0.99 [  1.03]( 0.83)
> 
> 
>    ==================================================================
>    Test          : tbench
>    Units         : Normalized throughput
>    Interpretation: Higher is better
>    Statistic     : AMean
>    ==================================================================
>    Clients:    tip[pct imp](CV)      cpu-track[pct imp](CV)
>        1     1.00 [  0.00]( 0.27)     1.01 [  0.81]( 0.62)
>        2     1.00 [  0.00]( 0.22)     1.01 [  1.01]( 0.70)
>        4     1.00 [  0.00]( 0.36)     1.01 [  0.65]( 0.13)
>        8     1.00 [  0.00]( 0.23)     1.01 [  1.15]( 0.41)
>       16     1.00 [  0.00]( 0.17)     1.01 [  1.04]( 0.17)
>       32     1.00 [  0.00]( 0.16)     1.01 [  0.95]( 0.12)
>       64     1.00 [  0.00]( 0.16)     1.01 [  0.64]( 0.21)
>      128     1.00 [  0.00]( 0.04)     1.01 [  0.83]( 0.40)
>      256     1.00 [  0.00]( 0.14)     1.00 [ -0.05]( 0.25)
>      512     1.00 [  0.00]( 0.25)     1.00 [ -0.12]( 0.63)
>     1024     1.00 [  0.00]( 0.31)     1.00 [  0.46]( 0.29)
>     2048     1.00 [  0.00]( 0.41)     1.00 [ -0.20]( 0.49)
> 
> 
>    ==================================================================
>    Test          : stream-10
>    Units         : Normalized Bandwidth, MB/s
>    Interpretation: Higher is better
>    Statistic     : HMean
>    ==================================================================
>    Test:       tip[pct imp](CV)      cpu-track[pct imp](CV)
>     Copy     1.00 [  0.00]( 0.33)     0.98 [ -2.41]( 3.81)
>    Scale     1.00 [  0.00]( 0.63)     0.98 [ -1.64]( 3.10)
>      Add     1.00 [  0.00]( 0.49)     0.98 [ -1.56]( 2.58)
>    Triad     1.00 [  0.00]( 0.46)     0.98 [ -1.87]( 2.66)
> 
> 
>    ==================================================================
>    Test          : stream-100
>    Units         : Normalized Bandwidth, MB/s
>    Interpretation: Higher is better
>    Statistic     : HMean
>    ==================================================================
>    Test:       tip[pct imp](CV)      cpu-track[pct imp](CV)
>     Copy     1.00 [  0.00]( 0.42)     1.00 [ -0.50]( 1.43)
>    Scale     1.00 [  0.00]( 0.53)     0.99 [ -0.53]( 1.52)
>      Add     1.00 [  0.00]( 0.44)     0.99 [ -0.56]( 1.19)
>    Triad     1.00 [  0.00]( 0.44)     0.99 [ -0.54]( 1.23)
> 
> 
>    ==================================================================
>    Test          : netperf
>    Units         : Normalized Througput
>    Interpretation: Higher is better
>    Statistic     : AMean
>    ==================================================================
>    Clients:           tip[pct imp](CV)      cpu-track[pct imp](CV)
>       1-clients     1.00 [  0.00]( 0.03)     1.01 [  0.86]( 0.17)
>       2-clients     1.00 [  0.00]( 0.16)     1.00 [  0.47]( 0.31)
>       4-clients     1.00 [  0.00]( 0.32)     1.00 [  0.46]( 0.27)
>       8-clients     1.00 [  0.00]( 0.45)     1.01 [  0.55]( 0.26)
>      16-clients     1.00 [  0.00]( 0.24)     1.01 [  0.63]( 0.27)
>      32-clients     1.00 [  0.00]( 0.76)     1.01 [  0.76]( 0.69)
>      64-clients     1.00 [  0.00]( 0.73)     1.01 [  0.79]( 0.89)
>     128-clients     1.00 [  0.00]( 0.97)     1.01 [  0.53]( 1.28)
>     256-clients     1.00 [  0.00]( 1.13)     1.01 [  0.64]( 1.21)
>     512-clients     1.00 [  0.00]( 2.23)     1.01 [  0.57]( 1.74)
>     768-clients     1.00 [  0.00](11.06)     1.00 [  0.04](11.12)
>    1024-clients     1.00 [  0.00](11.42)     1.00 [  0.03](10.77)
> 
> 
>    ==================================================================
>    Test          : schbench
>    Units         : Normalized 99th percentile latency in us
>    Interpretation: Lower is better
>    Statistic     : Median
>    ==================================================================
>    #workers:  tip[pct imp](CV)      cpu-track[pct imp](CV)
>       1     1.00 [ -0.00](25.85)     0.76 [ 24.00]( 5.26)
>       2     1.00 [ -0.00](22.30)     1.17 [-16.67]( 4.41)
>       4     1.00 [ -0.00](16.86)     1.10 [-10.00]( 4.58)
>       8     1.00 [ -0.00](16.43)     0.88 [ 12.50](16.90)
>      16     1.00 [ -0.00]( 0.97)     1.03 [ -3.33]( 2.48)
>      32     1.00 [ -0.00]( 2.40)     1.01 [ -1.16]( 2.90)
>      64     1.00 [ -0.00]( 0.40)     1.00 [ -0.00]( 0.81)
>     128     1.00 [ -0.00]( 4.87)     1.01 [ -0.80]( 0.60)
>     256     1.00 [ -0.00]( 0.89)     1.01 [ -0.77]( 1.01)
>     512     1.00 [ -0.00]( 1.41)     1.00 [ -0.00]( 1.64)
>     768     1.00 [ -0.00]( 1.84)     0.98 [  1.65]( 1.62)
>    1024     1.00 [ -0.00](13.59)     0.92 [  7.57]( 4.64)
> 
> 
>    ==================================================================
>    Test          : new-schbench-requests-per-second
>    Units         : Normalized Requests per second
>    Interpretation: Higher is better
>    Statistic     : Median
>    ==================================================================
>    #workers:  tip[pct imp](CV)      cpu-track[pct imp](CV)
>       1     1.00 [  0.00]( 0.00)     1.01 [  0.59]( 0.15)
>       2     1.00 [  0.00]( 0.15)     1.00 [  0.30]( 0.00)
>       4     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.00)
>       8     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.00)
>      16     1.00 [  0.00]( 0.15)     1.00 [ -0.29]( 0.00)
>      32     1.00 [  0.00]( 0.15)     0.99 [ -0.59]( 0.00)
>      64     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.00)
>     128     1.00 [  0.00](14.82)     1.00 [  0.00](17.39)
>     256     1.00 [  0.00]( 0.15)     1.00 [ -0.28]( 0.64)
>     512     1.00 [  0.00]( 1.40)     1.00 [ -0.39]( 1.73)
>     768     1.00 [  0.00]( 1.81)     1.00 [ -0.25]( 1.56)
>    1024     1.00 [  0.00]( 0.17)     1.00 [ -0.32]( 0.76)
> 
> 
>    ==================================================================
>    Test          : new-schbench-wakeup-latency
>    Units         : Normalized 99th percentile latency in us
>    Interpretation: Lower is better
>    Statistic     : Median
>    ==================================================================
>    #workers:  tip[pct imp](CV)      cpu-track[pct imp](CV)
>       1     1.00 [ -0.00](33.20)     1.21 [-21.43](25.04)
>       2     1.00 [ -0.00]( 5.00)     1.00 [ -0.00]( 8.94)
>       4     1.00 [ -0.00]( 5.53)     1.00 [ -0.00]( 5.53)
>       8     1.00 [ -0.00]( 0.00)     1.00 [ -0.00]( 0.00)
>      16     1.00 [ -0.00]( 4.43)     0.92 [  8.33]( 8.13)
>      32     1.00 [ -0.00]( 4.84)     1.00 [ -0.00]( 0.00)
>      64     1.00 [ -0.00]( 0.00)     1.10 [-10.00]( 8.13)
>     128     1.00 [ -0.00]( 8.15)     0.90 [ 10.00](10.68)
>     256     1.00 [ -0.00]( 3.36)     0.95 [  4.91]( 1.68)
>     512     1.00 [ -0.00](36.88)     1.01 [ -0.85](35.08)
>     768     1.00 [ -0.00]( 4.02)     1.00 [ -0.00]( 4.99)
>    1024     1.00 [ -0.00]( 1.61)     1.01 [ -0.78]( 0.87)
> 
> 
>    ==================================================================
>    Test          : new-schbench-request-latency
>    Units         : Normalized 99th percentile latency in us
>    Interpretation: Lower is better
>    Statistic     : Median
>    ==================================================================
>    #workers:  tip[pct imp](CV)      cpu-track[pct imp](CV)
>       1     1.00 [ -0.00]( 0.14)     1.00 [  0.26]( 0.00)
>       2     1.00 [ -0.00]( 0.00)     1.00 [  0.26]( 0.00)
>       4     1.00 [ -0.00]( 0.14)     1.00 [ -0.00]( 0.00)
>       8     1.00 [ -0.00]( 0.00)     1.01 [ -0.53]( 0.00)
>      16     1.00 [ -0.00]( 0.14)     1.01 [ -0.53]( 0.00)
>      32     1.00 [ -0.00]( 0.14)     1.01 [ -0.53]( 0.00)
>      64     1.00 [ -0.00]( 0.00)     1.01 [ -0.79]( 0.14)
>     128     1.00 [ -0.00]( 4.56)     0.99 [  1.48](27.76)
>     256     1.00 [ -0.00]( 0.13)     1.00 [ -0.25]( 0.13)
>     512     1.00 [ -0.00](28.11)     1.00 [ -0.23](25.97)
>     768     1.00 [ -0.00](13.36)     0.99 [  0.60](14.72)
>    1024     1.00 [ -0.00]( 1.46)     1.00 [  0.32]( 6.83)
> 

