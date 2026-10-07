Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226064BE456
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388064; cv=none; b=eBssgPO9fBF0dZUKzuWETSG/IpzKBSLDTjVEHwyzYIU5uXW+rGDN3mDeWEH+cb1JfWR4vxKZmvjOgxp/gK2E4WFR1QAqPgzW31JhMZ08oHBQFy7aW1+OKXGUPll+APf5T6TZtnos3HpuCHxcsiIgzabsePcNaRlC7EMqZo/3KXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388064; c=relaxed/simple;
	bh=URSPLh2bUnBt6WhRmDKNE1EsstWlz9OMjbqal72jSVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UARATbO9nCHp9H45agiBcj4h+y+bqhu6ny+l9hXLuVaqw/CfxM9Kjppj0E4zGSJGOAaM/IUZ9k1C2DxuQVpC5oinbUlj9jqEd3es4ev6bsypUOQ/hMQ8c9rTQKG3rkpTKtUBGSKt42BEdhdMa9i8ySAU5kVFsLBHG/C5agEk3Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YablL7o/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4JhpEt4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YablL7o/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4JhpEt4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtO1r4135636
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 15:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ON1POuxQT8oQUVPgZEgmjC1U
	LppcBaLaYzlRsmpMyxk=; b=YablL7o/pPESIa7r70OHWBAefLpbpsHZgghoj/sw
	bWPl0OF7H5HMj2f3weN47jO4AgwNJIv2oOurH70gAm31L+lyM9ULTguZNWHswIQX
	aUqbLqDlidSzQAs7hOq05qz1aGJ2TJzUkOrmcrCW/1MmYq1CkgeF45KOQ6ggE+4B
	VtaRG7BMRZkNUb2+8nuX0bx5aW0x5kKVd6AmcfI6PZ3IMe4uL7OB/V6rh6kQ6gGy
	jtkqdEHZ4Yblrxwb4Ru6RgHaKr+mWT4Jf2HuCoe9Vynwpy97y7qtNOaMZ3WNyQUg
	bKXLP6TQFZbirwSj4I4LX4h98th9ConX9nolubRBRftUmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr96gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:47:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso362986185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791388059; x=1791992859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ON1POuxQT8oQUVPgZEgmjC1ULppcBaLaYzlRsmpMyxk=;
        b=S4JhpEt4T8I7mDK9AE9s6+dnD8xmA6KEHLk6Uodq0C2qjDO5qZO2HmEAW8nl8uDfT3
         1k/JVdWuxUyboiB97nUQt7UNBjYpBRCuqQq9N3coxdn9WBOJ2SsswLVF+ZJ73LjryUNt
         74XLVJZQlA6IvOnCIqPL6Hple0wzyL8jjwZdGQGrCATd69Q/NJBJfh1c/pRWCrSfEpPY
         UIacOVJJco7QNNnrh0Pv3yKFOD+EOmDbiyyU24Px1+IOy+CPgJ106Y5fodw8smvWYJ6u
         S6fIuoInIHGwysypIL+OUVQpxDvJzNgylMwrLtya01g1xMeM152/akwmAtYywIsSFkCg
         b1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388059; x=1791992859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON1POuxQT8oQUVPgZEgmjC1ULppcBaLaYzlRsmpMyxk=;
        b=pXz7Oj8c3p0mtqNiz0fpe1gTl4tup+lfcSOUJGxor1MChTa0uvTbOPkdXIuyZ+fKm6
         u4IMxkMBFZnVMHI6WcozaUAy2liq1DuUZtIlmTVqpkl5F8lZsx3IHJ8i5KHbcy873Sa1
         8RP8gIF1f6LhovwOwfAOX74H46Z5jM4V0eTi+t+0jVo2gj8dCsY5/eLAg2w2/ZbKm+Y4
         PWb/GA4awI3fH/n0PHlH31c1MIBa9/Dldwn1knLmImb95Ny4jISwwOuz/snRJRNCfmtz
         XQ3SzRAzEMgnFM6m3JRav6x1xT75VRsFT6O2+xOV+X77Dza0Cm1SueONjBosmnNP6T/k
         0Ngw==
X-Forwarded-Encrypted: i=1; AKwUvBw0hBYwpAYSrXTRCXUNOBl87JieHbxAq0O8hfkItB0PvfEpO5bftNfO0ieTC5RRqrqkpJQ9vECBJso7J44=@vger.kernel.org
X-Gm-Message-State: AFuF++mJWX0CJdRgps7jXn2GspeEjuGgE+yqrAR5n4GOy5xXJaHNuakw
	V0mKRxzo/NuFhFUayb75j6X1A4mgnBFj+ESOUHowGUG8eYD43ONsgg35JKswjdf/6rAr31RZdF1
	zuoEh2d/nUUYJKqzmPjcAUSNtyWYToEBdMyBPH1zHrYa0IAQ/jXrIedBKFym0f3YcRkw=
X-Gm-Gg: AYBFou3C1/8Bgjy6jQ+GfNcWWzzrHEAjom3iC/gJ9kUtGVzBy2KsrKJpFuvXYn1tOUu
	jYgOOh00zMzkTR4AIrl6jzHeo+jJs/ruT8vIXMiBsEplom0HW0vkuO3CLqYnI4muxYpnfBYQ+BD
	pbXSC0URHkWfYTjAG3B2t04NAd75bBLVTcwkYuklTH/EFNlMTZGlY8Lx/LK4ySzpFgnDwZ5JY8m
	w/J9cCWx8tC1PDdJdkIIjDv23GyY1eiouyNf3BdwAk8vewnNy9FA1D4KTS4tJrKPdZkcx9M4yVw
	DFmATEJ6NPgrAqpy57RpqExb5OIzai/yPYgITUimspTD1uNuz0DEYrtqT3wBFbJA8Rmxb7rtDb8
	UEFlrxgi/OZsPBHlHGVhy7oSsMKnVST7C+UCpOyiIH4feEuGq/L/ciC9E5w4oW5s1EH/zJtAtWw
	==
X-Received: by 2002:a05:620a:3904:b0:939:ff85:8067 with SMTP id af79cd13be357-93e9b74d90cmr499754685a.30.1791388059165;
        Wed, 07 Oct 2026 08:47:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:939:ff85:8067 with SMTP id af79cd13be357-93e9b74d90cmr499748585a.30.1791388058556;
        Wed, 07 Oct 2026 08:47:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30a8466sm170150e87.83.2026.10.07.08.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:47:35 -0700 (PDT)
Date: Wed, 7 Oct 2026 18:47:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
Message-ID: <unvey6hlz5ov4flgzza7f3i7nowxym5ik3dd7jkzx3yiqt5xqp@ci3z27we45e2>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
 <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
 <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
 <p76qp5bhijenec2ygj36dd47uxkeyk6kztccbuhblte5lqn22x@yikvkbipjbae>
 <7e8ea792-2336-4252-beed-7345815b0b90@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e8ea792-2336-4252-beed-7345815b0b90@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MiBTYWx0ZWRfX6XXYueVBfriX
 srE5dAKl2haJQ0qdUeOU8uu/n+TRSIgsAeYk2LbKz5Q+kxprOC5Hsyc1jUtG2LCcOb3DpG7OCUp
 AQ3y611E1zdvMC1UH+XXIVGeyzLwspYisaljICeHoqlThc3ZwunorIQhYKhEhx+IGZ+yaWPn4qe
 54dkzeQnTbnG/0FGcTqVIyGCviDbWIy1kpCsLVFuFJxt8WkBt35ZlmA6E2w+GgZarDCHkP4Bex+
 n7yanmEalVMl5qm/dQkjFSnSITLIyPlQGQiTgIym42ytXi0qMGTau/XQTboySeyn+yeR7Ib/N53
 W6MkmxJosmqcKMxMkYdAv6EAMU8DlGe/jDjAQ3IZ2YwFsquio1yIdypIf8LPRgXOqd6gN1SA8zw
 GP9xapTvDVmzqgWZrv/2NMuTBfOOdDstrf4YEkuZY1+sQMogL5MYZ47m9MjCIRGhZeyDGdITpy9
 WEe6/5ZWDLgo1HProVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MiBTYWx0ZWRfX3qZV7UW4Z1Ll
 LYwRZmgcJ/qvtTied9PgTqX20pcfiSENjCWsAby3lQPOaw726nU9x1ubbAfsE0k1k3Hy3iaq7Za
 +/eNXg3I3qDUsHhl52tmtXI9k8SB9Cs=
X-Proofpoint-ORIG-GUID: uGb56E0iLBMqmVYM_u5vuKTponlGqQKF
X-Proofpoint-GUID: uGb56E0iLBMqmVYM_u5vuKTponlGqQKF
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac6699c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0f0GmaTcbrnyVoL-888A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070062

On Wed, Oct 07, 2026 at 08:15:39PM +0530, Pradeep Pragallapati wrote:
> 
> 
> On 10/7/2026 7:13 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 07, 2026 at 05:03:02PM +0530, Pradeep Pragallapati wrote:
> >>
> >>
> >> On 10/7/2026 1:18 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
> >>>> Add the init sequence tables and config for the UFS QMP phy found in
> >>>> the Glymur SoC.
> >>>>
> >>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 99 insertions(+)
> >>>>
> >>>> +	.offsets		= &qmp_ufs_offsets_v6,
> >>>
> >>> So, is it a PHY using v6 offsets, but v7 registers inside?
> >>>
> >> The QSERDES RX0 register offsets on Glymur SoC are aligned with the v7 register layout offsets.
> >> Therefore, the v7 QSERDES RX0 register offsets are used for Glymur (similar to SM8750).
> > 
> > Mention in the commit message, please.
> sure, i will mention it.> 
> >>
> >>>> +	.max_supported_gear	= UFS_HS_G5,
> >>>> +
> >>>> +	.vreg_list		= glymur_ufsphy_vreg_l,
> >>>> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
> >>>> +	.regs			= ufsphy_v6_regs_layout,
> >>>
> >>> v7
> > 
> > This still holds.
> >
> Do you mean changing ufsphy_v6_regs_layout to ufsphy_v7_regs_layout?
> If so, no. ufsphy_v6_regs_layout contains the PCS register offsets, and the 
> PCS register offsets on Glymur are aligned with ufsphy_v6_regs_layout, similar to SM8750.

=> commit message, please.

-- 
With best wishes
Dmitry
