Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C21488DA0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917051; cv=none; b=TAt6uDsxFSpgk+hrS0zvl1QnfFL/iXNuuUvyeIgadCCE9oiLMaSjIu05LtHMQbKCXxVyEHIYQH/01DqMKOfq4N6Jfmx5U+X6lN7SacBZ5iiRsYLFt3U0wbm3psG8X2bBU/OJZHMBjyS2Vop7qnN3gXqKWHJH2fZK6lRCHJgDils=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917051; c=relaxed/simple;
	bh=kSGlsz4/kVX/O8qL2dH1ve++stecX3FGYtYzX2OQDNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NN0/ShsuZApUgg/JCAtPiURoLpwKAYQ9K1S6m4GLeHnzZ4IODUNT+BkzgpQN1siv/qL874JyBTvDLFPQWtEZwpAfbUVnpkCZolV2J2hoYSv2uL3NuGYKlWgJa7EEQmYO6AVPNIRowKkM4bWPqg0ciY6K5nzIAIy8/fq1lZqE6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxJc2XMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5BsGHmL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxJc2XMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5BsGHmL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DI1OfU534618
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TAJ3OilOPOsiftZNwjsnJ+TIz9YE9dQrowEOurHsbB8=; b=HxJc2XMJwqPJDmQu
	OZRAgDrOy+Gs9DZy4hksAW9MZDS9tQo22XwOT3Qr9mc3uO64t07R+IvzFHzyNo/X
	JejiIwF70nvPy+UCYOiIO6e/+Se8cSxNet2oY4z6QwWSYAIDVyIn8GbiQqRR0OMh
	IRuGVxemsg/iVlDQprHHXdDAiYgvz97zu5RXQZLM+HV/9AeNXI4RIor/GAFUn0J5
	EtB+c9YAuldzJ+iR3ieek+tiliykDYoz+jhrXEMJIlEq6igpUewlycfOeh/STaTq
	Mkg/TyqjXkoApj+QlxfyWpHDGG53KGhilHMQdklMqXzXAbph5DsZSgziSh3fX+Nf
	XDPNOg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjk8sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:44:08 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1665200f4c2so4600888c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791917048; x=1792521848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAJ3OilOPOsiftZNwjsnJ+TIz9YE9dQrowEOurHsbB8=;
        b=C5BsGHmL9/ffPGp+Ni04qDlY8Cw2h9ZgKNfA/5Y23P+X/hc9+3DHrRWjyfH9sFTK5D
         8LC+uoqOrSeWldYuoLRljHYUy6HozmU2HhVBKheaJh1r43t5Fc4WR/uVFq5PqARAFqoW
         aq8wKJF+yXzDezuk1k2AZhkrJi8OwJ7h0H4dabK7Sr2pV/loAHrc1v/H7irHq5gDyDzA
         SZIXNZ1ti6Tk7POC3x56drUhFSR0Av8sviVTQ4SJDiG0NQZG33GBcd+tm3bl3A8jQKnE
         YDtqiFJpAe75GY6WSiiteYbUtyv7BjR/ODN+L86UjYCrnXyKJtnoH8JIZKoEwC87UeGV
         mYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917048; x=1792521848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAJ3OilOPOsiftZNwjsnJ+TIz9YE9dQrowEOurHsbB8=;
        b=fq9M9VU4fAwHecaeNBgnw+trkm5614kbJpTjazaEwKNmveUxAJ8pxs9OawvwLJcML/
         E/+5PaMRL733c85qC4Y+RTetAWL3ajnEzPKAuCcRiiTa6fjlPS5JJR0EC7+f5acPCAK4
         7QyL7ns/6Wh/kLNxEEPAvCuwQSHHiWNJrB6xW4NWwXsAuq3r8Vi8xM3XTLMoBf1jlx/7
         ggIY7WrFRcLd/Qecq17wtryzpPOdJ+4gim93LCY+7z9Ahdpzf5DmD7VoNl6IAKiXnGlX
         TEaRIspt1JKgqeytMagLCESBbhYRHhmqtoy6YBRcSGS+kKkzVgKG76SE1kAR3xU1bOuo
         1uWA==
X-Forwarded-Encrypted: i=1; AKwUvBydJJxN04t/KoIu1fPW5Y8lc3KVRbjSJD57YDTRJ1vW9pjEnYmKf485tAnGLLRLLuJdkHjugp42F988amc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQRs/KgzonPolvrdc1X3IrK4Pelc4+zvFs4qhvtLpubMDHe5/B
	04Gjh3M5BxazsNTxvTaCngK1Nq6Cd07u4hBSRhdFd7v7Rfend0WHtx7KVHfuVPLYAGD2sGRwsVr
	HRs7iXmnaGiVAoz9eGCBeg8Pu1WRzCNNcqJtiGFOU4L8fJVBqRePH1hTvxuyvdch3BDg=
X-Gm-Gg: AYBFou1V74t56NfqvGi33gA+Nds5ZxOMo4fARYtD89MBekNV1a/ebuYMohIroIWEVZc
	dUtE4nGHm3Q7nKB2QDEPgOwbkxuRyLEWHQBnuEpl7nLcdBld7sya5zzYWZbxwZi3LXmUfcluRTa
	NqizwLbgEabCE6OrUADP+HZmGunSJYYQCu7qLy/OCf4tFkG5Mu83COytgXhdkwCN+0DLBqdAN1D
	ubp0NgfDh8RDfQos070/QiI/r1N4HG640p6NaUEnB8TuAPDN8QeoZQjzjvIEbXTJEHUvU7oWKVB
	AU1IjEQenQRe+a/vQWt3mCEwm2xj+c2wISzHmOIirJSgSg3FqZRb9SDfP/1bQ+RqcRHSUo792D8
	vI5PUbAvh6/1s5TiTuPFxlmN20RCj+CD+oz8XglmZhpjQFZpWJA==
X-Received: by 2002:a05:701b:4588:20b0:156:3684:96d4 with SMTP id a92af1059eb24-16a5cac06f7mr19510301c88.25.1791917047284;
        Tue, 13 Oct 2026 11:44:07 -0700 (PDT)
X-Received: by 2002:a05:701b:4588:20b0:156:3684:96d4 with SMTP id a92af1059eb24-16a5cac06f7mr19510270c88.25.1791917046694;
        Tue, 13 Oct 2026 11:44:06 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm40087467c88.2.2026.10.13.11.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 11:44:06 -0700 (PDT)
Message-ID: <1fc34b15-f762-4ae0-ab3b-735d750b7581@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:44:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Cancel Sahara read data work on removal
To: Myeonghun Pak <mhun512@gmail.com>, Oded Gabbay <ogabbay@kernel.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
References: <20260917192512.56205-1-mhun512@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260917192512.56205-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HBDbkTDqZAl9v3BPu5bHlFd0hmPr-rBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfXxZrR+t4KStlR
 nKxWmlyfZ1EOEzhoHInLU9r+l1C2Ll9RGe2mM4Kb10IFRsaUllHyb9vqRDe97KDw2/ONwkooa9z
 63+URMcq4VdS/rjmniWefXnndU2c7reiQfzMsvwzp1JfWvQcx6veoHh2p96OuNhOtmjDmwDpKtC
 loRYCpLw0TGzQgnNt8yVpFlmMIWDBy2HI/w4iVokuzZK51tMMqml74IOBPa+F0lsxmq1eLzAAS8
 i6737xnblka1AVoTpb8duUrj6MFmmcSeqvVyXY3kedW37l+Z4SfrkJcIp/FnnUXdp06pTgg41Eg
 McwLRXwAi9GGcNmDaSrm5JSLra1bdeOX6yonT7dTkHyemRcYWxQ9qVXtUVaadTcfME1pERQiBbq
 UWJM267gnhoUN3LZoyFiOYs4cP8vE+j6C6KJDWEzRUtUqkIYC72k3l6KmM4rGo5p/+nWRMy8DtT
 YAA8S0LKBtq1mslSHwQ==
X-Proofpoint-ORIG-GUID: HBDbkTDqZAl9v3BPu5bHlFd0hmPr-rBK
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace7bf8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=M-qdFEnyM_m4QQ1dQMsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfX4hqVDxWO/LH7
 xZAXAOdxeHI9BizZ2tvcGtPCdqvxuTX5H4PkW1ZVyRWwVo5S6CEwOKVN/fUkP/toL7KV7Xq2MY/
 a97oeAJyu1c7xRY5a2DB7iLMNvlzhHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130074

On 9/17/2026 1:25 PM, Myeonghun Pak wrote:
> Sahara removal cancels fw_work and dump_work, but leaves read_data_work
> pending or running. The latter accesses the firmware and the device-managed
> context and transfer buffer, which are released during removal.
> 
> Cancel read_data_work after fw_work, which can schedule it, and before
> releasing the firmware. The MHI core suspends and resets the channels
> before invoking the driver's remove callback.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code. The same omission was also reported by the
> Sashiko bot while reviewing the Sahara relocation series.
> 
> Fixes: 7fb19ea1ec6a ("accel/qaic: Support the new READ_DATA implementation")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20260701105055.8D4371F00A3A@smtp.kernel.org/
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Pushed to drm-misc-next

-Jeff
