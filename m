Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213936;
	b=4IXwL1MAR4Vcgu5yIGxmHXe+YkhvE3HoNDVlYMZ8ZqrZVfO6D2M9cZBqkcoC+cT7fQ+4
	 XUEW/Ee4de5WXQ5HEHuUoiDd+AWHvaQxQ2RXmrMWTAuCe12J4nli/q3xuRHXHoPofKa8a
	 Gwvqb6qHjyqFgQ7smiEl9guDVrqY81rAXxx9MDBMrUGA3P4D/1z4ji0Z6CJ2EyBN9WoXq
	 LXHK/JR7cqXCWcqh19KjAe2/fOIXqTYyhADDhGJKTDor472V6HbWerDqMvrRUrGeY1d2d
	 wbkycY1U4SHFY3qKJbXevs66weTzUHvbg6cuj/RV/BsTc/X/TblIh1W1iSush4QUugA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bve5kvV3t/3HY219svaq+WRcdTGX0LKxdGdyoaAD/Sk=;
	b=hNxobzOmBHruHuk59CwzQWkoKFCjINPQlGtbZw2UXg13mz00xLAMKs3Kznr9hJq7wlLs
	 RZj/fsYjUwoB5sHyyNkr7a07AGvP8u02by0UV/sgeoq8Ah17PAfi93LY3QeCihQ3LfRwc
	 q0mY+vsvm7d9IVXzT/+tOgbn7w1/HzkqkfMyXZhVreW+u4EN2y11wOhXg/LveeisiWRJ/
	 vT+dFl1KOQW+g3/uz5wbUd+9FgrWDt5diDqJEYjn3l2kzNp5U2Ii0rl/xFmkNWnzu444k
	 ZSBL3k3fe8H3L6lCZTsRh/j0keOXqrHGj6Ar8YW7t5mPKn43t7bZgP+Ix76ExpKvESw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ej1WXG9S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CDB64Auw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212B606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C212B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ej1WXG9S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CDB64Auw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A97oxtd3324849
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bve5kvV3t/3HY219svaq+WRc
	dTGX0LKxdGdyoaAD/Sk=; b=Ej1WXG9SOTLTwU20kwu1SF209+mwn/G0XnLH+DV3
	aqERRjYQnbO4dVeOS8dQK4S4DvojayoMrUGD2pcKdSwsETdyo8/WFrWbNyEcI7Ur
	JzNw8Y3QXlqgaBFOoZcXL2Gd94Pa+OHLW+HK6P138tfdbNgpPZV3Q0QsRmbrNcMi
	+yZ8RbN5FTAJDtteHclAMtvH69vnVKlFXbNtoiXJNxLyMorh1KR1o/F3uf6HbLQB
	8Q46jhF+qeMSB6LvGjWVf2prUs79ekbylTmQ9o67fhsDQDailo7J/HGHA4daGpIM
	R/N1aMgUEs5P1QYAUl1djwvWU1h/9gvovNAdkbMhpMFFyg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5885xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:45:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b92772710so566539241.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213934; x=1794818734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bve5kvV3t/3HY219svaq+WRcdTGX0LKxdGdyoaAD/Sk=;
        b=CDB64AuwVm1F385yw06oNYoftBDjxSMhgqdUlclFmjwzYWZ4WyOpCkg/jp4QtvEKG7
         nD5u01BIKC2b9SEynwKaAsPMA6mPcYh89jlChUShdoAjt0m5e6lpe6ZO7pMXxyQtByug
         ojqt1w1r9TcfXPM/q7am8FlWJsLjE8Klnjxxbxhv2c/FqCxG6WTuO7d7aweWtajtMMPz
         +W8PEH/NI3sU0S08unifZBAxzzYl0j3V/LOomdbOSebwcU2MmiC76vVcvnUQeAnAeD4m
         ff96Os6tQPbUzt7Y5Od6gk5pplgiGaaEk65d0UtjSmsWgJhazpgI7M6s34eAaD4DXmLg
         iSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213934; x=1794818734;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bve5kvV3t/3HY219svaq+WRcdTGX0LKxdGdyoaAD/Sk=;
        b=lNRUjfl9sGvD9uVE6niQD4nRp8hyATEd8ROBePmuSeriC5/09n9uSY+77HqhTXA4TZ
         X8q0+3A0RQtDYcG4AQ/ffaqbl9HQjxKARNnqsdsH52RnjtGeGKmfOSiyI7fzEOXP9yZC
         TtgjRCuIBJqLppaMit6qAzPvgfw+lzwBaHFwf7pEHlOGwRxsNSwvSXBWzMyYRiXR9MoT
         I/rpekdD2YMzczJWnWp9kuNLTg8ajCKFe0e+oqsuAJcmX7RoAcw3Qki5BpKdN7GnM0J9
         vOH1Ih5N9SxwxeQTuXChP0Q/asSNEF/IlKbWs4volTAsh3GDsy5XS3Byq6bx+H/0nwk6
         tweg==
X-Forwarded-Encrypted: i=1; AL+hErHl16SxU24v6AKMnTga1lh7fXVcNAsgqgvmt21MN61iQyX9p5xz+TOQaSku/pQGrWWDOxMtxCbP4bewicI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DD0RyXb54K8jSAexU2Fp6+XwUjVqa9c0WeYA63+dNWut+1VC/
	qbOKczbfKh5F5HcRlWoWPse5Gm69yvALQvx9yNVk6ca0S6jPFqAVo227jaQ6rMweNnhqZNCat27
	0l7s6W3cIRTVwwBIASyUfJHBFaoulJzvR0/Rk75LsrvY4NT5Pq+jbKT9wEOVMqErvea8=
X-Gm-Gg: AYBFou1XBclSyxhqFj0fjbcryWt2XJuN6R2U+eEbQEpOWQDuBfLrFaymL4GK5nVmEK1
	kX4ANOexzrMh96vye0oWYDY2nHzejdZ22WPi4TM+dThRqUA2HwbK2GAqezfi867EBChs+R92qfp
	NHfTyg1r1CDwql16HncDrcXfkZ8GnqqGlDAZeiIyoPgQvm3/JTptGnZSuzSMV4FxDH6NU+gR93W
	YZZ/a8nfC8vk6uayHJxWBy8+L34BMocM+YGgpiZ06NfbKnYAcBSYWRy+w8cNGwn2jTWUscQoDXi
	zv+rPgp+7DkgJUXiKGQvQ1YXi4O5h7TY0B6iVWOt1R3KFcZeYFi0q7UlP9snk2eDfcM7o8hkb+n
	zoKtzO48o9DHc2yJttbk2eQWeRHLFrJc9IbTiOoPbWlDleL0lbEMK0d3y18EIpCo=
X-Received: by 2002:a05:6102:2922:b0:7cc:2674:b78c with SMTP id ada2fe7eead31-7d2daf1bce7mr804627137.7.1794213933808;
        Mon, 09 Nov 2026 00:45:33 -0800 (PST)
X-Received: by 2002:a05:6102:2922:b0:7cc:2674:b78c with SMTP id ada2fe7eead31-7d2daf1bce7mr804621137.7.1794213932926;
        Mon, 09 Nov 2026 00:45:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959650a0f1sm8630293f8f.20.2026.11.09.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:45:32 -0800 (PST)
Date: Mon, 9 Nov 2026 10:45:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: Consolidate Glymur SiP power
 grid
Message-ID: <2u7n7gy2wzodcndmodrpmemtueax3opgtw5ttn3htwgskpu6fx@fuaqt3ngrhde>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-6-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-6-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX25Uf4G/UTo5i
 SjD+KVsm7PWs1SSRUZiP94OkvifBQbMLa9yHXmLb1Z2FpUC9IadpsUQuTeBNI2yAaH+DRsLS5/9
 dHsUC2Jnt+ID8QQzVhAWNmi5dylXFe8LVZWfAK6Yv1g0RLwD3LMFzd8Mm0tcds3oVXQiu+2btxN
 odlpLqKk7GBjP50/bwpQRqeSD/6W7YKcR1TQIORvsLXMXQwK6iS1NWMxzSjcGbGvEdXbJkoA3EI
 z+BV+lKETLFPoknK1yvVMGl6tXb/qsbmyvkJb+Oeb02C9ali3d8+hlm8ZA/vHwPODErfcicVtvk
 pgiV6qJY/icRUVLasvGLIVEGjCBGj/ePpbJh/LU+qCrpDYIobxCJWg5XFOOFPNMdNinIKYNucb+
 hfFDFTJ48YGvU+KyUfvnPDMxQ9M1TKIrMwBAwwlaZ467ZzbUA5Vb5ymU9qS9orhCrKvHiWoT55m
 oJiHGg1LqemQR9J/NFA==
X-Proofpoint-ORIG-GUID: 2SWptmUXReVZ9HxCMWJpxoQ06eN3Dn-G
X-Proofpoint-GUID: 2SWptmUXReVZ9HxCMWJpxoQ06eN3Dn-G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX8RZRGc7EsbUy
 Iz7Bc8VRKA8RjJ/oqz2wl5M9/qZssNTgD30IVEIbw1ZwzqozRn88HN6cWohJHn/2tRLEWrhKLpr
 /3vUnXmg4KCxL+opdkW8ywpfbLt/9o0=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1882e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VdR85P1Um-UAOipgn90A:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:07, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Much like with CoB, the SiP PMIC configuration is fixed, which makes
> the regulators and the supply mappings of the on-SoC peripherals the
> same across SiP-based boards. Factor them out of the Zenbook A16 into
> glymur-sip.dtsi, so that further SiP boards can reuse them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
