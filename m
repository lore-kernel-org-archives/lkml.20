Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33BC3DE456
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408392; cv=none; b=WFlL9SZcZ5Qhx8zFDEGNv1uSMeAnUOlXko+7GfhD3wcQUYLQGv7uZEIAg/XtJg/jpldnnfCNLU0GTKvK1Ut06/5FfVtF8JG/MxZoOzotac0BVhYNEWQNWE7/siaGEjbI5Cmaf8A6yU7ao9hEd118kAl8bW/fwtCrkgrjgFK6qrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408392; c=relaxed/simple;
	bh=36eUkGmRXYxap1bERqmr/vE5FGGwQMd9qbYovbe9Irk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jp7ky+9QzHM3Unq02+uobOlz3q6anRsqgOez3GXFFmu4XEAHQWlQ4OupXbrmzIpFKvDSuv0YB1R/3j7gurwEVy7powMmKV8rqhurGF30l1C06mTWUf1N5eKA9v4zWnSkKdeE/zZ1syCkgUcZ1AN98Nky/b3kYepjG5mnJX2aX8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2AorjXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVzwLqhe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2AorjXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVzwLqhe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ossu723129
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TlR52ADOonRtbtSebcO0TM
	M6uvs5Fomcnb17yypt3k0=; b=H2AorjXPR4i5+V6vjUhVDvfucimDnkCoZ128F8
	aIT/iViFIK1okOqIM3aHSDRLrMWsq3liL+d5unAby16qYX4a8OsX35tipIZxEF5s
	liVri0e91/7WYcjZqGZI9K2CjgUyJGGNEfHwMO3u/zwRPbtxot0GNgvdA8jkLEsn
	gISpNCGAwa7UxkXVyPdPmc/rmDoJ0NrIZaDl/AxtduuBJHhAmRgmcRRlXOOVBJyE
	YZOi4xKmImJshfesCzpuddC+kC/hm6iaTyZ7b6vsloic9rC7A/+4CyHYvonItnfF
	vUZ9NkYGROt9No3YmuFdf2bP9/kGZnuatwhgwnXHYHjMskrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65grnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:13:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so377910185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408390; x=1793013190; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TlR52ADOonRtbtSebcO0TMM6uvs5Fomcnb17yypt3k0=;
        b=hVzwLqhe4Ar9BdJdyhR5pFh674hpWSoUWveim7iuXOaaKBZJ9NmXlYWIHEwvtOwMKy
         nfWjcCwUNb4cv9BVdyMBjWJLYqNZRprs5aL72mKfsfkqzFYJWh9+KrTsC6MbiDWOn9dP
         ip6yFmlJ6Z4NzX4bruaLrlZlbcgiZHGtLoQ85cQenbrCj5v3wsxoadTE7Bjf9ofUr8WL
         M6OX0IkgsQ5yg09JkcRgW8TPxOmmaF5bUVHvseu4ENmc/AqwUN4PPNiac2M7Vk8wrbrh
         qvMOXAm8CNyAdhaVvKcDMwnXehEn17W6uDeG7DVoVM6lzC++pZpKNvE1OXb04fs6woMy
         wO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408390; x=1793013190;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TlR52ADOonRtbtSebcO0TMM6uvs5Fomcnb17yypt3k0=;
        b=jdKHvToDoNZdGTJTrijfW6NW+C7XwRv+CmU6mp+FYmxQqm0tDXXN0/nbzD/25kjiWc
         LOE/F1lY98CJcaprt8ivE2uZKkZOpOg5VGjURUvBegc5JXJmQQpJjpKgQdy037wbJulg
         7BbESPsjII5XRWgo1tT5yh2OpyZVfX8SUJmyPyjau3SFx5Ow1cA1yqbj2lfnfyDloZ36
         WfHR/d2Uud8ec5Sz9XUVV1tXyR8XwLw6XM1jigBlufm6vGhPgxA7eufTPVldcKpvby/i
         gg6iaxcF31cXimbGyjmt/hBnGrbZCgKTa5MT0SaKUVA1gcno2HeaYy7aA5qa229Fwh0c
         k5Zg==
X-Forwarded-Encrypted: i=1; AKwUvByxR13yS0NyW3rmRIkPe5XP2DrxTuM467S/oWhU1u01+kQCd2Luz4hInMm9zAgdZjbbGHwUJbsO4BBhQAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9O3MJkw+4WQLhNgvG6iQjaNwrRV856DlRLLmrwbFHHiX+mXv9
	mtNW7orbU6XDGzHEv+Q7mZdGycYcoqrou4q72HkZ7xHGruK5s9eyLi/TRq7qE8v5vonIZdORlul
	l5Xw1lOF2zRnkO71QGwL+9w6NZqKW6CdVAMfO1Wtuzb0gBOWukoygdr1xLxvp9lH8ydk=
X-Gm-Gg: AYBFou2iWZUV24UBPll0iaxq18CN8hV7qePNYQInsettpkFtyiRxkTsYljy6SWXHaJz
	yNG/YWHz+ALh8ik6mFx32FEtjT3deeuNH0IpoZxczWPLon40HqxfALPpxLiDTbN+1SdDTwcoKBG
	vr8ayNP4OVEmcf1K2QMGJIIGf4mOJddWTGIBzew+/XTWdhbTBfCkt0DFxKi28MY5P3cpg/O75rj
	A2CcQW/zHPRXZR87LLx/YclbAZjnczUZXMTMHB5BXbzi9D3rFt3ts2u5B0ADcQAbCsgxOyRCcCY
	1h/1cZiiFDVMCAhCC36J/vSH86kR1mRZ4mmclTXb4TbRE6vw4jO95f3X3oyYyy/cZDBYG0SuNfc
	u65atudx6hNauDe8+SAoy/ZMPCCzGqcWKD1QHO4RkoAmg
X-Received: by 2002:a05:620a:a0cd:20b0:93f:2e7e:c818 with SMTP id af79cd13be357-93f2e7ed0abmr614913785a.59.1792408389781;
        Mon, 19 Oct 2026 04:13:09 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cd:20b0:93f:2e7e:c818 with SMTP id af79cd13be357-93f2e7ed0abmr614905785a.59.1792408388516;
        Mon, 19 Oct 2026 04:13:08 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4256c790adsm211472266b.31.2026.10.19.04.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:13:07 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH 0/2] net: qrtr: don't lose name server packets behind the
 HELLO gate
Date: Mon, 19 Oct 2026 13:12:00 +0200
Message-Id: <20261019-upstream-qrtr-hello-gate-fix_b4-v1-0-bd420aec171b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNUQrCMBCE4auUfXYhCaVYryIiaZy0K7Wtm1SE0
 rsb9fFj4J+NElSQ6FRtpHhJknkqsIeKwuCnHiy3YnLGNdbYltclZYV/8FOz8oBxnLn3GRzlfe1
 qDg7H4GIdW9NQqSyKsvwezpe/09rdEfI3S/v+ASFANPuDAAAA
X-Change-ID: 20261019-upstream-qrtr-hello-gate-fix_b4-c2e8c2f4f906
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfXyNGxaL/dDII7
 iZwLhFBT7Y+eLVNyGnK/7MWR4TSg0zTjOSP3cw8mOVhpQG344lASXSECD69Aa5ok7ePrWXCyyUl
 M1wfXcobzZfvHbZzzDvNbXf9+yFphyQ=
X-Proofpoint-ORIG-GUID: Jf7KjuEnzqkS4_jr1Ug7WqquDZM--W65
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5fb46 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iOzWpaUfyYFiVLkFVAIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX3Q2XC/GlbojY
 SQC88eHdteifpmvecHvAjiYp8YaWzJ7vyfK2xvxvzePzhwjB3MheV99V0MjhO3AxDWiNqA59wvY
 Y2TOjjJjfFQ3aLQblUCOfK3/Agu5TWC/jHpI/RWQ9/t48ag9KxmlL/Bq34zDpz0rQCI/+xAKrvY
 FZDFQQp3ZDmGoMlz0oZI8UiH/9uwiCeaHlXy+EbVpmcQXzU5Ee7OOFLm2SbqxLtRFavtniCLRFB
 ay9/5E0QgjP66uE6sEQIHB4g34pWin8LG+J7HM3PlUhI7BQviPnRTLQjxbd2i8VugZ2fbEF7RDS
 QdXvIGSadlodgJQ8e9mk1IAv4iy+HmTXzJDX7p3B5vAl9VBWYXVu154M6Ek/9idYNUrQ6lWBKsJ
 kuC3xuq+RJwTcP8d2lFdFAI8K3fUMB0ZDt7IkEQcvUNRQGIt5X5aJnF+K/F2INfyFo7KTat+cTh
 6H6iKJvsE0NMVxons6g==
X-Proofpoint-GUID: Jf7KjuEnzqkS4_jr1Ug7WqquDZM--W65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044

Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
register") the core refuses every non-HELLO packet to a node until the
HELLO to it has been sent, and retries a HELLO that cannot be sent yet
100 ms later. A freshly booted remoteproc has no glink rx intents, so
the first HELLO fails, and the name server's announcements in that
window (the replies to the remote's HELLO and the NEW_SERVER broadcasts
of local servers) are dropped for good. The name server then also skips
the lookup notifications for a server whose broadcast failed.

On QCM2290 (Arduino UNO Q) this stalls the modem in about one boot in
five: it waits for the RMTFS service, which rmtfs registers in the same
instant the modem starts, until its watchdog fires 40 s later; WiFi,
whose firmware runs on the modem, comes up a minute late.

Patch 1 makes the name server carry on after a failed send (announce
the remaining servers, notify the pending lookups). Patch 2 holds
control packets for a node behind its HELLO and sends them right after
it, instead of dropping them; data packets are still refused before the
HELLO, so flow control is unchanged.

Initially tested on the Arduino UNO Q (QRB2210) with v7.3-rc6 plus the board
support it needs: 10 fresh boots and 10 modem stop/start cycles, no
"failed to announce new service", no modem watchdog, WLAN firmware up
6.4-8.2 s after boot every time; unpatched, 2/10 boots and 1/18 restarts
stalled. Built with W=1 on net/main; applies to next-20261016.

I'm not deeply familiar with QRTR; an alternative would be to have the
core trigger announce_servers() for the node once its HELLO is sent.
Happy to rework it that way if preferred.

Cc: Chris Lew <christopher.lew@oss.qualcomm.com>

---
Igor Opaniuk (2):
      net: qrtr: ns: keep going when an announcement cannot be sent
      net: qrtr: hold control packets behind the HELLO gate instead of dropping them

 net/qrtr/af_qrtr.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++-------
 net/qrtr/ns.c      | 10 +++++----
 2 files changed, 58 insertions(+), 11 deletions(-)
---
base-commit: 07bd391eb9572e74f073c49acef327611234f9bb
change-id: 20261019-upstream-qrtr-hello-gate-fix_b4-c2e8c2f4f906

Best regards,
--  
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

