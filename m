Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2828E3A961B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269716; cv=none; b=tsMBQJLCeAJzT3uxNK5fmqdzKhLPFqHQzutOJ/v4yspHl8RB2ub7ExRdha+O05L4u5jLbT0ieHmu0BRnqphEBuggWmA67zs9hUfqsefkJowJGFeHEcaSrr1metRLRCVJ9xdml7ZIcvGw7jeLTdpbSGRhdUCaJbShCBGA2PVqLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269716; c=relaxed/simple;
	bh=jlYwXoxgexyCObwo6HYXAQCbuSyCB0EIHdMBav6GINo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CeUXkFe2jCEHEMS3WNSiMwI0zACW2XdELqAgMKGooIaoZS+tzKr1RsjMG8bOE3yp+BzHX90q9vWkCbaLihaa4wY5n51BIgJRdm8PETmwNpyOPmhSkm3QczLebVjv0FqBilk5PtHbOwOirP+lCepT/Evk4Vt2mQ0l2/zaFdv9WI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7X+CnpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9A3Q4vZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7X+CnpF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9A3Q4vZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966gsqn1046211
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 06:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sbn3DjeD0b28+scrBbrQHJZ8dt/yHM5fg8UpcUfPY8A=; b=B7X+CnpFMN2kF6O4
	2LuaNFhGeQdGse7uwpFrdvs+okvMGfOYi/qOHGpdv69pcgAgZS78ZdMtb4gK6go+
	664uyhvbbfRBULAIg6ojlU4hjZKjnnuA2raYkcF1Z5pWdoJJAFtrb8ZzDoW7d0ck
	BnlKEj9UpzgrWQ34V2AfdY35PD9esRKMD+vF2Vgxw3A9KFOTveA9WiY3TnS097Hc
	w55ev774PB2AMt3kCf2hiH6NU1+cvRhBMDH/cHJav8wNfqc8+DZlgvN//5D0CCrK
	AdLps5Cw3FN/j/Ybv8fKgtOSh+JZUaEZ7YTjwim0sIZtftfM8PHeElOoj0tRT6Ar
	+xBqUg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4g1cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:55:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988d5a1080eso2152613241.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269711; x=1791874511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbn3DjeD0b28+scrBbrQHJZ8dt/yHM5fg8UpcUfPY8A=;
        b=f9A3Q4vZnFHqDCgz81ADK3PWoTc4lvDTbruYJ75mYjMJtRkcGbAI7WOvJhhulf61Um
         tRYHleBZW5vuDKKLlva6d72HbdNk7ewlDpq9s57bHTu9+qqMxEnHAWuLTeUwXIOkD9D+
         zSVxTMP4MgPK/MgAGchpUOtQGV/F2Ghddly4HNS/i5oqh2sA5FwOFrtwAKiocUr8IB/C
         EVfqB9sikpmS+o3jqVeGZaiweL0mS7XELupvSCQnq7ogfgPHwDDBcM/gyEnV0Py8mEEP
         LFPBWSjz+QQff9VHUedAOUmjmJxJGbegRt61HaoWVxOhe6f6euUvGYr1sEmJomt7AUiS
         QaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269711; x=1791874511;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbn3DjeD0b28+scrBbrQHJZ8dt/yHM5fg8UpcUfPY8A=;
        b=AZ/bKDW+P1ZLKzPI6oLJFzE8ALf48pluc15KRMR2nzC/FDU3MQc98EfduUnGGp0tbm
         oW48eUE1Iw1taoPONa5W7irsze6VTUQHgNLSBFR8En6nf29MPK/tsOz27CzgGY0ptw41
         6CbzNB7LMSH2LZujQVOcMbP45KLFvB6avtQw1StqkD20klBZGDqGrSBGslaOa/m5/XKf
         KlKWA/igJNG75JNw52Jv8NzkLUk23CEEZkCVcF5ylWZCPruLEkQAArFvuYX25H+/mbyh
         CjD1xj9+jcwpk8y2RlRLsi8Jhunx52PGHv74EJkQ8BjgvzO4VIkDfn2cVa8DsD0hez2o
         VDHw==
X-Forwarded-Encrypted: i=1; AKwUvBxBKTXOuR0pHwi1CjKlt33UEOUN3wXTf+9jr5eB4iGX6lMCXiy5PTgZ5gAxns3s6aF7R9//QRL+GlZUx80=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWRG/JuHvVN4YjZ1TREGRO9xCI7ZrkYqgomqrSbqOj4rnts4U8
	SJv8fkxG26NbvhG9lGuwR6AQeGXOOvRWh3+IGZxxB+Y5YpHri4iSvlxWDAXFsNkVBNzBY1TPgSo
	FhPIj5I6vDc5/PchhppZiHKAlmm/nJFLcXk9l2P+64o17L0lQ7ul2ABeqWCq8He1Mxle5d+1wRo
	ZWGQ==
X-Gm-Gg: AYBFou3GMMUIVhi48PzyUQAY/CbfvDIP9TLRvWcFUGfA6GoD9GWq311S+nCld/dZbXa
	Evnc1W5T/KXM/xP9qGSHVzplqx9kOPF752BGXxhy9ZqMCGyMa2lYLA9wZxf4ZZJmf5Mf+GwELRE
	9KcSxDHjYipW8uSv8npenlTHpLllu7pZW7u0kwaL5u9KIgrTHfB2LwYo51zLYwpjIzHSGdJcSVM
	pFCPgENVy742B9gzRoIXhSJHte8FePgaa5USc4Jk2OPZVtMrYubJMJ/qX69OEE+j1PtRBUR6XVJ
	zMPVg+kP1vySE2IN+mT7kDQzwQPoeLAlVuaKgtxyEvVVDGAI4Ku5FfGXenKWO9BLhIK4Ghh3x+J
	LtQ9OJ/1bIOiLDV2OEjdsiGwpjZ1qDj8v73fcL+pa/CgsGZbnjLdY8Ia8gzLcA36unVF+InfrKY
	FWGeVwAXZcLvUM
X-Received: by 2002:a05:6102:dd1:b0:7c2:14fe:33cc with SMTP id ada2fe7eead31-7c87c945cb2mr82060137.31.1791269711487;
        Mon, 05 Oct 2026 23:55:11 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:7c2:14fe:33cc with SMTP id ada2fe7eead31-7c87c945cb2mr82051137.31.1791269711089;
        Mon, 05 Oct 2026 23:55:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org,
        Vignesh Raman <vignesh.raman@collabora.com>
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
        simona.vetter@ffwll.ch, lumag@kernel.org, robin.clark@oss.qualcomm.com,
        valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] drm/ci: retire limozeen job and add wormdingler-rev1-boe
Date: Tue,  6 Oct 2026 09:55:05 +0300
Message-ID: <179126968605.1110179.12812564062301444314.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616115410.325837-1-vignesh.raman@collabora.com>
References: <20260616115410.325837-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX7J0yw4DN2Yyr
 Yu9CjlxkcnMt5qfIijRby1MDTO3ZwtMvUYRpNy7MrZx2zVRrEW0PtGvOwnTlwPexEWREkPbPYc5
 AazDJh8dQ40Ba9Lj7ruyJsCn4YEw8CdQw9Cpg/CWF4vKeb/3lcClTdLCjPYcZV+35jLQzxf2akN
 t92HMr+HUhwEEzPlVlWsTJwsNIDqIo91QszKo9nYyiz4+1iidVi2GQvfx+gI8CtksBWZJefjKt1
 bsHxWL0qZ4fVnK+vtT7Ji+Qd0Kizzmz7Mm3P5U8SBExyfEPrPApTpHb0+FlrlKf+fp2fFnTMh1i
 9CB57g58caABwfNKT9SR9fdm5FAO5etqdM3BdCsG7eL/soiGU5/QuswAhsVdNyX8xfg9OQAHvez
 9ag9FnvhwmXfaTa8qhS1wQ1DHhPAc8D/reUEdRxIKIOb47HOc89CvS1xDzHWafNPXpSUYEgpP1L
 iiIGmbt1V2etu/GtKsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX27mr3mNsRlyV
 xHzKbtXEqzJkNJJtcc8nHSCFsE8WJ7Lxy5juCzL7CoYBQc01JIbinhLhBSBb7SaRC/vvj/xEgHA
 29SFzKaf7GA+SFfuJ5BLkQCPVcAqVqg=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac49b50 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=fbh3NUXcjvyNh3hXOmsA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 2Sko22vJiGXU_4y_8b3EKo6V9w614pCq
X-Proofpoint-GUID: 2Sko22vJiGXU_4y_8b3EKo6V9w614pCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027

On Tue, 16 Jun 2026 17:24:03 +0530, Vignesh Raman wrote:
> This series updates CI coverage for trogdor-based sc7180 devices by,
> 
> - Removing sc7180-trogdor-lazor-limozeen job, as most devices in the LAVA lab
>   have been experiencing stability issues.
> - Adding a new sc7180-trogdor-wormdingler-rev1-boe job.
> 
> MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
> Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1687201
> 
> [...]

Applied to msm-next, thanks!

[1/2] drm/ci: Remove sc7180-trogdor-lazor-limozeen job
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ca9ee204e12e

Best regards,
-- 
With best wishes
Dmitry


