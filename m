Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592456;
	b=kpey0PlcUDS6zO5e9zdmfUs50yxwyuHpwRcuAo23W7Aw2B9E4ht8aiDsZorm2W0z1IrR
	 5wNJESfK1p6/1H2lfnW15Jf+/RPiZvDvWiKJZ3STqo0kosIcdfIuSeue7+FT3ektZLqXs
	 q5tfqjIqN8/4v2maCfmFdDg8Dgf4DdknVcCxjc9rg54zSTntDyA0Jvl/BMj4MLXYUJeHh
	 w1jr8G+5L4xPWAhb2iP3HXTAFj1sJFKW0TJ3ZnRk3ONXGcxCGLbH61t8rXWCiQN4saQC9
	 34MUIa8goXeHBKdwG2VHxRkyjpODw5KyMaVgfmtANY17GdeOtvOGG0OXyjCVWfHQdSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hwnvv4qrANhxix7v15djjdeTI/Np65zNnPxfeeQWmYw=;
	b=ZfSP3nnbkDmqZrKnTngAFzcyX1GP/bqi7Wug6NtgNRX51EBcmhccYdeLr/BkJbmwoTQY
	 wT8SH1viLpYIOut580otFBKSU59dvqA8ljpF5vKZPvaoKr05n7sbh3Nb2hZ0AXMLhCkim
	 4gkj8M2MYfWUVeFqjrSv4IWQ2gMVqz2lEnkIh0Qv6fHfKD483bQSosIhuuIGuXBofhlaM
	 bAduswJj876J7m/b1ozy1SgEMKNnVfwUjqJgR9QTqygu/WXs7zh4dIuLGPdynSlyFv/4R
	 s3Bpx+2sIRVCXmWwUC3/CWveL+ZB5cfd5BskIks1Ks4WYggSWmfEQ9DNBcNAQP+gpIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvYFrqMa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LbvT/iBH";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443EF606A885
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 443EF606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvYFrqMa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LbvT/iBH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRAfv552194
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hwnvv4qrANhxix7v15djjdeTI/Np65zNnPxfeeQWmYw=; b=RvYFrqMalwxajLoU
	PPG339Qs0t4TGnQf0OIfOL5ER9gpd4hWBvFLx41oa2xMfdwKi6sqeAZGZAWyNlx/
	NBwmd9jrxtPKfo0mj5XLdHqmfR40MPP/Xos75eP3mZefMikfzwNkJ9ofN0d7K0KN
	QwURgWNnnQlOYMBOODxb2MgJMr2s7JGJmpcxECoD5KR/6oI+sjBb6xf2Fj5VFxU+
	uvUvzGjqTDGCzlJoBbNxScMimNhnAinCoOZ9tlKWeOjcViMo3O2Djim8ThNIombE
	Fly7nJ/6jTtlWiFKjZTp+0SkD6teq/m5PAOYQjmNmVqQbaqqX+R/rXrMNYUoK++Z
	99xjZg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwc4mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:54:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b29df78132so448162c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592454; x=1795197254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwnvv4qrANhxix7v15djjdeTI/Np65zNnPxfeeQWmYw=;
        b=LbvT/iBHkG+dy6r8XUDy/3tQpHk1DZUVGKSTWWd+Z70dxxfLUgffn6ZkaK19M6DJRI
         0+y0cVSXs4a0KWYdYu7pb292ypPIJqnuERy9jiY5XkIRgRSp2z7BbsP9pm6LfX6sSeHg
         lbRfO75jK64+g4RFO1ZfaYGFwzDSpo4Snq7iK5bj89iClfwd5kSTklK2c37G4s2SPibV
         OttoyhfplgH00TUSXs0yLyQjDPhkWTflh72FQlE5LTVkC/HZHkIjW/+Ru91QwNGZnpwl
         1/snC2KcDc/lbukkJCP1kqEuMWl9MjfIiY5uSzJ6R/coDXP2ssDUZZVgCAKAaHrQcCwX
         /QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592454; x=1795197254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hwnvv4qrANhxix7v15djjdeTI/Np65zNnPxfeeQWmYw=;
        b=hEJ+17dRKfRDKwnPCOklpy+HdgZe4BEpxX2worxo4OgYiuoxFnIH+ww6TeOFMGeko0
         HZo+TBLarel2A1mJ8Mv7RN72frEHINtFilIKkamT/v4DAq7QEvX0kT3J2ihgfvQCS/UZ
         qxC84U7rpSPhwnZBMBxWaIT7W7FtEdhg5laPyGMXqssJs5L1j3zc2KyFFDhwo1Q3rAjw
         yd8kkVvD4brxO5G0XCS1rnxzbcQyCZ5mCeN0FITxryNgvfEZHSVNjKuvJjBpnh5kXoIz
         KZvVs1nv+rdcuiIoA5rKlljh1IKQSOyVenUz4w9qXtMG2tTgI1ITSIY5e1MeH376No3T
         6q7g==
X-Forwarded-Encrypted: i=1; AL+hErGoJTI9IlYKM6EthKzFRLlDgcfgaCRxoMvjqHGthkumKPkTe7tZCmQGc8C3Yyr+s5DiQcmgegPTJUBcxtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y/v4hwS2cimVZCjcOFkakjlbzw8WbxWvgagDuj0TihVFmuKST
	R8N2MDAb9wYIh1ikDls/JxbP1sq9jV29hSlYldJnR4m8z5Qq4SoohU89N/FuHBKRgj/94GFnIc7
	VjuHSufu9M8v4uU1AblXvUbOUBv/FSREGrTFTbZoqanMycEN73v8/YhzCxcmVYExxGg==
X-Gm-Gg: AYBFou2YjRAwLS7ttimFjSvjsLkRiP7N+5fSiCRpQLTZTMS1jq5x42xLOf/szf2XXmI
	tEyUCehqNWDxNkdy2f4zOBl3qNLLsY6y/9Jj+FoO08E/DU0pszLRcHpstO5nTppq9+3f4T4Whhf
	Qjoa7nZa059bbWKrI72N4UaSHvDGAXGDHtUiyvAUP9UyabTsBET3ATUGDzll1+dWwnDMlKwgsB9
	lasiNLLnSf799H8gYet+lgbfUoHZaayifnY8W/aS8sJBNtL7JJtNXgKWhHZcTmoXWfCDSezyLMs
	P4CiVXiOL3a4cKiOL4GYCEykTzNZgd7xb4rLziXZ9FOcriJJkJkh5z9BQXsAAc4+vykpvtndNHB
	p8R6FO7mocg3pAacY2+eLdV9C3CauKSHybPUM++oOlbW/4PHb5g+9UJgC4xAiDO+fGd4qSshb0o
	ufAIk+f7UG1TVAMquNxVHCXlopDNh+5P6SiPaxl8K4OrLBN8HAEFMNmXoZOnx/22UkDA==
X-Received: by 2002:a05:7022:b0c4:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1b5030d7aa8mr2544974c88.13.1794592453884;
        Fri, 13 Nov 2026 09:54:13 -0800 (PST)
X-Received: by 2002:a05:7022:b0c4:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1b5030d7aa8mr2544955c88.13.1794592453129;
        Fri, 13 Nov 2026 09:54:13 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm8836828c88.14.2026.11.13.09.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:54:12 -0800 (PST)
Message-ID: <2be101bb-081c-4d6b-93b6-a7cea3f183f2@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 23:24:09 +0530
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
Subject: Re: [PATCH wireless-next v4 09/21] wifi: nl80211/cfg80211: add
 support for SMD context programming
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-9-62e39487f51a@oss.qualcomm.com>
 <7e6a6640fe034af160eec0dda532259b499153ad.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <7e6a6640fe034af160eec0dda532259b499153ad.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af74ec7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=09HMBOQARD8bikJQYYUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: U_1m5j9x9AVn_5n2yB6kTNeOpuIK30v3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MSBTYWx0ZWRfX4l79PK0/p6qG
 E91ZdjLzb6/VRbuNF3QR3vwfM4YRyFXH8hvSNX9ba+kSreqr3mt+Bmr3yCw8OnZGQCsz0uVpn0w
 WVXIIylbdyJdqgI2zAJndevmihq0j9zofqfogl9v6s9gpVqpg4wPK/vkv8fimLqQRicLYKoQofI
 Lf/sfYJlEmKBb6HkGu6H4Ok7slAuOMhfUmeeqbTqdxtdIeyVPYSmb/wE7ZuuGQSUXuRJTcYXwnA
 CYRxX7u+I11hRbJNuKw5DzBOVoKU8c7ILymePX0a+Y7rErKajV+r6ZifnhIZoNqLtfd7AOK0sRi
 EVvI5zr9wCboZr1yLiDgJFSatYtYDQN/3goiC7+A+1TwoTD18BIwGf29twq3WA3mZJDOxp4yy5s
 AKEZfPV5J9xQnkscLEzBmr8VY3ABHo0ehgD5pmq1rXT+t/dNt54f9pmpvFUcwzmLNLssrdVJVgu
 x7uhqrX/Q4hJKm+oIIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MSBTYWx0ZWRfX7SHSbSHB1xvN
 QnYOiTwzaZ81BC55ISuUlfBaOCj0AMFAp7FPC8/tH6H9hWef+TqhMN/wXdH/vnJQKHve+2fl9tx
 j34zM4VC0l3npTI5lC2haBkGWD2FcOk=
X-Proofpoint-GUID: U_1m5j9x9AVn_5n2yB6kTNeOpuIK30v3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130071



On 11/11/2026 12:25 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +static int
>> +nl80211_parse_smd_ctx_ba_params(struct nlattr *tb,
>> +				struct ieee80211_smd_ctx_ba *ba_tids)
>> +{
>> +	struct nlattr *ba_tb[NL80211_SMD_CTX_BA_ATTR_MAX + 1];
>> +	struct ieee80211_smd_ctx_ba *ba;
>> +	struct nlattr *ba_attr;
>> +	int n_tids = 0;
>> +	int rem, tid;
>> +
>> +	nla_for_each_nested(ba_attr, tb, rem) {
>> +		tid = nla_type(ba_attr) - 1;
>> +		if (tid < 0 || tid >= IEEE80211_SMD_CTX_NUM_TIDS)
>> +			return -EINVAL;
>> +
>> +		if (nla_parse_nested(ba_tb, NL80211_SMD_CTX_BA_ATTR_MAX,
>> +				     ba_attr, nl80211_smd_ctx_ba_policy,
>> +				     NULL))
> 
> if you set up the policies correctly (and you should, but I didn't go
> back to check now) then you don't need the policy here
> 

Sure, I will remove them from the parser API.

>> +		ba->amsdu_supported =
>> +			!!ba_tb[NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT];
> 
> it's not super useful to use !! to assign to a bool, and if you wanted
> to be fancy you'd use nla_flag(), right? ;)
> 

:)

I will clean these up.

>> +		if (nla_parse_nested(dl_tb, NL80211_SMD_CTX_DL_ATTR_MAX,
>> +				     tb[NL80211_SMD_CTX_ATTR_DL],
>> +				     nl80211_smd_ctx_dl_policy, NULL)) {
> 
> same here, and then it kind of cannot fail, I think
> 
>> +			nla_for_each_nested(sn_attr,
>> +					    dl_tb[NL80211_SMD_CTX_DL_ATTR_SN],
>> +					    rem) {
>> +				tid = nla_type(sn_attr) - 1;
>> +				if (tid < 0 ||
>> +				    tid >= IEEE80211_SMD_CTX_NUM_TIDS) {
>> +					GENL_SET_ERR_MSG(info,
>> +							 "invalid DL SN tid");
>> +					goto err_free_ctx;
>> +				}
>> +
>> +				if (nla_len(sn_attr) != sizeof(u16)) {
>> +					GENL_SET_ERR_MSG(info,
>> +							 "invalid DL SN len");
>> +					goto err_free_ctx;
>> +				}
> 
> You've got to be _kidding_ me, why do I even have to get see such
> obviously redundant code?
> 
> Please read your own code.
> 

With respect to the attributes and policies defined in
https://lore.kernel.org/all/20261106-smd-v4-5-62e39487f51a@oss.qualcomm.com/,
DL SN (similarly, UL SN and UL PN) is a nested attribute where tid iterator is
used as the inner attribute to pack the scalar per-TID SN and there was no way
to add policies for that (other than having to define something like [1] and
use NLA_POLICY_NESTED).

There were similar changes done for array of values for
NL80211_ATTR_CNTDWN_OFFS_BEACON, NL80211_ATTR_SCAN_FREQUENCIES, etc., So, this
approach was done here to make sure that each SN in the array was u16 as
expected. If there _is_ a way to add policies for the iterator-based nesting
of such values that you could point me to, I will change accordingly.

[1] =>

struct nla_policy sn_policy[8] = {
	[0] = { .type = NLA_U16 },
	[1] = { .type = NLA_U16 },
	...
	[7] = { .type = NLA_U16 },
}

> johannes

