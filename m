Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538494;
	b=O4247Am3rxO3QdBfcfzj0aDo/ex8NsU6f7hC+MUr9SlL6StR9eVfx1HlAhOIiKxQkD6s
	 nvSnK53BFKPukR12fGVJ9lIJONxKBFJVjfLZalxnDxGRATU4FEAI801lo6ZG0qLiiC9IO
	 BwKLWxrJK8HjXU7p3jKo9wzcLbiXp4HP3kIMTptMAojSHDuTOK4nXeNyM3yfBZQyavIo9
	 hnb7IMZjpgL5y6Bl8oz4H6HLIArALUmkMb2r3Z88crlrxMLqNz2XZODESBso7julMhG8G
	 gkZPh0GMkZHnyT2jkpHwZWLuZu9yElbzgiSCL7OjzueH50Z9s3AQNHV9POCxXr+08Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3IFlEUS0jw9JEezJjoa+Ahcnwnp+ipK5GvAoLO2eIuc=;
	b=Vt5XJBZp+V1h2oaERb0tr0q+GUgZDY7Mm6RheQWsb+buJX/3skye33/p8bFj1tSh/K0H
	 zJ4uDtgnFEisuhrx/omCByRz0eQu03M6pIEaSe0quW2npMUbgf7D3uKVNBBgsdmufeaJ5
	 JrO1bYjt/hr/PHp+FFQ3qn4cWFzQRHFm0Sjny+83PZ014qnfbelOq906TY2tGWyYQOrMF
	 0nZRCCqX30p1al0B4IPlkFVb0LJmiP2zHXS3XpulO/+BebDVS7uja/T2FYsCgcrNZ9WVd
	 6VBOolt4V7qKbut1bks3FFmgHXvnlejGQ5T/gcxwdxpE1oejb2UtUNEqC9cAus5vcjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mAeMaPNT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guDtYZxZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793E1606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mAeMaPNT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guDtYZxZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KKbB1187293
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3IFlEUS0jw9JEezJjoa+Ahcn
	wnp+ipK5GvAoLO2eIuc=; b=mAeMaPNTVcH/RfulSEEcf4Mi0l/zKk1TLAWJAtut
	+wC78LhpJPRTAQlt58ob7fzUWFONgyOCpXNUrTn56jZOeh3Gjrop6WZyyV7/G/R9
	mLEkkduNNJE+IeiZ/afjYjkQbM4X+BmS8fyBY21rQ/+UlFW1Pz6PhUIgU9sBXOOU
	X/A/pHJKgyDyzySC5gfzIRAJ15Uys/qUtmWxpYBc0XGQkukWFTHdKozsi4WvyQg4
	aRGnso0JKeArYZA8K+cd2h5kd4j+hOti4g94W6curiWoahmahS75i7hgKVPLRl4A
	+kuxpU3VuVTTxDbcclph6ghL5FH+SgYLxX2I1zFEvZucHQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1brdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:54:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so352961eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538491; x=1795143291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IFlEUS0jw9JEezJjoa+Ahcnwnp+ipK5GvAoLO2eIuc=;
        b=guDtYZxZ64ptWGyTeSX0Z2mpOWhSvzMJ3uJMNmDuodMfYOkarOtXwZTYAQjKbLO+k1
         BXQJToSfmNJ1djhw2MwzqQkBKgcOjyLp2noskNzk/WeIvogTQHs8Wz4vFWcy2HiA956K
         +abZcaNwp6qckPxxDqx4XqrZLYjJHMLW3vlFtGHVoy8Kld3kfcjTzuud4/mBwBUc5y9R
         a89RmFDsMY4OUi3QE7NyA3UOUhp2VI0XSgKJuiKh1mux69MwIC26P7pDadG5W+ULDF9Y
         x4c+zqorS1sCeMcfx5C53RRWj7t9BxBPm/zkHG+mcRmp5vlnpA1MYjHAGM39wB6niNWm
         u/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538491; x=1795143291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IFlEUS0jw9JEezJjoa+Ahcnwnp+ipK5GvAoLO2eIuc=;
        b=s9I8e6etVyx4xnoLN3H2glwV1Qq6JhaOe8bGzocg/cVRTG2HyPGa1jh4Ya3wevf0PA
         VcmJjl4psRbTk052qWW6eoHkjYKRYdP8Pj23g1GRjYFCPoUpJXanVvU6pKL49MCZ7omC
         fasfa6Ln7G66b3Vpgx0l1VBD/akWTCOldoKWKy+iRIsOw6/C690JGrX05MxDo+EECeFI
         IBFiiq+zTil4UdjEYUrCD3an+GDitpo3udF5E7Mzw/bZTYWo/Y8YRYaHCK/Imyb8uuWS
         1bFhnpk3bJ6PmmF0T8F0xY46IQz9/PjqPHYT0DEePuGq7Pb56z8lEfW8mh1KDG/z6AT1
         mxUQ==
X-Forwarded-Encrypted: i=1; AL+hErHGKZlR/wGMcDLNgT9SM4vnhOVQC0F0yG7+dk6D+GbPmK/cpVDnOluceRO/6eQnknBYbWFsstIJbGT3WwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YxKyqSBaEL3dAsXbcQe3nIwql2HfOsXyC9aVyfRZSD766r7/J
	Yof3C4e9Dj8eEf4m0u54dsKnfHDLzgQX/e80K54QeRWcToKWklehMJhyxIpapClfvXS3HvwQxdx
	lMqSNWV16V6mXSLI6tgLmg/raTtmy5bOD2PQZszfryBN0zNwejZia+YgovgJl5WsTGLg=
X-Gm-Gg: AYBFou2pOgS+2f54JWJVm0nXOvIlXOgSIZbart8gbHUz9/Cwd/jHMH7lEvxzL0P5Huv
	24NLATS11+s3Frct590G28UdSvvyl9UnYcd320lgFmYeI7U56M10ZWAUXaqN+7XbiH/VFlnzRV8
	L3ulScsx4+qpqgHv0sX7xxGXnRzqHdmMfXBWQABR+7hIVfSVpYtpxjHGo0Kp2w3mdnD134EvxtY
	LQ3CuTP4SjLmB2+g8mWcaUQYfewbdCu1Ske+KLn3s8k+iM2/cM9i3IYUSvvK7OIF5oyyq7s3xVY
	bz/HVJrAAkthm9J1zFJ5dsUVADdU12gnObChjmTBYOVnDNcl/QZjzVrYQgZ/WzZ68g7b+T/GCmp
	hvKjAJUmXVrv348+e/9+1hczzLHoi2x6L1/ElcRCVmCNW8m8nxxoHsCrZZ81+VPX+L2qN3gxCQW
	5rFGg5DYDDHlimQvYBrYF+rg==
X-Received: by 2002:a05:693c:87d4:10b0:371:197b:5ade with SMTP id 5a478bee46e88-377e1016802mr3939806eec.11.1794538491171;
        Thu, 12 Nov 2026 18:54:51 -0800 (PST)
X-Received: by 2002:a05:693c:87d4:10b0:371:197b:5ade with SMTP id 5a478bee46e88-377e1016802mr3939768eec.11.1794538490435;
        Thu, 12 Nov 2026 18:54:50 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm3910027eec.25.2026.11.12.18.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:54:50 -0800 (PST)
Date: Thu, 12 Nov 2026 18:54:48 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in
 DisplayPort-only modes
Message-ID: <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX9uoIQ25SqsPN
 Z/TIaQZTegEDAWJeKGcItSlYky2ksuqwph6ziuakUtW8MtW1uYG8GeLbTYaFkEoXq8cnuHcTCbR
 LRfJ0SktN7m+/EMl6gfXowoC8+5sxLhtfxIIAAOZR/E2Mj9F0hg+Pl2tCEm1MA+SG4fUuN+oFMm
 B0eEQmUrfxCNdOWB/+rIRgtSkJOQ0TKRz4qK9F9hRhw/0DOMibn0SEsWDZh8BSLHwTahruMYPtS
 7Ac38pxAtWEmIKdc5dMplTONZuU/iCClk2UXOp45bAImdnieiLHPx6db/RLntL6pzjGwLiQk9Ej
 LbOghnMJdAdXsZdcK2Ale+mAfPvNmpCGgyrXJlKOZ7edA7lr8Tx3a6keqthyD8MO2ZzMnIHQAho
 QpOD3amtJc6wc14Ds5gydvNlzWUGS21AcqIr/vjWFe+o8KnEVcoPVl30DUwkOBpoPcc8vfkk3cW
 pI426MBD0E3zUnfBwvQ==
X-Proofpoint-GUID: 6LskdmnxCamMRxJD4iqOas8hIkYatkkl
X-Proofpoint-ORIG-GUID: 6LskdmnxCamMRxJD4iqOas8hIkYatkkl
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af67bfc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=76iuuaO-dfIhFSRFSN0A:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX97s1+gpSGhsP
 L81LgT61VlqJ9w4jcssguZzWTy1+pT2db6cBATHIyWmObxFdUGtTC38yPLfxU2PluA5F4q8Rg1P
 OLLHvUgkUatuwAPhtjnGX2j4lr1/mEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

On 26-11-03 22:50:54, Joonhoe Kim wrote:
> With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
> USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
> PCS powered down. The USB 2.0 pair still works. Such monitors often
> have a USB 2.0 hub. But the dwc3 controller still depends on the USB3
> PIPE clock. On Kaanapali the next xHCI reset in this state times out
> ("Host halt failed, -110"). USB stays lost until the cable is replugged.
> Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
> common") keeps the pipe clock branch enabled. That is not enough here.
> 
> This series lets the controller be a Type-C mode switch next to the PHY
> and moves it to the UTMI clock, the way "qcom,select-utmi-as-pipe-clk"
> does statically, before the PHY switches to DP-only mode.

Joonhoe, thanks for adding this generic features for Qcom platforms, it
is not only for Kaanapali, but also for platforms which have USB/DP combo
PHY.

We did an internal discussion for this use case, we may prefer the solution
that let the PHY notify the controller this PHY lane is going to change from
USB to DP (4lane) event, it could keep driver independent with dts for this
feature.

We more prefer an general solution like [1], but it seems PHY maintainer Vinod
prefers private interface between controller and PHY [2].

[1]: https://lore.kernel.org/all/20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com/
[2]: https://lore.kernel.org/all/avZvYlYyL3Doc8qt@hu-petche-lv.qualcomm.com/

Peter

> 
> On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
> DisplayPort series [1]; patch 3 is the controller side for the same
> SoC. Other SoCs whose PHY is already a mode switch (e.g. SM8650,
> SM8750) may need the same property on their controller node (not
> tested).
> 
> Related fixes sent separately: "phy: qcom: qmp-combo: Leave the USB PCS
> alone in DP-only mode" (suspend in DP-only mode) [2] and "usb: typec:
> mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes" (boards with
> an FSA4480 on the USB 2.0 pair) [3].
> 
> Patch 2 conflicts with Vladyslav Tymoshchuk's "usb: dwc3: qcom: Defer
> VBUS override update during system suspend" [4] in
> dwc3_qcom_pm_suspend() and dwc3_qcom_pm_resume(). Both add a lock
> there. Like [4], the mux callback defers the QSCRATCH write while the
> glue is suspended for system sleep. On top of [4] the two locks can
> become one.
> 
> Patches 1-2 are for the USB tree. Patch 3 must not be applied before
> patch 2: with "mode-switch" on the controller and no mux registered by
> dwc3-qcom, pmic_glink_altmode defers its probe indefinitely.
> 
> Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
> backported to v7.3, plus [2] and [3]. A USB-C monitor ran over 4-lane
> HBR3. Its USB 2.0 hub worked after 10 replugs and after a plug-in during
> s2idle. In the s2idle case the mux state came after resume, so the
> deferred clock switch was not exercised. With the monitor
> unplugged, a USB 3 stick enumerated at SuperSpeed. Quick replugs (under
> a second) worked 9 times out of 10. The other time no PD contract was
> made, so no alternate mode was entered.
> 
> Changes in v2:
> - Patch 1: use the common usb-switch schema
> - Patch 2: switch back to the PIPE clock in the mux callback, when a
>   USB state follows the safe state. v1 waited for the next role change,
>   which can come before the mux state (Sashiko)
> - Patch 2: keep the UTMI clock on a change of pin assignment while
>   DisplayPort is active, as the PHY keeps its mode then
> - Patch 2: while the glue is suspended for system sleep, only record
>   the mux state and select the clock on resume
> - Patch 2: depend on TYPEC || TYPEC=n. Skip the mux without
>   CONFIG_TYPEC. The arm64 defconfig has USB_DWC3_QCOM=y and TYPEC=m,
>   which failed to link (Sashiko). It now builds the glue as a module
> - Patch 2: no change to the role notifier
> - Patch 3: note the dependency on [1] for the PHY's "mode-switch"
> - Patch 3: add Reviewed-by from Abel
> - Link to v1: https://lore.kernel.org/all/20261102215121.738-1-26rote@gmail.com/
> 
> [1] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/
> [3] https://lore.kernel.org/all/20261022165143.1327-1-26rote@gmail.com/
> [4] https://lore.kernel.org/all/20261018143126.3978-1-tvlad744@gmail.com/
> 
> Joonhoe Kim (3):
>   dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
>   usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
>     modes
>   arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode
>     switch
> 
>  .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi       |   1 +
>  drivers/usb/dwc3/Kconfig                      |   1 +
>  drivers/usb/dwc3/dwc3-qcom.c                  | 103 +++++++++++++++---
>  4 files changed, 95 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
