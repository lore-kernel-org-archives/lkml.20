Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE0B3A544A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269716; cv=none; b=gnCz2TnXYSyVyFm3iEZA2ew7+44RlhkHCM6VeNApgMIqiffCpf2WHD4ZLtW5YW+PpfO1MUhEhUoOq7HmwF6mXjBRza9Hb7WtgKdakQzK4+MKAh3yRZsIppPTDgKn1ZksAn+0A5NWz+FDlCJJ2xHd8b91jOcJkrhmq0434gaOFpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269716; c=relaxed/simple;
	bh=+nS3GJ9caAk8OPe1Dy93VB7iZrzjR6WWISdo15Mq7yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxNuRioJYIo5AWA6RV0DGdSyspDzLfZx4NIIJjim99VMU2YwhiAs6knQ/LgzgJG2WV+r1Ri9jtcJAysbCIooHgSnETpyJYIaKET2zp1cTyJNtDQ/vOCIQ+D7vy2qPYDs6usgbKu0aayZBfq5sP/Cpb4Xk3F2kDKR6hdFb69YpCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYSlbwsw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFlLFJnt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYSlbwsw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFlLFJnt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e9Ll4103509
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 06:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IokViRR90jEHy3wGwjRgMoWYS3qEdf6BP5tz0llnJKU=; b=RYSlbwsw9/qX/ekU
	DLjFBkKAUvBbcf6biTe3/NdtANjwzK16p/1GV2DLzzhsUSKT70TiZWkd7MJFJhqX
	GopBAGzApDUbqGvTzClepIG8zUxG2992fE7Pt0Sm+si/4Htpqgv9svb3zBjNLY1J
	rlTq6pvjNOeHhXQxdFnRlQUPYgwRTrbKRmCKkU/CzXULhRMz1wMZtlPSqSNpDTTq
	BPHD8yMCtf7VvR5hPUVRD5vxQ8oyEI2c3noy82bV+aAV3SFtQ+NQE1D5jaBhwcqZ
	Aw2qQS1JRyMrodqropKWysiOvEetF5O+JMgbi2whIFhGVzS5mTDBkVC85gbjy1zQ
	abE9Og==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0ad33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:55:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988ce887bc2so2383132241.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269710; x=1791874510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IokViRR90jEHy3wGwjRgMoWYS3qEdf6BP5tz0llnJKU=;
        b=dFlLFJntj0Xi+WLqMqoFl4Jxc6BiyxOt4LiM8QF1nuunUd12MblSy+4JYORWvrbqa1
         0qWq/JL4Acm7GUsut7InkXhOZzQIpWoiLI3jiTKIhFPJ+L9TYa8axaiLVKlUcBx7DcDh
         0SnlW/l8EGnRTP7JMbk8thBb+CnQsUwchADeqfV13XU06TbUYecwuloxQUhe/RwC2K5G
         fr9hXvsXBGsMIBRxcx0FgN64/kY8mejk9umsyT87s1ZBNbxvbIs0gQ7z4s3C5aSgwYm8
         681R9pCFs/cKDrrTO9yKT+u12/R8ioKuS8akYyVTYlBmjgJ9f4bkfx8U87+g7F6366HY
         FUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269710; x=1791874510;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IokViRR90jEHy3wGwjRgMoWYS3qEdf6BP5tz0llnJKU=;
        b=SIMJ5f61whYT/0V+tb/DtUmvw6qKvNiZ2i5CtarJQ0lYVFNRdHJYAA+JI17yA62Z5f
         k/+sOHWR73AF9zHcUz80RsqHaeXqGmsNolNUOqG/vV6Ya7SPFYVXRLnc6vaAn5X297r8
         kavBzHSdRZ8EP0HdzcvSdpblSQDzaL9NdhGRFeCdHFF9ZVhWbs4dyqIuhXUvwiyhuLzz
         JQrrleNxo7VOlFRuWBlGN4S5REIIjiq3bWJzylmtGL6l8Rih7SktwV1rxhoF5OYt4HK1
         F9xhwC8Nl+v5O4NSHEAXCf6GZY6U9AVQau0wOo0WWX9+0+f4rnZv9r8sdlm7wrdQffgR
         2yBA==
X-Forwarded-Encrypted: i=1; AKwUvBwuXWv07WkSZP11aHQ4yWRl/7j7kqr6euVbmgshubJF9vo5GQBuE47HMBkXmEnDHyUMV2sfF9r8b+Aq1Ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUbMRVNQ38riUgOJJFttkTdm8AA/wSf4nZV9k/nmDiAEXuQQKb
	xB/+nonzUfwz3GpkqTwKCIugctrbTIerrBsM3lLxCyvvvJTZD04/jbxnXDeJ/nG+ltNciDDf17X
	n0obPzwnYOg8atU6qUFdi/ZXPKcbLkDy6liTL86XxqKNa8hm5jYR1DxgYxhDOq5BReA0=
X-Gm-Gg: AYBFou1+mGqeU+Ad/oZi0xH/PBWS/p4Zm1NqGokpjwcf7eLM1KxJ+vYWWRDkxIut0BJ
	Me2fMadYkGl3t9Y+lGJ4DQ+RhUsDunb3MqaaQWlvtOnjvM0X0NyYtnGnaAsSsGF3nm6rDXlgTA2
	WXQOUnAJ19yMjgdFcaypWq0lesmdhnH09wak4z/D9sJP8dIwIG2Srln5UvI1dd3RTiOrdGbSSQ+
	aqysmBNgKDPSuU4by8AnhukDu2do62AlSgNPfP1atkULre5oU5H1Zv0aBKyEIL8hujc4hOz/nq9
	9D7etsIRao55EI6N4WVDeonAKdzuURoXbplhc9YH1JfFNeHCnwm4u+JqxiPZsSph3Tl0aqfl7Ue
	P6fI0yVClk0pNaRfW/qtAOkpAzPStETL4NF61HhPp9SjQ1TMFRZ/WJWc4it71Nh0ck+wCyvmpva
	8HS7vZV0KFeMAn
X-Received: by 2002:a05:6102:91d:b0:7c3:450d:2431 with SMTP id ada2fe7eead31-7c3450d2a55mr2443729137.2.1791269710057;
        Mon, 05 Oct 2026 23:55:10 -0700 (PDT)
X-Received: by 2002:a05:6102:91d:b0:7c3:450d:2431 with SMTP id ada2fe7eead31-7c3450d2a55mr2443720137.2.1791269709601;
        Mon, 05 Oct 2026 23:55:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Oleg Keri <okerixx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: don't report link training success after a reinit
Date: Tue,  6 Oct 2026 09:55:04 +0300
Message-ID: <179126968610.1110179.13947180112289626975.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925125314.16563-1-okerixx@gmail.com>
References: <20260925125314.16563-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX2tfXvrC3YtBc
 CDVpLHEM5dSTv+StJqNzww7WoC+UuTQ+PG3dJHczcatLuAW2T8VgxC475CyVncqa9DaBJTCQ6+5
 tXt5Pv75AcWTFCrG+jrbmaE/XVhK2wuOUUA4pPBVBeu0p2iQTXsxtuSQqEZRIYtyt72ReGhrgJ+
 YlsfK9blq9EEfW4eu1wE50G6F5d9XXqongVGAWedwcGnl8l7hcUfnHNaRnMoqJ1/m9iXvWPgxfd
 H1OySn3W91xAp5mr13SrBK2U0ULlWb8vF09k0euG/sDIg265+RowwNPRQUGackwvoHAvf3nU6jO
 pONvG7vPkza+5tELLLQQEMwLGBYD9No7AFwi+G4N/TaKeBb8IM0NFztzMrof4hbS7jblfdgMJBV
 trPuFRwgUDDnSWILbHoojhqvBjukXQfP9gXLWsfYHqWiJWHoMeQHeTOqmW7vbPpLcXkiNMRJhnw
 CU4IQvs0mAmItMb1jlg==
X-Proofpoint-GUID: NoB7APQ_F1Yvr37SDJNjhKUpgqb8xL1f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX0Z5aGzgm+ThN
 jlv48NkXwkbbtNVbLO+VAEhSWfelPwLUzAsHbW+1xTE59k43SLei9nuc4y/GA8EPmdSpB9om4Zq
 VQqfBVuIOWt1DnJfQSjPomkql5jGPms=
X-Proofpoint-ORIG-GUID: NoB7APQ_F1Yvr37SDJNjhKUpgqb8xL1f
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac49b4e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=m9j_GCGoi3mryc8sS7EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=1WsBpfsz9X-RYQiigVTh:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027

On Fri, 25 Sep 2026 14:53:14 +0200, Oleg Keri wrote:
> When every training attempt fails, the retry loop in
> msm_dp_ctrl_on_link() ends on a successful
> msm_dp_ctrl_reinitialize_mainlink(), leaving rc at 0. The caller then
> enables the stream on an untrained link and the display stays dark.
> 
> The retry counter only reaches zero in that case, so treat it as a
> training failure.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dp: don't report link training success after a reinit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a47987366e7f

Best regards,
-- 
With best wishes
Dmitry


