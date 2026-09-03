Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3592B3F3288
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417671; cv=none; b=I7oWuDNxYlnbHj+NywSaOp80jPScRIdiOr38ipRX36FMksRKSYkgsELFsKFnU7GsZ/9RBRAKDalIX+3odEXHPIiq1aYXMwYTcuzG+7WPrQ+1/55+ljrZHuKYA511uS8yp6W7JklrkULrMnfy8BmiavfKUucuxSjdPLTp5KZi6LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417671; c=relaxed/simple;
	bh=Ls5xqUmeAmTLmj3AmZZ0s/A25Eqwbt6dYckNCixgm5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4eclkuX4ohgsqNoi7sYgJQmCdK0vhFM04Y9N09PPj3arolhJ5fKOtu0F9X6RlBC1q+ukq3q8FD+lR2nsIEC0drXfnSgBpkyZmIZ/epL8Q/GJNsspKdzCxCmQKeu37eAeDxrY09N1sLmbzZZhXUOHJmYRNyCJ5i4J/MkI9Fgs4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/Mj6gOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dj50SRZl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/Mj6gOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dj50SRZl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lT5H3114002
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 06:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oGlazNlVh8Ae35ZhxfzQkmJc86P2MjFpqzNS1CcBjo=; b=H/Mj6gOcB8L+wQKy
	s5WB6jpiIl6ognzbyOpD0YN9m/so+EtlR620Zi7FkWiLgCtwGV7ZLn1D9B8YQbBA
	kX0vmcOOnC5jhvW9AE4DZ+SmHmvBXR3HyUONhVBfx8awwfZCVztec8jvTdQcjeUw
	vrEBcmYPOZP4L0aq96NeOUNrNLl0oj6FkJS9MVsJrw7QXlRoyuyCVziCMju6Mudl
	AkNje0P5awCVeoS38zCPSdRJIIGUPYcbdmdEaNVl4CpGV6yIx1X0brLKsk4LBhyi
	ZD8GnfSDjf2THUlWYunpdD+F7BQoTD8ttKkRswZadZgqTDzaAaDAkFK640YGrv2o
	wJOzBQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjrqfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:41:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso2483996a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417665; x=1789022465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oGlazNlVh8Ae35ZhxfzQkmJc86P2MjFpqzNS1CcBjo=;
        b=Dj50SRZldQQQh84vo6FVIsRt9doonK0DA9e1s1VLul2b1z72nN7X096SvUcYxnzq9t
         9Jfox0x4BqQqsm2wmRcHGu74nmrWX2nFa9LGacJl/e+EnItxIhuQ3Fc9DSG1BpwaixQg
         ytcUmD9KqZHY5S/oIW/ho1QRZMyswUt5PiKYhYuLZtmiTWj7p7exL29c0ZOR/GHHxAgv
         iM1bU+8BM6z99VmYvZQy+PhwRb0fJXMJ7cqtp6lZm8YchzAitupMY+6HzbGBlMycDRn3
         /KaowdCIr5XR+XtQSHLDImzlg52iVztwTK5ywO2xCMxK0jPGrWXGYNSmmVCe/BMr/OnU
         /xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417665; x=1789022465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oGlazNlVh8Ae35ZhxfzQkmJc86P2MjFpqzNS1CcBjo=;
        b=ZXpSNocMhqHp34NCb9xQg5Y++5aHmu9ZW55S6tC7DMCpDqxMksjWLSTcqXWGP6RaNf
         AtWvJt9B85O90eaDyUyXYVT3y1kUXC+n0ozcuGrQei1sdTbPHJ25R3ONhArsdZ1Vy3CQ
         2nuKlQ2dy++6J8ekmWMIAIY1Em/CuaPMEvRjb32R62KoluEwzp9J7j/2sH5UVfbbmvPL
         HVZsLPICCpisMyQZ93ktwML/zTxHEqUwa0GOrV2wfN79LstiZ4GrZSrDHFXRfyfwtR8y
         ZtSsqVCMZ7Viao0rbRe5R3tybGVcuU/TdIXWFTADcZw3iUY/bschXJlmOmMLVujL3JH9
         MrfQ==
X-Forwarded-Encrypted: i=1; AKwUvByAzVayoRBvp6edNxGIKT/ekdl5v2HtFCVXvxpUGty3mUyfQVQXaMzVR0cLDZGRAmiYe4HDjt/QdDw8zow=@vger.kernel.org
X-Gm-Message-State: AFuF++mHaiRT6qevpbdpoPlVNQS6RqlIc5OKWH7QET9CMlRCWXxq4ncI
	el3LTZeeeJj1i9bKjeh+18pNDu+wPi/oS5cAosIQGRpOiym5yY8ps15Gg7ICkOK3HH7x6FYZxUa
	XM5woeMrmVMoTho9vD42B6gWrwYUAhFUgzVPyJZuykInxAvCgjEmnCWBxzgfUW7JZHKo=
X-Gm-Gg: AYBFou1iECHOs+jpSlySbVyumYrzwh2/DLCOWHXyudedKOGlIsI1JbXNFSH2/VOj0VI
	i4JRJUBqKbnv/VWbNJwe5XETNz+qyBLI4s1AKBLTRL/aT7AtAdKYyO0kvkmgpEjNRPXZIWA12zC
	oUSmsdvraFOjryZZ3Xi3Kor/a/8/gPZOlJV7yhnZ4LxjJxtpJB+5U/+5HTJJFZArTsEyA2e3tSM
	LQb635DCEgi3pog0rM3j+kZLMsqNHQs3/Xcyo0LbUXbTqEoXkpEHcy1GpdUT1tnY/3cEhVNaE+t
	SeYCXl5sXefTZjERKvBWcbMoXW1aZr/NzzOIQlNXGJaGaX7EUCzs4B7PtLK28iF0Kn8bq1GUi57
	XNH+SIlZ3pK1W11E84EG4CE5zNN7MYjJd
X-Received: by 2002:a17:90b:35d0:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39aee10890cmr16128781a91.18.1788417664904;
        Wed, 02 Sep 2026 23:41:04 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39aee10890cmr16128682a91.18.1788417664257;
        Wed, 02 Sep 2026 23:41:04 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.111.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534e83csm3931460eec.10.2026.09.02.23.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:41:03 -0700 (PDT)
Message-ID: <60fae28e-73fd-4436-8dd3-bcedfd5f19cd@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:10:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: qcom-geni: Clear stale TX/RX buffer pointers
 after GPI cleanup
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260902-i2c_double_free-v1-1-0f582ef32e55@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260902-i2c_double_free-v1-1-0f582ef32e55@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfXybqiocZkojm6
 +aQY63kvjDzG7KRTN6fQ43ftvQX0kGn0g0UMVT/aAaceRkU8n4NF7IBCqBNbctsWOTueJDgxY7v
 jB/MLhitxYG6hk2eSe2CQ9l8YvVl/mi7GvO5Cs61XjN2HDLHfyKJk1CLev7DGXwqtfFTmvLzKv8
 XHRQDCLy+cykltrcWhcZyHnAia3T4+AtsiKbcVyKvpSQ0YT7PUZGqTXyPX0YA/HqwrCMgw/f10b
 Sllsz/S9HmhH+az3GZz6Bq2T2VusiwYzFVyg1RC3VhXkohUmroZ0Eb9T0si4b2gUBn+v9qBPKgO
 1p6SVWYdHuV5GyafCBsmFI4CdR1II/ChtGXXWrWuXZ6ARldenj033R7DSpDN17z344roJvSDKkj
 BFT/9z8foihCdqmC8l0IiWQFRGv576R7hIrmjUNNmbDOuFiadB22CPhwM37YwH5usK5mXJ54UvO
 w6aH5kHD7RpHbA1qHUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfXyLC4nK0k8KLc
 OYlGzaCG0Y/qGPUrWDl9P8onR7pazpofRyDG4Xnled1tEkWy7UOZxwZ1bDq0bkHZCJsOYbJ3y49
 NsChs46tmJVmDyo1juRYyJYYd5bLtB4=
X-Proofpoint-GUID: 9Ku-cGcD5VK2GhttiI55Bb8fl-Z8XVT1
X-Proofpoint-ORIG-GUID: 9Ku-cGcD5VK2GhttiI55Bb8fl-Z8XVT1
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a991681 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Z/g59IqO3Gki/5UUpFMnLg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=a3YfMl8QDvillJtbYr4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

Hi

On 02-09-2026 20:15, Aniket Randive wrote:
> The TX and RX buffer pointers are reused across messages in a GPI
> transfer. After a buffer is unmapped and freed, the pointer is left
> unchanged. A later message can reuse the stale pointer in the cleanup
> path, causing a double unmap and double free.
>
> This can happen when a READ message is followed by a WRITE message,
> leaving a stale RX buffer pointer behind. A similar issue can occur for
> the TX buffer when a mapping or allocation failure prevents the pointer
> from being updated before the error path runs.
>
> Clear tx_buf and rx_buf after unmapping and freeing them. This ensures
> later iterations and error paths only see a valid buffer pointer or
> NULL, preventing double unmap and double free issues.
>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 942cfeee99ba..4965872b47d5 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -911,10 +911,13 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   			goto err;
>   		}
>   
> -		if (!gi2c->is_tx_multi_desc_xfer)
> +		if (!gi2c->is_tx_multi_desc_xfer) {
>   			geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> -		else if (tx_multi_xfer->unmap_msg_cnt != tx_multi_xfer->irq_cnt)
> +			tx_buf = NULL;
> +			rx_buf = NULL;
> +		} else if (tx_multi_xfer->unmap_msg_cnt != tx_multi_xfer->irq_cnt) {
>   			geni_i2c_gpi_multi_desc_unmap(gi2c, msgs, &peripheral);
> +		}
>   	}
>   

Reviewed-by: Praveen Talari <praveen.talari@oss.qualcomm.com>


Thanks,

Praveen Talari

>   	return num;
>
> ---
> base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
> change-id: 20260901-i2c_double_free-09ab0b97e61d
>
> Best regards,
> --
> Aniket Randive <aniket.randive@oss.qualcomm.com>
>
>
