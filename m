Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25153D25CE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076430; cv=pass; b=sfp2g17QDdpa/XUnir7/PESYFb2A1AKMJXeV9oP1OfPgPBItLSUR5nQaEcg/Ekf9zbgyEQ+30eAAQF81xngCnKgf4RkDCVEMwXeodOAf071l1cJvwW2hHjKrxtEYlsts4a/vBt1DlX15PaA7FwYcO/mSA28Rq1bBxIJIxqx7nrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076430; c=relaxed/simple;
	bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udmuNaJvxwxMAJ/JuBtfexFfEpRGOqMXIpvDjpYeV1b+yBythSq0jHnn44L40AUlwO3+2QGShY6LRjer2+MKkYvAwTfh2N3TjZjWrjx3McI6jWcC+vMC4EloK0WONqgYwFmKp4w7194BQR+qTXMTZoeX+6HPgGixPTn5MTJKdyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0UE3sjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQ6mW3XX; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0UE3sjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQ6mW3XX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jpIa3408901
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=; b=L0UE3sjhpkGmhWcD
	KoOduoIpJoA5a577JSZoePOLGX7e0v26yx67AbT0UmnzIES/59j8NaNAmujSvo/t
	+RaQhZNWWVMJdzdxjDb9qxZjR5OhXQBs/79pve2O2qFAppZQZC785B9p0VdBTIQX
	brXi7j5V332kv6AMTtCwBzoOVdr5kDUd6VoX7wlPgbSPAO012InaFRBcsEzg4zpE
	CZMoZeKnIr5yvPZzx42HkPVrpSI0wIheotNwc4Mod4TdfJm7roYHOsLgL7VdAxKa
	zwfHVIoJOvXFluitnuDTWiOym2MPWAgGECHEXZdKxD0LmXqVctIjAtfIxnjJjNBL
	gVRiVA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn3bau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:00:26 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66cbfb7ec42so6208800d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076426; cv=none;
        d=google.com; s=arc-20260327;
        b=n546TFbRc+OLt1JBqeg/bSGyO3+wSeLfDKSIiPsMTPPD2zSyfiVVLI2HYXEmKe6LZI
         0Ijpwiw5LyRxQygp1G5MJrhCJmx5If5oHp6uvhTU66TXzoR6P/WZQYpFjISWkJeicgZp
         KFBu9GHCFJB5UY4JZDprgKfBidKNLZtIDE8PNw2ykbVMKlwvfvrsRQx/q3cAvch5q0un
         W9osqmYqzW/rNhGwt5S2yEI98+qwL+mfN2yMIj5Ig3Rp4lmusdtX8Lbr+KWfKh7MEOxb
         lZivpVzZSXxxv59VaSyHxGzMIR8IvaD0q6WlKv7/Yjvxa+liH4jzx4YWfMDjYaP/4or3
         W86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
        fh=wdGITRAHdcFrIYNshYgY8nq4fdkpcGQ5e+VDBrWSSJk=;
        b=GuGsl2JRAlOKfhvbskkm+ZvnGfCNkPQfAPQEXEeJgsrzqBXr9a0iB93oOwzGbjXbLO
         FhrNXdh1iFVmj1U1WbiVu367Hn3jMtGP0JUvsSVhOsrcsASC1+m3ftvpfUl1HRTj1iui
         L8+Mz6i7sVGOsQEjcjuCmQtaofNnOPvW0LHEmFsoLODCOywKDQJ3ihootIYvxZzBvZgv
         nhdpQSuHBK+A0oTDsouspYBS4ipFhwB4fmEiJI/IiUt2gZvpz3MuMxjod+U/AfsxjiuL
         a+9XMifVJozRyUVPN85R9L2j+NbZNB5c8kjQ+i+tWLbXFqFsUWgWsys5v8deQ4I2CPre
         c5Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792076426; x=1792681226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
        b=jQ6mW3XXpmSsU/b9mMTY4iR5lR1mCpS2ELZ36hWA5aw/45ZZ5QREBzEahZGAGGsWhn
         SKpQ/kkyMIaqsL7ySvr1gbs6Od/dujFL46A55PamdMmFKrTUqjbdrY83iZfcknyeFi9m
         Y/SPh2MzOt5EjujPFKKztUcPw26HsQjwmt92q8z4EkKVZN1ydeQLm3DI3roZMsdlRmeC
         35dWchuYeKhGoavL21RNeoijBC3/ZLooG+jxcEadM7pr/YtO4jB+deCa0mXimCUKSLEM
         psiHYi/YmH8gEHhAR+8wWNy7ycUyGRYt+UZlXooUvRkH/wrv278KqUH182P1zOHkQ8bI
         QJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076426; x=1792681226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
        b=NB9mezWg5kVE1HOmtiHe9YOHqUztZw36shhKgfM729xZyPH5b1sCkOWH99phmKXnAH
         5mXlI40hBgAxMEB3l5FuehIstHflm7v3sVkHLVUN1faFrpRMflu/ibqtwtC3B2nKUBZx
         QD9rL9MBaOUo6/KuSgYPEsEMQSgm51ijGM9ydulgR+NxYQTA0nZbdW8CANhs+9o6FJM0
         H0qrDRh788acqKKscOLEjgLKL4Kc0W/a7JH9pvJ7brA0yi9V9Cc/eCfdQq8jXcRUCNWl
         64MKsCMH9nQ8o6PG6KjMBp6gbR+ZhyiW3hdnFkzgRn9+J52cwBk7irVQU7fbmERq/DBs
         6djA==
X-Forwarded-Encrypted: i=1; AKwUvByujYUSuQUTWW64/nuA+pk5Jlo1CrzrnYHjSRcTzaRlCGgp26U816VmYPEE4SXiYt9Db+OWmhJrI/0Qj24=@vger.kernel.org
X-Gm-Message-State: AFq9FYImQhOCvZe6h2ikF1123rBGaS9NXO05cZ6BrHnn8t/1mIF53HBj
	aUjNEzHrctr/s8+XHpW/Y2FPsRqNY2G6HH67xu45K3UA+gELEJkLaw8t+wAuwes+H5G6Y0XWgVy
	wqLMpBFtWLjDzjapNR+iVTziKYsoumxUadFiwVCoyEQ3DUnVrOwpIP3Y2XMqImlhejCDDZkhM7p
	DvdWr92XBjRbt4pPWRQs0nL+DGgjGcYRRWUM6PnfBnjw==
X-Gm-Gg: AYBFou2vD3Z5Pz5xa3cMmmHYvT+f7depip/EML16hx2qMUB3Dd2PcgHLj/ZErN/mMms
	5tZyxJtNSELztxmA+UxQMRwzfqfb5M473la5fizAFMLIruv+dvjJ/wc+6dtZ5ZORz9tXLzdEOUD
	efoPWs4RhT46SgNw91yhcEG6VIrjBf2Ch4nB+PeJtdpAZmvZpPZzGVs5A1RQ==
X-Received: by 2002:a05:690e:e8c:b0:679:a56c:e2d4 with SMTP id 956f58d0204a3-679a56ce9cbmr416689d50.21.1792076425637;
        Thu, 15 Oct 2026 08:00:25 -0700 (PDT)
X-Received: by 2002:a05:690e:e8c:b0:679:a56c:e2d4 with SMTP id
 956f58d0204a3-679a56ce9cbmr416649d50.21.1792076423912; Thu, 15 Oct 2026
 08:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com> <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
 <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com> <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
 <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>
In-Reply-To: <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 20:30:12 +0530
X-Gm-Features: AclHuK8demruQYQ8n8tHl0BDAgZY3hGCZO81qTxG4GuyJEws54lZr76wmzOWfEI
Message-ID: <CAGptzHN1-x+9aoccmes7PSOZfT=SDQK8e2yJc2AQhhQuc5+BZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OSBTYWx0ZWRfX0xZGvpmT6Il7
 Pw6OPjXAF9OGcyzYTEv/+/tHZM93xBrSjoH73TwKoSE+kouFRiDhMLYYhT35m4jY67ef61VqXHf
 nP0f+zrsXMy2LMBcXECiUM393PBnpW3cRLhkESU9hZOEbwlG5dGf+Gy6xDvG/99ba0Qx0wz5Vz9
 EPPqms6rzzczCJt3cOjqgX4ey7S6pcP39j5Za4y+bRjgEqKSychWgSZAWE3jab6UZHS6cis4sbp
 DE+Zqh+GIf7+rBFq9151IvJqyXD2KvhHCAhqEhX2ZisTbnEBtxywxMWDDM2hGOoOTf73ePZiU07
 KYZCLmUB/PYvLKq+CvWiNu7qL65QDBM5IeDp4uuxdRz0zXg1WaTlvUIZVBKFA6WVQAYbVR+2cES
 LNGkEKUlc623UNVR905IxGnrb5WXslvqn/Yb593/1laRtCR9R4flP1bLhY6mJgnXT5pXPfPPDsh
 uy/w8lhYJ/tkCl98nrQ==
X-Proofpoint-GUID: ycKecZK5p6AmYyrGxGEwIEygLNtnOsJv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OSBTYWx0ZWRfX0qxGqtW2dpYw
 Ez7Ce8t5acycpRAG34Lq67Tm4atYflJvV015/sMckX+QSEV3+WLmmV7U5Gn/kyLecdg1xEPxtqo
 T2RJsz6vSHDWSNnFEG49d1AC6fYJhKo=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0ea8a cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=b45o4kL6AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=aQIlNds9TXYcn2LlkrsA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-ORIG-GUID: ycKecZK5p6AmYyrGxGEwIEygLNtnOsJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150059

On Thu, Oct 15, 2026 at 3:13=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/18/26 1:10 PM, Sumit Garg wrote:
> > Hey Vikash,
> >
> > On Thu, Sep 17, 2026 at 5:11=E2=80=AFPM Vikash Garodia
> > <vikash.garodia@oss.qualcomm.com> wrote:
> >>
> >> Hi Sumit,
> >>
> >> On 9/14/2026 11:44 AM, Sumit Garg wrote:
> >>> Hey Konrad,
>
> [...]
>
> > The main disadvantage is that we don't want to carry these custom SCM
> > ABIs per kernel subsystem with the open source TF-A/OP-TEE boot stack.
> > ABIs always come with maintenance burdens, especially the custom ones
> > we have in this case.
> >
> > Since we started from scratch for the open source boot stack, the
> > motivation is to keep the TZ ABI minimal and that too with
> > discoverable OP-TEE services like the PAS service.
>
> Okay, I can symphatize with that.
>
> Let's think of another solution though, as a strcmp over the provider
> name is 10x worse.

Okay, I can rather stub these APIs via the generic PAS layer except the
SCM backend, that can reuse the existing abstraction.

Although I find these APIs not related to PIL/PAS, it will be
just overkill to have another abstraction layer for it.

>
> What is the planned replacement on the open boot stack side?

In the case of video subsystems, OP-TEE pseudo TA already holds platform
specific info so we can directly add this info there which is being
passed by the kernel in SCM calls.

> FF-A lend?

FF-A surely is already enabled and tested with the open boot stack.
See TF-A PR for Lemans as an example here [1]. However for FF-A lend to
work in real terms when kernel running in EL2 (KVM mode), we need
capability to be able to unmap buffers from kernel linear map.

See this proposal from Google where discussions are leading towards
making the generic CMA pool capable to unmap buffers on arm64 here [1]. It
will actually unlock FF-A lend use-cases in the kernel.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/54873
[2] https://lore.kernel.org/all/as4ATqhp0bPI03PA@sumit-xelite/

-Sumit
