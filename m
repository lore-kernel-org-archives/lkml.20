Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705229;
	b=5jmkPGKwLRuMtWsTRACUyzBcmey92OfVSwSna5OhbE7ASisqfM6DxYGCuDuWHe0LHDLT
	 kFjwwaLW2DemIAdApG2udwmR59jkNrXEtyewR2J/KxWbIBcZ79uGKHuEUHgRdZz3hUjko
	 VuEHxUXUbw56IfK6fRt804pJRWuZLVHlK9W7hYqbLRII9lBUhia6BcT6VnIaSWef6tYNO
	 xhkOvgzahKwM2DC8eJaXJV20GyMoUL1RM2GNIiy2Gg1APWKttoe4D2iuZDL9VzFuP0Rtd
	 y3kGiUIqgWrG5iou9hl1ItkHo0qxoAj5F4NIHgyABkjl4NR5Ynn14h1cygouG16Y1aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6ZK4MEp+1JhLWagJOOKQAnhmLtK+F9M0oYPH1JwAIqo=;
	b=Sf5euRm1qXZl98MZcJp4jOg4/c9NJzvyLAX7GEYuHCjhPsXEsuswQUgsHP+NNyKmNWGY
	 5wsVtpqe+eXq/iRQ1qYPnp7HoM5QgVU/A5GDDKNKMyHFbkFBnMFwt7Cnpmhe+/JItVa3F
	 bF/vRgh1Kvt0pHFD+LGOOasaEC0ipWq+fGgt8vXBWoOXZzlp1Vi2folhKc8dN3G/4+xv3
	 xu/tMC+bXJDW+n9GGcYtQr3xp4V6j8hy6rjmaBMAvlOgr7StyH5gW5KpsTP0jvtXJRrxH
	 X9vltRQly4dVFnvm9kdCp03HUnEgusJcUJczqvz0ZWv/g6vjgeW20GWiWleMqu65siQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIzcpetq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kukZe6Tt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A173606C54C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A173606C54C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIzcpetq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kukZe6Tt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AACgr3161621
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZK4MEp+1JhLWagJOOKQAnhmLtK+F9M0oYPH1JwAIqo=; b=cIzcpetqGekZWhko
	Co2+K+dm5h+cI5fi/8nw6oLUIG96JJLqdgMIv7NGTUM2mjyrvlC+tC9Wogfk3LbD
	llNJsjw8AxaCbmlETQHHOYe+TBTcN8+kT2Ma1k2AUyvkQmdo53PVLQqgih62+z+C
	RftpfmkTKG5akAJEcplZfu2As5jqi1qIgCk37ZHa1/UhRVP4NwMLZQOLaGiUTaIc
	QVPLT+I+uqiYP2EaEnkeAMl0ebIURbQxF6SNPdyJ9LnepZsW+id/u0NwtuyNTs0o
	vpWrKZscLisfT6kOfHb39fiPeRcsbY+ZDwlsgeEzfO8szWs9hJm2of1I1E8qMhAC
	YgnHmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9a01r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:27:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaf3f829b3so41220185ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705227; x=1794310027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZK4MEp+1JhLWagJOOKQAnhmLtK+F9M0oYPH1JwAIqo=;
        b=kukZe6Ttq7r6DYTXpBP3luW5XadHvVG/Cw4/pZUq+ndxgzPjTz0UaHtow28oVll1K4
         7AXjfpKnCDY/b/weD3d2yroSsOe/2vHgTqFwZJ0LRaPUnCQC1YswhZMsyXa+eeSMML6G
         wtaheiKtYiVwdCF3gbaBtjsTN8ir02qJhk7kVSP9hPZkVx7uK+MBn3fBIHZqgqLLmQTJ
         WZubkw1QI0DOL+ZkGgd4T5uKLnk6jmsl48kdVxSDhfEQFnFfdqMLggg6U+R+R5K5WgD7
         h5wscDONsyojqWWvZk5EfzDGH32gVHtP6/kxdbasNoELWxDBgedquHDZ8O7pR3w1zOI4
         A/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705227; x=1794310027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZK4MEp+1JhLWagJOOKQAnhmLtK+F9M0oYPH1JwAIqo=;
        b=T0KHT3+7U7m2KuDGpH5suy8tlHNIJg3BEcdL2p/ZEAQ4jRI0RVIYYBmw2rkFaAYmUY
         tuOYpIZy/4Bkfwqr4b0IJHGdWp5C0CSJTxLyw6Cx+frovxx1MryDlXWWFPtkKGV5RgqT
         HZbC9taroDzGzDRAe87j2nAI4qcSfZ9m8FiJ19TCBnd+8TK9pu1RPNshTRpZ0MttLwww
         pyp/hMAbLir8qjpHcURpD5qHAojsmWOGpbMklRo/W0USuBOrK2OOHxODEr7ptfGTkYqn
         gTLUGXm3+NFqRgpHNxLfr/78gVNA0/LSuK/DfbI0SA+llnC0lmLvZNuJV8/kN4sHodrV
         Kzzg==
X-Forwarded-Encrypted: i=1; AKwUvBwtH8yh07v6aVd3R67gE9MuYFZCvs17qHyd4MnT2iykwWjFynoA+c5IlfL045UL+q/v2tm5FsGa3lXftEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q1lO47uxbbjV724YK2M3nGbyrBLTDy6pQt4YmGDZhQTnWleR3
	JkyGnvtZOrnYJI3HJllNhH/YrXkalFgwaOaN/TcxAZ6LIKwTM2s5QHSq9Qf+iKHWgorP6FZre10
	ccBAn2TmZRo+PmRBnbw4TNOjctfrcs4gI9r+6ZichhwKR/kYQJnCWdLW3HhcgGEST8ng=
X-Gm-Gg: AYBFou34C1R30XfjwBUiEFT2Ki6Vl3ybY+7QtBgHeiz1B2uN6hiBzt2Bt+YiMU0NhRO
	zys2ZiOSx9UTjkshg2rPFer05A7kiCchsMZ5U2p3bOF2LiPwTxzXPauaVjW+fKF8JOXcayJdccA
	RBYn2juOGhO1pz2z2dGKl0OaariAaPg7vJeH8RVTaGEs48n9U3ITMKmFgrf8ZMvRJ6SlxNZGR1a
	CmJxQLmsrcoJeZMF5tIt3fFBk3wJyiVY9dSQcUcFizPKfvNnGNGWd5XlAFTvsbsPSsjRoCEHlNH
	Uymo2LJrkeVOH02labbKpoJ/KPwzk9fTf5WuyOz6oISp3wqnD2nKQs8a9u8A1klq8p/ckrTLHFU
	8+yhFzIw0rubcBCuSHE1oIkWrCk41xs9lb+UMtmM3JbO75Vdr+8xUpQFdOtbt6PCGfdcEyHg5H2
	VUVBsGJ5WSZ8dx18RMmiS0Npp9HThZbzzFvV8Tf1sU9JOkkLALywVWmC0cO6s8/PwAsJtCvUY15
	rg=
X-Received: by 2002:a17:903:2ac7:b0:2df:ab73:7e94 with SMTP id d9443c01a7336-2eb36475385mr99038295ad.51.1793705226912;
        Tue, 03 Nov 2026 03:27:06 -0800 (PST)
X-Received: by 2002:a17:903:2ac7:b0:2df:ab73:7e94 with SMTP id d9443c01a7336-2eb36475385mr99038125ad.51.1793705226361;
        Tue, 03 Nov 2026 03:27:06 -0800 (PST)
Received: from [10.149.127.220] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052effsm39701255ad.3.2026.11.03.03.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:27:05 -0800 (PST)
Message-ID: <9400d812-c0ad-404c-b1c2-50860865e336@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:57:02 +0530
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
Subject: Re: [RFC PATCH net-next] netfilter: nf_conntrack: add ct expression
 support for netdev egress chains
To: Florian Westphal <fw@strlen.de>
Cc: pablo@netfilter.org, phil@nwl.cc, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006085844.2694120-1-hari.chandrakanthan@oss.qualcomm.com>
 <asTd69Buuk6PisMl@strlen.de>
 <fe6fe48c-df09-41be-acff-bbae33454bd9@oss.qualcomm.com>
 <as0HMjsgUvKd7dAo@strlen.de>
 <67d8e88a-eff0-4c8d-a030-b29b5d86f450@oss.qualcomm.com>
 <atISKsTHeHwAXfZf@strlen.de>
Content-Language: en-US
From: Hari Chandrakanthan <hari.chandrakanthan@oss.qualcomm.com>
In-Reply-To: <atISKsTHeHwAXfZf@strlen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IDZe7UHHBqwqE1HnDj2VhtnVG-zQtGOU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfXw8C/z1Jla4GS
 wrFfQDADvQ4lnGdvpfcy6BHetotP1x/aJDsJyyFEc9uWvOSDJi/2yOFTbM8TrRVfF4DAU7GlTUD
 O5OrvLqs2pV9Gt162FcjUb7OLNofvB8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfXwwCR9KLEVlRs
 Ck8WRcwqvs+F9ZVKOWFxPzo9AzCo55zaMBmTJfBD925xP9UQ71N10ufvOmTnqG2zgcCrCVTClPm
 /ZmHBnvTqvR6sjxj9k1L0660Mu9OpA2TjI61XWMFyndmqykKgeLZnPGvPVmbJyrnsglPwwAc37O
 H5M9jmCIJ23VZ/J8ElrUgcFbywhzJsjx0eHFuGdepOpeLr1Yc2rty2JddAO6IiDsyeige1CZql/
 UZ2XMP2R5K7lC5TWziImabcedQKpXzDZhH/cU2IMEfKpodF29tRwzUJZt026iAXxk6n831xm2eX
 HhuGqoqeChU+iVDJAc+hLi050xadAbcIijABGKlYDJoxZXYmeGe4QpXixxP4CcRD4V9VSc7hLVj
 //uQsMY4bHGZcm1jA9BCHn/InC4+660WHwFkwltSe0gP0HRlyBUcLuWA7jcL1VJetKAcht9wVYd
 j2FH96KNbWhzLN/IseA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9c50c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=saytb5X9iVpQGUYAlOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: IDZe7UHHBqwqE1HnDj2VhtnVG-zQtGOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045


On 10/16/2026 5:31 PM, Florian Westphal wrote:
> Hari Chandrakanthan <hari.chandrakanthan@oss.qualcomm.com> wrote:
>> By netdev/egress only, I mean that the nft rule with a ct expression
>> (e.g., ct mark set) is present only in the egress chain for a netdev,
>> with no other nft conntrack rules in inet or bridge chains.
>>
>> For example, it may be possible that only rules similar to the below
>> nft rules are added at the netdev egress chain, with no other ct rule
>> in inet or bridge hooks.
>>
>> nft add table netdev qos_table
>>
>> nft add chain netdev qos_table wlan0_qos \
>>       { type filter hook egress device "wlan0" priority 0\; }
>>
>> nft add rule netdev qos_table wlan0_qos \
>>       ether daddr 00:03:7f:01:50:65 \
>>       ip saddr 192.168.1.10 \
>>       ip daddr 192.168.1.20 \
>>       ip protocol tcp \
>>       tcp sport 12345 \
>>       tcp dport 443 \
>>       ct mark set 0x10
>>
>>> Where are the skbs coming from, i.e. though what pipeline?
>>>
>>> Bridge?
>>> Routing?
>> In the use case that we are trying to address, the device is a Wi-Fi
>> access point router. It receives the classification rules from a Wi-Fi
>> client device for QoS prioritization of down-link traffic to the client
>> (n-tuple to Wi-Fi TID mappings) via SCS. We would like to apply these
>> classification rules on the access point router using nft rules
>> (ct/skb mark set rules) at the WLAN netdev's egress chain.
> I still see no reason to ever conntrack.  Is this for 'sticky'
> skb->mark ?
>
> I think conntrack for that is waaay too much overhead and would
> use a nft map for this.

   As I understand, an nft map would work for a fixed-tuple classifier 
requirement
   (for eg 5 tuple only), but the Wi-Fi SCS protocol  allows clients to 
push classification
   rules with anywhere from one to five tuple fields. In a real Access 
Point deployment
   with multiple clients connected simultaneously, each pushing their 
own classifier
   rule sets, using maps would require to maintain multiple maps per 
client and
   keep them in sync with client connect and disconnect events makes the 
management
   more complex.

>>>> To address this, as suggested by Pablo, we are considering enabling
>>>> conntrack lookup/creation at
>>>> netdev/ingress. This would allow netdev chains to access conntrack state
>>>> without requiring conntrack
>>>> to be enabled for the inet or bridge families, avoiding unnecessary
>>>> overhead for netdev-only use cases.
>>> FWIW bridge conntrack is already problematic (see recent RFC patch
>>> to refag in INPUT, conntrack is pretty much routing-only.
>>>
>>>> Kindly share your thoughts on this approach.
>>> I think you'd have to explain your use case.
>>>
>>> I thought you only want
>>>
>>> skb-> mark = ct->mark
>>>
>>> from egress. That would imply something else already enabled conntrack
>>> anyway, else you'd have no conntrack marks set that you could read.
>> As mentioned in the previous comment, in the use case that we are
>> trying to address, the device is a Wi-Fi access point router. It
>> receives classification rules from a Wi-Fi client device for
>> prioritizing downlink traffic to the client (n-tuple to Wi-Fi TID
>> mappings) via SCS. We would like to apply these rules on the access
>> point router using nft rules (ct/skb mark set rules) at the WLAN
>> netdev egress chain.
>> The nft rules at netdev egress chain achieve the below functionality:
>> 1. If connmark is not set on the first skb seen by the rule,
>>      perform flow classification (based on dmac addr and n-tuple) and
>> store the result in the ct's mark via ct mark set. Typically, this rule
>> will be skipped when the connmark is already set for the flow.
>> 2. If connmark is already set (for subsequent packets), copy it to
>>      skb->mark. Ideally, only this rule should be processed by the vast
>>      majority of packets for the flow.
>> There are three advantages we see in this solution for this use case:
>> 1. We wanted to avoid incurring the cost of n-tuple match for every
>>      single packet at the netdev egress hook, by applying the
>>      classification rule (tuple match and connmark set) only for the
>> first packets until connmark is set.
> Hmmm.  Conntrack has overhead.  Did you check that bringing
> in conntrack into the picture really saves cycles?
>
> If you assume conntrack is already active anyway to provide NAT, etc,
> then my point is moot.  But in that case all that is needed is to
> permit retrieving ct->mark in netdev egress chains, which is much
> simpler and doesn't require conntrack enablement.

I agree, in a typical AP deployment running NAT/firewall, conntrack is 
already active, and
that is the case we want to address now.

I will revise the patch to simply allow ct expression evaluation at
netdev egress chains without enabling any conntracks.

>
>> 2. Adding the rules at the egress hook of the netdev restricts the
>>      scope of these rules only to packets egressing the netdev of
>>      interest, without incurring the cost of processing these rules for
>>      traffic egressing on other netdevs in the system or other hooks.
> I think that IFF you really need to bring in full-blown conntrack, then
> Pablos proposal makes sense.
>
> However, I think that we really have to make many more changes to
> make this work, even to existing bridge conntrack support.
>
> As-is, bridge conntrack is no 'works out of the box' solution, it
> requires extra setup (conntrack zones) to separate VLANs or you risk
> unwanted cross-vlan-traffic.
>
> I think we'd have to bring at least the vlan id into the nf_conn
> entry and auto-separate such entries if request is coming from
> bridge resp. netdev hook.

Yes, we looked into this. Without VLAN context in the conntrack,
two flows with identical 5-tuples on different VLANs will share an 
nf_conn entry.

We looked at what is needed to address this: the VLAN ID needs to be 
carried
through the full conntrack pipeline — tuple extraction, hashing, lookup,
netlink support for userspace, and flow offload.

We will work on the basic support for this VLAN solution and submit the 
patches
once they are tested to get more feedback. The patch to create/lookup ct at
netdev ingress support would then depend on it.

Does this direction look reasonable to you?
