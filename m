Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792983109;
	b=mF4NovCRxoyWFH6qC2mR2L46BZM2Psc0rMVaaF2u/zg1hCpiw25NJcU4Ix8BAvNymKzX
	 wL02EzKfjq7BMzPU9CdKGzJYnAcuhgbmdnqt6kmWstXCXp0u2HRo4gt+lWxdHimwg9S8q
	 OzaR0hinWS8u0KyLcFyTIVwOq7og98eBAsRzEmKA8UlNfldbmgYYs3F3XmSOez/F6vYiV
	 fhS24toDRdWZxTK0DwFh6C1Ri/8PBJhY7LgTl76fm+NuUV9aol3mgvk/HdQK/FWewkwmV
	 sd9JGXu4h3XgdXtA3XWFTUSgXAvCAIXdT0kVtdRcRZewIufmPGRbQNX7oHV2hAyVOsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IEkv/QW2n3UCakr8PhLDY+azEONjvwOgumA41eOj6t4=;
	b=NUAyCJ4qO5ur6J7Xbx3qun8JVXKUcrCn7wyk0DSX06UwQ603Njk+EUgaG+eTtdPUKxrJ
	 PyluZ+ImAdWG5f39J/3ts20owzdOyJKflVNO7xtXx+tCpMPtnodjbL5rPaDtyDBxUfH1d
	 5Ux5v1/Bwo58Avibnbwkr3QgGUp67ePZupYA9zv1Xio2HJZ7op8i7yts5047flIuG9pQA
	 dNf6fLKj1AybbjC55kXuNrgUArw+w89b/B9vTOZo5RHLFGjkFA2TDCFC71yAdATJo/kl1
	 r3Oh8wbgwqZjHJKEy0Aaqo5QO+Uae0WkRREfIHv2QTI0CdCqOlQyvU/NYnptVFT+CKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmeYuR8y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CF1Bh6hc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB1606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71BB1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmeYuR8y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CF1Bh6hc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q2KjnT1936636
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IEkv/QW2n3UCakr8PhLDY+az
	EONjvwOgumA41eOj6t4=; b=FmeYuR8ykUjaHHqWfE4YEIzloPqx/S04aCNCs7l9
	5k3Ozn894zbngFZATQeonfgl3dupQD3kLZfZrUGHrh2z42EWrokJ2Vu7k9P9jPx9
	Ib6CzBeJeSUerDQPH0+6g8COTgc/RRu4EFTpcpHa9lzlfziFIOMqgA0lG0zmioBu
	nJ9oiEg7RpIg7F1PtTLLEwrYLHAfgHV75+K/vsowKW/RJl1Z+lm4cvcc5LU2K/YT
	CNwH36yJXijEmMIlQQqCvWEcNR8C8I6hYl8lbDcjmRdpvJntuWWgCmCEZl9kp0RT
	s/1EM1uYAzAaHDgveHNG7oqticVZed1ssWdGna2ZpQfZzw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd89fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:51:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso4965046eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792983106; x=1793587906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IEkv/QW2n3UCakr8PhLDY+azEONjvwOgumA41eOj6t4=;
        b=CF1Bh6hcT4RHZGf7a0ynatK3sXT94RoS9qGapTidRFUQKp7wewqjtBIFLbTOLaeg+H
         lyjJD1/LWCvj5B6Mrtmcer8nuOyIaLcerSnopVmc3BML2aTzJDRBYriaMl4h6ROQyT61
         SU2Lv7OL+8mSNcJfUDt1yTDDmDahxtrOgJCVdnvjH5G69z+3/kNTJMKc+E6v4dvJMLFf
         M+rI1JHdwqQKlSdo1EqRMXbzRLnkEcW2znH4b72bL5H7xRRVJgZ88tv5ztZL2+sy92EE
         27eWaIYZDeyj3YuKc6NR8xlVvfw3jT9Mw5LkASZV9jCuXVFb9feNGBdzdqyLzr1ZgWA8
         tiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792983106; x=1793587906;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEkv/QW2n3UCakr8PhLDY+azEONjvwOgumA41eOj6t4=;
        b=Vbdcun/tGCd+dxJ2D0JOcGPj5v9fv4jTtZPYN9bII7MCO2WWvVel9jXC421PMcSspe
         e0xO2HKwYCQItYEKIEbwDwjA500xuhnFnTEYquHSKEoQZmkOF85dfEj0mchGR1m0WCIr
         x1BnF4VNbZtN7jgAgwtZ5jIQwlHF5fWgNBotMaoBhYfVVnrNuI1Ujk2DqLtWQK3SZAFm
         PCvUkQze65cy/iJispBtZ5Q2u4YNi8wj6ZuLMOA6WteXcee3bhnIIhyqFVglgPqFBpGB
         XDElJ6I/gva6vm9xlNKFGqIjaw8hjC2LyplVdeAyxAGgUeX64nUs6Rtc2wYhPScP0+zl
         /Wmw==
X-Forwarded-Encrypted: i=1; AKwUvBzmriWtloPDZn6cfDNz/WMg1i8cqdUTMcpp8XvBr3vNwxIGX3puVehEg5z1ZoMJNd3Nynjx2mAjQKI8Wx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW+oUvv/bZ3RUqv2NhNNfiXoIyWvFgvClJB3IjwpShuliarWp2
	1oKtPk+t6be1NMcXyju8CgcAfMR/8eUr8aNmIrG2xloD6FHFjN1dYG+dDC7xUWRq68ojvRsxduQ
	csU2UDuVYVEjtwUAxcpVfPQrQ8f6RkkVlLUJfgIbZf2Iq2giBZzUnDpeZEQrm3jqjrWk=
X-Gm-Gg: AYBFou2V3Xx/fyN1IqxHT1cPQEpdY8rbHl9HSBlLaPgGBvwdmsUzT/voipH8L/Dr7uR
	lj5Be3d/dW1I1Q0hFN+/F2tDPYXsoeEwDjG29zPPl8OI7/p6PqLrLqsrKH7ElNjDiWay4tRVyNI
	btMy1d+8o1NVqjKCkeOeNu/XwWGlII7r+FxWbvTu8p1k5JdDNEXYpmHxLU/69L9AFC8qhXz6EWD
	of0IPNEsMKJEz/Xi71rU8rq4x+BFVpJ/mFRL3qT7tnOO0ev8zvXRiHhe7dXBczIsekog4v07NgT
	M9eNkSKRWZWp0gOn3OKmZS6Mq3jruSuAkLYAA1TV261w2vjhZzNAYx2DfTtEorH1lSo79z47qzE
	h8WJmr19u3JnkqodAXQEgm0rrNEu6fHsSZGp1HdtgOXNXy1d9/TdIAL8k
X-Received: by 2002:a05:7022:3b82:b0:159:f192:5290 with SMTP id a92af1059eb24-1993505eb32mr8885768c88.13.1792983106050;
        Sun, 25 Oct 2026 19:51:46 -0700 (PDT)
X-Received: by 2002:a05:7022:3b82:b0:159:f192:5290 with SMTP id a92af1059eb24-1993505eb32mr8885698c88.13.1792983105262;
        Sun, 25 Oct 2026 19:51:45 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm20442306c88.20.2026.10.25.19.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 19:51:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 10:51:38 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Message-ID: <at7AOnFJT94NYWk0@YUANJIEY2.ap.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-3-yuanjie.yang@oss.qualcomm.com>
 <ebd754fd-96bc-4f37-b390-35a952dc6328@oss.qualcomm.com>
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
In-Reply-To: <ebd754fd-96bc-4f37-b390-35a952dc6328@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wpyMeiaZrasrUhgYvtQH5RYVj04oCk9z
X-Proofpoint-GUID: wpyMeiaZrasrUhgYvtQH5RYVj04oCk9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxMSBTYWx0ZWRfXxrxh7Ai6cpOb
 B3Ty99DhpjI4qDXB7lPZ8Ri6z3Q2W2Goe9UvjdTAXj7759ETtHou9/Xp9KFn5ydQ9YmAtNGTfml
 Dnb0Wyuv95NyPBzSXHQe5XRGxrnNf6usmVr6fvCZGV/iKtKs2Un9CHBQoxriDYiGKVdfZSlU4zm
 CyUkiz7SCekwUAtxdI5JLBruxKzBcbCP3SR4CuKtn7+ksNqfh7RvUTtWovD7a895OadsJE1iXhM
 ev3QYRy8Fs3rqnPZ0Vm8oQ3EeGwL9JYsaDd7u0+OqHkKwqO4Mf93y+diqAf16E730jYSN6h/gzl
 uM/yjFMk2EkIt6ah1xTY08Fxr2PWzHD7kmagyuY912pS1GUVvHZ4bmzM99VqiEbeEJXLZF1in68
 +wpMKq5u2umFxmtlLcXUC6xydf3YybhBM8kHXNr9WN5ipAU4eLqWg27I/7F3R2xeeB1+IMw5Dpf
 ORCCPOJZLj7wUQ/3nPw==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adec043 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TJUqZQk6AAAA:8 a=UhjQvpYGxMY_E1aW340A:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=Q0W1slMkcave-rSCEGgY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxMSBTYWx0ZWRfXx4Or91cIuV4v
 LUEUNlTJzrFFU4S8yA8WzgiSe8w8sn5911XSvRTXCmOx3n0o7UbDn5HUZLW1rTPdtc4SealE1nv
 axoae9qcrp56oROHIsnJcobteFU52ig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260011

On Wed, Oct 21, 2026 at 12:18:39PM +0200, Konrad Dybcio wrote:
> On 7/27/26 9:07 AM, Yuanjie Yang wrote:
> > Add the initial device tree for the HAMOA-IOT-COME platform based on
> > the Qualcomm X1E80100 SoC.
> > 
> > The platform consists of a system-on-module (SoM) mounted on a carrier
> > board. The SoM integrates the core system functionality through a SiP
> > containing the X1E80100 SoC and its supporting components.
> > 
> > Hierarchy:
> > 
> >     Carrier Board
> >         -> SoM
> >             -> SiP
> >                 -> SoC
> > 
> > The COME SiP hardware is effectively the same as the SoM used on the
> 
> "is effectively" or "is"?
is,

My description here was inaccurate. I have revised it in v4.
https://lore.kernel.org/all/20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com/

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

> [...]
> 
> > +&ufs_mem_phy {
> > +	vdda-phy-supply = <&vreg_l3i_0p8>;
> > +	vdda-pll-supply = <&vreg_l3e_1p2>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&ufs_mem_hc {
> > +	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> > +
> > +	vcc-supply = <&vreg_l17b_2p5>;
> > +	vcc-max-microamp = <1300000>;
> > +	vccq-supply = <&vreg_l2i_1p2>;
> > +	vccq-max-microamp = <1200000>;
> > +
> > +	status = "okay";
> > +};
> 
> Does UFS come stuffed on all such SoMs?
yes, UFS is stuffed on all such SoMs.

here is the SoM doc.
https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf

> > +
> > +&usb_1_ss0 {
> > +	/delete-property/ usb-role-switch;
> > +	dr_mode = "peripheral";
> > +};
> > +
> > +&usb_1_ss1 {
> > +	/delete-property/ usb-role-switch;
> > +	dr_mode = "host";
> > +};
> > +
> > +&usb_1_ss2 {
> > +	/delete-property/ usb-role-switch;
> > +	dr_mode = "host";
> > +};
> 
> And this sounds like a limitation of the carrier board more than
> anything else

The SoM is a self-contained, pluggable module, and these USB role configurations are part 
of its basic functionality. Therefore, I chose to define them in the SoM dtsi, consistent
with the USB configuration in hamoa-iot-som.dtsi.

Thanks,
Yuanjie

> Konrad
