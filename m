Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFD044CADC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345426; cv=none; b=Z0NlKH7ENE+pOLrNEFp3ddbeFS4HnJf0lXrhlpO9KpDelkt8tOHbsJuRHG3ZeY/QC8Q2B6Hdix/pREa/idBtSIdhaX4i0Dxv8Xv9zi/EQXzW6ybwTBwEcYkppouETzpUqrzMcazw/pgTNrlgLfDMoouHNR1vnBEEndoB6c6XZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345426; c=relaxed/simple;
	bh=SFacjOOQZZai0Gh5MTQZrvUud1E9ehwjtq9+n1zOW04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AgehbE+UEtLwePtTsUBd6ygcSwyyIFDMe8ur3rJeyYa6RfZxiLE9m/q/YKC6yB7v5/OSAXGAqX/1Rqv3DQyP7sPUqaegP5nWA5JueKoGspXCkWlsRVcDzecLPhYNrBvVi4uIEIprNUwMPUWzXAn//ErskEjnF3o30kPRO6kd1+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7961qdh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX6nJsOz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7961qdh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX6nJsOz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NTte1349273
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	694N+sr/OcNkAE9uQbSTUtq7AqafYn0IRrcHEfIgRYU=; b=n7961qdhjTQLCF+T
	xkkPjdKaXZ5k8mrXjO//tmMew+YFGQN/2La6+/h1qCYm3XGOc674GmQQrtTJGnXl
	TsLzSahtS/TS8PNCMliu23Ktj475pSRs+86R93L9QQr5ctyGiV/bSHtHW2V7E3sZ
	0GIuxPVKc+4u2IpYee3cU4bbEfj5qY5olbw9n+qADrh0eiOhmdc9r61BHobpd7Ax
	LV4IZgMsWlyPL38stt7zhwyZjJwIroFk9i9aPbtfj4HDJnJ5tlbrf9Bkqple+zas
	NBS4n9h7rfsUEUZp0kIA+NX7Tn1kWL0mS/ICFJPJ1/4c7OrRN+WG5tGYvSPgzaKe
	X/CVNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0ufca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:37:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9382f9430deso184858985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345423; x=1788950223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=694N+sr/OcNkAE9uQbSTUtq7AqafYn0IRrcHEfIgRYU=;
        b=jX6nJsOzClTT/lJoW/nkED9vOjhxW02w2FZ34hd1lhuo7bOJwnkkcPS7aiJtExDLMg
         oaqjYJUQmxapWb4UDsU5RnDqfTA3WvXA4OO6YinMCpZhqAmx1oOIZlk2TNxR9vBe4X76
         SrWEHezQMm4AdM9AuSFHP/v4SWJF6b2BqVEEDAEYfhiO7JZeUebCrwNCxDjX0eXSqfUA
         6uka0PPKQ/YWr/b8e1xmCwqJ1Ur76rTrHSQdLbQL4NITBp8LcGP9DXi9KGMhjj/vQ8A/
         mXR09FzW7UwC91gJu4j3xMISURm3xL/n5GNiXsGZ6uGOIUkho+h7NJpRrgX8GenieSro
         jELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345423; x=1788950223;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=694N+sr/OcNkAE9uQbSTUtq7AqafYn0IRrcHEfIgRYU=;
        b=n0B6Yt4p4YP6o/OXuIrq1BtxhEDBxGZaP9bFni6rEJjoy/AnTXs9KTCC3mUjUXzMYc
         Zg3OZt1Nr5+pIkulrEvi4QRwzsuiOXCJh23OHMDXWEJHc3P/uDN/5WvSDqo0lIFVz3Ah
         gDvC7eq2k+erFIGIYiLCerc8PmqAe93glCdSh8W+Y+cS09erfkIfbrPfeC0JmJeku0ba
         t6Vpt6BL00I74Wg5YR5ODg911g0mJ0vfzGIqENmYv3uUMWFHH8kzxD71Ua4Hnfa4qGjr
         hkYzb+BUnrcEEuIMdb21ZPafdwhKhiXHdq238l7YRkk3CbcR7/5vuJMusSqs8ZfOY2d+
         sqLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBZERAoTybf2GiVIZU5zBdThtaVMNys75zbwULxAFx+/5tqDMGQbhK3o6MeqN7oMixSPGV4VY1KYONM48=@vger.kernel.org
X-Gm-Message-State: AFuF++l/DwT7CSAA/Wy+hdLtvy3uMzkXZw5BHIRCLxoMa+2W8VVuwo2L
	bndmBcFQcuwTmq5DkFRBvUFkprhTtQOfI364CI7I7hY3rTZo1kXpRR9Y2IW8MGnQOdz+8tDCzsD
	mqlHrlJCgytcaPSEF3pDoVkz2uh3JUMzgJImoWca6DHEFjgTinnOLMChjDcZpyO0LhYVs6hpT9X
	A=
X-Gm-Gg: AYBFou2mbP/vga8xEiz1RHpHQENuHI9iAe2ViN+D9WP94bkNSuR9k+OInsyw5c5oqXi
	3IOPM2r1nnYFUO1jZdf0ikSznEYMCqCPrVH7WXFB/uCRuGuJaFngz4QHd6UJFlQGyLjPGPBVFXv
	P0QWWwt9I9P10q5gnT+NmMfFuyAINa8JNtet4zDsojVu+ECAShDLZRg4K5mKBipmmrY2Td98IpW
	AdfMENrNO9qmmcvbkHc34IeLro2byHWVEHt63pRLwFwl9KyzgsfFiB4BvGAZcUnitfnC2olAmQQ
	3FaSyJygWwNOYMIZKpWLgQVC1lCI9xwK90HluiC5WpjVezVj/5ULk+UjjjUyynCK5MJzuNb7qKP
	YNemzhEXH6edkgRdoEdzMZ0iKnwE=
X-Received: by 2002:a05:620a:450f:b0:939:13a7:70f0 with SMTP id af79cd13be357-93960ccf33dmr399835485a.5.1788345423517;
        Wed, 02 Sep 2026 03:37:03 -0700 (PDT)
X-Received: by 2002:a05:620a:450f:b0:939:13a7:70f0 with SMTP id af79cd13be357-93960ccf33dmr399832285a.5.1788345423136;
        Wed, 02 Sep 2026 03:37:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm5609592f8f.27.2026.09.02.03.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:37:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpio: cdev: return EOPNOTSUPP when HTE is unavailable
Date: Wed,  2 Sep 2026 12:37:00 +0200
Message-ID: <178834538855.14196.7092782836934793287.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831152306.166630-2-ivanrwcm25@gmail.com>
References: <20260831152306.166630-1-ivanrwcm25@gmail.com> <20260831152306.166630-2-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfX0nSTaoUerGPk
 0Hg1fMgsbt4/ybTETw8n4RHKMlOGUodlzMz+Ib54o9ccOu/hLApb5O5lK/edGdiMrhL0sEtTrjd
 YB9ELEhaLyExsguyks+TtaL2kkrT1y9myZXmIqbdry0YncKK9Tap2+uQ3zlRB8zKYda8+XkUoxc
 s2otVzIxQZuFcdfSj6pPHIJa8YCDVbevekIsACv7pISBRULKDKyd6Uc815CfLcLz5JsHQAVFGQa
 OUFqPRzx9hynoHqc72neDqecDfmqAYJFd4UUWn3QT8LFZH8mEOf5m9SIB4hXQosmeTftrjrmd10
 /oB6UlJQWravRpGGqZyMBkrXgpPLqrw84XJ0zqzNW+LyMMZkVO0VtMb093KrHAD98taQJlZfMHy
 aT6W2WEuN6hac13nGPDuaNWnh9aTYzVTI0wgKLTmJwA6QHcgM+US7ZuNFdh+syvZQbV6XpaHJ52
 gEh9GflTGnqbqp4k35A==
X-Proofpoint-GUID: Fnd-wjULZCrStZrClHwEEMepEkGVSpT7
X-Proofpoint-ORIG-GUID: Fnd-wjULZCrStZrClHwEEMepEkGVSpT7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfX1TFFR7TVTFRT
 2fQOEtguDDsdKW/j8vM2kOqV0t2+tiNt/+bZ0oypDN9k0V6Evirw1vGq32sovdyENBZm7IhWu0t
 IUogNnMfmqm4hQ49deEPngk4FyG+zVM=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97fc50 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xH5RL93iFtYuGRssYnIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020093


On Mon, 31 Aug 2026 12:23:06 -0300, Iván Ezequiel Rodriguez wrote:
> Map hte_ts_get() -ENODEV to -EOPNOTSUPP so userspace sees the same
> errno as when CONFIG_HTE is disabled or EVENT_CLOCK_HTE is unsupported.
> 
> 

Makes sense. I hope it will not break any user-space users, though that's
highly unlikely.

[1/1] gpio: cdev: return EOPNOTSUPP when HTE is unavailable
      https://git.kernel.org/brgl/c/cf176c115497bc6462391c3118bedfd212092c4d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
