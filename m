Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635809;
	b=l1FhE1zb7fsTRZJ0piVTjd/fYNZDjuW7Hi7gkLkOEX4ZA6MHg32FMj6t7R3lVO8AyIxr
	 Qh3U441FAwOk2aHjkC6GKTROcGExiS+vK5xpO6nnba3/CAAtCb3dDaS4tBzo1NsRxKN9t
	 aaYwmjFRBb7GvASHC+P6/sQx4VXLY/loKvSElXPpob7nokiXsvRYmg9sMrrqJ/cmDEn0K
	 uHURC0ZpZ8FLUalu1GqVOBaLc7lKlksW3Gx+0QPXIqYliiP6HdBWH3dHy8NyT6TFx+LeK
	 LiL9O58LlxdDEfeD+az/1P/+Mf1PhWGppOMMy/qX80gbE9UWxm7GG6TADutsqeidKUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j6Jl9fkeKPAkBraVEg5312er2XpFL9q4OtT0Sa3z2xY=;
	b=3qLDdC5w6lWvDZWOvTAQ0rGtRolb5czIGB47TJNUIoa9vlYDPXkPDyl6E7hmdkk8sOMJ
	 hHK7IP0xzmdznfSjWD/3B4C6O6eBC+EAyED6x5Uib2fRsdGpFdBZt9AKbrUtGuqq6IYNI
	 pGpyi6aIcDNEhjbY3hlWt5Sd3zsNGECoouoneTp1s3XogosfWnFHzoEVDCDeXWNFfKboS
	 vToK8iYn4r+PIqTb1OYnV5n+JUOgRHFSIjCkReMrb8697LVvUoYJhpolN8sN4o0VcqAqh
	 YpgQGfBD0Zj3wD+OgRNHxhP/u4flbFEbUGPpRfbSUpDbDu0M9FYRI7CZ2rSvuhC9ChQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iQAra2AI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vk1+4iwR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3599F6070C8E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3599F6070C8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iQAra2AI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vk1+4iwR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpD5W3512214
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 16:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j6Jl9fkeKPAkBraVEg5312er2XpFL9q4OtT
	0Sa3z2xY=; b=iQAra2AIbNq7/30+mFcpeYfq9txDZiWaxZX56k+zgD4aaH3QmtG
	sSyfI9l/UKfP5b35RjEIjVJ31+mbbmtOt0O0Sl83IjDK3H0w/QeIbzqouR+OoC/z
	K9SZ6MhYI2PStZ48RHqM5QXaAtb/a1BLlmnCsYbaQZJJkXOaZfbDPEKrX00mM9OM
	9MaTABy81tXnFraL7zYFxpZhPzJEYBURF/Ywzl7Y6GN2G10yNDzHPe6zeErdw4rk
	xucPoSWltAoPDtIGoF0J3v0fLJkHCoRBN6z/1By1R2nLpqqWmAmWz9b2U9SpGxSj
	t18APwdWBp6wxUQoKRglKZfxxdBys4HJ+Sw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrhtpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:10:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea0fe07201so19842835ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793635807; x=1794240607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Jl9fkeKPAkBraVEg5312er2XpFL9q4OtT0Sa3z2xY=;
        b=Vk1+4iwRt0c235+iKeNZ07PbKuwm3Qo04pk5zlfZ8XS/K7Rd9FEUDtkFDsfmDyRX1U
         RJXtXJx+qobW8aDPopkLLfFfnxWEX5BaZTFF61PwH6/kNagkKiG1CH9NWQj7WF0x7tuo
         K1hbo31Lg9YPba+58M4tsC3V/PHKQdLivyleONCFNY5dqlRcAzleUCyrw3BvGtw5BomD
         GiBnS9KJwn7Ve5Fh4rOzponkHycooskgvyiNUHsAi15ZREryK2Uq0jAoiqeAzRC+pzh5
         SHJRWrM437ZwmaktlWTO4WZXcjggQRNjH1lfJ1r5WF/K3h5jTwqDTkZ1bFOI2iPX9HiQ
         EI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635807; x=1794240607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Jl9fkeKPAkBraVEg5312er2XpFL9q4OtT0Sa3z2xY=;
        b=I86Slvqyzq4MQMUokVa4rlli9YRU3Bz6bg9tD+5xRIl5Mh4GJ5ZoI8Nw9J7e+RTiFU
         8f60KptMq4dPem49hvUKvvB7JegKzKktUnJdxgvTwtCoild6xNUxJgShupRHI8bwwKUf
         DSAnxKHOHyq/0yvu8Nlvtn0BSeroHrUz91rSDodzqNQzzXJW1JKvARZxS4bCcoev7xgr
         GkN+X2l30CZliOG5rn1KNIuR/OcOe0vOhg7ubeefh6EOLWfoEHVEIGruG4Yvou2aUDyM
         mWfjTcjTJEKvT5cWFsjDfOMI2aD5taMm8xO6hNROsWmXPSARm1YRkFb/ruHmGismQzP3
         NibA==
X-Forwarded-Encrypted: i=1; AKwUvBwMUwbqEHh6npWrrLLRa0aci2dmyau+kB1u8pez5xAA7STMPgEOL/ammt8nUFRdAhRBDLc32eZEUmEAjj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QExbDAbROb8YRI+biF8HNi3bkM197uci+KB0VyUbeyx9feRQy
	qBfp66SD2wS7AsxezCdhkI/KWp005ZALVVGSlDUKZ0ufTUNFRqA5w3GS5N4lf9Gnujsv1at2axA
	IylSINsdtS6R+6AosZoygSlwaOxXqOl6H40LiHTRsRLZTLhQIIacRTl85wYMp0KQLBek=
X-Gm-Gg: AYBFou31GyWZN8ykWXfWO0iM0vYKv/NrzjNq8613pr57u7e/U/BGCviXfDtMv/dpy3E
	JVSgp5uP9Ktgoi+hxcv9dd9ziDRbSnG9un0tefYvMNOAY2nPhuqix2VitC+McH7d9M0Ab2JpnLz
	IalrSI7FXx5qEWj2nUjTHEObCAmUh+ze6FEbVBrASsLGfVC7QmF87wZwHlbykqHR0k9xRqy6YKk
	yv+sUCvdfE9CQvLvLNXAbGbR07A/xrW6iOtVWCGIfN2YMGKpxHPYNTcbHx5qWf0q3nE6Fd+9Yyn
	YgB809nQi3Z2l9HVSPQsb8w2zUBztYAdalRBOeMjCgnLLQsaFq+MhjuQCTHCG7EslXAc/C1uY3t
	hTlnw2sX5/YH1370lxlESNFJpdhep5dQedgRKtINmpDqqZcT3mqhNxFVjM6fBf4DsupSrmxmJwU
	kpFo/Ipnr0pOEZNE8XYlRcCQ==
X-Received: by 2002:a17:903:3bc8:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2eb3647079emr103787445ad.44.1793635806582;
        Mon, 02 Nov 2026 08:10:06 -0800 (PST)
X-Received: by 2002:a17:903:3bc8:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2eb3647079emr103787015ad.44.1793635805968;
        Mon, 02 Nov 2026 08:10:05 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928d821sm29672765ad.56.2026.11.02.08.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:10:05 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/3] drm/msm/gem: A couple VM_BIND fixes
Date: Mon,  2 Nov 2026 08:09:58 -0800
Message-ID: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8b5df cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ygTbR3Ydg0thdFsOExEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: LTASKAjYADB0gn3dfW6nhHNixwcuVmhW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX3rFz1Pan5yFo
 VScQFRFRKAmSK5OgI372KLOX+zJEnB088IrFm2PICEzbGjM+Gmv6xoLujCWrNDJ3lupdRlNx0ue
 ft+jYpdeJioQaQYLGb/ebFf96iCQ2ck=
X-Proofpoint-ORIG-GUID: LTASKAjYADB0gn3dfW6nhHNixwcuVmhW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX60cOp7ZIz9vA
 P9VjFwWgptU8YiZUKDwWrDb7LK7dBHPab51mdrkHMXYa5BFjcwG1dwRESzcL0EmuqM+UzSqS7OX
 BbXGxnz6ermWobZBjCWQGGeAeUZvR8WNwo0M8+I9dUUZsHOXMhj9bGrtjDjXNGQGCi3cqxao7N0
 e426hm7ypnZWHszNhNRKC8zJHmoGAS/E8B3Hq7iOVziOFpbBy4v8QD0bohQuYNu2SRIORxaOPmx
 5+KJJxYsb5VUqLpMkEX0dVvnVlUKIUsvLAVw7Z0jreFJoQf6D76hEvfL4+4t1ESf+fA4Rpg2fep
 EUJlNIK3QBtlOpSFZmx1y0CrbqZLme25qPeSI+iVtWb6K/c4srakNxUEQtODcd5wNz0/UlmvVXF
 Sz/nhjQodpoLtss7svGygvL2gDGea6M3d+JTuyRt46dm36i3hg6mbjQuSk1e6mfeO9jUjZ8Ptcm
 I4C/WepMxBxqXbQfv3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020064

Fix possible overflow in range check, and disallow passing BOs table to
GEM_SUBMIT for VM_BIND contexts.

v2:
- Also check that range/obj_offset are not greater than SIZE_MAX.  It
  doesn't matter currently, but would if an armv7 system ever added
  support for per-process pgtables and VM_BIND.
- Add patch to fix handle-dereference in idr_find() error path
- Link to v1: https://lore.kernel.org/all/20261101174911.25184-1-robin.clark@oss.qualcomm.com/

Rob Clark (3):
  drm/msm/gem: Fix VM_BIND range check
  drm/msm/gem: Disallow nr_bos for VM_BIND contexts
  drm/msm/gem: Decrement loop idx if handle lookup fails

 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 drivers/gpu/drm/msm/msm_gem_vma.c    | 7 ++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.56.0

