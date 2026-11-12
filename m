Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477545;
	b=Jvzb20aBcecRS+VO0RPzGi8ZKbki9KoCISDmCQJivFhxQAhcdF8L1mqHLXUQTh5a0C2f
	 9AefQFxOHHqLhloV4+eJjVfa1H6gVIf4BFg42h7xp9A8xn+kTUjCsjWTI6cWuohKsGxqR
	 kUiz1wx9zbbbwVLJix05jwtolrlLbKoygKipe6jDb+jSHalSztk/LmZEd/OWOSMyeA5MG
	 6vDI0K13423D5rLLzUpRiC1Xvd6cDPHXdk9ni+VqCbubKf85P5+6qfO6/BzKtE1I74J7s
	 gjis4KwsAji7CzYGxQRQRT4mVwHZ31INAH8UCu2MD4hvBspEv6hSfTMQC6rrbNAL43A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r0hPGyuQen3K9sOCoAqm9qBxwEBCNWNkbCx/2fholUI=;
	b=u/a6GNpV28NQcBZ7vzMZXjtg05Wm0vRedbHLrURFwCXgVPDYJZ/WaAUZJ/3rXrsqUR92
	 xLJ4uKQqplgonIgek3ZSsHvvm0Tf/LVcdIYFgx3yK6BOOx7SNQ2Ni7o+klI4BGe5DCPZK
	 0zTcn5XiAQiqyv+QPHd2qTlDpDdgc7cR3QBm4/5bH94c5N7pnOoCaPabEL9vavx1JuD3C
	 mbtYHwCMTh/Kgrr7b8gfckguFYNOC5P4GbfTmGl0Opakqqmxe/ndmknIyNFj+10KHbx0w
	 HNAXK5qmbi6uLGHAjYb99McLmqoLy5H1A4oJwyTJhTW3xdDaZhui33oz+lnFHrz57rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I95SfLA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHhdD1dM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5569606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5569606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I95SfLA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHhdD1dM
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9OCQd903604
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r0hPGyuQen3K9sOCoAqm9qBx
	wEBCNWNkbCx/2fholUI=; b=I95SfLA+ouoj4f4NQTIBZSOkdF+huRxmBi27OgZi
	jeJjoibRCCnU3LqEVGnY4JPLquWWoJ6liFWwOJfFeV/qrKWaiJfpPZuCwRPDx+iQ
	xL2Ly2tkMgdyueBatLgXbslHLNyfpTkBTeRKA/fcE+9Sa+v+V9w6WLdm9AOSOcPN
	2PYT3gMEWTiNQe6Fo3PcV8cCSjd8yPdgemglgJyhCe6/xCseOTsVRxbxanQxQkd0
	vhqrUP0Ij+xC93OMxOrH4aWI5VKQK7ME2SF5ImkHmtRapTmy4gXQffoJFGMDJsri
	zflxaMvqJ+4WLhIdE47C5tonJXWO961wSUB8WNLAB7IGbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uc2ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:59:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-945c60b470dso617804885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794477543; x=1795082343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0hPGyuQen3K9sOCoAqm9qBxwEBCNWNkbCx/2fholUI=;
        b=WHhdD1dMuk/pmrCBKGBjfJxh7dfqH0jHWDoBCWvd0cNXD74lwY6W8gDSiBVFGwbn+G
         U7+F1k3HN82vx6uqgG2wn9niuR6Q4Wj9Qye1+RujOg9j3x8FQHyl8lSIsRabPATxGYeO
         dXcdtKLc7bCuVeSKb/IKJuDnd2fT6GMY8xWqPjEGSPoUHDSZ4fmlvLvs+qP1aHuQ5HRD
         cKyU01qilJFpIv2CFmkRC4Vq9vjMEl+VLb/X6UeKwZHRuhquCtgBBc/Wf0k8ddCUb3J5
         GVj0zZ4d3CFfLsluG0Z4ccXa5tQw/dgbDuV1B707BBByBTBKdabpF8/NdGFB08kbbCwA
         3hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794477543; x=1795082343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0hPGyuQen3K9sOCoAqm9qBxwEBCNWNkbCx/2fholUI=;
        b=VWesMbTW7+SLY33xwoNOOTe1U4sM8uaBVohKGUXhEsJQ+aF4UgfzCbH2BAYl0oiAs/
         xfhdTxHevuaooSXnD0FOg4K7uRd/WddZ1Hd9NBz8dy1zAgNzgTsvmV3SE55dR6gLaP3H
         Lfv9M6zyQJyZxWD/+TpRmKPeJCaXp9gadE4cD2az+3wNig5XxqHC/Sp6PXcLPOCH34h9
         9aAtjB77hB7ejudHQ6JoyuOtYxBokwd+Ofs4rU1FQQ8W8qjNOsf0HEhWxT1uWJ1yi4Zf
         eo2HWmaCmBXIh+jh3p/n6V+ZrJic1lJjAVhJGxv0Tkq3Ns7hwBHlBO1essh/4LprOaLM
         JjDg==
X-Forwarded-Encrypted: i=1; AL+hErGYNOUtDkGcQDRjhhuLek5IpMajrhYV4Etbb0JdqOF44KsGcyQYBxc58omMw6MxgzK3af8XSIiSFmCNEC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uF1EZUSa/v1y1mxyNb/nF3g3KyDNWYV1gEbxjXgY6m5EKeOdD
	IOTNCPHiTbKSbiBiPk7iVh1b6WT/qEfZkJ/Ld87CWxfZ6B8uWM+yNDwKp1Jzg12VStHqEeUFM75
	MXwHrR6rhcMAZX4wNGAFhDY0S3J5e/Nc6D3Y4EWyGZ8CiAvjSjs+hmTt5Tic5bVeD8rs=
X-Gm-Gg: AYBFou0YX4hymKbu4k+zjpUNhe9KgUiIU8BZgSh75n58pF7RXLHTeIXgo2aDyXun8Hh
	ZDBysQYveqJEt4Eqe6AEjqJsz+bsho6vKkZBQnJgZGgG49BB+o0cx4wFiVim/f7/9tQiA3+8Xfv
	FRhnD5bCc9MezPOa6/MZ4vVfJiHfrMFo06ixqc/1X5mMu5opBcvsTaW59B2Yx0KMcUYCBVn5UDs
	bV9ZGFtytPigeZtS+jX6+NvRm/jdjgVduAtR/35sGCxDSHekvyckTCXi3/YpOfrgQlyCBHfL3yX
	EUrFN4daStK1ZJtk+43G6+245Tx6/xRQAZ4xtVe4r2sS8ePrTtldahYxdWFzuEZrw7uc3LdiMz2
	+vT1Rh76oqYDneB4wgOMnuuKUWFFV6mMwAwRB4Nky+F4LPo6E/5IuXm6cbaAxIGjf
X-Received: by 2002:a05:620a:450f:b0:93f:22f4:f0cb with SMTP id af79cd13be357-947b0013ec5mr912339785a.43.1794477542664;
        Thu, 12 Nov 2026 01:59:02 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:93f:22f4:f0cb with SMTP id af79cd13be357-947b0013ec5mr912337785a.43.1794477542098;
        Thu, 12 Nov 2026 01:59:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbfc6sm16883720f8f.41.2026.11.12.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:59:01 -0800 (PST)
Date: Thu, 12 Nov 2026 11:58:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux for
 DP alt mode
Message-ID: <u4un5w6cckt5wnc6exjauzulz6x7ujwjihtpo7g3mmalobs5s4@c4rqrnce5agz>
References: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
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
In-Reply-To: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX+qr4rgn+0+pl
 F6olT1Vw7xp5jkZl4A+vTg5/cACHlIba861uc8HxOLQMOdyhcr8h4X2hMd6JTRPQn4dkHIzo3WN
 WbBTaJq+z4xXekvdxYlzoS+br86kUDQ=
X-Proofpoint-GUID: IMkhiMMIKp2l2HaqPmLKY-S-ebbaJ1v7
X-Proofpoint-ORIG-GUID: IMkhiMMIKp2l2HaqPmLKY-S-ebbaJ1v7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfXxT+/L/nIbPmW
 ah8PJGcYArGc98w2JYR6w6Wyo3bNvHkJMULdptTTabRGDAhwwAFA39X9gMhKl33CaNNi36Ed+lN
 kUfvO1+B+9PZVPnUX3kO39q/gETNcMRV3TyUq9BwNwdZiCEdSzvXqpjgp7A3QV6PBEBAMLBrufx
 fCIZPfNDeBW9cXIx4hCzJA08LzIDBGYd9LYSy4do0Oq9vwO7ADzuUd6i20HRU4E+IY1Yv1qVkyM
 G4hvh4Mhl1YUeJCbPvM3kdl9yQ/ZRmb9AQm4AyCOFXBf8PYV8gBLCk8B2P543z9WRR6wm9xDImA
 QlHth7vkS3QCsZrkgc7cabzpYUPfK7CRKOkVM9cjKY8MDtAqaJyouCkW9BZ++eq3odYvSbyM0l9
 rjfhcJ+0nNRVzzMJmmv3AkMOSzqXvsnqAjLmRHtbbR06EUls3rmpqvei6m88C6C/aJygtKijMbc
 FMx1D0lTkEBXSNINCiw==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af58de7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fvgkK2lf_SR_Mrl50ZIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120039

On 26-11-12 11:03:43, Balaji Kalkonda wrote:
> The WCD9390 USB-SS mux routes the AUX/SBU lines between the USB-C
> connector and the DP PHY, but eliza-mtp lacks the devicetree node for
> it. Without a physical path for AUX, every DPCD probe times out and
> the display never comes up:
> 
>   msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
>   msm_dpu ae01000.display-controller: [drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, status=2
>   [drm:msm_dp_bridge_detect [msm]] failed to read caps
>   [drm:msm_dp_bridge_detect [msm]] aux not connected
> 
> Add the wcd_usbss typec-mux node on i2c3, along with its supply and
> reset line, and wire its SBU endpoint to a new port on the pmic-glink
> connector. This gives the AUX/SBU signals a physical path from the
> USB-C connector through the mux to the DP PHY.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 36 ++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> index ee05192adcfb..d848ae77ab85 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -96,6 +96,14 @@ pmic_glink_ss_in: endpoint {
>  						remote-endpoint = <&usb_dp_qmpphy_out>;
>  					};
>  				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint = <&wcd_usbss_sbu_mux>;
> +					};
> +				};
>  			};
>  		};
>  	};
> @@ -112,6 +120,34 @@ vph_pwr: regulator-vph-pwr {
>  	};
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +
> +	wcd_usbss: typec-mux@e {
> +		compatible = "qcom,wcd9390-usbss";
> +		reg = <0xe>;
> +
> +		vdd-supply = <&vreg_l7b>;
> +		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				wcd_usbss_sbu_mux: endpoint {
> +					remote-endpoint = <&pmic_glink_sbu>;
> +				};
> +			};
> +		};
> +	};
> +};
> +

Keep alphabetically sorted.

>  &apps_rsc {
>  	regulators-0 {
>  		compatible = "qcom,pm7550-rpmh-regulators";
> 

With above fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
