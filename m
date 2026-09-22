Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443E4F93B1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109731; cv=none; b=byD9axZ1xohKbuEd0wJv7N5WCCPDWdRaZZNdj5YmQ0TpdwBdeEAv7Szia42GZWZPml+/s000Qv2C/YGeXitc8yNblAbgOoDXDmKSUtX+RKNSBWSZzAk26914f130Lcxw7+mqXIb98wSrQAmez424FmmwiCfTxtKLK3yvRyTFYoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109731; c=relaxed/simple;
	bh=vakGs22BbcNPWIXA0rOWiz3UEs+upsXFnGyjZNiJ14s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9MCmL3YHoFl1IfIfGk8yxMbuiDSaEtayAMn6PJrrn/zCUtUOq8vKMgzKfGqVavUtvIly0NCitHH/YqRmd/Hc0Dd3Zrd95aJETKlqW8FlXW75yDygCv3YFZazfngWTe1WqZ/G3n9WyuwcUOaYjuJOYTw9p8GzyhAlCSfEukwCQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA0+H6g3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auBc2efq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA0+H6g3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auBc2efq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7CBI368018
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=381iYosL+3itKnt5YRFUwV8J
	LY4LD2cyjBXKrHQ2ChI=; b=aA0+H6g3oXd2Sa6hy5rldT9oCLIck0OdeO2hMwWA
	+lOS64/elxIhA6SQVJ2g9onAMk1vq4NMRfVdYqwpdbWvUraWiccVFHulQApfZo7A
	e+akbRWkGnFucV1PBRoMRLpyMihQyGUkHArG4Ulu7sfq0FXmzrEPKzIN4kpRAFxS
	KDP+uwgKchVdocWU8boMFiJpRw1Gw0ORe2pHUsTVuhhXOvyP0R1QqF+upcJ9HBrw
	jJJfe2m25FchMK/Im8DCRNUUtTXliCCVzWlniL2dEY7ThpUPZXIeav9Oglc6rueC
	cfx/gCZvPyQxHHzN0GK29/ShUY4h0WhwqCEMwnf1o/t2qA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntaun5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:41:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a183a0e93so82726785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109706; x=1790714506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=381iYosL+3itKnt5YRFUwV8JLY4LD2cyjBXKrHQ2ChI=;
        b=auBc2efqPM0HXKV23CLxk3ddObcdpwVg6OvjPdlAuMjQGBt4Q8hjPY5kxla4e5cpwL
         Qf/5f2hjUNAOcCxLA3vRniuBI1T5sAmt9Yb4TTieDtH8f9K/fNYw3qqN8upDyeRkwPZ0
         zHNN44QQ3MUFC8YA/zlw4hMIn3pHBkx7RefExWwlYJ31sAWc7r2s9ts0kFRlunlH6jdv
         AHu7ZS/gc24iJNs7cuHL/SjdGq4AR62BEIWMVzRjSEbh+CiR46FbEJqJGlY0G6sjozjq
         kkJfxg7QVG8E+OfL00dkjveGKEuSwIEMoChmWqLmXyxWlMYcbp6Rwdrf1aTyHU2DlGl3
         21Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109706; x=1790714506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=381iYosL+3itKnt5YRFUwV8JLY4LD2cyjBXKrHQ2ChI=;
        b=mdUoEBfIoHf67rsICLmDm2h7EvhfyPOtlmG3iydc56iABTwE8j97ZM92vBTvARwyJl
         e7MsQs2ZHvbQLkg1PTm6+Jfk79E0g8JAzxCVIXMUKMczhAEDuT+sSdK2yqCa+ydtXBr4
         AlJSzV2keUVCqbcPkEDDh6PlXHpGQnVU4KINx0/+hjrXUVuhDklBLUZeYXkbCsUOR+2W
         S7DuxcA3X+Y6rkZDNtIXUTHeAnBAto2ICJ0q4kjm334qX5133Qj34eKIyE0RcRavg7Z4
         DE/oz+OVJub8580w7bG1baqTYBTtBMCIysV/j90ZjLoH8oo1H1v0+nNY0ch8+yLBkkhP
         JnBg==
X-Forwarded-Encrypted: i=1; AKwUvBzuXsq377MS2H4RsIDqIYAPb+kbB0wAbhYGl4J3/6u49qHYF2tZzLZ8XaMykuGxF8vvrsMdttyjrd7L1Ww=@vger.kernel.org
X-Gm-Message-State: AFuF++k1LT9mTVYeeTuKqDoqGcQx8PMGijbfs1D9EBEGnkBkzbw3Jr25
	O78BuyN09kTnFEuqmxdeDOxfzxHWUTciRJPT+g0/+w4QHIo7AQ/U5AY/NUxUw2lofBH/jvvFhZV
	uY8XnLmvXHoHk5TZ7jZK1qaKxKpK1tIijpP5rGNE1qh8E4pTsWLkP3Hlb57yYaczCHlc=
X-Gm-Gg: AYBFou3fhL17vbf7dxdTbhAilKjgHFR7e4xEmK535jTp99C6hZGC8B2vhSFGba604Ov
	Ry4dvDBJPl0wrLNdLq9Dw5ShqRkgRFHLGY8j8fpIiO4dHau7KKRxoEeXNxAs4Ww3lXT/Is9LDuP
	a8QFK0vGvjoELerVZWeHJmfNHvlm/4K22nmLxi1oBpUe3Hhnvt5y88cMjx0JQN2W+w62G402uV9
	C6r6hlDbPwC+nIyTeLxOAE2NtgaHNR0d9YjJ+9dMtaov02LakfVkSNJ8F2+KMVYlm3F/SzXQcDw
	OE+IKR6VAhgnre/dB4xPsKXZMK1rXng1+UndcPyUAwgXyJg2Xej1emWnhEOV7luU7Tzp7Md/mAW
	KnAV4C/XNKX+fuwk=
X-Received: by 2002:a05:620a:4546:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c25096a2emr96675185a.2.1790109705624;
        Tue, 22 Sep 2026 13:41:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c25096a2emr96669785a.2.1790109705035;
        Tue, 22 Sep 2026 13:41:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868779472sm1056265f8f.23.2026.09.22.13.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:41:44 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:41:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add lpass clock controller driver for
 Glymur
Message-ID: <dadpw3tpjoitgsm7v7l2wt5jmzdpj2zxjxef2dknxijgn6scsi@cbkn7daetyzi>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jZRkBEezPu9a5IkvpymZCef_h6mx5FyN
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2e80a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gMLPUS0fGnAuojaj054A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfXxLnfioqHnoRf
 CYZfDsWFjY3Fbda+XQ+Mld5jpf2vIpjiac88pB35FB190k2AMDQq22X/BZBN2Ua8+TgjPtLpjy2
 IPA03ATyUjxhNqx7HLj//OjGmZTjAsXT9bgP+6hTbDxPtH8LvmGfAPeIMt18rT0SjcZ4F/M66iA
 +BPgOEgzu6Jk349lsU02wR5rZjO635w9Bbjgot0NV+0iDWnNR7BOQrZQ3pJLU1zR21TtYa21aWh
 F6llunUuLw8pbBlQNLrJRl0zyr2YttJKirf1S7eBNhBld2yFPX0FePtWc3VGzTRMhcZdgm9W/2W
 qQti04tjx2dCEzu3LTctD6ahR9Lj/uS69+etHkY7d4MDA9vWQx1LAjAU8xDzr92lhpcgXlP7fAo
 bUvH2qSA0fIPiQ6vZfCCemv2BMDmJwX7GepN59c1TWqyBUITP3oeSaS5vzpYA+0U6LIbPEUNAiW
 PoeDYnCihqNijqWv3nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX2nHJk/Y4atyb
 4JfGLF+g53TKJ9we3iOPEJAJRTPncfK2jC0nohSYv7pqziagOJih4SJEJUeHJA34ON4zjDk68t+
 Cjj+epchKW89CuR2rJYM6n3kiZhS0XY=
X-Proofpoint-GUID: jZRkBEezPu9a5IkvpymZCef_h6mx5FyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 19:44:25, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on Glymur based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
