Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A1747ECFB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326338; cv=pass; b=ay/YvyU6+7NcBkpfJdQyTe87bYhL+95Tr0Iu3cq0t1axjCirgibZjkRKNiPBIr6Zb9nbE25fKlkmKeZIaoUdhbRMA2DzSS3PtXs3ZBsLayy5bJjvKRasN/4GtBxmW4wWOFYnu2qjWxioy8vkEjklGI7gbvQ8IIo2Phez+3Cwglo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326338; c=relaxed/simple;
	bh=opTtenNCaXwogKEEQ9ij+bfaqJfLYpPzb8LXnpj79vA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3ft30QSnhKMfsrq1EulbN8La/X6sFHXvq4zR5R6fInFTvSfVHP0syhR5Vgz7h8A78prtlsdkcr5uvarcE3kiAdH2oXiCdIX/WJ5FArcxTiTM9jgKv5v42MreJ8xDwGgZiVDjyr/rNQdiMqfWy8H9SfbmAsBzN2Ye0wDjO2A8+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzITLKn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KP9Mmbsv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzITLKn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KP9Mmbsv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yb1V1193851
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	opTtenNCaXwogKEEQ9ij+bfaqJfLYpPzb8LXnpj79vA=; b=FzITLKn9j+513a4u
	xcz+VLAxyXK4L6uMXdE5jVGFkgGhD2M9DXsbY/74YqpH6wWmaR+CrZSHAkF0Juks
	EfHoRB7KfXqQvQdKrSvVx+YT1VSXtIDV3FIZNoTiKmGrufCULMfnhpWmkVz58gm1
	otnPHFn2bT8nTLW+e+u5VjRhZodGLElu1+XN8ETO8X+Lp5Sw3J7FZ1lVTDiqjGz1
	FsU8LrQGb8RmyrFaB/V8Y9DOWMPFvATvsB4uScYMV+hltaNRUoJVyq2sH9A35uPc
	Fk+bdkdplmkFPLX/W3/tY/rnYnYzymRAOC01no3h3XLzpDHe34YTe/K0H9JU2MoP
	AWzM8g==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jqky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:52:12 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-674153ece6bso224561d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790326332; cv=none;
        d=google.com; s=arc-20260327;
        b=WGGJVRDScGoHalRxTvXBenrjRzmKkpO2SX9jw5ZdGdzItFLHI7WUCXW9TiBm3ux7Y3
         DwsdDt6ru5fmkXCan36qQeHERyrAGLjTlntq8993UQH7UBlEFshBizOq3TvQIJio0tKT
         v6FK0pXTDQwtC4O3WYG/WixowI1G7vtqPT9/t4iZPb69ThzzHWD/Uf1NyOfA/xUF6arZ
         MCb6VKJ00mx154BZ4M3MIlB6hPS2+3Kir34ZBUQUJGsSMxWVRzIjjvHvAm6j5YQp+FP6
         BLgf3K1un9s4hAywVQ03mtmkQndMVp+xUgmmf4TvISRIao2WKcomp6wtyafSX6bgKKHj
         2Mqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=opTtenNCaXwogKEEQ9ij+bfaqJfLYpPzb8LXnpj79vA=;
        fh=KwI0pNk6fXGrnQ9b14L2yTWobBaPBwPMes/qrJkNuFE=;
        b=GKqnMoSRhu3kVdSZNI/IeMXYj0YGJi1MzSWrnY/JQVu6deO4n9mkXeuCzkDdO2nQwo
         K2bGpAltUUPRQ/xnbqSWffcujWeU/zY9kmxI4FfWiWDuDWEVY0j31kRB8Zh422nadJdl
         dvV2DvfNmearOYVxaKFV+159XzriHObzOTAqbuE5KBfkpL5GhIZfuuPleJ/7qyyWaV3o
         VuwblFQWoDu3zHfIHLyoR1xFvRTt5Or7xadK895riLz7omCsUJ6TawfHEUwfvkrHITQx
         xGlfjLr1MPTwJUGONy1PwaPZZhmMZmjSGvxQRAAugJIGSf/fwtfwsJVJiedYmPOpvbI5
         C5bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326332; x=1790931132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opTtenNCaXwogKEEQ9ij+bfaqJfLYpPzb8LXnpj79vA=;
        b=KP9MmbsvDB85RW/B9FsaR6nHtTkU+/hu/k3r5ofovnLFDQ2CHk1ecO4Wc2B3h7/SD4
         JxpyyeK/qNwDnbyTsoU0I7D2Jj6mgmWXfFei6ejIDSndL8AGFP8uQp3VoG0mazq28cpf
         Zo7/mSAmCbYIEfeSe6iiwtARGjcgo21RkztEN0zzwHRp3FPNhpXsXzZbTJHNnrg4B1u8
         C/YjQP1V+yApsT1G9DN20SiS8iGHwVzPKZebpW1JO1iTl2BCeUi7YpHVqNt6XlK5132Z
         04tSopVI4lD2h3RaToa6N0HTya71dHp8bv/FQnME172ykAKrxxL0ITEaNvRQmPd9EUPL
         8A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326332; x=1790931132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opTtenNCaXwogKEEQ9ij+bfaqJfLYpPzb8LXnpj79vA=;
        b=2FLk0bd485zEGMIKY+SVQWQ9WvX+U3T5PR32F//myhuq7ZEYrMb9m+vwaD0twuI/2s
         CUUzTvzdi1Ulk+FAWTtfPbahV8sC5PpTrFD2UtKyNS7WWEH5QDUUk694DSdUIrzyMSYe
         Z+lU4kQVfWgS2txKPO7DFbCrcFSADzYZMyo+QTHNzImz7EyArgY8tC6gyj/BD5wQn4dI
         nqQnVLUKBfXMjfxXJaCoph3OnbFMF52I6gIm229+QDresuFjinFNJl6trAAvKxi9U89C
         t48R4WdqCmHJm4blvPRHARO0rEWguJePeTQ1nDU9JFsnIe32wu6THtaDMbSVEaSloFr9
         kSEg==
X-Forwarded-Encrypted: i=1; AKwUvBxwwv3kOaX2une1qSz+DdBfJrh8VqpAfVJr1UgXkmYm49oa7ZAmR2nlJwUrfPxcPsdtVmfq55SP/0/eXOI=@vger.kernel.org
X-Gm-Message-State: AFuF++lF5tsC+xSqT6QB9e+NSFguvS6AvcBxScCrIsFoRkz30D/HUtsp
	1x2rzNOQtTh0FP2bFpMVx66PR+YpF2QnimLAxcXGxf3XpOtq2v3jL7w8b6hTAawb2sx/RZDC1Xj
	4jf+YMkqoTwR/vsTBdB3e8cuGXRkaqR+HTpKAu+vPc23yXHD52QJmKBvbd+8VmcW8G7s4V2Jeez
	JEe5SyHbNkCAhOJrjoMo1jTgar3xsWg233Gp2SaIAbFQ==
X-Gm-Gg: AYBFou2CwHICLllWUz8xFH9noksM7DAUYSlz963MNdQJxJswvJKSnrkJ4t78/KaN0Ok
	IHvgXq0VMMPbYk162ix1eyjqJZQ6nl5WPtTQP4YDMy/3GpBgWrQopMuXTy+Kb/bzo38oKtubw/R
	mMsbZH6YsQsxGQRtrQfG9E2VUo8UJGDXwes7pwaF4xymbggHIA5mfj9To=
X-Received: by 2002:a05:690e:1916:b0:674:1968:4179 with SMTP id 956f58d0204a3-67419684d82mr52903d50.74.1790326331810;
        Fri, 25 Sep 2026 01:52:11 -0700 (PDT)
X-Received: by 2002:a05:690e:1916:b0:674:1968:4179 with SMTP id
 956f58d0204a3-67419684d82mr52889d50.74.1790326331440; Fri, 25 Sep 2026
 01:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
 <20260907-tpm_qcom_driver-v2-1-71a6b1752da8@oss.qualcomm.com>
 <aqyX3lJ1eNBmzbSP@kernel.org> <a8047ec0-742f-47f8-b5bf-cb1b32f06bd9@oss.qualcomm.com>
In-Reply-To: <a8047ec0-742f-47f8-b5bf-cb1b32f06bd9@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 10:51:58 +0200
X-Gm-Features: AclHuK9gUY1vpR5SsZhMNs7YRGjFnTD3Zk58XCNLuI-MxS38RfhycehCFaCK3P0
Message-ID: <CAGgiveUA665UFwoojYBOB_rvCh=3NBug-B8xEBBVNPC=0jTCQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tee: qcomtee: Register qcom.tz.tpm service for discovery
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: U6Ho-U8a0jZm5LNYh-2rOiL5j8uzM4dI
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab6363c cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=HjU7GSAyVm1pYthcWuMA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNSBTYWx0ZWRfX4raVG6QiE9sC
 oIoeMXPP87gv0uzjpBSXBV5/eegqbbxdTAuGJErWrifCAFscxEjdcQfNfuhemQtveUqiqiRZZRz
 6rsbbRsDwpfMCOQ42mF0xx3puCxFPNoQ6mPgB9dqebGT+0OVkmuIFZA7iybGMu2O2yfq612Y8/3
 kA4zL6lbEnTxfHefB4zRjkcNH7oc+Ond7S8xePBtJZ9CLG02IXO36kJNEkQVq0E2JCn6cFwOVZp
 7Jff6e6QTTF/rwHxZk0q9d2OvDSAugwm2zpD9vChwcGJKlPeXlk0VL6x3BsN1TaWYaj0WtG+GML
 EQuzvDh1NP0YpXtcNtu/fbnx0Z3kIi+KpROYtM1RP6fu/of+0O3Xk1eaViBvkxZNh7kmFn7aF9K
 JQu9ZRuZqdZoA4lNj9/n87f11BHRy+P9QwGQIXeWkFD470XRwPZLWxj+ukyQUhWqk3XIrmDuxNa
 2+1twpjoopXPiLlYSIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNSBTYWx0ZWRfX2y8TpoF8PtIq
 ok3lW0w1pdFKzjPuVugoWCUitdyD1d/dMMeh20wifNqQRA8sM75rOiWwkb9YM+5EN7biBZItHDX
 YZ0P35goy4tN3Cv1kBxxxReIbzSt+fU=
X-Proofpoint-GUID: U6Ho-U8a0jZm5LNYh-2rOiL5j8uzM4dI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250035

Hi,

On Mon, Sep 21, 2026 at 10:10=E2=80=AFAM Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> wrote:
>
> On 18-09-2026 07:16, Jarkko Sakkinen wrote:
> > On Mon, Sep 07, 2026 at 02:58:41PM +0530, Kuldeep Singh wrote:
> >> Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
> >> is enumerated as a TEE-bus device, allowing a client driver to bind to
> >> it via its generated UUID.
> >>
> >> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> [...]
>
> >
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Thanks Jarkko for the review.
> Can TEE maintainers(Amirreza/Jens?) also review this change?

Amir, please review.

Cheers,
Jens

>
> --
> Regards
> Kuldeep
>
