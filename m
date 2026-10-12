Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE449E5CB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818676; cv=none; b=WK53vdd8/R5gEoQD83aaCzRQ9U9rL1JaaO4hK09vvaFPAX/yNML6r0pZfebR4Jq2oDGOlk5JJ6URFXehp2ZtARI6IfwdDAYsqEpROyFix/kQ1tZtNyS4crOx75cAT0OlrNltj7BzJQQR80QYlpxHSCecETX1+dON0fAu1SWEEmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818676; c=relaxed/simple;
	bh=NII8/DvpqZvskuTyC2R0uY1SUxGgGLheGvOiAEFExD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8Z30ePCIbXf52Tb8CNgPNXYourMy+tlUsKYc96VKxy1Pss5TTtKNW0xXJfMijfdLOBKucHAe0u2qBvtSsDfNlZsV53ordAy3tk1x3JPCDV8xbxM69JH4g9KJTFXpEtXxlBStcR2UZvDEYywpNETcvDw43bKgNwE0PK5+V02h1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFc8vo5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUtMYj9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFc8vo5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUtMYj9J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Uu33293118
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=; b=PFc8vo5kxN16SUEr
	++sEWJXikqTUqeYqg+psoHnAvFRP5OBO5TrI6oC5Ev4B/IuZc1nLKRn52FIlp5Tm
	33Y9dqoPqHXP6TgOtsjuvZFD1LoLyTptcrCSOtl7iXElvdS+0264FZ1ndttSV6n8
	hPxoZpjLYau3M3NekYrVCBJIH/SY37plFgjVMHOQHGk/NnWF+9KfXigMTLUR6iRr
	E53GnQftYpe8EqH0cVJ1Yh8VXq6xffX9o7fDTjcUA2XbwkpxyyppqGoOpfUrdXqh
	C4+UObK/V5+Vffev+rWiCheVHxhSYu2rKWaPtaM/BKlSq2kankP6VLh/f19xUQ6b
	4wG+OQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:24:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c274c15c90so38329137.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818673; x=1792423473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=DUtMYj9JQt8/a5tgNXN/7hK+w2oO+ax2h3Sa7Yun3zZMvRgXqzdQESRP9WRIzU0IwI
         YNX09TPEY0OtpFmWVy8SZYO1HV67Dowb5S85PdnaBsF0aVnIRZKKaH3x+CJeme7A/u/a
         zT0aY5KOvYNl8NjS4M8gbRyu6Rw7I+9i/+5eBYSLIGGFL6Ja+b3ogZ1hpsRoiyWUqonE
         ITh7CR//9rdC5jawpHL1ecO6QHdgvaDYNb+fFr3+no7ypM1u3GdhzFxsYwu43oledF/b
         /DN1jbcW0+Ix3YKu2aafoWDUQha/PhXMl4EgS5nilq+ol5otBK4AFO3ge9jUwC2zGnyY
         /0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818673; x=1792423473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=v7d7g8jESiFiC781Up/zIdI/NRxkDOF+HzPX1zPUCqZVpPyePFeHfF4z5LXdEb1Gjc
         2zsLjXFBBjM0qGu9NPx5wevnydseP2TjAVVg3E6LquuqvKfcwP5uzGG+iNzyiW/qfiZ+
         A7/XsbbTMexXaHHkpXt/oCJPAn3sXffkAA5AVf5K0QM60jtWwTSsknX6XVrQWuadCO4k
         PNNRbo7UX+RgcTr0amQQNQcopoBezEI6XSvWZWtwUT01ZERTVE3pJEvAC9cLPwaPOjTB
         Zhhm7DGdHP5jvQ9mwlkTIoR7taXvioZv1kuvr8IsisnWHjK1J+r57cGDTk2nhSMcZosp
         X3pQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAa/NLCjOXf4POZZh8EUbUJ2X6xikycdSKpK8X1FIvvUfdejZYlTH3cFpFRQfH4TGi0YPlAGKn61LH5s8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUJPukD367QHYNhf7Evv8lg+ZB40ozTCUoGqqequzlVhUO1aq1
	o6zTjSHydXitvpFra41BasU9RXi3lbOLSK5Nq/LGVw833zG9t9OOXtTmTbg00pslpjngM54PSYe
	V4OSkJvzwjsMLY0+cSmN+xsuJ1Iz90LPeGMLOvQJ8xU9NcBVMvqRVqQn5UZ/WjKvTCMk=
X-Gm-Gg: AYBFou3B0FkVDy329B/djLVXofaPkb6iOGsqYhjE1BAh2FFR0C4BXQ+LjV5MVRM0inC
	nAJvxThJ6aUbT+/WCos3G/lWRG2U2oSjeka15oroJ+yxXwyIvrg5qQBBNRT0v4Kdo5qTY6IZg+p
	jUZTQWO1dt8Puu/DvT/iB2Aiag0nu70FCPox9w7Pu5wjZgGWd7Fi5AQ2y1JGhVWu1jy2EOR3Umm
	WTZwfcblvefdeOYzGN9hwHbDHiyDCSXcIhKEII1RgfLDmA/coYnapIUAgkVq3qRZAtZYDNaNjKS
	ibynyF2HS6gBVERMUMzYy/YZXCWSmTuOXbR2EpDbmmPD5upCrOLQRLp0rygtxooBhohAhAC4Od2
	0G6BCcrY=
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr1919660e0c.0.1791818673092;
        Mon, 12 Oct 2026 08:24:33 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr1919634e0c.0.1791818672619;
        Mon, 12 Oct 2026 08:24:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bc20sm483347766b.22.2026.10.12.08.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:24:31 -0700 (PDT)
Message-ID: <6d931183-fa72-4704-9356-161da26a08bc@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:24:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/38] arm: dts: qcom: apq8064: Remove empty line at end
 of node
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <dbab80dfe63748bce2dc47155e6e5d40d1f9214e.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dbab80dfe63748bce2dc47155e6e5d40d1f9214e.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXxv6kPFP8w22O
 SY2LHv4axQju7JqJZE4Vr300YS3QjYPSqM7iJM1ObtwUnc1Bx5b2+z6t4tTfT4/rfGm5yMJ7UHD
 avUcvnf9RXWU7O0pnUd67kJF/odIKIfCTmE0Wl5muZQ+X16Q118v5sqx8/C58/SzXEDTr9nKRIJ
 KSJCFNJ3flpmwOOA3+dZ7lpHhDqhx6aTu3KJ3e0FxXoCoGt7UjE41RtUlyhwxnMIjV06hW544ya
 o/4p9GteWdgt1izKzShSwu4abpTlJVHc4eLIQL37eOTFv9X7Grtzek7KO3+VW+D56/aDkKCjnJi
 opcaPSH4cOnfYgEIHxxR1j126zoJd3l/h+zVpyN0tpRyP3fL/+9mtIrXajddlkjC/sF9PSe/K1M
 P/+6pGtgIMOZsSeCMfocY1DWWp1vl7fMwy9lpXEpvMUpB+BTwWln5Vj5LGiz9HLr2kmka/t7Y+n
 LmGlRWJIHzxS5gIt5EA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1nJpVWzMGTvr
 /IDnaCNIzKQV/hv3bmBj+vQbmXf1NmudTJx3z7fJe/T97c7fD5Su1u7cL6M/o0sNBXUygebzWh0
 xf0hnm3xUry2Pq29h2GWX8AMDJMQ6kM=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfbb2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=cfbp-VlG0RD5cB8OVJAA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 0lxgAJRSl5j6nY74PDzzwLYGkNqQRL1Q
X-Proofpoint-GUID: 0lxgAJRSl5j6nY74PDzzwLYGkNqQRL1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be an empty line at end of node definition. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
