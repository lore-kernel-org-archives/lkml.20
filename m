Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020722;
	b=ciSSENC1oWDrmxy4NxvqvchpiDa+/w7LHZj6k1fufewDw65qEw40JJ3L58LLxqR4Xe5L
	 Pcars2JixHGI1fvcrb5KKSCjnxT0va/EPPIIW827MGjMCUpTwwVjO60x0r9ROvuo4f3Td
	 sclO4I48w0e7GvhRpYwtoyXWEQWx4A5M0F4M0VWvrFDLQRlsOfbo1/SdEjPOZ9aNetOQT
	 hYS+waK0ppkyHM9TwDq1q98FVADwqDS8pv2AIgxCR/E8Mrs0ufiAvZU8xBz9eYdIsGWMt
	 5z6FfBWX7BxGnWk129ZKxBn1FHIyR0AsYZDAkWOQYg2EVjcBEyO/XZkYbYsfefAjEQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020722;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O6hrhU2TB9rVsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=;
	b=Nmydg8zRpHBv9RqfNsWxB9R8AQo0J/Pypi4WkXoDrpSnbWn+KyU1tKmG5FmdOh2DUQKk
	 bj8hQ9OBFdtK1+J2RNDUw7EPEz0OPpDhutwaT8La6Fqfmy+DSY9MfH1pzEU9HlNlIVEnz
	 a1ewRcJ9UaXKNd4lA1d7/R0bDCgOGUuLNqCX8Sj0eY1n3E6d3QWi4dXwQS71VKHrP+mn4
	 pV/rNcpxqrJsFiHX266rfORAufCVYzIso0Tl9A751H6yLLVz9G/2D5T5C1Onm8h4hLyFL
	 xTsusxOAKmeE64QZHcY72gvRb+rsQutSn0Yx5+aGwTb/AhNKH+pIKkxBbG3SeLhsK8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DZ/egG/G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZsPBHXn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED1A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED1A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DZ/egG/G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZsPBHXn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAta4M1548003
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O6hrhU2TB9r
	VsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=; b=DZ/egG/GK+Mov6W6DChHfL9rtzr
	4vPzJgp9SN531V4cFO7s+I2kIkT+D5itugKjsdAbwwzIV3W2Q8WKiF5MrgX78sOI
	lAgHBXFIxW3R90xJl86q31M7DJhnHdvYNvGiHx0ee9WI7JbJX+a7LZkkgEjDOZno
	aiPRcqstWQhK7FyjCnAoeV60BDrFzoIn1Pbl1tl+fG2PYBwfJPZuuSNX9uvYEdOp
	bz2Gz2+WF80ZtM6T0SVW3QFqTlyKZMv9p5TTzxwHG+oHFEZtKpajKKJxYJHWDm4y
	kjpY7f/KbuNv3pIUmCxHsSNVqx4c8gEw1iqsyHRgM19m6NKlV9c0TNXsSGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstke4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso478349785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020721; x=1793625521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6hrhU2TB9rVsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=;
        b=TZsPBHXnXbzTwyrObCcMtxPdmqbKCDkN0mUZOwKBdOGTzorFBid62dueC8X+5dhKHV
         KCiX88tMM0nRRgfpWDzxlymN6yjjJYpF27y4esg00WI3y33nlA5h/O6pIqAqKnT/Jhly
         jnNaNlkd/SQv7bq+cXeIyJrjjT7SQ/1BgsDQYsRk8fKzPHN2BQA8AYflwgMuqNMf69SD
         SFLeIOrV2B4Slvj+1qpFE4v65JX3rkWG/MyBsjX7vm7aT516Tovs5yOnNA9Qez3Gvkut
         9Hj0nF/4HrrlopDNkajVvIAqOm/iVgtvRaRmI8AgjZL/HzkkVnmTSgBnzqw5Z0T6a8Z+
         Ah5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020721; x=1793625521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6hrhU2TB9rVsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=;
        b=cAQ2Yeyv9T4BjPQOJ2YAUM1O1HSXVlQ3NKGzPl8YDKh56/cCkvj4Dib9vSWZA6BbRF
         NTJPfFajVUACmKJsgufg6ScowHG3Q8XZ34FzoYvN+Kxq5uLRzRrP+iMbAaCiANFpACOJ
         D4xYLhYhmzzrbAlywXZvX4ZAvAFVpsZN8FPyX9kjDl85x0gHzRfVHVkUXzv6TmQJxrSO
         rYZTMAvQpBYE8T3S77pVHz4ZziCgjXY8L5Jb4IkfrxbhK3gxYisp7apaRVBH0rFNzTSw
         dIquwQfbKjXTaZDx2HsKLfA7vV89WqXeaIqTiIzoutaxJ5hIsNE0P3uPAsLaDZ9l0d32
         wbiQ==
X-Forwarded-Encrypted: i=1; AKwUvBztnOhrAj4DkDfa0YtTOmM9pkPjpm8XWJWlxF+38sUwcCKy21owznsny6ecs7I4kfKyfZ4A1O4OdVcEIVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbsB3uVR92tyHuYkW3f5K5KLcphe+3kMjDqxmzpIKlPHxZD0+J
	U5oUOLZAQ6cGDO+5arlHQScYMRBsYULJKVZHrCEv1Lmo4j0mQSU7Yjd58DOTgWau6FusDJ5/kzX
	ir4fYvJPaI6lwKAJnHpYANKrxaTdUfWIhmwxdAz2oJ5QWv/wkVhEXYAuRk1fOxxIE74s=
X-Gm-Gg: AYBFou0hC+qjomxJFnW/RGMpFXVjHcseQMmFKDvwHa7q+Y62SAP1mMD1h8bz1gu/M8B
	6+0IybjifcesppVfYbrArCx75kDZACAWtO7xkkzBr7O4NBzjvtsFT1tdn449djHGZhWjU9Uuqt1
	iFNY9YmQBipV8c0yOEeIVwy8OGpG9FiHV3d4C5DCifzo1YnUwYEtcZgNObiChtvKvDmUY/CqJrJ
	OM133drAeEtC1uiBh8MG3UowSMTqNVxEZevYP4Wt45Z4mDu+Y90cInPuldfHyBCHrwrqgTlsqlU
	wEXyRbV0HF+dtYgrm6mxcU5nRUi3oLut0nEZWXtCYFZq79V6Wr8WaWEVse3qNpZmheT4su9Kdo7
	DzZb53uJ1SRxurBOCd8DGYs6a
X-Received: by 2002:a05:620a:4589:b0:93e:5060:f929 with SMTP id af79cd13be357-940ef8ad22emr1013163185a.19.1793020720922;
        Mon, 26 Oct 2026 06:18:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:93e:5060:f929 with SMTP id af79cd13be357-940ef8ad22emr1013155285a.19.1793020720353;
        Mon, 26 Oct 2026 06:18:40 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:39 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Mon, 26 Oct 2026 15:18:33 +0200
Message-Id: <20261026131834.3247963-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f8173d20-3193-45e6-bf27-a05de7187ae7@kernel.org>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-6-atanas.filipov@oss.qualcomm.com> <f8173d20-3193-45e6-bf27-a05de7187ae7@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX+xt4ZMco1i+A
 NtMCerUrmvzUVA7VH2THt9ro0tVKDBRBCN5aczTJ+45wwCP+kLUwb9PID9eDRzE8pXXmtd/1AEe
 s1xWMmqtFnj80U3V4TWS2wY7F9zheM4=
X-Proofpoint-GUID: fhkcDKRiEO1zxkw8XfY4NOU1IQSlbVc_
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf5331 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=wnPfnd104F1z6JJcfBcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fhkcDKRiEO1zxkw8XfY4NOU1IQSlbVc_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX7V8Qnf2HSqaa
 nB4CSV+VJBlkFL57SSykc24i80OSOIBVRBrOwM1xya93GzjXUVEIgkoEhAU/6VttdK+ZbqM84Ml
 xK8b/cDT9zXC3iXN5oQV6ROGsctCHPgnD+A8mfjKgeMydueBNVe7VIOI5RSBpdJ6RyIyATRiiv+
 Mv14XgIlHRhrVh/0qk5ZGzI3pj8A8cJ1x5jpfKCeDMaFKfXwUgCjqJSTssP6nTl+pUaaZZ8jozL
 0MH9I9VtiwvaOhgU8VlMxo03QFKDJIxU+zQM95WPxnAFKj9NzZnt0qYAvjB+BYfhe/dMYLYiMDm
 J59EsX7rbcAuVVeHgYFAV2zDECn+GUqF39OE0GAuAjoyfQHvnNCxrTD0DyXyhBgk0SGkx08ao+I
 qpqN1iAEEe3GDnzGFvRUMihT0XY01sGuTX7OfQ2aIcjrIg6AgMpaJ+UGzeIlBBufWRfRfNZni3N
 80NQQ2HUYQknKfyXVkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260052

On 26/10/2026 09:22, Bryan O'Donoghue wrote:
> Why is 100MHz a problem and if it is, why not just fix to 400MHz ?

100 MHz is not a problem by itself, and I see no failure from it.

With the rate ranges from 4/6, VFE0 at the CSID test pattern sets the
fast AHB source to 400 MHz; starting a sensor stream on VFE1 then sets
it to 100 MHz under the running VFE0, as the two AREG clocks are
separate clocks and their floors are not aggregated. All frames are
still captured.

v3 will list a single 400 MHz rate for the VFE AREG clocks, so neither
VFE lowers the source under the other.

Regards,
Atanas
