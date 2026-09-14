Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B933B7B9D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419080; cv=none; b=VZWOP1miI6NSgTNRol1ry85cGM7x6g1TngEt0ptLBYsX+U77lxSaqGPl8xiCbCxmQOdbr2THF7P80pU6e2guvA+R7npVDIqbM3V+l3WoDo8KEwZw5oMwrpgQUIDbM6vIrfqRFCmmDY1AhG6e9E31n4l4lLeDU6EkA7/qQgHE7mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419080; c=relaxed/simple;
	bh=QCGrHCrm6z85xo0wCTFxqu/1/t2FJyTJAeiwiDlU8oo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FPwHy1h2xfnYEihtFFz92ygOxRtEjWiPvM/hjYxxCXdkOStwYLHanVL6wbTmhcKKhAMO4/Kgulu7X0MM6S9Pg22gOaoXrKWxKFEWqAUYYwpCgEZ1vClhgpGWlgf7j29ayYbrwIsmZuHysQhJ1sOJygkk4BUgWwKnKS5102sRCoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQK/e0NK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRRESOMa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQK/e0NK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRRESOMa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYR5t1485170
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=; b=XQK/e0NKNXsxiviu
	MFJhMw7Dvif4XKGgod9mheacclpN9cy+xFxs2bWKF5XHJNE47uuq1nS/WiXbKOS2
	XJqTDvR+Qtb6RQeeI4zEmar/U3LidHzBz8zpTEjt+Pb8kop3MpH/4b00FHa4B0p9
	whg1M5sfPfqDeAHHn68p2nyAGnuBxltiWm2T47QDDG0IQ0jNUBEaVMGQu3WN5GHn
	4zBQ61S5XS+KFiqV3zf6gKXbh7UiGz7PA6YAGE3BFlG4gmpvaqSAlzdHrnGRtZdW
	Kq7M+i+W6WdRjetOAxgoOrdtQmxt8QtoCbPLIZJf6p3JjohfzbUX1r4AYFYqGoYU
	sz9XfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kt8x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:51:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so9174095a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789419076; x=1790023876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=;
        b=WRRESOMa1pDvnwayM3hm11mvX11kPTASg2XBSBriHGQ6IwLlaM0brSgzsGxr3iRwnh
         prWHkSZW1Tr0qWN45qOQX1H+beMUPO7XtUJH9UA95v7/43Ll+LrJPtoNAJ9IiRxBJN4r
         NQypZP86R/G1R2p+2D1HQ1FLL2c92jYa1+QwOv48zKW6MnzDiBCaSTpiJGdnYtII05yQ
         7hhmwmKFx053bxki7Z6dTVanYpPtJSMCLjMqdYJOWUXnocBZTs+va/OFXpehA1dx3eog
         C45i4nEDJEzDpbJe90w8kQUu3uIu0L/dNe5ft7xs0uFN9SK+SsVSMjiil4HBsyAFW6C5
         OM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789419076; x=1790023876;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=;
        b=k4CJHc3Of1nUhA4aNCPQdWZmIOOlOwqm/Wt6d8OdvGnhNVrr/1GsXnJ5nqpWtuytau
         r7T5px7KJ4KmfFs0KLMYf4sysbOmBjx+xpuU5ZTllCDrATbH9B7qTUTHTFcsw9xRpHfm
         X5AYIjUyzms696SrImDIx3P2WEXBGfgZc+Q03m8qyJs2URNBRXby4ljk0oSBma3bI/eE
         N09NqP0YRj+kKRPll7wY7A5yA8Je2MhQjbVCTsXrh8/X/sEkBTr9zFrq+jSQptpZiYKE
         4nXER/2W2ndcaZe5EsKNyA5hJW+JWuGdeabJ6QZaceZ6hjI3wLymIfZv0bAPeqRIn0NE
         9/hg==
X-Forwarded-Encrypted: i=1; AKwUvBxOFcG/KkMsndsNFtbNMYLENqbRu/u9SQMTbBG6tQKYeQFMmPL485N+a8l2Z25Mcnwbnq/jmzeXmJbUruA=@vger.kernel.org
X-Gm-Message-State: AFuF++mHeyexc6pP4cLzyEOtgdZHnxMKCseqmzTfhZrgf2YNnarkTNiN
	1L0GGpHduGeMmJ5aUJwt/UOyuh45CPwnS0VxFcJGU3VFRDf3Jta296Mh8iNdJxiCbp1Z6LUGCR9
	KAzc2xUH6CICBFkCX5mkU2MVm8tYdQgR6qynw+fd/EPUu1h9YPT0l/vtONmmXycVilbU=
X-Gm-Gg: AYBFou1bzRxo/Rr2RjuTkDWu+7PUm8OIeYsmRlPoonbo1+N1JUrhAoshOKlDMFxaFKL
	v2wxQPJ687lM+bV1YjnDkZZIQ8kU6bFQTjVqJIOKs116Q1NIiBS1gifG7doLxg8cav7YvSGzs7h
	hIaE9UAvUAIh7GMSF6hE0QKBIj1XRqdRw7n+IzjYSvtoq3plQOZEB0OI9mpdcPH4irxtKfUtvnn
	PirnLKx9yAaoMxlKerAZXQsjaeQiAzl6pINRtuapdFNFZQs/4ybnzg9qcr460BWMrGZRA1eWDjp
	c58WX6bLuKPbJOZZEGW+g2UqUlkYcjNFL1UkfkYzFBZ+eO7nfMu2xBRiEAVbeA058Sv5UmV3crl
	oP/gcNcfWy5Npz7t2jJ+q6YR97jQ=
X-Received: by 2002:a17:903:f8e:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2dd6c5d0a7emr85662385ad.5.1789419076332;
        Mon, 14 Sep 2026 13:51:16 -0700 (PDT)
X-Received: by 2002:a17:903:f8e:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2dd6c5d0a7emr85661915ad.5.1789419075896;
        Mon, 14 Sep 2026 13:51:15 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm27865013eec.11.2026.09.14.13.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:51:15 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:51:12 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260914135112.0000684b@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-7-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-7-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xnVzXVQNriWItXBnwut6F_bciPzapqsM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5OCBTYWx0ZWRfX0Hnt6SrrvnhE
 fvL+8Ijq19gFqRYfa4T1taktGQk/n9I6BeIEKMpBToyxjLNdVbmTKbKH8dW+R9jivG0bIUNgL52
 VUSjQfRnlcH9ecZbULF+92zzpZdUXzcWYhhOcm/NThwZ36w0l/oDaY2QV/9sHALIu/BxUp7qxNC
 Nsa9lGCG3kBV8v5XJ+zIMd4TgN/5UjuAuoIoYt6kgLbANNPRNgWkXTV+3afiPOcGBL9o3nHpejs
 cC1m+0VjE5sbDlXUE1LPHjF9S70sAL8D+pDkEooNEyZPxvsYq/YfvDujdGV4evv9HafWWbdVHOd
 mTFYEH7zYJ8PMf2LTrOoLQh7mPM8ORuLWUxZ89nlRIPwr2CdfZp37KgypTC7VV4w/KK8InXs5Ml
 Q1kuUt6Ff/0ZON9BnO5MYuxFBzColIMrYZVfVG9MluT1vXjLGEEi2vaiHRS1ADkFy6JFRiB/Zlr
 rNBPkREZuG/YGDZs8oQ==
X-Proofpoint-GUID: xnVzXVQNriWItXBnwut6F_bciPzapqsM
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa85e45 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Tpk7IuwJ_fedSR-JTnkA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5OCBTYWx0ZWRfX/2KqjB/MC7Db
 IPa9wNuGmFrsf8qLAiJJQQvn/0hlEoSclxDIphAEEZTARXBjRv61LtTtdPCiVZU3KBlNqhLDplr
 RpcQYZFSQAoc8X183UJ3nx0xxx2Getg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140298

On Mon, 14 Sep 2026 11:35:10 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and if RSI ABI version call is supported, create an arm-rsi-dev
> SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
> it binds to that discovered RSI service and keeps module autoloading
> through the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

One minor thing inline.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/virt/coco/arm-cca-guest/main.c b/drivers/virt/coco/arm-cca-guest/main.c
> index 80659f0885e9..7b1fa008a8f4 100644
> --- a/drivers/virt/coco/arm-cca-guest/main.c
> +++ b/drivers/virt/coco/arm-cca-guest/main.c
d)
> +static int cca_tsm_probe(struct arm_smccc_device *sdev)
>  {
>  	int ret;
>  
> @@ -178,30 +170,32 @@ static int __init arm_cca_guest_init(void)
>  		return -ENODEV;
>  
>  	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
> -	if (ret < 0)
> -		pr_err("Error %d registering with TSM\n", ret);
> +	if (ret < 0) {
> +		dev_err_probe(&sdev->dev, ret, "Error registering with TSM\n");
> +		return ret;

		return dev_err_probe();

Having that on one line is one of the nicest things about dev_err_probe()


> +	}
>  
> -	return ret;
> +	return 0;
>  }
> -module_init(arm_cca_guest_init);


