Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D47949482F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992256; cv=none; b=ItmiqM0PXCJ9KJ5II77Tl0lUZ2FjNUsUYViD6btjqNrRea4z61hxc5Yu39NApcA/AQFBpU9UpGnH1LWMiN5l1CDQt9LYktdQOtzjyuuTU9OPryc52uopCYGf9aXYXhylE80lBn5IhyQlqvsUrIvcb2M7uVy05+L0cXDvDUEjeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992256; c=relaxed/simple;
	bh=XRcFq7IuXH9kC8tr1NldVZmFxCs4PttO+0bLD5IWDAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6T/GQZOAFnCdwuQLX560gwIMronIh3TN5VYNQwwCDoMizmE4xlKWvpuzQ7G8Um+398ltYIjtgDTYf4xZkmmAdHIdUfw4MKHtp/KERyidb1891fR7hK8meOLe88kqrIcMAWD/Sh32x9quDXPns+ki9zy2heGiuSENbjLIWVQ3ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6isgjoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C03+e1qc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6isgjoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C03+e1qc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdxeI934211
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=enveY9jv1nThYF2kaQKkUFzj
	DWdSqrtaseNwSFGaCr4=; b=U6isgjoZweeTIfcGZSSS8o3qu5QGVnoDKVHcKiWU
	u8kwH7nSD18DNNuBZqbCiGyq6/lTRhZa4Wu+O3Fo7ECF3BWs4PvTBBTmzSAIOGVN
	bTZ6AFddbVXCejQnGWxk7RkPrOJ+fL4Nd8Iaaqi7yKylPY7m7fJpOzyouMfzQwi7
	7ujrCc1SgVZ+pmZa01znPs3/bM+nko9Wrwi0YBMSxAqw15RpSu2kV4GbJr8IChQX
	t4GcNBE8oaxeF4RqGXkFPt2YF/9ydAnLQzA7QN1McnpSBw8yUo7M0nNSm+CeeQ0p
	Gq0CL5pyEFJTdBobBRSZvzpb18Zy29W0+zbTC4rvEJL0Ew==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bagfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:04:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78830f4bebaso768736137.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992251; x=1790597051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=enveY9jv1nThYF2kaQKkUFzjDWdSqrtaseNwSFGaCr4=;
        b=C03+e1qcPnnSqqxLOANSQaQhtikgxGMka6/FfHPvbCpWzObc1nWOBmWU0d3LkbpTSk
         8p0d4ceparkYAT7PX3hbNnTA0npLddQNBwTf+xtvs7CSjAIUV0Lq9V5g61lWHgz/FThr
         /NwdBCd9Cd/PODWypGLDrtZ/zDeo34LLd+7GpYsTUzEqVagcAqRU8R+DswYUog7kwhJU
         LY3XOBzEWPFNvo1822Hnkg/PRFKffBqykURn71YSemceNaX03OqsiPajmCZBnNoZHxVF
         J2+VEHipXKNHryU2CaZ8/Nclt1kDiwfZMba+cJCLUKYBENcWlqc1vB58naB7hN1ceuSW
         ftFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992251; x=1790597051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enveY9jv1nThYF2kaQKkUFzjDWdSqrtaseNwSFGaCr4=;
        b=b9rkpvetqsNPi4mDISMUqZomzn9gVIYfNRlPLggoEMi2g7FGOEPLOu7CG9pkuOVg5L
         Pzs1OV6cSet6/8PQJaWTj+Eyosu4jHma6ae0E1kGO8kqUgDwKjRgJupBd17ebTth6hZH
         JpPyzZ1rCh+wRyGGkDErX92ZgbQws8B/HStoTzwkVCr3m0J7IBxcKB3WFEczhCqAH3Fa
         9iq7BuRBhi896XHBepfotlqDcPCpENmpi79Gm3A/Bdx2xTom0SWHmh/y+1GJFVy6q6L+
         dd3etjRwdOQQkx8qNeyxukbU++dFe4A6mlWV5Ipbz8YkrhI8tD2Ir41bx6oFOanK0qio
         LR0w==
X-Forwarded-Encrypted: i=1; AKwUvBwcAsdSaphwYupCOQUnLVvMxVpcW/kkQ28C0OEMaO9HTRpdkz6x7dQPIk+0hNAA3zS0PXIoE18sDqJepiY=@vger.kernel.org
X-Gm-Message-State: AFuF++nJP0og+Lad/D0g6/AUTCmbLMhLCBRXseXVtCpzuDxHCXFmKmeq
	je/op+bh5Lxq6dFt8OblTkC3WEewDFTMUv3bgc5BMf1rW66TtjIPkClCZmasqUmJPZbM9mv+Jkv
	aglrXxTKfozehkdwhZYdXq3ixdaFVwrOm/fh21A/q1SXTG2URDPcZ+P+1JocQ2UGoX+U=
X-Gm-Gg: AYBFou02nykt2G/R0Wo+RiWkVWszvLVkiWVJA/4ESJqPreQy8Ing4MBxgvVNwATRpsL
	BNCoI8B4CD0TbswLRR/iRn4ACZU1UBM/3kea77HJ06XC2Yw9w9s+mkG39pa9mta0ljyHMTOAc34
	qDoYZO11A1qw+1ppeCoSlaOln2IYSDTx2RHbkBZ8PdzQ4gbL8b5Sd8WiE+rFx3r5kjsITpkhPEk
	gkXSviad4/k54lSTzseQVdjH6YSwSjHD0e0G+ueZN7PZfHgD5ftCGrxs6iYGQfbJu4HEnNLTkoj
	S2Ye8BRwCwtERwt8mJI0btmeiY/UH4EF9agCHmWENGdeV7gA8LsHWmaMlJquBgge3lBRJp0rNxU
	MgNeQ7qyNOwdkqyM=
X-Received: by 2002:a05:6102:4244:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7a719aaf7abmr1670574137.29.1789992251025;
        Mon, 21 Sep 2026 05:04:11 -0700 (PDT)
X-Received: by 2002:a05:6102:4244:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7a719aaf7abmr1670527137.29.1789992250513;
        Mon, 21 Sep 2026 05:04:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eab91sm245354285e9.1.2026.09.21.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:04:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:04:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 06/11] arm64: dts: qcom: ipq5424: Wire up USB3 PHY PIPE
 clock to GCC
Message-ID: <gafrnwlti6ojl3nrifhejf76voamomuthwuikfmbkcot26fe6o@5uzaftq2y5mo>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX+YLvza8K+O6G
 jjWjD2dtL7OHY4imltV1VA8aAJEiB07r2p7G2k2CaMmcNo4XheVI3vMSWye3giOOmnR0mMJCF/2
 Q02ZRS42nQ8cisZT5vwk2aBCKhIGDTyS5GBjTZemh0owNFLbjeOYDJ9Ejjkv+l+eIyes72WP4CC
 HquIv3ux+GIb31bck5tR/nXuoGcDfH6K1swej+Fv/etVXjnbOh13vh2zNVFdncfKXulRqAkjp1k
 h0WCkBKP00gPu3iIHgk9renFnk2VeqrrlBK8X/1hcMNCzyJ5NsbXJy/ojH5jnEOMqu0FsWe65lY
 GuHofbVhIHmc33NH4mzqv3DwhkwkSVriAkybAXHzFHGL4SBIosHaMpfprlqk8bJ2Jau/ABeLUGe
 du1E0w74bxNV27a8PGM7FQ9dWJyrYFwZc/TPz7aNhvFIEnkwI+aF+zVlcbPjGBTbuf7KlQQ8HrR
 tCHTxTCwJucBRNDj7JA==
X-Proofpoint-GUID: uPLUrhCoyRWvDeI0U8cQ-sHEBqxHkq84
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab11d3b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KhyLHX4QOuxJUOlieskA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: uPLUrhCoyRWvDeI0U8cQ-sHEBqxHkq84
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX/6GXBi9m2pgx
 FgVycRAnO362AM7cwXF2FJ3NjC1VWHOFteOQ2O5vrM+anxPeWYoPF7G6oeLTxNjNa1GTt9jxMID
 3tbPnCi04o97oje7O+GQWH7O2kfK8AQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210175

On 26-09-21 11:49:39, Kathiravan Thirumoorthy wrote:
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock
> can propagate to the USB controller.
> 
> Cc: stable@vger.kernel.org
> Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
