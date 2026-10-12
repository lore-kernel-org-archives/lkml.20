Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C27E1DF261
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803458; cv=none; b=GvktY/0rWVYxbkPG8kthy54A0VuhPezXqhCBzbzA88MjVzMzXjKhaqjsHiFSlzZb5oWBlZEyik21FlC85Dw4q8s8e4wcIAZ9UnvO0c1y90KxnsY8xWs65tVnRKcMu9KinPAH1l5j++P6XHNXsalctvbdZezpqrtMHoI3jxVivXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803458; c=relaxed/simple;
	bh=hySv+q03/aelWMGczPjjO1zHsAbqWuFxPBVZ90GZf7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvWZIZ6bl0usScMnLzdeT6q5eOsJuU3ORQZszEos7Nik/httQ+gFnfDTYU8jIHOL+P1VK1qDk9byncGy9deQ37Urvk4KuSHt7MhLnYjGgFwI+exGoa4jh/La849L1ZxJVwIky1VeK9ro3sjoz0n/YmBoog1FCLnb3SIxrT9BWYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxwtYmjX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZ+M8ZNO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxwtYmjX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZ+M8ZNO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8K7a82796105
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bhqCfr0qDoTT2J9WzMja1BdCzq+z7mDUjlTYFtX2b0Y=; b=kxwtYmjXd2Idrb77
	AkLiM1jgBLP1Baivw9YQiu2eOfQEGvFBZenbOq2RwEL1ts0BjvdnVGAEeD4t916z
	JYjlpwVzW9it9oqY8jppK25ZkuA4bppn6OO9ghGeV6svcAQEN+zUVrElaPvtb+v7
	cYER8wGFRLh5/RLg+3ACaWWRlZTeph3t87O9E0H0yNBxKmJ/Ux9bL+WHlohVix0y
	gEbWmvRiujOdhoCFng8c1K6egXdls8zwPja+ZxMr0SlZgUNFCfJn3dKIWlWhFEYf
	cMGJD0xzan0koSkWJ2PbIgznH952XC6EaFsB+7vheQ8RBzek3721w6p8WlDcK559
	mp7p0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3gyv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:10:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso404015985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791803455; x=1792408255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bhqCfr0qDoTT2J9WzMja1BdCzq+z7mDUjlTYFtX2b0Y=;
        b=XZ+M8ZNOHW5LkjwELzPDeU9HsWS6BnPsjxYXRreqlewJjAccxQUSRNLXuItT4IOoaQ
         k8vaihijS6L8zfJ1D+rlQwnUmLJKvbNRBiIoUo9QukXpWvzqoXggtvziPPc4cAVnJmd0
         QlExVgmKI1cJ5BwFzK9rb5XNe72CssZCfkg4c8TTJAmOojryoC/3DpwgU3LF3dA9co+/
         XnAhhuNS8H95CjEpg4X4HJpaNj/RuIiFSFV1sxeLTzkH5gz+NurzcBqDDW9m1938Oyjz
         dOE0mVdcIEw0y1KQqxjX7O4On+MeFS1jh3aJ1PU5mAhR/NbZi8vcshMU7WnNtIHh0vf9
         AXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803455; x=1792408255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhqCfr0qDoTT2J9WzMja1BdCzq+z7mDUjlTYFtX2b0Y=;
        b=tYiyo5oy8K57UsODc4cxJstXlYFJXlSkA3fF8nR3SqlT7zeTXO+cmJEklSc7l9ujM5
         f7V04OWwjeOsWFQcYl9ua/Q3vOo/RUhHJrcFMUqVlUsPqPu56e+2fQi3+9Do1dswqsUD
         aYJFosiLweKKuPNSTG0T/Pky0tVS3SksSgoxCD+lJC19MiNqMoqgsrmeCpSvL12DjnDG
         KpnWgoKWd5xGkPNjveKKQ3xZnQfkeJ9A+1TIO1PjZKNzgUw4w2W2iL7Mh+oMfqAe6kLc
         7Hr+B5EeQKl1bT74DfA+vU+35X1gI7b6DWS4o7ch0CurUeVayQNB51AQ7aFzEa1TJcYI
         ABpg==
X-Forwarded-Encrypted: i=1; AKwUvBw63GPa9SwnOg1yTnAXmwA0vmto/44dQUVe2ByLcv2xSTVppDUrWraQN7n2Qw4wqVgfFkm9TGbJ0WdYNKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1vYrXhWDCQLnjVKf1nQ9YbxnuxSiE4iRlGtE0/5ogcuO1BKut
	Q/BCvERaVZy+oq+4NTXsEUoW0AGJnHIPvGy7z2aI5FV7CmmsyIkF5RIe8LygseW8AJgjgjyePoj
	JNai1FWyOaDFvoKtvg2TruxHxw8bMIws3higxqnLxRFEKxo/n305/qyZh8u/gO0FQ7xQ=
X-Gm-Gg: AYBFou31OZ3YFM+Ni1M/0V5cpJzkKmTB8d00ozoRyknij7mKSu81xJgoEfNdn8hjmxE
	mKBj2EPQLt3q47dpqFnHvnG51GKvPGhxsphql54hMT90ahUT7ljjYvrlRkgjWZ3EFGFVU+YGZIe
	4NxvWDAkVqNrm6ecppaxscutboy0XQuJvLU6j6bm0lx5EOlP7O94idlwUGWwlSHZhKQTiaikZEy
	zycc9MwGu3WALon4xxS4FetJz7MB/9HjaSuyqMpkJr8IGlSB/g/OncOZ38hLYj+UaJTXorO1MqI
	RA0T5/FqtNNX2zjkS2ArN/S+55kUv99PVqNZiwAWR73UMDhTPqPVuGB5AGIA9RjtVeAW7+FB8XS
	AaDFXPd8lhCon30keW+cAPl6PtbA/debQ8wcoqmg=
X-Received: by 2002:a05:620a:17a6:b0:93e:c12c:9b6b with SMTP id af79cd13be357-93ec12c9ecemr1305854785a.70.1791803454856;
        Mon, 12 Oct 2026 04:10:54 -0700 (PDT)
X-Received: by 2002:a05:620a:17a6:b0:93e:c12c:9b6b with SMTP id af79cd13be357-93ec12c9ecemr1305839585a.70.1791803452761;
        Mon, 12 Oct 2026 04:10:52 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm311300545e9.0.2026.10.12.04.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:10:51 -0700 (PDT)
Message-ID: <734b27a1-e330-4488-8e8f-58e68810220c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:10:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API
 support
To: Hitesh Patel <hitesh@ebytelogic.com>, bryan.odonoghue@linaro.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <e8be3176-e2df-482f-ae84-bcab3d2f9fa7@oss.qualcomm.com>
 <20261012105442.788513-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261012105442.788513-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NCBTYWx0ZWRfX4V1spffUm43H
 nfyZMuCKk5ZS1sNeNxyboUK7GEjUhjBnWLMRYgs0H1WV+sES4ojQHPDyWmSNqh8WuvJqbYKpGLV
 iBQmKhEOIyjzMCEm84LEp3C90CcWgaHCBO7tmbz/9sfQy+K8XcDAVY0rxLrGLpGRCFBrq8/YVlm
 jaVi1K65mSpQu+NT91OFD5fr98lJCvzcxEIwa13u2V7fbMDoR7Y+Dd54yTWrj+cPj/NnX603NLc
 uQ+hBZ131lTbqdc4PGgMGU/4uReUcqJrqRpbjkkszuQamtACuiDp+RWW4MX9asWD0UJYye3Cccx
 bnVjEpD2Kyx1v+HxL0CbAs0vQTYqde5Db9HRbzSxEMVCNOtS02vOxdKkLStGFhB20IVLhNvgdAS
 DMI8+6+z+ho3PvTBB0GUDvatdJhDkQ9DdB1aKBie0gyTKW5niV7oCDE3di8o18XQ9yIwE3DM5Rk
 47mmCwTdGRE6XuUB42w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NCBTYWx0ZWRfX/iN0CUud/MzU
 Ud4MPucbJkYjbupjhIZR+7bV8RdQfxZoPVeC0O8G4oSCICJDL+r6nGmbBq6CA2IsO5OdS9GbKP7
 8PZd8edcwQDMVZl8s8mmPnJpED6nmMk=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accc040 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OnlFqCUG7Yx7FLR7_J0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CfZ834OsARAvljMGSjqKIH1UuHERv_qD
X-Proofpoint-GUID: CfZ834OsARAvljMGSjqKIH1UuHERv_qD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120044

Hi Hitesh,

To add comments i have missed.

On 10/12/2026 1:54 PM, Hitesh Patel wrote:
> Hi Gjorgji, Bryan,
> 
> I have now run this series on RB3 Gen2 (QCS6490 / SC7280) against
> next-20261009 rather than our vendor branch, so these results apply to
> the tree you are submitting against. Four findings, two of them things
> you cannot see without this hardware.
> 
> 1) Only 1/8 needs rebasing; 2/8 to 8/8 apply unchanged.
> 
>    The CSIPHY ops split is the conflict Bryan reported. Resolution as in
>    my earlier reply: a second ops table carrying the legacy core ops, and
>    the lane enable/disable dispatched on camss->legacy_phy.
> 
>    This is not optional for SC7280. With a debug print at probe:
> 
>      qcom-camss acb3000.isp: streams_enable=1 legacy_phy=1 version=4
> 
>    SC7280 has no camss child node named "phy", so
>    camss_detect_legacy_phy() puts it in legacy mode. Without the
>    dispatch the lanes are driven through the generic PHY path that this
>    platform does not have.
> 
> 2) 4/8 no longer builds. v4l2_subdev_pad_ops::set_fmt has gained a
>    const struct v4l2_subdev_client_info * parameter, so
>    csid_streams_set_format() fails with
>    -Werror=incompatible-pointer-types.

This will be fixed thanks for the summary.

> 
> 3) The CSID pad-link guard cannot be dropped.
> 
>    Gjorgji, you suggested my "Do not link CSID source pads the CSID does
>    not have" would probably go away in v2. It cannot: without it camss
>    does not probe at all on SC7280.
> 
>      WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
>      qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
>      qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22
> 
>    Note the pad count in 4/8 is
> 
>      num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;
> 
>    which depends on lite-ness, not on streams_enable. So this hits every
>    platform that links all CSIDs to all VFEs as soon as the series is
>    applied, whether or not the streams API is enabled for it. My own
>    commit message was wrong to describe it as a streams-API consequence.
>    Confirmed on the board: csid0-2 register 4 pads, csid3-4 (lite) 5.

Maybe i did not express my-self correctly. What i want to say is that 
num of pads will be the same for csid-lite and csid when non-lite ife
pixel path is implemented. The patch will still be present with some changes.

> 
> 4) With the guard applied, the series works.
> 
>      msm_csiphy0-4: flags=0x14  (FL_STREAMS | FL_HAS_DEVNODE)
>      msm_csid0-4:   flags=0x1c  (FL_STREAMS | FL_HAS_EVENTS | FL_HAS_DEVNODE)
> 
>    Routing through the streams API, imx577 -> csiphy3 -> csid0 ->
>    vfe0_rdi0, all SRGGB10_1X10/4056x3040:
> 
>      msm_csiphy3  routes: 0/0 -> 1/0 [ACTIVE]
>      msm_csid0    routes: 0/0 -> 1/0 [ACTIVE]
> 
>    and 10 frames captured off /dev/video0 at 4056x3040 pRAA
>    (15418880 bytes each, 5072 bytes per line), with real sensor content.

Thanks i will take that in to account for verification.

> 
> One thing worth flagging for anyone else testing this: the streams uAPI
> is gated at compile time by
> 
>   static bool v4l2_subdev_enable_streams_api;

I think that this was known but good suggestion i will include that in
the cover letter.

~Gjorgji
