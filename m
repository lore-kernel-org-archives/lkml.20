Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02D549C4A7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340409; cv=pass; b=LlMH9cD8QgW1YjZqiJP0fYsT95ApPU+H3wrdONMrZdtCH3MfcxAWMEyiyuEibNDbeH73K3vRuLF4ASVygrwc+nM5F8VoEdBkoPrWCjiMY8xKWz6wpreAfrovtCYxI9frc4EV1sscSAhl3aciDx4agO/WUpgnZzHhwcCii4Rfg6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340409; c=relaxed/simple;
	bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMBqbEZZuFJ9PFSPR6ptFCOorklhj63VVMq/I1OfSVxe2KVMaVSf8SFISxvqvMa8E9qa1BlgR717bLOtoDrfU1ENgzbYEcFrSppElmBqdn3w4RVTVXrIBQ5+I2PBrOka3LDznkFebnWlrIafa2aUnkK+XYRssXabTpqsD/h/+e0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYRND37l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IdAF6F8F; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYRND37l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IdAF6F8F"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5Iu5n600599
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=; b=AYRND37lW8jWqGFV
	EMTeyG+FZKnEy5vL3U+fYits/0aiDIdPkPQkN9x0BSY8KieqAxlqH+FKJz/ovMl1
	pi+PW955ABRDkDegByWGk5OQwdAm7J0lyDupnHk8r2q6Q0wEuetM6EPfDud8Vtg+
	lnvBgp+TZAEux1kE5J6RJ4GYEhE1WxoVknRktqa87lERES3NKZD6FEymRfNyrxut
	jiw+M63dUTkdK4yjXpqbpbg4dQUpBIYjYUrKRKHKzh4LnutRe03FEDwTlzS0ndoL
	1oaAr5u1jyp3H20NIW452jfWhlhC6tML+hYaMhSg8EPIGEdrRxJVTetuiJfXsDWt
	JYPOhQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsbbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:46:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91431adf55eso12103266d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790340406; cv=none;
        d=google.com; s=arc-20260327;
        b=lwZJXtS16P/dJHumROcBppakF04t5bony4xwy/fq1KnP2LCP7YNaJN1GjZx2KM1NSN
         W1T5WHES7OxV+J90aGwU+ybxh81R4K4E7yNEC/6LVbwCRX4slM5i9i2UfujGPaHffk6h
         7M3LzeghliAoqujo0d+8mWj6dBNhbgae+EANjy80+47ciBx/uji7YY7t0BVvXhdTin/h
         1wxEwvTy30udnl2q9WrVMva+c+B1Jgp9QCrRnNt+XH12IXVzluDgqLYxDN5fz9Q7jwOz
         eUJcxjVEElXOP7fAM0kB0vw85Emfe4pzl4u0LSdLNawST2PSonTs92LisFxVH3vrfpGD
         KFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        fh=dSEm8fIZQMfBZt2+WB2N6bmqSvsmgGwqv+MZGQ3MfZU=;
        b=WHSNNNfPpuvMizBW9x0n1jo5hhxjVcbgb2QR6yawxLSrLApttxhtSERo2+UwboOxc5
         7pufu66XvQUAXdrs7gYx0KdGB0HHMBe9zQxteUsqo5QLNRHPtnyPTUe9w34y/7L1KLeH
         VhgDuklGl89YU5ftEZcB8xn6UmbqLkb+g98q8pyTnKazvoc97WtuY+GDJQvHl4HCJz1G
         LoHfoBC8JlNS5wzWbAJLzsMwSIrvcKLoC4UfLBlR3wwCc2bozqDfL8WDc9Eboz0PDVc9
         Cs+X4Brkh78HpPjuvNsebs9PSBzr419M2O0Q/ksmZuc5sNdaPoNSTMEQ6fmQb8STtv0L
         Zj9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340406; x=1790945206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        b=IdAF6F8Fs86CVas5ZLLs8fXxrvk9axccj/nvQ2CeCHhgGi0P1PMg+NmFtLKpoayme1
         /8fzYOGqF4m8wVmwaeQegbAW4ffaxADss1/Mv8jbsY8l3Tt+CkxAY+vl/5+DZbOk3K3r
         rZabjgdO+xzQZcswOP4TY1Yr5u0gkwJZ2C11AM/TGXQkHuWmVKTcnFQB2ybR6xIy2uOR
         FdArF51qDV1y5kQGZPtmxmSExHeyLOWr9vuCmQwuI1gjYJdHWk3HKHnBQ0TO6jvffYYo
         3E35uMVRy15lwlyEPT+4zhmlLmF5ybqEbMmQtFQF+GFVGNTCQ/3GkwcEy1l4hiSjMtB+
         Ne2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340406; x=1790945206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        b=j2Y9J10xKBnTH4W3EoVWt/BHysVyY/pJy0ruH0IC33udPstucYnuRocRY2Vprwo/eU
         BmH0lPWnbbFnqcz6YkEywG7sV2ImU1/OSTBdEThXIeRRNYtvzCJFi82Sof/Fo+VBee/W
         TxVUGuulMubE648guNbQ8o5zsiLMIYgET5w4hbWd0C1xxMa0rkAcCDlAgfbyi5URDXij
         VwFsAlHZkhUEt99MM/nL24+SRh8qZbMJljqPR7qUTUxOwvYgLVDa6I3L3bQX+wyep66a
         eecpPihqNQFcPu1H3UsdDk3Ul3MeXWZtTlIxtb8Jq7qCDGppzeWFy6EG9cuYBlCXqyNO
         nahg==
X-Forwarded-Encrypted: i=1; AKwUvBz8d6HGqxiSTKC3UelwbtRryydv32GVztLFTdD/YIn3zziNyjPVwZ+NWnMsHfAOTXChD/IJb20BjoeatvE=@vger.kernel.org
X-Gm-Message-State: AFuF++k/+eHhUQ99NN78y3JBTzwF5l64b6wpZW74R5COVFhLYfJ/KMuq
	BTy4vFob1pOgQzAVr+v8kW/dKB5bRcWl1plUa1Vz/nV4CE7hxcAC/MSXT+x6a8T2dMyaresnuBV
	Ky1fqV9aW4h5fbzsIVaSMKqL02YhdmhPUrYZN1hMo4Ylhrq4/2jT5EcLe/BYVY3elNldm/jqg0u
	zQd53X/mD9vtmm6a6QOkgEijNssFpA2dSJplkO46w3dA==
X-Gm-Gg: AYBFou1JwJiBNZq6Zx+zQCqNfCy8NcU5uUqc6fVPuXSNskuuc1PpOkF0FwdJB5YWs1w
	APPOPqfkM8ahcIVUpaBD2U+cWDNSQWS/OrxH7UPXh05PbXc394GCceSewISyKGTd8dNfywPiCg0
	MxgItHtQLuSfCSwuuLH5FMHaBGUprCMshYVFp281AyjuneN3dnzdhxjny3kw==
X-Received: by 2002:a05:6214:2462:b0:90e:9408:2fc5 with SMTP id 6a1803df08f44-9142f63ee23mr38807716d6.5.1790340405814;
        Fri, 25 Sep 2026 05:46:45 -0700 (PDT)
X-Received: by 2002:a05:6214:2462:b0:90e:9408:2fc5 with SMTP id
 6a1803df08f44-9142f63ee23mr38807116d6.5.1790340405276; Fri, 25 Sep 2026
 05:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com> <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
 <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com> <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
In-Reply-To: <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:46:34 +0100
X-Gm-Features: AclHuK9M9IbbCEpkXjmHN3eWA-5m3q_sE1ucHvnsGGxug-EHSGOK9v70zRPAC84
Message-ID: <CANyhwx1EG=2FyBm150wrKpj=kQ1066iwZWndx=ZL3BKNoZUhVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7QpSWnU-zv42YTzKfq58VRlGyOaKqKTL
X-Proofpoint-ORIG-GUID: 7QpSWnU-zv42YTzKfq58VRlGyOaKqKTL
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab66d36 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=nOLRoRm-sisVCJmKiMYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX+zOXabc1EjUs
 57NF0ZO6xcCpHR4PN59zGgEJjgWiOs5g4QY5ppIE67gRwJb8E+hQ+hpwsRclHVqQEDreSsluotV
 7jK882GMsQYNxAmddYml1W60dACQ4Zs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX4oxZI11H6Hay
 uk3Z7ZdHBpOyt5Xve30F3WSaAOj2dKeYyEyb2mg3TaIid3u2KmJ22bEPZZMpigxypJqstACo8Wq
 aZD2MUE5CWc6hifAGFga+aL0z9fZnPDoFioydU0q3nulRprPpV4HTtFL7pju5+2c05FEFj5WqoN
 hYjBgUzoDij2X4KnuDt7xwdkGwFTor0L/po0yPg0UuxWVnVIZs081XRAb3+dFZE9ahNxax2OZFG
 YLqHAOmAmtwPDfqAa24Lw6al4UNVwnpzF3v6NZexNLZe/vpN3rERg5ld0XxnDtDyIlMutQlTRc2
 Qzu4WBxH7+V4zGC2bi78VHnPPW1i/DNfcBBxcYpKVGnBANs5O4s1RqI9i0GlExHlF5nbppu9YRK
 8rHKad+173LiAQBLKbvtCVZVPM354Q7RV27VRlmIj1HNbnVnIFI9WNhEdxTMU/NpKgjH/wu+Uuy
 7KAP9x9uO+eAn2MU4pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250050

On Thu, Sep 24, 2026 at 4:58=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Sep 23, 2026 at 04:03:38PM +0100, Youssef Samir wrote:
> > On Tue, Sep 22, 2026 at 6:24=E2=80=AFPM Juha-Matti Tilli
> > <juha-matti.tilli@iki.fi> wrote:
> > >
> > > On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > > > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > > > +
> > The chance of collision is slim, but still not impossible.
>
> When you mean collision, do you mean node id collision due to bridged nod=
es?
> Because, even if the directly connected QAIC devices use 32bit node ids, =
the
> collision won't affect the functionality.
As in ep_nid of one device matching the nid of another device. In MHI,
that shouldn't
really matter since this patch moves away from using QRTR_EP_NID_AUTO in no=
de
assignment, but as you mentioned below, it could clash with TUN and SMD EPs=
 that
are already registered with their ep_nid.
>
> Also, there is a collision with SMD and TUN endpoints, but that's out of =
scope
> for this series.
I have not worked on a system that simultaneously uses different types of E=
Ps;
only MHI EPs. But if there is a real case of that, we can move to
global ID assignment
that includes SMD and TUN.

Thanks,
Youssef
