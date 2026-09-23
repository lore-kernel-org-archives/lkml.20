Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7C635E955
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168395; cv=none; b=T9McjRdtdbfOR0W75XS9+jROhvORxmVX4MgK6J2/oXrhzUWBdOQWxsiNqCz0dFzVD/m5DyLk4SBYEAyh9rE62D1lumVvV8imtqISddxRVor4sLnJZpxmBmB5jI6muT51MQoNEMHJBgJFOwDLnwYWg/q5ZL+NJX3dPTt8nFvWWwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168395; c=relaxed/simple;
	bh=8T/DxjblBPj23WXhlAQE9U9oEBvH+dk3uRZw4J7CVnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeizuq3DQSZhsgXjFSTGriQzEzSJoG6yPLmpgUdT60Uyo4rUapNssVkBeTi+DY1Utt+gTnc9/Dp41divwM5KxX4pE/JDcxcmFqUXrlKxSEc6c9Ki1Tw8q9bmmizO+xLfh/yxknIC2FGzrz7CwuKEgSoj3sYYQUAMOP1sp44a9Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZsuio+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SA5JdWmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZsuio+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SA5JdWmr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVFe2443351
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vjx6emEilvohxH7Y+tN4yjh2
	S2/IZXCoPL6mKt5Xsv0=; b=WZsuio+AAMBZrNeZE6llwtXKhUn+jrwyDccFztuq
	FYkdv1FHwghK8U8ZpXSmmfk+DBEms7LqtNPl+lOHUc919srTpcl23jeaywwG9Ufq
	GEfxeAfHcql41FtRmAB3i7YJ5/RqgU915Su5kzWoVRHWsQahhwnGuK5kg/k4TrsV
	AHBfwD8I+Zddisjy0u5aqB4koVmPgo3shaEhES4kWUsW59UI9BlFSRHoDwPKTF2T
	fObuboZrodNgKcyrlKMicByNvFFVBDhBDWKDwnxi3Np+5eO7t5xi2w/33tKTYurG
	+PWK7WBRr6F1AvDHmeqSN2CaRO6f0rCwiL9e8ssgisqO7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7gvmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:59:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so9609855ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168393; x=1790773193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjx6emEilvohxH7Y+tN4yjh2S2/IZXCoPL6mKt5Xsv0=;
        b=SA5JdWmrYk6csjqF0uMW+hTf0lgCl8jmcscOTUGQOfN8NGe7OylxZ4xz/E0Tngmum0
         gnJsv5/uyVdCT6IHYypYd6BDtnOUfxfCaWJ/si9BU/TsICI5zO3h6krZ5J8FwizOwQqq
         +bF0qs3CJi/PpRpdqwqVgjeWP+n2frgWQ2+ObXaryRdO11jGsHPsy596aM0uGEBwwkgz
         RbSlFOXer45Nyu4EscHudTdJuIOoEfsyEb7GUkoEnsN48DtJOG5hyEbJOoi10OIDny0d
         tBV9wdLIZUKw83CH8E9e93+r4yzuauL4pw7EtfOkIKW90hXBIBYFviR9wNwJi9Q1kBAt
         Uajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168393; x=1790773193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjx6emEilvohxH7Y+tN4yjh2S2/IZXCoPL6mKt5Xsv0=;
        b=u+dO2WDQ/bSYjz845r6OP4AaWIG5fiIsevSsg5r1/pWKahlXyjUIAEwe6jh1XP9e21
         akObCfhkSbgwL7ErUnKRamBKQy1OgFdQfxLLOuW/LO3KsDeR7ptJ2WHaCxmx5SltVU+h
         0tnNjmRE8dtz4+UGXUnEBEKcsQ0ebVR6a/nMPTCtsT5XXyis+8BwErMmfSFKamYeis3T
         wxAv3KicWlMBy8QiYMgxf2/VpGnsdJDRqSPPbh39tmP/NMcFqKAaPbu6jN7yFWMFjdjN
         qCQHgaoJ5zvxORtkVdpryuZI2IOEpQAvMBNQnLuVtEDghoKoG3o3sgaB1G3qj3RrRBoU
         xVPw==
X-Forwarded-Encrypted: i=1; AKwUvBxlGFcUCw+3pMO35r20DIrgpBR3xm/pHhFSTqJ+rSKhBu5qUxMdgiPWwkV57KoufK7oHZNs/BfRl5hoTmc=@vger.kernel.org
X-Gm-Message-State: AFuF++lIimFqu8WwWUKBg4i1rSfn4CXqImz+0R2sJNlOeO962zlX1QL3
	lxYuatsYkFZ1ekF8S3Sv+AIdyRrmQzZT8wzLZWmnRWhCa7fVjyMg7nQ+Y0fqThqZq2f/DXLwaZ8
	5ZoAcQAblpmn9hm1kpvGOHtkQXPeWMXFr1L/02bvAdJaHr7Bv6JDp3fNQseO1zR/4Axc=
X-Gm-Gg: AYBFou2YTofOZ/VgW5Mvvekq/ra4iTQWUxjrewQKyt4hvFJ3+VAoleewUeT9GXy06GX
	im+KjVMF7fuaSvYqTyc5U2/6Y4bRN5ruHbEXObngFDVdegY/5Up0698lkHuO5xSEOiBQsrk7/gH
	VNTOQul+IirHnecyN/ZmSDnuNFNwvcAL602QwcpXT93MfQtQfC++OoH4B4oJKJvaAQTpa7/0WzM
	/4tgkurILImcDRk4LskNcwGuR769AfODh2eSHGgmTRdCIb4Me+IfnFjq80EhtyKZtu4mgEHzHV9
	vmfhwzWJyQJudgt3ORxzh5GhrOSeGqDVunzb0KEAAn9A9AtQjou/Mn+vDHfk0ebo+DyiKQQemhZ
	eUPolVLYTyzdMjtW3UxCetZ1SZA==
X-Received: by 2002:a17:903:2f8a:b0:2dd:c100:9440 with SMTP id d9443c01a7336-2df69e1c9bcmr22245615ad.62.1790168392855;
        Wed, 23 Sep 2026 05:59:52 -0700 (PDT)
X-Received: by 2002:a17:903:2f8a:b0:2dd:c100:9440 with SMTP id d9443c01a7336-2df69e1c9bcmr22245375ad.62.1790168392284;
        Wed, 23 Sep 2026 05:59:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a4997sm10096055ad.27.2026.09.23.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:59:51 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:29:45 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: hawi: Add base MTP board
Message-ID: <20260923125945.4r4gaos5jt4eu7ab@hu-mojha-hyd.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-4-e41473b6298b@oss.qualcomm.com>
 <b35858f4-10ee-43de-a211-3058eec6cc2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b35858f4-10ee-43de-a211-3058eec6cc2b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LLpMoB7SfYFAfQnaF_zR6tH9cogGqNl2
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3cd49 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Iei1FJZFuuKpNgWPBswA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX0WkyMM5YuIfq
 ioGoK29i/1cqLWSQbDfB4iRdz+M0op14kdEgKfNUixPEKhkGn1b1h03oVvb9CPVhDveukDD1dJt
 BBCJlU1QGGfoyKeeVw/i4k9VOt2H1F77VNFnwh0GnCvhO2UFjHq2uucKKBYnw63lfMhAULLlj1h
 9l4VdwvFVfladhn/hx1NSdrkU3BGTeLxENBeBonUbmyjnOOrcKpKqaYAU8At9X5uFSWgS8KnE1P
 TiJ+5jU9jtsaV+Ya/pjUvbLxgMr296IR8F4hkCAoRUaFP9XGdZNhL6p1AK4qYWzz1GT2umJWyXD
 UVT/+mSbRP9u3ycLQkWV74dBhj1oINxjteva9LnTE5OVjqCgusAKZApHZpnPRKoww8QMYveyxZh
 35Ugmc5nBcJpAdMSCBWCDfhwDHzuIlfCLkej0QryqjNutGh3Cyk903TNKMMrgmWlmYic9V0JpJF
 7f9pntyiIFXXu04nYTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX1rTyxK42MPhl
 z4Y7heMpVtSVPpiUH19GN6lFpMBha4EnincftsMzdZusunx0mMUhxK4uUteDK0/bXJlxCnQQcRQ
 U8TWj99Z5fD3Dw0SOuNYjUB0/NbVS50=
X-Proofpoint-GUID: LLpMoB7SfYFAfQnaF_zR6tH9cogGqNl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On Wed, Sep 23, 2026 at 12:42:22PM +0200, Konrad Dybcio wrote:
> On 9/22/26 10:18 PM, Mukesh Ojha wrote:
> > Add initial support for Qualcomm Hawi MTP board which enables PCIe,
> > SD Card, UFS, USB, remoteproc subsystems and booting to shell with
> > UART console.
> > 
> > Written with help from Fenglin Wu (added PMIC), Palash Kambar
> > (added UFS), Matthew Leung (added PCIe), Nitin Rawat (added SD Card)
> > and Ronak Raheja (added USB).
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&remoteproc_soccp {
> > +	firmware-name = "qcom/hawi/soccp.mbn",
> > +			"qcom/hawi/soccp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> 
> SoCCP on by deafult, please

Sure.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
-Mukesh Ojha
