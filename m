Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792694499;
	b=XnGhnAYYUoKcgQpekQgTB+8XQk4jhUg6K95MYwGNqvSiN59kUasVZrAmSBu7A6KmiyWG
	 vUsdaJ6Sj2LiL5fxozwqeL/tcYuCFplezmUKk8ldyPa85CwW0cST5ylWbO2NqZjGn1FQX
	 c9OdHEHotx4fQF8TPz3rdgChB+e8lGZPaW7XFahvsWZbV8YSjTfBIhks0Szag2MvvNnHl
	 +H9p3xQWptv5waFvOljeOKl7DzNJBFhzxPnZdAlVMzk8ZT8bHjQcoJK86lNZrMMDpJ41q
	 pXROK+oVGgo5iYcwyH+x7FOE3PuI0FW0aHYHQL5XgN8necVueNWGiWogOHKP1vlFT7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=;
	b=osJFlTcONU0CTxpOSSrUX4WYig8B4ngfPI4iREwSlQrLcz5ZuwO+fMtOgTAucCgJM9T4
	 mrYRl6oOAoRp8qmI2z/el4DPrPAcV+gT3hJx3b/IkIo7NbBLHu5aj+DaW+I8rZESpbjWg
	 QP1tyegFsDXeF9ZKa7FhPchWxwY9CnTNQPge6feAPlB1Ib5Yz7b1RobwXqClA4X2dxjHy
	 vwCjg5n+EmSghJ+pDV5U9EIh8DdpHlOzq0LcFESWRV+SpZpM8EUQS2HRoimiruHKAH6gt
	 kxG+tGOFDdJ/6jobYv92e84+uP92GYT64CJ0rR53NMAmEO/X+JZwuAYEI+JGsOay9Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=euxiU796;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dxNLuSwt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B484C606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B484C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=euxiU796;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dxNLuSwt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MIGULJ3578915
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=; b=eu
	xiU796OTje+8cVlY6U4i/+C6P7bDnqYXdUj2RMdFdSBexnjTyOCz7wc4bqd+UBnZ
	PWhKSFea3qn/zG72xD6debCbiMi6ljW1naa+uqOHDpt1D0JJ2SVa5N4H7TTp62re
	ELqIFYZCNzrHm9DS2Zg1oXQfYCFcS/5i5RiTLzOF/BCwJ/79txmsZpv7uf0Uq0Qw
	/QpAmR9+EkXNXsaEYmoIjcnSzFCl1ARu+Y4lkFkcQUkvIzJTFjsdGANvZMo3dzmo
	16uYy0s+vWLLJjiNmM+7ihz9kCyeUsrqoIhQ9u+HeYxS4ISEZGRQGaLmDQ4CUFI/
	bmPfmkHL6DbrAkR8q9oA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbg3d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:41:37 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-702e606a1fdso57800eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792694497; cv=none;
        d=google.com; s=arc-20260327;
        b=eEL4yARuqd1Wdx6F+1j828UJRn8a4hobCgpkbgMhyLSM20QcQgzpCXaJ4I3iunLtZw
         NqLwUXcJUwukxWco6e15ZJVuzY0/n7UdCTglKN2nq5gEnX7BzTY/ImIrTNkqWuK//S6O
         wrzHCH7XHMKQFysGJZnC2j7HxmdGZbpcoQIM3PT1RmhHEu1W3yswsVf41jqpymdDB6TR
         GbQ/q6ymdbxVYy+yc0vUONXjTBUPWrGeVQUJJl30OTeMYuZZ4mDSjSSHYtbm63o/M0Xs
         TXLiLnK5RN8dAu3ZobBDq/0eirxwQlZyBKhp1EstCwcBl+0QMKYA3k6mSyVVuGvRu1Dj
         lssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=;
        fh=mWykl0JXH/cymSckYWOjt2mjlhWtvCrg1i1HFYcsmjY=;
        b=EC6LFWBIxkeY1XJ39adehoYvdxmEoIvu9vuTev/9gXmOpbh/QhbkeeGj3MDYsp8yxZ
         xM0/MeyqAvagCAOLy8NIpNeIRMZeCtJEQrHnP0C6MlBHfnOLbPSK+kFhLcF63rpn5uQH
         XMAvJrx78mxCJRKPlFAkMIp+WREEH5u5D3fdGqOIVDVux7EloYoziW8VHp2lbUyVoJo8
         tjsfTWIU6eTuHyweFVblpPLQowLmW8nGDOZnAqUd14UGLTn/Llifil/khgDgVBwf34qj
         ViEuYnRYluabl0+R+BUcwCGgJc8ybnMNj3NLLej/W65KKsSMjGe59xmwuQjfKIR3u1/s
         PBgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792694497; x=1793299297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=;
        b=dxNLuSwtDacnIUQJAqegvifRzMrjQoiKiZrP5SYKVffWHR1MhExWtqwT4vyB3M4L/P
         BTsl1gwFSo4Jh6u4VXen6ZxY3qYH+VDfZCTVj3QH6r1QUPdNj6uM7EajPwE1XQ5Cd34g
         lW9i2OaFymkL9OdsjTWfN9TfVrn6kykoZb/5fEwi4oaxOD32P8DTsFPqmhhGgAfD4+7s
         mJChjyYqq9mVjdxedzEcW0eYg/DOo1qUHtW64J3WxoUFfUk7yei0aVtq5eJuK7ce7vSi
         8BCK7Ld3Rv99KvngzX7rRwJpCcGsrcN9IRkKTsdyU9QkIIdR3rZFHX64uJf0OvNZO29e
         KxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694497; x=1793299297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=;
        b=T5Ud8t7KPssmtGZo9vgYqrprTMfhkR9MbRTxaYEctdKres1jUuHALWe2JjbtYsL3HA
         gXULxkZDYboOAJ7Ew8XVOkomXYNqti9XfQGPrH5pzEWFL05Z3PdNAAjo6LG2ICvXQYsW
         WKP66ARlWqd2RD3SQyxORMsJDefTn0ApUAGeMdBRBlAocsjusBhJ5CtHVtBAeRZaRt5w
         X4M/EaAjAcitk+GwnouF8LPSYGdd0+RjOxuvZcaDwv2d1GjAZISgQNZOMOLbu3gRqETy
         r3ToxVurNe71M21/pXKnvX7uAnCCZ2ibKLY9+l8v20IjA8noBFxK+/pXz8GPL59nw+dM
         eppg==
X-Forwarded-Encrypted: i=1; AKwUvBxa8efBYG865VnWLsDxnCDdDR+YsNevjiRDxY0PPQo3dySeuGxnedMN2smIsa69Ni1eoyPGWRnv0kg1Qnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPFlZdtKZVdCnJJqwj8QtZelk77/KWfjn1g6Tlk+Zpqs+s6dxP
	q1cgaqXRSTTucgpZJ4Ou1v/6Spu1ucTFr2yc75gqyCaapPe3gRK3AjXz/rJwEoiJ3fDFA++6FGc
	XAsQTGu8SeBxjlocKo60yXR3yXwo1lLT0uaYzSiHa/PCwTDnuZgHfkif6sklDad9WeeSoFN9w+5
	YTwWwJt6RIySlG5WYy02wcwRsmMn1+hozvCzhIpP16gg==
X-Gm-Gg: AYBFou2nUVeOYaOB9Hzj4ehLTmhUIaQFJI4j0ISa5GOx6+Hut3oqUElTS/PFnvAEL2i
	3LqvVTtIjhoex7L7PEyYlbxWr5yEHrAKKeZfhqVb4hNiVC8VcwEyv1p3JuO7U4IXb53EkcCzcPA
	KsYmxAnHvgnjmv1R4+n25vrLICkIMfEKV3dzmkxUv7fwKgY/PlRtai8MG+2g==
X-Received: by 2002:a05:6820:5706:20b0:703:27e0:354 with SMTP id 006d021491bc7-70b88a6d3abmr141604eaf.66.1792694496778;
        Thu, 22 Oct 2026 11:41:36 -0700 (PDT)
X-Received: by 2002:a05:6820:5706:20b0:703:27e0:354 with SMTP id
 006d021491bc7-70b88a6d3abmr141590eaf.66.1792694496395; Thu, 22 Oct 2026
 11:41:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-13-robin.clark@oss.qualcomm.com> <4069a590-607b-474e-9e3e-f7e744d3dabc@oss.qualcomm.com>
In-Reply-To: <4069a590-607b-474e-9e3e-f7e744d3dabc@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:41:25 -0700
X-Gm-Features: AclHuK_E4qF_ycx7Q98oHOhvhifI0LrSBbfrv3Y0YeWAfO2MHE8rzdoP5FSSzrE
Message-ID: <CACSVV01rM0-kgpoZHw4g8sEHXk-bswfXB7G5Va6fn6y9izxqXw@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] drm/msm/a8xx: Switch to generated nonctx regs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3NCBTYWx0ZWRfX7XgeQFyN+Qq8
 b2/NHakT0o+E3HHfbBadObjXhWNOtHivCGsgd5DCg0/XxgntxLaMvAgXnKd0xqKjF2jN4PNQp5s
 WCdZeiS/zQm/7zMhkb5i04xUoKgMzjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3NCBTYWx0ZWRfX+ve1SBVHvBhB
 4lFMJf8r05Sph4O2ICBR33WHhyGwRuClBQIITkCgMOpPDdfi8Uf5eH5grXYOmNtQNprV3YMWypI
 eUex4qbWxisE1w0hTUKBpJAwmonUbJK8MEpOYvXeqfk9tbL2vFyw34cbDaZCSJILgMms6eV5a5Q
 SFtTALZXo1cBNvbBZj0zw4RBxXuR8nmGgsGPvaydjVmiJQFGenJAD0HTr6Kx8rhyaKhTlq1++Xw
 FJ9FnEB/SLdqxi6Y4iUEfr+kAvMcwCHLDdIzE59IF7BexTI9eA1tHy5XIWk3YlvkIEISBWL8NrM
 Wvrfur0ENTVdjsP34QHUqeTZBXaVIFh2cMyI3AsDvouu6nQ5tduHhlBTVBwvIZWG2FHWfUpWy09
 WmiizdTY9qPsEMdYYHONptMQkfTo5iqblavS0O23x/Rxv+DLLaRAJFZFk+VypJqITigc0XZyjNk
 HuP44Soz9cjoQ+5A2Jw==
X-Proofpoint-ORIG-GUID: DCQxcItXyr_qL6eIQE9Qp-kmsbFrjcHQ
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6ada58e1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=b-Rxe3tx399ZIUr8oAMA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: DCQxcItXyr_qL6eIQE9Qp-kmsbFrjcHQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220074

On Thu, Oct 22, 2026 at 1:04=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/21/26 10:41 PM, Rob Clark wrote:
> > The generated headers contain the current (at time of generation) hw
> > recommended values.  Using these directly makes it easier to stay up
> > to date.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> For context, here's an LLM-generated change summary:
>
> What changed
> - RB_GC_GMEM_PROTECT is gone from every generated table. That matches the=
 code change, which now computes the value.
> - Every generated table adds GMU (GMUCX_*) entries, and most also add RBB=
M_INTERFACE_HANG_INT_CNTL.
> - Several hand-written entries are missing from the generated tables, for=
 example RB_CCU_DBG_ECO_CNTL and UCHE_MODE_CNTL on a810, and RB_RBP_CNTL an=
d SP_HLSQ_DBG_ECO_CNTL_1/2/3 on a840.
> - Some entries keep the same register but change value or pipe scope:
> - TPL1_DBG_ECO_CNTL changes from 0x10100000 to 0x10000000 on a810, a840, =
a845 and a850.
> - TPL1_DBG_ECO_CNTL1 on a830 changes from 0x04000724 to 0x720 and from PI=
PE_NONE to PIPE_BR.

I've fixed the PIPE_BR thing.  But there are still a few other issues.
I'll drop the generated nonctx list in the next version of this
series.

BR,
-R

> - PC_CHICKEN_BITS_3 on x285, a810 and a840 changes from 0x500000 to 0x400=
000.
> - GRAS_DBG_ECO_CNTL on a845 and a850 changes from 0x01000800 to 0x0000080=
0.
> - UCHE_HW_DBG_CNTL on a850 changes from 0x01410000 to 0x01010000.
>
> Konrad
