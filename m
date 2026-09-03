Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D7244A3F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424537; cv=none; b=BlENskirSQJVkKiiOMpvDlnyBxBLzJ/SB2HHA9aYHPk53HszqQJ9EyKNCAT5z0QZdM+E/tW179u2WmYG10p5/c9jsFkj0tuYEEOHx4GGDrCH/Y3t727J2ge9iZLfcdK45Kc3LP1y5D/dMH0TQovtlqG4x0lfArJkeOQ+Ix/Cia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424537; c=relaxed/simple;
	bh=CKeQ0kGfmW9zgzc3O5aZOERbMGkC8XLbolmlz6fWCxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIZ+kRn9Mr423rzfD67T6Gb1viuM2Cb+0BPv1yR0+opSb69ZhnCBEDfH/qdkp5eJztYxp+UIG2US7R95BFmZlkvzvSSYbfHBYK4DcpVWrRKNHZCbyZ6Lgzf+NlbqOFhU6ZM6Zp3tbCyOLf1VaqkIquDO5ZWpUBni+rbJ3WFf2R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBjU6b+k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qd1TkcpA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBjU6b+k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qd1TkcpA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835mc3j3643825
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p8CUNZLHDse0n7ZcxKsMrOcZ
	UU0tfBhIxTsMSoRuXhI=; b=JBjU6b+kC8mIoG/zc9pR1N2DQWOsEEsyekSbFAjV
	gVsEm/jrDbjgCJtUxdrpacEmwO0aT1kJZknJzLlr9vKPoW3u/69xNxsOjf3fnMXD
	8mWlQFMUooURnlOgKrFlbN7lSoV1jLNGPDkB4kJ8e56jJsv3cA+g324iPbvDke6P
	XyQIDYaMu8iyehc+kf4KenwkdZLbVoCoox41J6SN4APsD9fKTs7qbcpadNOR5koh
	yTDDlQpEbr6AfjnlGBTcWncABg+FOaCQAsXBmk5dO3uy8FuUHgyQq9031PZaOpl2
	biMypX0enO8XQW3mJ+XkwvYeW3TVHpCG8ZoIdH1iwevTyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrduyp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:35:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so132233285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788424534; x=1789029334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8CUNZLHDse0n7ZcxKsMrOcZUU0tfBhIxTsMSoRuXhI=;
        b=Qd1TkcpA7rf9l+AArCGhdQIzmouukAQeNgMJNImXLrH80YgfaSu+obf2DSppRI8WMn
         1uwwXjY6Wsi5TDE2maIWNWZD7xFxDiN52AFfMRUXlN/63fl2O0tpsOaCF34YClRI/Gvl
         ToI/ISYHkRcXtb1Mq6OW3YkpVeHCvaRYbg6jApj44xfCm5fPWP6b2c4ulpZ5IdFxdhxy
         +PPT+miLKqEtiTbYYQGjo3899bJfNydZ6J7dOreX+o96lPs1vBtAhDDYuOXlJg3FeVA6
         nZKjg/HiL3hjPF5UqxDhgqvdUxSwcKfSuc2wfFQwnTN7WuMbS5Z3lMRj12d9nPy4Yql+
         Vs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424534; x=1789029334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8CUNZLHDse0n7ZcxKsMrOcZUU0tfBhIxTsMSoRuXhI=;
        b=TfRNn7GO5TlMqf2vSWx7K3a2/MZIxz+uYngQRpxmXMo5lQcmkZ/vLg2BYpxEGU8h2r
         IJl0aFxkOYNHNG1goCIb4nZLJ/r46PwWxI6CsRv96oXNr8Ca/xU0h0xQ1FPgMWxrEeN8
         5xx5ryKGIqiz2VasC7O4z4cvBRGWLfT2b7ReQzsq0fl7l3gC1BRqndW361aw5fW58Y+N
         7hD4+umDozu0r17yIDljIjkY1vwWiFbLjHD9SYYXHIxpwBhYYWzrEEqwijemMvgs/kMR
         kMQmD5wHeIN/9+H+ei0al1oz+xknuwoziAzRGtsPBuT5AKzNh3PahImOUhO92lzrb2bQ
         KSUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH3AR2hT0Bz1lQ1Qr64t+p7+UKcUFJkO60TkGU+Pdki6K2uMJ40cqUuTgZz02NaPRfJ6qZgRno7Yp+4CA=@vger.kernel.org
X-Gm-Message-State: AFuF++lh+se8A6VCiEnj+d53jAAjHGPfb7s/wmOzJtLGO9Vis377InWD
	ctJFOraJd+p918pk8AMqxfOizwNFZYJBuWUO9rQ35hEnFpDYHah7bQ6LDuSw9SpeFrkHA3hM7or
	3K42zBEsIgqH6NkM50Dz31YxK33xLlMIe3lRC+v4N/fE7/mnO2AfriIjg+34BK/qpl78=
X-Gm-Gg: AYBFou38ZX63JbXnbgjMuoMp1Hk/4LispKT3Jy9MaVheLuFzW7RQ0gsLehi3pNwgjEB
	vDiHjdt2L5cYuZjBztFu5uP7ggaF0XNgxIeknFp2hkfCkD9sYd2FaK+xWKdl0FIS1wJEkbsFAk1
	4ETffXGrooi7FhfQeupjrw5Qyh06h3HN9DdTmBZg0i+ahuV46YCM6dWJ3pUVT+hc4HKKI1b9Ow8
	acbvpMKYFRupgKvegteLkwxmSJOnPO6iM4H4+UcUpTA+mXq66W3UqAP1NeHmp9Q0fSl0m+jiQB1
	MqCSL2r1mi4Mron+u3Okm9Tp+as9QfNwAzpTQmX3mEZ/R8MOR7PH4zgJA3a3fzVH4Za1OfygTxb
	wFy/MlK2U6HsK1g==
X-Received: by 2002:a05:620a:454f:b0:939:72cb:bae1 with SMTP id af79cd13be357-93972cbbc1bmr158790185a.24.1788424533999;
        Thu, 03 Sep 2026 01:35:33 -0700 (PDT)
X-Received: by 2002:a05:620a:454f:b0:939:72cb:bae1 with SMTP id af79cd13be357-93972cbbc1bmr158787385a.24.1788424533381;
        Thu, 03 Sep 2026 01:35:33 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72d2asm11510386f8f.8.2026.09.03.01.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:35:32 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:35:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v2 08/16] arm64: dts: qcom: microsoft-romulus: Mark the
 EC reset gpio as reserved
Message-ID: <jfqprtif3hwazydbfj5kr5advyjvtijgb4alznj6437oyc45tg@wlaxslatpwgf>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
 <762f2294-27ff-44ab-b4b2-ffd415639928@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <762f2294-27ff-44ab-b4b2-ffd415639928@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a993156 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mp5OKAHwAQw1bhdd19QA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WCiJYUlnhy4Lf3uBA2QHvmdEVqKhsjYH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfXyut62CkGk62H
 8Oys1sxUksziItTJmf/L2UV15/DXFlMoy2xs3Yv3RNK3s/fF7zoEJ5G1SCwFsT7bJh5C4woqCIB
 XvdO6zVCkXLwEoqkr22sZfcTWV74HdTDiWcMUsj3uSEqUeAsBe7wI+aKRU1SJjUR8f7hCIx8sZw
 yCG/XUw77vK3Q6bSvmIWkRcIogFPDJOoBKVgXMU8wP7QiWvP1UMrwKuvOJZ/S9m9ifTWyi7RxqI
 z0ANKJPj/dLUqbvEs2Q+27lo/30qaofs7X52E+7WyHJ50+u54vb/r4uFMIUprcwK9vxhU/SNBI4
 QW9G4btnPTKT9nD/zUHigJrYcXopciOOwzEzuIdqLyHwX8K6zwXhgf7xBe+48F+KbBilteQoJg4
 WOBj7SieZQIH5WaLVe6ckG4UoFCn7oxDHoNCmBrK6Gqn1WdHlbFCnVbqHl+jePKz6/ejulUlMCs
 7KnYSznmWX9TWD45Mxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX0a2veDv3H4Mg
 4Xlq/gOndsfX2q02VrYwLsZyn/tUcqlq+QcbA6+s3wYENLNLx4aSwfMUjsmCf2+ALzqts60mc/e
 ze55r11ryQfF1vQElEfgz0EdFgbDYEg=
X-Proofpoint-ORIG-GUID: WCiJYUlnhy4Lf3uBA2QHvmdEVqKhsjYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073

On 26-09-02 17:50:07, Konrad Dybcio wrote:
> On 9/1/26 10:07 AM, Abel Vesa wrote:
> > GPIO 65 from TLMM is used by the embedded controller as its reset line.
> > 
> > On some devices, toggling the embedded controller reset line makes the
> > device not power up at all, unless the battery is unplugged.
> > 
> > So reserve it in order to prevent Linux from requesting or
> > reconfiguring it.
> > 
> > Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> > index 13d0f09e0c2a..bc684c295b89 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> > @@ -1324,6 +1324,7 @@ wcd_tx: codec@0,3 {
> >  
> >  &tlmm {
> >  	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
> > +			       <65 1>, /* EC reset */
> >  			       <238 1>; /* UFS Reset */
> 
> On this device, GPIO_65 is an enable pin for the touchpad regulator
> (or something else that is a pre-requisite of the touchpad working)

OK, so I'll drop all changes for Microsoft devices then.
