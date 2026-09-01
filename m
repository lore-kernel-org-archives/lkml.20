Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD9472F8C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256628; cv=none; b=SGHJHaaadd6BZS0fhJbXMcBMDkgsgeUiKBg44tVSUTN3zWj9yq8Y5WdfTHbJe2X7usoK77Uo6F4l+l798d4JNJZnZdq0NpslioSre3jre40jelbH0FHoCLEA7Bu8dMFSZMWkbBWptYvBmMlSKu20pa1OvDLNIxp0PwoYcuN0gBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256628; c=relaxed/simple;
	bh=iT3he++A8kxWgbBGKxwXXDOge7lE5zpc2ZmxC+hzKG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sljf1DFrwaYQKVSOiujfTCoz2lsNjNNdIGNr3DEfJpRTd6tm6pELCUczNU1lq9j/hNBr/Xi06ghDgu7wQGQyzGQh5h6lRDxWIlDb3045ZavAEKEWkIRUbVBrSaid4kV01Z/nDJNhKZtY38d9xzJ7iidyXb1WJOP7pbhwOzf7rSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyhlwtMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T1kQz9qD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyhlwtMw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T1kQz9qD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179IYr2562024
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riNd+k06dt8Od8kRfBQfHabMphaZU5P9P6lFEw+XKfU=; b=GyhlwtMwNdBOEM/a
	BhEVSNxZjkjMP8mQ0gWv2XaNECMYycdZfYoWbDxZMkurbAwquFlLXATHw9zeTo/H
	ez2IaJofj4kyy/+VBadRH8x3mJ4fDERIysqDm7xPFkA6pchjMjgeftWCLjDvjOKg
	iRjeH9kVhy8ozNjpLMrjki5hLxb4mug+PihJwOXDAlMXG8KFYzZ3RHsMiiunkfcZ
	Y+zUMTSScBpQcwrNKSAX+ekLcrImRMoQsgvDrP0D0a1y8Q/RerPLtAm4o3CYshBp
	jcn6sbYm45Lt0J6Nq4rS7xEvd03E26/IKCVK02Jydyji3u3dEcYBoZTmWIXKDWqF
	grI/1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3br5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:57:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8a7ae2c2so2286706d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256625; x=1788861425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riNd+k06dt8Od8kRfBQfHabMphaZU5P9P6lFEw+XKfU=;
        b=T1kQz9qDMIqBCMdmHdoweAttzhA0OlxfQIx2hvmcvQXmNU9xndKWVpSUpWKTZnMwCl
         WOTg2unavKdqrQoVuN7GKOIXJmjENgEQUsLgHkNQHGOkUHWyCDChMSaxDAP3MEZm7wWj
         rXzxniKqzynGmVGhYlhZlP7SqaglbJL2ZuYCosA93kE48r0HqXtk2ZW3biQYNybfDdx/
         bU4wkfg8gHaD8MaRnJyO2QdAsznfzj2gbYiI9m7WjVHcA8NxJQvyYsREX2N9IhvlaLkA
         BKGdcp1WLzyT/AGjd8y9mnNzyr74m4PeMEUy378J0ztDXM/P9WpPZZWx9UC2xnyMheDE
         YTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256625; x=1788861425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riNd+k06dt8Od8kRfBQfHabMphaZU5P9P6lFEw+XKfU=;
        b=VFpWJDR4iXD42uULH9y6oeHG3gVvVBXIs0aOcPsnSulVT/JNl7D9GpCSAPUvzAEXZ1
         D8IO0heDk3QMx3oNYHYQT2jKi8sOJPoApKHhC7S7QY/nhQ0CRFdoh415tpGiR8JqWirN
         btVHrfg82R9A+jwRmnc5Y2THFKmpSGpQZ20hiDZ+XD2XcQEG674IKmFyzc8/dkJVrsqF
         UxaI6SepsLbgnBe0Nd2QAQCbFuaf6lbJTXSk4M8jjNYW6Qw8I+Igvn5nabxHqCfLCFKt
         zHJIQPwXpFpZibOjknxN0kbeRbK8t9RWivHPpA33ys2yr3hPsKTxUWu2RoU7kONHZtzG
         abuw==
X-Forwarded-Encrypted: i=1; AHgh+RqBpeHxNnXfDdrh+t8aHct9YSuyMn5YZ19ghfw2lrsRR0pZA1k2XCtBVEh58deUkFds3fVAxmdVlE7CJSE=@vger.kernel.org
X-Gm-Message-State: AFuF++ntpEEy5XBbx4FR5kfz0+LDt5o2lXBbH1cih8m794A1VmRsU5lp
	ds9py2OTJ1EUl2V6NdtNgdEqMJMrIKPWd9/wclnOGSqYfP4HY3SfEFupxpdYRBwIwrZ/E0y5XiV
	jNpQyOjd+OP9ZSSp3T4Tnpsw1lKfiM9cokWPTEumc3XMvrLTAf1s8ZROzFjhY1Yu1vYM=
X-Gm-Gg: AR+sD13mxE8xOgnxnjyFL7YnE7cqPz7Tsl5s1N6e8S9GIG4vScGZgs3Ghu7JAkNVevO
	6mt9bxEuyVk1IzBdCnaft4GSw4c/Ax+L0yEKtSY9EYGquwKDbB0YVix6Eyb7Wj6F/RHg9vwLgZ3
	RU19P4HmJ5YyTQMBMM/Ofu/r6vhDq/f5s3VA+WDLeZ6qVvvx5AJKPrg7vxw0WXj+TQnFefoq00j
	kR2eruiSo1soMci67CBWMHNKIsqYrmKhhDPpM1Em93eu3Jo45L4NDqzueOSAGxY5AQU+yapj5rY
	PCGnUBddePRD1iz0k//p6hb6AtVjTNpF8Z0mcs/liBR+WfqzG7neYvawOHF+s7qW+MxqFV8j0ug
	P9vfr+xZmqcMdZhZPOxHmhw==
X-Received: by 2002:ac8:59cb:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52fb93d5f6cmr255606341cf.2.1788256625587;
        Tue, 01 Sep 2026 02:57:05 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52fb93d5f6cmr255606101cf.2.1788256625177;
        Tue, 01 Sep 2026 02:57:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a670b25d7bsm426703a12.25.2026.09.01.02.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:57:04 -0700 (PDT)
Message-ID: <1383bc62-fcc6-4d5d-a4e3-b2b6ebadc0b1@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
To: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260831-master-v2-1-0032ec7fd1ca@oss.qualcomm.com>
 <5bb31efb-3855-41e7-b011-1a5a94fee59f@oss.qualcomm.com>
 <5be318fd-5413-4d6e-a8c0-f1b1eb35393a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5be318fd-5413-4d6e-a8c0-f1b1eb35393a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4OCBTYWx0ZWRfXw+adkNbDKK8Q
 fDuNdkzzddulgiQsb/ivJMs1EiaaApIzt/KkBtiKJBr+2as4Zo4yVn70wYj0KcXPrFYI5lkI5WE
 ALXVhvDo/9367AOCSTCt7MDtiYZPk2NhI+K0eNPjkePodRT9l/4VP5HAegp4rB9D8NeCaiXxoiH
 5828V6gEUmCWXQFw1iX2PsHn+pGZtRYgmP994SFqxUsBGJDlJw/K4u9QsblX00h4qtXq57NWmlD
 ibcYBlzhc0Egtw4N7B5Bb/TFazdldibY21pO/2TwLen3EQEFRTKoQub4SEReo6QhW2jjBLLHOQr
 Z3BgaJu2O5GvkjQ5eRJeKXoXdvYpVx8MgeX9d9PUYJ57KRLzXR7Kztc1NucYqN+swLmZzyXTfCr
 Xv5rbgrcoYohya4a+qGg5kBv4qBlH0n4K3kiK5XbBW2qNTMT6+hnkZKH0GOFz/8DkjDBs2dR+Ow
 wc2rYgn1Dy31A7DKDtw==
X-Proofpoint-GUID: jwlqJ6jG6K1OSuaXAEPQSYgF6nTgDp6u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4OCBTYWx0ZWRfX1pu6apvDkVqV
 6piP8gPzY4lHz+3Q3Ql9Q60DojVvX8IajMWSK5IJrlW7UWPlTK75wMXmW3iCBW39v/RDJeJXrl2
 Et54kjOEid5U/PuBcqQv8l38Q6Hp7Tk=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a96a172 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qbdvrbZ-FacRNNmyY2IA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: jwlqJ6jG6K1OSuaXAEPQSYgF6nTgDp6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010088

On 8/31/26 5:59 PM, Aniket RANDIVE wrote:
> 
> 
> On 8/31/2026 5:08 PM, Konrad Dybcio wrote:
>> On 8/31/26 1:12 PM, Aniket Randive wrote:
>>> The console port uses a fixed line number and is not allocated from
>>> port_ida. However, qcom_geni_serial_remove() unconditionally frees the
>>> line number for all ports, including the console port.

[...]

> Thanks for catching this.
> 
> Looking closer, this appears to be a separate issue from the port_ida fixes in this patch. The dev_pm_domain_detach_list() problem already exists in the current error path and is not introduced by this change.
> 
> Since this involves power-domain cleanup rather than port_ida handling, I'd prefer to address it in a separate follow-up patch to keep this fix focused and easier to review.
> 
> Is it OK to keep this patch limited to the port_ida fixes and handle the power-domain cleanup separately?

Yes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
