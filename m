Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402156;
	b=4JiiOA7mltYe0T+t27Ek4L+iucdE/OdnW/XEbQw1fyuckirC776q0OtPkmYLKkHoVRAX
	 DTZ+NVbLYLak2U6k2eeW5uqsFplV/S3aVkqarjdlEFOhYEzMz+Cc2XFipY00cw8EM6aZt
	 uKByFVSYsavJ/hp8iPejTACrHiR8K+fbukeBzc3zcaHhYnRuAih02BUOPyzpOlcDw0RaC
	 +plWVvYcM/pEXjO5Koq4hGeEoQB9kq65E2dGeahR+cugZQY3OiHF7PXzUwnc1QK4J7vaG
	 wUhtKL3d43xqSucWu4dZrddIEDlv/pzJdg2GtmILKkTXllfsQi1B+XoLHJzWkP83Y0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gL7PRluqOkzpLiN/UK7bTD43fl5T1IxvJlK3ZPRyK2w=;
	b=A8LsDUsGmW7FbKl3JNzrSXGLizKf7mHz0xLTKiL6Golv/TMnls9vhOfyDnjykzaM+Jyk
	 hNSfLLdZMGs/NVMGwvS5+2uRpSuX6qFt+Nd59qKD+1HlPMHEeOhZfwPNMJdRG6ahFqtWH
	 2PJzko/gdGja7Dl/Ow9zWRu62zbF5ed5XC5Oy+PbbPTzXUe6Nw5Bz3aCzuP7S6mXuZXQq
	 lbdXjP8owoYFIIWiP3L6r+7SXP3DRH77/P5QZaU7PlXmK+N9bB3QjihBylcVAMiWCxcPE
	 gWIP03uti3e8G/Y7l4OAtsnL74/xASu+tTIgJF7YcZQq9b9brKZE/rpStPYmG8KGeBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMYvY7ez;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZuShfxc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F017C606A887
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F017C606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMYvY7ez;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZuShfxc
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZBOL2288020
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gL7PRluqOkzpLiN/UK7bTD43
	fl5T1IxvJlK3ZPRyK2w=; b=EMYvY7ezmzJ0k40Xt1ZuHaDmzZ3tilOwId0a9hlK
	AQFxTU37UV7LI9UXhgIZXO+CS4P1RpIm31tkGUjuTadL6oV/3qq5WgSSD226R9jq
	qbuJpilJYMz5hu+B4t0TpR9eAGf0kyGl6OxeDSpq33jzWKKYVKt79BbIX4u1X0qP
	cJm3uxvBWcuaQzBZtQiXE3DtrPa7XqBEy1P3zNquohvHnQRdxZEtl8aP4O8ghzH7
	uRH0iP7kni+J5wq4twsVr3vu5IRzq71lqawbB3iNG2K8r+T+a3vPWopy/oXK/jEt
	GJr5A2ke5Kkqx9r8eJKJwPyt0NYJlJ0rwoN4LJOSqulQGQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm98p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:02:35 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eacd2f2229so3551832e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402154; x=1795006954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gL7PRluqOkzpLiN/UK7bTD43fl5T1IxvJlK3ZPRyK2w=;
        b=bZuShfxcAnDXihKmV6NZOlW0JhFuxnBRGMS16+chGl/HRrzhkJEmqP4uO6T+uoCh92
         /48tV2jeBN8k2MV/S0n+e8Vp5JuYVS5JGCi3niBhahbKeZcKPVojNv8P3mLOrAZ4X08v
         yuhok4t95QqzPG4PhjQG1hs38oAJK+/9H3InmTxdFC45vlHkeEQ1KvwilLoUZFYGLv71
         AU2dfI6zSA/ANkB1GlzglY93eTm2w90k8B5Zi8BR1GCYOq/o1wB3grtMiVFoHpkrbPNn
         kyITVPwCXx0rQxZegCLHq8bJpQ/ivNKdj9snwFil3xbG8OWnBlmkjHvHvQcvu80mgt9Y
         J2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402154; x=1795006954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gL7PRluqOkzpLiN/UK7bTD43fl5T1IxvJlK3ZPRyK2w=;
        b=UZrAEiDgGcg0+oIx4LoinwsrWYh23C5hIbItuYhtYeDHAADJa65fw34M71j5G0rygC
         zQ0fTIU1DzbOnzkmVIvsPmHQf3p1KUrlcvrg/ndEOjS7a6qTHKs6uQOD7Pi5XkaPUEL1
         EfFm2zl45PV3bYWsxZ4ga9icjLtR6rGXvTl1G2nNk29fRdxj2sJd6vBooFcnoRulFTwo
         Dkrc/JS7t6kjluJxkCDPTyDwZPpyJeDbeV6PLjw0Kw2sOZLIHPZMRlL9g7g947Izsc6e
         VAw0gBfkNYgt6gN8dJ9QcwYv58wV/w7gIB8n2b3dnQxBoi9XvG8mWIPiXn5jL7r5kwJp
         lDEA==
X-Forwarded-Encrypted: i=1; AL+hErHB+rsiKzcWS92O1ixxV1RKKQh+/KfpF6EdN2h3bVQJjpDaW+z4k8Laxnff++v6mEVXglqz/yZKRekW+94=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cNISTGF39JOuAOveYudWp2gxpfrNmCeFBwSjw6CqwRcOkvmfQ
	+WrzhDh7cJV7gLC17Gt+fYeg9fo03NiFxJaVfpVeVWzYcq0LXJGMA2B6k6a7hVZ05JLR4iRwO/Z
	cl4eK96HWuuRWB8WPKa8f/4zvTQf8JtGclWZ0cfx9jXz4S4lEPpnr/s4puV75DMLsvcg=
X-Gm-Gg: AYBFou1hKeb1FO6pHrQW6lTX7VqIloLSUz+6gZvhOPNwr2U6qhLQT6qOAvWFHip0CSj
	N1aSjCMYQcYLg+0zUPAIBEZs4yFT2fht4LkT+LHAVkOIKVuZDJk0/zM6q0xTEQCySDaxhdV3YQQ
	Pf+EZ14sTxcH+IWcKgoJvpggi5QXeUpny+9qT4CZF+zfKpVd1N5xg2yHigpxkTf1oCP4UIyti25
	UUJjYnynFSdvRaaVKEz5NkqfrAolJUZyEmo0e2+c+hFBYfMSdoQMpK+Gew6+l/xu+nIBHqpFxgO
	zvuPdapJ7NEMxKtpHAo3xmnxVe8mPgdJwULvBo5LMXURfND3QdBYT1JbRBnCsF3ovIw31A7VFmS
	+x6kr9SVHDzJSVcDDITJUQwmBjwZRrP5mR9QQLrniWhOkS+3KLGPPztIHNN+YlTgKG1bCAFOwvI
	BKZLwtqeouOHDtr9jFMHtqQEul1sEdoGUhLlB3SYewSHG6ACPdSd20HnatcGH/Dw==
X-Received: by 2002:a05:6122:e248:b0:5ec:c180:e1a1 with SMTP id 71dfb90a1353d-5ee1c292c8bmr762401e0c.2.1794402153835;
        Wed, 11 Nov 2026 05:02:33 -0800 (PST)
X-Received: by 2002:a05:6122:e248:b0:5ec:c180:e1a1 with SMTP id 71dfb90a1353d-5ee1c292c8bmr762282e0c.2.1794402153278;
        Wed, 11 Nov 2026 05:02:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157baba35sm933313e87.46.2026.11.11.05.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:02:32 -0800 (PST)
Date: Wed, 11 Nov 2026 15:02:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/5] iommu: Use resource_size_t for reserved region
 length
Message-ID: <hn7dczsvgtq6siyikoaf6y5stlacmdyq53eg4mhyonugjhujlp@7k4cxflzuu56>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-2-5c0f72083e52@oss.qualcomm.com>
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
In-Reply-To: <20261106-add_iommu_ranges-v7-2-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-GUID: -JuI_D-F6nPiJw-v0up1m4gwY-wZrtZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX0xzVEFNn/UHk
 x4CZx7qk5DcE5MvGPkwvKBUMXGz2qHzfL6OrE5E7+uwHQMfVBJYlfW6ufgLQHegjijhd0++U/OF
 kZcQQaPUXGUURi9P312Ph+t9ck3VKkJLoYTJX0hW+Im6fks2W+Qyu0fZqw0P0jpgQXa8mka97yv
 mFqpPu8FzT/IAj0oRJxfN5yM7RqRNRLAmBYF7OQTmzacKGeRAvtjugGCLVGh1iMKEEdVDQg0Gsc
 e1R3mcb75SUUtoTa1/Q4C88EEZdOsdG0vqsa9RGq+JMm1cx2unqGgINoN8CJZtbrZ1Eoc8L1jDX
 tLLq4cf5nE0yMxWsnF3GeMZsEf5yjeBsccMJZfFB2gEVzmGSWit4b4FoNnucPak8M3JNNxR07t6
 wKeSu92o3GUvOchgpDnmf7e6s0jlr1vRBLw5qtQUgBtmB0Irx8SRaXp2NYWXRjidIWlYWj7kHFo
 BsQq33bOJwozGatkYGQ==
X-Proofpoint-ORIG-GUID: -JuI_D-F6nPiJw-v0up1m4gwY-wZrtZM
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4676b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EE9pRYFAw_fItPXnlVYA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX+NgIWIhaJlpr
 lG8AO076yleGxYLq8u013+4CxTwIy6OerBS35u6GTaPLtW98hKBi+jQRj8lpczycYo1AJl5Jfdm
 agLKrUOcHPWVmoagUkbzf/+RA+A3xPo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:25PM +0530, Vikash Garodia wrote:
> On 32-bit systems with LPAE, physical addresses are 64-bit. A reserved
> region can be larger than 4GiB, but its length is stored as size_t,
> which is only 32-bit there. The length gets truncated.
> Use resource_size_t for the length so it matches the width of
> phys_addr_t and holds the full size of the region.
> 
> Fixes: 2b20cbba3390 ("iommu: iommu_alloc_resv_region")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/d223ee9f-b262-408a-a201-8b16d310bbe0@oss.qualcomm.com
> Cc: stable@vger.kernel.org
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/amd/iommu.c       | 2 +-
>  drivers/iommu/intel/iommu.c     | 2 +-
>  drivers/iommu/iommu.c           | 2 +-
>  drivers/iommu/of_iommu.c        | 4 ++--
>  drivers/iommu/virtio-iommu.c    | 2 +-
>  drivers/of/address.c            | 2 +-
>  drivers/vfio/vfio_iommu_type1.c | 2 +-
>  include/linux/iommu.h           | 4 ++--
>  include/linux/of_address.h      | 2 +-
>  9 files changed, 11 insertions(+), 11 deletions(-)
> 

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
