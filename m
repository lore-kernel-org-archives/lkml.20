Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BAF5275B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066583; cv=none; b=Qmo4IHXMMJtmHKJQZ49QSh5qFx7xuezggFy/3vDtutYj5kI/7qtmXKZpLxpKZhKW1ipOw5zhm9yH55h+NzkO514SqYHxu6XBIVjNZtplwllgros9nFpagnlcyvnd9gxQuHz4aVG9RuqaESnWJ8FZHu2iVvni3Tnt5ysQb883fBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066583; c=relaxed/simple;
	bh=pXqlOkMzl3JBfz0/OwEXm1d/v3Shbgu96oivzcCF36E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mfG7gPgXZi/uUYVmPGyRu+9k6ScQIsvCaxExVp+ppDSQcS5TDsvUvC9JAPrQTFMVlmNSM3CfwDJg/DnbV6DSt1ZrqthUWIH5hrWTK2xY08tozRclF+04XplvBVVVtcCIGqX/6UsEAcmf1l3NfaDwqMbFpVjYWykIKv1sVObX5Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epPgNqge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cx0yEdDG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epPgNqge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cx0yEdDG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4MuWs3383563
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DlRtbPmn3NgSdVIqkYavs8zAzN8VtemkTrdfku6MeYQ=; b=epPgNqgeSBsbuVt0
	lgzSnc9ZhlszBTaHh2wg1PBvcVDozrkF2cpb98/urjEjWisJZJY0ZtO7Anpuywko
	fpm2YglLDO/0QD7cYjxyJCGYinISHwcJLms0m4TuIgxo6dLjPsXgUn8jLFIOVkFm
	xmjYyTU3bo++vonbNipGQ6z4wvDICi9x+G514XgycZXNDcgKGiFilnrxGkJTKTnM
	pAbOR4G5FA2OiK380iVIKvNo+DX3ikcdOPpeOzhb/c+CpePghVNpRteydPfNGrF1
	CKUYF/nygiTWgWMYrev1QLbTeIgxMEtRjAQJFgh75OmU38FP8uPBT6kpIs3qZAXm
	hY/5Jw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8y25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:43:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso682910685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790066580; x=1790671380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DlRtbPmn3NgSdVIqkYavs8zAzN8VtemkTrdfku6MeYQ=;
        b=Cx0yEdDGM1Pgb025zHKZPWDql5+B9F2NsZiBLuDphQnfs/9xibb9gznjFBUAWFTucx
         oF0PYsjaCOMwHHme3zXV6YmIJw0Ccgm0n8q+LcZQvbbWtjxMVpFqfab6OWeD0US/td8x
         Xy+x/JfVWt/Z52OLQIXst7tkes7MtvuH0N2o3ahqwu21dJVBcDuF08tfMAgbVKQdzjcy
         VgAZA1bWR3aUi9JQqRtlatxz6RUGMku6FmiLb6g2S85BKsPHhzQi9B5c1oNxG5oAo5ZS
         3UrqABhvT0VKg3hi7BFoUmeZxbOO2moLlsqwMkDcPTbuOtQL/P/kx8q1lrn6Zm6rddMw
         Ftiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066580; x=1790671380;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlRtbPmn3NgSdVIqkYavs8zAzN8VtemkTrdfku6MeYQ=;
        b=1BqWu0bjX3ej7KaZmGLVcTrDxgMxVSbsl+O2aZolHKh6RKY0TPhqvKjTDRzAF3dtCt
         S7QoWUcbntZpNcYr5RfOZXu55uExEHqXEijcyKtNhR1fH0zgJSLm1ooT5hTqylI8QTKn
         iAgqGkvZn4TT6Frqep0JoOBjMFXuwGQMBQvzgGAeJcBgVqhfD4zaalJujwt7snl2uMCP
         7t7eIf5pGrrKgRzVyIbIFcdbidknF9izyZC5InNFrUue/yj3ZAqUUVq+D4FvQxGDDPws
         YZKwf2ipKaWETe6ldVnvjWfkpr4Xb7SojEmGuUF06KxXvZxsiIsT/Wzh6RWes9/oxNJD
         UbQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtBjqtPK6ax2RKqwb9nNPiVEcJgLJgii7Csa3kUGY867OO6uy6sHqWReH1ovI+7pYsmU/pvYASOJcF1UM=@vger.kernel.org
X-Gm-Message-State: AFuF++n9DH1AznCTE40JJ9/yfAF09rUEBHKXTZtdrQXSJ27Hct7MVgn1
	0Wocux6p1gjE9HNNdVbMDn5rP5keDgnFVzFo2YL5kX4azDIzOvNsLOBt5zg2OMN9ajpObLjc94N
	VClkHI7yz157iEu2sVDFzOluSuc/8BmL/aVX+3WrnETdrL96CHzzYhKK9L8C4a7Z6x54=
X-Gm-Gg: AYBFou29WAk63l1WRmcG6Ln2mNnbrU2aBebN9iRYpR55uDFA4pywsvG8lsSKWIdjgfe
	/1f1K5Bpw+HCANd8YlXVEcODVNMJoeoycpu8kI1tS5EAp6G8c+LWesLvbFj3qaUaeRvWjf0tTr8
	ZaiUAfkqeMAiIB9cHlqWXCOb+4XN94aluPZzEr0Pr+0TGt2hiighKmqr02KSc/JcZ/PtrX3x7tJ
	YAtmd2gaPlvNLGruVQof9JRMOOM1AHj2Ng2KV65dZOQkPoH1s1BnwaE2LHFbG+uAX58Mybm9+N/
	MINRYunqdxy3T3TNrBTdYUYzBw/4OxdO96Ku+TWAAXyum0TYeIMOvxLSxwFeVSAAOHRxZ+agM89
	xy1HaJuCd/kzZMy1sGj1kproJJg==
X-Received: by 2002:a05:620a:4083:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93c15ece6c1mr426386485a.59.1790066580314;
        Tue, 22 Sep 2026 01:43:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4083:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93c15ece6c1mr426384885a.59.1790066579957;
        Tue, 22 Sep 2026 01:42:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862774882sm3404017f8f.13.2026.09.22.01.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:42:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: dln2: use assign_bit() where applicable
Date: Tue, 22 Sep 2026 10:42:57 +0200
Message-ID: <179006657513.13182.7255050775005689990.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918141713.3022960-1-peng.fan@oss.nxp.com>
References: <20260918141713.3022960-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oHGa0SesTjWshqultFDDMIj53xYFDjx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyNCBTYWx0ZWRfXyN5cOPRwoRSC
 H8EkVl+g9IIIZdDTFzD1+vbiSBYSUrBQLs2i+CXBD6NCGg2EGnzwJ4KUdYFLqtC6a2nj3w7aD47
 i8TIUjSHGgTX9EzsnYTym+uWrcFKrW55paSj1XgSToePhrvBDjrKjsrBTNOtsE9jVSOWQZMBloJ
 nHYeZh6ukNWDpM/F+58JJdUkNST956jGwPe9itIPdqi1WMSbNnl7FwfUXlEuHcDag+jwbls9LlV
 czyA6JDszq51WE62wyF8PMVXHLpJmrXJi5qcE3cr6a/5wKUKmoMpZMw7DmLbynVMIIu4Zxrkr7V
 6J15JoXRVyQZSP7nO76cLlzRrm/AxgTGiidpZQxfayHltpyHKR5QxQCPmxb4oVGNG5q91h38Auw
 o81nj7SWcM0AbGgFEJBgtEGwax+DfQaM93cF5zakTzIFqaB/WMoIwXUxQUu41ITjAB/vBAtHMwG
 jePbPXIVsS9JO34z+XA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyNCBTYWx0ZWRfXzIuc8j6VN/3x
 zgpUM0/3ZaYY61JpB/GyoMjhrE1peduy3Us0SBf7Y2N5BtN+ZGi+bjWU0w4k1t1FbHO+Cv7Zq/E
 kbwvShw9sxqukAbBrAlPqjhFmfteROw=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab23f95 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dEPnEWtLcj580ZCxWh4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: oHGa0SesTjWshqultFDDMIj53xYFDjx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220124


On Fri, 18 Sep 2026 22:17:13 +0800, Peng Fan (OSS) wrote:
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
> 
> 

Applied, thanks!

[1/1] gpio: dln2: use assign_bit() where applicable
      https://git.kernel.org/brgl/c/b399579a8e7b2a442f456df86cafc33628da420d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
