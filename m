Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906AE4570D0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776636; cv=none; b=gGnzwMcAofgEjcnkNFUXAwiDjFR3LRymjgjSAhJ1DYbUK6OBZ/vstDYCJPo4d1NOf9bfLuV9KGeZbujSdMcE0DGdr2RBN62zj8lxFYCFKu5pVw+0tUkfSefvpJFwOZc4ZkPZsjQhcBN6CTY5ujqYw5PqHEqJAIFYLwCF/+YoH2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776636; c=relaxed/simple;
	bh=oS6kmuwgfDj95lMaWeSfrxYSbJkNg5dusu6lI99bMG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJ5rUra8WI2A05ZAxDABAVJzKZy81TJZlO0OaTFzJtHyJ7FSH3GrvCkUV1DitG1hlbmroe7vS5qY8eMtJc/lw2y0+Nljp3Pvisw9AE24sH3KB72t7+q4NczgiExbA7Od/LGUZfBSyCJrXM4dlNu/YxSrUgsJjlAJ7wwE1ZsblCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+V+Uc3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0GrazFn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+V+Uc3b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0GrazFn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bIog3020892
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tJDqJTCqI/57p+zQssr36qnZ
	iecBMtZIMFQgWWk9P4Y=; b=Z+V+Uc3bFR7qMd5Tlzkta/hlJgQtLWAkUx8cYms+
	YAVHcbGGRqAP2C+adpTdT11lJzWKerA2GktZs8APnYAbRvwp17vwsjyMrqvJDwlW
	YYBMljWaKfVqwkc8X8YCCivb+RF2JKmiPS3BxCPd6KyImgtudaWGso6Mbt8Mihoa
	h3ZcJpY8zWQQHmToMAtcJkteuhuxn3kkrEMsUhSz+Xh5lEtC+umvK1YBL5R+U3Nh
	7sNa+u6KwdoG4uyDMdVwORV01WLDGq2sQuNlEf08MtrArngLkx47XEKTNGEwZ0/+
	Y1lSuC7rzgyrvXYqpun7eXNWuPpz9kcM+KsZdtIa9fHhFQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw20fxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:23:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53033887f50so26307871cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788776634; x=1789381434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJDqJTCqI/57p+zQssr36qnZiecBMtZIMFQgWWk9P4Y=;
        b=T0GrazFncpn5VpkHmdaNY+Au5YQmRHnXx5xS7h4XfEPTy9ei3cQxU6iZIRVISlM375
         oerQoKnuvCEbsDRSTb9eqgzRp3DyQEGWeVBjXzeWBNo8pWRbYpwxn04Wo+2tuU2dbR0P
         SwvlZgRvcZjh9bQp+URAxfWAyEryhhkWktHLWuKtx56J2vXOrI/jWwN5upoSs98BcPNO
         Ir80Ins1LZaP2QVwR8fzcUUyoJW4XplUrkl1ajA8156/D1lXQRaPfXpZJiAfNocqSXKW
         zZwJ+tZgc9b6c2utQdxqBdL5fS+iFYwVI8ItRxXQeEO8zaTZO49pP+8m8UCH9fHlzyVF
         B3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776634; x=1789381434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJDqJTCqI/57p+zQssr36qnZiecBMtZIMFQgWWk9P4Y=;
        b=B1CXs+vFe8rL9zgpxdw0wLd41E0L4Z/oJSwz0ken2DRc2OZzlmfXH7C0JfaXfmmm2I
         YEQ9xq2B9qP765ZHGOeMXPrMLraBZpVkZGYtufUUCYmj17lwZe3LJ+hfrV4ZcEnSYLzO
         F27OJN1ABTmPYF1PDR0r+g+KJaf8JcXAZ1Tr3Fdm1FxjRTej1uGp2Hr7PxkRN65thgmG
         bq6Y8bZ7oVpfsB4zzexL6vbtqbKlAMnnK+eRY4eRkAeJ2Xa00mMvYYNqPkQ0KNCmrjRe
         VTqw9/ELAjRIz65feymToTYWwmKrj8it+B+Otb7WFMkxfYE4fIgSIL1AG0uUOo83cGg9
         vDkA==
X-Forwarded-Encrypted: i=1; AKwUvBwGTqc6sSjodOFAj3nO9u2aueb6v8/T7SY0JBaq1snDuenmU6DwE3qbMd3KJ6WKyid4vK9qd0s6QRCah74=@vger.kernel.org
X-Gm-Message-State: AFuF++mVoKGAYQoHZvbS97H+hNN3Q5wzQpwmg6GyHqi5u/CGMWiPnOp6
	siX0z+k8pVCngFr7O3D9CxaHoHNuMu6cTrYUZESFdTGL12lok+rEID1p2fpgFWdltKlCIRJS0Ve
	zF5ofYXFDSXNmJc9JsXpGzu5nwkw9r5jypKBOdIwkEKorW8LlWcEcUhF3aZj8VQfJTkU=
X-Gm-Gg: AYBFou2FplNOQTuriyiz1EfJDwOORmmpZ7Y07gJ0EPEX06tkTzeej0sYpp8Rm1NJ4q1
	dPFGZv1Ro98j5DISd2OZp60Yef9fTIZkXm9dtyX4pmzLcDinTzldDtiS48hYTu5nnZrLDQjOOwc
	IV8Yx3JEp8H0WtdBuOFyyQAqDc9zeODF1OevKDmDozfUkfp7cCRBBKhEwKx0xKjmOFvQ+hy7pUX
	T3Ovmiw+FinEGwKI5qbAVbxTFllqaVQhAlttIyWZX/qRnLeC/zY/A3DzNIEX/N//V/Cz0N5nn3I
	Wq0qiMLeVn0V6SgO0eUzVU5GXskz0QGBfri+Vn+wbS9FVzGEHHA06ZH54fnXtl7Y8SfPtPU4DnM
	DEvlRBo32gWr0yg==
X-Received: by 2002:a05:620a:410f:b0:939:112:d526 with SMTP id af79cd13be357-93980361ca2mr2334915885a.18.1788776633745;
        Mon, 07 Sep 2026 03:23:53 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:939:112:d526 with SMTP id af79cd13be357-93980361ca2mr2334908885a.18.1788776632956;
        Mon, 07 Sep 2026 03:23:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm26488749f8f.8.2026.09.07.03.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:50 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:23:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <ztw6gups4eji3jw33fdcgikrxx6o27glmuwfmzzo6gghzgz6nk@e23oq6d5rb6c>
References: <20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com>
 <e2b0e9c7-c14c-4a93-845a-50a902c6fa09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2b0e9c7-c14c-4a93-845a-50a902c6fa09@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FhH6C1M0sRtFE-p2JoqFvl8as7HuiOyP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfX8tiMccHmPbjh
 7TYGaBsMNmF1yR4YnpM1g0LG4MWAwyIjwJEdHUOIFHeuCD47aU6fD8L54z1vW1u4QWCH2n0YMI/
 t8qXKAZVMCb456yIPHLidEnZVWScNGk=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9e90ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IQIXi7P2SUzvV5KgbDYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfX0GoJKgQ7hhQP
 NL0+x5e4qInvbS0VljQ+JeIeBQlD8xHiFHlmGFQzQkFSCCxW1c4T6xJ1a5o0chAm5xT2qM5lWXE
 ZvyWzomDOyeHQZQvzreM6YWjXNapMdll1B7dLIKtw1nzedttriMO7xmittCXwxV5FlVwZ7guYog
 8ujcFBsx8FkloLUzvzUfO4Nz/v+FIlG+D6Yn/jm6N0wCPiFoFVPhtH8275Pm/ycjsULJfy1yj92
 nXyu08w3x/4I7FI7Vn5D0frVthC6hA6EoHWV71PKqis8N8e+3KEjWhWtQUOySX7My2GouyJ63rP
 qUEpXpx3jxBnX3E6bBV7SxjDORCB55H2lY77DQcqnLejVTbnLv5L/u3F/QGitCkcqGNhQWO7dW9
 LtWL65jcDQaYM6bYaRJDe+nP9uH29MFmmztGO10PFkJ+r4QhdR4mzPVxYom88e+cL48pLKq39ZL
 WaqgJbE1QPt9srB88jA==
X-Proofpoint-GUID: FhH6C1M0sRtFE-p2JoqFvl8as7HuiOyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070113

On 26-07-21 16:36:36, Konrad Dybcio wrote:
> On 7/21/26 11:30 AM, Abel Vesa wrote:
> > Describe the glink-edge for CDSP and the FastRPC subnodes for both ADSP
> > and CDSP.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > FastRPC nodes were not part of the remoteprocs patchsets because they
> > weren't tested in time in order to be sent along.
> > ---
> 
> [...]
> 
> > +				fastrpc {
> > +					compatible = "qcom,fastrpc";
> > +
> > +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> > +
> > +					label = "adsp";
> > +
> > +					qcom,non-secure-domain;
> > +
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					compute-cb@3 {
> > +						compatible = "qcom,fastrpc-compute-cb";
> > +						reg = <3>;
> > +
> > +						iommus = <&apps_smmu 0x1003 0x80>,
> > +							 <&apps_smmu 0x1043 0x20>;
> 
> nit: the doc specifies '0x1063 0x20' etc. for the secondary
> streams. They are of course equivalent with the mask

Sorry for the late reply.

Will use 0x1063 instead.

> 
> [...]
> 
> > +					compute-cb@7 {
> > +						compatible = "qcom,fastrpc-compute-cb";
> > +						reg = <7>;
> > +
> > +						iommus = <&apps_smmu 0x1007 0x40>,
> > +							 <&apps_smmu 0x1067 0x0>,
> > +							 <&apps_smmu 0x1087 0x0>;
> 
> Why does only this one get the tertiary stream?

I'm told that it is for some different subsystem stream which shares the
same address space. But looking through the SID mapping documentation,
it seems this 3rd one is not available on Eliza. So I think I need to drop it.

> 
> [...]
> 
> > +				fastrpc {
> > +					compatible = "qcom,fastrpc";
> > +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> > +					label = "cdsp";
> > +					qcom,non-secure-domain;
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> 
> also 0x0c00 @0 I believe?

According to internal doc, there is no S1 compute for this one.

