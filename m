Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625398;
	b=TTgBTpAxlY8bFFsqYqnmYxKqYp99Bw+lJpGe3Ow5+gcI4CNbG+SiMPVqWu7oYZdfKQ9U
	 hjAzYEHhC4SnKpSu69KmAGzwX8k+vY5b/jhX72MGHs0T02Kz2iQcGWrYpV5jI2+vPvLrU
	 abJvsM1OOYruqvWOSaC8zl5ojZINsrATk5rV3u60meb+zRfb8ACOadnkG66JyV4cVX+HQ
	 m4D/jaOXG96O07obBU40lXV7LAqQi7E1HvBrRX7V801f2oR+svcvo+/OOL1wvhg/P5d4f
	 7o0eqPYufHNEH9aw6YO2p5xQIte3gs8TurJVJwRHhIliBQv69hK5AYKW9azTuYLRtcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZPOKcmL7lQy+qX98/Hb5eqt195myTo3bkucqsGDDuBU=;
	b=F9UgCSzzv47nRGJLmgi5RMJmN81jh9Nvrkk0+a+8UaIP2hW745p/kdiZ1jJuW/SbdFps
	 kISf1cqXfiBk2BPDM5wOPm7JKl5eKueSLHhhZSJER6qPQGNzlYPKIQw7kCAYRmfMgY/mx
	 ZU+cS2a23oLKVgRz7kLQ/tfosLxSd2HNDMXSueh31TIZ/bk5XhRy3Wr27zEy1BaI1naRi
	 D4kKe3tBan7+d+FWZBWjxnVcSbrnKpdp3FBE8fX0nbTSVfbY8ABq+lKAib28Gshz7GQ3L
	 yfhmT0JUJxiBLnwrSqD1/Yg4uSzzqQ392vsxHmzcNZMV+svNucuo9+0z73PMQ2UsJWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMVlKM+t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUHL740x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A4C606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A4C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMVlKM+t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUHL740x
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAPan3944320
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZPOKcmL7lQy+qX98/Hb5eqt1
	95myTo3bkucqsGDDuBU=; b=oMVlKM+txmsHATfXRPiim56eCDEfI+ZgkOtJuaJ2
	iTsntX7oFB6cSpMYi7MtzOCmCAeZLp2Hk2eBMsHZ3G/JnBH4KS3yYUJbhmZnrwfl
	d3QOJJEVWQxYAg8Vp5b5Uy5Z+ZXOxPJifX53lj7l8s/JCntTvwaLifhzlXj/4apW
	l4Vn/BGBjO53mqh+ajkMYw6hGjWlfMAv1C7Pq0jqMhXrGspckrunNpWX/HAdfQVt
	An8GBY6IMkPq4vQi8bW4uufTT9Vukq+OijJLvF5/XZ2LfgMMqWqdW1Z1OAkfxqf5
	Umkt/9lAOMz+9/jqba3vznXXVti8oS17m2z8hOq6M7lZZw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe98c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:16:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc175cb172so2638966137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625396; x=1794230196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPOKcmL7lQy+qX98/Hb5eqt195myTo3bkucqsGDDuBU=;
        b=VUHL740xVKyaiN991FpboDe4EtCVSpoWkTrmPYbIgKR6r2lViU2mOyy5QR6kuga5sO
         fFB8Zt0sPpOfU+jzLn/Imgheu6SoVfQckWgaraM6BJMTppiO9WA6ScZfqQ4oH77Z9DKe
         ttxTv7UmmHQf6sx3XlJ+eiR9h6FxGa3NAMu8N9Sp26fl1Lbx20Ztfw9CPgIxG3oKkSrT
         M4P1IiADRcKlSy5ijBWaBTXNMXEr1mYy7t0JI08RJfuok7FrSUxTT8SbUfz6Ijt/wi9/
         uWHsb05m8B+9iX7ROJSB2YFRAk9yrh9pGOkgFz2n7/vXrks2jSXB+varrbJy4+ALawIC
         RawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625396; x=1794230196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPOKcmL7lQy+qX98/Hb5eqt195myTo3bkucqsGDDuBU=;
        b=eagadNa8gh8J7ev+XxLmuBaXiOgraf00n67WpsmQLvhfbRY1KZX34NviYjMCAferCh
         /hVRK6KnwFGfP2k/YpE8R58Rvd3W/L7++Jjrt4cU/MeiP21NxIzxF8EXbl0jwwhSjZhT
         7H7NP6CNYVUbJz91VaPxBM7YbNenb91SijXL8DpY3GiIzfUjAstsEQKRrfi0CAbkCTRj
         c8USHq9Hl4Shb/OQKamrKQwq2ab/FM9AZL7D5U+kTMSbfsh3UUrn7QYMjr+PbpwotMn5
         ZQNgJIRWqhZGCRXCXruGRjqWyEEdVoJOF7WrHGMU0yNxB7DorXWVqvm6FCfMSYgBBeVX
         BF/w==
X-Forwarded-Encrypted: i=1; AKwUvBw8UjvLeB11d5mMx4f7vLmKNHss2Ee5xreqJHAhJ3aS7/HDtHefjIqne+9tkztXdvK7tf4M4ZQQa1WMr1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8npXTaoc1JUe2htHXFORJYVy/PT4y5yiG29FcGOrBnJxog9tj0
	Jryx847Visx1KjiEfFScKaWyelrTA+gpkaS7SaqIvBhwI0vZUzgZ5PqkSB0HpNIJLdzBK39XHrR
	3BRs7/bd4tjTmFyk1l/jNpbzlT9CIIQtrh+zML26fadgsNrrbU7o6LM+oCJSRPoNb/Ps=
X-Gm-Gg: AYBFou2kaboQSsKRTAKyh0FbunDQxfU09MbmQZz0zBtYPvH+MgeaRHl59xlgYWauhF2
	CpZ1aBuEanf8+gomswEiQiadvJtYthJ9uymMuEo3+mXWeoKW9F/dcMpoopnq3zjx+g8Bz+HlyAs
	KPQC2t6S7B0accR7fdyxESakDGtiD+Cdwp5IG0wm+wHfzyNcFtCGjCkb3quY/wrzBu0otR+spLC
	jOb8WHIApC92/mK7JBKCEywQBNNr2YggFEOB/wcIG1XLxUsag9A+am63JcuFSmKuH/t7Lkq3zLg
	tkU4Qdpyf0u9qm5DuCV5jlL93svPeXMqLKtDLGb6wf/9XZ/bDOw2dKXw+2OOk/kVws4uLjaFNyu
	MUtBtcZjgmce0h7Z/Gu1nj8Eoov/mBhEz0wSvsynzPb1FG02cBVVXgrA2mq6gTc4=
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id ada2fe7eead31-7d072270da8mr3880627137.4.1793625396159;
        Mon, 02 Nov 2026 05:16:36 -0800 (PST)
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id ada2fe7eead31-7d072270da8mr3880604137.4.1793625395532;
        Mon, 02 Nov 2026 05:16:35 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm388764885e9.11.2026.11.02.05.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:16:34 -0800 (PST)
Date: Mon, 2 Nov 2026 15:16:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 7/7] arm64: dts: qcom: nord-rrd: Add WCN7850
 Bluetooth support
Message-ID: <mlbqkhcqfiyajecqwh5evllyq5bc3d7fgyf7lhcdkeq376lz5r@ekmvrkztgkvt>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
 <20261031142433.1212809-8-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261031142433.1212809-8-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae88d35 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MF1Hv_S4EHO9a51YHiAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX5vRsDauzs9fe
 FO0IntTKoh1YfNl035GPmKmYu51V6tVFwAi2CrxCcjvXNx875AmVyknVZuX6vIQjVGF7pOcT73u
 cTPPMGf9u8Jw/jNPGKmaAToNn9GyUAew+kBwELcL1HNRfkpIIi0m8ZHLqz94jQAjoEMPMcAq+s1
 Ru9qlgNCAAPGvz3aG7I/b/sQWmonP5cu8IKgo1OoCP6h7c+HycDaAvpASPgFuiWwXec+r2n+uVe
 e4k1R/Q1WopDOu/EGCM+aLjh3BQeYwzh/Ygb0lqWVH68dOxBRSDJ1+E+c3czX1vdtDfyOXUMo2O
 v5z5EikS/t1dfZ4rXy2dqZU7eRe2GBfpWMBEU8WOFkFsxF+1xz5UoJPVy9m+INLMdOMzrI6hzTS
 /8wZgzZOiu/yRBlsI5dX6aVmEcMqxn5XZdeKPR44jRNXJLVmZuVBmaFegztj3gZ5baa7EanRYpA
 1OSK4Kr+qOSennvG/GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX7S/2EiturWXt
 /lEBd3uaftLbfsCfaFE9+V+31k86N50+DJlIOsbxjmz5il9ot7cbZWVTSqb0EPuABg8UNmY5Tev
 6xoImFM2SLOoL6TGCWTb245rvTitpIk=
X-Proofpoint-ORIG-GUID: 55fan57AbMR88BYo-mOcfG6m2GfZhhVf
X-Proofpoint-GUID: 55fan57AbMR88BYo-mOcfG6m2GfZhhVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 26-10-31 22:24:33, Shawn Guo wrote:
> From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> 
> Enable Bluetooth for the WCN7850 module on the Nord RRD: route the
> BT UART (uart17) as serial1, add the bt-enable GPIO (pmau0102_e GPIO9)
> to the WCN7850 PMU and describe the bluetooth node with its supplies.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
