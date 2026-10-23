Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716787;
	b=PJG8rO1Zwbg0jmtZTs1s3g49QMUGc62J7D2OLesMmhvb6wsKNwwkaxq8FMUzVQl6PgMj
	 i4ggYWU1oZhabEgfVJJdySjj+ltcUJNM7t/klU403aXF5WSrScygotmnt3EcqwVtD+RYa
	 Fs+zIGX79tzGj4b3kJd+EC3bGltLP0CJpHjaSXEi1fRq1Jm3KupQlxfgUbMWLq5OpgVuG
	 Vlxi3Bs8MSgHC2Vfn2Vl099VigSpWzUesXsCJjwHVCH3GD8DxmMdVu7P+uw4JFpwVR99m
	 oUDB+yQdcoSV7mdjg4uwqxxbTCvlaDPmp9ZjpcA/YeXr14+uKmfZvGAZpynoKpg8Vug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=;
	b=3gzyTejmqqnBOaaM40po0tiJIDXoMFtrepW63taJeI2fxxJ5BjQjqSOWO7z819EZkQ9Z
	 kSHsDD+/0/nYr2DKH/mC5NebHuQ0H1Mj+lqeogw8SjarqH2WZtmqfkWK5DsypxpRrcAc5
	 /j3fv/m32HkzAMybdMVhk9BBYJWZ14CboP+/0biAGnOvV6ZtJPczBf7iOAbJhybxUNR+o
	 HTGgB+JXYWM0pTmdDYE3xcUKlIZxQr1IAC8HUt0iPCy81L5O22oorVYnjEL9cvdJQrbCs
	 U/L3rT6/pXDNe1+g54qBQFVIAnjICI65AReQJ9dzMCnQexioYkwGUD6PMlRP57zurtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NX415fE3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS9FNQ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33471606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33471606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NX415fE3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS9FNQ6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMFC6U394291
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=; b=NX415fE3rWdzG1Sj
	Albm//L03kjdQGqn7HqFGco3s/S3+DeUF4rvHO9vy7Qg4lMeMR+5NejffyY81nBU
	lCLDwLMfgzRC8bhrIN62DwKsOwza8QFHnolHFmyJNGZiGu80As/YaftJTKWoV/AB
	cWqTwBtOo/9JOHdYqg5Eb1m8XwHvquOdgDZ4MMn/A4272z0CXd3NwBG1YiFiz1K8
	yFMo+/R1MWYegWgbtF3l5bLbOsw4ePMLySS63NaNzrGJX76LB3aJCqNJIKMMuMba
	Sz68QsKCA2yFBeIMKPREeOfMOQFlXbhHDNv627V1un/ZvJ5g/dzOn2nJVvSLvYTX
	8U64ew==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmts6ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:52:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso1326183eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792716776; x=1793321576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=;
        b=VsS9FNQ6IYusgSDTY/aBENcqBxTRdtpE33RYuVujnOzRPPthoEHB70Bnyl729fvBOF
         /JvYmwrFDTbOpu/ePYohOU23gS90avqMkOJyFWHYdFcmgIEDIR0Yeb5UJ+dEaAVOtMYq
         91N+oymuaHM6VrgtQmUoks4JHByIybEb3XL/F6XatE4Ma5hd8uGIN7cU0l2zOvVUdmQv
         uC6BjhaERamzDK9qWd7c3eajdWzs8BvvC+gxPV0y/5buuwHE6DmpwFctamQdxksn0UbL
         50028aQKxG8YfJSojm2ysnlD3563Uq/2wA4aS2oKjy+ZbLoElNwc33QoOUvPLDNxU67K
         itDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716776; x=1793321576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=;
        b=x79aVThIoSa8tMQ1wAzJGOl88AQ85TWqbp3x9q99NxmfhbaMqzLTgyKoohdnIGyZvB
         ATYY1PB6UgyW0CszZRBA0V5hNwjPMqfd4w2b52WdAIfcMgjQlubJDR72IzPUfqrARmud
         LC8MIC5vC9LH7x6y31MdAAxiBdh2pN60TtKSRIUjfbB18LdlNyLbdfMLlV8qjwJ5x2DZ
         EfR4g3vPNeuwz3TEm+KBobKQfexWJqAeYU3KemLtYhxvbuLcscH8b8tHavugCAPiTE2w
         3aqGWTgZpt0C1EFkz2zCwMxewZvEJtJRKIZ9QF3YU1dQAU+M24cno13AofVOoajUjKTd
         z/Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxN6W3P2xLvdQAV/YI1/CN4DU6S1h1kKCub0UFI6HnbDrFhSVxXw+d1FjzyX5Bvb8klJ7DvW3uN086xY3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJwFOQkR5a0KANBB2bYMk1SOs7tdWJKDY1fs018e+wwqZ2rFpo
	yWLwDvlHPgLRSoueCxLU8d1gMrzq3OB+UodfuilJWZ7fdxwM/NoJV8mKXvmJLnBm1UC6C6bAZJU
	dzm9upUQPW8Z9Zj7X4un/yD+o5+GO2lot+mQDNBMAM2aB9iIElcrOK5HqHOe9aSpwv98=
X-Gm-Gg: AYBFou3Yc5c2FKc+0DpbhE4jZ6fwZmJsJNM6XN/bHSs6Qkq1LY2zOqsX/lqW96jZkeW
	O2PrEklt8EbOf7aWv4+XO3vrYyRblgyGxSgYHYD03A0Fvo7J1Hx4rXQ/pYvQgET58DwLZJ+5DIm
	z6vEyMRtxpXjE4QLBpMgcJN2CIeuoVLlgC1TKagjZkkEvZe5Xp6+FNVEZmk2Y2oFOsWDrCyPLbX
	FY7dPoI4jTz4gR0u8367iVYT1xJ1xOjUa/LyceInx+b2vKb/B5Pxr3jJpiEY4ymf616J9VQ8Oid
	tOnGwAofS3GMN1uI/jiYgZ5A8DecItnait/tsmZ/6xvVWRbYYelqP/DgPjqDNfCi7GfpnMyxrT8
	iDVol0uvdZ36y5jcQBpxUDNMXJ7yVXqqFf2QJf+5q8gFAfY/PkJ9pjn993Q==
X-Received: by 2002:a05:701b:4349:b0:193:9aa3:4748 with SMTP id a92af1059eb24-195bc01e742mr1050054c88.1.1792716775553;
        Thu, 22 Oct 2026 17:52:55 -0700 (PDT)
X-Received: by 2002:a05:701b:4349:b0:193:9aa3:4748 with SMTP id a92af1059eb24-195bc01e742mr1050029c88.1.1792716775026;
        Thu, 22 Oct 2026 17:52:55 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb9afd61sm1802501c88.14.2026.10.22.17.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 17:52:54 -0700 (PDT)
Message-ID: <101a2b35-5bcf-48c3-b862-6cd703c67d76@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:52:53 -0700
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
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: George Neacsu <geocausa@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <20261017104853.148839-1-geocausa@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261017104853.148839-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adaafe8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=orMkujGkvO2Z0ebMhLoA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: MuQHd_HdhEa1fhvkzwvJakho-F6d1a7v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwMyBTYWx0ZWRfX1O9e8xM61Hs3
 drCBWiLb7r1i9E1CyK6tfWaTGEl/kphYVmPJ2wRNyTVPxbDeDFmKSSDmToe+ryS8dRtPBWZlJc1
 R/JdGBrlHiosKSHKFuqFstTLDpbE0zF5pZme7tHyv2uUcMbwGJm8NIKHZROnI9+4PlgZd4AnpAn
 8QgK0iJ2IBRYYFE3T040GNcedtK7hLy4TKhTyuyaYJF7awGHtU1VNFWQpMnCu25vC8qFUND4C7Z
 23fQvpmMiEgcxMytTOUVedZmr8wmIlnZehKgSFf5X566xp/mVMwuP84uY0FqaLZg2WX5cNAMARr
 wvLiOdIAUn8DZ1lZLdkPwjuFMVj7x5j23f6IgNUD+QNUdtHmVP6XCahXLUoedX57JHSVfF87BJy
 x6KwTlMQ0+CzFEgvnhdql6BkARU3mKRfQxzveTz1fjbHWiVgDWEF/WbA9D+3/gSViZJVNFmduyp
 uB+Ar8i8z6j7pFVy9zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwMyBTYWx0ZWRfX7gCmL2oc+BI2
 TEAmYgIBCJqUF9BBeo7QzFYE5rcHjhtZ0Jjq5viKMzmRMUBscUHuS00TT+rnwkh/SwW0IXaDChw
 ccENTLYMzH04cXu6HKPizdEjGj+fwsM=
X-Proofpoint-ORIG-GUID: MuQHd_HdhEa1fhvkzwvJakho-F6d1a7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230003

Hi George,

Thank you for bringing this up. This will be rectified in the next series.
Overlooked this.

Regards,
Anusha

On 10/17/2026 3:48 AM, George Neacsu wrote:
> Hi Anusha,
> 
> One units issue showed up while testing this on X1E80100.
> 
> camss_get_link_freq(..., cphy=true) returns the V4L2 C-PHY link
> frequency. The media documentation defines link frequency as the bus
> frequency, explicitly not the symbol rate; its C-PHY pixel-rate formula
> also has the factor of two that makes the C-PHY symbol rate twice the
> V4L2 link frequency.
> 
> For the SP11 IMX681, the exact Windows/QTI sensor mode programs PLL2
> for a 2.400 Gsym/s C-PHY rate (19.2 MHz * 375 / 3). The same 68-write
> mode programming was also observed live under KD on this machine.
> camss_get_link_freq() returns the corresponding 1.200 GHz V4L2 link
> frequency.
> 
> phy_mipi_cphy_get_default_config_for_hsclk() takes the high-speed symbol
> rate, so passing link_freq directly here fills hs_clk_rate with
> 1.2 Gsym/s rather than 2.4 Gsym/s. I think this wants:
> 
>     phy_mipi_cphy_get_default_config_for_hsclk((u64)link_freq * 2,
>                                                 num_lanes, cphy_cfg);
> 
> I instrumented that path on X1E and get link=1200000000 Hz and
> symbol=2400000000 sym/s. Capture succeeds with those values.
> 
> The qcom provider then needs to keep those units distinct too; I have a
> separate comment on that patch.
> 
> Thanks,
> George

