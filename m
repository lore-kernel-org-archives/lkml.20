Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D30043499F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986867; cv=none; b=Ji1C9YzK3dWMGL7T9MujCkAvGJzVTHBFoD5zuu9dZ1hjICTDxugoB27OADuNRIx8JmwCT7cwDLE49+drEhQwjcxPoqXGRw3Bdi/2uh7zp0ukEBC4Nb0ZO+uRKFllohWgqMav/vgwur5IVf5yKot3/H8XIVM3HNZOCJhHhBvTwOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986867; c=relaxed/simple;
	bh=6ZJ3HBAnVi+bv1R4+LyR1jyVZOUmRtIha+fA6X4PIG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MojJxVnlFCSHSrQR9hSyIPAKJYJgjeEKRgbzRqQnjcwgomjPcLovYiygBEL7mO80u+K8SZJwWQ2hlVtjWQqLCXSKIrcZyYyAADRHbwjTxTMcvI3V3rIAdUR0n0n/VxHAixvEyM0B6+7+oXuzrzHhEiBdLEdwY08suhhfII/mrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nu1c+OU3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6ynYNvz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nu1c+OU3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6ynYNvz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79r3p1624318
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mt2TVAdkOz3CF4PuiPRZmQqH4poHoWLAlrUjVkVCVjQ=; b=nu1c+OU3hIqzGgFj
	jVf5TTMFH4V2cSCPP8rAK0s1cdFt507jvo/V59KgggbOp/B4jcrDZNsiw0/ACb1w
	CnFU9vI8ZKyYGrxvNwVdspi8Gffc+L17Mb76eV7WNAxSUQUEMgDu7eq4fuvpigQR
	TobJg08iAUqEU96LvQGlUq8i27dm4JRT3oVX8PnGwcVyXDTigZvU2aadSWbZLJzF
	GbkTZ5WfD/+pm7dHlLZgU91xGahBn1LE6USIcnhPQA2KrizKK/zvSj0DuYA24C3d
	JuAGPRHCu0aptBRhZYPhG8YyeQ6X3Mxlnt6iLsd5MI8DhR9uXXv7IYArkoDQUHJR
	HZEOHQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wswfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:34:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so5575792a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789986864; x=1790591664; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mt2TVAdkOz3CF4PuiPRZmQqH4poHoWLAlrUjVkVCVjQ=;
        b=h6ynYNvzBd+5qxhtxu0VG9ZYKVfu3ruDXHe4npt/YYiO+tDol+qRXDUUxFoCbxh0yp
         RqwbPSaW3MOzzYqJ0mCm7sPRXLDFreIbJ3SoBjaE3YKutCK4N8RsIuF3LhwhPSeCQpQz
         l733NGEK/ywXwmb1eCpKdbKuOXjiF5rJqjv63G68v1qjjAiOnMwwFbr+Fi9DE9uG4ZRF
         CRXBAVj28GFKvZCzF39lgpWiGA0wD9vUn6CmxhGbPwu2H0Mz9MjgCeC1DnurnmDUBCMh
         ZQ/Y6M7u3uqKgIGjtQQ3PnkGvIALPImaSn8k5SUjMCzG0wqP8ewjH6MIsWwi2F9el8yI
         pTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986864; x=1790591664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mt2TVAdkOz3CF4PuiPRZmQqH4poHoWLAlrUjVkVCVjQ=;
        b=v/0Ro/UCC4a3Z9m0LnuJQlaQtv959i9rkBx793jTMzsHGCxQJdwlU7rqty/WSZSWmu
         ZYo9Epo6UAI4uRWPoNzNI+r4Wz9w1i+/mJd3nGX3WjPDMa0kjrIbZetLl/EguuDUkRvf
         rjSEIBvIP5dZv/B3Vp0oA7vStDtcBvuZtdQ8A1DUFArIjn6su0dITBBOBAbP5aE0yMc9
         g01Fqy2N6jXT/dAOyo985OJF3brkvA/I6rmRNkgKl7kliVTTMDgp3SVIXNkd+c8fTsrU
         RyRIwUqcKxJbkVBJUA8W8QF1O6gTd1FqhJ3LgDRBbGsXuE1EChZ5yg6OGqRlI0k+oBVi
         B4HQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/bmUtTtGvdgzeLXH+6fHs6cf5zFTSMSCt38VySHqx1+0NCbXFmPD9PSTFSKJZzfupL5X/qxX5tMr1Eb0=@vger.kernel.org
X-Gm-Message-State: AFuF++mjngBgl6IBIbj9tqYvzCWj3Shs73fSIPdOHctsb0jjl26nvgip
	MK27C69DTIzNrPgm5k87vZOR2fIwEUlVUws34kwmIattu4hX7lKLyanNzu1xAs8Se7Mmu/nUIYr
	OiFRQ1Tb1ZIGiOk8kSs8xKKgDz3Ay/9GX5uABj9VFiGlvnyvvrO3nVC2RvSFVdtna5GE0nTswBH
	Q=
X-Gm-Gg: AYBFou2T5xhRrhvhw7R4qb8RkiWAdNF1NBPhXPtP5BnQkw058cGQKa0n+vBttPPmYP0
	Yqk01ekFcwrxidXNvEjQcwilJ6dQoyRjQ2IgmD4bw4FSCi3tBFfsN9ng1WqoJloJrBcRx5eUdJf
	aGHr6yIDWzstkdm1ILAVEpWk1zb3+M0UPa4ckaF2pRraloC3ZLL4Xn6YSKx3z+bhruN51CPovnX
	A77xih3M6BABL44ajOZiKxtoOCMTXoBIfvhsJqwBaT734XugV20dEUssheCbypuTUHiDX2pLr4e
	/WPiUJvodYLv6YfvzpuRy2xdr+0AIBghhFN3YQv8Mx0zYLgVpg9baYomLho46SO8QMhHEVCxOkm
	/N2e3WZBI02nn6cFK319hcckBcQzYNu91FNO5seRiZfRRkTfFVSSl7j9694s/q49wRXBKQhLYn7
	jzsbmRtdSmtiS14b8=
X-Received: by 2002:a17:90b:3909:b0:39e:1f16:6167 with SMTP id 98e67ed59e1d1-39e54aa348bmr15999923a91.3.1789986863576;
        Mon, 21 Sep 2026 03:34:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3909:b0:39e:1f16:6167 with SMTP id 98e67ed59e1d1-39e54aa348bmr15999870a91.3.1789986863056;
        Mon, 21 Sep 2026 03:34:23 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm33596738c88.15.2026.09.21.03.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:34:22 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:04:16 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] cpufreq: fix schedutil not returning to non-boost
 freq when boost is disabled
Message-ID: <arEIKD11YRH6YoHz@hu-anancv-blr.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-2-25312a713699@oss.qualcomm.com>
 <05c00750-7fc2-49d4-9336-7beb33fd9380@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05c00750-7fc2-49d4-9336-7beb33fd9380@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1MyBTYWx0ZWRfXxnpgR4RB/BHZ
 wBdSm8Q0p+FSwCnejWiuCGF9jOx/WS24hAFcxsl4WzAhU9tRxiPSKWx2qRqpEtHe6tMdG6zd9mD
 Hd7KJxLaN9D5u3uHIjZFShAkQIFOI/qo7N7/UMjUIB0YjaRqtQSxdwu3OKsNNjq04rdOXcYgNo2
 HSGPsdlv/H2UfyNateWmfzAqkDO8DjJiGuut49C2gTT4bLndquQm+/AhxgqtMeFugkh0ifnBDWL
 mPF/BLp42JnXb4gwNWHDYctoqYthHGrsDgb0Vi9zBnBFa5GnaeqYjDZ/atLIzrKHZ7mDSF+q1gf
 W6lz6IQzNZCqvCTa1/p4DJs2oy6QVTD6QvAO03uL9DX5XRGtutD522uMcRz5gUig1nhIvgyvYmB
 7LqJWhaGNE6yZkQkpUgyRXaMd+ZafNENtBr4aVYDlS9GP5kAio95ttpQ81LCN4in/qocnroQm+4
 WCNCLkVakgBjnfIE1ig==
X-Proofpoint-ORIG-GUID: rJP7NgcrkMUqhXOxjVofXfqOuV2ccFI6
X-Proofpoint-GUID: rJP7NgcrkMUqhXOxjVofXfqOuV2ccFI6
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab10830 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3w5Ww3LrqGCV8gR0HSsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1MyBTYWx0ZWRfX6D7d+4Y4epVW
 eORF4Ezjb081mRnbu8EyPGiA5lxTtS4rQQ6KrmQyDXBRdc09/Y+aaQYeS2LJPtIcB2bwB+0j936
 vnGxbVWXfvK7jOrEc4EIeopuFR33cGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210153

Hi Zhongqiu,

On Fri, Sep 18, 2026 at 05:15:07PM +0800, Zhongqiu Han wrote:
> Hi Ananthu,
> 
> On 9/8/2026 4:30 PM, Ananthu C V wrote:
> > Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
> > max boost is known") introduced a guard for cpuinfo max updates to only
> > increase, to preserve driver-set values above the freq table maximum,
> > causing cpuinfo max to be stuck at boost frequency even when boost is
> > disabled.
> > 
> > Unconditionally track the highest non-boost frequency (max_base_freq)
> > in the freq table. When a freq table is available, use max_table_freq/
> > max_base_freq instead of cpuinfo->max_freq to control boost values, so
> > the value can decrease again when boost is disabled.
> 
> This issue does not appear to be limited to schedutil, so the subject
> seems too restrictive.

That makes sense, I'll update it on the next run.

> > 
> > Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known")
> 
> I already commented on the Fixes: tag in v1.
> https://lore.kernel.org/all/3a20b69e-b072-4723-925f-514d8162e259@oss.qualcomm.com/#t
> 
> IMO it should be: 6e39ba4e5a82 ("cpufreq: Add boost_freq_req QoS
> request")
> 
> Could you please comment on this?

The specific issue we are trying to fix is that once boost is disabled the
frequency is not able to come down to a non boost value, which was introduced
by the upward guard added in 538b0188da46. Consequently, if that guard is removed,
the issue does not exist. So it makes sense to add a fixes for that specific
commit.

> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >   drivers/cpufreq/cpufreq.c    | 14 +++++++++++++-
> >   drivers/cpufreq/freq_table.c |  5 +++++
> >   include/linux/cpufreq.h      |  1 +
> >   3 files changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 0d0df986fa3d..a13e72711597 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -574,6 +574,7 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
> >   static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
> >   {
> > +	unsigned int max_freq;
> >   	int ret;
> >   	if (policy->boost_enabled == enable)
> > @@ -587,7 +588,18 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
> >   		return ret;
> >   	}
> > -	ret = freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
> > +	if (policy->freq_table) {
> 
> acpi-cpufreq has a freq table but never sets CPUFREQ_BOOST_FREQ, so
> max_table_freq == max_base_freq == _PSS P0 here, and the real boost
> ceiling kept in cpuinfo.max_freq is lost. It seems that the condition
> needs to be "does the freq table list boost frequencies" rather than "is
> there a freq table" — e.g. recorded during the table scan, the same way
> boost_supported is derived from the flags in
> cpufreq_table_validate_and_sort(). And then:
> 
> if (policy->cpuinfo.boost_in_table) {
>     xxx;
> }

That makes sense. I think the best thing to do here will be to export/move
policy_has_boost_freq from freq_table.c and reuse it. Comments on this are
welcome.

> > +		max_freq = enable ? policy->cpuinfo.max_table_freq :
> > +				    policy->cpuinfo.max_base_freq;
> > +
> > +		if (!max_freq)
> > +			/* when the freq table contains only boost frequencies */
> > +			max_freq = policy->cpuinfo.max_table_freq;
> > +	} else {
> > +		max_freq = policy->cpuinfo.max_freq;
> > +	}
> > +
> > +	ret = freq_qos_update_request(&policy->boost_freq_req, max_freq);
> >   	if (ret < 0) {
> >   		policy->boost_enabled = !policy->boost_enabled;
> >   		cpufreq_driver->set_boost(policy, policy->boost_enabled);
> > diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> > index 4984142dc08a..7e183e16162d 100644
> > --- a/drivers/cpufreq/freq_table.c
> > +++ b/drivers/cpufreq/freq_table.c
> > @@ -34,6 +34,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
> >   	unsigned int min_freq = ~0;
> >   	unsigned int max_freq = 0;
> >   	unsigned int max_table_freq = 0;
> > +	unsigned int max_base_freq = 0;
> >   	unsigned int freq, i;
> >   	cpufreq_for_each_valid_entry_idx(pos, table, i) {
> > @@ -42,6 +43,9 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
> >   		if (freq > max_table_freq)
> >   			max_table_freq = freq;
> > +		if (!(pos->flags & CPUFREQ_BOOST_FREQ) && freq > max_base_freq)
> > +			max_base_freq = freq;
> > +
> >   		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
> >   		    && (pos->flags & CPUFREQ_BOOST_FREQ))
> >   			continue;
> > @@ -62,6 +66,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
> >   		policy->cpuinfo.max_freq = max_freq;
> >   	policy->cpuinfo.max_table_freq = max_table_freq;
> > +	policy->cpuinfo.max_base_freq = max_base_freq;
> >   	if (min_freq == ~0)
> >   		return -EINVAL;
> > diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> > index 3f3b1380251a..419c71ccff7c 100644
> > --- a/include/linux/cpufreq.h
> > +++ b/include/linux/cpufreq.h
> > @@ -46,6 +46,7 @@ struct cpufreq_cpuinfo {
> >   	unsigned int		max_freq;
> >   	unsigned int		min_freq;
> >   	unsigned int		max_table_freq; /* Highest valid frequency in the table */
> > +	unsigned int		max_base_freq; /* Highest non-boost frequency in the table */
> >   	/* in 10^(-9) s = nanoseconds */
> >   	unsigned int		transition_latency;
> > 
> 
> 
> -- 
> Thx and BRs,
> Zhongqiu Han

Best,
Ananthu
