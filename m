Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399046;
	b=nOXAI0OBp8b5uDhhVZDhJM2WaNIa6bUCZTrzyhl65CvZ6Y32DAFBKxDIgdlOYC4EpTEg
	 nNX7/7OhGaOldPS/ctzVAkrRv1KyA/bBVCuAf0eyPLa16ha8wzMhCLMGGQ5ogBZVBRj8I
	 HebfOO01oi6nYhsKb5a0nEFHdxbPvf1fRGEa1POSUbNzQF89LVwpyD6V5rxuhzSd+Tez6
	 KGJsUL0c4Nufxt99woa6DlxdRlfimGJ2wtI3nJwKwIKsFg0e6pHYmae8xbnzxkOZ+DiFz
	 6USOm260N2lKgCmvO3Zkd1lPlBKQKcoWPWb+/KNFT96nmcLHfoeMNwWdBtE4SGvlycg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b++LVQW3MxBAHYI6B2X9YDdw0p9UtYRJwhL9UHx9t38=;
	b=fI0RP65AJ3Iaq8FMZkYOEPPvEyVjfOdKnlsK5GRti4FYx5q9V9UwBttmb04XIIyuYi9v
	 CjeY87rwAjjCMqoTobpuFY+NN64A9ogoC/c38HdqsOl6qHwibijv6oz2Pmcxkk5KyqwKj
	 ENcfahQU0+tsS75NcFAb1e5t93JVc6Eyfxo7msXphiMO7zqVyy+P+HoHylQrVHEufOh9s
	 lFe7yxaUJ3FLxhYAh0kwzk5ky3sytiQzbB0Q/i9yWOJvsUXQ6Mry3KCrlaQ76VhBpSb0B
	 cODld1b2NXtg3VoV2T7XP5VMM+VwVNgUJ5m6L3mmlSIeqQJqLzI6BVZW2wgDYK2n/DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kY/cULp7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aEcrlyQK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB75606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB75606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kY/cULp7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aEcrlyQK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAeWj01053272
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b++LVQW3MxBAHYI6B2X9YDdw0p9UtYRJwhL9UHx9t38=; b=kY/cULp7Ee4wJ+TP
	JvPyLbLdGBGR7z4fhkLBMdUI6xUfB+yp26GOgbc8GgU3Qg/ZlHSyfmJ+3dyLXzlQ
	SrvUIZ3D5jthnV7s02nDyusNyZEp0CPzPrhNrtmVyBZYw06uS/Lh0QpvQ0VQLVXG
	ktLoAWAmEpVdhzLV+foODwbdNU6jtYBvpTvlhR88UQHVl1VIWoa5Xo9Xu+jnKgOV
	/FrPQJMYbtrv0apfr7X3uHjE361P7g1PomuBuJ7i+CaKjlxSAGYrauq/zi/p+0pn
	YhaNpEz/nVdXxiofnXAB0+eR/vlLlPjFEXQSMNyP3US8dAK75r6WLKLi2f/z/l7e
	6y7ZPw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh2h3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:10:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso2328994a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794399043; x=1795003843; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b++LVQW3MxBAHYI6B2X9YDdw0p9UtYRJwhL9UHx9t38=;
        b=aEcrlyQKaxStoYY72tAmcsHtBMr7l7xFZ7RporthV2rJ/UgXyZa1dMmJpc9uchkWhy
         12CWGlauE+Yhve/UZso9P2BXyX8/FaDhzd80NOhwUh1EMRb26Ei3uinqAHhriYYB5NuU
         C05oB8zDmlwrBlLFBc6SGbu0Zheq4gXBIiRuLjqmrevt0HhU/0NK7ECSWg+ye1qLtMXe
         Ox3V5YOcQnKWlxW2mnarNzHICeEZYxsACUVcMTqN6EKnccQdzGSw0QXoKEuFpzXL+Ljo
         KBGE68R4EQWJwzGetiREkfCQiY7l3owcsRtEJZrU5i0uEzBP8BgUty85XZvXwDWc7MA5
         YMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399043; x=1795003843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b++LVQW3MxBAHYI6B2X9YDdw0p9UtYRJwhL9UHx9t38=;
        b=Ilv+ilgPKAlM+aLg1nvhBDW9fnuPPTVUNDtZqNwqG1828ndOfcZ9tZajL3cbCu0wz5
         7fCvoZJvOHoV/pydaCNFGwrWbubuaRbFx0ufI8ZBT/V8VWn6z07he7DJffs5lj0bAVBD
         p65MxG1IHfc6uZpT0KMYupC02R09Nl9KkbtOE3CZ1dN+LaZynRMAmXCmOsaDmaH8CLyT
         bCMoc3aR7jDjx3ieiaHkLZCW6Ys1h+pPaPkK0aAFdEeQ1/cHe1CztL12mZhuOjfwqnHF
         5RhjDjhO/7nqd/v3F4rrMt9mO5zWnFwI3ld4piepe/EvpOe5x5+jkZVaIB6bpWGhnfYh
         JelQ==
X-Forwarded-Encrypted: i=1; AL+hErFR428ZHrvFmjf4LPLFZmva2DBSbgJ9fl1thFTcXLFDHyhYE/ttDaXJMG+86DN+GhfuTci+lXzcn0HIZY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DxHHBfsjjeKvCd6kKxzKZfKix/662HrfgR66lcuj6sgz5nBLc
	elW1DIMPb0Hy5FM3mCSVi1w7JdY1bDGrKBttXAwa8HuEp1r7mrimnbuoH6YIak/8Gk2bY5WwoLA
	xAaoZhBAP6+hE/nkMzKLJBaSxKgMK4L+5Y769Is3Chzye2bryt+m2IZ2CMYkztXyhPK44hiE2Gc
	k=
X-Gm-Gg: AYBFou0t8eWLQ3R1/eDBUzXq3nOzGtDJjBjPZWOYNpUYDE3V7CvSzitNpq7sySZTfIK
	pAVIfJ4lb7bp++khNxXRq0EKbRMnT7pYj/aVc2FtlAdFOku4gb+G0jvVsxFVwrbT9EWkzdn6wyR
	7m+UmHQPu/i+6hOsvz2HjEDUmb6+l0XJzymfjnS4Fhge7ZwNcmVYt0uuUJhTzfNJGrOKXXW5kW0
	1dJmQSui4xpBo6+kZo4PKdLIBzqRjv5fYdTE51CCACPWGRIq+kZlTVb8tBXme6xEb8+/Fzc9/f1
	POriDZVfc78db4+5La39Fbzz0jZFVIptK8UlOSme9ExmKj1Kb6BY+QtTyrOvviHJEgkrmgwZ24q
	9b+K9UTs8kuLjuGN9RgSpotSOWJ7ggNrWEqT1XKGOQAvrsNW5gHzcCWlkyYrDolcJrjKPDuZrlI
	ucSxVRSFAOWU6VkmD28tLjZJRNlhyBNiFm81FE/jLvSdu8syDA4aNhNHvkl1YyiVY=
X-Received: by 2002:a17:90b:2f07:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b182f26e50mr2286513a91.28.1794399042917;
        Wed, 11 Nov 2026 04:10:42 -0800 (PST)
X-Received: by 2002:a17:90b:2f07:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b182f26e50mr2286473a91.28.1794399042327;
        Wed, 11 Nov 2026 04:10:42 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0df70asm4460130a91.9.2026.11.11.04.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:10:41 -0800 (PST)
Date: Wed, 11 Nov 2026 17:40:35 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 1/2] arch_topology: seed capacity_freq_ref with
 highest available frequency
Message-ID: <avRbO42GNlfMAbZ6@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
 <fbd7fe35-5e14-4589-a072-909e49a92e76@oss.qualcomm.com>
 <cfb79ffe-41b7-4e58-b3f5-fc9a28a4e413@arm.com>
 <77749e58-84d6-43c1-bd37-98d0046231a1@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77749e58-84d6-43c1-bd37-98d0046231a1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfX3wdPYbtYFLTt
 6mDwjAxCu5M94qoFY2lJXG5kD2iYAfaOcupFm9le71kvyqtzU9xgAPfcBNizsyLJiUYrnXdBFQG
 Fwt0wN0VSgnTlZhZtyCsDuINpoNVlIg=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af45b44 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=BJpuNRGIkIodYMgpjU0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: jP2r3ww5VjrJ6tWuld2F26BrkGt_gx3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfX0ewehryedL5/
 tuw7w4vFm4AVg4xOAncTmy1mTMjp/8ju4zWljjIsL0qi2JcmhWuD9eYwtuXX0e2V9PSiIZHUHk8
 0ewFo6eMjjUDm+rCPzAAnzwp54qtQHLDoqSQYcxLsOI2OA2SmhwIdqky4L7WDLDmE2Y0HWTSvX4
 lOAfi6S4oul/IqyDI/W+K2eML2ID/p3/L9PIoylR0b6TqKzfAdz4zk7kb/8n+heAgcZ8cWEMv6U
 MdCQFC99wzWITJZUgBakfyKaV8u5aTKHdDGIBpJB78b6e6E6Bwf0/C4t5cp5ptaTLpnLrd7+WHI
 xByxFclJWJQ7p2svm5vsT30w7hGHdkW2ilhcy/5kJjuY3WgYGaet25JaV/2cLuMDkuryd3nPTxJ
 M2Y11sdaCFZLAAmeWsh9V+/wjEfkqiBrDhIvhBeEqKz2qVV4iJtkvsLfTdI25OggqbFQefT9wtF
 XcFSDwrQGTKNJuGz7Gw==
X-Proofpoint-ORIG-GUID: jP2r3ww5VjrJ6tWuld2F26BrkGt_gx3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110048

Hi Zhongiu and Dietmar,

On Tue, Oct 13, 2026 at 07:28:31PM +0800, Zhongqiu Han wrote:
> On 10/13/2026 2:45 AM, Dietmar Eggemann wrote:
> > On 11.10.26 16:16, Zhongqiu Han wrote:
> > > On 9/29/2026 7:38 PM, Ananthu C V wrote:
> > 
> > [...]
> > 
> > > Besides, could you comment patch v2 Dietmar's comments? It seems that
> > > patch 1/2 exposes a pre-existing ordering issue. On DT systems,
> > > cpu_scale is normalized only from the CPUFREQ_CREATE_POLICY notification
> > > of the last policy, so the cpufreq pressure of every other policy is
> > > computed in cpufreq_init_policy() from the raw, not yet normalized,
> > > capacity, and stays cached until the next cpufreq_set_policy() for that
> > > policy. So far this was harmless because capacity_freq_ref == policy-
> > > > max at boot, so the pressure was 0 regardless of the capacity. With
> > > 1/2, capacity_freq_ref covers the boost frequencies while boost is
> > > disabled at boot, so policy->max < capacity_freq_ref becomes the common
> > > case and the stale value becomes visible (102 vs 79 on Juno R0, as
> > > reported by Dietmar). Perhaps the limits of all policies could be
> > > refreshed once from parsing_done_workfn(), after the capacities have
> > > been normalized?
> > > 
> > > --- a/drivers/base/arch_topology.c
> > > +++ b/drivers/base/arch_topology.c
> > > @@ -454,9 +454,27 @@ core_initcall(register_cpufreq_notifier);
> > > 
> > >   static void parsing_done_workfn(struct work_struct *work)
> > >   {
> > > +    int cpu;
> > > +
> > >       cpufreq_unregister_notifier(&init_cpu_capacity_notifier,
> > >                        CPUFREQ_POLICY_NOTIFIER);
> > >       free_cpumask_var(cpus_to_visit);
> > > +
> > > +    /*
> > > +     * The cpufreq pressure of all policies but the last one has been
> > > +     * computed before topology_normalize_cpu_scale(), so refresh it now
> > > +     * that cpu_scale is final.
> > > +     */
> > > +    for_each_possible_cpu(cpu) {
> > > +        struct cpufreq_policy *policy __free(put_cpufreq_policy) =
> > > +            cpufreq_cpu_get(cpu);
> > > +
> > > +        if (!policy || cpu != policy->cpu)
> > > +            continue;
> > > +
> > > +        guard(cpufreq_policy_write)(policy);
> > > +        refresh_frequency_limits(policy);
> > > +    }
> > Yes, IMHO, something like this is needed.
> 
> Thanks for the test verification and the discussion.

Thanks to both of you for the discussion and suggestions. I am noticing similar
pressure update related patterns on glymur as well, so the discovery is very
valid, thanks for that. I will take in your suggestions and include patches to
fix the pressure scenario in the next revision.

> --
> Thx and BRs,
> Zhongqiu Han

Best,
Ananthu
