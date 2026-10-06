Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DD43AF65F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278876; cv=none; b=OO5dSgax20AbjC4oxG5kgK56KCn5x3zamKNhUBAJl8ugfFUtmz8HNusLzbijW8w4dk1qIyGkiRZaSg4l8sG6pvS4la6+QeU5D17sV5IioCxfqyA4s1jUjViGBQ+jNg5YVqHyv+CU0bHigf4rZ4iq92KKjuJpmIorNiH7wGO/11o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278876; c=relaxed/simple;
	bh=jQKZXbdyyBJka8+xVCZ2UeYpQeJaBJHonIk7U4rIEek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JetrgWok79eTZxDUsnPwxKoFawkmpwQC2ap76sEpTKaQsuhnguK9XOXUMc6cyeBmBfso5Y95Sh6aYHF2iWnfNd+pheXpO0ABs5fh7iBH525IfrT1SJtrvUYK7uM04VUdV1JlaWckKdwOcxqyjd/WhAKzTDp7EqU70nlTgP5L3VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2c6v7Yc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZ0OrH3O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2c6v7Yc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZ0OrH3O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6969R7fj423473
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 09:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MfDikcI6+/R6VrhQqwRyMt9e
	6q5NL/th/h+Lhoth4QA=; b=N2c6v7Yc+ccvgUFvY0tBKg8HDcyayqogr0b9LNyy
	qMsLYXrQBRTjhUUae7dHFQEHRhY28TIL15lVMTHIG2ESL7QbhezlZu4N57Ngl+VJ
	K8RIiJYTDQnsBXP+N+QBHHDCE8klbOWSB8AH1zaiefOQnRuIvVWSOLdDgeI2jJQl
	vidEhtIIAPNP9y+PLz827tD9kxlwwzhaXK/ORp024XYmg/cNt/JqfkuR1j1NpF9k
	PraA6t6Cj8wdo8ZsrQiH6ZLgSrv2jAilrVgjlqvHuzchtLpmZ/CMGrtsA+CoSy+S
	PYPdjqJd56UDPgSWnC12gWeRgdsoHq3sA+ZYYGVSh+dq/w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9r045-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:27:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14fed306427so10322126c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791278873; x=1791883673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MfDikcI6+/R6VrhQqwRyMt9e6q5NL/th/h+Lhoth4QA=;
        b=AZ0OrH3ODcHa92PEvR6pk+DQCsPiECh1HcAX4fquu1gUPXo1LkMA1DZ/4tzyDdVcyX
         JYRKE5Ky82aLzuTJPwL03ZoGIHcFaIqpAeclRmqW0uGn9U2lNbum+gLIQtjbBE2C8Gwq
         UXUAdnvxLMv7Xk/VRtsZMPruN8d4SJ3ABOC6Xy4uQxHGXe6/zv9oDIiXzMGmpjDssVnx
         4Ee9gtQPQ4voz8h1MaJeQxL7oig4tS7h5bsSnJClMaU84mycXatWHt7fFZiNBw7sDTaJ
         hCxpG4jrCjpKTcCrQbRhB1z45GlcGhyfoNC93smcCwrtrrMdVYDGIbdav7DSet/0Mey3
         VaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278873; x=1791883673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfDikcI6+/R6VrhQqwRyMt9e6q5NL/th/h+Lhoth4QA=;
        b=ds4VfXLwkzL80jjLVQqe7dTEyFhzJPmaygZCEF3UeG6zef48vCCwLF8LhhvSXuvRbx
         30icdX6JHhKibPOorteE/eqQbCckYV7DpCkJ1WSstqjzFrSUZA/omUYj0llVERO9DNWf
         baM920Kj0uFi7IZwl+Vno2jjbYnxY+eM2//QjoM6I3l6U43P2YbmUHMewF2j1//vidgx
         QDF3RG4DcVwYHBoaClCpoPJACYmn1Vwd6atIkXMwNQmNJOo1dwLYZjjWBrnI4C7PrVgS
         QxuCUL1I+aWfLApQnkTekDts9jEBtCW1Yw/vRXSDBXhG+riTT4QITxG4oT7RP3PnP0YO
         agWA==
X-Forwarded-Encrypted: i=1; AKwUvBwSDNodDIMZpqRRGqMdQV+Rt3R6iNlIX9TpcimhC0m0LE4od7iKAXUaX5INaz/3Ywv0TivGjiUHBZsTOYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nBgREzBmUkN2Z5pc0+NOPRL5Kdk5zjM4aXpi44Q92kFtGpPD+J
	KpROjleeeA6lvd622YdUuUtUSw9ZoepRim1KOWdNUizMjjf3DA3xnxF0rplXhfkrzT8mw7I7XH2
	XcMPbQ+O6s3OzQc1PDB+nFFkimgnrzU52NqK3TaTH3o6T/ncunctagU1F+RLcHYVF/E4=
X-Gm-Gg: AYBFou3E9nn1oPbImO9lXk7ve7Zwy3kYccaOZvAW1gh9zp17ljd6O33OAs73RwPJ0vo
	zv0w3LZxHO9fdBTL4ZUFMvimfKrGxXd4R5J3JgqegM7qjFDGYjcEbRIH6ySyw52TmhWUetmhGnR
	UWCSYsclpRc6O2L91pL5cC/5snnB8UkzismcHUlNPYRM4k8sdg8NvvoKWoMwYlFyOe/zxwXORrI
	dPNST9OwoXrFXQlhthZMkIIjYbxLbh5EMVzVRduryhtJvYDnkfD1z2ziYmnfbHDHi5Q5Xpunfu5
	xVL2bm6TT1H0TACcU7pCMg9fGyHQBBcdzaO2EPNHpUIOGq0W46eOHKVX4HcckdNnGHzmxU0mY0/
	yevttoitbwl4cvgnR7IfHtJ0x+IJyfxfQtA==
X-Received: by 2002:a05:701b:4542:10b0:151:9af3:1beb with SMTP id a92af1059eb24-151c32dd7b5mr13122300c88.10.1791278872993;
        Tue, 06 Oct 2026 02:27:52 -0700 (PDT)
X-Received: by 2002:a05:701b:4542:10b0:151:9af3:1beb with SMTP id a92af1059eb24-151c32dd7b5mr13122263c88.10.1791278872444;
        Tue, 06 Oct 2026 02:27:52 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d819cbed6sm11381497c88.4.2026.10.06.02.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:27:51 -0700 (PDT)
Date: Tue, 6 Oct 2026 14:57:45 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ninad Naik <quic_ninanaik@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Venkatakrishnaiah Pari <quic_vpari@quicinc.com>,
        Jian Shu <quic_jianshu@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Subject: Re: [PATCH v3 1/2] firmware: qcom: scm: Introduce new locking
 mechanism for SCM driver
Message-ID: <66ad2051-193c-4990-ab4f-efce0000c00f@quicinc.com>
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com>
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac4bf1a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qC_FGOx9AAAA:8 a=COk6AnOGAAAA:8 a=20KFwNOVAAAA:8 a=P8ZCbf3PEJK3Dg8LGH0A:9
 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=fsdK_YakeE02zTmptMdW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX++81L1t8RXpC
 LmNUTwvz3Vy7yfxjrtqBxEFKGGs9J9Pn2KFTOqHdlwoHZbG3ttlcrCWPqg4LJXO4O2wu3mEwP62
 h4ufzrzw8ELSfg+8CzTaUTLWwHKofk0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX+oeyrlgP3iQ4
 tRH06sjadxc2092H4CMlIEhYtcMKU7yKpneGz1uJCmZpzNXk02JpW2dPG5dkOLdpZ9Y+arGKb14
 x0+a6IKT8wsZaaUBWm6Ukq2KJ3ggwuMxmRaPQ0udI2V9CIpbkQ0wJLnoJ4qDKcLg8kvtnovh+T1
 Tshs7xi6r9yTIgtg42N5LxsAMUi+IGByjgysavo90QE0E9NjYrIejFxS5+nk8rHCE4VPow5QF2V
 n2uMuMCgD2PehVAwi0pq+NFpUjeTd9tFq3krL9PorgrdeiRIRTe4qlfUphOR9eMzHGH5xGPoOs7
 xnK02H1zoeLcf/cKy++hZYBDq3CyM281RYy2yMHL5GnPDK8/lmbZCcNgkA12yQz5CgUCU1Wi78H
 O1aoA9+aMlH/L6ObKuA7vSrqhiNCcqHGv5k18reKrCFu0VsPA4pXQGvTMkBk/Zn2Wi9c3hTYMLU
 Q0S8DtLVL73b7QF2xTg==
X-Proofpoint-ORIG-GUID: NjKKNIO2hXlCnlfGvr3i8sLZW-UpndZG
X-Proofpoint-GUID: NjKKNIO2hXlCnlfGvr3i8sLZW-UpndZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037

On Thu, Oct 01, 2026 at 06:16:48PM +0200, Albert Esteve wrote:
> From: Ninad Naik <quic_ninanaik@quicinc.com>
> 
> qcom_scm holds its global mutex across WAITQ_SLEEP and
> wait_for_completion(). Firmware waitqs allow multiple SMCs in
> flight (wq_cnt). If one call is parked on a waitq while holding
> the mutex, a second call (e.g., SMCInvoke) cannot enter firmware
> and both stall on the waitq.
> 
> Replace the global mutex with a counting semaphore sized from wq_cnt,
> with at least 1 wait queue.
> 
> Fixes: ccd207ec848e ("firmware: qcom_scm: Support multiple waitq contexts")
> Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
> Co-developed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Signed-off-by: Venkatakrishnaiah Pari <quic_vpari@quicinc.com>
> Signed-off-by: Jian Shu <quic_jianshu@quicinc.com>
> Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
>  drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
>  drivers/firmware/qcom/qcom_scm.c        | 6 +++++-
>  drivers/firmware/qcom/qcom_scm.h        | 3 +++
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
I don't know all the history, but in downstream [1] selective calls only
allowed to sleep w/o mutex.

Mukesh, do you know if it is safe to allow all slow calls w/o mutex?

Thanks,
Pavan

[1] https://git.codelinaro.org/clo/la/kernel/qcom/-/blob/KERNEL.PLATFORM.5.0.r35-02100-kernel.0/drivers/firmware/qcom/qcom_scm.c?ref_type=tags#L3057

