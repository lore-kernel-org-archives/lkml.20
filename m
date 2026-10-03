Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3059A2DAFDE
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988435; cv=none; b=LhV5homzWkCrxG5jneSfPbK1ttRLryJr3RHHJ31tw8GA/Lf7aHx9fpUJYDllNQzIPfbnq4rh7yYmO3LSRVdDfjV/sm4faTT7YdYrKf8wljWsee3OtBC4Ei0Y0xJ3pvH1gj6GMm5okcARPnsgETd4ZbgEKhM6CmEjfCAt5U0EhPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988435; c=relaxed/simple;
	bh=i8sQEYGkqaTl95BcFchqoZwUFdW7vyInSL1Gs2GlaAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hjMlbC/lixTE7Ap/XE/G2rGD802w+0bAFtwOtMhwi87zZ8lA9oo9RNqg717qsJZzojJwz/m0JGCZU/wNrd2Y/H0zJyJh3EpGHGWbSa/143n9Yj5hei/S6saa9HfTHun/Fqw+z2MkzcGJ30aFzR/rv6AeXjFUvCTO+c2ht64L0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHMbUlCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dT0JbWUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHMbUlCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dT0JbWUv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeX932929025
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VG//oFdfsErBkvF/P9Zl6qRt20SthIydDI5DgQhlbA4=; b=YHMbUlCvA+71nHeF
	cWHRlu1iRBUBxr6B5qXD2rYN29UKxsJ3SUHCncvzfYda9IHPl6Obg3zHOU37FOIy
	jW2xhXRVYmwtGz0kcCUWSmwTIBnoYyoAHbRda1gb6OTR9lly0Y45rvmim7zLdaYD
	iUceoz+jjkBNMv8KPrOslhVfWNEDPInmdPD5srmeqyDBePro/3echzjmBnsikTTL
	oI9Qv9GSYIhdYlLhWe7g6wFdifKazjCwHMePJIu8jYPkwq4KM1LYgI7F1qfyS4Io
	DyRmenDfbnMITXPNPigp9m1CpW9oePdrtWsxZEuoMUD6NOcjk+CmXa8iGJ6jpaGj
	qF5y8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfvvu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:47:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so14758185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988424; x=1791593224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VG//oFdfsErBkvF/P9Zl6qRt20SthIydDI5DgQhlbA4=;
        b=dT0JbWUvn96gGEiBqPuD/sxpLXMnTbdv7jqSALrGlxjtU+vpxyadYfx/Y2fHL8+gLb
         TgstxCTkT53tm4pDmE5/b7ZXC2kezjH27ePM/jpj4d60sDcHdJDSAKAyLvo+jVJIdTu9
         kQq83+/lghSEXA8yIcEvLw+7extF19ItEOgxS/48hZKAyRU94sIBRyFv38sGqNIscCtT
         BtBpyWxo0WcRj7mfJEbUiyuDCy7/Ex6OG77obSa11GFRCC/gGIcUuNNHlP9/sGvjdbAu
         HQLmGkPh6Os/pIraY/q58aFB2C9fr/vhO5IKq4s8/VGDi8t8EY82n6/1ez4is05tj/5N
         tPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988424; x=1791593224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VG//oFdfsErBkvF/P9Zl6qRt20SthIydDI5DgQhlbA4=;
        b=AFZD+m+U7rNZpdk8r+OGvmU8B1SiWBnxzXcn+YlDXA3wWmd8FHBsy9DTYKkuk1KoA+
         Q2KLVGE2e/tHqSWya2AboTYLkI4h5hbNFq7HIkPS6wMhMpu3JNi4cEARllWDd+NgkNfZ
         ih9d+uvSa9HgE9+aV+AodlAh9vWaRJ0cp+A12/vA4iLc+Dhl9fEm8g0Z7BDXZ5o5/gcu
         c/+ZHKTjXCkJ1rrAXofk2LD0qaF+ZrGTRvFaCYrCV6yDPwgMuvd9vEPcfxIPivfffLd3
         Z9MaudXwgBV58lREUqdj5q/SSngeU249YHsIPWtLLjG4ww/PpgBdr4GtJ5wxJPNuXRdG
         V9Kw==
X-Forwarded-Encrypted: i=1; AKwUvBx47NT91VIJFvCXCtyXbpdHprJtpFoZ8uvIFR7wwo94mlw2cdw1PHC20A7pYySUA2C6jrfntRzM3PtvHps=@vger.kernel.org
X-Gm-Message-State: AFuF++lJZPxyTDBSv9RPt3Fkx6mWoD6wQu9ReOQA30tS+gtuuIDrh5rS
	f8VkW/lbCHp8BbcFbt7tddWwuH2+2EwfPP18Ud3pGnD8nAhWJ+s4ffDmRfwSv+2HSsm9xZjxzY0
	fyqJVtbBtbAQVTIxg2hhK7g2wDk4+zqu74SLdrK9PTj0QgQwkYN+7L0pdrqpWMQpPJG4=
X-Gm-Gg: AYBFou0F3NC4nl4JMUw03J6aRh3/79HV5ktiWbAxBUB5dHC6RqV/iRoZjN+RnO6qjt4
	as9UgvjRNJ7zEqcuFJrfMKnhq3iswxQN+A2YGCumoj1NeSdkaexhUFSRs7P38c3An0QE69UDKp5
	Uv/qXdKSqlnyYcu7oJDXac3M/nw0mQTl4s+tiMrrLazLhblhNAlAg27lVFmHwuBi0sdaDY/wuYZ
	TNxd9E7YIQTtOBKCtjscHM7wG34zxTCbWKzxIo9yelj+DR6HzeukdOeA7lZBsNUauifSRMayzH5
	OhtpilzisfaT2SYWYlMyVegbVF1LfBimCcIGWF/T1GKLs4Bok9bUsDcoHOileirBTTi3+jaP7JB
	Vp0acOLCh7uFLszfVf1xvPLi5Q0jANObw6LGZ1I8NFIHqCuR4uOmbjx5htmqCZIp39e7kX/7/3F
	0bBhDQPtcGTokx
X-Received: by 2002:a05:620a:28d1:b0:93e:5017:d505 with SMTP id af79cd13be357-93e5017ddfamr265252285a.19.1790988424177;
        Fri, 02 Oct 2026 17:47:04 -0700 (PDT)
X-Received: by 2002:a05:620a:28d1:b0:93e:5017:d505 with SMTP id af79cd13be357-93e5017ddfamr265249885a.19.1790988423717;
        Fri, 02 Oct 2026 17:47:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:47:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xilin Wu <sophon@radxa.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 00/13] drm/msm/dp: Add static HDR support for DP and eDP
Date: Sat,  3 Oct 2026 03:46:54 +0300
Message-ID: <179098834069.3641559.2753228491265144134.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pN_Ribao6ZxPMS1VtoS-HLUkmkK51M6t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX36hIosqjpXfk
 FbeqlXhZnhOIlhuw4N1RHH3co8ZbIor8QvBtAiUfVRxOWsVrEtuBV52bHriugOwRptEm3fC9rtx
 Izd6OtVLI/9POn2JJYgFp6SlDFlxQ68=
X-Proofpoint-ORIG-GUID: pN_Ribao6ZxPMS1VtoS-HLUkmkK51M6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX457vYq7VKFkl
 EJ9c/azHHIZLdcdU404nnsObGf4fwo0bHWNMtBFSO68yLBQ7u/HRwvL1CsaBpFHBU/3zT1I/+3r
 h8fb7fYajUpX7gTzVBuk+FPKTJ4KBXScso5nBmuiLTql77JlMg/ni9ZW5t6ysJKkCctqU8GAnFo
 jaaeynt6O6YdGCsWpbItzGFjC+DiP6q7t6P0OhOr7L6j+KcYpEzHoQX555tisY4LyVOQEYuCnig
 VOgWt//PmYAs5FPMb/0NgVkwBH0TLpaIW+jb55cOVfE3wCRQn+YvLujSLgGZp9Gl6/AYWDJ9OGo
 N4NN8sNw6UDru6/N2sLDzy9USOnO0jt5LGLFYIcknayCmDrkcWQw1dqVD2utQtaev5XSslXAEA2
 CjvDKATJmiWp467T/0S1E13CwJTCFXmhsFyIbng/KoxQG4JQOhvXXle5eGz98/TrJBHG9cNdaeF
 m0BjtGSEtQq+wqSQBcA==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac05088 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=p6THbNBqQQInXpZJy2IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Wed, 30 Sep 2026 20:41:44 +0800, Xilin Wu wrote:
> This series adds standard KMS static HDR metadata and BT.2020 RGB
> signalling to MSM DP and eDP, with HDR10 as the intended use case. It uses
> HDR_OUTPUT_METADATA, Colorspace and max bpc. Userspace supplies the HDR
> pixel content; DSC, dynamic HDR and tone mapping are outside this series.
> 
> Patch 1 allows max bpc registration before connector state allocation and
> initializes the corresponding state defaults. Patch 2 prepares generic
> SDP slots. Patches 3-5 establish PHY power ownership, serialize HPD state
> updates and add complete stream enable rollback, including AUX recovery
> for a connected external peer. New error returns are introduced together
> with their cleanup paths.
> 
> [...]

Applied to ttt, thanks!

[04/13] drm/msm/dp: Serialize HPD state updates
        https://gitlab.freedesktop.org/lumag/msm/-/commit/62c6146e5fde

Best regards,
-- 
With best wishes
Dmitry


