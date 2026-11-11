Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400867;
	b=GiSWwX2SdkS+ymdjDMIhgVR6vX84JRWPt8Ipz9Uv8wm406r4pW0SJ2UZqobDvXCGgcg9
	 A5M+FUdgXWVNDHpSdgSQDHNhGdMZfJgETpE67hzvYYTfV6pJmk96q1+fSGR04ziHUcmwi
	 DbUnGWtsxRzY1n5ZG5+bvvkiJaRk3NIR+M+Fv8m+fEgnoTcOQt41QAxThynglD3lLjPOj
	 Tdd/AZkuKApn6LF1iBYzYGmmrI4EwQf/HHEGIjTdhs5yH8HLE2JHLcmDH0WYRcuMl+Nf0
	 Ca9kQanbnom12/no1TrJerXKrLyjq0WQpTFW1hPhDwo7hTC6W8SnioQygNWTWvLaF4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oH38Jafz0ZaNJOgaWYZ1k8w8ZBYMYy4KFfN8ngQnhnQ=;
	b=MVVuPWwp0InPp843oY7fJ88+g2SJJsRwvECo63xAy8xkd/hS/wlXelsTep+8vq1GkZOz
	 d2ovYgsVcTLUDSORt/XsDbOZ47uQ8abuBMZD03oX6vHNHy14mD2ywyhOEmaVJ7qdElQ1c
	 fCFBGzhixUsf1gvk15cxFUmqGUuv78GzIhO/QGzmDYmsI7Xo2UH/s5YeBh8oPvLmcxcE1
	 pQhZE3JOeyTyfhdavVM79Fjf5ijPKEIW0dWKOtO/gFlLr8uq0wBndw4kdOnZDY2AetW2h
	 vqZ7DCd67ZRlnt0QG0mPVtE7lx/Sff9DZoZ2TN5iMY/BhB/8hH4FzaSzKPjp9EfZnWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="J/eBWQFz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKmfPkZL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB25606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AB25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J/eBWQFz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKmfPkZL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYse62286487
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oH38Jafz0ZaNJOgaWYZ1k8w8
	ZBYMYy4KFfN8ngQnhnQ=; b=J/eBWQFzvFkzMIXvLOyiH+n5pKlRYQFLvIr3gmXw
	6BoYv7eiT9pOnEQIWPLp9WUkHUzMI4+MDjSpL74YNhzWS91ICDyF0VAj8AYFtXWs
	KXbXbIhjlilam5m7aEjXiWyvND5I7Tq6OebfGSN+rR65GO8sMv7F0YqMSAm6+SVk
	FED2pl9fMU83eO3/GLB4seQjhNqMLXwIp5wuwa9PaF3tNxfFPJIkmLq+Vbt8Skdi
	sBT7Y0b/Aj9Tgp3Py8XJErGa/LHLHTwYztJAWeWE39/UbP5xp8vt5DdOOW8EISDQ
	0cxOAu8204JiPWGScUgrqFa7wxiScykBrgRxS4TR9zszew==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm96m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:41:06 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so871774c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400865; x=1795005665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oH38Jafz0ZaNJOgaWYZ1k8w8ZBYMYy4KFfN8ngQnhnQ=;
        b=FKmfPkZLwklIt9JKxlrwqYafqu+HfUhLWePMuW9ZIsq0nSX2A8A1xR62J2m9ZRcLO5
         tuQBZB6AG1IV3XSWfd6bAsjSzkH487PdoUvoNnTxlj07MZ+2IT+fZwELeGFjaiemzyRu
         EY0R5vXjrf1+cwrFaIENGHbyLu8Vf+7y0O6M2pNSKgIVACp1mUhtTSzPMXSLEQNSPTkg
         hVzGF7hMcxhulcbm95u1Orc8nZ2E9IkG3iVTy8EdqKDJB30/gHUE8DlPodK74iqG8lBw
         hLR4VZ1+4bYbrBEYPBecRCP2rV84zWxh2I0Whza5U0b0d49dVzTD6Hu3jYcMAtwZ3UbH
         EHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400865; x=1795005665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oH38Jafz0ZaNJOgaWYZ1k8w8ZBYMYy4KFfN8ngQnhnQ=;
        b=2MBYcnaTmN2v6KrT0LKrvwvncTYyb+lzVhni50My9ok41LowISjejC177pTdRXgIRe
         KL6lycvFZlXD6+yaxsP7KxVmy6H56jiGIp9aqopyTy8rKRIJ9ZRpRrX4y9Wl/1GyriYM
         RhtEejz8glTFLpODPX1DHH72n1Lje1ozsZ4c1LP7Wx6Z9sUAULMGRUj4e9tFXW3GWVEm
         VcQah6wSrYJ5KbbpyO1acemJ7NilF+Aya8VuXUYq7YoDYSwemUq6RwaMKepfcUkjy3VZ
         HADs/23fjdz3OYt9F4roOq0sJjEo11x+gEa+qyAjNdB7CK440OUj7V4/qUdaR+3vMeNf
         pJvw==
X-Forwarded-Encrypted: i=1; AL+hErFZGDP8zSG3OeeEJYnNqwNbXfDVN0N7iZ0EhaRdr4MoXzkF3l0wxdgFUSqZv7c+BrN8zgUpGQl5w70M/98=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IBOLSnj7J7I3pcY4NiFWUQNw0lwCzZ7blwaSsN+tDau8CKAnw
	4IQJAVDjpdTFsMJrXj+SZOYPAf2DIaoyQXk+G9Pu3VGFZR+Z+Y4Moj454gG6MplZA8P0pCWTk6r
	HkdrE/BhhoDS9u8YKBUuQXZC6wcf4aQ9+K9j17fRtHDleZOeM+BlwHBSTqR4yyisoiog=
X-Gm-Gg: AYBFou0+hqpb1yMygQXglsEnc0By22aOSFOc/yLVBDYbHlgH8MuLNKiAEIfInLHaQtk
	UjNBbdx5gJr2n7QnUgJmMwxJJcUpHh7DxqykCJ2g3rbTKcEMGP4LojmM+cMO+i20HKbBfb0fKi3
	fHErGmcSEsi6YKSZO8BcUUJFRevsB48yFi+0s23KFRwYEbIqODSh1DqKWudSHyENV7rnXO9HAe0
	KV3P295QRkH92UHPsmtHmeMxmwHyqQGm58s4DcL0lMkPn9TIcB1xpQF5XUDiRaZ8KdkVsY7cE8L
	4ASpTpUkydk3Taf1gdnz6Chqz0oPY9IMwtPYBotXU0eQAhakZayn3q7JcAcgh53uwvqBhXzLxcx
	iAQSZ2sO3hwvd7j0sQGNwIqDdue+6Qss2PMFK4oNAOZ9tcC5Gxe1vjZskNGk3QrNE//ckxoe14H
	yaaaUm/vAirtQ1/v6ibAgtUnuGzU9vRPgt2y5S5j0BddSWizzGUBVEV+tTheg7Wh2U
X-Received: by 2002:a05:701b:42cd:10b0:1b2:de00:9bc2 with SMTP id a92af1059eb24-1b3bef25cb9mr3045479c88.12.1794400865283;
        Wed, 11 Nov 2026 04:41:05 -0800 (PST)
X-Received: by 2002:a05:701b:42cd:10b0:1b2:de00:9bc2 with SMTP id a92af1059eb24-1b3bef25cb9mr3045449c88.12.1794400864710;
        Wed, 11 Nov 2026 04:41:04 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm14309487c88.0.2026.11.11.04.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:41:04 -0800 (PST)
Date: Wed, 11 Nov 2026 18:10:58 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
X-Proofpoint-GUID: G86lOE6eaxpBH3aR--UGXpm-K3Eq4_h-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX/Zaz9yIfcZIg
 4SHAtW2e7ULlCMW703nGHDFon6mfHGxL/HjBU8eK7ETQ7oItnX5hAooQ5S0+LmFmkv20ZAherbz
 UXAkpxyQh0prNNmbL+uBOK8BzfkYHOqvPjrc+o+vTCrmzM30QO9XOeLiNjWYNJj58UzqiXrxjrS
 htg12QoF7eJAE9Druq0XAhq+l3pUwo3AugpJlMQJd9d4UKOncp3Aewu0z+SyoTVrfa8ZF12qzUL
 rlbXDku5S6p/fhBUWLpHEHPfSwRfvptg8wmKIcHvXIegy2g32qIs5PnUpRrxm3ePIJmctpcfHnO
 sAp6+ur99idpQuPPJ1ARTcX9g8sBsW/UXpmWwwO8+o4PSSLPIU0uFefU6+rLzloEkHfVjjsTCCi
 ZL1BxcmaXvGRrJOLN10NH9X5/pzO66dTtsJTjAxb4JoMjBLTnPHu6qly9ILYjh1UgT1FEx8FWPs
 KmzN51hi3328AEW0e1Q==
X-Proofpoint-ORIG-GUID: G86lOE6eaxpBH3aR--UGXpm-K3Eq4_h-
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af46262 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=z0i6psv0inyxDjA-2G0A:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX7a8iyHb8vifG
 8sIk72QqrHYv+qvnHvx1SCtQt2DKjglQJALD1/9sSrJ55Nbn+yzK2zhxFrfAO+l6W1VHnSKyQ9Z
 ySttmolPzeiBNHzY4thR9lEtScdbS/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

Hi Viresh,

On Mon, Nov 02, 2026 at 02:08:39PM +0530, Viresh Kumar wrote:
> Hi,
> 
> On 29-09-26, 17:08, Ananthu C V wrote:
> > Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
> > max boost is known") introduced a guard for cpuinfo max updates to only
> > increase, to preserve driver-set values above the freq table maximum.
> > Later commit db80ad776cd2 ("cpufreq: Remove driver default policy->min/max
> > init") dropped the 'policy->max = max_freq' assignment from
> > cpufreq_frequency_table_cpuinfo, leaving that one-way-guard to be the only
> > path for cpuinfo max and consequently policy max to be updated, causing
> > both values to be stuck at boost frequency even when boost is disabled.
> > 
> > Unconditionally track the highest non-boost frequency (max_base_freq)
> > in the freq table. If boost frequencies are available, use the highest
> > frequency from the table/max_base_freq instead of cpuinfo->max_freq to
> > control boost values, so the value can decrease again when boost is
> > disabled.
> 
> If this is a fix, it should be submitted separately so we can get this merged
> independently.

After thinking more about this, this should be the way to go about it. This
issue is currently harmless because boost values cannot be actually utilized
and hence the value getting stuck in boost is a no-op. But once the fix to
the initial problem is applied, this will become an actual problem that causes
the active frequency to be stuck at boost. So I guess this will need an
independent fix that comes first in the series.

> > Fixes: db80ad776cd2 ("cpufreq: Remove driver default policy->min/max init")
> 
> I am not able to understand the current problem though. I see from the sequence
> of events mentioned in your cover-letter that scaling_max_freq doesn't return
> back, but why ?

cpuinfo.max_freq value is currently updated with a conditional guard, which is:

if (policy->cpuinfo.max_freq < max_freq)

This means the value only goes up, and never comes down.

> And does a simple revert of the above commit (just freq_table.c) fixes it ?

I gave this a try, and the simple answer is yes. The diff would be:

diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index ea994647abc8..5b364d8da4f9 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -49,15 +49,16 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
                        max_freq = freq;
        }

-       policy->cpuinfo.min_freq = min_freq;
+       policy->min = policy->cpuinfo.min_freq = min_freq;
+       policy->max = max_freq;
        /*
         * If the driver has set its own cpuinfo.max_freq above max_freq, leave
         * it as is.
         */
        if (policy->cpuinfo.max_freq < max_freq)
-               policy->cpuinfo.max_freq = max_freq;
+               policy->max = policy->cpuinfo.max_freq = max_freq;

-       if (min_freq == ~0)
+       if (policy->min == ~0)
                return -EINVAL;
        else
                return 0;

I am pretty sure we can maintain the policy->min status quo and only touch the
policy->max updation; which from a passing glance simply seems inconsequential.
Potential side effects, if any, aside, this would at least fix the issue at
hand, which is the frequency getting stuck on a higher value without being able
to come down. What do you think about this?

Best,
Ananthu
