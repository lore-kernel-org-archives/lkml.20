Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB49D471422
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547671; cv=pass; b=VqbKThoYF6jBALp0Rw5SoZUJjgRkY2UaA52o5EJv1ZwFca3KyOIt+9MlPma0yHDc3nyafV14fO4VBQUB/1uMDdUdqpA+SiYFGEPYEGipHrbfvr6X2HyvFITIJ4zpvrg4cuuNIrVNHIelI6v5M+948CHj5Be0AnNgy/2+uPAWfIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547671; c=relaxed/simple;
	bh=E0XqkUESiN1hlEBTC+r5MA1JM5vILVmKxSWQU9kfer0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PiIFRmjEoLkfRS3jPDytklvpCuKIxMUn5Fmkimj2yYQMfDC/48BeoPOFiJ4en20WxGJkZtJUq1+6l+Sy5iQNNokXSBftHzjQlYDBFJNi3GNflBQS2BjwCNlVepR68LiXHlc+gEUDKJTrEmT2fWhfLwlqFnfohg2ajr30MKiW5NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ3FXUNS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTao+uam; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ3FXUNS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTao+uam"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G7XZSi2970497
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0XqkUESiN1hlEBTC+r5MA1JM5vILVmKxSWQU9kfer0=; b=CQ3FXUNStXk3tAGJ
	IEmrCn0FNgUKMCV6fCW1I/mJcErQZOUiKeDOJjjjoV88mBUoS/zqj4zJ4mBrsUMh
	k95/J4WdG+f8ISMCX1BDhlGmE00A9i2tqLPT9oLppgSzcZEDtAqSvOrWZylf+kGb
	PCB4jaX8QY3hFOcKlKIoNSuTx/6Le65gkVcYmMYE9jV5fy2JRKqPXBUslKo2+RQG
	ejmCqDqF9ssBz8UzRV7sIDUtsOyjnDUZpDOo24Lv3y7zDO7d9pNU7LVzn+uIZSBZ
	Lw6cpY+COKzJnPr8Ye133XYzSXqW00S/d2Cqnng9vQEcSRgZy2SGRlrd9U4VHVk7
	xhTwbQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2r7jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:34:29 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6711c640f79so1727102d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547664; cv=none;
        d=google.com; s=arc-20260327;
        b=CTpPTSYKoUHr0elzEZOSWVxE8DZ6iSOvNOoWJvHAOyAcA7+Lk8vnhY96nr+WivArYz
         pP5BM1TYMrJB7l7y1LxVwD+I1AHCIDZc/CoqrKRw1w7oew05qkiwP1JTYblB8yR+zNv1
         Klss8Mx7VWigVRPX3ZG+urBqNNCVAsx/RLm1CRe/MJaDse9YPvqpJm2kXjMqpEmrwgXZ
         7V65Y1lps7OFGrMkV4LVEogSThnNpEngBjVY2v6kvsufIURCqMb0jDZcDfhk5FR2xZk3
         JxJU5Kr8cadnt9VNV4fwgkGrrfh8nxwcCiedQPQeyR4siRguMSQjw/0rdIQmBB34aF1J
         BL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0XqkUESiN1hlEBTC+r5MA1JM5vILVmKxSWQU9kfer0=;
        fh=EaH8kjrfmFsBuvW9J07p8Bo9JIUlA7r9IZ0kcDDeIkk=;
        b=pWZdIxnNliYr44aPy/3mQN7cYWc151HCPQuU/l8oo+cZJbqV25jrKLLBbyEJgHkXKo
         Lp8yPBENF8MAuROLirEOqDp0fRyvGZO2O3jiaL5bEQL1c6jrOIJNKJFyjdtoZlM/GZyf
         SDDj8hV1Oal/vgi8my1YQ2XiLid2mDlA0qma4+jLO8XxjXjVLtz+b3tovWDc26YyumJi
         CDagzb0/33S/ICP/2proLPEMuolyd99WLHRW3E3axdUAN6p3sL99BMz87HhQ9PSHnl+t
         axCXmUhH8WdOsk2far/KQrSEWpmgsKhdneTXD7Z8GJItD0JM03fNgMrd+rXwAGl3sAHG
         R6WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789547664; x=1790152464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0XqkUESiN1hlEBTC+r5MA1JM5vILVmKxSWQU9kfer0=;
        b=JTao+uamJ2HNiXaCj49vnNlrZoyO+BbipBuFYkZiV9j2j0lHeMCByC/n1C182Nmu1l
         KyLQeMFxTuzENde/3YIM23t90MiIavfbnJbUool4ds0p7pj5c7My5bG92JbSE5g/HbQS
         iMAd9vUl9qWQMhJSLU3roZCRpl32BG1i6uQB/VUfDNpO808qV3L2hLDfqlBE5pVoYDH0
         dA+7j4V4wzhEkqPlrXGpp2b3evsY5IoRp2DrOziSiSVPGh84HVcAgr6Mpjas6m1JuOPk
         3vSNigYTL49z6m6UE4ntIWG40yTCwtgfsvEFa2s/R/pQ6i280VZT7sspIoB1bdQo/Lok
         1X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547664; x=1790152464;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0XqkUESiN1hlEBTC+r5MA1JM5vILVmKxSWQU9kfer0=;
        b=RBSXaUNOeT2fo+28TkvpwGumhhKDIeWmxJUNeD2FOO3waQDuFu3MahZq0q/0BxBSgR
         +X6TwH0JB3bEDJ7bHXfSoGBt99sf5QQ3+HUAs6Zf8jvEWPU69H16mn/BckzbBdBsSUWq
         XCNwObx3sDO36sKpKNz6N5sd/ptlrZ6ugXHDDusFU3drOGg9DIuvzCON5Pqh8O4RC6iC
         6oCJ6Ljys4CJ5ivHrfuHVQyoTMT8Ev02C4xEqe7LK8HRgIWDp1GCKeH7FYBqHyuHE6bC
         zRUTXnnRu5XKkBz4xGtQrNJoRMGD6T46TAIsIyIPnzL0GFC0nh0Xi8MK1kso+puHQS7T
         4uXA==
X-Forwarded-Encrypted: i=1; AKwUvBwgNgS4G9mr+cVkeLWp+McrICcYW2KrQoKBvJf2/pqLvL1jpt72wDqa4CA0Zzx+jpz6fky6SfLOO1rI4W4=@vger.kernel.org
X-Gm-Message-State: AFuF++kcXrSpRiB70oWUh/lSc5DbBXX1xqWOFgaX/nVLD++HvMam5khh
	qwP2fGbfopFznZH+u1HrBuPxHcTN2PPhSTQPIOATVYJcv46dOk0R8fnHBbm/CvMigl1d+TMDH0b
	wKSeTNg/VLUFpUGNoccf129h51qKkcyzXXH9k5jk1df4CZYm0QKF5qP56ilgZsoNn2y1hW5J4wk
	BF+xKqAbYd53t5Mi/a0I5I1F40g8YrTtBNyI/mrYk66w==
X-Gm-Gg: AYBFou3JJlQy4jSu02hVJiGyTPSWmw5v6aQqzsNqVG9SLMzQrddKvfpxYWhU22PXLMI
	TxsHQ/qO3yVzV3U/0fyI4C2eK9XBFmwiukLgy0+YwpIrnYHrw8RzMGZpxreUVOG4Fxej3Yj7O4E
	YPxWuK2BcZqUrKW/4yFGITV7zAjjDkHCEXOxWK6LPB9XukRa0PgsZlyfw=
X-Received: by 2002:a05:690e:d0b:b0:671:4b50:d72 with SMTP id 956f58d0204a3-67154f5116emr1586693d50.7.1789547663896;
        Wed, 16 Sep 2026 01:34:23 -0700 (PDT)
X-Received: by 2002:a05:690e:d0b:b0:671:4b50:d72 with SMTP id
 956f58d0204a3-67154f5116emr1586688d50.7.1789547663523; Wed, 16 Sep 2026
 01:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903175730.1909952-1-afd@ti.com> <aqJ0yCHd03ZLsSMT@sumit-xelite>
In-Reply-To: <aqJ0yCHd03ZLsSMT@sumit-xelite>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:34:12 +0200
X-Gm-Features: AcwNN1UYhdhLkRJRl0-6L6I-0s392VyUVtYk5_XpwRYYKG_lQZfM1sxUpE9LJ04
Message-ID: <CAGgiveVZurBzh++FrDvoxe4Cq2OBZD=r7A3k_i7_atCyVjzsXQ@mail.gmail.com>
Subject: Re: [PATCH] tee: move tee_ioctl_shm_register_data to above IOCTL definition
To: Sumit Garg <sumit.garg@kernel.org>, Andrew Davis <afd@ti.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ZI_hLIE99Rq7cCOzwYcdWfjwqNUgxHID
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa5495 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=b45o4kL6AAAA:8 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8
 a=pYuakFrei0FEQ6tmCC8A:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-GUID: ZI_hLIE99Rq7cCOzwYcdWfjwqNUgxHID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExMSBTYWx0ZWRfXwtvTFzgUiFdl
 29Fl6LsIrvIjAUkBcffBzMx5pKodgAaLrxmFtjxcA0y0h6wYBd92feyJXxUfKigZXwro06TFPsc
 BVAwwDWfnOaOSabyV9sN9Q3RAC6TIvjYxCytSz4RTydeqTZWfp3XcWQY11ZzvkHblcr4Vvsahxa
 uDKSi+a6Ht/Wqn8nysXHVMJVvtFdxnBJFkbMQlJpCrf8kvYOdOoKoIElyDqJOvysJLJ3UH6pdEG
 o97MKsJAzyPc75c0xqJdX8rqx7EEf4hJ1x5h5eF+RMVKAkc3tRvQJTdBZBuESaJC4hrcyUrHRPv
 Zu5If2JasbsjPDbseo6wGyLdRec0KSJGf/wgGq0C6+Itz6Q28PI2ta301zvy5ayM5tjs6HjJG/c
 lMB0Pv/9O79Mb8AmjPeq8QZd6+rfiGQjOTk1bOjMy9TbBgF3yvbzh/BpRMQOTLYyvCJVD0YsLJ2
 PpBlQ2Dcv4edAU2SJLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExMSBTYWx0ZWRfXwn8G9mW0kJ5z
 MGQXmAXd8eg5rQJO2E7glwE0fRqm8opmZyQ2bT3g3IsartQh1vJAt5O6GPRK9ZnJzTo2TCcgw/P
 Akra40l/P//sY0Zqx+z2pHn1Z8EcWxQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160111

On Fri, Sep 11, 2026 at 9:40=E2=80=AFAM Sumit Garg via OP-TEE
<op-tee@lists.trustedfirmware.org> wrote:
>
> On Thu, 03 Sep 2026 at 12:57:30 -0500, Andrew Davis via OP-TEE wrote:
> >Most of the struct definitions for a given IOCTL definition immediately
> >preceded that definition. The struct tee_ioctl_shm_register_data is an
> >exception as it is placed above the TEE_IOC_SHM_REGISTER_FD definition,
> >not the TEE_IOC_SHM_REGISTER one it is to be used with. Move it down
> >to match the others.
> >
> >This is a non-functional change for consistency and to help prevent
> >someone from accidentally using the wrong struct with the wrong IOCTL
> >based on the struct's location.
> >
> >Fix a couple small spelling issues while here.
> >
> >Signed-off-by: Andrew Davis <afd@ti.com>
> >---
> > include/uapi/linux/tee.h | 40 ++++++++++++++++++++--------------------
> > 1 file changed, 20 insertions(+), 20 deletions(-)
> >
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking this up.

Thanks,
Jens
