Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C78A4C14FC
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212998; cv=none; b=Rw7ZQhf7WIwQi4wDSge3Z92JmLI29/YWojBWcod5MVBEjf2+ys3ymd8u1yvMxOVkVFY+uAGAH9VNA1yGWsYjlHBlp6aUR6XeqURAHW2/cM0XXrfq1fGfmGzY92aajMV3k/617C/J2KRYmfT2KYKVJBukCRXAG17VFSZFzVQSvKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212998; c=relaxed/simple;
	bh=z7pGQWfb1LAA/kgbLXti5Rmd5f63nEbmiUqodt0mor0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q/U6SF3K/Qp3iGNTlZNVzOE8bx0aqZJubFQT/+vUAQb2VCynMFC74PURFv7Eoln4IurQrTwkndRS4T8pjct32eMebvH/PnDajGT7iydcHwOfEpjTuCfwDO3n9kntULKZhoLWsqFeshYNYnBxM5uyj6PvHh93+knyfl6IN2xdCio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjLF8oYf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLTloOSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjLF8oYf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLTloOSJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP4DJ2214845
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 15:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7BOMJomIb9HIja7jhV/C5sopCF+u5DG9RsBVy1jMAI=; b=MjLF8oYf6UQDqEcG
	hhN+MQfqZvDMVlzvUnqzAtZ2EUVtRgdJq/Fb8a27TIfIXF/k6ddlobO9ycR9TIeb
	h1dT6XofYnZ5MRHL4xrTAXRL+Ll0pc8nz4/oBNZyltenionpC3uoLFR5T6ikvQ8Z
	NVRDFxZwDHWDjZDvNf+S06YXdb9XTWFGW5LQ+570KTU9nvbFlSZW4yC9oybyhM4m
	2DoeChcmuZPnm/W+BPpJ2Zbfc0OVqCR0rOkaylpY9OXktCPwzzdfLpbUfgpXq4hp
	JFmSPcR9woD/UvIEW7o29bGzogbYgrHbZcyQWQKXgvxAeiqMBz8VpR4KL3YecmoO
	E1Aj2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyts8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:09:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e2e7425601so16406595ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212992; x=1791817792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7BOMJomIb9HIja7jhV/C5sopCF+u5DG9RsBVy1jMAI=;
        b=dLTloOSJtSv/2U6ob2YPoWGsPDR1K/4g+ZfS2i1O4uA/OHBf/sr0o2hsjLP2Rqe6F7
         Ui9UxPvfk71Q3506AFS1+lPUlVHq4NOK9qC1GM7DgYgjla+VHKj0b1V/maVyMEZ3eJvC
         KpncH+Ks8xlYvTiKZlNiGgNCdS5hHTNVv0m3WzNI3yNVI6oekMAChnSP+vAXhXYL2kqj
         CjbXdC9iwEIiPYvALFZhwVJjcQRdPl3lEBxk4PYg1rkqTvkyAlQxbKHPr5ftfJJuB5Rz
         YzCGN65Hu98TiTULLNEG40ZCCniWC/1zbZd99UMR4x3JxaNfxipaJ5928lyvRYqK2LTz
         VSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212992; x=1791817792;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7BOMJomIb9HIja7jhV/C5sopCF+u5DG9RsBVy1jMAI=;
        b=Ov1YIDnBvBxPJJnCvN8CRKnCHt7AUGtMkHwnJ9UbLT6XX+ICF9fDz6YL/CbL/Bh4Bt
         HjcBQ3pNp0Jne69i2m1Am4AoOUlHlgP3hJTmm3LN5F4w99h31moV6rdoJvu0SWhO8HAJ
         Vi43ivaW+y5IgCnwEtXnIBRLrabEIpCP+VXJLE7qg3C1udnUe5EGrXHHWFik5MVASSYZ
         2ynJ/Q0zHImVxqPM3pKAbkbhWEURtyv9ZEzSK+E8ECx4g7AEsHpIXnNiFryABIlw6AN3
         2qDeTjTHzA8xHslWY3baske4Cve2mU9Kl2PilKQ/1zrAOgAxCBYYIt8ZF2Q2a1YzQ9Ch
         Z4Hw==
X-Forwarded-Encrypted: i=1; AKwUvBz5SERgZspngofKZwqhsnjoO/x+3pGp2Wfwdr9OdxVQS7U7dp0eRdMLl0O4oWPf/qMJ0+fMwJ68/+cn11w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIceYegG2+BvJOHK+XHV3oLIeCBFwLvmyRpF1onzRcYe2KCRuUr
	cILBtneUe/BFfbPuLaBP7D1Wcn9QJfMF4ZKsyVvLZ9P+Wt34NJKIWECtrlMWSXR2EpwMnKsUiRt
	SU+dKCYaV7Iw5cfvWhpVV8g0M4nuOfSaiXODJJ+gFlh94BsO45MeE83FGHEMvVxR3pvk10fIc4B
	k=
X-Gm-Gg: AYBFou34YV1yID8wOjaW9eFFqW8cLQO0O5TyJQ2FrkPVOw4vj+kVK/f295o7XgetYgg
	Zd5e/5FeRHBa6hzbzTzmaHeu4DzY76rXeACraGXG6LNrhkRKfQSw5Xo/Q4+VXCXuXscdIS5QYom
	l3Y4Tgdsa8f2CFH73x/2zXnQzxs8OIqhzXtP5xPq9FMhfn6XtdbR65fsvqeotUqWenn7NcZZGuc
	YkTjepUDaaqpC/eNWXpHxzrf4OgJfBrTSrzqfI10JrZ2QKpUfFrXoigFkp8DGHnWlgE/jy3z0sZ
	FsWjBx40QpzwIht0L9ALUIsvblumBPRS8w6pwrOgeTu+kc4Qrrv8esN/750D9amp5BS9hTIh0kq
	q+An1LOtFuXqx0VC8P+suXE+XlbJDAF7+Jn1iy+oISf733e086s+oC/A=
X-Received: by 2002:a17:902:d512:b0:2df:375f:b7ee with SMTP id d9443c01a7336-2e49b675014mr77177735ad.18.1791212991924;
        Mon, 05 Oct 2026 08:09:51 -0700 (PDT)
X-Received: by 2002:a17:902:d512:b0:2df:375f:b7ee with SMTP id d9443c01a7336-2e49b675014mr77177375ad.18.1791212991307;
        Mon, 05 Oct 2026 08:09:51 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae1bfsm9130075ad.28.2026.10.05.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:09:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260911213144.130192-1-rosenp@gmail.com>
References: <20260911213144.130192-1-rosenp@gmail.com>
Subject: Re: [PATCHv2 ath-next] wifi: ath9k: delete channel-context timers
 on deinit
Message-Id: <179121298946.2358654.16856566476480505783.b4-ty@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 08:09:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: cMMJWkxDdpMUGcKkpS-HD-8qg1-ZMSla
X-Proofpoint-ORIG-GUID: cMMJWkxDdpMUGcKkpS-HD-8qg1-ZMSla
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac3bdc0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7eYl0IV7dGDCLOCTNgAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX74auv+f22/SM
 HqL+s4c5xFxN3RdD0YOxTDq5+KtfvSgTnH7+Ef/oLPBiSa0VmQ4eY2+jZwNlcppR1izV3wnjXYD
 wKXAVNFZAUdYt5sYpHsJxvBePTTqdfK5cyJU4HPi29h2eg2+qXTd48CnbsOqZPCF8VbGc9J3GrD
 Zh1pt8LqFT9k4oSCAev8oVARCu9PybWc+4WYrEfAMA9gXC3ZWV3gLCRSfsTWP64xhakj6LIs3fm
 tUAS0wBJLRjMCUwQfJWWbYMP3LWbk+cXD9Qo5vXPUH7lCzqbl8lRmtoWPa6yzVh92d5pC8NNWcU
 vEa5zb5itmL1EMRepYBMCMpNoXH/VRyBf8WTvustibUuwqynNGBbYCLQPY2kslH/5Wjh6eEqy1L
 f/Jy8hTQHzYwRdmB6Wjk3ipsjwpJisoWJDqJUE5Rt3xGJ/4cooLV7MjUOibph98k4RISXt0/r2A
 SaSsw3bEIyFSdBj1Kqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX2G412D786izr
 l8cUTdI+Ghv7bpPwwG6+LlElpKyG7XYYfwbI42dHRb8CnKTi5cftitURJY4xY/LjXVaIbOkmJ8N
 V08QLvHIaLtR3QaBnRTyOGMx7q2/Bhw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050059


On Fri, 11 Sep 2026 14:31:44 -0700, Rosen Penev wrote:
> ath9k_deinit_channel_context() cancels chanctx_work but does not delete
> the offchannel and sched timers set up by ath9k_init_channel_context().
> If either timer fires after deinit (e.g. during driver unload or
> suspend), it accesses sc->sc_ah which may already be freed by
> ath9k_hw_deinit(), causing a use-after-free.
> 
> Delete both timers with timer_shutdown_sync() before cancelling the work
> item.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath9k: delete channel-context timers on deinit
      commit: 81394dfb9a7905472957628b560ae894eae3a30f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

