Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526441B8C6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807415; cv=none; b=Sd/2mnHscLzVgxa8TrlOLuRUMW6hwW+9u9Sx3BCWzhFDSZ1BlO7yJYhS/Y6QT8FOahLH4pjZCSSnLjBJmDYX/nYJZsguWH8pdBRsvdLtegzp/CdekOuxClI5GNsPMZAQjpn9UtPmHxp8FrsfDUbwc67KZlYt4/Wv7yr6yzP6NCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807415; c=relaxed/simple;
	bh=brEZmAXbuncetJI2FkqSxT5PNNlo3jvZ5P7kjGVFP3U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=La+NSfzM8+fsGTW4si+LNpxPmhCVTamnlJmvihoOdQ6JZJSRhZY/Q9KbdS0PCR/U7zhBLt3raJU0eb59l52a2nqcCE1S3kL5LCuz+iJYud+e5+Q9QFFVgh2tFQEyf77QKr+ZgP8qqlcHfJwnoUdwRg+fCSSnXLzN3qgapkENK1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1X1wSeS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmnzvSed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1X1wSeS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmnzvSed"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0aIK2679915
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yeqai3Yuq1B3Qe1I49IgN4kgKwjbd0nX9eH9skXlPx8=; b=o1X1wSeSX+nvDEhX
	vEo9BaaLxXepBiA3vP+5QE0NjC8dkNy+iROjrchm/b9eXl1/NQBTUy0+O5bUl1t+
	cFMCObe08qhpvOFic2pNQV/kUs6KDQOp1qFRG2xZORmLPbm73/dCYswZ3L9I7at+
	nLP4/1RK0SYp92qQNks48lsmTZax2OjsgYiZn73vVZTC/dpyntVoKEK6vf17wgXZ
	ZQ/sGj90WbaiBSN5OIPB4aquFrJWKi9NDnG3SGdmXVYUYrCXrVqJWY9hCuV/ZvUn
	A/KVBHEFzPEHkG7u0Gj97urI7bJiX6iNPvEz6Zksb5sXcnKLduvQCwjH21rhI0PU
	3sCBKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1sv1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:16:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso1326167a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807411; x=1792412211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeqai3Yuq1B3Qe1I49IgN4kgKwjbd0nX9eH9skXlPx8=;
        b=gmnzvSedjB/pwznbDK7NiFfooyVHbDu6FppZk4bIPyAeNs+nbD3f8BWbWJOkl5qbyD
         2FDFv6JYNbbNENFl0XWNik5W6p6C5Q7mqI6GxXVhqKTetMA7kdQWFynufVSdsqBDxWPb
         oIhgnVNgB6oLplcff83njUaDo7VVkvUL31XRt5ao8C8FsDgHXdCYAuwfyB+dyb8Hd64O
         guQ2qxwJBRq+kgA6XYhB3UqMgBlv6kUYlO4Kl0viemKqcEEc5rXT+36/Qdyk51sZ2uLx
         lKAwEF8aYAr+IYX+RWftk37pr+usbPO65Z9sBW370VqQzI7eziAUxwtgtassVi2u9TC6
         DI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807411; x=1792412211;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeqai3Yuq1B3Qe1I49IgN4kgKwjbd0nX9eH9skXlPx8=;
        b=gxXb95eQXIO5/iVxBDoPTaopYKdqAdSlD0vwdpxY7ooJRd6n5zO9GMm+9+w6dRq/Ei
         77HQw5ksl1jeqW2pRPTM8JMuqW5tkA4gWBOhkznY8+YpPIyY7AJUWrRA9StGGB2be35g
         F7Zc52RlA5d551ubG5qGT2o1AElmsA9t/dbSEEfTS7pzpue15H2L+9s8xXeIzl5TNeke
         p7QqWegStFNtq5wX07JHImSSUvozL+kK1aoyaEHynUJY3I/ctM0Oaqj8CPBzEzsYXxHu
         Wmv6NWJKpHrfzOGMJkyJvDF5CsGwIWKnj+bmzHMDydQp8TqwXm/7BKgaG/qZxTGMe/pl
         RStw==
X-Forwarded-Encrypted: i=1; AKwUvByM2w70gMbjC6httKtF6BsyWwBGEBMwNX3oeYI6eTPdebJstdEdS5YV2J5HbmgeZmNeLSqVBsacWPK9Drc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI68kVsh4iFNGsXo0KUsxt2rU/kiw4yxSqpKPAeIitSsBNNmXAY
	uyCik3ywxDWrdxwLqcWbZYS5fiB1HDwYjFLVDijPX8x5y2xoid6Fod3f1qUxfZmMQ74peOmQWNl
	+sF8IxewT+s3RsyduHHMijCIniD/4EKMl7y4CuHeCnsMR1oODWFWJFEVmRe5OZVzinEo=
X-Gm-Gg: AYBFou1qrYLXWz6jIYAjLnbmaVOONW6xzPpPk0DERxUPW9yt4GzQQaoyo3F60QY4j/i
	PigyaeEzhq2GWLqKvH15C9lvT36beZGjHmmFzMQlasVpn43YEqEzi3wtiuA7eBQV1GEzUSWVIOX
	MFSqBBC/5IeqjApnLMtk5QDPzkrfFzekbfInqY2YOxjejryKK3kVanY4zH9r1YHOG/FDgsjuhzk
	J4mx+lJTzd5brcpPKgLd5Djz/iS14xmXDGn3zVhKEM9kG5RGq8HKFPsFMPqjoex6gnb1ac8IbAV
	ZvRZwal5acBjxFqvG6zBTwOyZ6C8949E0S2FjooVFPTUHsTstjhhdOOE2q7oGwdftXC0+KtoKza
	S6aGW6o5zPMoa/eVZEBBSN3hxXgQsUUoKPa9NirAaL6Z+6w==
X-Received: by 2002:a17:90a:d446:b0:3a4:7938:844d with SMTP id 98e67ed59e1d1-3ab3ace27e4mr6220122a91.64.1791807411424;
        Mon, 12 Oct 2026 05:16:51 -0700 (PDT)
X-Received: by 2002:a17:90a:d446:b0:3a4:7938:844d with SMTP id 98e67ed59e1d1-3ab3ace27e4mr6220106a91.64.1791807410745;
        Mon, 12 Oct 2026 05:16:50 -0700 (PDT)
Received: from [10.239.221.166] ([152.57.95.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm14600949a91.10.2026.10.12.05.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 05:16:50 -0700 (PDT)
Message-ID: <fe6fe48c-df09-41be-acff-bbae33454bd9@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:46:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hari Chandrakanthan <hari.chandrakanthan@oss.qualcomm.com>
Subject: Re: [RFC PATCH net-next] netfilter: nf_conntrack: add ct expression
 support for netdev egress chains
To: Florian Westphal <fw@strlen.de>
Cc: pablo@netfilter.org, phil@nwl.cc, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006085844.2694120-1-hari.chandrakanthan@oss.qualcomm.com>
 <asTd69Buuk6PisMl@strlen.de>
Content-Language: en-US
In-Reply-To: <asTd69Buuk6PisMl@strlen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Jdb6ZvheOKQwSpNB0OK2KARsf7zRujHi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX0yo0VP0Ar2rm
 YOiXJhX62OiMThMewCgEIPU0EOy5+G4LGrYco8DV1XnDGDi3OYrq8taILi9SKMgA86xGIRlNdjM
 T3XlR6tGWbrkvV5sc3m6+1hPOsbQR1M=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acccfb4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=8t6FrhTGQU2+Ya5TYW0Vxg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qfHRG8P_drsoTiBz5owA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Jdb6ZvheOKQwSpNB0OK2KARsf7zRujHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfXyOs1XWfaq09z
 SNEYH/T4S/RYU8kD2npldxVnh5yuPIGEo5/i4GSupY2O1Z3cl7mgW/S9x/W5p707t31NfxLgaeG
 38zI40luqgmkmFbuT9xzhNS565P1SRZDOJukTO8nWqKCQ8TzKWvwVaspMmt50a2fRyqRRa713MB
 QdLOwFJb1w8yyJXx0+z7zXuOkSpmnHwFlC70M/41Ou+dy+kcIigqaxH1EUv6WdlwToydkzU751n
 uBnjLmAp8k/SfWugTa/JxxPcZ9N2mFp6PfYILzug+cABcsw1XWi7RBVoRqiPnn6jHoIYs0cwYlx
 MvMBylBV8Ie44T2uozUTBYmoXpSOTZSltJ3/wGJ7JfsEsTe9wsFWhqMr1mCg23xni6QtOXr698r
 8nKXcdMb2nrEck6/H52VhpK9Ehl7PN975+XHVVQ5yYN62vQySBkaCtVaLiW0Dhp7ilTE4jN6nfV
 qWsNKRE8djz9t7Lvx9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120048


On 10/6/2026 5:09 PM, Florian Westphal wrote:
> Hari Chandrakanthan<hari.chandrakanthan@oss.qualcomm.com> wrote:
>> Add support for using the ct expression in nftables netdev egress chains.
>> This enables QoS policy enforcement at the netdev egress hook by
>> allowing ct operations such as copying connmark to packet mark.
> Ok so far.
>
>> Add an explicit NFPROTO_NETDEV case in nf_ct_netns_get() and
>> nf_ct_netns_put() that enables conntrack for IPv4, IPv6 and bridge when a
>> ct expression is added to a netdev chain.
> Why?  The egress chain is passive (its a 'read property off ct'). why
> does it have to turn on conntrack, let alone for bridge too?

I agree that enabling inet/bridge conntrack solely for netdev/egress 
would be unnecessary overhead.
To address this, as suggested by Pablo, we are considering enabling 
conntrack lookup/creation at
netdev/ingress. This would allow netdev chains to access conntrack state 
without requiring conntrack
to be enabled for the inet or bridge families, avoiding unnecessary 
overhead for netdev-only use cases.
Kindly share your thoughts on this approach.

>> Restrict ct expression use in the netdev family to egress hooks only, as
>> the connection entry is not yet available at ingress.
> This makes sense.
>
>> Sharing this change as an RFC, to get feedback. The patch has been tested
>> by configuring nft rules at netdev egress hook to set ct mark and copy
>> ct mark into skb->mark. Also, the patch is validated at netdev ingress to
>> ensure the nft rule with ct mark set action is rejected.
>>
>> Signed-off-by: Hari Chandrakanthan<hari.chandrakanthan@oss.qualcomm.com>
>> ---
>>   net/netfilter/nf_conntrack_proto.c | 26 ++++++++++++++++++++++++++
>>   net/netfilter/nft_ct.c             | 22 ++++++++++++++++++++++
>>   2 files changed, 48 insertions(+)
>>
>> diff --git a/net/netfilter/nf_conntrack_proto.c b/net/netfilter/nf_conntrack_proto.c
>> index 7a40e4e0e33e..b8ee46262901 100644
>> --- a/net/netfilter/nf_conntrack_proto.c
>> +++ b/net/netfilter/nf_conntrack_proto.c
>> @@ -587,11 +587,36 @@ static int nf_ct_netns_inet_get(struct net *net)
>>   int nf_ct_netns_get(struct net *net, u8 nfproto)
>>   {
>>   	int err;
>> +	bool bridge_acquired = false;
>>   
>>   	switch (nfproto) {
>>   	case NFPROTO_INET:
>>   		err = nf_ct_netns_inet_get(net);
>>   		break;
>> +	case NFPROTO_NETDEV:
>> +		err = nf_ct_netns_do_get(net, NFPROTO_BRIDGE);
>> +		if (err < 0) {
>> +			mutex_lock(&nf_ct_proto_mutex);
>> +			if (nf_ct_bridge_info) {
>> +				/* Module present but hook registration failed.*/
>> +				mutex_unlock(&nf_ct_proto_mutex);
>> +				return err;
>> +			}
>> +			mutex_unlock(&nf_ct_proto_mutex);
>> +			/* Bridge module absent, netdev egress handles routed
>> +			 * traffic too, bridge conntrack is only needed for
>> +			 * bridged frames.
>> +			 */
>> +		} else {
>> +			bridge_acquired = true;
>> +		}
>> +		err = nf_ct_netns_inet_get(net);
>> +		if (err < 0) {
>> +			if (bridge_acquired)
>> +				nf_ct_netns_put(net, NFPROTO_BRIDGE);
>> +			return err;
>> +		}
>> +		break;
> I don't understand the need for this.  Conntrack needs to be enabled to
> track, but your use case makes no sense if conntrack isn't being used
> already.

As mentioned in the response to your earlier question, we are looking at 
enabling conntrack
creation/lookup at netdev/ingress instead. This would establish the ct 
entry earlier in the packet path,
making it available at egress without requiring the netdev family rule 
to initialize conntrack for inet and bridge.
The NFPROTO_NETDEV case in nf_ct_netns_get() would then be simplified 
accordingly.

>> diff --git a/net/netfilter/nft_ct.c b/net/netfilter/nft_ct.c
>> index 3c4c2faa7398..e90e73475b0c 100644
>> --- a/net/netfilter/nft_ct.c
>> +++ b/net/netfilter/nft_ct.c
>> @@ -649,6 +649,15 @@ static void nft_ct_get_destroy(const struct nft_ctx *ctx,
>>   	nf_ct_netns_put(ctx->net, ctx->family);
>>   }
>>   
>> +static int nft_ct_validate(const struct nft_ctx *ctx,
>> +			   const struct nft_expr *expr)
>> +{
>> +	if (ctx->family != NFPROTO_NETDEV)
>> +		return 0;
>> +
>> +	return nft_chain_validate_hooks(ctx->chain, 1 << NF_NETDEV_EGRESS);
>> +}
>> +
>>   static void nft_ct_set_destroy(const struct nft_ctx *ctx,
>>   			       const struct nft_expr *expr)
>>   {
>> @@ -732,6 +741,7 @@ static const struct nft_expr_ops nft_ct_get_ops = {
>>   	.init		= nft_ct_get_init,
>>   	.destroy	= nft_ct_get_destroy,
>>   	.dump		= nft_ct_get_dump,
>> +	.validate	= nft_ct_validate,
>>   };
> OK.
>
>>   #ifdef CONFIG_MITIGATION_RETPOLINE
>> @@ -742,6 +752,7 @@ static const struct nft_expr_ops nft_ct_get_fast_ops = {
>>   	.init		= nft_ct_get_init,
>>   	.destroy	= nft_ct_get_destroy,
>>   	.dump		= nft_ct_get_dump,
>> +	.validate	= nft_ct_validate,
>>   };
>>   #endif
> OK.
>> @@ -752,9 +763,19 @@ static const struct nft_expr_ops nft_ct_set_ops = {
>>   	.init		= nft_ct_set_init,
>>   	.destroy	= nft_ct_set_destroy,
>>   	.dump		= nft_ct_set_dump,
>> +	.validate	= nft_ct_validate,
>>   };
> Not sure.  Whats the use case to set connmark, labels etc. at netdev
> egress stage?  I think use case was to READ those at egress stage
> to set skb->mark etc?

One use case for setting connmark at netdev/egress is when flow 
classification itself is performed only at egress.

For example, in the WiFi QoS (SCS) use case, the Access Point can now 
classify the downlink flows
destined for a client at the WLAN netdevice/egress hook.

Classifying traffic at the netdev/egress limits the operation to packets 
transmitted through that interface,
without impacting traffic for other interfaces in the system.

The resulting QoS classification metadata can be stored in connmark at 
the time of processing the first packet,
allowing subsequent packets belonging to the same flow to reuse the 
previously determined classification state,
without affecting traffic on other interfaces.

>>   #ifdef CONFIG_NF_CONNTRACK_ZONES
>> +static int nft_ct_set_zone_validate(const struct nft_ctx *ctx,
>> +				    const struct nft_expr *expr)
>> +{
>> +	if (ctx->family == NFPROTO_NETDEV)
>> +		return -EOPNOTSUPP;
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct nft_expr_ops nft_ct_set_zone_ops = {
>>   	.type		= &nft_ct_type,
>>   	.size		= NFT_EXPR_SIZE(sizeof(struct nft_ct)),
>> @@ -762,6 +783,7 @@ static const struct nft_expr_ops nft_ct_set_zone_ops = {
>>   	.init		= nft_ct_set_init,
>>   	.destroy	= nft_ct_set_destroy,
>>   	.dump		= nft_ct_set_dump,
>> +	.validate	= nft_ct_set_zone_validate,
> Makes sense to reject it.
