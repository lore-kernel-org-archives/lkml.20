Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100036;
	b=rmixBWnAKiBNWK6UVgV+YEBsc2IRH4jsbsnYZhgs5wvOgceOqb/i+/8bNF/30WWUyYEg
	 m5EX6SqC4BD8K+rdbFBnA5758QKsgqZPqgLCwF43NhCFvn2PZ4qPXX36OqKMt0xI72hNx
	 Bxfk1GY8+T4z4FvK0tMcYBOMF6b/EcWf6HZCBTnc+WNNjT8Q24qgujT2LMYwX+3L8nq1x
	 dlIvTOVSH8+5gpmQWl04WgCk6y9bDR8gJEIdkm+My7z7SukjKgIkcCfvfoNOYjraa9t+5
	 esE4lMqBtebbeBd8PunFwUtd1WobiTGxoLdf+Hu1DU5QRkfmA5WWDWqlZYJDMzvGcLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P4eIsa0QG1et6Bbl6s14T8R5VVdaEq29tvFruu1buwQ=;
	b=OH9dzMS9hKNs1UtR1omN37GYM0Ltzx6dG7XjB9ClTBsXkF7ENVPav5l9LC1HN63vF2eC
	 j0uXb7rCkAxtUwjgemV+4z++C+3VZSu/d9yFpLByeMjy8WrJUVVMoDgKQOooHmoweasZl
	 zsDxLAra2eN17FhMJufXNOEZN9WiN/X5txTL/c2Xvhxv4U78nN7vCQ/fnt7wqCpYi6us5
	 kIiZVY199fsLQzQDMs33viZJRlRH+99argcNBR8jSDdTgMXlFaLrQbGXCnV+MwqJ/tQ6r
	 W2nr0cewXc9ZXDeYKE61c3CmUq3Cf+vEhqmLpD4i4BxAo3fWv/htKmVUSVyztZzPyUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mhwUCln/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ehHdQ4Lo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4C3606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mhwUCln/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ehHdQ4Lo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeJsG1427422
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P4eIsa0QG1et6Bbl6s14T8R5
	VVdaEq29tvFruu1buwQ=; b=mhwUCln/zl2cjPfX5urcJC7rSUoxsoSalzzQSdQl
	MjChOBwLIxUxkhsjTAakp352ND6kZ8IhqGVUCbYb09JNGZ9mtkADHTq83ms2/S7W
	89ZNxJ1eOXP+EgrFZyCjc/hyNQ2/NGNT70/YGDHoDGkBsiTtVap1Bc+XmRiMvDsv
	k54T9TLeWWAj6ff9bg8UplGe20AyPrt+bO4EjRmOq/xCFzwxamDqz0XruR+2fwlj
	sIn/FxJkdYLzaZweu/Y99g5UG9XrohOIERAAgnMPWY2VY1wjGC9Op9D+ZSmIDP/o
	XuSRUBMv6NH3+c2yaueVu8XYgJ7FYjuIXHnXzVr5VO/iTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmba8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:20:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so874336285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100034; x=1793704834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P4eIsa0QG1et6Bbl6s14T8R5VVdaEq29tvFruu1buwQ=;
        b=ehHdQ4LoLjCSwohZcQJMWZAWzOH2cyHOnvQ31heNDRMPxxCHnpC3Tru5bEEYB5s6mQ
         ZB92BaJDLRFv4WhDAWbEodE154Tz88uNy6C9+iA/lZQTD1IJ61WMxhUY/BOHzl9W5HhR
         u1crgqoxWCbBzYemazqLD9WBGCazn6oam4Wd6M6Ps5RdxpytVC7xYcUR/IZnYsdacTVM
         YU6nI93FqnlcRsWb95almKVSD9Bp8rN+hI2h29ovPCThOG4NKW59tM6mNv5JlGIi3rXR
         ZRq6b1GJ8CMzcY+/IFTqYmbuxER/QIFJWlW/SDHvS62mZZPEXmM7Tn/7KgzUDhRrIJ7N
         nGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100034; x=1793704834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4eIsa0QG1et6Bbl6s14T8R5VVdaEq29tvFruu1buwQ=;
        b=alEWHWmM4VLDDQEN6YrzP1gVodMLohs+Bp2IMKIKUCO5/Q0bcamltos2Swc7wClKhG
         bP1wzWjH4VEcNC94LIEiH1kpRrwOXDzj2INOpLLVROadsDgV1ZP7N/YgCXG1E443iBri
         /A+x4MRhJ2zjbXbil2YGafUKq8TLAKMMgvwLl7rzVCcibgX5TziX7LU5Ur1b2DyJBB1q
         2jla+rVyJclD/yriSIRSQN0+vQ96PFYvhNuJ1cjdAeHQcQHKxPDq7YceIMTdXTQlX3Id
         oq2EGYpdc+Z7pRK2jZXWNJajwxo0oogo3WuYXVpAAaFtrwsSvYKson42wbxqSXT1C4uW
         yerA==
X-Forwarded-Encrypted: i=1; AKwUvBxiycIQAlY0tlnS2PlcL1RxODKdIRa/ep2uY2M2ylaUFwC3kmzeiI+17uhoum7RkKeClM7ncd0Drile42s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSiKJNlOF0TDj5SRB6UI841f8oGuu718pvVVQY6rGRTLh+nA02
	wEghEsjplWOyiWJXIUcDlnUPqn/sdU6Y6raxgh92e7I/tDRZK/UacwTf5b7/vUzCS3exaVshCpf
	WxP1N6HG4I/MArKhA7Zm1Btn2XHQaszWdua0WKHMz0NUcLCznmMEOqMDwtuwPLaarcx4=
X-Gm-Gg: AYBFou0TJfTlEW8YFEJ0LKira2UYzaby2McPeHD8/snVoIiRfbWJyJFYMZ59UONkygh
	Xk9IRg/dZQT9rTYT8f0A39LGXAQ3xUZss1DYayFt86K+MGUJEHZEz7HZRz7Uuxk5rv6pEx7vRkh
	OQzDKwDgOVn205UUEjxicR80jFPB7EAasnEk/2hQjbpupAiZ2ChAQDhqgBFOb9sLY7nlf78IO3E
	s/ktxhBVaVaIpdf0VapETNRCL2+tYGk8lEVU6GjIsBnMZt+y04JEqyj+TcbbBPauTqoiCjE85wC
	jXlSRcf+w2ASunC/pNIWY009oaNq+fGm3iZn3hUIILsSjnXk1Zlg22zLn1ldS6IoY8BdbSeFICk
	BeJJd9XlKHEzJ50UQ
X-Received: by 2002:a05:620a:4542:b0:93e:94f2:ada9 with SMTP id af79cd13be357-940ef998f9cmr1348386085a.58.1793100033590;
        Tue, 27 Oct 2026 04:20:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93e:94f2:ada9 with SMTP id af79cd13be357-940ef998f9cmr1348381685a.58.1793100032944;
        Tue, 27 Oct 2026 04:20:32 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm23312072f8f.27.2026.10.27.04.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:20:32 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:20:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        val@packett.cool, wesley.cheng@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in
 DP-only mode
Message-ID: <ec5diah4trv6vcnbnxwcg7b7gyoggjrntojvses5os2rtoygsw@op7uolbonig4>
References: <20261023123512.1912-1-26rote@gmail.com>
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
In-Reply-To: <20261023123512.1912-1-26rote@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX+fn5iRma+dD+
 6lDflh7ncQcRkH+rxFi7WgoFloo0eAHnrTcU9zJDVoadhFYSi4eD3B2eiPm8diT/VGEFCcxFJR+
 FKpbCqzRtygbHlHyln5g/at/v6o+SAk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX5f6dbEZlEpaE
 lX5ZGg/K6Dm67sZFEbX2vFH/gR/BEc8xHWVe4bdN3BLOJWQmbCYzr6le7rDODvSeG+Cg2elVQrL
 Zzc5mwSM/o/Yp6VzHVPmLCS+nSUu1Wai/giOQp9BR4uVrsg8tuEw1vrqqNaQY8Ej82CEJOzq0D6
 KYVEMcd8MwnJJgh1oQ/Bj02MC64OG5nIbBjfBtNyuXsIfiEtngph7PrLQ0eAczch3R0ieg2QMAl
 2qkZpAO/1pq427nmd26CQckqUUl7qmLr0MMgSvOmiXUqDWUssO2r1dMosmiHqHGV+tuDqB7kW63
 8QxLpEveiVdTrNdwNge7qPBM7wDzFQaOTwl43XTSrXzN6MNsvobFtYlQS6GffJwbqOY3JmYa+zP
 ysXlS6hq1sdXcZbp1KnZIAYEJPMcmLoa0fdniNjKwFuIHE5dx967mEUMtwIfmTMdPpbvIgI+0NQ
 Nfo9yKh1a8i+0kW2quw==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae08902 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=G99BCXZ-BbZkqKqEctwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: MsQOgQBTx2JxbVJVPE2adn7MGAy9hyCS
X-Proofpoint-GUID: MsQOgQBTx2JxbVJVPE2adn7MGAy9hyCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 26-10-23 21:35:12, Joonhoe Kim wrote:
> In DP-only mode (DisplayPort pin assignments C and E) all four lanes
> belong to the DisplayPort PHY and the USB PCS stays powered down.
> Three paths still touch the USB PCS in this state:
> 
> - The USB controller can exit and re-init its PHY in DP-only mode, e.g.
>   across a system suspend that loses power. qmp_combo_usb_init() then
>   programs the USB serdes, lane and PCS tables over the DisplayPort
>   configuration and times out waiting for PHYSTATUS, and
>   qmp_combo_usb_exit() resets and powers down a PCS that is not in use.
> - qmp_combo_typec_switch_set() powers the USB PCS off and on when the
>   orientation changes in DP-only mode, e.g. when a DP-only sink is
>   plugged in the other way round while the mux is still in DP-only
>   mode.
> - qmp_combo_reconfigure_phy() powers the USB PCS off again when the
>   port leaves DP-only mode.
> 
> Skip the USB PCS in these paths in DP-only mode. Keep the
> qmp_combo_com_init()/qmp_combo_com_exit() reference and usb_init_count,
> so that qmp_combo_reconfigure_phy() powers the USB PCS up when the port
> leaves DP-only mode.
> 
> On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
> in pin assignment C, resume from s2idle fails with "phy initialization
> timed-out", the dwc3 resume returns -110 and the following xHCI resume
> hangs the system.
> 
> Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE")
> Fixes: 89563a152973 ("phy: qualcomm: qmp-combo: Add preliminary USB4 support")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
