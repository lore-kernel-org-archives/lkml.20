Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200930;
	b=WEuW2NtFOr21GobJz4qw1UMLn9/p+1C6kpfT0O2zCrehJxrMGX+iH0txyFOo/AOAY1tH
	 Y7c5zrG4EgwSO4cgPtwUN08zitfkWwqseZTF0E/Ayun7mQSEWMOqdJQgrdAkbpIcOSPHr
	 flQhScaTFLUfXtedYSS8CiVXVD3dnxqwz3O/oi2zqGe3/vdblhs+7C1GGLx0AY7fKkGV+
	 28qvPaVNRTi7Od4EQhQHorVVDt7kqjDfUnw83wljxlMnYEaZefi2qHUbEp5S7Q4auBHGw
	 RbdPh7rxWEA4YXepVfdVip1/e7z2eHYIXw8WzkBk8vkqeIP24drqpdMKDJpgw1zhW1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TsOM5gx90+rJZ5GPjwiuQTfKB9WKWAoyypPWpwhTaFQ=;
	b=ui731SkhhK0zp4ATZ0t3e//nVxUO84+RmBPThywLwR8kS7eBDHA9moEnqaza8dAKPiWx
	 okdA1FJD9p6vWvGQV8rGV4Pmed6DV2MYW0vlEC0eJa5Fyizt8mNkI5Y+GQNZKi7rLIklM
	 1K9VkpxI8uHfc7hUD9Cp1XiA4OJJtY0EWaa+ORRY6DfK50K+1vdI1N535jve1Iuqz6OZc
	 8URKwSugQwHBygNUHs2h0jbNaNGPHEhzz44+/hT9y9A5KUYGJeJMMBMMZw0R/UUM3gEnE
	 Qui/VcGD1kHXGyP4CJTODtIePy9vrLA6+3NdWL5dvWkoFOs258avuE5YDm9qyeYbFRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eU1LeMZA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxPHqA09;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB8606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86DB8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eU1LeMZA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxPHqA09
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAPMU4166467
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TsOM5gx90+rJZ5GPjwiuQTfK
	B9WKWAoyypPWpwhTaFQ=; b=eU1LeMZA28q97D2DY/harWRbh9OVlBRLEsJhSQ0p
	NR2/C2kPBPrscRliPtgpyCtPvKbyaC74Dw6X7mnW+4hZAaYSFi/XRGlQmQqB+8eB
	/7USSRxr7WC1IpgVKDHlA6GUB5C9SSXPhjW808jNoR/lVuNYEuBlZj/76zK77l+Y
	H7wS6CXiPkU7li9UIX+7Ter/ngZ7YnpeYpuvWIxg98FdOG7DsVQ8ZNXN2uGLZ5xU
	oWzGnVtIePuMH6PW2VeoURb02Vj04IApaBnOI9n0sf9ggv2atfSuIfmiEr/t4BEj
	YHXLloHmoLseRBrtgeNy9NBTgfINSBfW/DeI4nDuM3LVPg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngj1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc099197b9so836079137.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200929; x=1793805729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TsOM5gx90+rJZ5GPjwiuQTfKB9WKWAoyypPWpwhTaFQ=;
        b=bxPHqA090fASq2Sj7BQ8VYHoX6TqV5xPweM+IjIbUQAQafJ27ji/vXB1kEvRTOhva0
         s4Gdczkxhc6FB6eV3IbaQvNfHCkdzwkFUBfISVmFND0TKhvgr9h97aO12Y5tLcZ9U4zE
         PKe0u+Jzjgc3v6vEIgXGebJcK8DSkYLJ5o0R52ENbTZeXRZIai+z1MjOuMWkSgGd93BX
         4o/NK5bhLvyCiqUg/zrP885TxfDpE+rJS55wOEHVlVc1uBS4xoHyHuovJZToUjQoQ2VI
         PzKNYts9jyaZmkuOqenELg4fCTkLS0Pk/ddPQeDbeieamOqOJ9TB6epOyX85lPykBdr8
         mBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200929; x=1793805729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsOM5gx90+rJZ5GPjwiuQTfKB9WKWAoyypPWpwhTaFQ=;
        b=BKITK8Ai1MzxWnABESddEMFdT9gz+onwf8i/PRqXuwnxjFYn7otcrk4rURzfkNQnIj
         xsgP2OxZKJf3M3Olq3cZH27AbaVLWsd8KAMSi1tzg7PfDIEDrHuaLBn5YuwLz/w/HBQ3
         MpL4yZkapvmq7729cyYUAHFLYxTg4FI7TOSGoOV+R9amW7HyP1McGu0qrS8KAthuXj3N
         VCs9WsymOa+vKN/u8BpnXxCVDmWImPUnq2VqtmbktTUDZiGW+wBkwKZJUvaxcr/dpiDx
         Kya7s0N3KoMr7dicUl2T737dG1qIIUVFJJ4u2x3PCR9WaSYdN6V9Cj4wwpo4TvHA6TWy
         okAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJfZNNYYkPI7Qv+W1PMuJ0jRstb3Xo7PSytzAxmOWkPTqDwOUMu26HdB6iigsSaAvIXCEAIvXtFm+6fAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsOrU5+flz8+fPFAknCRsBBdnDX9ovkgLRBpt+BdtPhXP4XS36
	njARAYBtn1L/6+FCb7Pp4UqRjmwV4JU6lT5w/Ly6RDeVRDMSxu7sPP374nTmeb7Il3K9x8FmC6f
	oCOS+NfMsRSogR66V1bIgkmqXWTpVlAxhzsunCln2Q9J0ZGLJsyHErTFjGaCFRB64WVY=
X-Gm-Gg: AYBFou0WFy6m4zkyAPniB0xJTskj0RA7YRtt2ZL/nLR3BkQhAxgRIdA7aMbVULAW3sb
	uJL23kfghjd6hSOkKQzIhhndGiBZTAMnqMXU5ZIQ6N2BEOTSf1BVnlZ/4jNQAwpeA2V8qadWGGS
	EJill4Hjh2Sk2DrOAEK9AoW9vrJITdZvvR04y2EGMNf7eb33a2I4aGM60GucB6o6xHIYomMhynS
	Bl5wFjBZbGyuLSXkgqbo6zXNwnDSbPTObfn9jpYrrLk7wEeqaJzcqgvX9i4oieh/78Tq+zkD5DV
	iZ2Y02kGTW7cR1FAs+LTSbx4wMTdDFFaIhZEOAdu5L/lx/SWiXMe95L9Nq37UCcPSSD3Ah2ZioX
	4EpVBXqS/FQ7EyO8riu50h/d/0YVxfN3Vs2lfnI/OdqvfusIceatII2YMS56RFCXftw==
X-Received: by 2002:a05:6102:3f94:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d039efc0d7mr1370349137.0.1793200928535;
        Wed, 28 Oct 2026 08:22:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3f94:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d039efc0d7mr1370286137.0.1793200927824;
        Wed, 28 Oct 2026 08:22:07 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97bf5d5besm62729035e9.5.2026.10.28.08.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:22:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:22:04 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
Message-ID: <hg4bvb7ipjcbkdi5prrpjfw2nd7aux6fo4ynmww5dlutv4aeom@6w6s7vetqi37>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
 <20261028-port-smem-v5-1-121257d490b5@redhat.com>
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
In-Reply-To: <20261028-port-smem-v5-1-121257d490b5@redhat.com>
X-Proofpoint-GUID: qe1VUSTWO1N5yKtZode7ufBKOGGHqxHA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX690XFArwNNmS
 PFqxtiFWbLe0kbAny+x4u+k8EIWO+xfQm7HpoMtxhORJAHPTMfLe1b8prBj/IsHbpgkhZZBy/fN
 YETeY5q932+s23wOiuuJslwf3idx29av53TpZIDHraP4fY0RYHgSt6WgJiTiU5ih9SfHnUC92tz
 U+RFUAfNlQ1WImxHzBSNgX6s+JlNHI24Qt6vk0kgDuAALWl6PYWQ9LiSxbQx9LHLvVe5bNQ9sMp
 vLAiiC4kE4k6hX5DYKBTOhTHn3NmrSZ9SC2N3KKyx1r4bUmK9kxcH9bjN5zzHcT5prSkXInDQ6m
 p5X4ZuWH8df0R3GLeNLXkkZpoUYh22AEDS5LOA+xGSsqhE0nsuMZjCbPZI6mOT2C64uCJYCpacm
 SHRkH2ZE/SX0KDydbujh+x0CNNJUSh3dJpgDOSru2DDrLDGHD4bCzk3MdLwLiMsO+tNtqWzv0vb
 8b+sKYUra7AgSbS7biQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae21321 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=nbeb5VeO40VQUgIf2QwA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: qe1VUSTWO1N5yKtZode7ufBKOGGHqxHA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX+7/lYgcFI6lJ
 ZjcX7DxTQxyriIy6HQVa85/aTzkfbrozWVoJacSXCVlv1aNk10LW5bo0htCtXPYUeUL0+t/bMVz
 AlOYkW2LudxuiNgd9jad7IS2fu47vgA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 10:33:48, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
> and that pointer + size does not wrap.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
