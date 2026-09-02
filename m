Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C242AFAA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343520; cv=none; b=IZu4mVKu4uK9calhKGKWIH++6w2//8n4b0OxMHita+oRvdXJ4dNjQbCia0zXp/AEiZ4tmLC4jfSMZHg+jEwr5lL3fDEWydtlkgLQuCI8aSYiEyv+iawat9De6W5KS/Egjj2sqeD7eZnkgATh5ISZQr3hnDnZHYTAPBTKcQ5Djjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343520; c=relaxed/simple;
	bh=fGO4RplatNuXpDwpIkS3PIxnYbi9rKjtyM7If6v8PbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yi/10yoxopPZ2afzP9o2yd6juT0J/swFgb9J+Jiqi/+Egr8wUeFelWmWQLHZc89se2V7uD+GOEGGZwP0DxAVv6F7p2h61GQC+HK7ZGbrqLjDR1URePL1BGKKXCZLh1byh69l3uUbdsXkrdUVPyX7J4iCMyrN6Bd3eP1fTNISffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tqv0yeIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9U4a0Vo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tqv0yeIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9U4a0Vo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829MtCC4141328
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UObzRMWFCbP75V/KjEzbft/x3L2cCcud32HQTacNGec=; b=Tqv0yeIiPRwmmsaR
	Pw11uZO2np9Mq/XrQw83Pq+4k4Eaey5F9mjwJ8rnWt0AxtNGDL//z6vG9eIJayLa
	qCIdSGLrHuv+NsmMaJKOoEFyrfg9zqNeCFPlLVTcfZtc1OA06Yc0x9ammn4AfrOT
	LJjvcqP3iqjBHrYYZaBED+b9/3n6+zvvgstSgE9NsPa74SatqHt5VJjtnQwSFJwi
	tpFN1ox3O46aRGygmArWcPK4frSKk1anxGM+S2PwBPlQh5+XRt3d8IgINo1xoxXK
	qjFz4EWj6iAcq/zaNIfb6BGTKPliIekVaA2V7o8cTCQgYb4mat/cAKLQPuHs3GN1
	0JvExA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ck9n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:05:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1101339a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788343518; x=1788948318; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UObzRMWFCbP75V/KjEzbft/x3L2cCcud32HQTacNGec=;
        b=a9U4a0VorLxR7r96Tohbt/wNBKzYKhNbw47uReDL2CXE21gmvnNXw3sh3dlfPqociK
         L4xN8YuVDYnIoh9K6D/QZpLwQ4fOxCZhcAyZYrE1fkbUsw/eSFyEqv6Pxj+NqPcqLQ/W
         LZeqeRTN/SeSy/6mbvcCErFcsSd//KqZF+qoQsSLrxOltlm9n70ECvPWyGhwVVJWuo5S
         G5ZrrUxp9qVi9u1CY3Rybgy12/eWRSLBXScU2uh9+hFHbuM/NPvqM5u19LKE6ZsAcKXs
         cgFxd2PlXKwhz91e97CV+biZM2/dcFJsuMBWsSHekgqaSam6huNvpTIQsQ8LLUFw+bDJ
         LJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343518; x=1788948318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UObzRMWFCbP75V/KjEzbft/x3L2cCcud32HQTacNGec=;
        b=pf/R/yPKW2gsjzMVynRUDx4Ehny7SFhjsHOwa/qxJqmfsGRAqNYBz64k5IPv1svGxn
         F5OAVNCJ7/mOCx47rPovIVYnNzCWe/6wZuNvaF4CgmRPTnZNZ8PLbjTzncgv7IpMoa0q
         cPrQZ7KKfNft8F2+E8GuTFmgwaF+iCI7FeuYj7H5xXik+wgMBUGbni29/3d14BuGfIg4
         +OLDYfob+vQXdYbBtVMQjt1spIWmd91ocVjnBYBd194vkIyCibRbWqkZcQc+zh6vaa6P
         9oJZJL/khWgvuWB0jyQrcF33EvoK0QAy3DPSaIdPU8p0/2CjKM11PDJHmOlB8uIifoSV
         2ntA==
X-Forwarded-Encrypted: i=1; AKwUvBzOWoKICZ+GBEm2sfFFQ0d6p3cLmHD7LImvNdmRff26r4WrApPdpCAfiqcNl9Ruu+V012U4jjtrkO80yXk=@vger.kernel.org
X-Gm-Message-State: AFuF++lGaO/m6OTQjHaRc1pTHuReUNat4viYo/Nv60aJzhIj6JV24OMP
	PXaWN34xtd+4IIx9tzyQl8Zp6zgQaFIHc2QiF7T88mkhjoS+9zkxKs53JyX9t6htC7YPvEz2Yt1
	2Mv6s1L7HrCBuMwb3OLiX5CWGZaJgI0ITQzn1Cyk203chCqS3i8XNRhNKeHNSSCs+Vcc=
X-Gm-Gg: AYBFou35fSt04JQdv/jKoRegsN2JlVy9BDVclzQEZjhgY4ykMYbW3lEga+G8fddyeQ5
	0r+gEwCg1KO75XRlm7+DTlG+LPANHwqICQjjnumkmHGgJqPkHoR1gIao4PZiRMD76P5YIMhnTdY
	btu2bdx8Dch5gem2In0VAJynqzSDm3mX5JL/o6GfcIIzBtHgK9lz83NN47c8iWZqRVl07d+700a
	ftHg9MdHtUsWToE8hYqWuPcjBXm5Y1aeT8eH5eCScrhvfZ/zVrJQc2INaW31FgzqTBDZUKJ/AKB
	DwKP/i5UpfAz+HYQ8bOuG3rDFU2ni/l2QF4IaNl0UVOsEkR640JFiPjLHQkNLxOIMwf6KOWpCrs
	Hu8coxLrLY3gUZDzcQZhSneFw3ETKu2HdHDvC9/H7DG0=
X-Received: by 2002:a17:90b:28cd:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39aee0e6633mr5456120a91.16.1788343517797;
        Wed, 02 Sep 2026 03:05:17 -0700 (PDT)
X-Received: by 2002:a17:90b:28cd:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39aee0e6633mr5456020a91.16.1788343517229;
        Wed, 02 Sep 2026 03:05:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430eafc907sm5093202c88.9.2026.09.02.03.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:16 -0700 (PDT)
Date: Wed, 2 Sep 2026 18:05:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
Message-ID: <apf01nNGO-7E86J4@QCOM-aGQu4IUr3Y>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
 <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
 <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
 <CAPx+jO-q3JwY=i6P0K_r4OBie9bnPaR5kUm8+T8uGFq1oK9vFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO-q3JwY=i6P0K_r4OBie9bnPaR5kUm8+T8uGFq1oK9vFA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97f4de cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dbI9BitF8MENLqa2HooA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: xhnm30mBHTWEYrRogaZPdZle1h3eVZ0x
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4OCBTYWx0ZWRfX09qxoBxxbTfX
 RBqVByyMYCyD3a2K23qagb0M3SKFbMu9kJGB8SSuLy169xmTLxHiatbWE/U/W9L96sBzLdC4J1d
 0XLJzjT0nYnm/uT7/V9854VFpKVwe+s=
X-Proofpoint-GUID: xhnm30mBHTWEYrRogaZPdZle1h3eVZ0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4OCBTYWx0ZWRfXy1T15aJdgaN+
 82TXhTWaRF1al3ZNXzRzLEMXCI06b6JQKpYAgRu6oG6QLh1ZTPXNSxviPXRivjBgwlveCWA/joa
 a/FRpPIc/1utgbZ6A9/7kto3YKSLOnPtU2yLqT0vSU+q0hF7j2UguYmaBG9eCOnnuk8f9OJFdbC
 HUzksBshjd3OSDkSqCdyRTVgCjgY0VN3of/FMQ7gxm+WoC1CWSWVkbULpblxw7iRGdo2j20z8XD
 LLFTckEQRU40qRVFct0tkhjWb7LN1LRCwwAtUyJX2AxYWW8sj5gdCWMEgNwQd7wBV4zf3AaCWNn
 itriKY8wd8dpSVOUA7pyzNA3xWcShpdSy+MrDU7nnD6lMYf0YatMBtpWNNhSPIaUIJjxv/DX1QK
 Ge8eHqOIUjErwPqBKgvjDsFcBQp/l7Ew8R5gyaIQ0ltEdiv6dWOd8sxKfaW98rwx1Y4xKOT2VJd
 XW+rbr9cTfkf6bgwoCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020088

On Wed, Sep 02, 2026 at 11:42:29AM +0200, Ulf Hansson wrote:
> On Wed, Sep 2, 2026 at 9:52 AM Shawn Guo <shengchao.guo@oss.qualcomm.com> wrote:
> >
> > On Tue, Sep 01, 2026 at 05:46:09PM +0200, Ulf Hansson wrote:
> > > On Wed, Aug 26, 2026 at 3:55 PM Shawn Guo
> > > <shengchao.guo@oss.qualcomm.com> wrote:
> > > >
> > > > The Nord CDSP subsystems do not take their memory rail from the shared
> > > > MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> > > > resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> > > > power domain table.
> > > >
> > > > Changes for v2:
> > > > - Drop remoteproc changes since "mx" of remoteproc is just the name of
> > > >   memory rail input which can be wired up to NMXC power domain in DT
> > > > - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengchao.guo@oss.qualcomm.com/
> > > >
> > > > Anurag Pateriya (2):
> > > >   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
> > > >   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
> > > >
> > > >  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
> > > >  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
> > > >  2 files changed, 7 insertions(+)
> > > >
> > >
> > > Applied for next, thanks!
> >
> > Thank you, Ulf!
> >
> > Could you maintain a immutable branch for qcom,rpmhpd.h patch? I have
> > dependant DTS patches planned, so an immutable branch would help Bjorn
> > to resolve the dependency.
> 
> I am always applying the updated dt bindings to an immutable branch
> called dt. Allowing SoC maintainers to pull it in, for the purpose
> that you just described.

Awesome! Thank you Uffe!

Shawn
