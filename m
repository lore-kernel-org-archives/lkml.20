Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D486C385D9C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329023; cv=none; b=r7WkSeAsMBUSMS+9ZGA9POu2Xm4Co5e/PKdocZTXWerNT6h/y3392Cz6UFxThLxwXkYrHYZyT1s9LbZrA7To5NyjPdDhK/MYdQVpdkFMbxJZpHzz7DjVbi8S43B4969B3hxbx66+BZDusWINic9fcNKApWHSdSkhHn962+ja/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329023; c=relaxed/simple;
	bh=o97CWqIQFcEcZdUT86XmhToxk7DsnJcoxqWppEhsMBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ViqIbmZmI6P3XCfco8SufUyJOwvkwzQgLbwp9MmzH/yeaVnSkzowcPNnquJ87TgMmVdV6+Mu3e4tLT7hwsYFWxB/1DMSVJYHmj8x0QPWYMAjIuOokum8hoZWeitBqQe1ynKAbM6sGJFBbHd0L51PmP8RQQBzj+gOGkx0Zgnow4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3j2xj3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TplpEiN6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3j2xj3d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TplpEiN6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YJpw3630639
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 06:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=; b=P3j2xj3dhal1GG8O
	ZW2h+1eZz7dqwt5vecp/mzjDW/sZpL7VbAH1Ci4mrHqF0ovJWdL6ItQQaFXLyWkB
	ko+3KmQcBFcFMNBgaqVE317y3wwGNGsE+nJP1ZYrRJHqPRxMmn49psxdELdruhFg
	j+AZIhXpstsah2ib2RowJRzBjce3numTN7spiXdqmdrvNggSUXXKGsvIK6SyE3uT
	/mWs+JG2gRMOLUCJljt2+FL2Z0/kE2z0A4TQzfT7gSIlJ6aGSEorZhX8Xh/jzECY
	dbwdayQa5/iZk5hlX2n2iBiGXUW4FYIOsSHJS1yNqO2d53YHGrsRC/glPFSG4kwJ
	FrcAgg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39cjb5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:03:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso981611a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329015; x=1788933815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=;
        b=TplpEiN6ijx/4BaNDVyQjANqVB6AaXlBDGIQY9hu3lW079TBeajb22ErvagvbHvKGA
         RTf9q+CXTEGYf2od/0/crlSuAvKMmIQG4j0tjdayr9/0uBFEOfQZFjdSY0Ftmm2inV8f
         SjZB24T/UKf0hxyKgwe9qpNjBUKhKLwKBUoVaw7surG98lNqrdGjn0NXlnY5wgGRwtBo
         RLckSD/fh8UzlRQ7SH+UtUkWNNYjz+9plj+ts9/Qj3uJN/Roqkh/8eUrU4J0tAlxPqRZ
         RcxWm5+BORT0Plm9cb85tFZSHlsJJuYTsyoj9nAbxBrPLRFS0SxuDNURAVs138/tGd8K
         lv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329015; x=1788933815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=;
        b=DnyqD40V5GjhpbERe3yoWz987KGo4PCyugtJhyXnwn/WU3DiAnbGx4uE56Kr9kfQHu
         WR4J+dSYKBS3KPHKkOHNKbeU11ix5Il2AJWxSxypcPubbuVbdLNlVjNZiQB8j4Hk3LWH
         74XHJRF2ny1vTsK3MGByb5mJbdQ/P8YNZRJ1EQHGqUJBdKDK3HCOfZMTmWS5SMem/AMo
         gZOtsvJXjlZe1fph7f1fDezfhDEV9EWFWiEKjICcTpPB/WrFXWUe/DsZtbWKrphE+Vbh
         HsyFwVvawbwhNAaXOXJOswUh+eJ/KlYIAxhK1rDHzUqLIcLlK5L4+HuF0VnBVz4+Py8i
         xRBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxc0Z8kzljdjfDo+MHOdXdRyVK5VAo467PcZLZPnDe1+fthg+ojzZK56VKUouLeh2I7lxxjfM/HaofixRI=@vger.kernel.org
X-Gm-Message-State: AFuF++kHoJ532RgsXj10wphoE1KF6ofnl1jEH3Kf7h3aInW+y7Ty2IQ+
	XqoYVK9yQxPfhjGd8V2XPKo4AqSP3batIMgrlso4Eh0dRDbC3Ha/92TohDCbOYdvwd25+Z6y7nz
	oTL1LmlZp3CCQsfJnHWfXZCMzS6QpFmN00eg4joxGUvOhmtrMdhsdAc/XGmRLfEhNc2I=
X-Gm-Gg: AYBFou1om+EiRYPOemDbhH5EGeP/dfDY/J4RHy/S3OBUgSNCmsg/F+HOnF/+xssaJ+b
	HCmchkOD4FbWxB15QppzMCm63whj4gVzp6wmpN8lDN3MGkK+HBNlXSwwA9FIrW+TjDDgi1Sg8di
	CIekO/vS/GYOE3s78cbI5PZ7B6z/bHzp1WaxvZLzdz39o79iPKVeq6QdKXKxVzzReX4Cm7kvdRU
	y0tQJQKMT8p7S5yE7a1WqahfJ5NDm5Pv/h8xcdAS2wFgXPXNBPputYLJfSoGy8a2m5wkjxSAuKC
	scaOmLH+FqlvdR5KidsaVvr2DSx7eRYAujVncrBXR08i3D374SYci3GyrUzUDH1Es/etDGNmooY
	MV4AIfYl7YnXkZU5WJpPDmVieCz/u
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr3196161a91.18.1788329015550;
        Tue, 01 Sep 2026 23:03:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr3196102a91.18.1788329015086;
        Tue, 01 Sep 2026 23:03:35 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f077fad2dsm3447898eec.0.2026.09.01.23.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:03:34 -0700 (PDT)
Message-ID: <5dce0c9a-84b1-4041-b2d1-54cbb55c64ab@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:33:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
 <c7c29560-ff28-4321-989a-e081f2870555@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <c7c29560-ff28-4321-989a-e081f2870555@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97bc38 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=LkqdXz0YFAjP81C9FE8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: BZCQZxrzMIQQ_NmzOhh2nOHpjQMqmsPh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX6eYTPT+QIWQH
 ZOdCgD36vfKKxH9ghuFXRBdwqJGuvzxDaCGHTS8hBTeRWohmXQsn2ZuzBKZfCzNQR7mIZ9mE3nW
 WaUrlu4uTDqljqp9JaXMITkthHslSAw=
X-Proofpoint-GUID: BZCQZxrzMIQQ_NmzOhh2nOHpjQMqmsPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX9o5GNaZYU1cM
 J41zCY1ne/6rwvqqRHPCjJzGKtAiiSR7Jb/9OSnUty0RwwwJ4pA2MoSBdY0lyfaY08k2dtgqY4f
 YU2DzrCJoQMTGhduxVUaKItSrGT/zZcifzrqYATLPaYHnImQeDTqB1DjMFUdcU7LJ4wnkuB6Q+Q
 rEhO873cYD49cpPWKNFEFTCKgNpB3mEMXvDIgnjsyq4ViS/EjYhNwmdGnwBQzXL0bHUe19VWT6s
 TbmWVPxyeYSs6KToxIlrVQR1BLBz88fuKD1ZM3trGQHg1x6I45FBDVa91vs4mpDswx5tTTxDysN
 Jva+rbK9nvrDFkFc9mTK4xqGqleFFYaCZ6/KHBWZvrAQJsvmVbH7lWjb5OkdrmPtg/PWYHqEFQ8
 zk2t/6IjYOZ3c2UMvucGGWXotX9j/aI4jZwaGbKwrM7j5zEzlNsezrG/Tl85S2ZzVFAZRkmVadm
 9QAuohm6ezLPbshFSLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020051

ACK, will follow in V3

On 8/27/2026 4:14 AM, Mark Brown wrote:
> On Wed, Aug 26, 2026 at 12:10:12AM +0530, Ajay Kumar Nandam wrote:
>> The APM DAIs expose PCM buffers that the backing DSP must be able to
>> reach. On existing targets the DSP runs in a stage-1 context and the
>> buffers are described to the SMMU via the iommus property.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

