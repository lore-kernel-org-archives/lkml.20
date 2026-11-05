Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868775;
	b=qir30DpY9vZ5AbyYXo3Q5/MJSyrcS9N9xOPaXpDuLWzNIfColYyMXnLEYLotn6YORDoH
	 RoUzWBq5+41N3wSUdvZ9YZ2NISL5tfoeZ0/a3VwMrBdAn1JtEGz4PmxcTe7nT48oz9mUP
	 gpgXzIYvyfQQrDIBcmetvg4d2/OERPlANzapxbY5kyuSfk0zG1YiQh9W5wjRsZOJ9YWcN
	 tiAWR/BV0oWJPkjn1vtEdj6jLUM1foSq7NvzPY2TPC4N7NLB4/FYyXJ/wKMfEptQwlVEf
	 oMcgsjwHlThusbQ9+MPE9EmT2G5H6Dnea9z/ol+aWODj2e23eHjonirOFhRCAqSukbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4K4DKH1Ri7tzBJ4HHfUyDBR0jYCz2IDl/JvyzqdqgnQ=;
	b=bGzAYZT9bAaVzvjFaaGTKWL1QzevikWGbCgdGeR0fMLb87fKXYkT4viwKV401kw2YWdd
	 BX4i8d8ToAry8IzK844WtwEOcPWUc9WaWTLW7rf1b5GGRphUl54w+YntRr8gOR5qdTFZ9
	 0r4zhzKIg299PULUqlGw6Ew/LuvTn2Ln8MHrtwmwsdt4HUTRvoJDitJrnlxcSdD2JmYUO
	 StdANdldR0gKIPetqQXXzzge9i0WdwRd7OQNavyEo3GstJAw1P9tmtSgHekJIwJBCl9Mq
	 q0JYkUuefnu30tUSuCwoNmILSw5LQKSkX6G7XdCWTIsnsGjvEfqs3F2P1kul0GwKdUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdFaqPeB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWHmH2U6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4E6606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdFaqPeB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWHmH2U6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UYXT3624811
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4K4DKH1Ri7tzBJ4HHfUyDBR0
	jYCz2IDl/JvyzqdqgnQ=; b=PdFaqPeBQ/N+GRf9Zcxpg1cvwbKwhfgNdlkFhD2W
	fTyVT4iWQ3gNK/mGWti1vgNcpKI4koWveZLqGF9FMSlalXXuEkrka634lc5H2Xj1
	LVcezoP6bqSiz0nZBFGTMV+BrunEWG2OEAmE8RVDaISQM76HuwF89M+QGngx9Oq+
	XRVo2s3BbX4aBBAuQOvy3RNA5ZzVN3nync4/bXDxXQ3r6kjuGAOu86kY5zvOLMf5
	QeEVAaI7wl0wsrxCkkg3UuNA/DocF8si4l0Eqbk1ULTDXQLq5XRZoAzDWDugaIoZ
	tJbiZZ2DNRiw6/94DgEkf6eGS6whvFJSW8feIWLDMFsQpQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br43h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:52:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so324476785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868773; x=1794473573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4K4DKH1Ri7tzBJ4HHfUyDBR0jYCz2IDl/JvyzqdqgnQ=;
        b=FWHmH2U61EFNm2RTA5R32Y9UGGpOHo2RyYgD5mOhxeuvc7KcrhIxim9LExFXCZ4qij
         jn7vzMZvgdjQKJXoiOFIOlJLY6Z+ETv6YO5OJJ4/7MdLJPwFz/AvI3XnPmdqYp1b4phk
         sZKVOL8DAFJ/YqfhfIIFQWH8X7LL2wUMZIjleGV/AxMF6Cjihd1ji0cRw7YPDJWg4O6O
         1P2ZelJS69LUbmwwnO7gVYess78j3Pq/2gWfgVYzCM9gi6KxucleQwb3wccjiNMhXNZJ
         YmD0hRKz1NiWESKwkP5LUHczBsbCLX5X+PwvRRyZEL/D7JheakepYi3rgg29sNojB+8P
         kNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868773; x=1794473573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4K4DKH1Ri7tzBJ4HHfUyDBR0jYCz2IDl/JvyzqdqgnQ=;
        b=XLd5evip/iwC1hGDTt/SlOmFM1M535NFgJkDsS1S+xgoNLZY2FBZ0cxLr4nshUPe14
         y7t0ubEY5tYvkwKnTq1M0OrdkaIsynkbBYcjCb2ajlfRRWJpUNoMK9HqhHXtjhqoLNZg
         Jv2XDAipTndSrf/lC6j+y+F4CUF9oEnMGIatU5fJ1laQt5kiaHQtcoGgM/gFyjRfm0aL
         T+scJpL3KD8yZx83YXQqmR2h3s77j9kKuZvyuFBg8f+3v/KZW1OGprAY2ksHYsCMGJ1U
         saIwFWX+sD3vKZwj43KVcaIpYMhA43cGwyyPf9KFcQaMQloCoGhd0JO8MiPSiL7rTilH
         T6vw==
X-Forwarded-Encrypted: i=1; AKwUvByarQRzLGVrGtY6nfmu4AxqTyGdgKRWm026RmIx+fdnwn7gn/pe4zlbIU5WWIYPvPbGQ8nkDhkAwNFYW2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V2o30y32P+aWLb6/mvPXZ5WjETp3wC4CcViEyacziGjQTNUbA
	FY6tt/jixsyDLJj2QbxBt80WHPk5vU8dMuJpp96B8j2/sE9+gqwjDkvv2QqnHCJxK/qW8BIG4x/
	vWg4DD/b3PaIwMUZ0w+/KHGYS5gbd5akQMYYEFDdQtPJ2ePhmhBTenhkV3hN/Hf3UJ+8=
X-Gm-Gg: AYBFou2X3corGOBLono/gXAMNCxROxCC3Z6wAZgdP+vYreNVznrcx8RmqxrsJfA2LmV
	z8jVLHGNwLQ0l5e53QDBc+piqvmEhi1g1HhH2TMifg/1/HTDmvXOWn5OF4e4slQtsAUyvioNhzW
	dMv2wNNycO7D/WF6kji3E34Z+qDuUPVrovbsfHWGsltCfeZHN75SnhPorecKfvx9ASG+ghXO/Me
	JpzAtgq5+ZQ3wSS9zMW0BlRQB4F4j1+/f1rOUDUWwF9ob+QSQ5eDLUjyoHm0k70yuTiN2NvJDMG
	tRvXU6da0UQwtXS+Yp72wQhNnDnX1I22og0ytf+NI+SKuBhS6R9LQ6VVaEcU+zwqUHK8ctUeUlC
	YAD8WKH+NevpWSi5ErWjbTepkNc/KtGlFRbx0oYhnAHeFxI1iuUOp6wWWN4qkHlE=
X-Received: by 2002:a05:620a:288e:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9442173ff4emr3213228485a.36.1793868772771;
        Thu, 05 Nov 2026 00:52:52 -0800 (PST)
X-Received: by 2002:a05:620a:288e:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9442173ff4emr3213226085a.36.1793868772184;
        Thu, 05 Nov 2026 00:52:52 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm46154115e9.7.2026.11.05.00.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:52:51 -0800 (PST)
Date: Thu, 5 Nov 2026 10:52:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_pdcharger_ulog: Match on SoCCP
Message-ID: <ch5p4bsgzkn32knbscqznd6yyg2bgbizyeoavagoj3yl47cxji@vlzovz3sqvki>
References: <20261104-topic-soccp_ulog-v1-1-e6e108ad049e@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-topic-soccp_ulog-v1-1-e6e108ad049e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX00sMdjIFC4Nm
 5II+yLvroPyd8RG7n0QI0Az+A+7tTgzZkNVs08v4uCXsMUuKhjy1PxKHGLIJbfU7/c7aDbL2+JQ
 6o4s0lKWgH7EFxG/JvN3yVsojuXmCr01s1S6UTltfQk55Xw9MOnNE1pHNyvSOhrQxe1RjHoYpij
 /ttc3lFlDrkBlbdr0e1OZeWFBgPZdJnSMNFHsBJdAFtd1AuHPRAo+xLdaRipyJGhuajGlILIr7d
 ZIq8rYx4irACwUlRmNyJHeYZnQ3oYota/q4786uvS3OJbth1nHjfWLIdh1it0spJJLlErGftpMp
 sVmue6tVm7QMfLSpCFRjfLc5eHnimDqNyGsxtW0l32XCdZDWg4w4Wiu3BNtTEFxZdjzst/uT8Ut
 UH44i0518jozS+X+a7JKfpxhasd5hQ2LUL74sRK5rcAYXMWQmFeVbnWM0F7DLu+LCUNY6IqJrLb
 d2aNkd4jfvAU7A1qS7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX2u53Yi6RNS6V
 +58ysiEKE9c2EZ4HcF6N3VNd6lI47ijW6jYCOud/6ofccd3hCqeVS0GQVbpBWSuOKNiQnYqDgtB
 NFbjYnmdsHb2yM+goemah6QwVFr/R0w=
X-Proofpoint-GUID: hQXmxd5E4TQ-qYAbGzsWNiAXBqezWrje
X-Proofpoint-ORIG-GUID: hQXmxd5E4TQ-qYAbGzsWNiAXBqezWrje
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aec43e6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5ubZe29uNZRX4I1kwKoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035

On 26-11-04 19:43:29, Konrad Dybcio wrote:
> The battery management firmware, as well as the logging service, is
> provided by SoCCP on most SoCs that feature one. Add the match entry to
> enable logging on such platforms.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
