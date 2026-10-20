Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490909;
	b=U4407Mt+LiInrFWpFVQ5q4553eNTbgUDwNeWP91dOxEZMLhmfOdkhVm9tV7KQ9+E3xKO
	 1otEfJHNDCopQl38ZM7J2p4e5rbGjqufDbcu9FqfhOkuHkhYPqo9Rpb5Y6VkVRqvRLLxp
	 9C+/ls/0cxkeTBzlbGHA+6u1w2T8mrqbbqmVsAushG3Dcq4DSuLrDBvPrtx7o/yDb7gSK
	 P/bfpJk8tID3VaqLntjnoMLJsbLwWMQJihi29l4l86gp1WT5Hw2ET2Dpdqu4FfUfA5AmV
	 2S7fUwRoqDpPgbO855XZN0tmRHEesUE0XhZt15PuqXuy3gV6nJcDdbWRMNK0G7Tntjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:Subject:Cc:To:References:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=58+sjcUUXLQgHhvGrNg0LfK6mENj6ITYY+TpEzI2IkY=;
	b=hkbHy5TDrhNrmvs3h6ZJb6JFoPNmXfNQEwjVerAHuDwzYdVyDbr5Te2KZMZJRTN4mTSK
	 rvV04ai0ZNyW2Xo9TfEXSx+8XgSCqWNTkpXVYdyEpOmAckNYBisRt+XJJVEd/oldUu6nK
	 E6/3YpXKgqsjiV5O7wjWV1GtucAkzd/bjUc8ZBeK2bVvmqBg4S1lPAohKlsksnxQ/aBj/
	 Dy0RiC3OeCyUrJhphD0wmgBbbTLzWiFWNK+MMuOmLbp5i43oMpdPXZza/1mFP560clo+j
	 vJo5oD/cqnG987AcwdxmXbTjBKJH2a/qCfVI57EfzhXR4QNJQXn5Hn33J8o9P+qIYLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXIFw2VE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYDVv8aN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DBC606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DBC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXIFw2VE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYDVv8aN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8LDct1211286
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58+sjcUUXLQgHhvGrNg0LfK6mENj6ITYY+TpEzI2IkY=; b=mXIFw2VE1AlAzU/C
	N6sS3geJDQxogbZYW+Gs+PttJWKPwLg+BUSahZC/laokXSeitMkwJxXnuCKL0QYz
	OyugH8k1thnmZp5bvTDS8R4ypQ0YOCsrAy1bIV80NebntKhtHvW6U3gwBR3vFIlM
	WerHi7Q5KXSqvqRdMq77TpxJDQPfKFlOWUcVAxLemcooelhhS4jciRC71JnMYaFd
	F4HncvuOhCD7kiHBbK1SZGYYmNvwyh5ebbGalohOj1BJ6pixjR9KHsASWQjTHkUl
	WQKTp0w3f3HCWRujYNcBkus03oeaUouSHTq1QXHrCKQp73b9Qpx6iGN+GkT9By62
	eFeSRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p20ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:08:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5365d95f4a1so35870701cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792490908; x=1793095708; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=58+sjcUUXLQgHhvGrNg0LfK6mENj6ITYY+TpEzI2IkY=;
        b=cYDVv8aNGYJDmw+v7oZ9Ggbz4c9IUxeOKCZpLF1ZsBDkuJpd99ZL/DeoNls1D6miiR
         78wc0Tv5gyLzJEQFqs35r9GgOV/uiHAtcuorq83RrhQVp1xWmG076j4EoDnC1V5tbDtw
         BBk8hkU5ZLJGoSd4rTLmWiZHn7oPeRz4CyGSMn9v3wYFDBMHM3e8yiXGSds+ijOtUn72
         27qYoJfyCzHGaxVFwyQJEumtRwm3Bm5fvpBezLg+cLJKWm4kWS1YEgFJjSNM5C66FFGm
         QpzN+ogAezpad6PyHjXhAb+5OUcqV+odFy5HlGay/6agY2x+gxjDjFQeZW16a+NnTttL
         R4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490908; x=1793095708;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58+sjcUUXLQgHhvGrNg0LfK6mENj6ITYY+TpEzI2IkY=;
        b=0/bAvYy8iDyrHb2Mk2wjWMGvCYogub5NkTZOPOeHAZRcdenG1I/YewjExcthA3VI1/
         2YqM/l/7POQbyNR6Gdxymmy9AbTmXNeto7JUX8Kz3oIHO4X/lIPPkOlJobS4HYDc57dl
         SRlHu7EQGSJAPlw/HyKmTA9JZuM0oM1ES5YyIjNCC7IM1PPjlNGHb9aq4OufXHVB1SDH
         MM7fI27ljCK/NBxLRLg10G0bFg4ud1PQZuzA5L665dBMxR+MFoxWlAp2j6jg73Oyi7vs
         UG2WqYuXTqYI81zYTkMjcRkPtL/JU1IHwRh3LN5aNxKdf8VTqCMlcJA/HW4F6PQWQNPI
         E93w==
X-Forwarded-Encrypted: i=1; AKwUvBzpWPEj8KKA2YpDweql86mqcdWNW+fA9XOY0L80uf0YcHyKIaUoihdC9iJN5s1/4y2dBGJ4fER35CqMrss=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6xZMBsbAuG6AwW/qy37FK59GbbCryxY5J/1gkoijvjTwuo5wT
	sCXb2kCdhhQs8Wqbu6HywSvi9yNpd4GAQxMsTXgHstdy8lwDFLhBJyG4khrGEvvm01Pit8V+M5D
	ZFbhWzC2UquiDeRrJ5XOjdxtBXm5zCYfUvlopHlJb3pMfJfC1JzLt5zht6DsjeLy5ZfE=
X-Gm-Gg: AYBFou0H5XNfUgvLNcWrTsCWxTQPZT2FkFYfkaS3EmChhPDrAHOqOhC4Q58MwDKNjAM
	2YE1JKOjKfcMP1a5ZwbRwkyjOkRcCrGxTkxLhi40Fn6CXae7GY1qeoUh+KYPeCN0HC3/2Cio78i
	KRTXezZDmZz5DEYoeMmzt8sHuisBtiocKh+db5LIvojam8sFDf6lHeA3vYXAdaGEUCe87lYPpEx
	q0r23qhZcB4///tmvH0O+0tT2RLh+hNPjm/6pdO6X7McQWWAYJJtl5dTjOIMesECw0jF5hRJ+7f
	tnVVWaLAGAkKIIXhfuUhtEZPUToLRjmZSp7hGhdXRUrHD6Jn2GYJPXykwI7vtg4JoBSt77+x69R
	m4+KoE3M63ezvAUwS5CECphrl4uKB5rm9F2jWEQ==
X-Received: by 2002:a05:620a:294e:b0:93c:89a0:bf82 with SMTP id af79cd13be357-93f29d6f081mr1775354285a.43.1792490421964;
        Tue, 20 Oct 2026 03:00:21 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:93c:89a0:bf82 with SMTP id af79cd13be357-93f29d6f081mr1775343285a.43.1792490421184;
        Tue, 20 Oct 2026 03:00:21 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f99ffbabsm4757595e9.1.2026.10.20.03.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:00:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:00:18 +0200
Message-Id: <DM9KTMFKWFYK.2QDRQCZPPEKTC@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re:  riscv: hwprobe: Report Supm only when available
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Guodong Xu"
 <guodong@riscstar.com>,
        "Zong Li" <zong.li@sifive.com>,
        "Charlie Jenkins"
 <thecharlesjenkins@gmail.com>
To: "Andy Chiu" <tchiu@tenstorrent.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
 <atKWa5PU2ECSgocI@Tao-Chiu's-Mac> <atKa3JDynQmx2KS3@Tao-Chiu's-Mac>
In-Reply-To: <atKa3JDynQmx2KS3@Tao-Chiu's-Mac>
X-Proofpoint-ORIG-GUID: jh1Aux1YV3_0A9QoJY2ZdxijVBHP0x3i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX6re+h+DKfKug
 6PlQBGVMC7cMrgO6xYv+23QgCHljX25JmYG8lsiUkVkcD5EqjcdpX029GnTgOYxekEOzk5cBFV2
 qEkmAwGxwp7mMRROQRJnJBSjhzpAsLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX50mLe0SPRmb2
 JuW5/7+uGxKYkUX0iAhEY4evxQFrT01IXk0a+8zebPStWiC4juMnV2v3Cv+7AyhYHQdfzF0Vu+n
 rRqJ52LbpU8niniG+ZbILpMk/AfT8W8fWJ83aCBTOfz21vpjZkOE6uqg+v7nV7LKyLR2e8uHYAR
 NXSoRHX/hYb1TRLltHZ0Y7D94wcbSnALZW2MHyrw/wSfmYliP4/esM1GUw2PgMr36bWELZMxBF9
 rhjrAFikzHhXv4pd2XzdfOLyEK8tScKrer15qijwMqI2CacDLJToHThEU/MXvUFlc7Fwsds8RUo
 kbphVwgOdXZ42dsybGtNlCLzw1h0v4akTNMCim5HAriwrGxJoW451T0togFtanu8J+m7S8df1/V
 2KHJ/dVG1EjNIapf0SlLLd7KdgE7+PwJmWSha+0KAc9ZhxDt+hNzJnMrF/yfo5eAfKw0ktx6Obg
 hsFN9res5UG/mTSwf5w==
X-Proofpoint-GUID: jh1Aux1YV3_0A9QoJY2ZdxijVBHP0x3i
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad73d9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=t9496tuAAAAA:8 a=1rQCNxc8bWSMfTx6MfgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200040

2026-10-16T16:45:00-05:00, Andy Chiu <tchiu@tenstorrent.com>:
> On Tue, Oct 06, 2026 at 09:53:01AM +0200, Radim Krcm=C3=A1r wrote:
> >  ---
> >  The compat hiding and global sysctl toggle better fit in Andy's series=
.
>
>                                      That series was dropped because the
> mechanism was not in flavor of reviewers and we are going to deprecate
> the prctl[1]. But I can see there is still a need for understanding if an
> extension exists at runtime. We will take time to revisit that

Thanks for the review and clarification.

We could make the design cleaner without losing practical flexibility by
abandoning the sysctl knobs in favor of kernel command line parameters.

Boot time configuration would stabilize user-mode execution environment
and we wouldn't need to expand hwprobe now.  It's still breaking UABI,
through... I'll send a proposal for discussion after the merge window.
