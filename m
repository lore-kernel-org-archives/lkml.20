Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85503DDB04
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790312408; cv=none; b=lIjntXfUBrOtrrFFI17mOb+R7hfXMQOUWoiU/rAZvjJBEJiksWBgcIxKRyDu+cablUiltxwF+Y3pNlWhGGTeRsvUKaKtR1x4zsbykzin0egyJGY/TTTmgETOPR7mCeV9xF7uQDCrojKF54K2Zd7fXqIjhK05PNRPiqXXuHQKgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790312408; c=relaxed/simple;
	bh=RtE2yICuWC2Xzmr/th2q8pMy+78oOgXrdrBPWEWIxno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSMzxfE0U6XKS4MH2+tDYdBWUz09QELyZxQBc0+DTjD0ce9RfePf6aYFJ75PNGcfVmZoyUg2gHROW6twvaVsPTojz1sIRXQg/S1tjg9mh1zha8Pbdia/uYaXuJqaPQ4fgwMjN+/tNpcnkBZ0wu4CX4LR40bknD4I/GCr6CTuYgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyRXfnyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLgB3E40; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyRXfnyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLgB3E40"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YnAw4102886
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3t+oYdWH+6ysPGxcESScSMlb82KWXBBZjf5aTFSETg=; b=KyRXfnyJwC9C8keW
	KIBTBCfJ7RL+uh01GnrQL5XFTO4vSGMYisiWGmaMSKJe5JifYI6JjUJ+iTlSukkU
	INaE35sHExeXSa8N2ndPWNBBtq+58njlHklZPOT8wRj9JGS6h4FI9Mv6GFyRKYev
	8ULMuqSuPlJ6FXUxLNMazWIdVqMwDOFSRiDP6zRWwCMNfbAVnz/nyo3ndvhAuo6B
	kIdyPV9a9ynHZEb624rQ/rYwbwVf+gDoho3FPEoXDVqmTCFtPhxiIeKDxKjnF2vR
	+CvAFXzxKe1Vwawe8GNCzSjLotz5ePTG5dUheU3uBZghzaoKxyBQy3v/diIi6faI
	mkn1vQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8tw13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:00:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso620981eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790312402; x=1790917202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3t+oYdWH+6ysPGxcESScSMlb82KWXBBZjf5aTFSETg=;
        b=ZLgB3E40ePdXt90S0ActCsEsk77GN/GPDdT1WHDuiUqh1VxCSHWWksAcb8kFsbHUsc
         9S89hXeNyTtGDZVJasK5Me46GzdNRTxjy2bBc86j4t8c5Z0OlZBXdAo4fV6lsXhm1ahl
         6UrFrp7+13KFXSA9TDsjI/XVYO2QypYs0W1MmI8D1kUUtgoaRmxBM+sdeTTSJUD4Q4Fj
         cDUZWr+/slsS84In46Z38XzCRagNzbaSQOFGT5/Vy72/VPW7j+4rRjq4lQoBaPRrflcw
         u8YOQohpRq5auqjIx3yKCSNP4F3km1e3m+nVhZp/pwCGnK5BPIKa1o3PVIzGzakQ/K8A
         Hc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790312402; x=1790917202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3t+oYdWH+6ysPGxcESScSMlb82KWXBBZjf5aTFSETg=;
        b=fW6Awj1LxazMEdCRsIkvpwfn1B7Dv3DCmU16Y+M/6zyE1U7884QS7R7Ic75QWfRaHY
         vFkSa7GS/0dUH0N429e1YPxSnMjAniiIYFqY78bD/02P9DXvkjsoBIcNKFeCtJxbsTuZ
         Ix4nGexQGnbY1SGaPpBOwtNw7x4yESa46ICO2P1LWxDpUlJ2wtIuCD9Aqy+R6oH2+Zi5
         sIbTo0SmmxN/pe0EINIzlIIPRhD+yHvhw2WrJMknx5DjO7cOriWtfSqD+J//IWs7eC1L
         qkjAf0kGpnPfhYlYDQAldFAeAtKyFwNnJW34e5nf4m50B+/kTkZMhI/8/U0lAKeFLbN7
         X0Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzcRZh0gsmZCIN/uqZhIj/Z+RFCfiYiTpp/lqWRU5D2tbnn6coZS57qp0gWwvYd+fj27dREtIYCFMN2PZE=@vger.kernel.org
X-Gm-Message-State: AFuF++nbYv4CoH5gR1N2NQywko8MAEpQXj6j+DY8WuB7QQKl+Apbaujj
	kl7uDfTSg9B9Ga52hN8NaLA1omqw4YPX6fwWWczf3q0NE0wCSfRgOyKT+OCClRHSaMd+2VBD0T1
	Wa5hNQnRruUOaMuZJmDlGm0CAGheaoXN2EpwG29UN8Lg7kfUP2v+bDyAikzPGng9m758=
X-Gm-Gg: AYBFou2fsjcEUhIEIleqOCdvS5Dg8LSqsEsWc9cgZ/qOK2GOaNC7WBcVw9tamzSKFUU
	UxdhzhUUQLka+py96vbiN8OWadPSsHR+fiTdRhOjt7YA0ndyDAaOPCrKfjP8JuTPNXdkVRM2g57
	P/1g5dfqqmI7RYbzLdBqOOo68QBYPivgyD14tjoTlhbbN3402GL1YD9NZCi3yt4Ijo3idFcRa4Y
	0F3ZLL//EiYrj6OssQ6peegllOajid51yNHyQsLFLwfLfWUF0YusLkkAkKVv7taJYnDM600eiE/
	KlYP/JtMzgDHGiHUhRYOLWAEc3ywD97euXBtpp9oXXbLeu4UjAdgxCuYHHklUDrb2nSFP+eQJu0
	/pt/S/hsd45rK0W5uNhSJqvdyQr/pfcbJHEOyt/gm
X-Received: by 2002:a05:693c:87d5:20b0:33c:34b4:85d4 with SMTP id 5a478bee46e88-3400449d085mr3558579eec.10.1790312402356;
        Thu, 24 Sep 2026 22:00:02 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:20b0:33c:34b4:85d4 with SMTP id 5a478bee46e88-3400449d085mr3558551eec.10.1790312401716;
        Thu, 24 Sep 2026 22:00:01 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407d18fsm2941091eec.10.2026.09.24.21.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 22:00:01 -0700 (PDT)
Message-ID: <fd578600-d9a7-44a5-9131-8771262f82dc@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 10:29:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Prevent GDSC power down on suspend
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com>
 <zfs6krk2whthgdjl2s2w4o5pjwimzw37afoiyrqllykrk6jugt@4ijk5iqplohr>
 <6osboej6luxekrw4okhlbf3irednx7gduhmqbzqkkgd3ldm2cn@esalet4ruwcb>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <6osboej6luxekrw4okhlbf3irednx7gduhmqbzqkkgd3ldm2cn@esalet4ruwcb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAxOSBTYWx0ZWRfX57iMZjEUUEWU
 /YPT/DP3Ap+Sb/yKnJElPsTGJ3CeIiDuk9OT6Og6PCkRuLbvCyPGbSFjobU8z6dFMMWjGpK9Uwe
 fdU1XNSntxerjydTrI2YqjN8R9KMsqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAxOSBTYWx0ZWRfXw+m3fe1dmsG/
 8TAKwp6bkVtarIrjjxkOsffBEqdtzt0RA21DZLd/LPcxFqVqQpzrzFUeAg/AFH3Un70EysIGfEm
 BebNWWZpv0OokLGPD0SCOhRVvV68EucwPgRjYLR2z2gvWLOk3cju6XGcpqzr9ShucNk+gwT4BM/
 mvs7oxldYmjWH8l1EjAs3podAJSNnV+EzU6wh7q6Qz6y/Nos73gTrD4/xaPxHwb2RDx5O6gJT+w
 cXuN0m3Gqgyoc2+Gok34lQiKTPE8PnK/uLosw0ye9dTSqUUolzGRSNyzJy6i/ek6tf8URl381HT
 DC3EBNM8ob86ArZZZUcmUlB9TmUFy/6BcJoG1qLxvHJ/hE/JXl3KPZXi9H2FALxBdB2jkCnTej9
 d0S++2iHS4YdayjB6PNymX19u/HSKT1RfQgcG7vQrGU52sYFGCSBx0HEim2c94y/FGsuXKWuTGp
 aQOkjv+4zRyc2gs2yyw==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab5ffd3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gd26oBflmgMxjqPpG_sA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: pAMLL12Be-QAJAHxyt7O-5uF8JQ8qs3D
X-Proofpoint-ORIG-GUID: pAMLL12Be-QAJAHxyt7O-5uF8JQ8qs3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250019



On 2/18/2026 6:03 PM, Manivannan Sadhasivam wrote:
> On Wed, Jan 28, 2026 at 08:13:48AM -0600, Bjorn Andersson wrote:
>> On Wed, Jan 28, 2026 at 05:52:42PM +0530, Krishna Chaitanya Chundru wrote:
>>> Currently, the driver expects the devices to remain in D0 across system
>>> suspend, but the genpd framework may still power down the associated
>>> GDSC during suspend. When that happens, the PCIe link goes down and
>>> cannot be recovered on resume.
>>>
>>
>> The GDSC is a child of CX, so by keeping it always-on, you effectively
>> put an always-on vote on CX, forever preventing CXPC.
>>
>> In fact, this is one of the reasons why the PCIe GDSCs on most targets
>> is marked PWRSTS_RET_ON (in the clock driver) so that the "off state"
>> doesn't actually turn off the GDSC, but it relinquishes the inherited
>> vote on CX.
>>
> 

Hi Bjorn,

USB host-mode and PCIe non-D3cold use cases require their respective GDSCs
to remain enabled during system suspend. This requirement exists on multiple
targets and is expected to apply to additional targets as well.

The affected GDSCs currently use PWRSTS_RET_ON flag. However, this prevents
the GDSC driver from disabling the GDSC hardware after the first enable, even
when all consumers have become inactive. As a result, the GDSC remains powered
ON unnecessarily.

We propose using the GenPD synced_poweroff flag instead. When synced_poweroff
is set, the GDSC can be disabled during suspend. When it is not set, the GDSC
remains enabled to support consumers that require it across suspend. Consumer
drivers can set this flag using dev_pm_genpd_synced_poweroff() based on their
usecase.

For the affected USB and PCIe GDSCs, this could be implemented using a poweroff
callback as below in gdsc driver:

int gdsc_synced_poweroff_disable(struct generic_pm_domain *domain)
 {
         struct gdsc *sc = domain_to_gdsc(domain);

         /* Disable GDSC when synced_poweroff is set */
         if (domain->synced_poweroff)
                 return gdsc_toggle_logic(sc, GDSC_OFF, false);

         /* Dont disable GDSC in HW when synced_poweroff is not set */
         if (sc->rsupply)
                 return regulator_disable(sc->rsupply);

         return 0;
 }

This would allow the GDSC to remain enabled only when required, while permitting
it to be powered down for other use cases.

Please let us know your comments and suggestions on this approach.

Thanks,
Jagadeesh
