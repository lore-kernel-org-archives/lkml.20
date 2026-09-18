Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CBE4E36FB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741228; cv=none; b=Ns+u1Ioscq+LE+/jrIOnpXp5r7togSwLg4Q4hbuLcwFZkLuUUjD6L5EMqmYaMJCqUI4LzUUPSZXRMd7WOqKtp0PfERHBz+9Q3vbPkxk3ccvDIhxwVMKfZzXRp6L3ueTx5yOV7vGNUFzQl44KCXUc9SYG2tr9MW+cZDWsFQaQlxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741228; c=relaxed/simple;
	bh=gJTLMCNpjxCPB/O/GnGRRpYU4FhUYAffCj2gOaX4u8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyqpDbsgraNc+A23aroezG6pFWlt4BgJB9vmT4mMhrptryk5XgGsF3P5p8SxkkUAKxtjObC8txjpQ9KC4s9MXLfUaKhbKECAV0DTMgO2HnJ5nHwbYwRehJjLiQu4AZJvB8hZHl8tFZmJCxtcZrOM7sQB6hcASpOeEJ+3ZOnk/9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsrtoD1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGgLZcdW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsrtoD1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGgLZcdW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDP2CP637478
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=; b=gsrtoD1oE4vbHlyj
	YPwx6i6qASESItiVEtczLACbXnj7z/2yGZm2Byj/2zQT3KFQ2D6iSoekt07Wlltj
	yLttejpJ+M3IVSKuKb7xJXiRULU196VIExn+Yb2sX12XCTTbPyQ4fF48nHvFQ5Oh
	PNbj6it5UC7uc+m0jHzEI9cXg9ZQ/PvB0Bs3RMIi0sYdDytnKnzRGR/jpl/G69nf
	mnsOlR1UFBikOT8NUmKAiD76N5bDLLlyBEkN2NRFeQDORgG+oIdxenYgu5CoOFxY
	JWJCLC31f+ChCsnwnXN95Pkapz7gV3GwT8KryyS2GtgebsqFNYa8hRZqSSw3/gWY
	fIDDzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bt2th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:20:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a05d645acso178045085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789741225; x=1790346025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=;
        b=jGgLZcdW+WlEp46eF+hiDATS8uyXY94yeogJ8I0lkxJ1fnc0u5xMPLqWKV3j0qt/HO
         bPR/WP/7+mH7gtKDDiYEusnVibGNzCCX2LAt6/Ok1eT420lcKFGqQYetyi4e1Nt1bQY6
         PbvjjcfnHwlpKlxYWgntsH5pXC5UhtyoHktHDUwwH+1ndtaqQBtQuAHQ6pBuuxXTwlri
         O5xDpTsO2DVGyq3+FKkNTI8AU4dBjLp1evOlfmcbRRjnDuKDwYTYTzjMCFvHSoMh4F9+
         wBOCCAuEsU2XQ8OF78lrqTjWu5DfvNtsJZzJu5Dt67EkfHBwfLOAIzv+Mwe29gCQnF3G
         UK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741225; x=1790346025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=;
        b=mM7TvJeyKDteQmmwRkkPGP9uN1XuwKeUJ2npu+sgUgK4WmdoJdLGAB2kEyWL4f1PKq
         KVinJvT73ZRO+kqWuX5pQ3C2ayBY1/dAe69lG23DiP5G7JSF9J3aZ6rrQSfL9YPc+URm
         RU6ZGR6JKTmPN5lqmqYtWJlVRR95LY9dtDEJlwhU41KvK7TyJI8jgeHfrcuN+rmdtRpM
         SHf9ZFKi2SGn3yQFiJFcruo+pCfkTLXWEWX2UCetqiiiSFbN8toKoL64ZFHoIQ0dlCuP
         dR3bGIFOzQU4/aWEixmQ2ua5gv2eq8qlysAIn++o5A1Ui7gnpFBFKc/S/U14Z0SbRU5y
         DgwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOZuvnJXwj4UV4rTQhd6lBKkP4AQzPPXuLa+ssfH/jhfAn6NJb4YzrTSoh734U8BFvcaEwk/1xdR6mAbA=@vger.kernel.org
X-Gm-Message-State: AFuF++kmfnaUegS+xDzgBFMVv2phzNNkjmWqQmZ/kdywnSJmnkR+xvpQ
	CSSpWOYiKNOvjl3kMGZt9EVuPI0M6yBv5id32PC66fXnM15xGLazE0p9Gwepz7BkLn6nwzxS1sQ
	kWmlmerowVYtftp9gcuHuWz8fuPbdpFQXBUr5y/3c7j5Z8+lF/vVsmoDx+Qvlm8QM2rU=
X-Gm-Gg: AYBFou35tRAxngjWB3fL0sfmLbZp0B4undZhW9BHe4kb/HQ4uz/HaU24RNBVSURVUwW
	8gYwJbEoxiV88qITidp+XCxDw2dFSx1CUnV8ldkqwqK0Dzrl3Yn6CPvVDZfVw11zCPdwJ/BjNf4
	ZbH6P5i6w1XWCxtm5lTxO4PpTJZOQgbSoExJbn3/QWXtlzP4QXmlm5Tlt7PXBdmS1DEobK7sD2z
	PMn8g8n8TJhC0Nlv3A4AqPLXspLE1t5WuwZIPEbIZKpyplt1EtjvByjb8tAzo4N6rY43p5v3ENa
	fb1EZnqRxi2H/F0a8yh0XTVz7deg/4+EeyaU+96zYJCXU04dhMPlZAMhukiSVeoGWBSBfWBad6Z
	emfRkPQur6+9zKfpI5Isq6NgckfI=
X-Received: by 2002:a05:620a:8909:b0:933:aa0:bb83 with SMTP id af79cd13be357-93bdc747954mr372713785a.34.1789741224635;
        Fri, 18 Sep 2026 07:20:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:933:aa0:bb83 with SMTP id af79cd13be357-93bdc747954mr372707685a.34.1789741224091;
        Fri, 18 Sep 2026 07:20:24 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2a1bb8a1d2sm62661166b.40.2026.09.18.07.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:20:22 -0700 (PDT)
Message-ID: <13ed4e23-1092-4e6a-82ce-b36c1a0016f0@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:20:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] ASoC: SDCA: add
 sdca_apply_default_control_classifiers() helper
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-7-srinivas.kandagatla@oss.qualcomm.com>
 <aq1Hsw0se8zKVQSE@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aq1Hsw0se8zKVQSE@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfX33q1fJlZAAdm
 5GWyU+SS29vGT8QzzMYE7L4vM40/TwGZxjvPYxHy4mQXZ0vX6nVj1/T4TvDKAordJuPxnABLIqp
 DIfd7Vv7NTlTXQfpv0H6Nca0NsLjHpcRqIjMOG1RPagyrbCcpwQb3C8YG+rR6iiXqhB0W7U/Fdy
 PTibo302UIH0FWNj5qbRugcZDhnNVuf1/yQgQwUNVQSWdfloVDho+9kdMXIw/Q96/mkXRz2kBfJ
 BV3ruLDSPBPVExcoGnaMKRUI5LduF/R/f+hO7q3uDdXXfqmW4X3wLVwU8iCLOJe3hbu/YVZNufd
 Ch1DSts8icVQSSz3TMvAcV1EZqAKe7hzOEUxzE4y4HfID+vre6IQJlIbrWqO+PhV8t4S9Mbb37t
 qgPBrdq7Oey2BxsI9Ggu5WvHtweXMiuLQXPbxKLTJoTedBtCUXi7ikldhWs3lHAxj+duy+FBd7N
 K/QAiFngBimKur4Z2jA==
X-Proofpoint-GUID: PTCoW4rheBLaO-dnrYk1ixv7dwxdUbbK
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad48a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bNv17eZGp78-fAQ_3FUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfXwkZRJEpeFnxG
 7EUZoltfi/8elV7IBh+RrYovIGKEh8b7OLspQZOvCxBz2sy8nq1i90oyjGTDsCjdEom+OPMTG5T
 bLufhVSxUi+J6wjGLG2msKFoTZ5OheA=
X-Proofpoint-ORIG-GUID: PTCoW4rheBLaO-dnrYk1ixv7dwxdUbbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180204

On 9/18/26 3:16 PM, Charles Keepax wrote:
> On Fri, Sep 18, 2026 at 02:19:11PM +0100, Srinivas Kandagatla wrote:
>> sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
>> spec-defined reset value (see 02d851b46b36) from each Control's
>> (entity type, selector, access mode). Codecs that ship static SDCA
>> tables via populate_function skip that path, so RW1S action Controls
>> end up with is_volatile=0 and get replayed on every regcache_sync.
>>
>> Add sdca_apply_default_control_classifiers() to re-run those two
>> classifiers over a Function. Elevate-only, so codec-set flags win.
>> Call from the tail of populate_function.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> +/**
>> + * sdca_apply_default_control_classifiers - apply framework-known Control fields
>> + * @function: Function populated via static tables (populate_function path).
>> + *
>> + * Runs the same per-Control classifiers as sdca_parse_function() so both
>> + * entry paths land on identical @is_volatile and @has_reset/@reset fields.
>> + * Elevate-only: codec-set flags/values are preserved.
>> + */
>> +void sdca_apply_default_control_classifiers(struct sdca_function_data *function)
>> +{
>> +	int i, j;
>> +
>> +	for (i = 0; i < function->num_entities; i++) {
>> +		struct sdca_entity *entity = &function->entities[i];
>> +
>> +		for (j = 0; j < entity->num_controls; j++) {
>> +			struct sdca_control *control = &entity->controls[j];
>> +
>> +			if (!control->is_volatile)
>> +				control->is_volatile =
>> +					find_sdca_control_volatile(entity, control);
>> +
>> +			if (!control->has_reset)
>> +				find_sdca_control_reset(entity, control);
>> +		}
>> +	}
>> +}
>> +EXPORT_SYMBOL_NS(sdca_apply_default_control_classifiers, "SND_SOC_SDCA");
> 
> Just set the values correctly in the tables in the driver, I
> don't really like this going back and fixing the tables up leaves
> the driver tables looking slightly confusing.
That is one way to do it, I was trying to be more align with what was
getting done after parsing the acpi tables. But I dont mind updating the
tables directly aswell.

I will try to document this so that in future if someone is converting
any acpi tables directly and then they need to mash up few things before
passing to sdca core.


--srini
> 

> Thanks,
> Charles

