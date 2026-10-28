Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223730;
	b=EpvEjbqBsRTD3acW2k8lLdf/YNez+LEkjH6uCC6t/BRNnJ40rysyQBQ2sKaFSFQ3x0nw
	 z8A/tmpV16IivGEnaErpSCMBy8XgaYu8vc/8Epo/BviYDpcHFbJdKerhce681kY2e2L9K
	 A/Gaud9Uv7++RDPtvbupLjEESOkT6JnuMMAAyVmcYo81IZ5+P5q5oKtrlLF1wxqoFspca
	 Pxp6NJ1AVLhTaHNwlZq1v7qXJ0tD0F6jtdTK6+aPr6L6aknjzhz2dyxpRvRnK5QptVUPv
	 eB+W744IuHgQ1Rau4g9x7ltzHX0YVyS4dKSkLTIaxKMJncS5qlaPKrCv3E+HOYpluCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=;
	b=oK3hJQW5X39djwhPX7Pr6BSsw6YjxqSvaQompC/0MOoOfcVYMbNR4dRMtUraVwNZ7aZO
	 ATzk0oUDI3RXbK4WmWUPDP+3ghGc9qQjC33shfLlog1geSVSik+MjzGVoRj9OWT7Tuqu4
	 YZ3UsoONm5ZmVv9fj56qb0rgDCgy1/SftwcUepT6MzV8+l/aNCuMkXuoPfC/PlEHb0TKb
	 NO/sA/MpAtPhw4sdtGypXEasimpB5jRwqXlWjRX7Oanxk5rJ5voM4cI7++G88BSgOI6pQ
	 s6xotnMFNw3zp1oQMwlJrnqtubje1EIfHMT7QhmKENUMbvKjVroq1vGWPoN3BKlmcBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KETUDgnM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2dMd1yu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C0E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C0E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KETUDgnM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2dMd1yu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPfAK2431681
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=; b=KETUDgnMzsFH0FtU
	B8sB6yaUHUIBaLV94NO9tCO01n/MGxJ/4JhP1CfcPFMUi1+1blbOi5AOm/6UxYjk
	Cj7eR0dyK+a0RU3zYc2pLt2rl0QXQ/UKo1OD5kILnYqJvL0iNgOh0Iv2iGMvb2zL
	9BkCey3M2v+FZomI/+ZoMWwA0WrMXYYQ+2lVQyv0hAhr5tcuxtOztCYrClzDLzcB
	nMI4lRvV3FqaNXhumsm7SsGNoLAjT2hVSy4TXq8kOmAQ1XsHzl2jQ4T0R99Qx6km
	cYJG11myJNUBOrqsRnJcto2Iq/I+cNs60Kf6J2LC2X1jCs8EkSpCssp1oa4RUkSM
	60IzfQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7u4wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:42:09 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8210034ccc0so1916080a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223728; x=1793828528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=;
        b=V2dMd1yu7i1HGdSiLrtQdTuGey4TwoA9LzT2QBrn3tSeo7h57qpRbLCFsoWt9ocAyC
         VFXRlKE2NtKQONkSHbgjgBf6CcPfJB0bWREovmGOMb27XJ+O9zNG7lAaQ+Hi0mRpy6GJ
         D6WI1+C+UK0klidknxKPh5AUDyY/uXGs1EsuQioG9BdkL6y9Kgk1DNGFIevMMRI8vzmV
         0vr1OOWDOz8qXPTzCYQRZlBGgTY9txQHhUejlH2a0Gxh6Xkk7f0diAjU/xRFS3D1+IIX
         wk5HvaTsWLEdzj0C/+NNQNdtwchXs4tfOvTN52UNm5Qeatrm4ht9CtTje5/piSVqD0pz
         ZMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223728; x=1793828528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=;
        b=rF+Y52YBSGZtep2rLNOWgbFEtbxiTCbKhTCNc10Ifjw1GDet3Z4heDtcHW4riItgUi
         5D1+tq5m8Hy7CGvg5cpqbwsZrDCBiDt/p3g+GqD+JwHJN+uF1Js/Feh0Rz+6GvhLG9h5
         I1V1vEBselQIHmPGbwaW5ydo8fxwr6Rres71NFkLj+FYtP4a645rXVvQf2dt+nUn3r24
         DKvoFzzp8TP2EAs7hlSXFlORB5GRElSV6jdtAN7Qp2vyi0vTXm7Ji07OTyFhLdLAyM4z
         Kb0YgRZrzEPyS3TXK3ptIXxBLB9vWB+1jHJ0dYiOobZXGZh2YtgGDQLkIgIM+zGB0OYh
         SKQg==
X-Forwarded-Encrypted: i=1; AKwUvBzYC19irS1p6OcMCiEWxz3ipTc4t6P8Rz/uCRbSU98GhOPLAOx98F+dUKOtvAUtOKtxW2Qt5owpYzL7JqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfkW8QaPC19s3HITRqwAhCof3IRNz2DaQEbRpM84oHuNCpViUC
	1ZPKXo6BhqFUopKcre0ddy0l6jMrJ1D2UeoZegedxRv54jMnDFXAJ5YfQVeRxPOXr95NHWDdDJ4
	0a/W9VVZSswML1JMB9JIb5izq9QniM0eloBfVCtefJpowjVNwR4FoZB3wWVJRz5QFjFw=
X-Gm-Gg: AYBFou2mu+mNnIcQ8WXj9b7c5J7Q2FB0MNbcQGMF7iyEFecwA6njQ+jmWi0FI+3c9hr
	FqHP9ctK0r8eEPMHl5MJfiMnn6ki3xQRY8V8V8cuqrP/r+jKeCbr6n6h90rfd+zpf/eFpI5G3X3
	GUADqOAIMu+xjvTFiQYAJB3+TNklhdwbgkvAfQs/gGQN3D22Mma0tWaXSfbbLGA/II6LViLOl0o
	a0DWX6o959+YvNlT+eYqrJeGRIKyKtNQV+puddF6/oBqpvwxw4Fmh+MGbNNaoo9nJK8Qbqqg8GC
	2xXNuxkisE4teJO+WSgmzQs1n756tzZv31LBYkRTaHQxfbkbuiF91OU7wwm/qOz+GvakyRq4AdG
	ey+t7lWYm+Qvd7PVYFVGJNpfETJv6kdBsz+hmeyczdAH3yW3YKZlZwpxYphFoTGGtWVMMjGk0iZ
	cbfBKnVihecNx9oDD6njLNPTo=
X-Received: by 2002:a05:7300:d0a8:b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a20469b0bmr4858520eec.40.1793223233102;
        Wed, 28 Oct 2026 14:33:53 -0700 (PDT)
X-Received: by 2002:a05:7300:d0a8:b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a20469b0bmr4858476eec.40.1793223232400;
        Wed, 28 Oct 2026 14:33:52 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da675sm9672541eec.5.2026.10.28.14.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:33:51 -0700 (PDT)
Message-ID: <436a2d4e-9297-4bbf-a305-5f6913e83aaf@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:33:50 -0600
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
Subject: Re: [PATCH v2] bus: mhi: ep: cancel reset work during controller
 teardown
To: Jiale Yao <yaojiale02@163.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261021110428.4143200-1-yaojiale02@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261021110428.4143200-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae26c31 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=AskSUVmIeMB2-BZEYoQA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: AwtrOfgM1ExfH0H3Z5Quvu74DtMZEOm5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfXzc+ul5so6z9H
 vMHUVyNR8cWjlvNSssdZfmc8djAj9YzrhCfkdF6A+kfNY/YvWa4hsi1SAI7Ixus6jWyRN8ZpCPt
 1zT5orZMIWwW140FO/6yfSeybD1Fe1I=
X-Proofpoint-ORIG-GUID: AwtrOfgM1ExfH0H3Z5Quvu74DtMZEOm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfXzVF32W27XITv
 KVxul7nZgRbAtx/e7ijLoziBUjIV5BxzRgocdNdpyA2PHnUJ74xGCLZ4S0+m6tJ9eKREQ0JUbv7
 cvYS1gqkYWGeeUONoP2nO6VBHuawhiZMhl69VEpIxFfliLp9fyg2cggusjOU+JK/dlkx3nbsQbQ
 0KeLpuarL/16LhOe4bI3/4IWtUCg2b3h/McHx+mF3NIM5t7GLEq5G7kbPtHYCOurvi2eVa23/0x
 ID4aE/9iT/fOfA0dgQFkwomkM1m/0hWBg6bQxu6EkjXe1GaVWfP/D2EXrDxbalsluzMQjCV5Rrh
 DEiak9GZmVbf4tOelB5aj/3sZe7pFfe5ECLnWKmpV2zHoSJWn/rA78ioYUeMOTm5kDbuDNg5pAF
 0rOzj6Re/sndbDGSUgqSxb6qUFiY0cRD9NwTR6bpdicZEJvl90p0axwciK7PtFDQiWtbPfPBaoO
 Mz+uMzGKvv8i11FCsXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280086

On 10/21/2026 5:04 AM, Jiale Yao wrote:
> The doorbell IRQ schedules reset_work on the system workqueue when the
> host requests an MHI reset. The controller teardown only drains the
> private MHI workqueue before releasing the controller state, so
> reset_work can still run after that state has been freed.
> 
> Cancel reset_work before destroying the private workqueue and releasing
> the controller resources. The caller is required to power down the
> controller first, so the IRQ can no longer queue the work at this point.
> 
> The issue was found by static analysis. The fix was tested with an
> out-of-tree module that registers a real mhi_ep_cntrl backed by a
> software IRQ and a fake register file. The module drives mhi_ep_irq()
> and mhi_ep_unregister_controller(), and delays the reset worker until
> after the controller state has been freed. Without this fix, KASAN
> reports a slab-use-after-free in mhi_ep_ring_init() from
> mhi_ep_reset_worker. With this fix applied, controller teardown waits
> for the reset worker and the KASAN report is no longer reproduced.
> 
> Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
