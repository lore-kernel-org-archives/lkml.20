Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259EB47CC78
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200563; cv=none; b=NhVBJFsieNX5sXXIHqOn2U0MrB2Bmakq37MVsYla96+CaIP6IQpwqdM6OOP5K4qgIWDV8euPmECGKOEzgqjyO3xx4GSYZfIEfLD4jnuPD2vi8BDB8dNkrEJak4jjMec50VdcctrCY44pYh5tjjqF7Nt4lym/tebeysbiDDu33H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200563; c=relaxed/simple;
	bh=THs6bx1IoAxPAp4DnNJHxSRnux00o7DADNSvNshdIok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLU/Nll9JLF6hAcZtmCPw0/aChDK5NKTyNI6Ogcf6Jgj75PjeeOilU3sRBY2GRlu/qWlGt0mLpWp7MRlCCrDNIHgA15vHO6CnGXXnHJEv4W0L2Qc78RG4IwqOFaYKGTPW3WfFDjGK2ZDU4FmVd+HoJQF7zsAh6wzkaY2ccLFDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDTFF7Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gM9/kq8l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDTFF7Jo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gM9/kq8l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695BU2fg2753891
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 11:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=abOvEkNlOA0Ylyy+FBc9VdBu
	BuQsp2/yxfH7U5b4CZM=; b=SDTFF7JofAD43m7RDcTpULyp9Mjv9kjidR4NV+J+
	kt/NjeKtupq+LATZ76WXJty+h9l0BETIflX0cLmkmrRn5lWHp4j7/76P+5JzKiyx
	iX/OEWwfcaPKOu7cAM6GyCnicRC+OwqbPM6npK+hqxtslEDyR4D5A+zl6Nq/CW6n
	cEXdyrvR7S0P+7kfXsJl2thpN6bsboPcFiXWUpWpXi1d8yRgueOnZ10J/nrefgW5
	TIQkLcZvCgmbgO/4zgz9+ZXh+/mJ1I5s8WThKbAy0aegwFGyL2VE4SIlaJOfgtXr
	B16vFGQ62YB3nYL0KbuBd8SoXQ8JgjI2UxyIKTr9FUUDCw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u409cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:42:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef5fd7934so4738032eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791200558; x=1791805358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=abOvEkNlOA0Ylyy+FBc9VdBuBuQsp2/yxfH7U5b4CZM=;
        b=gM9/kq8lbLDScQm7SqGalgR7zhp+SGblfKTmssh14OKR7R0sK9vqTVgfK5BH4ytdbE
         SsR89I+SpPkyUuc24yZei38HPMwK8K0DmpMw0gb6yzkW2B7tMZFdb+z92Y8+JzdfFzVM
         TUEKTntLogGBT/Auss7RSqd1YvH3uojqzZy9SUJg6KsWtTpdtxra49tmTbVDTLnxBAp6
         KVMBhkTHi578iF8gv8PMsJZSr+criIayU3E+9UOWq+vPxRhoNDnYkyEqbZh0V23Bhyy/
         LKhh4T0bZd7IRXSeHPchqTrk3WIKHkghnEUjKEvBWjqwgEkOxusQh7n9xEahb6PKzsd5
         t0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200558; x=1791805358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abOvEkNlOA0Ylyy+FBc9VdBuBuQsp2/yxfH7U5b4CZM=;
        b=dmuTnM0wk0DyTmhiMgTe4QDDdYW5Kq2w2aVfqmdHUWUknj5d+FVDSLySTxIhUZUXQX
         plzdqZTlTiY53dDJJmYaj9nB4kFZWaMX2cxvIZEGENvudNvofo7UQuNokGp2dKT/1tNP
         0xHTAGRoDVJtjw2u98gRDWbwlssjqXytqnmqjJrnsJUI/vo77HClIJCMCe+w0ir0i+r6
         7Q7WYfUFcGS+pho46EIk0jOVXvfwsnpJMGXMny4PF3Fb9hImcm570p+H4SyCq9N7vtjJ
         oroxdpVqTNk66EztljY/Dc4AUwZVNALqfvdazTTfiWKzE1XNC2g/nGbIrXi8wgPS6aX2
         JAKA==
X-Forwarded-Encrypted: i=1; AKwUvBxEbxWccmJ8hoz18byHmzhpO16y9if72M+7TnS6Itwg+x+SnOyfv/HHvhOPvzkwqgdGXoPlh59g+LE+LhE=@vger.kernel.org
X-Gm-Message-State: AFuF++mOyyfciAv4oSmq/tSvKtFPQDTiIbyEMvaZNMhhtsKJ4h6tjNG0
	5Iw9aaejpibSQFZ6ElFbJFd0rq7jG57GqXQYyQ5Ge4ms9lVv2mDtatODsCL2afUcxpRDEj8RnxK
	Wz2IzvbYM7tMpcSWg5SxZzhcI/FDPsrGdmuJlIVASy7wh1Zh94BYxNVJckUQvi3U74po=
X-Gm-Gg: AYBFou1XE4ezTXw3FwvaIBQ5kS+DANIjabLe6Zk+SQSoGMJEdpz6+FIDD3YsguigCTd
	UVVsxf/DWcNNqKZBHdLdfuSIqCtO3Y8L4Z3dAfLZ6TbXM+9cRm9RUCFLxVQm3OmGxKVqvhwMjQv
	kanU4aufOm/NUah6AzfQlXePTykmAihjMMTL2E4RISpwCW1WYiHoiKhrN4F7ZF2gsUtOEjUB+SO
	6bnX3rNyHt2QPjInG5Z3r/Rv+AbYVl3UBSUYU65WIumevrClAMg8HkkvQYKSbR9aEMgnpd1vM7O
	1yEQWpgjoRFoo+3fN0sdsfUVdzTGzn7jV+3pM5BxTZWg8CRULZ4kSb1aWGn6m0CoRrAwFZrnEXE
	30A0SFvYjxUppnsE5WMfoXh5zN0iS9Z92HN8YNrO+EDn77+tgYfjaDzf2qsdmXS5vQ03LPZxlVn
	+ZL9hJRdxG2ZxicXlFW+M9dQYx3oel
X-Received: by 2002:a05:693c:8810:20b0:351:165a:baec with SMTP id 5a478bee46e88-351165abed5mr8555591eec.37.1791200557456;
        Mon, 05 Oct 2026 04:42:37 -0700 (PDT)
X-Received: by 2002:a05:693c:8810:20b0:351:165a:baec with SMTP id 5a478bee46e88-351165abed5mr8555544eec.37.1791200556694;
        Mon, 05 Oct 2026 04:42:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127021d1esm14466025eec.4.2026.10.05.04.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:42:36 -0700 (PDT)
Date: Mon, 5 Oct 2026 17:12:28 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <asONJKiT8pbIulWj@hu-varada-blr.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
 <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
 <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
 <lfs76pvsdpkkle3b75m2ez75x25xjqjkgbw6kkaf7rxqrc2plz@7sekrxlnqcus>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lfs76pvsdpkkle3b75m2ez75x25xjqjkgbw6kkaf7rxqrc2plz@7sekrxlnqcus>
X-Proofpoint-ORIG-GUID: u8buImEIrV3E9JjixCEhLqahTjTEkz8E
X-Proofpoint-GUID: u8buImEIrV3E9JjixCEhLqahTjTEkz8E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NSBTYWx0ZWRfX94kTWi1+dZ3k
 Oef7heBj350MrwGO7IlNyKen9Zy7YvsoAjynVfyHTe4ZrdKBoGqnSJxOtoOfwL6Efsk7z00tJL5
 8ptAoagwNWFxdZf3Z58eUK9oUtHJ1Vc=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac38d31 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jxoNFKAhCVCw1AryeQUA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NSBTYWx0ZWRfX8VCuSg4sJNSt
 9zuX3EYsAdUK5vsFlZcElrCCPruU6BFf7i/IfpRJdnQKDDlCYLL9Vn+5bxLZls88UGDzSbbW2pk
 Zgztq1cXoK9EPGqAJzqbim85//VWJ+gwv97UkNzPrW5g+qy/pTeWnQvCro47IJJIdzHTxjrWBOv
 J6v+SzxFjOteaTYe6Xos447i320xxshz8r5jW74X7ASgjUfH3pSGpOqWla5FRbx2RY+XU07fnzC
 /G6wXPWlXgoHG2ByS1SMWTMEGoZpaMBU5up12xV2SVddfMnyo7pBRneS8hhnRAbI5jugY8jLxM0
 foY8ZsHKZd0u26CD81zy4FItDHbEFx8Jm/yKwqN5SkeAObQppgTV1sg+rDk9QkfRBb+2cWmsrW4
 2N16dnYnYl8yzskP1GbCN9EqroYwB434t+dw4vRUSPZlRjGwMT4OLNPU3Ng+37cl72CHrS7Vx+h
 nck34w65rsoh4LWwk/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050045

On Mon, Oct 05, 2026 at 02:01:48PM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 05, 2026 at 04:15:12PM +0530, Varadarajan Narayanan wrote:
> > On Mon, Oct 05, 2026 at 10:17:32AM +0300, Dmitry Baryshkov wrote:
> > > On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> > > > Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> > > > on this SoC require a dedicated init sequence and override parameters
> > > > before they can be enabled.
> > > >
> > > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
> > > >  1 file changed, 62 insertions(+)
> > > >
> > > > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > index b6bbf2b570c7..8957f208bc51 100644
> > > > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > @@ -29,12 +29,15 @@
> > > >
> > > >  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
> > > >  #define POR					BIT(1)
> > > > +#define ATERESET				BIT(0)
> > > >
> > > >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> > > >  #define SIDDQ					BIT(2)
> > > >  #define RETENABLEN				BIT(3)
> > > >  #define FSEL_MASK				GENMASK(6, 4)
> > > >  #define FSEL_DEFAULT				(0x3 << 4)
> > > > +#define FSEL_24MHZ				(0x2 << 4)
> > >
> > > Use FIELD_PREP, please.
> >
> > Not able to use FIELD_PREP, getting this compilation error.
>
> Sorry. Does FIELD_PREP_CONST work?

Yes. Will post a new version...

Thanks
Varada

> >
> >   CC      drivers/phy/qualcomm/phy-qcom-snps-femto-v2.o
> > drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:449:53: error: statement expression not allowed at file scope
> >   449 |         { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
> >       |                                                            ^
> > drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:39:23: note: expanded from macro 'FSEL_24MHZ'
> >    39 | #define FSEL_24MHZ                              FIELD_PREP(FSEL_MASK, 2)
> >       |                                                 ^
> > ./include/linux/bitfield.h:136:2: note: expanded from macro 'FIELD_PREP'
> >   136 |         ({                                                              \
> >       |         ^
> >
> > Thanks
> > Varada
> >
> > >
> > > > +#define VATESTENB_MASK				GENMASK(1, 0)
> > > >
> > > >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
> > > >  #define VBUSVLDEXTSEL0				BIT(4)
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
