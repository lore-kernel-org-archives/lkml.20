Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769344;
	b=m/PmwbqgacK8qU9+oYkaaPBrxpGK7SX10ZhkM1PQ7GyATBZddp3sZ3s5t9r7FQKbNx6W
	 0Wkx6L/NznBshLbo5cI4732axhII1cLxFohfU6/KUcIZwoB0nNS+ncGEF5D1gnC4hgIRD
	 6PI53UypuUXMyD8iu598qmH8V2EiI7dMrysn1IjJE+DuyIaiza98xakdjWtU/nER8jElW
	 04WLDuIjd8MurDj2MVHeWe9D7+Px08lLo9FhTK25vGH9bTgZiQ04FVQoZt5PUj2/qqndE
	 ckFOB6H41lPGSicKF4gGlvoaolVIdfnpg3teEoQh1XFvnv0JSl42Y8K19rj34getwJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNzuJGH0AN8=;
	b=5aIVk7b3y7gkwpu2DFRXdfO9CNnK7xWxxH1dUhMczN1U+QxYPfjR4qocvfu4UtIh3YFS
	 LoxHx8n7Qe9gvle0xKLH9Mtr5BbaMMsrUTvR3xYK/fZ+Ipj/xFzNjDkARmKYx/rFk/a3K
	 ip1sWV52Pm1beXNQJCQU31F/I8sx3w4ghVvkbwrkUzTOJ1nfR21qqkcndBBDqJHgnveTY
	 VvlM4hqWCjJq2lwDXUrn3kRTy+xTzlFFxGn+aZKV12k1cuJn2QYNkvDTNlDniFbNMVMPT
	 xbeNd72p8r+0r/870sDWcjpS48cWKRpMQnL/zIkrgy+h4hZbhb+RDnHye+RAYXXObOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhnHfL2n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sw7AZBT+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D125606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D125606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhnHfL2n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sw7AZBT+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6CKJ2462548
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNz
	uJGH0AN8=; b=JhnHfL2nHvO6BuDO0sx98eXVhu8tGhjfjOpd0VX+YkZspKdg9Jd
	stTytPtrQau4EUhS42KwmDNGi9ePlORhPKoOUtXvONEJLjhQgDVtGucSvOJfiksu
	1LCc9OHx8MXljBFQTDn/M5zF8M57G7DEhmkfH+/lbDGGl+VTxRV51gW3I23a6i5E
	YN1s7OwBIj7+GKUn5q06AUnV2UaZlPZ9Yv0s/hjieEPf9mxbmToiXfeUWo9yktI1
	Z5LpQqzSrgw/+d+Xp9PoJSiqDPKYTmde03JRUuxDhebW8f2rPSIEqphgbzOkH8t6
	kKGDc5fHVcxvAwCT76piPW1dVdPPnD/RAZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvbr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso305024585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769341; x=1793374141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNzuJGH0AN8=;
        b=Sw7AZBT+vOPGeHFrROqofYxcBg/1V/U84eesQRpnoNqHAozAoa4lex+Mv4x9y5a4ES
         Yah7jQjqKmP6SRbsnJNR0nu26Xdo6yWb5g/9Uh+/rP1EKy1RdBjHxc3j9zS9qRLXSUyN
         QKcDbdNvJnWgIV6S0aorwxQZ+b8VwtEx1G06WqqLNbpVseADlgPa0TohFzqDZD23E1M7
         XZ5FgQCdarRYa/CF76tH1pdRZ9FPhWOw927g/KUdQRip4U3YwjHkzZs56lZ7/Xr8mn+Y
         Vm77F5kdfX1J1r0TEqmExOLiFAUIZCsAt0tnVbZwxtuVOtzrpD8bruwBIVvKR9+dIU7m
         r+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769341; x=1793374141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNzuJGH0AN8=;
        b=TaQGPwePQw3WR+DKiVgFiraVS+YiUhXp+mRRuKlBsz61Kbhty6yV616asUxu4c2UpN
         hhfyo+xU9QzKNuPt8KUN+1xHLRbKV9/KbXmwkZN3Zhk8rynGsbRr/QA5QD5N4gjVHCBC
         HfN26ZOUfpBQwW2O20cnan8ASIx0i3TFGCRGKzLsx5PNngoufbPt4PesFcTf2LG89Kcb
         IQ64cBkQE/6ytkOb2g3aIuk5y6ZK6WkWbYLYnZwXQPpuPxE1oYcDF/B+Sd85LZdQjeWV
         EiD2PgHSvEgDPUwiGZw3Cl4KJYV6wBANePCiLdQ6TwJjjCgT9WNcVxKMuwn3UgYN6gjP
         D5Gg==
X-Forwarded-Encrypted: i=1; AKwUvBw2NeWCRK0qnCJfgdpJg1yreb6GwxDEy4eFHPZKv9qAAv9OFCPwx56zNeWJGafaLCTfcxee06IPXUicO3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFJKQQVBnPAJI9axZqOWagY+xXk7GSSUXzRnM1zIutpaMDUM8I
	Qf8EDCgCP+ljT8DJ/nigvhZMmMampMh37OPA44pK0lUEFEc2o/RfDVR7ZnkqLvEp6JbLTK4jiRK
	EGh/H0L5FBipfCwJnUm6kJe70/UFPwYG5ABwA+GJEyNNBQOZVStPgJE+nQiTMIToEhbM=
X-Gm-Gg: AYBFou3IIEafW923/CzIjwpiLIQMeGxo8xsx1uS3Xj8LhO3QroX1XD6qAFs1ArkdQw9
	qhkPrmGrlp7nsQ1gfknJaL3DZN5f9SnB8YkYZx/ZMetgP2zxVjil/rcpkEah+D9yFMpbckvCMv7
	8cjPDJgsx5aI55zyR0wohtSP2VH1pkOQLUCAUyN09mXxK0stuIX2WOMTVLxiIP/jW369M9gr8n1
	NjDXaCRW5sssc7jwgD6QtCsJWWP0sK9pRQm+T9dD4alTWTbMuNQghmMu76+bgUI5kpL8vqsP5eO
	V+43FQMwpcrbn97DE/XxSwT0HL21gRyofaqlZGOMygA+VBBTiwM1YIHbMMJamEH3mgb3nPVHJDU
	18xQGlbI8cmig+LaIQ5vVPc5E
X-Received: by 2002:a05:620a:261e:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f6f58ded3mr466610485a.12.1792769341466;
        Fri, 23 Oct 2026 08:29:01 -0700 (PDT)
X-Received: by 2002:a05:620a:261e:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f6f58ded3mr466606385a.12.1792769340969;
        Fri, 23 Oct 2026 08:29:00 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:28:59 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: qcom: camss: share VFE clock sources on SM8250
Date: Fri, 23 Oct 2026 18:28:53 +0300
Message-Id: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb7d3e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=zMOfFELr6_fzUAOyo_gA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7UORxzFI-cU2pzB5uL1gtRZQNIZO1tgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX/MCSfNB5Msq4
 yVPYnlHgWq/0xtDXWAcsbEQc2B1Ue3lpuKNa7pbwtkVri3rXcLoorOVwT+ZYkwVgJQSXx2P6osf
 ygaESr6mhYIF9jfjCGauqieT2zZv0Q+kV+h/etqnPAeGHHLD7Rg3xjCXoDY4RT+D0+IDDG3T7Y8
 goEeD8rkPiuRv1H50imciUpop2+HSgeH+FVuD7p5tOTWh2Xl6lE5N0TOx0uIkgLKbUEZER7ob46
 ejX7KnR6eqQjvn35glMEGtpnNuywHm2Wrkic7FV5Pr+LjPVIOLaez8iwYEUCAOD3E6e5il3c11c
 ZV+xLFXi5nWpLydQT/0zLishNmcwK882Bsg9hurYugB8DKJXBT8tB609+DtXe1xOV8hFcT5MvXg
 P4NKgtP9BPQiCBLkBTAX7A0zgpZfAHcfw8rryk4/mpELy2hnVz2eox+EPyqzmIXZImPYr3bhYci
 SzPvy1nfief0y/6AuEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXwpgmk8lmPr/3
 Jkowcii0keqIdCCJwU8IzaYTFTpl8+FCZGyIcjNQFu4Hr0+2c8N7bS74yfQ+XgkQeKxe/BHTEHR
 SWf9opv0iomJd5uGjP7jZhGRQbflc4I=
X-Proofpoint-ORIG-GUID: 7UORxzFI-cU2pzB5uL1gtRZQNIZO1tgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

On SM8250 several VFE clocks are fed by one clock source: the AREG
clocks of the two full VFEs share the fast AHB source, the two VFE Lite
share one core clock source, and all four VFEs share the camera NoC AXI
source. Each VFE sets such a source to its own rate, so the last VFE to
power on wins and can lower the rate under a VFE that is still running.
The CSID also sets the VFE core clocks to their lowest level when it
powers on after the VFE, and nothing sets the camera NoC AXI rate, so
the camera NoC runs from XO and two concurrent streams stall.

This series lets the VFE own its clock rates and aggregates the shared
sources within CAMSS:

- Patch 1 clamps each VFE clock to its highest listed rate instead of
  failing, as the VFE clock rate tables need not have the same number
  of levels.
- Patch 2 stops the CSID from setting the VFE core clock rates.
- Patch 3 groups the VFE clocks by clock source, so that a shared
  source runs at the highest rate requested by the running VFEs. It is
  enabled per SoC, so far only on SM8250, and also lets the VFE set the
  AREG clock rate.
- Patch 4 drops the unused camera NoC AXI RCG from the VFE clocks and
  lets the VFE set the camera NoC AXI rate.

The aggregation only covers the CAMSS VFEs. Drivers outside CAMSS that
use the same shared clock sources are not covered and are left to a
separate change.

Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
pattern generator, on single, concurrent test pattern plus sensor, and
concurrent dual sensor RDI captures on all four VFEs: all streams
complete, the shared sources stay at the highest requested rate while
another VFE runs, dedicated clocks drop to XO on power off, and the
camera NoC AXI clock runs at 300 or 400 MHz while streaming, without
the concurrent capture stalls seen before the series.

Atanas Filipov (4):
  media: qcom: camss: clamp VFE clock rates to the highest level
  media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
  media: qcom: camss: share VFE clock sources by the highest rate
  media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE

 drivers/media/platform/qcom/camss/camss-vfe.c |  32 ++-
 drivers/media/platform/qcom/camss/camss.c     | 211 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |  13 ++
 3 files changed, 224 insertions(+), 32 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

