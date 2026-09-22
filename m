Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A5E556B9F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092388; cv=none; b=KDe4UxhOeP93C2zL4V02I5D9cCw6114rsCIX7dw8S4lkEbzNryHvDghT7uVqEkL150n1t44U+H9WewqA6A690STRuePbHI5k/VRo67QKRYiLZIGbeQfA8qtps+ezgajEPNmgt/SWMDHw3Ehrcrqz2Qwtcun9/dPz+IZrqtY9pi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092388; c=relaxed/simple;
	bh=+0cvY03uJx1y1P2D/+4vHDG5Zh8Iu7Oql+aQLHLkJjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXNtcAblYHt0Aoyk2PMz6xAWk2ZSYKuhqnGKlcLK0js5Fr1/QnJfTdnFWLkQqrcfmmtagSkX7IrPqrSizPXvEcHxDQACuQhWmWDjSIZewvPMI/+lefGkcHuxlmbz2gb9Ukh7RH1M1sl/6U3a94Mir55jZbML51Q5P3uioswCVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eghf+xvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSvlnhpZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eghf+xvy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TSvlnhpZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEipqe1583992
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=; b=eghf+xvy//ZOFslf
	UpveaGSVcYErvpNTp5T2vvsCG2NizpveWEYt4+MVh1sZFUIW2iXMDf2koLfzGvxw
	Fpm69AfvdrlllS+wklhM0clBw+kQXpvQfbFtAvmsRVD1aNFxJWJ9qVWsxQyRtgSF
	BXGKQlyBgfpBKL+27SAXmqIVl8sfhVa61k0bcIwLQUIdY1BfPxh68UiWB3ECDcvo
	F0ilmftXrHMrJtzTwfS8kH2Gl7yavjz7AEzq2JZ7+zalAxWcEIekePOf6j9vx4Wq
	ikbaCulpsDs8oJ4QUgeWcwrNt7hFwyzK9Q8/Byr8KrL1EiYErSIv2+l2I0RY9ySQ
	WWcGMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycsg43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:53:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db87f759c5so81070915ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092385; x=1790697185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=;
        b=TSvlnhpZNvpLiAmxSknwQ/S3c7/tpkLASCvGwb+0T+oglp5UtuTwJlG+giP3r/IBRE
         HoWgzCIfKRbjmfq4x9TxFV+VMmCssVJTKtVyLl9E3raVk5Tcb5BKxw00+ffkVv7NwHQL
         psK4B9c/7VwwuKwiL8G4Hl7lonCnNpa9ezpZ3hxVWYXCA0yWNy6l8GEULXfiNdTpwON3
         +biuKym72kirTIOM09E7HdJQeEAxgmQVJBqurRE1f4ER+oUEki6ZPF9sqVP9s/VAR8eM
         yk6vC5Si7vT2ODBcm+8cGxfN8BKTAzbHgVLx7+JbvZJVE/fr075t8YEavSPYmr2T3+R3
         OnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092385; x=1790697185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=;
        b=IOqyOsc5J6NHmkqYaJG180aDQ95FpvwzdA39NAhjRPgPquLzLPW1tMmHW3NtXHnzUN
         kxPZa90aXiCJokfhSZofHOWBWMrEvYS2d9L4D6JAXxaj/0xy1wHCi2I3SbpmImJg0pDr
         lHu07buR+kXIHxvkq8QzoQHxIa9F9HsC3egsdNTZXqvRS3DYxGJ+DDkXW0TMAWFZKtSS
         DW6M4PaeAQPJs+hpMEMuZ8RPPE1o5IkDTrcQEEuZmf7OmEy02yqDTN1+z9DFmLmLqCJK
         AqqOtRXNU4TVbKN83Mh4T1QoCLyRLjb6/QbHTnJubmKEQeTzQ5cpLdYuG2G5tYbVFbFm
         SahA==
X-Forwarded-Encrypted: i=1; AKwUvByXvWA7mm8U1+p9UrPOlvqT0zIX+Y0K3gPHvXyDD831hhnaK7zl+g4oP8qvqN6Yw/ZotGrfb3d8KGQUS+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lccqFY0B6J6q04SfAGZ+yhcYaq3MWrk7szwUwUH37aoQ/iimI8
	V1ykqpv+gaEpeSaed+ZPVi2o/gowU81rzSLngfwndggRal2yel/3fiPPAutZeU5sSyOGbujtlBs
	XhT4gmTmxMtYJKWlyySwtjmpdj58OI/6ay53e0RIw3zMlcjwDGpUUBPeqktxqYh+hTTs=
X-Gm-Gg: AYBFou0L/F/yeDVhCuZhQ/iBwvASJliU0aIOuTh2xEllanmDN9oRH35RSIDA4oN1yXd
	UMYdgCeO2pWzqZjedrCr/OzjxAC2Kn+74Em3j+aUCQAzxxlCcyxcnlMnXDflizmmTtap9CayNm9
	dsZHi7u+F+I/OVzSd/J5gxEY+fQMkjInUYz3d925Jv5TPIpN9I3MDklZjTdnS3ZmHJY3tdfwcgy
	Id8IXh5NTJFb2WQQvaRuDVe9piBR7q84+PvaIz57XrhusQGZsxYBoia5jQsm/0pezdzy8nbdIGE
	tFOnQdApaMElZlXD3xiJWUK/b45HAUL0D6svgN989V6dJOizmYKeezbUIknY1HJQ9siaezolsnT
	ZPko5pSJbcjUl9QTFT6+lpd5XZ7rQ
X-Received: by 2002:a17:902:ce8a:b0:2df:3b08:a30d with SMTP id d9443c01a7336-2df60b60b5bmr20251615ad.43.1790092385163;
        Tue, 22 Sep 2026 08:53:05 -0700 (PDT)
X-Received: by 2002:a17:902:ce8a:b0:2df:3b08:a30d with SMTP id d9443c01a7336-2df60b60b5bmr20250935ad.43.1790092384329;
        Tue, 22 Sep 2026 08:53:04 -0700 (PDT)
Received: from [192.168.29.33] ([49.37.212.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d02f7e1sm13009205ad.39.2026.09.22.08.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:03 -0700 (PDT)
Message-ID: <f8f231b6-a4fb-4f19-9ec2-949668bfd5b7@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:22:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RKi80Nvi3shGFlW8jhnJoWLgPm0OeahS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX2rKJLmc2E9Te
 WDftNMmeFal3WyzF4WXTv6Zj6gRONz3U9doiGIYIHCI+Dn0hfGe9xzMtS/+w4qAg7NgeH8Dnj96
 tgo8jeDsL3bQTVDXiJkIVV6olVS78QxKXgefXdBawOkf4h+TeZU4SJC7373RvfQeosRnRRiAVWg
 B50zNdS8XLJO/HMMvv6zbOzM4NKiLPnxBDjvvxhLCtP+A/DYNZ5hf3dm7BS77cDFm0gOESZ2oG5
 PgMfL8JCwgmTLKlBHuqe6DT0s2EqZNOhB/sm8+2WFCipxcyHnjh+dar9shr2++kbDbcOzElu8Yt
 3vTVV6RGlVlqj3hBs+XDFUUSw6CGr22t1rlNbybWW0/ZjAqAlKILU25dvwIf7MKeoDhYd2x1kp+
 AfDfwfcCleextMOt4Do8OVErxvH6QgR7oDZSJytlMLyu5J9NLJ3pysG2tFnWqx+Y8LFxQwru+WA
 pFzi42e4yJWlTfaInXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX+7PDR/Fajifo
 1fO8ZsE5fPcm+C2x097BDzwrmkta3oCPCwP0wEy6Bmh7z9DRpttPWE9HezFHDf+1fgMna3iGcaO
 5nslyrwdk8feDYgMjeFOZ+T4MGRRKZU=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab2a461 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fVbWt6ZMyMsyUNhTwytWAg==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=R4z_reooDQMcG2LTbH8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: RKi80Nvi3shGFlW8jhnJoWLgPm0OeahS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 22-09-2026 19:11, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath12k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Tested-on: 2x WCN7850 hw2.0 WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> Tested-on: 1x WCN6855 ath11k + 1x WCN7850 ath12k
> 
> Tested-by: Juha-Matti Tilli<juha-matti.tilli@iki.fi>
> Reviewed-by: Vasanthakumar Thiagarajan<vasanthakumar.thiagarajan@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

Validated in ipq9574-rdp433 with three QCN9274 PCIe devices.
