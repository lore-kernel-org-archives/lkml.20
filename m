Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619213;
	b=vtLyoxiiF9Bhp8klZCh+Dsfe8Xxi8vlpfg2VTWDBIBev8ar9NJz7ELxQ1Z/Lbuq8fuqf
	 +ylFPkJMD9PJAaSYK2cO5PpM6nYboHk7r/6taC1RiE+io96ods8uAzFNmagHmikPHzpBp
	 /puuwk46Dc5J7J3G1xya0NJ47Z7F0BcKEDKYfhCqR3LRhbzECkT+wL337SsPbxTfUT8Iq
	 DWgqO+opJdZzKjtmRLHBZnT+mduww4fwmFVaV4M7Y6P0MC8CP7aA+6ELPZ1DZMU4M5+Ju
	 BNgbnfzm0pp1JlkXDNqy12bjkOMKevt5PKL6j0e+wJq8ZTTo/wTk4W7IYeMPD7RuKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6eApJcFtpZRdgO9B0TQZd5jM4n5PQ6ew8DlGPQpAuDI=;
	b=AU+BczcX1XOdd4mxO1lw5MSxCEJkW37UKuPGf8pThm9+p01vE8o8JKBUysZGOlKKyjHz
	 E/QFswB7FcpfjFbdF8oSx36Tjh+Hiia6qZbxkCopgD4X9N1laJnIW/omoaNH3/X14cI89
	 yp2UeHlI5CGjMuBBQrv/dMCSVNa0nfIjChoslh7L+P7VE+0C7DIjj70MueYGeGrQJYl1f
	 0/77GOS+nKG1GjpZvNALM47bTdwuFBrjLQnQblLE74UW3yG4NtMUlZ2pQR3MnIojR8nyM
	 i6q8bO1J5srhLA6nEc/fWPa178WyuvaRU3XOH9Cf/+3IQ2njGz/8kZE7panCJEhQJSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXmnZnFm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjZWBS9u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74128606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74128606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXmnZnFm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjZWBS9u
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMEW1821123
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eApJcFtpZRdgO9B0TQZd5jM4n5PQ6ew8DlGPQpAuDI=; b=pXmnZnFmxKHeP8NA
	YIKHDSfNZ4enHJuh5RwRYZwP2wQVggeE+7Q23FOkLyY0n0bm/kdwH0iNLQWAfnwc
	F4TeN748CBkjapSluA13Ay+rlQbI59FPWrRJaDhyAlE+vIIy1TEcRorVAWA23ID/
	vCytx2Kem1PkdzI+lPb7JXR9t9vrHVpfrRK2iUOHSC5wKT6XBhz+pmvXYkp82kl9
	3UGLqASuOJrf5ByDpaVjQfhphse832EAe/R7ljnVapJxInTtpLQCzkLHedmrHQ3R
	FvwuAKZlLkkzfKHRjRKeDecR53LEz5O8CYmvfhQDrr393nWgXHIfPQBP13zd5Pkl
	8grj9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4heye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:33:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so49488585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619212; x=1794224012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eApJcFtpZRdgO9B0TQZd5jM4n5PQ6ew8DlGPQpAuDI=;
        b=YjZWBS9uCBB1tGRlwS7qM4nI7U8tAJSBMRQc8yIENxk1zYO2A01zGqZL9Q9MKYjcXu
         ELJ0nqm0K8tdL82Ml/h7iCnrZaSRk5tM+jMTSNcVy39pucmqbeDkdHz7ft863FxxkhZ2
         5uOI7SF8krtdgSRnYUNoXF2TQVs9Nysd4VlLLX7SEdecggTA5cBMokKEVYCtBVd9yQIK
         L+zREm/+VdGF+KSovs8TFDl3nlIMdXE8LtOempQx+/W111zipvLDcskZsbzF9qPGvBtZ
         AXuFihGPhVnOXmBws6ycheF0OEzIB/F+SGr6IHIGZGio1D3sY8rpw73oodH6bMxJuq8M
         mzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619212; x=1794224012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eApJcFtpZRdgO9B0TQZd5jM4n5PQ6ew8DlGPQpAuDI=;
        b=BVJR9duIU/6X945rJwENDJHAKbDa/+Cufi7BTvxy5BPsmj/q+eVShKz6vgU3A06W6U
         HSyZywUvGP3hA0j+Fddcctf7zHrwA/XRPobMlrN2WJfSGNHu7a3yHk78XAO4lgcpa0+D
         qbhAHRS7lI8oKXvNa7oS9fAvkhjc6kj7TZZ1pt2Jq42eKj2t6y7K/F4NiCIyy40zyOHD
         Kcyb/fIbOUikHCcsSOJK9TWZAyVD+9qvNYHXVMO3zl85H3yPHxMhM5A0fc36ZZecgtI6
         VrecycCL1vycL4SIS1bYNnjGdmvMURH/SXg+Jx0Ew/ibVkMFDp5IPcNu++tZlmfueaaN
         qLYg==
X-Forwarded-Encrypted: i=1; AKwUvBwPzZqq83+fu5Ca0BW8DFx5qWoOIdOFmYPRg6mu2vq4+GX9GdtqbWfwASGgZND3WC0JQxdGVYnijjoeLbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfAP69I5COHbVGGL/vrjox5JPkkj95ofIv8c5fr9RdTuEyr7qB
	lwfz7BSwZHkLDqGQpdoMlt/Xhky21Fk9vRDO8CInobjpkeE9usvZBwWRVLv5awZIGjw/tLihbnB
	6o+WtQayAKtjzTsYQ72pDLXPA91ca/QEAiSosmTQ/ujCaECFXSMwcQYij6FoqDlllWLY=
X-Gm-Gg: AYBFou2W7O2cRgoK/c3F1SS2rR97d3JKHhFjhy7SddCyQsRor5poFnct6bUFMNS9VjT
	P6fpn0Qu6U2JKI7dFb0Cnfq6111xLEsb0cupRXOzyA02CCGztu+LRDgQ1Yv9lktqcT4mlsKS67H
	Vf+3IusO4bM6qZvlcptlsC+mng5qi0+n+e73Qs8BzS/dRRpix9+QFH/3TlizSioapVk+9SGm+Ea
	GmbLNa22JM2X1U3FBFphI1eZOA1DtElGRhDvIGJgxzadc7APhlY7W8DN+/Tnm9CgH3amhgg5wwo
	zu0Tujwl5BL3nmTNjU2z0wQteo5y3GJWlD0H2Sddlk5Ig9YIewPYbIypiE7wFcNu8BXqJEoAEbt
	jB0Qm5bdvaYAihLeXJqenyiaxbJiQbr9bETMZkY0udeKYPz6tQcGVgIJOx3k0e3D7c4kLxN0=
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr1504794485a.0.1793619211490;
        Mon, 02 Nov 2026 03:33:31 -0800 (PST)
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr1504791385a.0.1793619211088;
        Mon, 02 Nov 2026 03:33:31 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4aa12sm373481666b.52.2026.11.02.03.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:33:29 -0800 (PST)
Message-ID: <fc2ef1c1-4132-4060-8a50-3fc5ac4c301e@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:33:27 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] drm/msm/adreno/a6xx: Mark cxpd device_link as
 stateless
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-2-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-2-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PcVsun6ysmPvqjXLullZ20eOpu6fsnhu
X-Proofpoint-GUID: PcVsun6ysmPvqjXLullZ20eOpu6fsnhu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX/W0ngtuNRP5d
 K+4qHhGN3n4UdA5qQ/3f0+FgvUfidV/wqol6IRcd9zTfj79717AetfCZSG8w2uq+Wi+IMmf5LLF
 zzGt524wzv8uWnmrJThaSt+oPw2yVqg=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8750c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1r_rKV1dNJARR5MeNUoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX/PFA491GIvG/
 1LuvG+lEBZGNyIdzaaSNsYKaV3iUN44scOfCf47TJx9j3Kuo7gcbUHCUBJuaAmk6m/Wi3uNK+DC
 YnphJHHO06SJLYVpeBZHDEaZn/zdp6UVo1L9avAE8Rt+0n7sK169BhC9I0YPLqwNyWn61Ya+XPR
 Mc6Ui/lT8hTn1LAMm/f6zQ5u5XUUD8lrJto5EHVF6hcGB2sGFs6zuv/NIHsIh/fnRCtbvpj5oZ7
 uvh7uhL824+WdwVq8Kg/g6KnMcAidJSMggbVjiVtdbQrKtbYaJMp9RNDYBmkIEPbAFYX3KIyaoR
 iPjwhqH8P2i+flAH8Px1uUgQenEFRxAtCUT35VpnxQa6Izdb95Y15xJ4+UGkHi74uIqo4W08gfr
 /Ycwxou80Kpx4NZGwmwvJXCgxMWgz4PsrkpMAqR0Xm7dIOnv5GJKarnjA9UEaGr77FK8vG7bDAy
 md5POGR1tERclvk2KFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020045

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> Since the cxpd virtual device is a driverless device, it has no real
> struct device_driver bound to it the way a normal platform device does. So,
> the managed lifecycle doesn't map cleanly onto it. Since the lifecycle of
> this device_link is managed by the msm driver, pass DL_FLAG_STATELESS
> together with the existing DL_FLAG_PM_RUNTIME flag.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
