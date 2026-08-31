Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D979F3D331E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165399; cv=none; b=YkuATTMU8AfuiH7UMladToScEzktxM37ixLqDXy/GPoKpT892VWkvh60+Mxf83iKYSQVnaBUEH/7KG7JDhHYEni4bldliZLpF8dc5rCVe7l05TmXd57a83G8X7SFI9Z9MWySTBwLI4QN8XG9NcTVTmCXEv1gT4jE0iV9G9obe8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165399; c=relaxed/simple;
	bh=X1PkckIN8HFBzuUJHXpj0gyUsnyjgXDoDkesNRi0/Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbdOff1v064SmSxLQXrXUb5zFUkuB75GtA0M3/Xx71GFSO7zT9hOMH6N4NgkJc95gqmxTwLIWWU0Ijo2121A1cNAFydPB3me6Ve8uzzGb2NGOQDuKw8DufKrLqTRpl4rBGUHggpv3v1kY1m2i9k528B8W1Dd8ZSsTbLzYze99OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZGcdVqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGQjy3I2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZGcdVqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGQjy3I2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xKdT2460296
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5fbuWbLjGe/VWQ+xdqB2iUkT
	CTTMr+XlvxmuKcx6U5M=; b=gZGcdVqdYCsO0VsFhHqCd0VhhrMbdCkRyY8TWLBh
	++VTxnmO3iIyUqjlP+B5/cerum7HIrjv9zP2HnfE5RQcsL8+LrCYHssf0erBBe/6
	yPg59MOQU59CgT4vl0EEiovk/n/fFF+gdJxID8bQsejPRjdSjINxlmAmJxtHLPWW
	/8P4HVTAJ8B63M9yalng1HACNhguQUK0ztg+wLegIVhldcEeqIBawQHPr0PqWDr8
	vdFbq+S7hV0hoBsxlV2fo+/JOCHOjDSKcBJmBZRR90khIBOrxrlFka4Y7Uojcwk1
	KIENC3EhKg/VrR+iw7xbVtkbED6OI87al+tzt8Vp4zgJTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556ra5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:36:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so418300485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165390; x=1788770190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fbuWbLjGe/VWQ+xdqB2iUkTCTTMr+XlvxmuKcx6U5M=;
        b=cGQjy3I29jVjxsiilLkPcd4Rf4y3yq52fNxmHfnQxHgCfa6RIFJNxa7R5yiPAONTEM
         JnsPlolUdsP2ks1MqgKzKY5qUidc6Cwuh1dITv5NbohMnbtQG2h7sxxusZ1VIrJIga7E
         7G1yM5AyQuCr7FyWXsrfBLE4QECt5o3h1gHpNUlKWE32siiKRn9m4hb++clCUtIsUyxF
         ohKIbBT987LvIzmbMVSq+dYNfXIiR0PDvExzq0Nc5PvYMX+gAqbGRUAG69BN36ghfA5F
         DCO5OIQaBIQb8p7jzwUyk0SNbiegZpQsEgFXWLkf96z6RGczT/PRVOz7IgWFjl6Lf9bN
         WZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165390; x=1788770190;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fbuWbLjGe/VWQ+xdqB2iUkTCTTMr+XlvxmuKcx6U5M=;
        b=fwrK+Sky4Oa49qO/qzXrardvqHca4JpR74nx6W5G53tiGdUVSvEx3kxJ6yDqXIf+mz
         eIXHSgFwxHO2JdQ5UQJOPUJAuHmB68eD6pmrc4q55jnXk3wwPeDTzc0VX6LTfdE5xyJz
         BNbvn6vXzK8cKTejU7kVhv3ViABsG5Z+40QL4Y5/A2WVizE4IuoSjTJCp6ABmcVcekKB
         jl0IMEisWpWR7EMCNm1WPXmxO7EY8Mpeq0bGj3i4L2t5EO9SwQsFhtM/pVKEx7EhBMII
         qXNinskh4TUniTru05lrvgqlN9+WLjc+WxRqd9Uoi1JhkaF55klsMMcpaSZ/EtoNsxkd
         Oqjg==
X-Forwarded-Encrypted: i=1; AHgh+Rpp45qHPFw7paFDhtRZ3b08pF/OAgYy1j7yYeGCrf9+4PXfZNJcCwiJPodxlWRvUNGmej3dWEIL7d+w8F8=@vger.kernel.org
X-Gm-Message-State: AFuF++kxhe32hTS7oQFQn0mbZ6FurR40mSPyfr4dHB9nuPcX2Id4tTo1
	ZZVX7r4CJo9of95yvOuUoeIF4fQO6CkeZVzE+XTfzHYJJo++pv1KzC5CO6cPWB2/vGzkjEwpdhW
	wQLHMcBjGluaCU4oUBnkv4Z3QVNjXviIGXIOfAhKTx/jV+wpCY7zYY6ezym5LwpU8MpE=
X-Gm-Gg: AR+sD13Loi6xaxHNZObHOk/Xx33hQt/PZue/Tm3keupXLY3BkESdGbdYdA8F4YfEIG1
	RUkdxnu6/J78D5aCzQECo0HhIUtsmGfvv+E6JC+NtG5H56EFpTNl3JUVohzYHLWDPOFylYdU/Jt
	bFrdOZyRoufJy6X51lBQcdkj6xJuL3h7JUbaYADqwea25QPMiek2jBwp/ucS8+G23a6m14NXNXI
	yAjvd2PNhxTD0VDouyBpItupQuT0okMiOOC+/qYkp4PqEcGndp4v2Yti2wvcJ3Xob9KVcksVROX
	Z33SHnABAhkyjSvPlCJA0aj8T5M6dbEqhPYenGICd/QJeX40opRo3HtnR8lTKlgewY6QswctqE/
	wFzMxqwVgxwa29w==
X-Received: by 2002:a05:620a:8385:b0:939:197f:345e with SMTP id af79cd13be357-939197f3754mr2690956485a.22.1788165389853;
        Mon, 31 Aug 2026 01:36:29 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:939:197f:345e with SMTP id af79cd13be357-939197f3754mr2690951585a.22.1788165389248;
        Mon, 31 Aug 2026 01:36:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843adf1377sm6448270f8f.18.2026.08.31.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:36:28 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:36:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Message-ID: <xtjpv3a5cy6nvr7gw5ln4vuwdsctz5k4f7lcmfetpre5lwia27@omde323ra5mf>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfXygddavFMeP7W
 9SMfsuoztwom70rO/Opr4ejYMSelsLmJE7QNOncbdiStF62pATPjCIFVnJ+iD+UBoAGUhSeM7Bq
 3sv6jW96tvgdZRmJkWzqKAgeKNR2GPY=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a953d0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Twdo5_02SbyOhDGnJGIA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WZCpXYTYUeur8ZSSQEwrzrrF9S6qEFD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfX2mzIJ13pET4e
 NN4I6Ufpu/0BxTBMwy2fwNw7VsK00Qe+vaban/q9B+Kc80JIOSqdgxtSnL7tV2HjA/B27oPnN/Y
 XRFASGNrck1NNujxa4NFLva/Rwig1b4W50kg1/koyfI9Q76KlyNTWBbwFsy21A0nwUkfHXljMp1
 ynoKKL3ONci0tb4tJtfAVmkAhbmMdiTf+rEftNOFX8epfwg0IQzjMg48gzCKndUSLm2xFAwiEv+
 H/dubiYX2St8A8awqWc8gJ77bPF9QqILUzqMuOD4qJ4x8xKQ4Q5vP1rwAW4KsG46m4CSYv3CZQl
 b2sl5quZfAGS5fPNQ9IpN4M+rgx0qvfwUlOktUptdCFENroUMNVjkHIsJoiXpggiXB8HhztVTw8
 xX5/iWwU2GMWPP3098FkIaIGLXhCHqZ7tFYen/de7birJRbsoWXX7RrGU1nGkoaatWIWL11Z/2r
 a5g75vov9UA2JyPADkA==
X-Proofpoint-GUID: WZCpXYTYUeur8ZSSQEwrzrrF9S6qEFD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310073

On 26-08-31 10:20:52, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
