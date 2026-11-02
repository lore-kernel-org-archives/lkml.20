Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640008;
	b=qanTvYNkjwJhucxEr0tRw/KsPk2qjVf7J4aQ+ykKY0HYvLA08RjtLggGwKuFw54RtWk6
	 2co9moDF4KO8JIK5drTvWD2Ell8T0zKfsbij0/6rh9X13gzZaD1tM0uYtqBOBgXbtWRDz
	 aLAyVhAYo/MDhr5YTyRzKtwFinCsXjDBiGY9W6pi9OibR7P53iI6npr9D16wE5mTWyV2W
	 biAIdbgKiZHo9HRfzDe5f2kmMjTL5/jSZpafNsCV/xrsPSCwozS3jQfwYLOF0mYLRKALp
	 K7swfd+4++iSB52tivttXjs2V+y7YwdXofM4s5PHYiu6sJTcE1XkQwowrXqdq0l7ndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wbhUry8uTNTmLHMoCjcua8VR18xywygNgfABJXvuDxM=;
	b=5V7Tw9lNoeR3i0FeCK38DM9UfQFUebtYNQQJVuUqulgVg2A6sWsarMh/GwLwlzDq5WYc
	 lNEuOZ5QyiK01WjnsZ6pjYAJRweaHWWPr/xgoe1C1GeC3YAhf4fchHpoCit0S9p9IMa/0
	 FRj4Ze8jNDauClQ4t0YDREcaQnVFBjd4jaimuLo7v86QvRaPxr5rQgSr+L/ekyZgoDc6v
	 GgmbjH3eiQlfKApYGdrtux5/mbA6W85RYWQMSp2wA5bM3VndZJHGxgdb+Gd//s3wVQzKw
	 3wLrhDbaI6rr9r9Y4bCOxd1qLrv3weVgLDRL8X8qpMsxeXIqLvqAc1p9jrTgi6fhl9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YM1fIXsQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KVbBeqJF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81F8606CEC8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D81F8606CEC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YM1fIXsQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KVbBeqJF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GYtT61222688
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wbhUry8uTNTmLHMoCjcua8VR18xywygNgfA
	BJXvuDxM=; b=YM1fIXsQXx82XBg2AG+dABRQhyW/baFIWRBVH7e33pslxCDlcuW
	LYx02RknLm2L2PPMYjc4RCsGyvFLAAUGnmrJEunmOVFcCpAiLQKHVnOsJJYZBVQx
	Nj1uIdNC/HS20LrTmGXstZXGVIFPbmkOC8o6NzUnphE4vB6gyyIIt/rIc1avhtyB
	F8V8VlvKA5JAuMrKInpR6eiRKmCUv/1FpBF+QMmkjMrRv8A7PCmtbjadzmSNQn3T
	T6heZBzihkBwklXC26QU8fvbgn/pT/BVPZZpmAYOh4nitbCKIJJmzgzQJIe+NC3A
	DKtxe7loiY8QBVs+7MAuRB7qsA9GGQ6wSBg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tvy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:20:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso3047161b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640006; x=1794244806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wbhUry8uTNTmLHMoCjcua8VR18xywygNgfABJXvuDxM=;
        b=KVbBeqJFi9WYqCQ1ogQ4erGP24DDubeCp3941Tjfzq+HnTOOF0VbRt5R/nxjrSMSX7
         KSJPOvMrGweRu4oz7FdLOu073Td53mXmwXidQYgI+Yyu3KlxzIfKwLMlNEaFU2bTP1qq
         BIqyOC5VhSls/sSTH9PkY9WGr8MXFBsQCumFk3bhADNLGc2nOW9agt6Wx1tG6ZJr50IE
         KSet3/AQTzAl51XAAMOBZpo3azn2x5hn4O7ULWBwG3VwM41iWEmi6089URPVJiehfNBI
         zd1AlyYfsEBf9Rfyf9CK9Mf03F9MZlcwGpswlRB0jUnpijZsRKc3enMObj96UDzzvgTG
         YFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640006; x=1794244806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbhUry8uTNTmLHMoCjcua8VR18xywygNgfABJXvuDxM=;
        b=LgcwJqrTtwwvJJRK9brP1ojDG220518YVj0OgmG3o8CW0IHlsTKbcydnHtq1RFFAhb
         X7nfDbVuasBIGc9JAM1WrbuEQRsj1pPw86P3TOM9pso++l5iDQ2nCJ0A3OpmWySm2sw8
         dHS5h3gMgOf1lHp1Nl68ApO2w61HWiYgr59z882OCIvfht20CSnrzSyqFp9Xb1db+Nzu
         EQxQcVg3F2qJOOG6UhXVF7ba85O4cph2UjBV74alvqlDF5mzo06F5JW4dF2t/3Bh4Hn2
         Dm9bb/feonaUKYlYsLiGbKCzBOOWvzejfvvLT8Zq1OoCub5myCnOKHqmO1rVyGiiY1KP
         jyeg==
X-Forwarded-Encrypted: i=1; AKwUvBzp+qzoRBEygIYqcQhJ5VDxqi8z1dxnw5SER4JID1m87x67d8O23pwSveBegTRZ3/ZkZ/WeqEJ99KvyOZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bsvPtrUmPZ6JXkab5rygejgNWKTo5+8V9hsB4BwuO0W31swQO
	M3EbAF9pyNL18AIydAvc8pAQjXY6CtTz1jMcsoQupKKwQyddMFygxECwRxXuDlj6vg7KTxwcDQp
	IMWpWitQEgVDZldAjIVe3UvGTilk4kQ6eSdlP+nKxyDK4fRLp/KFXOvMyAUBXy0fW1GA=
X-Gm-Gg: AYBFou0ToJFiziupyn838u22TdMdsEZKGTuhAUYZVXYWZI22CXd+TRNhya8mQWDEQ88
	9sGCRk21eqacVGjRGXggfgLDvHgFFCEMuD3+g9gCeKKdGOFQiXcU0gXLy6kZ1uypzxGqxenqPAr
	GX9tAlVPYKbyRIyttc1q+tGjILcb43JoACcPtOS95b6t4eP+IIfKPluqwSNz4ct5bzHtU+IRk8k
	6vw3eyyFDQTWnW70jihBWzjC6dgseXobtNsgVmIjzjRnDjc//sv8JfKaqu/VP2s+zqi+MBomdAI
	z1TDWGNNio/BZnEaclw30YyK6vLi/jjoxKAn2rbhFhbjRhyRkZrGWnW+wNIMiLxXUqdtxKrd/Hy
	5gTqRpQt/Mrd+KWHY6v8Yj8G0pSIxrGIufRFYkZOe8VwjkaOSTzm1lqfvK4xA23bbURZoaYwWhq
	Dls5vL0kQWckbDpdkQd6YpLw==
X-Received: by 2002:a05:6a00:b50:b0:89f:3447:2dd9 with SMTP id d2e1a72fcca58-8a8324b1a38mr8158933b3a.29.1793640006302;
        Mon, 02 Nov 2026 09:20:06 -0800 (PST)
X-Received: by 2002:a05:6a00:b50:b0:89f:3447:2dd9 with SMTP id d2e1a72fcca58-8a8324b1a38mr8158913b3a.29.1793640005686;
        Mon, 02 Nov 2026 09:20:05 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9aab57sm2209733b3a.46.2026.11.02.09.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:05 -0800 (PST)
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
Subject: [PATCH v3 0/4] drm/msm/gem: A couple VM_BIND fixes
Date: Mon,  2 Nov 2026 09:19:56 -0800
Message-ID: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: _K5QXONTz67Drp9blhoQGSPHnhDAUJqf
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8c647 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vDWxNTotJWpNCD247a0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX94yd0QjR0ZWw
 PAJGAAL7klzNarOhkcbV+szj4RgnTIqsgjVdVvQEry0lOZNpe3hJ4Nv3avyaDRezZ9RG+X57v1C
 F3+J8JSOl9B6lYR59pVAOGiAp1wOdVNA4QlP3liD1Ag23sf3OwmmoiMR4+0f6ZNCTjmXcYqEsbd
 hBaQVBzNUWVXFlSGIW4d2JRdMJE0l6xLRg8OVZLJjToEUy3iNlobqXq9Uu6pOrXZUxeSEV8sB9+
 sEezLnHMQFkOc++//YykPrpc7+WwhGSFY5aDVY35X/cl9DImjLe+oIMeUogMV+XKkqCNZd9US18
 GH0dWsNbJPZyLncTCkziZufuLTLni+h9h0H6EP6kJUrP+NqCAGnAsgp3EFAgL/w/HA7C7VPFTK0
 W1Yb9AYSC8v3iJQw0vSeqz7dCU1KIKbXUH84/G5E+tJmlkiAL+KZCPmZObgz0G40K+Wyka/iltE
 6kwPDHqvyzmGW4IrKtA==
X-Proofpoint-GUID: _K5QXONTz67Drp9blhoQGSPHnhDAUJqf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX1bSnLO2wSA+s
 8aB/mI3CoXjHFrzncbqHlEOe10HUKpWChCVRN7NPqg8Z4aPWed3BnTMbHGm+yd63q+bjR9dJLrz
 ouZu0oewy/UoenaiNTFn6CEVOb+rihM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020069

Fix possible overflow in range check, and disallow passing BOs table to
GEM_SUBMIT for VM_BIND contexts.

v3:
- Also disallow range==0
- Add patch to clear stale nr_ops in lookup_ops error path
- Link to v2: https://lore.kernel.org/all/20261102161002.497152-1-robin.clark@oss.qualcomm.com/

v2:
- Also check that range/obj_offset are not greater than SIZE_MAX.  It
  doesn't matter currently, but would if an armv7 system ever added
  support for per-process pgtables and VM_BIND.
- Add patch to fix handle-dereference in idr_find() error path
- Link to v1: https://lore.kernel.org/all/20261101174911.25184-1-robin.clark@oss.qualcomm.com/

Rob Clark (4):
  drm/msm/gem: Fix VM_BIND range check
  drm/msm/gem: Disallow nr_bos for VM_BIND contexts
  drm/msm/gem: Decrement loop idx if handle lookup fails
  drm/msm/gem: Clear nr_ops in lookup_ops() failure path

 drivers/gpu/drm/msm/msm_gem_submit.c |  5 ++++-
 drivers/gpu/drm/msm/msm_gem_vma.c    | 11 +++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.56.0

