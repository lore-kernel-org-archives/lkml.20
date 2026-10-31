Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437378;
	b=BUITKAzX2H+ArK4cIATVXwdniPxLMRHEqbH0NX18JqS8QAI6qN6anb8Ehx3BCsvtUvIt
	 tJ8dVdOc4eYFgHM0En3Fz4Y09YbO/JAoO7HwWpqt2Q3WWLsToztK0XEy9vNevCQ99RBWp
	 DWK02jM7ATmvJdMM32UajboRsLXyGGVdhzoFakwYykc74IQFbqzmmbGcoUAAUw2Fsc7He
	 OhTr/9llZqQnQOwH3NqKTdEy9cN2UYv0mNNEF1CFX5kiwktJXWBRs7L2vzrvXLyHr3ZVn
	 vSHHKK9JRN1eh8/4Po8wnh9qSKSQWhB8GNv9JZKb/EmJeyKtUQH+e1bSLN34tu3ACvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DWUarRjMNL3pk4YmHhale63Ch3og1P+0l0Zj6olN36A=;
	b=fDt6iHqHwxJ/uYFmccUG2nhlaEzQTr0sr9PxjKCKT1FLaeciBCjzS2w4PtuNARUCtjMH
	 +b77DtCMiQ8c/sYrSpc8q/nunOe25jqo2QwTXiCegiguzjZFYAX2oY59YDcL2Rsi8uVWg
	 RIq0AXq4DGX0qH/4JJ5bKI8kfAOJDxycuJzvqP7Ebwy+AvZmIsHPvOmsxEkS3mMbXHOFE
	 ANXuS6qHV2ELHn1G0eT6QBQpEJYZfnptHErnaI8/juPJLm/zAPj/ZXGWC6oevYo8cWUFA
	 vi9c3K7OgujVXXf3M+hZwKsMfoNC5Aco181gbkvjdeYgyrfNwgKCsVH8kS6eCQtV29Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ia00+gGJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC1iyak1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DBE606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1DBE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ia00+gGJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC1iyak1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4ajL21757145
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DWUarRjMNL3pk4YmHhale63C
	h3og1P+0l0Zj6olN36A=; b=ia00+gGJlTW3tAOaqlOsRCW65H7GMogwxwemGvMT
	WN3XceUXJ3fun+/RFk7atu0Vp9dW+E/IM2acFHcRlaa0wQ8RPk0R7rPSjNAlum+A
	0mbvo0LmBMsByjxP/s5ukiERLdBe0WT60u63rdlmwYjOAT6+MM64wZdxBRoPNQFp
	fn1AReoJZNSOG+Llb3kI6YSGPc5eXjFjpjc7gj1l+IonPhSFG4fn3EKG6BeYLDT9
	CosRiKAeQjBSUwnDEz1+7F4SZOnUO1Jjo/XMI/zHMknbKhfBsWd67BVIy3Wn7OFo
	9mUA6RjFAXkTGYFbay5dfLJzEx6emE3oJXPrhyr32CIUEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxgs8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:02:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so6011440eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437376; x=1794042176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWUarRjMNL3pk4YmHhale63Ch3og1P+0l0Zj6olN36A=;
        b=VC1iyak1+LaYgB+s/LlJmDYNbv4gBWfqwyKTzEBLm4Ol/loWh3g6kIK7Gyv8GX2eeS
         Ne+Qo8UJbws3+lM87i2cd+RUdjL2DkjrUG4ujBYjVSzJHqR4ViXheLjo6FrdqiARnPQz
         VsT+Y67KLF3URLqH4kd/kN/b2MHFGrSuFHP4xaZIlyEXRMwn/aMFFydMUgks5KcWW/nk
         utfMNfujhhqMUiHACYX35WOtHIkc7vO4leB8qXvo6zQLZAbHf2TfdDFMeYU1AZODafzY
         lBhwieS5SlpPC6XzZROwT3hCubBjxgMX/RYqJM+h6B+RtiHwQl3A7G65scuHw1HnGzix
         ceLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437376; x=1794042176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWUarRjMNL3pk4YmHhale63Ch3og1P+0l0Zj6olN36A=;
        b=f/9Mnv8UMO2ApwbKej+cj/kVklL1NygHz29RAm3Dc2wa7L3M7D6S5dSTfgqaKCGhlf
         yzAOU6qrmA7v5hytOLWwLKXYSgxV8CK2/oZkJfGXo6GfyacNdEylqwo/h4EdIsU40l/U
         PWSTB7IJN8y+tmXQy+40lQCdjuzWzOU/VO/jGULYdQP7hMFDaTzN1v7o9EUBRjNBp23w
         kG0sIMtvVY0zA3CqGgMFP02lMYIVppLqOX+6DDBNeX7dfLCOuoo1dQyqPmsV5lr6H0+t
         aShB9aOuseN/IdMf82ldaVwR4RtCW2orhx03z5qK+Kk7+PV4N3clNmrDJdR8LBkaFzZu
         QuRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl+3ZrZLZerFSBXii4hP2J0+Y5VM39XD8Bwkhqhzvueb2AvZBHQNyGqJoS1/BRLs1BjCjt3B56q3aBha0=@vger.kernel.org
X-Gm-Message-State: AFq9FYICvC33dl9Tc+HT832XsywAaLJLciTt+NgPrOGsUM4M7b1HNw6c
	XRfOxhXnvNUKBzDrNe229XtDXOQNiYKLOk6VgfRVhWfKKZKnBdUPJnqXSXJtri40Cjvi/S8ye4X
	oF2CEV9QtQ5J4Ncwd7JUd9OYteer5WKoVf5p6VLcRrzXehEHSoco6TmozBV6YCYjDGB8=
X-Gm-Gg: AYBFou1K8kM5onefG/hlLK75AOtTMZ0VaOQzRJIbqAylXCTzHbeoCNtCFhdLXT0TkSZ
	w/hWGMXoPT1Gvega6avttniQz19azgXKntc2VOvXi/BJRiI/N02bmefCqcXNe7aF2fve4EUct+n
	wkRnxJxZW+szL84JvyfQIzslzzPAafUHlR1HWUQtVqIgSjPdXNiJooR/MWoT46kcl5xiVNo7Ajp
	is8OO7Or17wLu2AFNwqNxZslsax5Zx3RrTYU8L4doIG5Qyh9UM+AtINAuQcWG9/l6KGuI/vKzup
	eq7ydV/obv5V09M+AzAUkK9YEMXtbIgYffyEFDvFBb9CziHZqrhN4USZBh8AryKTZIzAU/63f3/
	w6GEofI6vU3Qqkf3BpgFa8lpgrqCMsIqUDkAJRQRrai3TKWrG0Z5FtusVyyXXL8oK0uzmYqKUku
	ZTy80Dpj/arHekLBk=
X-Received: by 2002:a05:693c:8945:10b0:36a:3bba:2e07 with SMTP id 5a478bee46e88-36a423becbdmr6600216eec.26.1793437375544;
        Sat, 31 Oct 2026 02:02:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8945:10b0:36a:3bba:2e07 with SMTP id 5a478bee46e88-36a423becbdmr6600187eec.26.1793437374972;
        Sat, 31 Oct 2026 02:02:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm13711825eec.12.2026.10.31.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:02:54 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:02:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
Message-ID: <auWuuRmTrK_h17nE@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
 <c4cff6d8-83dc-4290-938e-7f372be605e8@oss.qualcomm.com>
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
In-Reply-To: <c4cff6d8-83dc-4290-938e-7f372be605e8@oss.qualcomm.com>
X-Proofpoint-GUID: _BD2L_Tiuxy5IKEOCTwTgRMd5-ZwXVez
X-Proofpoint-ORIG-GUID: _BD2L_Tiuxy5IKEOCTwTgRMd5-ZwXVez
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX39JXGJzFMQKK
 zr6KEch2Uy1W2tALxCO0iAJu5jcPljXG6r5FlXbwiYe3p45YT9QvJtnX+EHq0WF9f76hYquZi7V
 q+6ivMV1vZMbVgXevDrL25ZTnMt5byA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX0eTkm2y0A0qa
 Gs4PI7OlHAsxj2Dl3jsvmoWvf7LVawxd9HPbdcce6fgy+g9BcCpLWFKHxAa4/1fXDx4GeKIDFVH
 UngyDz2h2x7EgBZcZyaImgb4zedYONzmNMSIIcJtqb7BPSBsNku2MognCKi7Uddd5IbvdjgfO7B
 woq0a6Vd7oCSpPoIW85reT6BnfI9lG9O/+sS8AhaftHDZjhmMmxe4Qo1crMwcHsNItwDzzjv7ps
 AQoHDwxYBqWehWjQ4Wz4Ho9+VADPLoUqzZrFwSzEcL0vf630AfO37de5h9+hcpekBjNHIvMRNC4
 gr0jBQW/6+5S9H/xbbmgODwRtBRZI0nUzk0tCEmOFlw3+FniglRn1gCxuUtX71pxv1hCCk6ZryA
 XFwhYlX83MpGCI5yb3mYMQbU2UfBQzs6Bvid3iJ1bfuB2s8QKaM2CNoeRrF3QL5cTMD8UjX4Lv2
 UKneRLYXEcYY6EHw+hw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae5aec0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=3ylGVn1-VvHPnHraYRkA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310035

On Wed, Oct 21, 2026 at 02:17:40PM +0530, Shazad Hussain wrote:
> Hi Shawn,
> 
> On 10/15/2026 8:07 AM, Shawn Guo wrote:
> > Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> > firmware to configure platform resources such as clocks, interconnects
> > and TLMM.
> > Device drivers request these resources through the SCMI power, reset and
> > performance protocols.  Assign each device driver a dedicated SCMI
> > channel and Tx/Rx doorbells to support parallel resource requests and
> > aggregation in the SCMI platform server.  Operate the SCMI server stack
> > in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> > communication.
> > 
> > Group resource operations to improve abstraction and reduce the number of
> > SCMI requests.  Follow the SCMI-based resource management approach
> > demonstrated by Qualcomm at Linaro Connect 2024 [1].
> > 
> > [1] https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> > 
> > Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

[...]

> > +&qupv3_id_0 {
> > +	compatible = "qcom,sa8255p-geni-se-qup";
> > +
> > +	i2c0: i2c@980000 {
> > +		compatible = "qcom,sa8255p-geni-i2c";
> > +		power-domains = <&scmi11_pd 0>,
> > +				<&scmi11_dvfs 0>;
> 
> For I2C power domain should be scmi9_pd and all below I2C's.
> 
> > +		power-domain-names = "power",
> > +				     "perf";
> > +	};
> > +
> > +	spi0: spi@980000 {
> > +		compatible = "qcom,sa8255p-geni-spi";
> > +		power-domains = <&scmi11_pd 0>,
> > +				<&scmi11_dvfs 0>;
> 
> 
> For SPI power domain should be scmi10_pd and all below SPI's.

Thanks for pointing these out, Shazad! I will fix in v3.

Shawn

> 
> > +		power-domain-names = "power",
> > +				     "perf";
> > +	};
