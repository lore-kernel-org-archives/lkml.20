Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22695409632
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233780; cv=none; b=tpFFX19ouYi6OHyJ0+r7xXXK/V92G6B2aBBGGnBvAOs1i6fAN/VZhcOpaZpg3X4jen8xTxtHAoI2O1yIJ7KQgBOygESO1XsAqU2Cu4LuLXy8T+iQBgWgYshDA9DLkvIYthruQ8LNK6ibBbQuY1PNd+xm8y9pfQL2eeNTlbrczEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233780; c=relaxed/simple;
	bh=9B2krtCY+MxnHsDNals5eAEcJxuwJx2cjjHmlvlv5Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7DAEQq1OAiHd5UgwvLJ3mBfvdXh06tgW4PI9LX9byAbaiT4ap91hxElsIcUGq2OHnhBtdcaFhoOXybLzS/4xEogxtSG9EDGnjAEiVv+7kuFXTLSP1krDLsGrBPTs6Rv0coSWPVkoODHVG07E9v/XLGv0k0EFR9BRGVNo1fuxys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4pbpWjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vx4S99RS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4pbpWjc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vx4S99RS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eMnS582518
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KQIhQXP7ObT82EVVw2F0DwRt
	jw2CrGVeAmf9ccNKQ5w=; b=j4pbpWjcVTM7h0IdZjwqCkUwN9hul/WbjLUQyaG5
	RrEoObGA4t2uWizjAInxcdTCVG7TIJr2gm+N/KSe2XqIqUVwfjFxbFcfVk1vRwAD
	sdt0CnWAumwr1mmc2JeJsE8qmAOkOUKNusNp5e31LjgLlbwZyxvZNTeK2i8YnQmf
	vOnoNW78CfdeH7fGk2pXd7GrzNvF9u5OVgb0/hFt4OR6eEQIkWZDKPeBye1grpUA
	Z35HqeIMIPnWRl7RUzk2TohRa5rlDI8fPQ2uvo/oCXzYzT3m2hfWTaABsr4xKSTN
	W4WYc86qT5hTT0zCV6khzVVGm0LfkKYO2CweSLLgtYhqTw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwkt99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:09:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so2814080eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790233773; x=1790838573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KQIhQXP7ObT82EVVw2F0DwRtjw2CrGVeAmf9ccNKQ5w=;
        b=Vx4S99RSHgJHr0uRAxOHXMp3DA9nkAFAPICfKVBrkkS2DSeNfwYprTyPeDxKEZeCNy
         cWEttz8a+XRy8Eaw2s+CmS89bcw9cWl85t+MyGIsUMzAECRyQaoIeyk6SYVMewbClUUu
         hXJYeX04mI9YuN5wlKCN0RfHhDUvk6VLA046zRqwkJ3ta4IFlrcDBCxlYgV2+gplUmux
         WhvbiUZYo48sFQe21piVl6kqBpptitit+quIc5gZUseblMaPRqgwja+VIUo9wd+F08ru
         If3mV8i36fZ52Q+D8P3odHvVSW+kjeBeYDvLZK2sJeofnJc5uPnGOSr17oxDgRyr7SGM
         n8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233773; x=1790838573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQIhQXP7ObT82EVVw2F0DwRtjw2CrGVeAmf9ccNKQ5w=;
        b=VyNNwxFi0aRl6Ppm2Rzo+aWiSgxGbBJK863DImUYrU4SmruYPsR5as3O3JtkluCw1S
         bTXC0FI44FJZD/yE6DqUuNJYAVuhtFVOtgEN+rjUsqoRHpWFc4vMwrJCsadVg3Q8EGLu
         DSZO8xWo/rae3dwks/KUVOydfepOb/rsKWz0Drxm3HQSGdrT13NcyMAcmv8wmruO4XaL
         9SIk/6rtvTINHYlNY7Uqxz2Sm5T2sbFheMJYpEMe1DVBaYvtxcpZpnPZAeZ44jzWJ3uJ
         ASLK1PpPX7Erea3q146LmreOD918wq/dMI30VZu3YR4LUTa3DN8JkRMkh3rF9YEzHG9C
         eeCQ==
X-Forwarded-Encrypted: i=1; AKwUvByqO+dFq89Rmp9TC/V/nrLsTNDuEM6T/fnSg9UfLOgf1v+Kgm0o8olpAKyiO4EPKmEctNlaql6TTZUR9BQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lPdLrKDIi/IFOREzlACvVEaf21V2FYQdTRjtJLZLCFOGKdVrFs
	3aKVbPHD86AIA004O3o4wdN46oX1JOuogevgrovKcxVUjn2jLQA/rhnv0YZIKXIJ0LsTt8b6xNQ
	QYJVJWo/YAiN9fZgkZe/TxRXcX0avfmedsOJYox4qSSE4vKsHfcVEQ4/TSMnmT9F2e54=
X-Gm-Gg: AYBFou20Nxhbw9N3z7qYb0QRUGNmDasT/6mO4zSVdH1jmQLeDFFgYxuihPbOSq+H55s
	3+5VPF8byQ4uWyJVjsbQvoTehGpT8OfTI8rf+XRoRiI+uGlUBXLSKOJg20T4G7I23MqQKukcGXk
	VRdb+L0y2Krnn2CI/Sf2TB1KOBIoC6C7zyrG2huBMAAqEzOWcMrbjyDMvRnHZlZBkpfsEO+zinm
	RUvvyLf6SBlmEhfl28orY6l71tEI6ZCl8SsFJRHeiSdW7TC36omNBbQ0IKlS7ZJdmp7VtOkcJ1n
	LYPHS7H0BePzsOnSyVYQCXiklYOMJh0kKyT0p27yJauFq5EYHNE/w1QPH/Zal27MKSY4HD7XFAN
	xBp7kK4egNjD3nW10T51Y5RHt4YkhGIFgshN9m4yhJQ==
X-Received: by 2002:a05:7301:618c:20b0:332:8b9b:bdc4 with SMTP id 5a478bee46e88-340062720f6mr1228298eec.20.1790233772914;
        Thu, 24 Sep 2026 00:09:32 -0700 (PDT)
X-Received: by 2002:a05:7301:618c:20b0:332:8b9b:bdc4 with SMTP id 5a478bee46e88-340062720f6mr1228257eec.20.1790233772034;
        Thu, 24 Sep 2026 00:09:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96952605sm11525410eec.22.2026.09.24.00.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:09:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:09:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
Message-ID: <arTMpTiQVOdtG6G0@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
 <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMCBTYWx0ZWRfX4yeTTi22fY3h
 5wVNdmHJ+xyqK83reK8EDU75t69Blxp6KbYM/blcEkIk/vmhjeESUgAwXeVlc28OjqaYKj4qgB9
 IgIjTHqpjskd6jGSBCKFkaOEz1QzXcIk2Pm3EoB7QxzyAiGweCVxZOEWwr4yiTAwmDpavimt1xk
 wwd5HUsAIPybtgTLXjZv1ypqIi6gsvw3QpjR2kJ4Qyy7o7ViiRWGYkQtAtHAB06Pc63vOsNsySK
 zSJXfF7jbHRpTLr3NthW0XHSkM/88vxbGTOXYSgl2KXS9LUL6ERN/4n7e9dvIS/WvlJc+EIKpOY
 twlU3oPcKkuWU2hknNp6ICfeGbIK1qd02CXcEsTejzafceyHScc7zxeyFWdVcALEQlUs7/e9auL
 vHMtfgpLObKsolrnTp2xQwM/+GipNhS8sLvMR/ZPVCXK3ac/f4tcTgSSE6PYsfjrbM7F4Qu/ZoU
 SWWBfUkVYEFVmEA8mww==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4ccae cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=jaWJLzSDDGsGEjwdg8sA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMCBTYWx0ZWRfXxwmz30kEqz5S
 beGj1egpWUScxHKdbC92132OWrSCgequBUoRe3dQrSlN+eO6HVOejdg3BeeXOIUFYmMPe+88EKY
 BX9zH16byPhIKQWsdzqbntdb7MNbN7s=
X-Proofpoint-ORIG-GUID: PPSphmaDMoCa525Vf6GV_GQTN9GKTMXh
X-Proofpoint-GUID: PPSphmaDMoCa525Vf6GV_GQTN9GKTMXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240030

On Thu, Sep 24, 2026 at 11:52:52AM +0530, Vishnu Reddy wrote:
> 
> On 9/23/2026 7:17 PM, Shawn Guo wrote:
> > On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
> >> The nord platform integrates the Qualcomm iris video codec hardware,
> >> which is compatible with the glymur based iris implementation.
> >>
> >> This series reuses the glymur DT schema to accommodate nord iris
> >> support and adds the required iris device tree node to the relevant
> >> nord device tree.
> > [...]
> >
> >> Vishnu Reddy (4):
> >>       dt-bindings: media: qcom,nord-iris: Add nord video codec
> > The binding should go through media subsystem. That said, this series
> > should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
> > patches.
> 
> Are you recommending splitting this into two separate series, one containing
> the codec binding patch and another containing the three DTS patches?
> 
> I can certainly do that, but could you elaborate on the reason for preferring
> that approach? I'm trying to understand whether this is due to the expected
> routing through different trees/maintainers or if there is another consideration.

The routing is one reason. The other one is that the split will make it
easier for us to build Qualcomm Linux topic branches by pulling patch
series from list using b4.

Shawn
