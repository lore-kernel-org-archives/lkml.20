Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751556;
	b=jCzUhpIkL3J1tr/MPJPf/POiYLfWetpmU+oAJH1IvXoOhG+cm1eI8g6e6g82SjI/CeKo
	 3CD79QLhzXA/AMgsth3zocq1PIoqxZxfVrX5ezoNpHGAOUVpO1LtGKOHqJi+IKFbbNGul
	 QNU+0a12g2tP3y/F8TOCicVyb7z+N+qU9wDSY7nltb6aSlNcsR/IpnipM7SPRMX9MRhTJ
	 ieIM+DgGddGOfoMdnxo3gKY0XpI985jovr4lMt9Yoguge9+QngISvmyZbPqv9QsF35IJz
	 0Unw/mgW9oCX5ZuX5I1/Wh5sWJbc+MWUyvwez1V3i8dpAoEy8FOTN3DnvWspogJ3Qcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HMuaYCpA/e+dlFcm3ZWdKsQuoNOCcM75wMFXYmlLNfM=;
	b=3YJU62Q+KV9tsnrOsCR5+HFpQ7qDrj9o9WtjCrRiQ0paKoLUg33EJvWtIF6jl0E3hSbo
	 PcaNlUCs5r2GTx0jbuOEaBnQVFDIbUnbPgRzkpsT6XUoho+royQOBW5BXJnepfOSvdGFB
	 SSC55MNv20Wmh6uf3ZTCdlLJHL+kALyMGTfYH3Gb7p3T34C+a5ly+l8+yGm7OyLkeWita
	 8zjUzBzhLOISSuz5wTvLME81jAVMWbYrIzeDnxhj+T/SCFUPcXODDPbtA7sZV7A2TKGEB
	 Jjqf5PD1mCqJuj2PehjRvaSrS29FIgc5TnEz+cUp7NmLARovn0Uci2i8zqQwrFtPcxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bQl6oOUU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E1k15MKR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F3B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F3B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bQl6oOUU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E1k15MKR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAQrq1597889
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMuaYCpA/e+dlFcm3ZWdKsQuoNOCcM75wMFXYmlLNfM=; b=bQl6oOUUq/Z9hFq4
	aVYDZ2BtjLebKbnQDqakFGMqx8g6/L1nU0tUqVxFhw3SVKt1rPOf22cGR3wAk+kE
	usvWc++X5lqMTETZEHz70TiuXAZLUYrberzPj3FgeoJKT8oO5bri/fiGUXasZyt4
	7cySdvIA0eAMgvaGMJwOEYSjfCz8Xq827KBVWMCif6CfE6G5RIqmeGquTI+WItBn
	3+NqNPwPEiqgi8+ySp5f9LMSL3SeWn5spDRm3BvGGoo1/irmnslzJ7gB6vM2ZA2U
	iDT58qirKAfQZhxFlY7Q1KKgBZ/f8PEEbXZwNE2yZKZ+PljziE9Vd18J223JjL6e
	EHyBXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms37hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:32:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so1121329b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751554; x=1793356354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMuaYCpA/e+dlFcm3ZWdKsQuoNOCcM75wMFXYmlLNfM=;
        b=E1k15MKRtTgFVLQF/VI1AY3qY7BCkcWFjeAPpeN5GDLYKVzAxpFZNDPcgI4/Y9ZIbO
         RuustjAAPB+1C6BhuI9L04hK0tyqWRZsc5Q7MbELJjK0VwisNiqmqgmB/IAU1Lhat3AN
         rgtboMBWvmN+GmTl1VFROPvIW16JsLlD0OMFDQoScRw7wJfhqwZv/aHRFDt300MTZFvW
         l/BNSwndljquMr/PtG/PN3oOqLRiKznAvoGaHEEULU+ubWHIPNiXb8M5Y0S8z8mrkfc2
         NHQ4GiXaW5p7oCTAm8aNGJRPAgmuUlf1Ice1tiime8RYw1/9gnphU3s2t4mqeK3W2hrV
         ucKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751554; x=1793356354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMuaYCpA/e+dlFcm3ZWdKsQuoNOCcM75wMFXYmlLNfM=;
        b=An6rHxpuOYcbXVTfioNS4SQQXfmts9/WIYLnwvgg+bb/mCDp01bsbYe46eiIiVLgWr
         4SpmtU+ziLvcVodGBHHgcHNjoGEb/0+6R80TOcJl19KjjBm55mjHZK92ApEx5MAYcKdA
         m6c67zUU6Mp10SKxZe/H+fBt7/yXxRJl81wL+J+kyCZpaQuIzmBtopBal4dGMQlckdYv
         myoebqvaAlNPCG80bYUowBrWxgqToP9x5Qm1aujBmET9l3y//NRyv+/4C8SkWcF7Zhmn
         beYXerrWCT+TePZscIXAnX2t3Cadkexk41gcrvGpoCbkCSX+bQsXgQ30dv+D3s+9xyRs
         4zUw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ4+VVnqlNiTl7mZ+V17uqRbVeVjhnd6mhEJSUvywT8kTllm9WkEEPuT8ZTje8/FUeCd1xHLUQPVtYl2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRF54sF8JPG16v3W28NbXpjnIXhn7uvJC+OILEP8Nq9yYlOUIy
	+DB8tRUQaEoOBZVhNSOzIbGAjiQkqiGk2zfc9pOoRiFZpNIEAuLvbfIFn2QBBv4oCik90wK5wTJ
	BAchQY2ndddpXaOXlODBuGMSrwB/gQcSm6hp7l2b+CvK/jUgqxFPWCPwmHBY0BgOln+0=
X-Gm-Gg: AYBFou1J/2nw5UckCKLtUfB1PFRLdeuYAMMzi8eLUdEziiYLbznZVlQbzpXQU0Gd5y3
	jHshsx9e92MwX+wmrTcHI3yxxY8QAwkJdIncgafi0MjLdLocbyOv3tY2WK0nDwehQU/E+RPikwH
	+CjLt3P31EhaweDx2084c7aQQmYZDnfdGt/bQwAlQNLWfTf5NnUAKyMP1k30NJV5lIrfJdS33mP
	jd9icXTVPlMWNnjBHKss55CST+R9IMLvkcVnr9eW8Q3PDVxgKgNjYlvT4sS5qQeqWdPr3YX/nEk
	rVjex0vq36L/uzDRMpPrZlFLzJIrgF8MuxQn3I3YlDfOEb7dxRSnwdQz4OZH5k28msVMFxF7A9b
	oLxwFxU8ke9tS28QKd7GKQTK/jVgrkrxh8zTuFeKQOQIe1wpJ3+qvfY/rmeUUWEHvh2lEEzE=
X-Received: by 2002:a05:6a00:17a7:b0:857:7337:5db7 with SMTP id d2e1a72fcca58-8a2c6501cd9mr1651651b3a.21.1792751554150;
        Fri, 23 Oct 2026 03:32:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a7:b0:857:7337:5db7 with SMTP id d2e1a72fcca58-8a2c6501cd9mr1651615b3a.21.1792751553661;
        Fri, 23 Oct 2026 03:32:33 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c8ffc99bsm579150b3a.43.2026.10.23.03.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:32:32 -0700 (PDT)
Message-ID: <6c17505f-e5a1-4505-a6b4-08b0c88a6dfb@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:32:26 +0800
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
Subject: Re: [RESEND RFC] sched_ext: Support RT task within sched_ext
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
        Changwoo Min <changwoo@igalia.com>,
        Cheng-Yang Chou
 <yphbchou0911@gmail.com>,
        Emil Tsalapatis <etsal@meta.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>, sched-ext@lists.linux.dev,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, abhijeet.dharmapurikar@oss.qualcomm.com,
        rohan.tabish@oss.qualcomm.com, guo.chen@oss.qualcomm.com,
        haojun.zhang@oss.qualcomm.com
References: <6b295276-4f42-4f46-b5a2-50c3ac83b412@oss.qualcomm.com>
 <atEBWwXSt4D8befY@slm.duckdns.org>
Content-Language: en-US
From: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
In-Reply-To: <atEBWwXSt4D8befY@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX+KfEDpFvj3xD
 NbjZ956MP/XLG1VPqpVWTs7nSQR3Y7TOx/IoAA+XxXg1ye1zH6njUa3MP/9/Nr/0wzqYmU66HB7
 kbvOKHUwlGaex7Ut3ZL5iYZ9YaQxX8Rwng89iu1o5LvcdenspPI2kGIm1w7+bZo1J1kNmkoOSyS
 tGzbBrLQ2sjKJC9ap9AIZzwBOw2N/nHXpmYtQFLhm+kl4eoHy84nzDh2WDLHY2bZl/sn9IdOntX
 voIkhOb3d7Z0vwu8OSYStYz1uaX0GfPfRKASqTcpRi2p+dT4AgRa5aGaPx99JY79OwCq8aHRnna
 2+Wnh0WMh6wuJWpxNNdE0bOgBN/U63RrLi4xB+l2BArzoZcIHahWXy1GTC6ULwepqol1ovXCWYM
 zEe9whcE3v084Xa3vI2Ed/UAlcEauxRnkyJcqlupYl69tAirnN3KyGPrFhi4aQl0iq74k7jBbe4
 zSpju9SPRNRCituCMMw==
X-Proofpoint-GUID: bnYJoZbGm6O_ULk5j4RgvY6u8DbYbnEd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfXzcNooRJD3JhA
 gALdCYDUk1xTPgqtwaYog0yCSi7s7Id0T9yWn5x9BHao1pftCR/zBvFjQxMXNq2vK53X8mpIKDO
 fC4rkjsc9G0kKca9XELtIBBUNeDITp4=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb37c2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gj-EQvdIbOrD_K2NeO4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: bnYJoZbGm6O_ULk5j4RgvY6u8DbYbnEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230040


On 10/16/2026 12:37 AM, Tejun Heo wrote:
> Hello, Tengfei.
>
> On Thu, Oct 15, 2026 at 08:47:12PM +0800, Tengfei Fan wrote:
>> Possible options
>> ----------------
>>
>> One option is to let sched_ext schedule some explicitly selected RT
>> threads together with SCX tasks.
>>
>> This could let one scheduler choose CPUs for both selected RT
>> threads and SCX tasks.
>>
>> For example, if other cpu is idle, or running a low priority scx task,
>> or running a low load scx task, an RT task could use that CPU instead
>> of a CPU running an important high load SCX task. This could reduce CPU
>> contention for the frame important KPI and help balance RT and SCX tasks
>> across CPUs.
>>
>> Such placement should remain a preference rather than a fixed
>> rule. It must respect the RT task's priority, timing needs, and
>> allowed CPU mask. The other CPU must also have enough capacity.
>>
>> It could also allow RT and SCX tasks to use the same utilization
>> model. We would like to study whether this can make the load
>> signal more stable and reduce late CPU frequency changes.
>>
>> Another option is to keep all RT tasks in the native RT
>> class, but provide enough information for the two schedulers
>> to better coordinate CPU placement. However, this would also require
>> placement and load synchronization between the RT scheduling class
>> and the sched_ext class.
>>
>> After the LPC discussion, we'd like to explore option 1 and use
>> BPF-only hooks to achieve current needed RT tasks within scx class.
>>
>> One option is to have all RT tasks with a priority lower than the SCX
>>   helper thread go into sched_ext.
>>
>> Migration thread, sched-ext enable/disable threads and IRQ threads need
>> to remain outside sched_ext. With this option, we will need to verify
>> more common scenarios. We can explore the first option first.
> Isn't an obvious option to just make them non-RT? The load tracking aside,
> the fundamental problem seems like you don't want these threads to be always
> prioritized over some of the OTHER class tasks, which definitionally means
> that they shouldn't be RT, no?
>
> Thanks.

We still want these selected RT application threads to retain their RT 
behavior. For example, if an important SCX task is running on one CPU 
while another suitable CPU is running a less important SCX task, we 
would prefer the selected RT task to preempt the less important SCX 
task. However, this is only a placement preference. If there is no 
better CPU available, the selected RT task should still be able to 
preempt an important SCX task.

Following Andrea's suggestion, we will first explore preserving the 
requested RT policy/priority as metadata, making these selected 
application threads non-RT, and handling them within sched_ext using 
this metadata for scheduling decisions. We will evaluate whether this 
can provide the behavior we need while keeping threads that require 
native RT behavior in the RT class.
>
