Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D8036F8E5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974788; cv=none; b=PBqqfEiSspxgsucJey0XOKmh7zFIfKpr3OMeLlI3QVz5p8cP31cKFvh5H3ag96MwUXDzu715iBF8lQePKtZ9sG+NdHXw8bfqSDBa2LByA6Y9WT9Llzx+nzFVTlGqcN9v8xa4pY6L9rtezL5LLUCJdH4+1sRtQxbU17yp3kUlX1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974788; c=relaxed/simple;
	bh=YuhMC+ikAd+pjOQay2Ig0CjXXaSBPmUs/yYHR+5uMzM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BTfIYNyB+cU1h1HmZJK6XM5/AWBP7eUtusT5oGdxbDoQ0JrdhdBdlhg+gKzzDxgE53Vmn80PnwJI7wP/Lzjw7ruFR2YMJje+i8pj3ZTDcGUkoB7DokMBpTt5OO5viRfS9YR6HOJOSAEA/F6F42e0gE2zb5ez1LHznIs+DsgkgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4CMqh96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1LFYfUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4CMqh96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1LFYfUY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7Upq2477307
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 17:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvnR5tjlXGe8UBW8k3JIMB+3DEiF8Somqt3qxNxJN1o=; b=L4CMqh96zJuXA6P3
	VTRI3yFqqw95fvKIuKcU2CC6CMLspWKcEJvHZHajWXz5OGIsGaOWQXzEe8RfCaT4
	boA7iEJSkWCEi8d7Ydk8H1+SPckgNCMkj+brCfTsGe/No5ejIxsf0AWviYC+Scmj
	tbWA2xEk4kCoXJLLZK9BThScM6zDhuOzndM3XpWWtnvrIQBVgzaWABkqQAqLElUX
	a/zpgGWtyaSR//7LKrAhGGjnDt0m+LmYU9O4Y5Oz6tq3bW+bL7yAeiHAX0rKHsC/
	5rORAWcgMsDYM9X7joFWeCvbUbtv9qU4AwoneNJXZVuuWzlXSenvP21gb4woQvjt
	ojHTOA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnsyvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:26:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3734d06dso87049995ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788974784; x=1789579584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TvnR5tjlXGe8UBW8k3JIMB+3DEiF8Somqt3qxNxJN1o=;
        b=g1LFYfUYkxYX/BfnH34DSNk7QssZ7Utd/rpiu4lX+oSm+kbSYr/uBdpSh9Y9ZMKWXP
         GXmuA1e1ing82hcf4GLZKkfjKmxQKktf0N1inQRuDUncNS4ykNGnSDuNSIofAj6buFKx
         yjOX4f6VPUC86aeYbIGyFfTrkKMPecNFBs9vMf1uF3kcOltSTq952oo/dI8NxR3trgFG
         bVi2hOCPJBYAAiibwnT2B6QeinJJIqgqP8DsMEyLnxCkr+pS+kruzackK58fXwn6IBJf
         GY03/O/LUVZmXyfQkFCNuFRKFoIUt2DXGeysHZ+q01o4+skmxJ3pzd/G1Hehr4w53WRx
         erqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974784; x=1789579584;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvnR5tjlXGe8UBW8k3JIMB+3DEiF8Somqt3qxNxJN1o=;
        b=RMi0AjDHkiozvDgdpPbV+gMXp7VOQAAt0YrST55KopT9ilMKbSinTLmQ7gM/WLFsqc
         vXfz0WmT+ds+kZeExVGd3cmX/D85+/n4yTxwWK8lAo5ZCx9eTKNENei5g1h56RrkHMrH
         ypWHWwuexu86DYvQ9lfdE1aQTZqlMN03nhKBYkd0xM6LsLT67kM1iqstFoUsJQDncx6W
         KGcWQlSyXKcfgp4eHZB5gWFAef612DsQsaWw04y70L6R0wZsNxNwMs6lShp9V28xXjWS
         x3H5YEqswtAcRPURSTsex1Zp96Cu8gw5/qME4JE4A+LtfoMqxcZlR7qIN7u0UAS5G1GR
         GJgA==
X-Forwarded-Encrypted: i=1; AKwUvBwSBvW4Gh3mcO93462mODW3AmyQQOACeBXhATbh6+sh5aJ6T0UwCCNxUO3UgXuKcIosPUKr/Pr3sF+xb3M=@vger.kernel.org
X-Gm-Message-State: AFuF++lgSdi6bPbSr+prCN1JtFG4hayhusNJz/qwoBBkAjXhplPS9P9m
	dzSlzMdfRWClOwt7YnHcqnTrNTrLRhyYE/kTuO6ZubALNHcETdjvNCzw9DFlmM5aydvXI0ZEJlV
	ZLNC2eok2JqG+iu8gu2/M2YYSaDwufhV0mamYDlUN7KSMV3n1UuLCgshuspDtUbDFgg==
X-Gm-Gg: AYBFou3zOTXE8VCPJlGv4S46kTJxFeIkAua8wLvZ3HHQTGuz9y6XKgJVm0Bp+hhVHin
	fqACUuB7SfO5wASSJx96pMBw8rgZqMnTaEG02GbVtn4Ws4s+AoR12HrPu1OShNPNkEnsPql8VK+
	SnDasiYApAaOxJzXl8izEDWc8spgqgHTS5SYZF40EKfVZ7oThz5U/pShx4JV26E1rc49Ij5aivL
	2tP5KpJo9y/4bIyAlyTUTtirbxztY8NePPjV1NjAWP+pzkNx/j2SxyPZi9tuIRhtTWxGiZECwIg
	hxen9YSPtjDIzU6k9EWWV53EJNJ52bDA8GupPYpFDdbZxeeMyDqDUU2dAeq1Bi6fVI/jpxnRKBD
	tkTv1k2G9Ppx4JbF5iS8mn/Xl3cB6jA==
X-Received: by 2002:a17:902:ccca:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2db127cc2afmr548653445ad.14.1788974784250;
        Wed, 09 Sep 2026 10:26:24 -0700 (PDT)
X-Received: by 2002:a17:902:ccca:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2db127cc2afmr548652735ad.14.1788974783562;
        Wed, 09 Sep 2026 10:26:23 -0700 (PDT)
Received: from [192.168.0.108] ([49.206.13.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b40esm77278825ad.22.2026.09.09.10.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 10:26:12 -0700 (PDT)
Message-ID: <03b61010-2210-4923-8172-545c30fd97df@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 22:55:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Subject: Re: [PATCH RESEND wireless-next 00/18] wifi: Add Seamless Mobility
 Domain (SMD) AP support
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260908-smd-v1-0-9fd2d876a1fb@oss.qualcomm.com>
 <20260908125017.0fb226c5@kernel.org>
 <404004c4c97bf776077685b7ec33a14fa777cd70.camel@sipsolutions.net>
 <80266eb9666d6106110d998cb6330868da55bf59.camel@sipsolutions.net>
 <20260908132004.29176fec@kernel.org>
 <0e950f7f0c3f5a2c1f6476e255716b09876624f4.camel@sipsolutions.net>
 <e7089219-ed02-4288-a678-660a52289e61@oss.qualcomm.com>
 <e9b36721c9e2b0b24c89c2e1b5b03b17c438f30c.camel@sipsolutions.net>
 <80b5c9ab-de1a-4170-9ea2-26242b767e93@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <80b5c9ab-de1a-4170-9ea2-26242b767e93@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0Xe4QbTR9UYRQdfemF2WoiHQlY8oBsvp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5MyBTYWx0ZWRfXyl69go0m5uhw
 Ex2qlWgihnbiopbQ4VgJ1O4dUqM5GMQwGF3WSI5jqIHWt8LLY2z6cquvoKsp5Y0O1nMYNxA6nHc
 iT3w99sK+RYSG3DiUnT5xzD8rvK+5Ws=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5MyBTYWx0ZWRfX6wlMGcYVfibt
 9aX4wPSBhVTjSj+ET8zZ+7PtBHZ8eKUqh3u1atanT/zQvOKnLzk4q7YqdZdkbAAaF6bDIz3oTFF
 SgQIFUYKhWPGNaP1PxfpUMZvoonYIn5mkJ5aJ3upuAQedLiM5jqbx5uPc21SFv8m2hbRH3hG3zf
 /+c7v0QAWJ+qfgP5qMhe9vSQ3dXulzUc8jPXfAPtW+SdB3a8uDAQ8H/nnU2WiXlfcp6ODyoTlaV
 T/eRYqn+czOJbc+QiTUwntSzNtVliulxS2PrXkCgRDzIGgiBOUR2pim/MqLYmBH41tXK1UGg1B6
 RKXGFHNE95HkMW41FGhcHfPFZWvwZ0s3Nqyax5FyA20iSPoMVmhCU/SjyE/SkF+cgkKKgXJrLMf
 5yaLFvJ8T+zErE3jw0151lRQBMNPF4RBarZlU1xQhEa/s45r+BVeSysdkfrb5PYv185f2suD86M
 cQJ2Y5mLF8axrHshQOQ==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa196c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=1GmPaZxtcqOdqSZF9xWxyA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ly1jUebXebrwMyEau08A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0Xe4QbTR9UYRQdfemF2WoiHQlY8oBsvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090193



On 09-09-2026 07:42 pm, Jeff Johnson wrote:
> On 9/8/2026 10:53 PM, Johannes Berg wrote:
>> On Tue, 2026-09-08 at 17:20 -0700, Jeff Johnson wrote:
>>>
>>> Apologies for the AI-like commit messages. Those are at my prompting since I
>>> want these patches to be understandable by folks who may not know or
>>> understand the underlying details of SMD roaming so I requested they contain
>>> enough detail that referencing the spec should not be necessary.
>>>
>>> AFAIK none of this code is AI generated.
>>
>> Did you read it? The comments (in patch 1 we were talking about) are
>> also all clearly generated.
> Commit text was AI assisted. IDK about code comments but I've asked the
> developers to be as detailed as necessary to justify the design/code,
> especially the SKB extension proposal.
> 
> /jeff

Thanks, Jakub, Johannes, and Paolo, for your feedback.

My apologies once again for the AI-like documentation. I think because of the design justification details and multiple rounds of AI-assisted reviews, the texts ended up reading more mechanical and AI-like.

Based on Paolo's and Johannes' feedback, I will come back with a v2 that explores an SKB extensions alternative and is more wireless-contained (with concise documentation).
