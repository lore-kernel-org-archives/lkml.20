Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793460800;
	b=Fmqak+ggTcXYGlVQYFnKjPCx/F5iMf11o+CLjASrw5tzeijSATpO6Xb0JYJZkquDdP8o
	 mCBnihhyDTZm7kwLf0gDyFRpSW6zfjcM2vudj5d3OsHHD983wI8HutCATTpghuqgNrH1R
	 DtoM4PgEe2bIpCUKOHti1jAa4PPSYWa3bb3PAfBX16e2ZkT4fm67uRIVoUybnt0TAbaxX
	 BRZkjHf/6yFWwC89e/hEyES1ylgsMQbJPg1vgA8ne74zNBqoVQt3IvfQkIMRhrZEAAY6r
	 XNyeAyJYL+wlXwZ59YeIcoBWgqLNmOUxN3kTGeAwWxPO71/i7sbE1/1TMADzsjMZrPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
	b=4Tb5x4vS0vVsISdxHiw6j0I4Nusc3CCibAOWxtXM33ZCopRPvUv1PNTVPFSivrDl8h92
	 khJUNBACkMTp4hSgK4G4JrnPCS/7RjUpatFIU2zhfnTJETvUNLUJgQ7Mqbkz4B1SuW6lz
	 Z9iqsiJdrgoDJ13eRmV066yfaO5tbkuBF88Zu5QUb1vOomFwcoNlFSKk1kivGztikxVi2
	 tEDolnr2VEK4cWmwI4HL4FzcN18uXoTEhY1Qd+HDP/qhFOXjYrGiPbnO4tk1DrpSF++yt
	 sCXxIOBiK6rbjo27+5D5cc0apX7xliH7fAOzj3+11lIIaOmqKp9LqmTESq/2HsiYW9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rx5uTZEZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1qGLOwl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49DF606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B49DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rx5uTZEZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1qGLOwl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0ICf2162419
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=; b=Rx
	5uTZEZScz8k5imepm81GKYaWJzx92n6ZOlW7C1HaNVyfBqSFHxJDe6sIT05ZtUxR
	bQL1gebz5vqWtcHRGuH3/VmY2OxCKvax1EpXf+CZpIaPz2S2ZuSA5kurJeY1z4wi
	vYUOqRqiz7CC0E4uE8pmywnJzmaP8DOuPTbsJOtebPxLCdKWwkZU72HP9WvftqfE
	U9Jyp3JSdSXW4uKjjW7/FhH/vrqCUiSupnInBUETS4KkLQugBk08jLTGYvuKVSWr
	iouZ7hPZGyu/U3/XuYdId8OHlbssWu6r9lFwWrKNdSnmwtwdanYqLXjDx2/34fFi
	KG8z+RxJYNz1fjYDTEtA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2se8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:33:18 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dc57e2a3f2so2424251b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460798; cv=none;
        d=google.com; s=arc-20260327;
        b=J3wvSBquabwQvkJa42iqF7fSXlpmaKN8Z9l3qehCa4T/gMolwg+Iv2Me9QW9KL6lRg
         DWPP1chfhPYXTocIFQjx5rSPx3xuAvaUij8yTMeNzZXLwfXsJJ4VUPshApT0TaIURLWA
         Pvl1KRXYOQlaWTi18a3XWkgXSexr88YcrRrwzEMg6TooA+IhjZSrjlwE3OmmsYi5zujU
         kzqfU2Yd4AAKfEnOHYkM3E1jqCwRA9vnw12kKl3xgxb2xbF0aYnR9Ebcp1qUXH2BMdyz
         ACH5zNeuyfgGREpjpYm3uDGTZguIaE9UkQ4fIO0J4Owo99K1bdKRyhjXAoJ3oykLVOoF
         mKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
        fh=+RtOcDWf7OA6yTwxIGKNPVUJ7ShBGJ5nl6M0AfH/huQ=;
        b=Itd6qsIPHIDfGgMQ+8piWb/vdm5fRl+IMhhqyVIKsNDNFEdST/YPxxAyG2Dk0uUN/4
         fN9+f6NLaZhRNruLfGAEyYKfqIo9+PIFtWMzeiu/A0Iq5OxTT8HVW5+2Ijps52lck0+n
         y/o0PIsx97RKyF74ts0JkNHnEYCn15F3niaFcHhqd2RYpjpwAY169EeAPy+R5I9Wo2PD
         qVKkS7LezXTW2lsdLmdL9VqATYX5yybTdlTjgdWZuLY68AyaDEk7ivKucDA8UXcRQQc0
         7bku3H0GGDIwJJrbqTAbQK8c09mcHJy3PkldFoF4FNd5VdOVrBC69v8VwmNxBkP4iNJ+
         DZrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460798; x=1794065598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
        b=U1qGLOwld9swP4wv9iCQRSw2g8HQYFcxqLBke0znOJiH65kYJjAq3/e+dlBgRvDmxt
         FeJM2XswuSY3eHVFEK/QYuaXCGdCEaNfVbcGvl3OVsIMQKl2Elve4aKyJexbEMkk9bBz
         kHRWRVde4cR/h/cmPou0RqNw/2H7+uYjXH6AzKPlUrq3gciw1gnTcVqUmlSmWVU8y+S8
         pRhNA9vw3QGpQ0h/Q+7EpRpCwI6JEzMYL+Wa5e+U0fpHKDQH7sFGmoiu2DETamEugplU
         KO+9DR+28LeGydc9quGIwaj8biHUB2SeSHGuXgCae5vu+eHP+IeYQKG+2X/P0I0I3KFe
         6kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460798; x=1794065598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
        b=afmKzl2DsQwDyhQMrhW3s6l8YW+fJ7AOFS2XfDkKv743/59NI+zbpd5zYeEgz6pZuv
         Vg4wHTDM/lS8uywvkRv3fnlZaWZIH/aAr+VcJYwe2+PHQqHnQ9L4NS8xCrVtSzxQXTu9
         /3N9ylKpSvXird6zmvImnHchmbLFeogzG8fi54olDpJQW0bQMTLsIYH0cXIpi8li8xPI
         4UEFD8x5JFBWwahLh+eIMF7cHDleBbZUeu2QqMbTyfPqgxhFOW3lRbR/eesFmR60Lcup
         Zu2RMWrJKCKZjbQFz8gHIRHVsAVfLQXa86tpuIuX/kauimUlxwicrSGRbazgt630Syg1
         AEyQ==
X-Forwarded-Encrypted: i=1; AKwUvByg9PkX0OLsM2KG+uad5I4L5SkbP3HJ5hg6TrcqsZ1mtpcIZl5xKNvSOlMraerrJ6cG2B88VZXBKtMgrJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoMEct/g5DWtzSZ+lsFIJQiJcbTRxYgJaB4XXrc+Hs+7OuLYMC
	DPpdVZD5Y2qWgyo1c+RhEwnN9O80/yh4gW/jtGmzxD6y+r2wFlO4IbXBvE7BPG6We8Q9rcmoVaE
	4fT3K2uTLnPCGJGB/Zz3Wbj4RkK3/kEsXg9K4hXq9otFnTSMBYDBGUw7BBKSxqnyiInKjNOJtF0
	krvD3nucD/81yQ719uRRTcpTTrLyl27Impv52gsRj4hQ==
X-Gm-Gg: AYBFou17WWTtUxwyoqd7ZdMDK87lmRsOQALDdeNvreSL3kKCqL/UN6vXmozrJkqj3ox
	GeSI+rKsa1EqAm7DKQR1436bB/p5v+Wy90Uii5VYJjH4aSNtfxKJmscd9AJV7sh9MLIKmoOXTqG
	aqXjTPpqO6qKMkMkJYBhznHMdrRO7WLTUKEnZ4YvUr1GGcgwprOBEtqoQE7Q==
X-Received: by 2002:a05:6808:30a6:b0:55b:f88d:919f with SMTP id 5614622812f47-5640de5c4eamr4534437b6e.53.1793460798020;
        Sat, 31 Oct 2026 08:33:18 -0700 (PDT)
X-Received: by 2002:a05:6808:30a6:b0:55b:f88d:919f with SMTP id
 5614622812f47-5640de5c4eamr4534414b6e.53.1793460797558; Sat, 31 Oct 2026
 08:33:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:33:06 -0700
X-Gm-Features: AclHuK9CSsE5d2RI7IGhCUXsadCiEmg1vr_YsLjfD1ZPNBmwTgEXoOH0UkuFoyw
Message-ID: <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com>
Subject: Re: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: oinog-qWFYQVuTbdK5fW1vfCdsvJjWdf
X-Proofpoint-ORIG-GUID: oinog-qWFYQVuTbdK5fW1vfCdsvJjWdf
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae60a3e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QEYsvGaJyljY994YBNYA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX5xANmLVHSeIl
 2CxwEAYMoLs4ShUn2h5aesc0f8HQJ9LBKUmq9hV8/e9nBw9H/a0nu4Jzwr01peaMXk1YaD+1q7F
 RyFmpsuzs/AHCDfXSxNWQScraGEbg30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfXxPUwHPqkrfFR
 YjYSrqnqRVvU/0a9BBHbZ/uytqqo1sCZrf7J0//uL0mc8xkg77wBiWdqPW6kFM09LwG5COdCCho
 b0ZqOTUv3zU4I5i+6Zrkxtdm3LiEssT2MgjLk+dUkChbU7Mhy8YJQb3/OJ7vueUjj+N4I5UxL6Y
 uNGrj3fYzyvQrmEfyzd6mqEUKVa/AbhXgznsH0QkEqSXK7O2PCf9invbdMcz57WXa/FpKZhm4RX
 bhDzIsQ3b9yhnc9XLnpmifIORLs7LYJN0w7flrHT9VKcvldGsiSi20a5ICjcMJ2c31m7zshTODL
 cYjbEFBbA5iLz2UIsVwAmE8xvDhxW4dIta3DEnnQysxQBTcEl//A2eSICzw70/o0VITwrKeKEax
 nLGUdDkCvrOyN3jISMLXEsNKJvn5RuPBU0MaJxu5jq7EnoMcJo24iLzeVDFn+Rr82Qnn+DPzzYM
 1euwGBeKSr0X49bz1kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Rob's drm/msm series [1] writes the addresses dma_map_sgtable() returns
> for the DRM device into the GPU and display page tables, so they have to
> be physical addresses, i.e. the device must not use iommu-dma. On DPU
> platforms that holds, the DRM device has no iommus of its own. On MDP5
> platforms it is the MDP5 device, which ends up with iommu-dma: the GPU
> then fails to start on db410c and sda660 and resets db820c. The last
> two patches give it an identity default domain in qcom_iommu and
> arm-smmu-qcom.
>
> The first patch fixes qcom_iommu's flush_iotlb_all, which never
> invalidated the TLB. Nothing relies on it today, but the series above
> does, hence no Fixes tag.
>
> The patches are independent of [1] and a no-op for the current drm/msm,
> but have to land before it. Tested on top of [1] on db410c, db820c and
> IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
> control.

Thanks, this should mostly supersede my untested series[1], but I
think msm_iommu.c still needs the same treatment?  Hopefully just the
def_domain_type() part?

BR,
-R

[1] https://lore.kernel.org/all/20261029212344.346069-1-robin.clark@oss.qua=
lcomm.com/

>
> [1] https://lore.kernel.org/r/20261027230452.130031-1-robin.clark@oss.qua=
lcomm.com
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (3):
>       iommu/qcom: Invalidate the TLB in flush_iotlb_all
>       iommu/qcom: Use identity default domains for the MSM GPU and displa=
y
>       iommu/arm-smmu-qcom: Use identity default domains for MDP5
>
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  7 ++++++-
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c    | 26 ++++++++++++++++++++++++=
--
>  2 files changed, 30 insertions(+), 3 deletions(-)
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> change-id: 20261030-msm-smmu-identity-6fda3323023b
>
> Best regards,
> --
> With best wishes
> Dmitry
>
