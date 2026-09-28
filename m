Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A44E80B0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612055; cv=pass; b=UnbYLaZ6idLhyQWEtY3Yx5jSala2PqQ5K9Tzp6Sv47aKzpXRuwjUdj1mm525gh55npopRAgZ4HiGhSY20B/n7ijtm9byRLaYMUgjkeZQTeWSIi6snA5vn1znQEKcrR+aJzy3xkbtp4bBBDmP6KfynbjbrCu9F+XC5ohSu7KYdAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612055; c=relaxed/simple;
	bh=JZrEgd0TLPwwAWCZALCFROIvTyPGgE4V7ttomrPypCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXpEXFSlCrJARr/SevuZ2biLepQnk2r+MZQbyrg9/9EGwZJURD6VTrieAp4kBrdCI9B4w1pGynX6oJ76a3fgiOFJIQYWE6e29Cb1tFbS1TQ5+FJ+cLhoLUSl/qnJTzRAQdR0GPsCGcF3uBoTw38LqB9SKe7+zD3f+VyDlBGiWGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4B6bjhO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVnuWvKG; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4B6bjhO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVnuWvKG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdsW5378825
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wuLslc0BDrZi02F93pW5BHjGyELyU9LG00MwdsNCX0=; b=B4B6bjhOrXYzpHS6
	c7x+eABBtfb6mmLt+lD2xBbcvKtUexKJeERF8k+o/wrVw5H41nTTcEXC+YRxIh42
	hLurdCnymvnOSt5+7W9puMf4iaDR9PkfIjp5iUGwxT1XEnKOsJKFlJj96xhFzdHg
	6bRkro+P6Ftim37Ou8YpRysMw4lmU33WbRO4lE8OJkYhA8M1Wp0pTjLrcg2FfLJ8
	EjPW6E+D1LK57zRbKcnv7yhwWuyYP7LFRcrh2ggAQy2VpoAeqeRPkwWiHg0F1dN1
	lFuOfPoGmgpm3uT12Hl1uKPRgfFzxN7HESqZVA6jsUW21Hrm7MrUuahHr3gYPR06
	+abA2g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx391pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:14:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc79125e4b8so1522371a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612047; cv=none;
        d=google.com; s=arc-20260327;
        b=pnBQgv8G5sw879XEP3kkxKOUm+3W+kuN4VZVOtMangFmEL8JVTe8N7JRwnzTuOy4OC
         z1k1CA3NYk42fyafCr33YXbwiY6Xbk5uw6IjMUUZ/sRqHydnjkrxZoKVDf3LBJgFwp6z
         d5UWBseq4oE0COYykVh7uyuCsE02CPu8TVcGwkv3klBVn/usFZbRgATiVwi+TRTEcl9a
         E4aj5xftyc2iHuTuYs9IwhYfjcSdrZ3XrwvPMcEqTKlHRSLNyqKkUYsZRqetY0vBYUQ1
         7C0efkZ3FRXIUBt2dRr3fG57F9vCgS+I/X9GyNKmxmwjV7xhtr1zuWRPlmmghdBnvmNX
         MBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wuLslc0BDrZi02F93pW5BHjGyELyU9LG00MwdsNCX0=;
        fh=az33YaP9qlCX0GK2sZ2keHquUdsJLRMVCMMfU5cDlDg=;
        b=WfgSjElyMAnmjOqHxptyyp55XyhmBCCU1xEQeDacawU+2rJ2E03A2kfERYwzd9N57o
         zuybHlxPkLtzbcP18WU1ndNYJN+8wMzTv9TIw4wc2iQknwxPqPFV6t6fArsUWr9YHwBY
         88Qco1ZW7U6dWIIx4U7wltS7dj7VzdBdMH2niD9WksBfkxJd7AK9HA9iHkZfc2NERxKc
         4yAcRmcjgoDPuTKz3VlCCjser+A9QHFl93OLUIwDJgIfpfiT0pNSHL72Tg9TSQq9rvLY
         kqGT4eFmDBVf56qGtfgix4rHTj2LcUR6hDApAvJO4vQcY4+uOKdDUzdk3XrtONlLu0Te
         7QTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612047; x=1791216847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wuLslc0BDrZi02F93pW5BHjGyELyU9LG00MwdsNCX0=;
        b=UVnuWvKGhRH8e/Er4eZJ+d3B4pHqSOuESlDvJPW9fgGVif0Zn1HhVrQ3e/iUHLl3AL
         mA9Ecu7FsA2B+pKYxNphaB4l5vUh+04eb4cTc7TTZ4v2FQxmfhQV3THr2bd8tHM58unL
         fUPoQhVv+3mbsAPy1LinKscTXlJZpN8czd5eVfC5sT4YUf985JHJPW6q/tPE2UFKuuN6
         b58H3mekMNxZsH4vevR8VaEU4gk/D/dH+cgVE6czvsKwxepfazLIgL2tkcHe7M619bEg
         5w82r7fW4zmrnBUYbHw6iyQEB5mv5sxBquFJJk9XkyFA/DsQiBgNBvpmGbIAUsXImFYR
         +tMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612047; x=1791216847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wuLslc0BDrZi02F93pW5BHjGyELyU9LG00MwdsNCX0=;
        b=Of7yuxLKbjkP+K/R7EX9+mN3hzd8/neSDGpH++vmF17qQ9Kh4ork5F0dftkOD9bwL9
         UWtKOJY+EUSyEvvZgKByblzZbOhE+6IfzUEAaOy/JC3gdUwmumpuVSlr0ypRjMazkgjC
         vmBm/I8jygs59E3gIfRELdvQeFNyDPb+Fkgqdvrs5LbvQnbbLnszmm3eOsgOhYOjSbK1
         hL7SRmUF4pnEAL3/UNEmocKidyUmAs/QZg1qM2B75PMGpN7lyKRy0SgyfexmvQDYurX6
         fgp+iBd3KfBxpK9/LS3ywN3IpmTCOpXifIUDSaXZZxo2oh5ffWlpHVwGv1uYPc+NwLMf
         gSbA==
X-Forwarded-Encrypted: i=1; AKwUvBwkbwTN5mY2te3xauyzDbPGyaORd2+B5A2YUaqJFshZpJjSv1qVL8rLJkLzsyFckSgF1G2mhd0XZA/FBhs=@vger.kernel.org
X-Gm-Message-State: AFuF++kY8KIFaulqSfl5L60VzKrAmWOel/1vnRiiubslO2w5m0ad5pJW
	oNHr6PndR/TcBdaTtWMz66xBUp7oudlpVS8lboWFG8BRG49+c7Ba19TJUrw0uWS+RyYhqm/NFwV
	nY4+gWtSbszpKQlb+RDHJhRfGePSny95COEcIpthWQWWjGgXf8xNWMHd9V/vd0nq2GmLuJ8FY5P
	oVJ9EyG5iRyOZuExZzx1J8vSljPjxyRKd8q1Gu4xGNdw==
X-Gm-Gg: AYBFou1uyMZihPHS83/X7VQMOsFRkfvrIEtIhX0nr+fHrcb0DPLp9RgajOGEqu3UySB
	JglNbIQvrmpD/nj8AHLpqtvPq8aWRCT0nLSbvnKOHm+ypJw3HrVw3cAK7BK8nMTlYn99Vtd9rnZ
	Nb3sTcm/e7WxpwwITHaM4ZWfIBl26qgCXRheKRD7x+bgtjnMm3YLJPHXx4CQ==
X-Received: by 2002:a05:6a20:6a1c:b0:3de:73aa:2f2b with SMTP id adf61e73a8af0-3de73aa9171mr1434089637.52.1790612047528;
        Mon, 28 Sep 2026 09:14:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1c:b0:3de:73aa:2f2b with SMTP id
 adf61e73a8af0-3de73aa9171mr1434059637.52.1790612047053; Mon, 28 Sep 2026
 09:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1789634917-143165-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1789634917-143165-1-git-send-email-shawn.lin@rock-chips.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:13:55 +0200
X-Gm-Features: AclHuK98aGviMqkImxacCy4ZgSVRsVtZ24T4stkM7PXeqWkoom1s1dsvToa2Wlk
Message-ID: <CAPx+jO-O7wQBzQ5=zR=LS5Dbjew9v62FkjqyP79KfBZF7j6OTg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Small improvement about mmc documentation
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX9lGGd5SxemxO
 6bQ7W9b4xQwxSeKtcDqPnZ/iMAecQVSBBW3tJZNLOSkvgOGdr2pS8Gw+0z+59icl8QEMd74QVYK
 T0e7IYQUqiKTVF9isgO4KD8iTSnde1lXhqkgJJDgwkLUD6daf812Bo//XuumNL7r1RDLjje6YgO
 Ub27B4EKeumS5vEAQ2VO4SFsT7MT7y9kJ+m1uruWwzIOjTUP07N2ZBGCIV/wlQUbLOdGPDBnAbq
 fiz///pSNWGGoZ0cVHMeuXAKeuRMaxVqalHGZIdc7SBLlppuDNY/pFtdklg8hwEDAZYtiiIPECh
 N7MSix0MglyXU2zAA2RvG4pYUUL2avXnXJjMNAj21XCi5HQcoeDnY/KeCmKIPBDWQ9sv8kx2GXf
 uQrd+e1gs5EWUlUPK/hXJGKUYSE8IMTe70aGhYi+AEyw045j64oM4G0JeMxwa/u9oi/Dlom3Gdc
 5d3rchj05HyrjB6Xxlw==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba9250 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=s8YR1HE3AAAA:8 a=s17Ks7xZ3G42BXOKHecA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: pjxIa-dxNmb5zt3pts0Dy-s6KdnmBzkX
X-Proofpoint-GUID: pjxIa-dxNmb5zt3pts0Dy-s6KdnmBzkX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfXw23Ox4mKwUhX
 pNOSCjQydUAKE45xtmYc8yt1F4BW6qMkONidF8PWJDXqKeX4RjtFRcpkVrRo4MiGNmg9sWeOM5M
 +NefPsRhL+8bnwBsotxW/UxNDErJGn0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280064

On Thu, Sep 17, 2026 at 10:48=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.co=
m> wrote:
>
>
> The first patch adds a line about eMMC health status in mmc-tools for
> reference. And the last two patches amend the stale comment and link
> for both of mmc-async-req.rst and the code.
>
>
>
> Shawn Lin (3):
>   docs: mmc: document eMMC health status support in mmc-tools
>   docs: mmc: fix stale async request documentation
>   mmc: core: fix stale mmc_start_req() references in comments
>
>  Documentation/driver-api/mmc/mmc-async-req.rst | 64 ++++++--------------=
------
>  Documentation/driver-api/mmc/mmc-tools.rst     |  1 +
>  drivers/mmc/core/core.c                        |  4 +-
>  drivers/mmc/core/core.h                        |  2 +-
>  4 files changed, 17 insertions(+), 54 deletions(-)
>
> --
> 2.7.4
>

The series applied for next, thanks!

Kind regards
Uffe
