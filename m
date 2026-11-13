Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592103;
	b=NQIgKhQ5sAnfet20Qnesma2jVhfExknVfS2cxIsO521vVr5miOLHAZYWjwkSIw/l5hXy
	 U2vI//3vrwh88Qu+eY4FR21+R4KKOC5u9j20KgMZxPDojMClPV+wWvrZw8vUrTTFmr5Mh
	 u3aOIYVqjJpVzxUhk6M0sRGZiPuvN/CIEiYLwKq4pBUXIPgv1JvcKJ/i5lwK7JLEGTYpB
	 lYie7FLV61cmw1anClzrvs9ZRWLK3Y9OsOSi2jRvfCGI9HPAoEyObTnfVHNkGoj47Cvs6
	 fo1RrwUDgql9lB09lpb6zdFXI1t8aGtN/wvdsa+r6466RIwSScvbZ88yXCLIo8Oq8OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
	b=oXuRpu/XOX2lLJXQ2GEf7c0bZfKCUDqE4j67b8hABC+iJm2WqqvQ+QyAfTVKuY32kphe
	 GFAsBttR/eFtrxS5o3k98xGrIEuZQE0QoEmm5hGK5dpsTijvz0aa5UXrDsd0WimyBKbqr
	 lG5XEU/5m/GJRZEmk3qTUlf07XMWBf/m8OX/ufytI7v/2UOHpXDW2hwDN0A83+WIQtGhP
	 zDc70LjdaFeqQ4oPtpQCdgA41DAZLY0pyZBKjBF7f7l75/biCmQBekqo8S0LosUKs6cnv
	 yL4hUs5HKRoERdCX5/r4o1hKo/ptdfLxG2mQ+vcb8SqA/WDKPLW1YAcVElTe/oH8owA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BMatpwbj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyXx5eHl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF1606EDAC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EAF1606EDAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BMatpwbj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyXx5eHl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5EK1189950
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=; b=BMatpwbjJXhz7tmC
	ljasbfmlGO95hnJLqxJOCrP4eQA5/NxRquVwQI3nLTw2AQPvJfq6nrHByqab//Or
	5cbUlGEvb4Ay1pzSqsgpN9VN66PuxfhxglCSwt38Bcz5q4qZEJMmu93sMzSrplGf
	jpt5AhTtjiAuqNRwyv3gZisR+GTvitPePq3x637xstffZODbFPHWA6ygF6EFyNef
	NImCZYdSZCXJxJ46T/kfSXeFigDFJ/2LEFXabR7rv3oDAZ/HTgWrm08IPCrIHaAT
	ZCIYO+VDeRCRqlUe1Kgnhgr8042q0MdFVDTRgX5Ceh4yC0Ttwb4HqH4Nq7uJFu11
	UrX1zA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkfvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so1061837a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592102; cv=none;
        d=google.com; s=arc-20260327;
        b=ctqx97tZF/hck4T0ElWmD5UkI/6+T1p/B7725fkb5OIQolFNTOK7Anhe3XCKMUFSfK
         YrgIJQtgD7zzt/H66wLtebJi1qTvzYpfny286VOG0R0AqXkMyP7Jy6BXZTyPpH0aGKOR
         auoQ0vnzOjQmVhQ+ASxNcysxioDpK6/WsTyrFo+7ls/oIL1MsJfrImC1J1eud3dDEWE8
         md5X1r3ja6ERIRN0Fh2flXSmRO0IUb2f5YwN9psOvAg25gEYatfjAaoetkI4s/0gYfSx
         motg1/6HStO9HyS5aS+r3ckMsEr2/39pQP5B0Y7BDfuMCPB9KZmKVlpW+GoImazsjIKF
         ZcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
        fh=P+moqLfGBhul+TEr1FZEVIm3Jpnu1rhrs/JteN4czQU=;
        b=Nv9x34M9cwg8uYayBGsb/ieNl3328NOm/KCutnH06h5iBBpPA66x/6B4YiPxXa3Vwi
         A9JXryyq8N4B3ekKwUNPUUyYzEu5EOPYHstJA3ZXSpccRPsM6Kacs138cQgyWqYAC0QY
         416yAKI8yneivmhaASAFw4EA65BOfQd0JXGQnlVZBgi3+ivzrRsswKY1r9wpH+2snj89
         TmdVJ5fFBG2+4CYQ1W9VrL/kppjycblwqqWABU92m6qyoRr45ShGFYyyfdag4Y9MEWKm
         I/9FpTSJc+Mlyf22ZedIZ4tuny6mHWRAIiuzaHhPz1YWX9lJCYPFWbypdnXcOFCBvBIu
         u5fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592102; x=1795196902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
        b=eyXx5eHlWjvxQ7pOghP2ubvUgEExQgX0/gUBQbUpxTN49gYoxLlNmvm7INGY7PZJcY
         kT7DM47eXITsRGRSwJejVust9xBILN+xYTdIu8RgBgGwbzR38Hwe2paJ1xryS7cxdjWx
         TzD7+ZzmfWWq+wImSmNtgZYNhJsZnoAhWVPUf+UIdDFKkzLDQ6wL/g8gP4stJ740NlZ0
         +OQ2ucpKq9djWPRPDZRA7Pqs57bQKv17vgmqd31N2O1wHsu1lWeBnrkvTTEUCFuYRkHr
         tuEr0ezMWBgDxZzoeFzzt/TMipnZhAiuPIjCQdIdwfYtvI68mVtQmN5B/bnFWQhU1xd9
         INpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592102; x=1795196902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
        b=StgXvLYCsDvC1+GQHRKwLZi6sfJu6TlX9YNjAv7v5Qjb+DXG6chiZUB1GaczGzeSG6
         kvqoOZE3l3tnUQkyuqDVfi/rjIguvbTQtoRlIq2c0JaYSidRbYbxgH0vau1SZuhqby5R
         2xvR8n6oS0cHXJRH0QVaX9iJR2/DTEM+t8QQw3uj+r6sFrFnp13vUUnbwzFs1mifRP+I
         hbMb0MnjYRbaGpyraD/fPhLceZ9ASYCGlglI64IlkQK48PSobXQEznaP1G5l1fFXsRsJ
         r9YSP+MO3BMSVhfddqbAzyvIZoCy+/9b2uV99QHmwnWnFaiQv4nTlzEq2I0hwHdCY2Rv
         dTpg==
X-Forwarded-Encrypted: i=1; AL+hErGN+kUB/NBWGq245Q1UUDz3FLXJxd7g1A77Yv113/6P8S/aNFLmRTgIIe4wTxrPQf/LZ4NsZvLbg/3mJjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+azz3PSgK6VXYjOoo5mIEIAKeBB7M4Zb8BErgosw11Fm1DqEzJ
	+zVJhV0oGovoqZiWEbn5um2vD5/73Y+MXuyvxi96EfF490pzrZPfoUpEcMsK0bo0HuMXpCQG2xZ
	c/GFaqbQmIoMEouFiS5WRcsoDSvD3jxg8zgFITZMqXQW1E2ydrJFDzpcarQ1QhVl57mXWHIsVot
	fCB28V+clKW7sVSRJ69e3HrdhjpStbi4ioDg8SaddsDA==
X-Gm-Gg: AYBFou3xSZZag2G+GPfdnbj/IGlu6LtmYaVQa6QdoMEa3fOBrikrcgLqK5CrLVryyn4
	eUet2mxpuVLCoq+kRunXzfGvGSu1kCyN4bqUq44fHqihT11wMPuTRg6JT3M1D7xQ4VBIiRL3VTU
	Ic7W5adU5grMyP9b8dKNpt0UjIO4JTBR2mBOLt7VqxMduCSQGEg6K95iygAA==
X-Received: by 2002:a17:90b:993:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b1b09fa555mr2052185a91.16.1794592101961;
        Fri, 13 Nov 2026 09:48:21 -0800 (PST)
X-Received: by 2002:a17:90b:993:b0:3b0:e2a9:3466 with SMTP id
 98e67ed59e1d1-3b1b09fa555mr2052164a91.16.1794592101492; Fri, 13 Nov 2026
 09:48:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021080517.2161-1-okerixx@gmail.com>
In-Reply-To: <20261021080517.2161-1-okerixx@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:48:09 +0100
X-Gm-Features: AclHuK_cX9nfIfMsECKx5geydS7UVI339oofu71FfWZMTLtQ_zkBB1Cw2kA9Opo
Message-ID: <CAPx+jO8N4yLD8pZ2vr9_3MD9==FFMdvQG+=1JjDoe2kG7DR1iA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before sync_state
To: Oleg Keri <okerixx@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: jH0on2K-T5j9sxxPw76Ha8yiiAV5GUD_
X-Proofpoint-ORIG-GUID: jH0on2K-T5j9sxxPw76Ha8yiiAV5GUD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX6LI8of8l19zj
 sfdBUdvyI/tF2hqL+eAhwGA7mBCcWg96pXKqRUjzjXM6YeWVFasvHDWTs+ciwTIMTWv5RpldySW
 /+sQq/wPlIQNUwe9NWaDJF8a5UKq3bg/H7xqF0+J3Kodi+j4tS4VAvqYQUZQoiOxUNAmQzsgSed
 YBChJcu5N51N/cD2tWTrXFvK0Ofn+xSG4fWSVZfXcAGsydbpxpnd6iToRH/+IN0XC5sAnYZlY92
 GzkhiCSVbuWDxXskghlP2Md5frJusegj/I1TRIrdVpvZ68mAPaDu1RmQFzTrjWitrHnl/j1Vk8D
 zeIJjk4x+ZuuG/Bp4T7/mAOtEISBfnAs7V5OPNJe9XmqduIwl/ZvJhm/zmtmAI4s4U4dIr0mZOU
 fs2spfcCoE3WQJgym1c5lUCX3KrfViqwYFZbr8/Az2E0dnl7z9ca4Mif6cYSoYi+XK7HosiQO4V
 e3kGjalv8CD8nmd73Yw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af74d66 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=4GocJDDa9GRkIFf5CVIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX/0KL6GzzcgTP
 G9qlHyPxGYZucw7xazphKDR07NVqS2QxWtryOBHDjZ38N7XYR1kdLQHO4g/NntZEaVsbxdBeLb6
 TGhaCh8t6WANgUWRHUAV78ggEiCRs2Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On Wed, Oct 21, 2026 at 10:05=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrot=
e:
>
> Until rpmhpd's sync_state every vote is clamped to the highest corner,
> so that hardware the bootloader left running keeps the rail level it
> needs until its driver takes over.  Nothing the bootloader leaves behind
> runs on the GPU rails, but the clamp hits them anyway: the GPU clock
> controller's probe runtime-resumes and suspends its GFX and GMXC
> domains, and from then on both rails are pinned at their highest corner
> until sync_state.
>
> On Glymur gfx.lvl has 14 levels and the clamp holds the rail at the top
> one, 0x1d0, while the GMU's own performance table ends at level 11,
> 0x1c4.  With the GPU driver and firmware built in, the GMU boots long
> before sync_state, and its CLX DCVS calibration does not survive a gfx
> rail held that high: the firmware gives up with HFI_F2H_MSG_ERROR
> 0x007306c7 (ResMgrCalibrateDcvsLvl), the first HFI_H2F_MSG_GX_BW_PERF_VOT=
E
> times out and the first GPU init fails.  On the Lenovo Yoga Slim 7x
> Gen 11 this means the compositor cannot start at first login.  Pinning
> gfx at level 11 or 12 instead fails the same way, level 10 and below
> boot fine, and pinning gmxc alone has no effect.
>
> Leave gfx and gmxc out of the clamp: they have no bootloader-configured
> consumer to protect, and the GMU votes them through its own RSC.
>
> Fixes: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")
> Link: https://lore.kernel.org/r/179248663855.32151.9955864156939592299@gm=
ail.com
> Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

@Konrad, can you please confirm this makes sense, at least short term wise?

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index fa8fed5bd3e5..2c9d4beeffbe 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -1006,7 +1006,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *p=
d, unsigned int corner)
>         unsigned int peer_active_corner =3D 0, peer_sleep_corner =3D 0;
>         unsigned int peer_enabled_corner;
>
> -       if (pd->state_synced) {
> +       if (pd->state_synced || pd =3D=3D &gfx || pd =3D=3D &gmxc) {
>                 to_active_sleep(pd, corner, &this_active_corner, &this_sl=
eep_corner);
>         } else {
>                 /* Clamp to highest corner if sync_state hasn't happened =
*/
>
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> --
> 2.55.0
>
