Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100331;
	b=W15R3h1d4/MK9RkyqnwxWRwyA9L12QmpY561jiCR2PSheOl5rbLFuer8W4w/LVG9ett1
	 k+07FZz+uwsf5m1i+yclpAobreNmF0GZGzbQuDtQZLEQlePaOslEHi4j5FZwls6J5prPX
	 M0cAuha1dJL41G6f8sSTdeEIOz2WYJYz1qP2RGO63YEgOQju5FlqtU/Zhsob4YRURWAc0
	 ObzA1QWaqZWS4xZ1vNSa1BFqDEGc7udvE8FiEr8CclKlxDBkDOOP2p46dmCA8EulduQCB
	 xqG+wlKPJ4cqTreYmkiViERkymt6hDG+RN/+uvC3qNBvPOO0YjPSfjrulXfA6BiCexQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
	b=t/uWQD4gUcFYz2c3gmtuwtxMzDHsP0AF2D/sFY8FUOFm9R/f7bM9QxkIrjL4I8j36z/G
	 k+5Rl86QgYH904BN8yU8KjxQQG1PpiUFF3BcQlsi+rbPVEz2udjJm26YhysvBJJc9HJun
	 oSk4UpifgweE72mCdmQsucqL8/jznaqsodV0QQYimS64YG4QwbPF/Vg0WiaqO6ihJnOH5
	 L611ZDrRPZ8OreZEP19hOiny4ClCRPJA87EQWzBZxybceEbyrIz3fj0CH+8Iy07K+KoNU
	 26lMZWCKMDDcAb7zabzYuiZxgXJVAHJH2wjaptFYcvY+1liaSa0Oxig78P4r5FDzsgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otucpBEd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INIRDU+G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C437606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C437606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otucpBEd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INIRDU+G
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2cu1974129
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jyhYkL/qDxUg3dans9Xl+flW
	G3nvJ4Kl35GuTAw54hE=; b=otucpBEdRZceIEHPz4JfQB8zfOptPJkPcuZRoK/8
	c3i5llXy4av1vUCXEy9RCr0Yh/BUtimx9gZOBSsSRsDosf93BZTdUK5Vr+/+0HmH
	t1uFkwc87jdXxMXwZFw36q/nc8uZjWcTltwDEQH+60a7lmRYdiSegbkn9S8nWyh3
	mjN2QM6FSy5+L3OFwKZMQ2wSm5vLORhOGUdXKVacv9so93xjI4qYgrjdR+et47Ga
	GK2DKgqhnj3/95kaR71G9OB+mh9anESWyF+a4EccMa9+1Ae1+eO2A6C9cyeDFvT3
	P9fHOnq7k9FxEyHmKgI65xiuBLVzL9AAKVTakrXW17N8mQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1ga4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:25:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so528699585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100330; x=1793705130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
        b=INIRDU+G5sb2ygE70KrAW93zxlFvm4FRJV15Fn2WNHrgwf9S1ld8JZRkIhw9pjFjd8
         xUdu/bVMAcDzm0GIq8pkg04yRs9yp8CjtSJnsC80fBBefA5sTeZ7yFjSjzBXLyMt6vzq
         MA0/Tjs28URDezJH+HRsGJI0bUYmMolQqPeMgqe9ckIuP692YFAvE8jR97kFuPytY1dg
         XniCPS2F1kfDUVTBDzIcQhQ3xiVXUw9yf/ofy1LWQh4tQ50hAIjNHrVJNiXOMkcUqlFO
         AxuklnWHQL6S6oO16pSYX9dcZBeQwb5mNghmEryvoL/b+5mX8n1L2OAPjG8LPDdtCJUR
         jPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100330; x=1793705130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
        b=cJjq6UsrLcVE2Ij6VN2GO5pgtkwHhg0+C/o+zHyqy2noQO0EqKYdUdWw0vvX4I72Tz
         T0lfJea1RiDSr5Ecyf949peLgyS+zvYep93FfuaWvQt9lKFJ1C14U3eVspA81XuyFLKd
         mQQbxM6RixqTJJmqu4F6JK1dfKlQJjZXKEGzh3niWlsHw/IzKThMTPG6syPK3w5n6aaj
         W5zNdJo+iWWLQZVt98qP6yS8OSEom4zKoKaRf7YvD9BzRoVHQI3r6ESLuQfCSAR/vlgN
         x0EGKitNoVIaOCGnt39/9HemVRiZXH0U3KfqieLQjPfan4r2188Z5tx/EHu2MTphHaYM
         oqVA==
X-Forwarded-Encrypted: i=1; AKwUvBw4V/jzLjwQTFk7xYYGQjB+XlCaPlOQZrf0z+b/YY3lAlATMQrwfjJgepT+hcCeK48BYKbpBgIZwK9xEeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQviTRYAJMXh2QTIrjP2JedVBzaW9a/wp3hK118HgkS2UCGUO2
	P8nIJJwn6cr4ja4D6f5flRhB0xuQ6zXgLISEqAq1VrfD2nrAnLQLNW/CEOmLI0iTXdfHpYMZpFx
	VbVGf6lMuWDY1QNBOhDA8OVQl/QrxYWtUiTAASM+KcYZ1zZN7Z20GPfz19SCiAJwHFoc=
X-Gm-Gg: AYBFou3JnboUG/r1MHOJFZ8NoAvfuZR6sC0Nwzg3+2o1Z+qXaZQFHEypBh+SpE5zh4v
	sxOfcn1YYUGKLoTo4dJ8YqqmRZnsXiuRGdfVVC69ZxuxaXxYF3pzTyIlOGpqreE9KxE1YSHBgA+
	fyimxxNiR4V3Tzbq/NehOEIymXzmP+UCkJntnx+/ccwn3pMqLSiKe6npcDboAAi2cpBDZABPAdU
	IPZeGPDkMhqtvtmOhsoDDKePj4BcMvglhPESvig59SCHjzcOPbztP06szlJddfYX0fNuYO4TKOU
	tx3ak+OtQgb2gbE8FXJ6PHr2ydLB5+tpn6LfMbIoyX0INTBWD8OsxMDoqcl3nTOM0dQuk9L5eGf
	lnkSKfMqZfgUJUzki
X-Received: by 2002:a05:620a:4116:b0:93e:4f4c:b380 with SMTP id af79cd13be357-940ef7d28f1mr1405177085a.10.1793100329331;
        Tue, 27 Oct 2026 04:25:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4116:b0:93e:4f4c:b380 with SMTP id af79cd13be357-940ef7d28f1mr1405173085a.10.1793100328785;
        Tue, 27 Oct 2026 04:25:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm20012629f8f.41.2026.10.27.04.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:25:27 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:25:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with
 binding
Message-ID: <7fa3yfrvz3neingw47vkunxh7ft7u3udofeunuel5m4f2ocqtd@lyvt3a7hozni>
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-3-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae08a2a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fVLzsXKNZF2toPeuA2YA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TTvz0n_21v3YD9iRyKyHY0ll8CI1Nm8x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX+GuM0eNDsULj
 zLTdljc0jnq4i7l+vyeJ6tmsnysKu7JjUMhXitVEF5F3df9rIXMZTHeTxjxw7J9olEJjBxTkWHO
 4CrSyR34rOV9e2+4s1fogGMlGVpwpag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9c86eG0k4M8u
 BdakZ8LENzL4nrVqTLKcrl7ccP5IZmz9uiCVcTu85dsgDty1JiQWqje/9GdB1iCwdmAWDD3z4NC
 zWrN1GyY1EUQvOHUGyjZyr3Wi3AvxYRWUetGs14h/1lsCOY6boWqpA2nEKF7i/xekC6xZTsMPfz
 li8ocAe5ilDJwBcQUGjGwe0/tJNIXHohgm0HsQR8olQ71s4LYH3fo3VkEfSIQEF9FJ61rsNRtoD
 19H6OqJ1AE+FVVofHR+OuYEHWThkEIAGQFHR2aISO9Ms4o4bOkW7/NTjeUbnD0INA+laqj6Acah
 6PwWouXmKYA6p/xl5rvXwXzV5k+aQ09Ov84AUkBK9jXtVRhNfHGRi8x+OAbmOdNm4VsPc83cmrt
 q7NZkb3yGfWPrvMKZAejYm9JlE50vK4DcBbEG2hjdjPdXtAg1jmX5TwBsdzpEYDO4IdTwJtc5V4
 XPCF8uPnG0Rj7acfWAw==
X-Proofpoint-GUID: TTvz0n_21v3YD9iRyKyHY0ll8CI1Nm8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-26 13:08:14, Robert Marko wrote:
> The GCC binding names the CMN PLL inputs bias_pll_cc and
> bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
> clocks through DT references.
> 
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
