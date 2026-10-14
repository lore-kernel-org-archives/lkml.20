Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D30545DB2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987799; cv=none; b=Wk+pzYyrcPb4SfpwwWWv9984OCUJKTGPjjum+QxcH87iOU894eXdNtp/OAVta8VYuXMcXE4J1llVYn1d7twp/69UjQ/pTLFUuAzjtkZ04EPrDQJzSKuIdknwOh1Z/acAr3EHm7dnR1iRmr9ygsGapkmlHfup7j2uMRnI6CWbAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987799; c=relaxed/simple;
	bh=tx9Xx/2ujSCsRzYR5b6KO0ZDOUNlLvzT/wn4ry5q0iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eb29FGyAMCwC9scSMaBhd69WQP2WdGgHN6Zd0o7fsuQCbySR09uINkpgSq3kerQRs07kDNdXrJUpckCn1VYEPSidqazsXKkAfkvl93s+YMNc0AXglfMu5yShkNXSAkp5YdCX9xcou7o2Lu9eZPx4SVrMFt2ZWVkBhDmrabHGfjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TF1S2lnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbrfGAH9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TF1S2lnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbrfGAH9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBIGtG3365999
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HxggoZsyGw+wkrlt+cBfpByq
	ki1BnMRvzaCfqLVXJus=; b=TF1S2lnZJFZuQXXKI6RIdo8aRvTUHZAqHZILAp7A
	vJ2B+fI4gARqwq99r+lwNgFGXtMxa93KXML3ETomP5IZuOH5YyJ9gK7/E1fLWQfJ
	Njhz16GL+biCZhSaOBXoGBLhL/5bfaybergcrzyRv0NuEbQRcBAyLPlMXzkhD/DG
	9OycF3LNTiwJaIjlAshxM4dJR6atyZd1AJ9HkeApFQ/JRp7tv4t0zxna/RLE6b8H
	L1HIlqLhhbwbNUZI7Torh5L0QRMvwdjVCChlet1V6h33K1KSTGSJPKmj075LpKce
	AQ7Ywkq6UzDQ7KkM0qmBsK5Fr8fsk5lRYjA4ryHoSkvteQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46220f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:23:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b875639ceso52582816d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987796; x=1792592596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxggoZsyGw+wkrlt+cBfpByqki1BnMRvzaCfqLVXJus=;
        b=cbrfGAH9rzmDWPAfL+lmDcKfacrnNCoWypgH1FU2GuKz0mnHjb6qsuOLP7OYO74nLJ
         ak++vNBXyFpSTSgpzFMSu3597qjTVRvC4owTHKejF/K5U0JaCSxHN64VFO+smXLsYJXE
         eJ+Ee2equMknJhsj8tXnE+SXbWjFLQfV4fDE7LSY1IkVxGQ8oL6kSgAzrUeheHwQve7O
         oyNxVTbljz0iIMMRPlAttPHLlzig9xM71ChArIo3N7Y2EaHfk7M+YzVhGzjPPShM0iLL
         lZdd8OFtYx3V0VWEmgvR5XnjDDRn8GI9VGSuahsgvsMqLIZtPYQIB/7xhwkBQRiT+LGq
         +9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987796; x=1792592596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxggoZsyGw+wkrlt+cBfpByqki1BnMRvzaCfqLVXJus=;
        b=KQ8Qf4L9ExcETzF14e55y6b7O+M1p8FC+EjSFKjt+WzyKxUlVSwvXIJ0vrBcFIeZiB
         hQlQeYBRk8ZJFvxikoQt2JYRoHzcN4hSbUMcN8zEd40Hrgl5DqTxfpq4NYRUpCVW1zsd
         T8W4SmfSAHJdkHcyKj04jxoXRLJxDQVrRUq0AYWwZ4MBip1ug4da7cfUW37E+u5NciNl
         0NjofOXnMQ0H7sqJLV9r7fI7rExQCzqQ8JnRJnbNji3HNWq3OSxhdalUzigdEnl8Y6cW
         QS9Y/yTAZH5LtqTxediP0WqFVpsWr68k8fFR4oob4RRe/YsfHbHiASiuTMQkjzOe59vk
         N8kA==
X-Forwarded-Encrypted: i=1; AKwUvByIXywXu7XaVdNGLj+oyLalj7aKxmjA0oFWzdYwalgKm8PnehPdqMLg2nwrLc2DOJqnwBky67bSwP17GLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH3nh4v7yO1h2cfia1nyvpqt7z/LLjeqsAE+ZSaVOBCRqRVDZr
	y5PiWaiVKlZZNetU7i13zw4vnTu5zKOuqUUSW/2kEsP2ko7w0hqTJctojqd4mS91FTRI4T0y5Qa
	bg8Wt4csHeGrxREOV7GzPMXum+E6cBTGv62ddvEIwIk82kdxPSQWxNUHylyRqEIoXPYo=
X-Gm-Gg: AYBFou3BpsVJuPI8oGLPtwd1OTkcg+w9QdIpdQETDYeWXsBsN91iImc5wIphS4UrtrM
	C4NjnST4xz+7beZYogLYq8Q3wQgR4oLLJ52g+uSZDwpEoKLHaX1vEKOuU286o1lDJdeYiG02fOw
	cUeM8ZG49oEH621/zzebMHMCXk3iwjjIDbrD6Bg3eCenaCUgxhM/E+NF638pisxCLMOtC1FY5/W
	Z1+NLkotbV3np5TZBRIR+BnBpzvoCvnhouUzA+qhZPBp1XVlivGNDddgmV8co8hZ0ym6UoJ2kWN
	/TBLZ3ffNJc4fjCIFuvMqOKiY4FcSKcgq3iCMrZ1yPZ9YNZEGxbgEvsLGwUj4o0OBG6TOmdRuZU
	N59OeaNkhvOg+mEYmFud8abzimORVwCcXXuSIrYg0b4KEP1Jb+Ytu3sk5lcvUoIIf7xnk/xX25p
	TXlK3om/Rsqn1h
X-Received: by 2002:a05:620a:270d:b0:93b:d79a:c462 with SMTP id af79cd13be357-93ebd26b606mr2563170485a.58.1791987796080;
        Wed, 14 Oct 2026 07:23:16 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93b:d79a:c462 with SMTP id af79cd13be357-93ebd26b606mr2563163585a.58.1791987795429;
        Wed, 14 Oct 2026 07:23:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9dcdf4545sm28180021fa.25.2026.10.14.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:23:14 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:23:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH DNM RFC 15/16] arm64: dts: qcom: sm8650: Drop
 required-opps
Message-ID: <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6eqfRbnabcJn1_9HC36nCWfY2IjF7jGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX6Xr9JR+vEXSC
 nhmVuJov9I5amXPaw1F1yPg5+WjHKFZjUL7KXokAZUOm5pxOyRfjzKmnJuMdtpk6ShGmiawKBal
 S0C4Uu/LnQvD8WHyrkG/E+ZTtM8L7Jp82o4i70mhgBdm3xvBS0or5ji0a2a3FIXvk9OcHRnv2eB
 Ipk0KtsvaCfa3QTf63/HiSWw6fqcU128Gu6b6/qLC6QNR/xZNIrzcXrs9rO5sjoDH59niwi4VPs
 MAk+lJ1B3PZKFfoOerELLrxUK5tmymXqIxbUdA97uILaPc5t9bLk0sNbMmh5ynq0HiMOUdKKMmx
 wxtWdPRK/RMT0gaSBRyJ+H1x3Hv9G3HiMeHe8e0ScAG8J/2fdAbFD63VB1VTf1DodAg+AMIxWMV
 9loyuotHEPaLKqskyUax19wdHXZfL0rH28ChwGJpO3wVqb4X7x95Ef4HYRkDs+4BXrY+txFynKe
 vSiknaTTW1un/t/yeMg==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf9054 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ycGoBvuFAn3-dblq1t0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXzZX3WlajrSx5
 BEvagP7GKe8tASSxapGVX6+bG9sa9oz6Gb6Kp3rxWoLSESmDMyYAGgY74JRtXq9P2+eBkvAlo2s
 56kR4hwamNmGp8aAh0q8wvo8/D95Ico=
X-Proofpoint-GUID: 6eqfRbnabcJn1_9HC36nCWfY2IjF7jGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On Wed, Oct 14, 2026 at 02:19:15PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that the clock controllers take care of their power requirements,
> drop the required-opps that were only there because they previously
> hadn't.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> DFS clocks (for QUPs) are left out for now, as they need some more
> code changes.
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 46 ------------------------------------
>  1 file changed, 46 deletions(-)
> 
> @@ -5057,22 +5039,18 @@ sdhc2_opp_table: opp-table {
>  
>  				opp-19200000 {
>  					opp-hz = /bits/ 64 <19200000>;
> -					required-opps = <&rpmhpd_opp_min_svs>;
>  				};
>  
>  				opp-50000000 {
>  					opp-hz = /bits/ 64 <50000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-100000000 {
>  					opp-hz = /bits/ 64 <100000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-202000000 {
>  					opp-hz = /bits/ 64 <202000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
>  				};
>  			};
>  		};


Can we then drop these OPP tables, which only have a HZ entry?

> @@ -5200,7 +5178,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			iommus = <&apps_smmu 0x40 0>;
>  
>  			power-domains = <&gcc USB30_PRIM_GDSC>;
> -			required-opps = <&rpmhpd_opp_nom>;

How do we ensure that we can access device registers? Is there a clock
(?) which now casts a vote, letting us access USB regs?

>  
>  			snps,hird-threshold = /bits/ 8 <0x0>;
>  			snps,usb2-gadget-lpm-disable;

-- 
With best wishes
Dmitry
