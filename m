Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369BF3955E4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979048; cv=none; b=Q5SHquwkXnD+JpF0jTZGAbrPCAS0toqndy8RZWsCetZvE+voTW1njSHMQbFnxKb/YCnRCwH0wk943lFQZa2SVOFKwJ3bKxX/AQIqZT71qjg/7g+TWLduYViKJd5xvda0WVcQ40sceIJj1wnoFCW943LmuCLfTU3Rz/590n7mvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979048; c=relaxed/simple;
	bh=CXlmz3Qrz+2s4K8YtyrdzhpAlduZURZcGsKuwFIC6As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2bE3d9BTgHrWSQsOuDa7iuOTbV1o/F8YaUE+CC07njMhFFlrTfdNikl3WhEhkTKTNk/dwdcvhX5Vxy9GxigvQp+LQ5uPVwvCYm1ZyXBggTSN9BdUW/nDYDoJxKOM1x8UsJIDKPgjuUtojYxNvmeuti1x8rmlig9Tk8OXbyT+/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgYIW3k/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gx2Y1HrF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgYIW3k/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gx2Y1HrF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H85f71938156
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=quHjMOAd0R0WYl3Mfy+0+cjO
	+Cogwa/gMhTd7XTRQYQ=; b=FgYIW3k/Po2qhpHCG60/8qq+u3kn+siHvlJfxmgR
	YwFS+ioUfPGFropHZGUhADSlIyDZOyBxJXbL8eAFOl1WMiwRQ75nO24TXzjA2482
	XwV6UkL4+8sGJcwDwWv9zfzyRXMDs55Y8FIR76ilacA39edRNCrefaQBVrlWCwe9
	EaGKN0yNowRVmPuCnvyLu+ZgGt8Qbmmawj3edF3opVu5c2tZjAX6UJXmMkSnucmR
	2yquqF2nLKkYMKvbqtfiUWcVjjgjKRHxHrZdLEcN17d7b3u3ggMcwIn57EHvMpG9
	6mV1iIeQps5cmQ5LG6Z+/s1Kx6pDjpCZK42SqgIm9fwVkA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559tdt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:37:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e98448895so543634241.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979045; x=1789583845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=quHjMOAd0R0WYl3Mfy+0+cjO+Cogwa/gMhTd7XTRQYQ=;
        b=gx2Y1HrFGSluhpdjxLwat45Bew1ZnJ3k+4tc99ixTYqJSm+z4eH3MXU+0hZRhS1LXo
         Ehwvuk3jN42x3W0dtDEWM4Mp1qoVy8z3JUHyBhfXunhkBPV4rI5F25RTA/Gu3dapmZZ+
         SvGkd17B5byWytL4YX1zqGQ6Po6aqv4i4mwJeharhOLw+PIPdYiaIKLqnGRKU1rBY/5N
         JkKCKkfpbE8JZV3fVz5fEgieReXkzWYfqIjRmhYoQ693T86HIAqNmFZKbRG+fqBPnDaJ
         By/xJaSmyh3ORdHuxyLOn6ntNOukARLXOXIkdIdV+d4HpO+XvopWFxR26SGfEr+7lJfw
         LDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979045; x=1789583845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quHjMOAd0R0WYl3Mfy+0+cjO+Cogwa/gMhTd7XTRQYQ=;
        b=p0CIedyiC5Oxc8aDa4gOYPcxx29uxz1UCftIMfGt7bcNeHt+dsUCF5J6oOx8jN4sEG
         QH5Bbqf39w2w/r+jX5y2IOleINgKwxoVD6rJe68UcVLfqWt0npMJ/e/shyNE8+6YxCv2
         O1IG1p/PWoc7/ULCC1RanKzVhbjUOUozdOVqLBmBn5ExK9QVO9KTRm88VuNoq2W1yD8i
         ebjihGqVj5vKqZmpjpf81WMrPc7aP0dcb2QzkfDLvAxCLZbRH8j2skb74r8Vaq9XS089
         YIvMlOUxzGdOUoChhJjd88M4qikLsz3PgpjJq3h6f8v8UknfpX8DcjgXaXuLtC+LJq5h
         DyQw==
X-Forwarded-Encrypted: i=1; AKwUvBwTO2M9USlBQo3088VSZU6f7EbC7lI3Ri5eXxmWCsSZMWCp5BHhCy+QFe4ubw7bHxs6RE9Krw2i26j8My0=@vger.kernel.org
X-Gm-Message-State: AFuF++lG12wx8NiXx/MNiVOIZii+8aH4N8hGzzKpIMSlFAoxLvNKNrbz
	qT+iDd0faEfgf9pjTb9urta9YAavK30FdU7xDbA1TvjBi3pc9KeRp/W5WnHDJCOt9VLx3Nbyf/g
	H7NfTlOMzhedaFw+nWHF+ixCjAFBNk5gjrle7a1bL4PVGTC8w+rYx51KwXDjolPsQs5KheTqIGx
	U=
X-Gm-Gg: AYBFou3mfJpcm1r7sVL/pWsWmG6FME8ez5HClEldOh+QckS66ZDd4hJne+Hrhfw1pj0
	3adVFhfKzmB1YDNlonA2C0stFVSN3aDyFcYeJPHx60nQouC8Swrxanh1x/pR5AgQ2bbqj3x/VB5
	702cul9Zk13Fz9dMctunvlyRDbC9CN0b96N5e9ZH1Au0gC2jLO+reYX6Eo0zwyUdzp7+zvKtJnc
	kZhRpbdUZ29//jXTXo+irIvWrw+h6ONTCg0T7jBM7GNOxkitzaSw9uMV5qvkPRrRxwbi2UqO/VJ
	YfmEGYwfmyePUoCs1UyNfUDAv13CbSYxEK8HplJ/bgTZFByahBsJXsw7RnwHjv2gsCrtJ9Xyu+B
	7E4/FR9fTvT8pN94rJbZJIblyR5ZUMCuJ58iapBa22gz0/x20QStLycHQsObIQlQmjfCm+uB4Sj
	E2Het7i9RZO/12
X-Received: by 2002:a05:6102:41a9:b0:784:4d38:ef58 with SMTP id ada2fe7eead31-78a4a57f683mr14834701137.0.1788979045156;
        Wed, 09 Sep 2026 11:37:25 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:784:4d38:ef58 with SMTP id ada2fe7eead31-78a4a57f683mr14834676137.0.1788979044698;
        Wed, 09 Sep 2026 11:37:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61670537esm3966734e87.66.2026.09.09.11.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:37:22 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:37:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] interconnect: qcom: Move bcm_div() to common code
Message-ID: <v7rrdfpcj4wi2mjspxhmnrf466exjshj733osyv5szkiebznvw@qoex3pioyqtm>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-1-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-1-6dc5b5e97626@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa1a765 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wiZ877acDUlgFteYXlMA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: KYMBBbNnhJ8t5AFhO6zKrsm_Xj9OfV1J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX+Q4wqoyc2zYJ
 rG3Jp6CUsT52H3HanAaxhUvWjs1RSwBaGKHcR9T4V72A8nGrFhgv7Pc3mJiG5YQeSTsSPRogsjO
 bYMqrZZ19iK0arjaPanB0x/Uczm9F/c=
X-Proofpoint-GUID: KYMBBbNnhJ8t5AFhO6zKrsm_Xj9OfV1J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX7IeefiJ9mB4S
 Xqhzi8tGxOyPI+CToAdhxBiyVjjUkvtLd7yMoqwecmHniAjo3KmcRI0C6F8d2IosmUxJIScC1XV
 RTQjjZbwlmLBt66syQoVeqYgB4VCbOlDek6VQbwI788tFRAnEqH/2hKLozXA8DE9id7xMPpJrOe
 qYqzBzO5ftJuwHamg4vl8KcxQTNoKQWO6SwceVYTgxPNLKbLRO1tMm1PSjFQVoCMarqfRnPEtSS
 RjlXH1738sQTpRgJWpisTAbaMuwa6HeQcFjlRHDkh4Kl6itvGNIReXQhWTVUU6uO3+gradlnNgp
 uF+MKbLstc+D1rzsuQuTqR+BWxJl81tzawYOK+PKZYP+w1HdEmC+bEXBcOw7lM+9GJKEnAhJlZB
 s55gU57pDSuo1BCZ1xwvQoZR4jw6YmeRu1rCcSbRA5GlPscP246nWPLR46RXWUtevA+9U4OP8h1
 tmjo4tdGbztSMgcKH6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090208

On Wed, Sep 09, 2026 at 06:41:54PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This helper is useful for both SMD_RPM and RPMH code, extract it.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/bcm-voter.c  | 21 +++++----------------
>  drivers/interconnect/qcom/icc-common.h |  9 +++++++++
>  2 files changed, 14 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
