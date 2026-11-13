Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593866;
	b=4NzPyxGstMgmMwjJG+wswYyZlNiOp5764TM7V3cD4nmOUdweGuf00DLLyL990/onRFTP
	 j5kSrjkwCC6UCEOUFm+GP7vefOk+dCnuK2p6l/pv8JJVWecVnDsArJfXwBCSc0VJ0MwaY
	 peB0cgYFR14bZiRT5qbsHFrgPPO26ysPw7hfDaFvGFjNW4pOEZFhgrVxpdb5fREBbor6S
	 VLIrba6t28J5wQuxTOTPFG1ND9w3eUoEkVX75YusKQ0I/eT/HpI39jz0KJ7MitZCPO2kE
	 /CVB9/QVtzGqrN5zaf5zRRIRSwxZ/vFHixLj+yz21JGgwsZlcbXqBRkdMzI75pyKDkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zI+ONjRLZMmf4WGXFVLeK4XkN4j46HTMaqnU6qWxB0A=;
	b=VyCh85fWi1FfawVpBEBoNAMEVjpC4wFFtY7CN69ORvACOHwPAgiZlaVS3w3LMDupMc1A
	 wf+DNu5v4JDVU1kprxOoh+EpSeWVobvttEKTb4q5esULMWQwQJqU1nhX421FgJC0c1LV4
	 +h1dgOa1zyALSPY3NHCRHIX/bEIQ0aK7LnOJdwgxIyl//llZrTzTbJpwN0lDlH0WPXHHt
	 cUgiTL8Wo6xlr1oJiytG5yZegDra9YJQzfTU4ogtIf5ypzPrXEr2w62uWrQ+7AdM0oTF1
	 RIkIegqvoygFRxvKYIORSZNNDJvQc7beooR1zQRUBGgIuFYgRYHlyu2fVEjnwIQedwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HlzaTWI3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U3kXjhfP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CBC606A88C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19CBC606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HlzaTWI3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U3kXjhfP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADH3eV43868331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zI+ONjRLZMmf4WGXFVLeK4XkN4j46HTMaqnU6qWxB0A=; b=HlzaTWI3PrPm5/AO
	8uJOPrL+GlpRGgyOF2/te8sw+hbSOF5t7wiDqcVfhhuN/88A7L2e/n96hH5fAWoL
	kXDK8g8xATItzylNPY41JKzTFCIheRvAlxnQN0DxDAatDAHvv2Vwl08DXW0R2TmB
	jaJyGPxifxg0BM/Xx6MpmQcVjNHYTOfGCJRJsYMuWj4wDRT2XYLHKpu3dkY7qvSu
	ebvdzpE7vlUL15iJCKRNIwN10GLVRY79aaydFkNs4AGSAZUjSFdLAjAlE/BXrAGU
	B31iCHe0sestbvAcayc43OKzfxugTbedo1PdlMwDT1zO+hdcE4caeKiHhQhJ/KQL
	K+w4AQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx6ma88g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:17:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1524186eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794593864; x=1795198664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zI+ONjRLZMmf4WGXFVLeK4XkN4j46HTMaqnU6qWxB0A=;
        b=U3kXjhfPcRRcMbwwoO2L79GfmRneWA4OQt2ajhQ5LpA2Mx4vFq82+NKQaTyCzgxwMz
         g4df/kf/IUdgjziXfgIZTQp5JT7aBto3bQfwWOF2rQhk9y8CzsdJ78IN2cqD39mRVJLY
         UuppK8blbEfH1euJpkg5eGnXCkl6c290ntVfVFbfom9iazX1uCc97QPKyA8jnwKU69S3
         26Sl9rKGDV1cHwye/vsBxPysbDh1c5mQOz/8cgDJ8Mwdj4ERNQd7zzScq76izpiylSTy
         HsmQd34fkUYcq52xfJ94kJ+kTArpeWDaYCX4KWc8G2WabsonzaFEA1KkyKHkQ5iywtoJ
         7pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593864; x=1795198664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zI+ONjRLZMmf4WGXFVLeK4XkN4j46HTMaqnU6qWxB0A=;
        b=0+oeZ/PBz7dxUTwTCN9ut33nQUQwdn7gxsxsRwqYLWrokSIwy+3BJ14C9YYN6TOD2Y
         jQMqCnF3mkiqXczh1yNSV6tYpGlRX8g8OGjeHDR1qSQXBRRT8d9gBCMshkeQkv+yh1bU
         FFHWWEDbCCXkDLMc41UnIsxD47AHwnX4zIssPspr7lLQu70UMo7Ext4MCH6PTR0zQeLR
         7BaeYwEfF4EATH0E/XXP/Qr54HeLyUmHsx3P0qP6sYcQK2l5k2W6+PhDUmM9BJuTiGhm
         3ffcC+1XxM+gN5iLESqLm8f/Y0njhN9QuDEO90WD6EJ+7Z/LvMhylgg5tfxbzPeIpfm8
         wDJQ==
X-Forwarded-Encrypted: i=1; AL+hErFZXq9pb+To8CaL6JP52C1yaSSLbQn9cUJADu/WZ7DbbOfTBypvslH3kcEcqpdH+ttS1OtVLGQxWLKUC8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QFfIKE0L+rJrLZMFkdyjIWccNTXfpNJYa2nowU6NtTf00r081
	6W8LiSN3kLzLyprbGcfhMi+UaAlr5/0Ablia7I1Arrwq76I2NkFo37SU3zllcNp2LTK5x+PeH5c
	uqNe9SEkP/GHXJXwsNZ6PMxVH+yaM/C5j9DPkv6eRWCwYulFYxkp7aZZGEKWXZ47NjBuHiA2BOw
	==
X-Gm-Gg: AYBFou0t2H1v1Jzj2+uyBZPp6dafCK8TFZVItdY71HrebgrlZqDBxsYb1uhJhf2zNMU
	YKNSbF3vZuOqrEhVvL4MGOs6RFeB9sqCMZPUXhCthQIEgab+FRc0fW2Trup7KWPnBD0AmthxYPl
	u7cNVyz6cVpK7HGOU16dzbzGmRV0YDFm07gUOMjH9B4u3HGyIAEwT047nT98fsCsrpBE7jGWZh8
	MROgxq8WYsnChwXDLeE7CqAHzRNmAHvBEYP3411fTfJ+VMmfcjREuVwNS0G3MCC2+rse90kP5Mf
	r9/VMzkpmoHKaep7jad6nMbHmtUDQZRVF0CX+yR4j25o/lyp7gDrlbzCpTqast8GPyQnmXXBqdP
	IjHXJljY0qqogJ34o/W2S2t0T+ByCaa5SEW+QkoD/Wr9YKIbs+fCPMl5QYR3dOhpf0yBPyvtHWH
	Is06DhYCHPZOvbiQt+bigsyXvLnIzD8ocFTR65CIQLZximApx6mQbMDRDSrDAJcw5RTw==
X-Received: by 2002:a05:693c:881a:10b0:35c:ba31:6fef with SMTP id 5a478bee46e88-37967cdd3c2mr2777001eec.36.1794593863677;
        Fri, 13 Nov 2026 10:17:43 -0800 (PST)
X-Received: by 2002:a05:693c:881a:10b0:35c:ba31:6fef with SMTP id 5a478bee46e88-37967cdd3c2mr2776974eec.36.1794593863020;
        Fri, 13 Nov 2026 10:17:43 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm17255065eec.20.2026.11.13.10.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:17:42 -0800 (PST)
Message-ID: <338b21e4-b23e-4cc9-930a-8f043538f881@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 23:47:38 +0530
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
Subject: Re: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
 <db523e851beda07c6f52f3c094b5ea2bf718af03.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <db523e851beda07c6f52f3c094b5ea2bf718af03.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G83IxLVwmEl_0D8gKt2wV71a6cuy1IwQ
X-Authority-Analysis: v=2.4 cv=RbcFmFtv c=1 sm=1 tr=0 ts=6af75448 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FKb9D7SABon0YKVRCkkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MiBTYWx0ZWRfX5T4PMi9c6kMe
 uwB0jhlePLHzFhsgXpjvx4bvP94S6lI+1Fr73kg7GmBvCtM9lH0WnaQj3sNxAQ5WPLVzyLH5Ji0
 N8b3uS83d2HT0xZi0WPqxZbup1SROsUPFVzZU+DSxXLoBTuCGnls8UDghQar29hVJD203cG8PR1
 p8wHqIgZcCsXFIozqfli1qMG2wpUxT/oLHhkgVyCIqdl5I9093XDVq2gveds0zt9ZLiXoNYHh2J
 T8P0vJgP1KUlSSZB2kXIWUgTtM1yrVoJvznVUG+m9vVMk7ejx4VcW4shut+TfxwKzuOHkiOT0Zv
 wT45FjE+TxwJTcYrzx+F3/+Jk+v3fuxRrD6Z1manmBmujCj6BTb5wHyN1Bu/PpfzbsRyVaC58Lu
 F0iT5iv5I4nGfiUt+V3jNB8S+yD12keBko9dzg3X6yoMDNE4PtKkvQe1Eq2ET53QpGCmsyPis3B
 zvKKJVpNes1Iz+FGArw==
X-Proofpoint-ORIG-GUID: G83IxLVwmEl_0D8gKt2wV71a6cuy1IwQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MiBTYWx0ZWRfX3Q/p8gQrRrrR
 KbA3wWMRbqEgtP0ZnaZyp8q/kfv+la0DlkPkw9P588qmsHstvHxMhp5YcNKQfz5J4UFpxL/11WF
 7qC1EnfWPCydguzpuY2/DvlQdKNEKls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130072



On 11/11/2026 12:21 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +static size_t _nl80211_smd_ctx_nl_ba_param_size(u8 n_tids, bool dl)
>> +{
>> +	size_t n = 0;
>> +
>> +	n += nla_total_size(0); /* ba_params nest header */
>> +	n += n_tids * (nla_total_size(0) + /* tid nest header */
>> +		       nla_total_size(sizeof(u16)) + /* buff_size */
>> +		       nla_total_size(sizeof(u8)) + /* policy */
>> +		       nla_total_size(0) + /* amsdu_support */
>> +		       nla_total_size(sizeof(u16)) + /* timeout */
>> +		       nla_total_size(0) + /* ext_no_frag */
>> +		       nla_total_size(sizeof(u8)) + /* ext_frag_lvl */
>> +		       nla_total_size(sizeof(u16))); /* ext_buff_size */
>> +
>> +	if (dl)
>> +		n += n_tids * nla_total_size(sizeof(u16)); /* winstarto */
>> +
>> +	return n;
>> +}
>> +
>> +static size_t
>> +nl80211_smd_ctx_nl_size(struct cfg80211_smd_transition_info *st_info)
>> +{
>> +	const struct ieee80211_smd_ctx *ctx = st_info->ctx;
>> +	int n_dl_tids = 0, n_ul_tids = 0;
>> +	u8 pn_len = ctx->pn_len;
>> +	size_t n = 0;
>> +
>> +	/* count valid TIDs */
>> +	n_dl_tids = hweight8(ctx->dl.valid_tid_bmap);
>> +	n_ul_tids = hweight8(ctx->ul.valid_tid_bmap);
>> +
>> +	n += nla_total_size(sizeof(u8)); /* ST type */
>> +
>> +	/* outer NL80211_ATTR_SMD_CTX nest */
>> +	n += nla_total_size(0); /* nest header */
>> +
>> +	/* DL nest */
>> +	n += nla_total_size(0); /* DL nest header */
>> +
>> +	n += nla_total_size(sizeof(u8)); /* valid_tid_bitmap */
>> +
>> +	if (ctx->dl_sn_valid) {
>> +		n += nla_total_size(0); /* DL SN nest header */
>> +		n += n_dl_tids * nla_total_size(sizeof(u16)); /* DL SN */
>> +		if (ctx->mgmt_tid_valid)
>> +			n += nla_total_size(sizeof(u16)); /* DL mgmt_sn */
>> +	}
>> +
>> +	if (ctx->pn_valid)
>> +		n += nla_total_size(pn_len); /* DL PN */
>> +
>> +	if (ctx->ba_params_valid)
>> +		n += _nl80211_smd_ctx_nl_ba_param_size(n_dl_tids, true); /* DL BA */
>> +
>> +	/* UL nest */
>> +	n += nla_total_size(0); /* UL nest header */
>> +
>> +	n += nla_total_size(sizeof(u8)); /* valid_tid_bitmap */
>> +
>> +	if (ctx->ul_sn_valid) {
>> +		n += nla_total_size(0); /* UL SN nest header */
>> +		n += n_ul_tids * nla_total_size(sizeof(u16)); /* UL SN */
>> +		if (ctx->mgmt_tid_valid)
>> +			n += nla_total_size(sizeof(u16)); /* UL mgmt_sn */
>> +	}
>> +
>> +	if (ctx->pn_valid) {
>> +		n += nla_total_size(0); /* UL PN nest header */
>> +		n += n_ul_tids * nla_total_size(pn_len); /* UL PN */
>> +		if (ctx->mgmt_tid_valid)
>> +			n += nla_total_size(pn_len); /* UL mgmt_pn */
>> +	}
>> +
>> +	if (ctx->ba_params_valid)
>> +		n += _nl80211_smd_ctx_nl_ba_param_size(n_ul_tids, false); /* UL BA */
>> +
>> +	return n;
>> +}
> 
> This kind of code is just crazy LLM output ... we can just have a sane
> upper bound and make that a single line of code? Nobody will really care
> about the precise size of the allocation.
> 

We moved to computing the size instead of having a fixed value because we
transfer an almost dense context in one phase but just a very sparse one in
another and thought this would save space on the nlmsg skb. If we transfer
data as D2.0 says, we will transfer about 330 bytes in Prep while only about
70 bytes in Exec. This assumes all 8 active data TIDs and without nlhdr
overhead. Is it okay to define the max size (~400 bytes + nlhdr overhead)
nevertheless to avoid this size computation?

>> +static int
>> +nl80211_put_smd_ctx_ba_params(struct sk_buff *msg,
>> +			      const unsigned long *tid_bmap,
>> +			      const struct ieee80211_smd_ctx_ba *ba_tids,
>> +			      bool dl)
>> +{
>> +	u32 ba_params_attr = NL80211_SMD_CTX_DL_ATTR_BA_PARAMS;
>> +	struct nlattr *dl_ul_ba = NULL, *tid_ba = NULL;
> 
> nope.
> 
>> +	u8 tid;
>> +
>> +	if (!dl)
>> +		ba_params_attr = NL80211_SMD_CTX_UL_ATTR_BA_PARAMS;
>> +
>> +	dl_ul_ba = nla_nest_start(msg, ba_params_attr);
>> +	if (!dl_ul_ba)
>> +		return -ENOBUFS;
>> +
>> +	for_each_set_bit(tid, tid_bmap, IEEE80211_SMD_CTX_NUM_TIDS) {
>> +		const struct ieee80211_smd_ctx_ba *ba = &ba_tids[tid];
>> +
>> +		tid_ba = nla_nest_start(msg, tid + 1);
> 
> that can also be declared in the loop
> >> +static int nl80211_put_smd_ctx(struct sk_buff *msg,
>> +			       struct cfg80211_smd_transition_info *st_info)
>> +{
>> +	struct nlattr *dl_sn = NULL, *ul_sn = NULL, *ul_pn = NULL;
>> +	struct nlattr *smd_ctx = NULL, *dl = NULL, *ul = NULL;
>> +	const struct ieee80211_smd_ctx *ctx;
>> +	unsigned long dl_tid_bmap = 0, ul_tid_bmap = 0;
> 
> same here, what's with all the pointless =0/=NULL?
> 
> and move variables into the inner code blocks too
> 

Will remove the initializations and move the variables to the inner blocks.

>> +	pn_valid = (ctx->pn_len && ctx->pn_len <= IEEE80211_SMD_CTX_MAX_PN_LEN &&
>> +		    ctx->pn_valid);
> 
> useless parentheses, but anyway you don't need pn_len or the max, or the
> pn_valid even since it's always transferred ...
> 

We may not transfer PN always. In case we do (as being discussed in
https://lore.kernel.org/all/b6cda6b5-adb0-403d-a2b4-d64939a967e7@oss.qualcomm.com/),
we might still need the length bound check to make sure driver does not give
incorrect length.

>> +nla_fail_ul:
>> +	nla_nest_cancel(msg, ul);
>> +
>> +nla_fail_dl:
>> +	nla_nest_cancel(msg, dl);
>> +
>> +nla_fail:
>> +	nla_nest_cancel(msg, smd_ctx);
>> +	return -EINVAL;
> 
> crazy LLMs again? You obviously don't need to have nested cancel to get
> rid of the whole thing ... probably don't need it at all because you're
> just going to free the skb.
> 

Ahh, I think I misreferred some examples (like cfg80211_net_detect_results())
to cancel the inner nests but are pointless to an skb that is going to be
freed. I will remove them.

> johannes

