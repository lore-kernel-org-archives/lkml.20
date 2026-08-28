Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA222F7F14
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912210; cv=none; b=Wu0jbYQKwCNfnjHwPCxqGHUjDWpEQDNI/cqd56AY+V5onxpwqnSUj2bKJDa7e6ipyWBvNnmx+/3oMEXNR5IndgaUb3tizZMr2+Zl9IAuhaU8T+A6EbuzLUwFYv4XMWNOCAcPidOw90y/ET0hXXg6psyHFvajPq4dh3l2VQ8WF2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912210; c=relaxed/simple;
	bh=Pr7XYcNsNx6NFmmYHRdEJqPnkQiZwTd9ZLn4JbDmhF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLtjFf22QkrrXep9ndj3B66b2Ajg2kGjNfbALcmAa3nKDUx/rxBulUdHWT9iqtZO2IftPa4XlsWPEPDkI5Dcp3r3v02rpL0kZbWVaPGq6hVwUbSAB5dd5oth7rhLjmyWA90dDTErX3LiIBNIRTmGyruq4HFLmlu8GLEkmqB++/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+3efcbD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgH/ryHi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+3efcbD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgH/ryHi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7pBT2152641
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MJzRQ+TxZwJZtx4rj95o7W3G
	i/oMwqlmwnUjZaaQxXY=; b=L+3efcbDL5b09VaXC/AHU4Kvz9PguOI8/4zKP/YZ
	vRrhfUrJPRX6+oddid/PV+N6D8bgTucXGOn77Gsnt+XM5HCMD4RmLqao6EZQsH58
	WuSvvYIR/0Zw/jOWnTfZSxxhbvwIowbWQoi6LgWGUZYMUVz38xFho/D4ZHntISF/
	Eqvg0nFZFSOfSuy/aO2om1j4m3+jpZn8iAO4nWwU/ukwlhVZngH9FBrJThUp6yVz
	9Jys4UzW2vFdqlnzMMfemNcfnywHfQteYyBab4ZNDapwjO7+QNHCG4heIqtUL5lv
	PnvmXBs60yRZJuP/b864lBD3bJXF8Xy0snpZN9vJynXqGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r95ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:16:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fc16ac179so5344591cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912208; x=1788517008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MJzRQ+TxZwJZtx4rj95o7W3Gi/oMwqlmwnUjZaaQxXY=;
        b=EgH/ryHi+xcvY8sClsrccEEZIVm1vHAg25Dt/ujjXhqcRWAc4n4dkNzsNbMnwKVXd4
         MyN3nSIQ5uRsGRxHU703Vu6E5kgHQVhaBNg/l7Ll2yGD2IgaZIxb0lxe+j2rPa10d5BT
         7oMj1h07zjE16Df3c6HclynobtyK7pLpH4rvtKw7n3cys4OMbNl0hOwLCLtjNFs0f8WV
         tyY8DqxKUXVoE2ePQLgqXp/EY6flVlUgzxfoaFQrELI9Zb3GuOtLtyAR4wpcYnESdyiF
         Tq/f0fqYzWUGjGbM01ipRLi0RWkg9irOe8vR1/PswVvu+yN8Z1l807fTU3qgmqVy6p2P
         Zb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912208; x=1788517008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJzRQ+TxZwJZtx4rj95o7W3Gi/oMwqlmwnUjZaaQxXY=;
        b=NZ3haVxatSN53Lk0F5vENUXtG361Wx+BGBgk1VRqdnpU0KXLV+7F394WXfYEdO38fB
         /fjCkmU35jrNit0DMiJN+KXQEPWleujVyisbcm0iBdM113UsdRE9g4acvutHPTdpyL56
         qGUbyBI/hbefbU9AlqLyyPVuwunHrpnaejduZqbMzDXNa8ohawlkB/kHkDHAcErQnf1Z
         VWOZ5N9sPDrOUckmTQmKQmIL1F638uRVfmiWBx+8Xyq0eU/CryhI6BbIt9BZtg6/T8KT
         8Qqykxb7YlNvAJMt3AsfF/d9eTXSQm0vq9i1wGjsFgMemQjQco4pN7DaorKYQgTfpwJS
         s2gw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8DSN/wtTptp6UlBrQaRRSvCMJ7gA5u0SoATVOy1nkGIm24HOycx0qYbLmg08WDkb1MiY0f0mgBv8T0mU=@vger.kernel.org
X-Gm-Message-State: AFuF++nVWgSPPew1UQLi3O3U9B/NRNt5iMpeZg+4QQL4ayYDWoQLN8k4
	/LoPSOI6nbDC7pW/W85Jy4U+wIfZy7OGc7wIhpEGP26hfe8sqXJjYXZ5wFj11yZwwBpmQLx+0D2
	+aphDnvM38GFzo11rKzGtckpf7N00p10v/Hl1eK+TJqNZk4xdVSTtKIDBCxf0MyyFzbrVOaVQEi
	M=
X-Gm-Gg: AR+sD10iCSP1ZCg5i1EJiTT28LkOHjnBM27KI1I68RnXh0eE/Dsiv89umr6d3dMfE0e
	BVAnwq2Wx7g0k/9SymLcNq555UBufR/T/GrJ+L3Ty5yi18gdQea8nP/XLaVKEPb+hOvANa48sBS
	GyY9X/RcDWYG6C7nRGz/iWfwoHOul0L5DguBKuVhrIE8eG9dECsKuSpz7xpvNOucaF4pohNMoKP
	oNstDRobqj23phGYO+OHEtPSJIyJuHx8Xg5T0EBZPWK95rt5dheffwzacjgBJVRLoFAfFSawgww
	PtJIsm7xUguXRmBgnDyk0Lt2Gd5UcF9PmCVzvpQXhzrphyTxUksMvreTFF/ChzyN6//8gTQv8Xi
	nPUAAIPGntGVwQQ==
X-Received: by 2002:ac8:7e86:0:b0:52e:49c5:42a3 with SMTP id d75a77b69052e-52fa1bbba1dmr136345431cf.13.1787912207699;
        Fri, 28 Aug 2026 03:16:47 -0700 (PDT)
X-Received: by 2002:ac8:7e86:0:b0:52e:49c5:42a3 with SMTP id d75a77b69052e-52fa1bbba1dmr136344711cf.13.1787912207137;
        Fri, 28 Aug 2026 03:16:47 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm45373525e9.0.2026.08.28.03.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:16:46 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:16:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] phy: qualcomm: qmp-combo: Add DP COM v8 header
 and fix register layout
Message-ID: <x4mvoava7l3wftqspqdsc7f624hvkr3r2bmoettaqneaq57c4n@garrl4ikun4j>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
X-Proofpoint-GUID: FN_qZydZYFFc2hjW8e7nwsMzOvkPNieV
X-Proofpoint-ORIG-GUID: FN_qZydZYFFc2hjW8e7nwsMzOvkPNieV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfXzE9qq3CC0Knn
 QLD3nmItFChlQE+2TL3VBLv1htcZrqcfWkPxh7+D05sd9Q4V2MP44HQkW5DkU0XaADHJYwLHrMi
 F9engYOi/7NgRXE9hnCfQAOfShV14D6S96QZM4JTYRVFv56sdTgbVlJGC3GroNod8Hds03L3is7
 QXrbHF/kZzUaoV2WQ4c5DSD5oHOkBTs8uNIQ30R0WCyq3op+7297khcxXgAmuv8qOKsta9FcAzD
 sVnUhfz1sw7A8VUJzxs/MQKJuknw5q0bW9CjWJeeOb0Jr68EVr0UCetSu85y+i/fPne7seFGGeM
 OzkBZAkMG7SofNKJIOtzAidygUvdF4iOLuSeujpHT7Gow6g1+enib8yGXKc0JoYYmXGqU/OhQm6
 jsz6Crm/WHbS7bPgOMjZJmXsPqm3SflnToA5z04vo5emUhDPs1wPFSPeThdaM8qQ4LOo4JSJLZ7
 9XUwsIkcSKPNe6IvWIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX9J7dZs85NNmk
 C1lHRvgvZMvaHVY+r7RKyDGZJssOusid4ZohTpbV/u0E0rv/ytYjFNEDJKdUkJKhsdpRlT7gMok
 Qt+170p/dhYDaoCIShQEwrpnycyp1Y0=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a916010 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JKUcNUVehQOhZJPRnW0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280088

On 26-08-28 15:13:13, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the new DP-specific QSERDES COM v8 header file and update the
> register layout to use DP-specific status register offsets for
> C_READY_STATUS and CMN_STATUS registers.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
