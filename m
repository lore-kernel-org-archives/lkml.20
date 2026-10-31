Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483333;
	b=sMq9ZG5U3LJTUl3YqXa7tTy8T8oIgAfqJta3VAeqzAkrDcqMnatzqb5caLxW0umPqTvc
	 N1g2GtvNlvkVJavhoKHCLNlsjfUsa9siu+8ufXtX67ZENLJ1DVWkw+N0wtE8SCZ2wIcok
	 waeNZov5Tr5fPye3ucLVYjx3izlHGROKbH/76eA2tggMf4MjFynILLtK8/hgWxqElep/6
	 aSFHTuWgjkPaBpnJ4OGdOLjIjtXztFQQw/QJE7l68GDVNUaPhwzIXvFnMOd1CRsyY+pCg
	 3np17ePehRwJ2BEJpnIUsFRGBqik0RzkElTHoGfM5A3/casfdZDe1m6yij7n6OdnGnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+Lhjmp7pZXEoSu7S8VjkEKvSY0g4l0O/7K8WaJ0F8JY=;
	b=TOjnsO+fjrOZy9LEjufigZ2azWNiFlsq7dQp9mkMXnsqfwiRh9S07fCxGd6KCMIGbgPo
	 v8rvfAsIHgtb18N/sSz00j4khlP23bHXC39yUEmnZf59q6z6ePcfoC+4jVrqzedjPcJvR
	 FU0ZDX4FyiDoiMCjAOodNSeClcHT4PcDmpat66fEpNxdoYxY7LHeJEad13E6SjsNCSXc7
	 Bbwl3w4ZL7ZMCKN80NP6qLgL54Qo8lBAY6biK0aRtRWuBEP5cFO1NIVs3mTJSViUX1TCi
	 3IduwZCHmIrfG37FibiOjSl2s4Phlk1yEhKKNnNmgTswNYYug505T3KdQZXXktP5vxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUG10rbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC5xRwEN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD357606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD357606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUG10rbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC5xRwEN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJEs7o2968857
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Lhjmp7pZXEoSu7S8VjkEKvS
	Y0g4l0O/7K8WaJ0F8JY=; b=ZUG10rbO1FpoTeNiOmCzs8M9cp+V4F7Kt9yOHcOK
	eyxrWHZY6Cm5oI9tudJT25wC+RPH3fVrJeXxiDrB9ZRAfcEt6r8xfh5UyfzJR4iC
	x7tf3RMbDGL/PGxKKNvC0ySFsjwtZJkG8173nYLK8KH21dEMlthhzc/8ypjk43Vo
	dvjr/kpXgLLleTiHgMRX/f4qzh7RfZBEHSjP3b0nYlaNT/fgtDNnjnnnGzHEHjSv
	I7f13wQiXGRaM/ANEXB+/A5eyto+2ZjMUOL0JWqnsOQmtwmVIsFDGVy1N4TCxn48
	VY8XAN9b5zSLK0XEJRTlyXYrU81rgB0t/xz5dRzhtD0ndg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkjh66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:48:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91becce058aso39105686d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483331; x=1794088131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Lhjmp7pZXEoSu7S8VjkEKvSY0g4l0O/7K8WaJ0F8JY=;
        b=VC5xRwEN9dJF+v0bQoqtw6h1aQYnrjoXNjuxvamOOLwJQHGTkCey6RYucq/J7n+es3
         GPR7uuW/3iRwOWBm/ZqoOix/cXE+N5r+JBrIZsdNyPOv6IucMe0b2JaSFoMEs5ZmJMBo
         XxlbpsuVUeejzVfdHZ8UkjcmQoGvrvQBt56Q68xnKKbF7T4AlY1/TDv94UAPIPy4z2Op
         YWr3IM1YQmTieTI9SYkEqcKd1UWWMHAHZNh5XP+S6ChNrgbMUNzkkCcFvcmyl27PbNFz
         mELxTNYxvN9zWJj7dtZt3zaHJ5+HVw8JWOoxzwuu/T4OtMnZZNVJlaEHHtnuLL2/riWY
         wEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483331; x=1794088131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Lhjmp7pZXEoSu7S8VjkEKvSY0g4l0O/7K8WaJ0F8JY=;
        b=b+++qnmD+DWh7IXMtTz54VGa1o0iyIspauhqQli77KzDLbVeO+WMF3ApX7+aQ7DMAm
         YjF9OPHvuflUi8VWd/+fciqoVnZpvhS0KReL6YbXR2GnylmXwvYNJY+ujSFXH6r/4N61
         HBS/qecEHamby4dVWga0EYqfOIcpXOvRbTrd8OZePfyFocLGpVJYLZ8Xy0lYJg3Gqbwz
         e4IvM6nzw+h2BxN1zQzhp7dArAeBRmU2YG1Nu9srNyvegs7bdukIMrBePXZp3CablPPe
         navwRODIojdhNOcLNBeaZnoMXiEj6gh5zb/6INV04Wqtm/TFPgvAVqgvvFAO3rEKU8qt
         BYKw==
X-Forwarded-Encrypted: i=1; AKwUvBwLILchqu/ZUdYqDxZepJASa3YFde/4HhA1scPmF2aZLwLVS2vnyy03uPB95Fkpb11fnHI6U5ucj3DW3G0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcgPkF+ZFFbEvpXUKWM0T2F2sdOFFFHV4vNKyQz1fS8/loKNDu
	c5HBJmPcZGmcfNyTpjWcJ7igAZqZ14T7JR//GH05F6SN9qIfUlVxRzPeQhI3KHJ7sZ0YYc2MPx6
	UopygK7FhSh5W7FhwJpfIoLnsEty+7n0jWEdyY9H1vXEwoD50dJp+6OHpeaUwPqXFt8Y=
X-Gm-Gg: AYBFou2abq9Nd4rYOw8iIXlbTdoIGx4dpHOptKQj0557kr1EZBfONk+tMRt/jZKnKWn
	ppn+vokCCQaYYswMNjtoUZSWVsLaeGahi/92VykI5uvpbmDtIGg0NSHuvBpoDMXob8d7vj90e9G
	E4bS1vPhNSZxCl5gDZ37IMwlNxRqjGcEdR0WK7lyxx7zre9j97arN8vpgX5LUKv5PetIzec0wL4
	FxbwPIZJwBlP8g6mYjj6kIyztX7vQFaZUKUfkTzi9sPwyzdjnzUF9lpvJD+Vmf/zrVytjJj7sQf
	jmdxqfl32pWbQDUZg6odRXWmWZzeqYkP3j9W/tC4fy/hiTsqraGPhY60LefnqnBDCkENIznAPWY
	8pNlBHRECJr032HfungbxE2Te5ig61T1MkzBLxqYGZpqkxahXkdtBFh2CdhjphrvjRvA7RnhprV
	sTsSQ/1pQJdEcSA2G3o+B3IimoVotpIPzky7xpP33L3u74WdU1xTAFIfBdQxStcA==
X-Received: by 2002:ad4:596d:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-91ca4ba268cmr99988516d6.54.1793483331088;
        Sat, 31 Oct 2026 14:48:51 -0700 (PDT)
X-Received: by 2002:ad4:596d:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-91ca4ba268cmr99988266d6.54.1793483330659;
        Sat, 31 Oct 2026 14:48:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbee0094sm13744921fa.20.2026.10.31.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:48:49 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:48:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: djakov@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
Message-ID: <ms272llmwo6na3e3i3qxv72zvxedblxdisxfb3lswmjrbobbej@zq3hh6srj3fw>
References: <20261027-icc-sm7250-v4-0-f9bdaa3c1c7b@brar.si>
 <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
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
In-Reply-To: <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
X-Proofpoint-GUID: rXtd26sO7irPmu_K8W6UHCDuFD2fcCLp
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae66243 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=rbLHc7TusOZuPl1584oA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX7FlfL3k8lZYD
 Ak0HzSb+2OqgfR1QLv62WaOR4GkeTlsX6u5vxuCz0rtlYLb+z+vjYvnFAg6ngxJnqXSmzEt0UYx
 D2NupozwQ5wwP9dQTTbOIIiMz8g5jao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX4HXd7jes+aVv
 yY52CbRY+/JBtZflJ2UTlpOdmqcZIvDSGvuCTiPewu3YtlBif3B9PvewMzgwmYMFIFER4uHA7Hz
 /hfGIMlS/le1i61gFJQUHSbyQ0qgYcz8SbwiI4dNAiZ4284Ptg6Q1W5383GAcDXcaeZe9rcBJCj
 aesmp3TP96rbIr1O5Dwm8wiy1yI5CRdBxFtzgh9n9K/9GL8b5tF6oqNU5X+6T5aQjlRyhuvzKKB
 /wJPZKgPlOvyX8zen2bgs3gvPRmA/ZbU3mV7sKqJpODp00hwXehCqbkP5XApnasanU2wh2ZYQ+G
 ARmiaT7qE3jhtFYslQwMaS5QLql8QJ7Qi7LPyy67xUyUmISWwM38rAUi5rjFz9CWbqPzRmwya4b
 EAaBr7H2hR6W+Rk+yiuSE0PqwRYp2HF+HGdhYIG6YyjUawW3JrecpOrMscaVi0+OT7IojSraecP
 2VHM+CBWAc2SnT6B+AA==
X-Proofpoint-ORIG-GUID: rXtd26sO7irPmu_K8W6UHCDuFD2fcCLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310086

On Tue, Oct 27, 2026 at 12:42:25PM +0000, Ishu Brar wrote:
> Add a driver for the Network-On-Chip interconnect providers of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G). It follows the layout of
> the other RPMh based providers: the nodes and the Bus Clock Managers
> come from the downstream interconnect description of the platform.
> 
> Tested on a OnePlus Nord: all providers probe, and the UFS, USB,
> display, I2C, serial and camera ISP devices get their paths without
> errors.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/interconnect/qcom/Kconfig  |   14 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/sm7250.c | 1489 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1505 insertions(+)
> 
> 

-- 
With best wishes
Dmitry
