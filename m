Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576395;
	b=5VsSV5BXoO/Ls3EFQYIBohucBtW0Dp5N2gSUxWWGH1GJv9TV362HkflaTOectL/Q/Y3T
	 TQ8IWXND4XkRFFEQgh6EcriLCt3EOs+6BGEqKuXlrJMCWiqHP17i5MkDC0o6H5MmhoQpH
	 vshAL1wtMWoHbalvlt7mcbAmcpSJj7iOc6ZWPf+njQM78xfHG2lzDOu+fQzBGGzNSSFJo
	 icwBh+EkWm61Zmv90RRdTc0ZgvF/eEY3QGW+w4Yzz/St5FppnMe/+FpMbejP74MCZzvbx
	 vootiLNVVMX88hjQqEo1RO2B+r+i3I/eTcDjAZIP0DF3axm6hcNN784i3umcOhxoRFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IcAOJtu2GeH5NVoG/ptuKUpX9Xs6ODaL48XYm6Cio7U=;
	b=n3EcYrkp81Ff3Z47Xhme8NiwCtRLVkeCe0Z1bXFQCZxJ9mxUWG0p14JxI0wPcbtihwCO
	 macgRLXKEan54KDaHjId1fz9bv3MCZpA6z6geEYVqxHLwS7qD0hPeAXeq2AGOt5oif/Q0
	 +C/pMqS71CaQNETf+Dx+Tw054nS2HL+c5k382hSBC4x/ySOdOKAU4peGoXaq144YL6dv4
	 DDZVAl3JhZV75jx/KaCZwdFGRyr/qrQzj6xVwkgsAzozJQqqMIlKXGazWp9Kv4fCoPEhy
	 /Dbk+GlhFoJ5dzxR7SAM/ryqdFHYOxWMDnO5/yO+4j+1cjKAZln/Bcuv0sqU933ce3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPr4pjhQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw34eXGY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5253606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5253606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPr4pjhQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw34eXGY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jApq3711619
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcAOJtu2GeH5NVoG/ptuKUpX9Xs6ODaL48XYm6Cio7U=; b=pPr4pjhQYBxV1zbN
	Io+tfTY3aIU4h+rNUlm2Bgb+i20Xtk27am3eRWVDXyZ2KGopsRK/aQnEWROox1W3
	eh1hbEnIdwO5HQBOp2IQFeoj1+PpTMNJh1sw246qsUoz6k8mT8pS8OUpOXrTmy5V
	dJFG9dXjULkrBCfruRXzPxpoQ8qm34I+lcVZ1sl4AUiWlxso8J7oBYBdvDvjNl3q
	6kEpL8WngQxbdbTPpurbURVglZ1G9vh1vOfUka4W0Xd22KkXZQjt/3ZqWjTkkycZ
	dGnjfKy/BAGoLGlRtexIz0gPJfLppo1TCx0s9zBbGhjzosqFS+8JpdLLguVRbhNy
	SgezXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3d0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:53:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so15488885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576393; x=1793181193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IcAOJtu2GeH5NVoG/ptuKUpX9Xs6ODaL48XYm6Cio7U=;
        b=Cw34eXGY17ZiDWmbUU0yZZBBMmN84P2t40AknRo5FL6giuAPpWN3PYI8YoL+LN1aHP
         7MD4OEx6BNIz+L/PEvue4n0LhlZ/+ud3Lzknukl0Gnrb8EPu0LiMFCGFd+K/ojLBmRoy
         ZdN+TFGUHs8L63wS9T/rYlzpzWCj8Yu9+IdRyUhRqvflZBPiuXzYuPw6BQFpWZcajSsr
         eGHjoL+rg+jGTJ6oqJ7+H9gROu/BSZye0T+GMiIFfl9ewcgwr+DWANhOyarhjfiF86c3
         OCpjE+C3Z3F1bDkQtsvCLhhmXG7lgx6nKzI2YyWnqN/7cXeW2riW2LaEEMU8P0QKpMe8
         jILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576393; x=1793181193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcAOJtu2GeH5NVoG/ptuKUpX9Xs6ODaL48XYm6Cio7U=;
        b=ZNqtimO6WY+otzOu+O8fwrRdZx2qYEVPxzPdfoty2EBxGab/2dxYr7a7jiCSVEs4Jr
         Zq39QbCffGEe8KfDEq0VbUmBHPYkHD9+MeFiwZMcUxzL4jNo8Y3iWcBU64zA57NM/hd8
         StJedvv0y6h12d8/mJaDjroNVzMlpuMAKBEMvIEL3jcMkYMFDbQfmQHygLaHo6xQxr5/
         grPkxWLPm2e5ARJao7jrjhYvwqqjQP/EpSlFotmQ0qtfoexGXEhZkf1la75+6T3/6zDJ
         vL7lwsXgFv+thJJWNq7ABGkyVnuBkdmQCbozOeeozpBl55waEp3cUwg81pO1zONFS1/B
         YrdA==
X-Forwarded-Encrypted: i=1; AKwUvBxm/26aTYLHrP9eSljB5erBHoQrSWzKY9e9uN0iGZf2z7RJee86J7zVBxOifRWHk3RO1qG9y2PD1CUpcvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcLc/xNug8poOjsjOepBWAII9vMoaUixvkhvnIRO9wfL90v9Uf
	KAjGqfUpXMfPSa1AOZXUVuWNCg9rlDFAdYYCnr/uISK31gsGX39OCCnP7ftJbwgFWzARbSPfA3a
	EnEPnwcqN104HhpiCZ8cQsVD8q3psLtb2WHua7sbDyNuCwTdTwB3psTV+yxeCtj6sxc0=
X-Gm-Gg: AYBFou1ceiQp8SWiHUMf//CUiByC1efgchL4B9fklQ5JWXqe0h5wjtGboWR7jC1UK5j
	Ob5On2gAd6O0p+SPn+aukgw47xgysISi2v86B2UK4PWESb8Q57lzzRnqXlnXiUaROzHhovCoJI1
	cbF2LORb0+6b8gjNqh6ZzZ3R8lVUgfGtdHLHNHGxveV/Q7AUpNTEm8rVQcLpAr56uyqBsUMH2B6
	aef89d6G4NKLzwZgZXmYU7tDfL19j1tzDY/hKePJZh5IzHew+mJJWLYF5jzPbKNgd0PXVdE/ThA
	MX5u08ZIC1OVd9ENgkHLbt7uUdzJWR0mthXwFxASEu6loZVIHIH8oHBgkpRQU2BzyCaOVfTuPaG
	PAs/zRRNWYuR8WYJTGqXMfA==
X-Received: by 2002:a05:622a:1343:b0:534:f411:a5ab with SMTP id d75a77b69052e-5369b7db1a1mr26406801cf.4.1792576392976;
        Wed, 21 Oct 2026 02:53:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1343:b0:534:f411:a5ab with SMTP id d75a77b69052e-5369b7db1a1mr26406641cf.4.1792576392508;
        Wed, 21 Oct 2026 02:53:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f783e8sm58910966b.13.2026.10.21.02.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:53:11 -0700 (PDT)
Message-ID: <c8911f7e-851a-4083-b166-ac2358ce081f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:53:09 +0200
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
Subject: Re: [PATCH v3 1/2] phy: qcom: qmp-combo: hold a runtime PM reference
 in the typec callbacks
To: Oleg Keri <okerixx@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260916133814.3977-1-okerixx@gmail.com>
 <20260916133814.3977-2-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916133814.3977-2-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX/QwGCHz4ZmtT
 zBuCgoQ38ngZc7+OUlyCwXNFFb8aS/60CiOrq6Trq7MMTQEIgm56pCxkdjDnzoLuwT3LN4O0Y7E
 Gc6hNBDfCzoLNKWzuTL1ffIXXDq6r28=
X-Proofpoint-ORIG-GUID: 8DkQ1kq_HopjFOF0kRTW7iGtZk1AN4OU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX5BC6HO7M9vho
 cVQOmACgPiM1P18CueQoX099JOiWDOB6X1OKZOIoIr86Oo3gOMM+DMCbyzInqv73EQ/m5gf6lap
 /YWUDEWQ2vB4JhdRrtSkmb2ZGWDWVf9EHoZWl8X9yUB5CWkIYysFBYDrxyXYKpO9taP8i6cGCSB
 nm8hRGBiTa2O9aNWFBV/vub1yFFWadKe/y5NOyOIdVKsSW3AeEHPduIu1ma3k82j0Pd4T5cI4z1
 deB8Txycq2ak/gjjRBHJLIN6AJsgkPyLIkkVZtV2pVrL8S1qQpXt8xqNGAu87z1PmmYN1WgwN9Q
 ElofkIhX2+O3TM52mJPQQkVyU3zDkiQ4vrb8tYEaukLZammKpk76jjljxDI04Kt9GJHALM67/8N
 K963GU2Rn46CWrVyMaG5Ce2agUfHuTvZhT9Zc3BzpDsyYmW3qV5+eZLG3Go8YVxBEDKIuwMyajb
 3Zhy6yMtznCZJ8ruI6g==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad88b89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=k-ca5NtP-HZlscmxgwYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8DkQ1kq_HopjFOF0kRTW7iGtZk1AN4OU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210039

On 9/16/26 3:38 PM, Oleg Keri wrote:
> qmp_combo_typec_switch_set() and qmp_combo_typec_mux_set() tear the common
> block down and bring it straight back up, calling qmp_combo_com_exit() and
> qmp_combo_com_init() with force=true.  Both release and re-acquire the PHY
> clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
