Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D36B3BD653
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371426; cv=none; b=ftrjuBfh10UJ5E4RLltNJ8zRdAhvVUn5EdAyD2aMKQIJhXbdZXoCzDS9zOGjirEmpyN+7vJ/SP2CoFe7kuRJ5UYmRDXPtZR+b2B50rUMNpX28isnGEe+G8jLkb5n5vQGDeIb7FsjFWWzL9+vZaHEHY2dTPdlmBq7XaNp6QJsfbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371426; c=relaxed/simple;
	bh=x1nkctmLdzm+eKYIxds1fsZioTqfgcib0MN+bNpDhTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T72CQGnPUQ/iZsKDCThC5vVyT8/mtNRqrClF9ok5ADTyr/eFWksov752wtN42+HETXyV0PNmuFGTdV4Rdr9HQOOjzKEiadzZaxFi//Cz1Q4EGNe2niWCqqMXw8Hg1hWNycZj+XRBsifltvHAN2fF8rcVaqdJBHnsgDI4+U2bFYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1j+Viu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HIVhJpbj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1j+Viu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HIVhJpbj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jEa23842265
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0lMMfxXywXVBgLJe84wAsk1F
	o0aToKDQrrqisjMGSIY=; b=Q1j+Viu6rTgJYB9gXAl4Odd3OgxmvyRqeO+K1n2Q
	I4wrZU0KlxEwbyWqNM1jDIGdUf0BqFezKvreqjTClGdCyS/QMsD4vXjtsP6ZsIzV
	s0Ae9Rddi3VeFxe0wJbUrbmOvV9z7RsQexWpiS+rPEmgF83TjbYsht60DtXVF93X
	6G3d6MO01ivb/E6Vj2nyNS4lra4D9adWA0sC2YD1+EDEryhUbBMW+4l4qrYhEGja
	u18OIF94yDhgCh8YDJ0/CMy3yIN/O6Tbb1Gj6zc+iNgCFu7n38F5CRlkS6Hts5P+
	R5dj6XtaZYlfpLNiVLc+7V0BDsRbOPAs1Oki6ZUuZcyToA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5jgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:37:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so555338585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371423; x=1789976223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lMMfxXywXVBgLJe84wAsk1Fo0aToKDQrrqisjMGSIY=;
        b=HIVhJpbjd7+twEXxek91zX9PrwRGxv5KealOmzA1tz3hra9fzkufEOHnXfndMGPGGS
         pbcEqN7rU2X8wT0N8wuajnyPE2yyyPQySYh8KEVkRLoJp9ZBEipAy9IYXoL0ZF7U0ftV
         EJhD0+gUhurp4UtDQUnrlX+YXoYFGWtdFcrYJ+PYUyWEhvjtYXR/jYYqsfZQbDCqzeNs
         A5GW3YfwikJDWy/3NzUOif7WJS7X8LRyF7mDp6nzShLK/gfKHwM3NDnExm2292orIXBi
         2IGB0tkp26qHyrCvGDmlotva69P2P0IL4U4hdvnOsb968YLyy5G+lQQwnmSmZXPE+XRG
         KdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371423; x=1789976223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lMMfxXywXVBgLJe84wAsk1Fo0aToKDQrrqisjMGSIY=;
        b=bkmySPG1Vjtpl36Frfw/OohfmxQPhVR/+Lk1LxjiuWTSArgsAtpgO9GdiUu9aW9cjm
         ohZYCL1mCWnMOHL/u5HxbGGrQz5aq9WW307DZmK7vibTTuKgowktnBvFLiM067DWhz4j
         /foUbzSZr423i9kvH4348sxXv4szUSkFJjHQmo/tuTK80xU+BxRT7uOl1nCJ6ZfpHJeE
         JnPbujUqm3BDrL6pK++KtgTcLGRx0fIx19kg0U/lypqtpU2e8tS96vA+cmotpWxyhWSE
         8TEbulujtmLURrnGDqHIjC2fLo34OPU6eqqTw2URWLj+bwSPuUmaSrYzBLfJ/RK7Rqk3
         vSRQ==
X-Forwarded-Encrypted: i=1; AKwUvByI9m7qF/rYpdHCMQsFSv+UrwKJnlho5bbRZaImRvTGButuz5z/7XRyF3/DdMEQw+rvcY7dvwlK5gDYQbI=@vger.kernel.org
X-Gm-Message-State: AFuF++kfC72MTBbU11QVAWfu2WcM4cf14VfhSnBFU8aNz0pGyz6zT2Lx
	pQLOC7CTuY6XzB1KW1m3iEnmxHak1n1cOd4/rm14ZDeRAgZwyApKQcTUgWqwJgLFj1Wh+tOhCRs
	2Hm4N5uYY4wHn1whSxDvytCGSYI3iCLZYnnN00cEew7Izb28DF3KtJl7Sp+B3ss0x9/g=
X-Gm-Gg: AYBFou2MuEpGiHmR3ilG/jdRZE++nfzx/KGuv1T4Jjxkdcf1B5AK2yQM+mV6khT2QV8
	IeLJnevPhzTM8ncCYorCoEJ6M1LkEs3J2Vcm5MClJXB0RHKxsDHGGTlyDWLwrTrvcvm5itkHV//
	ZFgN/J0BG6YxbSKmmHJuOYkA53gsg4gtxw+i0b61RDKjiNAj8nlZfaKSlE6kyy77YtmIagbJpNc
	O38nyaDFlCYtA8sjx0a9xmaUf6/uPCGW2Jst3xBr4mXYKwJMYr32r/+SZXeSN+KO4uS896GKLU8
	3QK7hnLslnDfr+vQn0CGUmRIQ5O3gJEK6OD5w1ZkruGdJUamIVb5tboWN+bs7BunEV0SIJDQzk/
	ViSupbmGSUrKvcDY=
X-Received: by 2002:a05:620a:2548:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93a296fdffdmr200282485a.2.1789371423299;
        Mon, 14 Sep 2026 00:37:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93a296fdffdmr200279585a.2.1789371422789;
        Mon, 14 Sep 2026 00:37:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm26423399f8f.23.2026.09.14.00.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:37:01 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:37:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 07/31] arm64: dts: qcom: sc8180x: Add domain idle state
 names
Message-ID: <xs7l3k7bf5autezhevusjc6gwxk3fkj4d5awf7m4m22etibfdi@osmbppcbkfmm>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: o0rp7LFmKe1u9z6AVnx5xm8C4_eqB4zi
X-Proofpoint-GUID: o0rp7LFmKe1u9z6AVnx5xm8C4_eqB4zi
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a41f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX/vkSBBhC5km/
 ZOMDgCVVm+pxGDEtkejyw4iDGm/ZwIa7q9eeDE3Hh7DEaC9/gtEql3bIbqtiWWtZCSpvfg77hJx
 z74gOHJbuCBA2IsO7HYDRTSbxH6FtMrAx+0EAjSDv8abWbCN18Zwb7NOXE4/+QaDBk2SWW/je3u
 JOmcdKwW4O2Kz7rlq9N0lO3Q4xclbNmB8dcwchE90P6Rhk5wDr1KCfMUPzBVwE18TGeMTcZR7rB
 YtJKBPzMSCxQT7VvbK3yBeli2ctiSGBJ3MHf+aiK6mX3eSa7UhwK+MjxM2eyqfbPSueW8ubfoxc
 5rD9DaK402Kjoguk7Ktn33pc5uJTZLjhstJNTXEePKDoDyJHzaCDZu0zNLyxoVWz6NZp9K3+LBm
 +7p9AwYzVG28ERl/e1NgS99T4mupUv/+NOgdVr9Dy/Dpob7NcT4/OY7D5h/Rb0ualc3+8vagYAI
 bILv578Btp/jLIC9Frg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX1Fa3csqUfz98
 vlZuoFm77bJi5yKuMmv6tQFWkDsxoye7YYXxi5Lmbg3+0p/oVwnZBPnDleG3l5/YHwvcTHqg7rM
 gke9kY0YyAkgrP4JV2jQ0Wv7OhZgCKI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:39, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
