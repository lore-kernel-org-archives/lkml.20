Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822300;
	b=tDeJqSO3ic5giJ3hBEFIfHH2KHS/HKYNE/PVD+SWmCc3sztTadlG6hm10BzZXf5dAjCr
	 aax0uAVBRkB4hQwxhMHU5a4qhz6CXcVjZ8TYuvlOkA+09K3hlY2el40cdb+7yvXhbm3Ql
	 nWaVa3jbyYrue5dIxOfKUJvpdc+BFCI7SL4aE+tJYQDn1Q8FcFAEQn2tEBMx8v2rEcvdd
	 X5KXjGQTegC81xPqonhp0gWlDtzK54srTF3cl/y8PHA5hFl+mBbeqKyoOeb/xC2kR3iDI
	 HZuEwsRdSsPyLEqtOKVJudiHAyY/nJW3cKYmcTNRY4eU3AMdiFdxF+sL7C2FWkLDAVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mFNFQKdbRBq8c1uwhiiA8pFPG9yosXGE3ZW84aM/LeA=;
	b=xsFLx7i39lMI2H7BbXMwAkgM07O3+BP8eLy2Q2SMBkVx/SPDEaScHG9AZNWDmQQjSKwp
	 IBoVTA8DqiaXUxjIQh2e8aljIIF3pl2lWlUWBOhbCOOif7ErmffsGBTjjWLGtV+WqRO2u
	 HQJ87O4SxPLjZttzPOm5eR4Ob/WE17XISbNEY6I+JcbvAAc1TAB6Z44jp9W+atysxNK1y
	 ZIZ6QTunJJQt4HFji8DrrAmCl2bHi0TnO30qKksAe8upbX3QSho7/yXPjPhUuQlfWYT0G
	 jkgYoQzwhIt2Ne/4A66t+6HHaqhln6bMEkSSVA5y1Cy6uUBw5vokZttVhQ6AQWcOx+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=igrwlQI1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYZBONnB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17651606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17651606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=igrwlQI1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYZBONnB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG8To042650594
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFNFQKdbRBq8c1uwhiiA8pFPG9yosXGE3ZW84aM/LeA=; b=igrwlQI16lc+UhOJ
	zfhAIpZIEsO5SzxZgZh6OfTV7jwZw465E5dvQO54kNOqU7l81GsoOMl4KdyBrxGQ
	g7+JiM4ISriNHLkMq0LzaGAmrd8bJyaEsmbzLOAZ5OeZO086vFLKZPYUVwnwGhFV
	jFgJMpadxoS2anFeb0plSiOSxue+TmqksxSFxqOz1v7v03Wb0KR4q6XtkIneMRsU
	N5xOjcEwu8GlmYArCetXaJrHKs4zlabuphPzXCxIMqcq41eU7Z3yDp4OS6H9Q7t3
	sR1AYj5zYyh05MbMMzp7Rgamo2+TMMT3jqI8/MLOllzrFanoHibLnDJ4eq4GL00x
	3PT2Pg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxcf08w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:44:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so3453549b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794822298; x=1795427098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFNFQKdbRBq8c1uwhiiA8pFPG9yosXGE3ZW84aM/LeA=;
        b=GYZBONnBx7vX7T5ja5qO4XiRUVKn1o1hlqFnBdrelkxWdefLbC+3yTDinfPzcaSSkV
         MYwRs1/UbryYl7jZ4pSp+ld5u1KdLq9k9fSRaKfXDiDxmIWQde7hHwmdsq+MxWWyZWb2
         9Qcm5hplZ3VajelRLu1ys4+jCCH/LQ3dv0kSxM2XWjEtSamP0n5A6+MZj1uJAYJq1/Gh
         up2hqECXe2hXsSyZDrhTp5qowycBeH3e45UYXuaiYLcBvtDabifRGdNqQIV38TtIBY8T
         5C49YMPyaYwsjlBx55Zc8w6Ole1CDcSXZrIU/bLYcokshJ5n0WtMI7e6rYTNq/7qSG3D
         I7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822298; x=1795427098;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFNFQKdbRBq8c1uwhiiA8pFPG9yosXGE3ZW84aM/LeA=;
        b=DzzKi2yLMBgGYzdQcJ93OR5n2UBdlPeHhkNyCzaWjSqFsCK98LUFABrAa/vQbOPKjg
         NtREWw0VQsZAFDEbBQjWKCnzhgkNc7pI6SrBvf1Ba6h8kTj0HpEC4rPmX3GAOGN5GUat
         J6qvPs/GX7RqHkzm2/6jbBYFf6cALHYbKSmrTwSTa/8AR1OLYpegG2eH0/dD2OFNtgjY
         1O5+bKRFDvKNNv+wtQ4tSQnTQgL/50vv7fgr59BI898ZRVAtjGGSF//qua0O3MJ9bgXh
         ewht0jCoq3Ajxs4U0GddKv1h25SdTVdfav6Jsps6VskFEy5+TUQBcr5buBS5/7TfjELK
         w6eg==
X-Forwarded-Encrypted: i=1; AL+hErEffdyreHES8Cfalf5fnHCeFeR5fBj9hWA0paKtzP7QuqUersTuQeABH9OFcadeaSa6Dq6mzFolzDYLFc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G6QD0t7bRZs/WjQuGgUih59rPyeb8uSZRNJbA59TLyrGg/3QR
	PT2jlX7hYucU89yY2I3qls18tmq9g/mKcMBXgXTbWLuQDl46EY8akl+Mx0nvos2n2ZYFcexpFjo
	CDi9UX8rviz9VTyhs7yKFe983Y5pWqVbVSkXfCdccGd+ZiKXucHv/pek49OoRQ2yFWko=
X-Gm-Gg: AYBFou2EXCUH3m9KhCGG6saJvu8PDgBQdHjk/SnDcuIRWSVitZl3DPlN7lvJnv58HHZ
	7ZHvf7E9t27GYeF9WwpFtxVP+ueHahbB+BXpnle/oZoEeFFSCv4QbqHo+brtXueR0LDnOVuuha/
	5miaNwGbSO1WAAEKyBvMuobJdz2cMVJdUn1mApZi4ZzdacHfknp017Ut+nyuEphGdHv6WdB+B46
	G9ZWZKq4RL7TlyuVYyam3TPWTentqLNg0pNxdhZm75+IszA3tUzivaKnPQHySPHoCG1jRFSpVr+
	hA9+DhWSvhhxU515CV7Oz4e+sbj2kqsePxAY8LGrb7SVTuNJMju1bs9U9indI0m+u1F8bDQHcDN
	4wJ/YZGuEo4z+LP4RY8epUy/7mFNE/lscXJlzNqOjzy35IE7IKfhBJnSjt4O7H2nl4j/40eHv8t
	9BbBZ/DkpN5mCkNJPeFX5vH/H6z7a13rPe
X-Received: by 2002:a05:6a00:e12:b0:89e:8242:f35f with SMTP id d2e1a72fcca58-8beb56cd357mr9342805b3a.13.1794822297575;
        Mon, 16 Nov 2026 01:44:57 -0800 (PST)
X-Received: by 2002:a05:6a00:e12:b0:89e:8242:f35f with SMTP id d2e1a72fcca58-8beb56cd357mr9342783b3a.13.1794822297003;
        Mon, 16 Nov 2026 01:44:57 -0800 (PST)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm3424078b3a.36.2026.11.16.01.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:44:56 -0800 (PST)
Message-ID: <44ed43c9-a91f-445a-97d0-ebe538888cf5@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:44:51 +0800
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
Subject: Re: [PATCH v2] cpufreq: schedutil: Skip busy-CPU hold when NOHZ is
 inactive
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
        Avi Weiss <thnkslprpt@gmail.com>
Cc: viresh.kumar@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        zhanxusheng1024@gmail.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261108145028.2483131-2-thnkslprpt@gmail.com>
 <CAJZ5v0g-oDagp2GrZyhLmT-BYJqcm-D4s1eTrXCxB-fj5BNixw@mail.gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0g-oDagp2GrZyhLmT-BYJqcm-D4s1eTrXCxB-fj5BNixw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOCBTYWx0ZWRfX61UIIpsGP+GI
 YXJRyvDpC7FoiwqNGUZ4L0vBupkmpYFmLxyGqSB7kaD+Ok1PmGJqVHNTO6jlCYrciERt8VoWn+9
 u69s2wOGaZr3iT+CEx+9yAURNTvM+cW280OJZN9Mhfyb4wXWojhJn0UwbFusMholduk2LNPgVkx
 Y/HMhkKorxoi1nxGrxoM/wo/mSNm7iABHl7istk0RUAtjl4tOKh/S43O+C65Q0fqMwwTGKbhK2o
 BP3XWqnFSo/BztcdMW6IzsrbDZiyVDPg2HQEVaUo/a3DtBoFvSOM+lcbPzeX/tVijNnu3dIo+ul
 TBvdafpNajDggonpmec4YQrSGjlALMq/afVGD/x6DXyXETeVMFgs4Xl0GUoKaGaZLwmZTlSj97t
 wb82QWTSDRcsiKLhYUnvTR6m0NMwPPVCg/j6HZw0SfEjkfo09xUUnCjUkWWd6jegFIgCk35Xxpc
 3EY4UPAKxeloOW45aog==
X-Authority-Analysis: v=2.4 cv=RtZQvymK c=1 sm=1 tr=0 ts=6afad09a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=5gUmkPqmsy7klQfhE9kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOCBTYWx0ZWRfX6iVXKXfxuLK5
 XRqQILAJg1SL9tTPzXC3jreNhWQUPqQtKqDHEEvRf0tMvo18migvatazUzEgb1mX6vxmJR1FQBr
 QsNGLb9lpbQbpT6YXJaWkK+MI7eUDRA=
X-Proofpoint-ORIG-GUID: -dBR6lQFgSgE7dgzxESoXKjVIeXzBWsw
X-Proofpoint-GUID: -dBR6lQFgSgE7dgzxESoXKjVIeXzBWsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160038

On 11/14/2026 2:21 AM, Rafael J. Wysocki (Intel) wrote:
> On Sun, Nov 8, 2026 at 3:50 PM Avi Weiss <thnkslprpt@gmail.com> wrote:
>>
>> sugov_hold_freq() uses the NOHZ idle-call counter to determine whether
>> a CPU has been idle recently. When NOHZ is disabled or fails to
>> activate, the counter does not advance, causing schedutil to treat
>> the CPU as continuously busy and potentially prevent frequency
>> reductions.
>>
>> Skip the busy-CPU hold when tick_nohz_is_active() is false. This
>> also handles systems where NOHZ was enabled but never activated.
>>
>> Fixes: b7eaf1aab9f8 ("cpufreq: schedutil: Avoid reducing frequency of busy CPUs prematurely")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> 
> I'd love to see some feedback on this from the people on the CC.
> 
>> ---
>> v2:
>> - use tick_nohz_is_active() instead of tick_nohz_enabled to also
>>    handle NOHZ enabled but never activated, as suggested by Zhan Xusheng


v2 is small and only affects the NOHZ-inactive case, so I think it is
correct for stable if needed.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


However, the hold can still get stuck in several other cases, described
below, and fixing them needs a different way to detect idle periods.

I would appreciate it if the scheduler maintainers could also take a
look, since part of what I describe below touches scheduler internals
(rq->idle->nivcsw). Please feel free to correct me if there is any
misunderstanding.


As I mentioned on V1:

https://lore.kernel.org/all/78af4d6d-7465-4980-9d8b-e832db76a08e@oss.qualcomm.com/

This still leaves other cases in which the CPU does go idle, but
idle_calls never moves, so sugov_hold_freq() keeps holding the
frequency. In all of them NOHZ is active (except the first one), so the
new tick_nohz_is_active() check does not help.

1. nohz=off (or NOHZ never activated): b7eaf1aab9f8 (v4.12, 2017-03)
      idle_calls is only incremented if can_stop_idle_tick() succeeds,
      and it always fails when NOHZ is not active. This is the case
      current v2 fixes.

2. nohz_full timekeeper CPU: b7eaf1aab9f8 (v4.12, 2017-03)
      Same as above: the timekeeper CPU must keep its tick, so
      can_stop_idle_tick() fails.

3. idle=poll: 2aaf709a518d (v4.17, 2018-03-15)
      The idle=poll path restarts rather than stops the tick, so
      idle_calls is never incremented.

4. CPU latency QoS limit, short idle: 554c8aa8ecad (v4.17, 2018-04-03)
    With a cpuidle governor, idle_calls only moves when the governor asks
    to stop the tick (or it is stopped already).  So:
    - with a QoS limit that allows only POLL (or, with teo, one below
      7.5 us that leaves only shallow states), the tick is always
      retained;
    - idle periods predicted to be shorter than the tick are not counted,
      so the hold is kept across them, and never released if all idle
      periods are that short (e.g. a periodic timer below TICK_NSEC).
      b7eaf1aab9f8 counted them.


A tick-stop counter ties the hold to the tick policy.  Two signals that
do not are rq->idle->nivcsw and rq->clock_idle.

   - rq->idle->nivcsw: the idle task is always TASK_RUNNING, so when it
     is switched out at the end of an idle period, __schedule() accounts
     it in nivcsw. That is once per idle period, whatever the idle 
state,
     the tick state or the QoS request.

   - rq->clock_idle: written when the CPU switches to the idle task, and
     on every rq clock update while rq->curr is the idle task.

nivcsw seems to be the better fit: clock_idle is a PELT-private
timestamp, updated on every rq clock update while the CPU is idle,
including at wakeup.  If, e.g., an interrupt wakes up two tasks on an
idle CPU and the update for the second one is rate limited, clock_idle
changes after the last update in that idle period, so the next update
releases the hold although no new idle period has started.


The patch (RFC, appended below):

diff --git a/include/linux/tick.h b/include/linux/tick.h
index b121c5d53e30..4733344f695a 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -137,7 +137,6 @@ extern void tick_nohz_irq_exit(void);
  extern bool tick_nohz_idle_got_tick(void);
  extern ktime_t tick_nohz_get_next_hrtimer(void);
  extern ktime_t tick_nohz_get_sleep_length(ktime_t *delta_next);
-extern unsigned long tick_nohz_get_idle_calls_cpu(int cpu);
  #else /* !CONFIG_NO_HZ_COMMON */
  #define tick_nohz_enabled (0)
  static inline bool tick_nohz_is_active(void) { return false; }
diff --git a/kernel/sched/cpufreq_schedutil.c 
b/kernel/sched/cpufreq_schedutil.c
index 14405a614991..5285074ee2f1 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -53,9 +53,7 @@ struct sugov_cpu {
  	unsigned long		bw_max;

  	/* The field below is for single-CPU policies only: */
-#ifdef CONFIG_NO_HZ_COMMON
-	unsigned long		saved_idle_calls;
-#endif
+	unsigned long		saved_idle_entries;
  };

  static DEFINE_PER_CPU(struct sugov_cpu, sugov_cpu);
@@ -379,10 +377,11 @@ static unsigned long sugov_iowait_apply(struct 
sugov_cpu *sg_cpu, u64 time,
  	return (sg_cpu->iowait_boost * max_cap) >> SCHED_CAPACITY_SHIFT;
  }

-#ifdef CONFIG_NO_HZ_COMMON
  static bool sugov_hold_freq(struct sugov_cpu *sg_cpu)
  {
-	unsigned long idle_calls;
+	struct rq *rq = cpu_rq(sg_cpu->cpu);
+	unsigned long idle_entries;
+	bool idle;
  	bool ret;

  	/*
@@ -394,22 +393,26 @@ static bool sugov_hold_freq(struct sugov_cpu *sg_cpu)
  		return false;

  	/* if capped by uclamp_max, always update to be in compliance */
-	if (uclamp_rq_is_capped(cpu_rq(sg_cpu->cpu)))
+	if (uclamp_rq_is_capped(rq))
  		return false;

  	/*
-	 * Maintain the frequency if the CPU has not been idle recently, as
-	 * reduction is likely to be premature.
+	 * Maintain the frequency if the CPU has not been idle since the
+	 * previous update, as reduction is likely to be premature.
+	 *
+	 * The idle task is switched out once at the end of every idle period,
+	 * so its nivcsw, plus one while it is running, counts idle periods
+	 * including the current one, regardless of whether or not the tick has
+	 * been stopped.  The caller holds the rq lock, which serializes this
+	 * with the updates of rq->curr and nivcsw.
  	 */
-	idle_calls = tick_nohz_get_idle_calls_cpu(sg_cpu->cpu);
-	ret = idle_calls == sg_cpu->saved_idle_calls;
+	idle = rq->curr == rq->idle;
+	idle_entries = rq->idle->nivcsw + idle;
+	ret = !idle && idle_entries == sg_cpu->saved_idle_entries;

-	sg_cpu->saved_idle_calls = idle_calls;
+	sg_cpu->saved_idle_entries = idle_entries;
  	return ret;
  }
-#else /* !CONFIG_NO_HZ_COMMON: */
-static inline bool sugov_hold_freq(struct sugov_cpu *sg_cpu) { return 
false; }
-#endif /* !CONFIG_NO_HZ_COMMON */

  /*
   * Make sugov_should_update_freq() ignore the rate limit when DL
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c6d86e4da8a9..878aca904f5c 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1329,22 +1329,6 @@ ktime_t tick_nohz_get_sleep_length(ktime_t 
*delta_next)
  	return ktime_sub(next_event, now);
  }

-/**
- * tick_nohz_get_idle_calls_cpu - return the current idle calls counter 
value
- * for a particular CPU.
- * @cpu: target CPU number
- *
- * Called from the schedutil frequency scaling governor in scheduler 
context.
- *
- * Return: the current idle calls counter value for @cpu
- */
-unsigned long tick_nohz_get_idle_calls_cpu(int cpu)
-{
-	struct tick_sched *ts = tick_get_tick_sched(cpu);
-
-	return ts->idle_calls;
-}
-
  static void tick_nohz_dyntick_stop(struct tick_sched *ts, ktime_t now)
  {
  	tick_nohz_forward_last_tick(ts, now);



Two other behaviour changes, besides short idle:

- CONFIG_HZ_PERIODIC kernels: the hold was compiled out there (no
   NOHZ counter).
- idle injection (play_idle_precise(), drivers/powercap/idle_inject.c):
   it runs in an RT kthread, not the idle task, so injected idle no
   longer releases the hold.

I have been testing this in QEMU with fake cpufreq and cpuidle
drivers as no real hardware with per-CPU cpufreq policies yet.

>>
>>   kernel/sched/cpufreq_schedutil.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
>> index 14405a614991..50249cc1a594 100644
>> --- a/kernel/sched/cpufreq_schedutil.c
>> +++ b/kernel/sched/cpufreq_schedutil.c
>> @@ -397,6 +397,9 @@ static bool sugov_hold_freq(struct sugov_cpu *sg_cpu)
>>          if (uclamp_rq_is_capped(cpu_rq(sg_cpu->cpu)))
>>                  return false;
>>
>> +       if (!tick_nohz_is_active())
>> +               return false;
>> +
>>          /*
>>           * Maintain the frequency if the CPU has not been idle recently, as
>>           * reduction is likely to be premature.
>>
>> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
>> --
>> 2.43.0
>>


-- 
Thx and BRs,
Zhongqiu Han
