Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2678E4A090F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055642; cv=none; b=cVvCjF3hb+dRf8ZXu1OrBm19TFA0chOUhX5ZIc8qzAhEBnjzAc/cJg2gd4mCT7EXW0ykYsvzneYeNFlm+KEWLKMFs3ukzP+1ch2+R/DR1HayIqFpRLMQ/QhG6P4vRnaDo/UkUPvV5u0TL2XF4xQobAMXvt877Z2CEoTdCecL1pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055642; c=relaxed/simple;
	bh=qphykZeRxA3Dm/sahKxkEFbK8FA+HtS1KvN3pqv/19E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnXARe/6U5GeGMfFD3py/boQLZc12s0ZcgEWCWAlOWsJidnWc8r8mJKiSJFbAT0bU2sPiZJGei4suh1RVBibgXjaKn84AshHJDhlqR0EKYqmV8qP6F3SjhWlVApEyBTlyEoyPNaRky24X3sQ1Az7kt42Egxif8vZtZin1c04LFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b209s6Je; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z65dgulu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b209s6Je";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z65dgulu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F97Krt1889713
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRZJ39RIeVlC9MlaNvNvmqPLISdXkSaEEscPGaGxyaE=; b=b209s6JerXmXYSXQ
	3HXDqVZvh0not3UsLCYTlKutDsK5OE6QGtKdw4cO3ckd9JvVioOxU4kwAOralrPK
	Hn2dNFyhN3yAGLTjVy7cbo8tG7xF0aCPkb/CDsSz1lxmJNng5qEPgwBjA6cIdp4U
	hIR0ir+rg7pqungrNDR35VelJXd3KUGVlUUHpXOk/I+gv+Y59ioVabLUkwa410NS
	yKdGzAXuoC4R7Sj9n2mfzk6a/8YZnhGR7hJCYlxpJomk954semw8leIfp5dqaB9R
	Hq7TMsTYurNT0aBtYkwNJsgwoi6rIa3dE2BvHPv+BUsjO5KyuKwVYL7jcH29Houi
	cQI4tg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda17kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:13:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338d5d0509so11029611cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055637; x=1792660437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRZJ39RIeVlC9MlaNvNvmqPLISdXkSaEEscPGaGxyaE=;
        b=Z65dguluclSlbCFGSNmAoDPBsH87hg8srD0XB6aepISNu8eEvi6//8QEJTVqj0Wl3O
         83rAcPt9DXPC8CD1767K4DHTiDUEteqW3hnVklXEzJVSik3jb0MGbgK8AXAOz+6vZ8nQ
         ueLalhWqCL43jGYnMF8lWE+5yLwQrwIkyahE+CfkQ1bX2kzjjinMYtnzF0N6dfP7j9dU
         oAOo783e+2GOAtyDCtusFparb2ftge9UIqVk7HtEu0Iu5Iziea3KpsFBVIeP6s9ts54f
         FA6nyoGpUlBKzjNsnZ9bJDQmgDccLHbXWHYfnEyiCZ2RUE/YCCfaSaYeypqkSQ9nHgcL
         5jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055637; x=1792660437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRZJ39RIeVlC9MlaNvNvmqPLISdXkSaEEscPGaGxyaE=;
        b=s86rdVdfQm2UnA7vealbI3mAJlMjEJgoAxPl2zPi4g6lYIueL6iRQ2vsViw6pbQBgK
         icf7DwEf1egc6xacyDFPKqDf2DMU0wcobo+oHG2SmeYOqQCnSSnX5r/TuZHH70ZI3LrR
         MF7HlIXXvmJNTKaN6doqp+sck3yK4ZKpTzk+g5BkZ1F9ukQTw2HvSj6KMPjMIgnXyzcg
         5JgHb/CqetnJliIUz4Swaxv7jgv+X3HnrRCPeOtyheWaUuhCcT2mMzGa4m8JxWimeCTJ
         UIggWNTuLmXIvS+vcBD8Gdgpu0SWHaFvX9X3sNWC76vzivPwMKbVXuWZJTGAqbESL8/o
         4+DQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9H/hGW7j9dPEFbdzmO4gpV/gMGjXLYw7HglveLkNFKTXYAqfaFhWQ6YruRHC6gut/snVe/2MyXnNwwRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEhxLnhyd39PPn05P2/Tb5D1HPgBc4JE0Nfpy3umdU1kDuxfL6
	Q5OnUDqkaIf928L/cLnmejARGkXxLf21uJUSLrwY6n0h394DuculGDsqfSp1+H/QHk0VZ+LhyVJ
	DclGjFd9sNpmOhIB1nnhtjv0XIDlsPJPyiK+qYp17XFGUTZ+6Kl1JI6wV+EOdYFR7dqI=
X-Gm-Gg: AYBFou1fDPdboV11C+5KgRnnNFP3ovik1Sq3bhDdMViTzqz7z26sJ0c5V3x6wSgLP01
	tpyivAacw9zk0Kdiec8q4eWcwWD6E08nbDIeAWx2idD4olbbclaSMqp9V/b1VI/pVDBWUems0ns
	qkUnl/Jaw+qOU9XesBCmYAnYWLubsZpATDbpuo3EyBhTJGKF0k0BPjqVPCL7ZoRyTsFApZ9vi5L
	rqt1GBs7dtrf7TLj+M0O0xPrZo/XDOSMKhl1VtdqdWdYrIV72CpFx8TU/TqPf7VH+sbSIKnHDQh
	byWenCh5Pw2VjVpKy+w+ZG5DDxlkyfV1rJubM4HO1lqZw1NzaJ+YegLIeTh4Cv5AUQAKEOugjGy
	mTnqnNEE0SXF9MglBoIwjSw==
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr354077271cf.0.1792055637362;
        Thu, 15 Oct 2026 02:13:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr354076771cf.0.1792055636583;
        Thu, 15 Oct 2026 02:13:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3f0071777dsm87295266b.14.2026.10.15.02.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:13:55 -0700 (PDT)
Message-ID: <feb492d2-ec12-4077-9d5d-f1819586a41e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:13:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] backlight: qcom-wled: fix string detection brightness
 on WLED5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-2-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-2-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX6osqVI7qd1z4
 ZLpDezG/4LoQAtL0cdLQsFD2r2DXs7xqzpjyZogAQrvncYgWOsKP7X+t1DYH3nQU/VvhEPKH/+j
 jKj6FjP7CKIY4A2rg/+B5eD8kpavxFI=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad09955 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9VxvTDaDK-J1xIkbkncA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qE_XejdG7hP6G614WD_rPqF0hlV2VuiF
X-Proofpoint-ORIG-GUID: qE_XejdG7hP6G614WD_rPqF0hlV2VuiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX/76MrylfitmO
 y71PBSFEdDsNZbRamQCzBS8uw6e/NHXNCFy/JPRDen/ac+1u1j5YtFmSmgRvn4V1wS2dpOHD3fR
 VWASW+oUFQZ6ZZgIorGb5+kgR+BGINgBhxj4li0apkM0hpMpTYFpwM9DuJ3ds9KbEewFZzTYxDF
 8+w3v1xQ15RwxRRXbEyPYEYjceY1KAvAT1oQRjKX6QCBE7+VZgX0/Et890EDX+bdk/xOrmUGnLZ
 gyQdQYVOJUwl65xY2wTbHULpWX2cJVitAaOtuizNaJ71jTcHnXjSJ+JAa2y5toeukXBDFy+Gk+5
 1LFNk4K5emKgY5C9VN1bF0eeXTOXXSN+7ukDrURwdXYlX3hYGDJBckk/xWrn2cxPUtzt7WM09Yg
 htj8432c8KxyBjCkhN/qI3QFHXviPL2C0O5nGyBvLTHDmZnn8TpUEeksSK/v5WQ2CYRsypC8yk3
 e02PL7YPlTIdgGJkw+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> The string detection sets the test brightness through
> wled4_set_brightness(). On WLED5 that writes to unrelated registers and
> the detection runs with whatever brightness has been programmed before.
> 
> Use the per-version callback and latch the new value on WLED5.
> 
> Fixes: 62a1d3f623ac ("backlight: qcom-wled: Add support for WLED5 peripheral that is present on PM8150L PMICs")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
