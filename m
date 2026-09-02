Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664FB4A92FE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364465; cv=none; b=YXKW7Q3yb2JNZmwKlZ2SjgLv+IpMv3aQl8qXod8JlR922bJj8Z1KwGbRZkg7+1rOCv0ldy9W7ZlMKwMr7edG9YB04y4L+Yes+3fVwM2q1enZf6lj6xea/nU0zw7J/Q+fnCi+Yn4+nz0eM09ZmKOx0lIsRTqciBGKpKxexppEAoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364465; c=relaxed/simple;
	bh=gv3z1luQPW0kWiSW4nafQVoOxWYn1gnj91LV2B913+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fH3IhV6mWG0CTd6dOMPhH3HD+9MetaltTiPO+px4+gyZefezuHBH4Q1ZYut/7asId+eNHYjRDm73PPfjHI2eHHePfPpXtAm2xeDI60EVFb6SOIl3QB/XoDZH2PDSUVP1iyDZwMuInqa+CAKx9xjsPkKIxOf3oAUfdlII9Y+WFiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr0H++Ou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0HGQ0MR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr0H++Ou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0HGQ0MR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FYvlk3071057
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDbkdyPhtoLKFyUKgvhaPrzl5RB8r9i8ln3i0U+YBVY=; b=nr0H++Ouy2NZn77V
	/8tmkA1HnODsnEfvM1kUtbd9ZP5yqsTh5yWvMpO6wkRYFAqtIldx7h1NMHtdyxgm
	4n4eeAJPRVgn+Edzb6no+b/S7vcTs4RKPTlllW3SbyjzmOVmr1wYUpGvnJA3W351
	YD80O3Vieqs+7qHZbtCr/ErPsUsFHVET4QILnK2t+3cuRylyoYNWSS8gYJXCSOuV
	K4NuxVKMD2RMsQyfYCACMaIAbRCy0/Hldfbt4G+3Y+xJB+qGDanykMFz9p3k7mWv
	WFitHdK1tcAkBvsYDapNQYlTymc6dYLPCpjz1nMmJtDSljd21SUiuYRAjJnGrHT0
	4X59JA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrng9hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:54:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so28542585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364461; x=1788969261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDbkdyPhtoLKFyUKgvhaPrzl5RB8r9i8ln3i0U+YBVY=;
        b=I0HGQ0MRW2E9XpcSjc01N1H/qbm0ecknvwIHjsw4M7PSeBfvP+5RKXifxjPcbjd9K8
         QQlZcycK3Vu4/NRRXQqgLij02UFyDWpUFIjB2IGIzbxPQFTGOUo5vEbT014wYxATYspU
         aM7/MR5ypxMafpaAWeNUrIUIy4zQM1cSWJrR3OF7NLhG8h+V3cgZXX5kp5jSthvaWi08
         gNcHa4T0UQtqY1JyS7pfeFY6VP1J4vEbod6x+lV50EFZylo/lNYDCIw2bltdaPYq+qtN
         40vTER7WjpM4B/rmHVvJKaa/ppHSzTGRp0axKF4SVg6dVezp1p+JzgTr0wBYPMJO1/XO
         F0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364461; x=1788969261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDbkdyPhtoLKFyUKgvhaPrzl5RB8r9i8ln3i0U+YBVY=;
        b=k9yL1To4hUqlrI3sKO1FZIyKUGA3sjtWkZfvPpA5YMFYs84I3n1IDx3xowJZuQFo2v
         5NCkjl5x+TuK/zEm7cEdsHlbR3CpZW98TKxlzoyQL6p9rbqfS+5dlEviyBzViJ0m9jh5
         4V2tGTjC/zjt+fSIUQjybL1yI8GmvlGINbqV+8SWO/86b3czx3sygCYXJ6DO7s407i3F
         IjWTVqzlJbTbZQbIoRm8TqIlsfAbbpFLtLCrkBHzHt0+BKafTzInWfDLQmODNfbfPUf9
         BKUDOGqjSxGkC0T+3NJ6eVvoNsIBVUk7joleFqCrnQECP2lehU28xmETb7CFQeH6g6D+
         uvNw==
X-Forwarded-Encrypted: i=1; AHgh+RrI0cYagf+nXmEa91DxLMQ6BywK4cnywEZPedm10IZHc64PuqyMpycZa0tAehTTZb1vifHrnJcS3C1F1yA=@vger.kernel.org
X-Gm-Message-State: AFuF++licgk6SrdPEEeF7pTKLmPt2ngDBV2dyhEPb7V1WDMIUsoTiBkQ
	SEbeKv8wg1kq8EU1RG7/rYy0GSRko05wPq4PSewfFXcBMoD9+ePoM0oDEUJQZcwP0hy6bq/PRvW
	uUGkwgH1LIXtz0yj7l3D1lUNz9dAhQMVDEA4mLcWtPPJnRDp3y7ahCSXdalU9qqk4jast6JeT5p
	M=
X-Gm-Gg: AR+sD12hA20sTFOPzx0epZZsUrOKqIXrx64U8r4mw/+/g0Wi3Ehj32HWxOpXGOKgn3S
	6s/c3MG9FBB7yU+jmixuVvTMneGv3ZHhD7A7c7TWA9ZOgrCgijsAMz4qcl+ZZxFGY/C/iH3nZvE
	7zEo0B10zlLmeXakqTHiTZ1kZ5NouB8lnvCJmgmMZqTEDX+eq7mLEohNRUXmy23zLvHOBhyZwXr
	kpxgCzMpqkx45JoMcX1ZzEKJfz4DwtAePXs55mnlRGEft1V8DLaecnltwxpDDqNBhDl0vB3MYkr
	N0YeR/y5E/YeNzZssnuYTOoCjF2jUxABI7oGP/QIGWbwhcSLKsMpx4ZQFo8pArJrKvrO7v2yWJR
	1xVgnN8sOatQZXdt20Tb5Kg==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr400619785a.3.1788364461460;
        Wed, 02 Sep 2026 08:54:21 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr400614985a.3.1788364460903;
        Wed, 02 Sep 2026 08:54:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f95f557sm1378949a12.31.2026.09.02.08.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:54:20 -0700 (PDT)
Message-ID: <0ba34862-0268-428b-850a-a43f795c3065@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:54:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] arm64: dts: qcom: x1p42100-microsoft-sp12in:
 Mark the EC reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-16-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-16-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: feQHAbColPn7p0LdOck043nYzpmN4spI
X-Proofpoint-ORIG-GUID: feQHAbColPn7p0LdOck043nYzpmN4spI
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a9846ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Wad5cFZijfJPr_ZhbakA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX4i1baJjbF7RY
 XSqXtAAcHEyvAlzeND+jUCcPmtl5+0LJ2dmVz3fI6g2LAXJVraxf6ClMQy3vlSPK9zElcEhm2uV
 hnzGqVMO3iPNcTtskVGQwWh1GJgMnKglASUO97B0Wde1hzg5XnfRubwgadF1nbjFlhnmWOaVTJO
 9+1ka8KuveD9W+/n40fU4Kn5elWStfQVbRv4/ZffvA1nJ/gen5ONN0m/WD2IHunxSHyia8LnfOz
 cZaVPZ8dJUGO7IBiQCrK0+LGewq0kZYREWtZ1YHbea4zxsB4IGsTPa/T6bjyC9eEsz4sFY6Ho/O
 p/AlWholz2r7I0vSaXYPOjJjuGLeOJo+5eYwI/h17aRu333QxgqslgaAz3t1JGD9+ece1KUsKRP
 4DN/oyj5Bb046Y5DgSQ2+tlVjhxT9cOxzD2Mh1hzzdk8PYhFrtRXM6qF109zn4b0fi2KklQ9t1C
 Sz+7OOcIvESRKCas/UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX420hhot252L8
 QTMQrvtKE9YbCSvMkN0aWXHNmmFLEOUO9HS49b/F+xwFTrm02zLHcKrr9dZWSPFXm7R2mUH7tDB
 /6PoRBScLZZkE6M6UYrWqKQWraP03xs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020140

On 9/1/26 10:07 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 447f8053b184 ("arm64: dts: qcom: purwa: Add Microsoft Surface Pro 12in")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> index 0314b2246cdb..7f7245773e6d 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> @@ -970,7 +970,8 @@ right_spkr: speaker@0,1 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <34 2>, /* Unused */
> -			       <44 4>; /* SPI (TPM) */
> +			       <44 4>, /* SPI (TPM) */
> +			       <65 1>; /* EC reset */

Same comment as the other Surface

Konrad
