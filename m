Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E224508E9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765881; cv=none; b=IlgaJjRsW1iBirG2zQ51S6BcOY2IkGAirxAuwXzoy61yGfaCM0MGfMNnJ3KMM1xhHgiqIKKb60IvJvcGFQlAKsX+qYWhc+VwzDsvkkRB9ojJVSYm3CRzK92+69TrwoO2UyNNkaaXf/ELV+ymhi8g8+2iqldJa96DNZsISonJ8VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765881; c=relaxed/simple;
	bh=g8Vsl1EHgsRDKVc85V1MtwOll8+JTVmQkGsyc8i4j8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBVoycLTJwtKsCj9UX5uruYrqj1/Q2tkq1O2yl4BifLVEGKmmtVuu02hVLhlN/FmfcfB1jmIpZjUTD9U92sEMWV9t7jHOSnvMFjV2RLLxSm6OZCJf/7frGWG5086FeBxex2SHczOav9D8mbsjimNtruZvBi7e4PYB4RWp5iyWKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P63suP+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtSKLw0J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P63suP+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtSKLw0J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGugWo1408689
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+R6hz3Ifukcx5+qCcKIeT65fs+yH+pDKRs1un5ctVZ4=; b=P63suP+j/s6DPKCg
	ovVjzlbWXwxiFUPv7eykvOe4rjDnRgBsEQTTBhfcbLlPTjlgQBHHMEFmfA4SUANV
	3HEzgnpbs8R91lCczhlSQ4WQ3pZtWxW1rmvQNEvU2DFZkuxVCjSfCgV3LY1HJmt6
	E/Is/TnvCKITt/lfVwQ7AcatIYIP0VZRRj9QaspjNGseh8ODd154/y8QsYEs2uLY
	UNctkPxoqvmb0pVYWwcfnRbWy+0Ul2qR6c4SjESjOi/t8nA+ZVNHcVXcStCAQQb3
	Uwj9U8PV+Mu5ay00eld5g2SkjYOGijgesxx3cBpix+hCUZv4JPCqJagBVjOlKFaA
	uPFkDQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n1s6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:37:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so18121105ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787765862; x=1788370662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+R6hz3Ifukcx5+qCcKIeT65fs+yH+pDKRs1un5ctVZ4=;
        b=WtSKLw0JeMAnlc+1ZtSXQQS7fPp5sG7+De3L0ckysmWy5EnvhQSNescfpHsBbKNFUI
         5xaTHb6HeH7nD21P/N7Yl7Ifeir59moM9mi9zv/SmpF1SmxSEDdEw8Am5asIDlTbFLTa
         bZR4eq9yPGvN4c7CrFipnKKgvQ5T80Y8FHHZ0zE/KNKinfHeCS6yU1MiPgYdWccArtla
         sBSn4V4EwSNFmI5F8d0E8XLhLvjYkrgRxBMSCsIe3Ec0mTiUyEvT4y5xm/OglMRwFoVO
         XGJmb2wNS8pCQ7GD2PvnGbY2DO8+iq2tHe0E5hWCPLg7U6inEqFKqKWcVOe2QEjawvfs
         SQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765862; x=1788370662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+R6hz3Ifukcx5+qCcKIeT65fs+yH+pDKRs1un5ctVZ4=;
        b=lGjMx5bJ2b1MDxs6+SCGtwLQ/KdnJ+/BkHEdbNB2KxhYvqfJrK1Vb80f8UshYDUOTc
         gbqNTsVQ5gtgb9YJwVScKaXtV3mGIAy+9GSofghfVT7M8DsffYr6Db0e6e7bbF9d52IV
         0qw3TCyDEnZAg8UQdF/RiY8BuiLB0PaULYirMmqRj3qu2d1zUZxNizYRFkvH9B9slMH5
         26M4QZGiJMUhMEgqMJTJS3frz7vqD8UxrtyG746fVBqpO5auy6b+oc6iyXr4N3L0oW0x
         jfYXLYjvcrLAv4dstHFSlFmtrzHDdl7AYvwtbh3gNmBu1dfkzPqts3d6ZO77f9hdlvDc
         9TOg==
X-Forwarded-Encrypted: i=1; AHgh+RoWS3eQpykWdEAi+jsQPWgfArxrVrMJKcwVnzCbUHv3A4/UVw6MO/eQ2MPdz711uo39p3UFEmxIqbvetKM=@vger.kernel.org
X-Gm-Message-State: AFuF++mPTPIBi9d73cvmErfN3ewje/TeZUTOCpIqZDmeRXUt3HwrTjrz
	cpxyeEwmVtKzP32U1RRfD6OTJy5Pm9vE0/ImJNr5M0DwSJaHGZAyA4ln7QFVNXMelhYGFNikpHN
	bRIN6CI/hiV7wmN/kvRWRpbZ2TmXurKeaTjRAVLA0UNHcWpNDEunRGkWxGNKrVqfRBi4=
X-Gm-Gg: AR+sD12jL5VG4vywymBTPjpsRVnwl05Wtx7TnbeKh5jpzKcc41FzsYmVYsqAAp/+sms
	7I2uPwLzw8A9A0A9Bd6/Bh4wxkrTit/b/AAevwGi+hzRUvn2R2uWWck6b8ZCpihcdPX1dP2CNCh
	qboObCsC648ZVyJPXwhR1YJfwsWvAP+aCTIsvMSiJ1pmPyrC4z8YDjJFuggJJEq11+StmtvpsuD
	8z+J71OaoWoqSy+y0hu0ia6/1psXqeK2WNXFfIY9qtE5BZr73XQ4aTC+jQregkJ8cC/6GwggsO2
	1Lv3ZAJykg0rf+AY2zdDOD1j8w4Id8aBslLybLExWtFv9VoD3z6JNpJPooe4hmcNvZZEtyJIUW7
	8EK9NYvBsaPwmcJX0chLNsw+hdGYeG9/Feswe4+H3vMaXuWVs3ac28/VvK1eV3Ej5iJLGY4xKCk
	2D4hsgSm8ns/hSjjpTDA==
X-Received: by 2002:a05:6a20:728a:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3cf75e8e9d5mr16110490637.5.1787765862353;
        Wed, 26 Aug 2026 10:37:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:728a:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3cf75e8e9d5mr16110404637.5.1787765861893;
        Wed, 26 Aug 2026 10:37:41 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beb0f15dsm1281557a12.9.2026.08.26.10.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:37:41 -0700 (PDT)
Message-ID: <315588d8-2a82-406b-a1e5-bcd00128c545@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:07:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/12] arm_mpam: propagate MSC access errors for
 interrupt control
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-9-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-9-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZjVTe6Dn_tCToNyCL4dRFz-uBRXjSUlQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfX7leTcHZybC6w
 KS2sF2DXntebA8bTRiQ7fY68VJK66EL2lMvODx2j247NhkQu++2YLUhc8+cg095RnZ4Pv2TbxER
 VssAZXIwls7/6GEgngOD6E0JCgzNoLY=
X-Proofpoint-GUID: ZjVTe6Dn_tCToNyCL4dRFz-uBRXjSUlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfX+YL3s9aQwSSk
 IDaakjJIT+wiBNGzg/xbZjG6jBSH6iaa7sRNCg68klq6BvvQSbZxtBfUxYQpdgRa4lzHJ8gi1oK
 6xyR3/IY2UNabbX8hMWrufSUl4R9ZT8ptvJsYSBDtDqgg4v1zJoOhCBZyTj0a3NdzsiBFN32iCY
 397pl0pUqro4tb2XKshqRf+FHN76fKSxstU10MB3jSnI+fSU2pmIqt98Hld74mzKLVn4pgxd53o
 uLuYtFs2/XsPiafTz5qxwfkc9cKGPCKtP7FYt54Jp/6iw3LOP9T2aDqpQmPXBI5ZHszeZnQ3SO7
 oJpUrPElJAEEbzSKObAi3we0vl4tn+B2FjnRy0oWT/R+Mj98bYWLS7Y9fPcSpSBbmqp3yCGvFG7
 DzxbsoC3M33E5ybMlbXGq0QwfgmMZ3k4AEhSKE1KrIjVvKHD2+UAndwM7tUsck4g/iISRvVBOCS
 tSz35JZrFP2Svc7DF1Q==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8f2467 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=JeWy39_HCiB1Np-THXYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260147



On 8/7/2026 4:24 PM, Andre Przywara wrote:
> Allow the functions dealing with interrupt registration and enablement
> to check for and return errors, and propagate MSC read and write errors
> from the lower level up.
> This does not cover the IRQ handler yet, as this needs some more
> attention.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 31 +++++++++++++++----------------
>   1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 49239b15a27f..1b07f7765f96 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

