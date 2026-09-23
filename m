Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3C3101A7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165733; cv=pass; b=jV5jDtLpdN8ae+DkKoJRYOlln1+YjZfhnuP0kcLFz+Y2rkjsserdNrTfp3YEOFZ1lMee31W5aQN8geXFzh8fc/l8m5T9f6JoQlju7r6od/TAQtjU39jxixa4+EVzfkVhlI485BQBm3smdHfX52hiew8trEYebI4t/lFqYcZglIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165733; c=relaxed/simple;
	bh=5KBcdSffm4dlIV0YyVdl2Jl/eg8JxhlguKWSqYByvUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5/tVBriY+wMDwivYaj1lMriANeVFJA0nH3EF2gpMvIhlkRutbpE3TMeWnfWwGNirvrtjS+4DPbTdPmI4A4pdn5KmK4h6qnusQaj5kIJdLQ+bXRk86NLIVgm0WZYjHJQHI+d51VWzbklLqGYrgrpaB03zSONmU/r4BN1C7lETGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKz+l+81; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVX25L0f; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKz+l+81";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVX25L0f"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTtm2466546
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=; b=WKz+l+81SIY+I4oS
	44zECxavKPfTQl2Ns1Sv4L2Pn0/8Um+wFPtB/28MmwIY6yj2odPRvm/KTXW/ek/D
	I6GetvLF6GlwfekM0XS2dvgEy272WAZfO3MXK3ijOSBQw3UxZz5tzmgw815dDdu6
	uptlzcNi4faF0Jn1s7rX68LpQPyYpSPXh2o3PmQtyQfzEYn4P8mtcbZFjfgMSnF0
	P/082aJeYcp84krLOma+xfMW3d/ozdR8bnL6qqFL/5SxQelHa4rf17v0x0VDAeLt
	nmdLdzn2yHYmtmAdVSBWF7qa1spMbHxYrbQu5H5VZ/GbFlN9laX0jZQSoo1BJtdp
	5KIgUw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3x4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:15:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd7d0751efso6973265ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165729; cv=none;
        d=google.com; s=arc-20260327;
        b=ML4aOrOMf67XLV6QEIsOV+XxCIaJ0o18WvtLyK3LZhS2pjOcbnIOcHK7hwZtYrr8rc
         J+rtvWvcWO6E2a7lOPJhLezTyJRyflRaH66VFNzpCaxd9wJRbBDsYv6uHHIAX1GtNwpA
         LQQ0ybTrmLQ2SrJ4OdaBS/OGyotJc0sbzeVIlYj7CP8Wchg8hj95OnDgV7jWF5BEwMeL
         bKD93ypzPjZ4vpcUkhSXB37u0rqhJO/SpYNaVs2mhOA1hF3hDDK+0H6GwS8+jcONtOmW
         S9K3H7RfyhG/BnzBbgTjLcFE3FJ6GrvXrjRBA17Dr2aP1pm0GSL3SMIEd+oQl0BagVF0
         qCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=;
        fh=YG2RtiSCxLPIWRgID1ESNyRB3sZPRGRCInq8hop6A5E=;
        b=qBy5aNSsOBh1Vds5Ml7c2I0rS0FiUwpq42vxlxG2DNJlvCbarb+Z5f9SMgBXllLGOQ
         0S+AEMvSBIo7Ut+Ym3pC8Ms3Nn98H7GSIu0y2NSxwtnJsWxgcW/rRIpcfMdsZKaNb7Ux
         7TNCeAZnbHHH6jAKHVRAdJzkBaoJ1MNE57heBZyKYCjogNwpugE0Oy+8Gl69cW4HWs0Q
         l4SBQlLmfF4tfCNrnCZNAfJTWu5Er2Xv4tZtqlXId4ZrVJBEDnOLzCskelRvq7OsEgxB
         PRmglUOU98o5qqfbaHqCWqhq63ySmoK+Tln9F/Nlv54YAOO0ZTj6yflbTWwWiEhTtkdd
         u8ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165729; x=1790770529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=;
        b=EVX25L0fGlnLRW2u6CMGQA8ZBMKAr7o/2ih2YrodxzZhcAOGVBjz9xwP4SpJdpsbgS
         6TKoSkBHszHyg9IgDs8CZtUso5ubxGPEwD4ocXZIkhR/YEstDLcdQmIFebcn7F86B+dJ
         fDTh93ZrXwEoA67PNiz/oFgiDjk70GsWcXF5EVNPtMHev4qiZRA30k387V3HCwcUjkv1
         RtC7lcKl1QiG71DphoxtTZW85oflKwNNTOZWfuO391AW/1+kueJn3XkmD7VJY8N+xnfy
         xiIAVUkE4nWVbcUJ4a/BPfstEx39KKDvheFEcqm58s8b+t7AjomyGkIvu1fZfZBR+nqP
         c23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165729; x=1790770529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=;
        b=XnrjeZYq91KzESdXgonp4RT4HkGElcOZPovgYqWB50MKgi4b5BQvmYSTFWePtSRm2B
         +dp8oLrsitUyj9w8B4mDZ6ukV4lg/X6d+fQYR9/JNxwar2aStER6s7HYLc6gsRMRa2uj
         ixxHTAAZYEa4cnMmWwLt+xRmU3GuUY5fXANTLGnF4NgD2vjSSP2av1ZtbfqLTP8JeDys
         D6/tqWmWT0uLE5iF4V68Z+6D1N4RVNaCPMtLvnadG+AKi6fPVZYIaklEdHVQ1+iwyVQD
         IzemD7zLmCtobVSxF6yibWON+hrOmexzW9DCXuqdJM3f6ZBbNt+7dEpgFJlEfqfy2Qmv
         Mm3A==
X-Forwarded-Encrypted: i=1; AKwUvBy0q2h2ai6EZhaoY2mGiKEd1kVwXYMqHK9DBV6WxRAx36PdrHi8khNugNL0IOg/XoC6K+4ucFSik7aXlHw=@vger.kernel.org
X-Gm-Message-State: AFuF++mlpOP7dAq6nMad+7q13W7v02Lza6OCkqkP+BQybfeG5ZsCm5Qd
	/1O5GM9bAeatbOmRl8zhe6xudOWhjCHRI0qtaz3MZBPvc1iPnmaebF6N1kOuAp5upojtgp0uNPi
	z1gULIMe3HJt2/FCc5YFb6SLGsNhQ7nY53Px4fl2hCwiwKGhqmXlCYr855oBLu3dQ51E+RxlIL6
	bpiScsZUhH9fdihftg/amaESqIQKYjQtzhxNtMHkcqkA==
X-Gm-Gg: AYBFou0BIUR4+ACp+xMGFniBBuCSGXnyxQ1tsmbHjmkKYyk+1kvRcMemoseeRV1F9og
	nxZInSf/yXYCNyZY3wVQB56M2GWT4SExo6ZfokncLOLTCT3H50nd0RtvLAhNnBDEjLLAr40dzWr
	3epp+bjHEZub3wx8QX1tsE7N3okzTAs5xgF5avsQIaEjGSriYPVgFEajEcLADbBTuWCVXR
X-Received: by 2002:a17:902:fc44:b0:2d7:5da6:2af4 with SMTP id d9443c01a7336-2df609dab94mr31311475ad.4.1790165723843;
        Wed, 23 Sep 2026 05:15:23 -0700 (PDT)
X-Received: by 2002:a17:902:fc44:b0:2d7:5da6:2af4 with SMTP id
 d9443c01a7336-2df609dab94mr31311365ad.4.1790165723390; Wed, 23 Sep 2026
 05:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921033708.14433-1-phucduc.bui@gmail.com>
In-Reply-To: <20260921033708.14433-1-phucduc.bui@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:15:11 +0200
X-Gm-Features: AcwNN1VsaeqV92H7KEZC7boQTZb58RsMU14eBT7KgfgQJPOV9CTm7Q_Kcg0tGjo
Message-ID: <CAPx+jO_RAw54HMsgCSaxghtgakJ0rANSY-WY35SE1i766mMsvw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: imx: Use pm_runtime_resume_and_get()
To: phucduc.bui@gmail.com
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, rafael.j.wysocki@intel.com,
        Jacky Bai <ping.bai@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, Xu Yang <xu.yang_2@nxp.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ming Qian <ming.qian@oss.nxp.com>, u.kleine-koenig@baylibre.com,
        Marco Felsch <m.felsch@pengutronix.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Guoniu Zhou <guoniu.zhou@oss.nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: hojIv8TDrYyGIjAv28C3fBJsWfX0T_mC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXz5ef7XswSPaW
 8PQfc9EB9uDxOxkut7YLXNdaPYEPfTeQJlHvWU+H0xOGsI/t2VmCC7ODeQtZGHQsFsJiw8LEVyE
 Rhwv5RZ+cKqq1Z8YCgvur6OamAI2cqc=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3c2e1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=B7rF2LB79GkdTgAebh8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: hojIv8TDrYyGIjAv28C3fBJsWfX0T_mC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX6fJ6tFTU1rKn
 F+Yt+jfGR0yRti2t5YOf0BLX6ou9o4WlxUqe50git3v7ZgTh7JSmUqOcvGOyEw/RjG5TKA5e4Ad
 ucFtFVHLSXGRBeFp3pB1yhfCsO/GV6T/uXjXpxaSobd/m9bR4SH/oYIOIj05Wt7RwQhXyc6Fzzb
 rkYvW8C9wm1jSvw//fl2UERG/0qX8LY1MIWlxI7zYeQkZPL42BcyC/eOMcB9Q4Xcd9M9MD4JQkx
 RzdZKs3nqZi/1+YobuCQnn0+XGFkGzUZ8IvnvFft05Tl7Q6Lv5HDy83WRoske2tsZrQAX8DA27K
 UtpC4n8Rk4ZRCmVBVSYf+2iR8ldVjNmZqpFNH6zahkuhFOSTYLsha1Vctn44uVwJy/WGYm1z9Ix
 FlGt9qeVoUb/WE4e5+ZC1EU01032RNV49cqmwqgr1L8fX7spNtxJNuz4uSrQZdPLy1BOYdvCLCE
 TVGj2IZjT5HLN4HFiBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Mon, Sep 21, 2026 at 5:37=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Hi all,
>
> This series replaces open-coded pm_runtime_get_sync() and
> pm_runtime_put_noidle() error handling with
> pm_runtime_resume_and_get() in the i.MX power domain drivers.
>
> No functional change.
>
> Found by manual code inspection.
>
> Best regards,
> Phuc
>
> bui duc phuc (3):
>   pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
>   pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
>   pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()
>
>  drivers/pmdomain/imx/gpcv2.c          | 16 +++-------------
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++----------
>  drivers/pmdomain/imx/imx93-blk-ctrl.c |  3 +--
>  3 files changed, 9 insertions(+), 25 deletions(-)
>
> --
> 2.43.0
>

The series applied for next, thanks!

Kind regards
Uffe
