Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312080;
	b=mtjvhYsbOFPQ8k2/1k1bz+zjy7woIeAFkcg4Fjy3EAVsMN7HvgEaCB1A1+y+DRqLII0n
	 TOjYVA+qFxNxn4M+LLozeHbkGqMK6hKYmbfwkDluxY6HojTaxTAYnMkyork1nT7dQ9Zoi
	 sX6hHcH6rTITlk2+OchslAb5Q+Z3pLq+HbqKPfb/fs+FgsQtGewzBFTdtEj4pr4+p0e2n
	 4158wDhRiKNnP2Ft6sq7CywT6tX9agf+Crb2VnBTl05Ni7xN+ykj4PYkYxgOfCVq8f1tO
	 GteST8booy5IJM3c2OsD2Jqgz+AIDnSchlZmbOrsyBx6v/jH1eTKd7qQovEgvGcJbMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wjHjihWkxK/xBC3DjLG2PqbN08tv/LZZbFWJaPS+3xg=;
	b=F7tnO3IIGjn1Gy1Csc9rKWOLKoCqOSbGqjMDGUY19yAZBWrSB87YayiSekixg576LS7T
	 jnS7B0yK/exHZ6B3iB5UD2//895ld1CQgV/IDTwa5+rvrx9npYcTWW3/5im6gcz+nntwg
	 xW1STiaPDnpy60ZTJpqjZpW2baKHsfNquSX8U39djlvHSS/4QVOB+yH33UOXegmxCEk8y
	 e7St+xOO/mS2+BT98mxQ4pW1jLTZh5wuAgAiNeljMMYohW/VwtR12o/Y0Z+/svZRVPYQQ
	 Gu84fNczI14TK5nGsS+kj9BJu/hBF9Lq4YCpX71tp/f6wZbbivNRDOc3HgP6Sq0SdOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sieoqw26;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Td6teo9/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9255D606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9255D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sieoqw26;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Td6teo9/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9xia4186609
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wjHjihWkxK/xBC3DjLG2Pq
	bN08tv/LZZbFWJaPS+3xg=; b=Sieoqw26fV7zxgat8ywnjRWoRqGVzwhlOUxFxd
	Zbeatep+dNrwznKYZ1NeXO0oKYGPxqZjFNnr1FypTrXbW2mC15QPshPDKVm0Xjz0
	HuEDOItdecF3VenZXH4MGD5VAOX3NLIz+RAiORmZUvVRbDzv7l7RoUlm8waNYDt4
	Kh+t4m83KcpOf8LjIADTz/GL0Wy85EyhXdT8jRYvcU9rTbn/tDpohlHPEQ5ChkSj
	78KONN1rJMH3FCrOxuQWA2eiq54lVD5ZyYsFWzzOLLgSU4gdoiLjLZbyZZkSA6YG
	1Fpu20vfXsUa13fnE44pXC/yk+nv4Iugjhb7YC8jrwcu97iQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwgprq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:01:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso1589168241.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794312078; x=1794916878; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wjHjihWkxK/xBC3DjLG2PqbN08tv/LZZbFWJaPS+3xg=;
        b=Td6teo9/cvad+tEFBovlUvheheAVLFInit0v8TkxZdZFdMFpEJlNOAEgV0tu/KaaOQ
         XuVYJ0zyn37T4hhjdfXPwgpBYThBP0IeCgI/8J0ReCIkxsOc/SO7EGuhZRvBGWf5zxmH
         HjENKL1U03KYA5AhBDbZOaCPBvl/rt9AQbpaKzK7wzF6eVhhxHrbTik4BRvBoUKEipsc
         5GQqEFFQS+LIMCVt0DF9JFARCWP0ueobGEA4HATxq3JlAC7L8P62iQQJaehrHZufkZyT
         klvzutdoz++nXMmY9cxjLRTu45CQDCMt2AhxqzAb7qv+JWBGHzXx5qh7p9VKcwvtuvRl
         d4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312078; x=1794916878;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjHjihWkxK/xBC3DjLG2PqbN08tv/LZZbFWJaPS+3xg=;
        b=Qd055ss4lI1iLaV+q3fqAll5SUpgwTILZjtzhGLyM7kN61DCEI9M0no4TTHcQhFeRg
         U1igyGMdCHEftfrwySwc1JENqd4nnsG62Ze78xKqU1Jb7tGQhA+QMnjPmx3MT3iDCxx2
         7mTaZ0vqVp1XAwL9ZKao1HpiSRE4tub+UPfuADux3moOoFgkVkx3enZ4PySbHxusje1+
         QmQ01f1rsMnKXezGPgFja1nrnsL/ZXj7Ea2XYK6x51pR9DHlS90UdPtQ7JpYicXHQK3u
         lYtt7W2I840bVWNK2fByfGSNeaeqDP88pw632P2AsohlwmZCUB1T0WTDxx0hIsX6lfRp
         FdKw==
X-Forwarded-Encrypted: i=1; AL+hErF6p2SRiRaQ9/rIzXTtZDrONgy8Y3Av+NQuJI4rkw4aSLlAtCDwFVDUF7auOWfzKqXOk/X04ol4OFaNyFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2T0ov8ZxbQAD+A8NY1Mu7/O7mIDkbHCa8KfShw6LdMrCYlATB
	+sa4a1yVDwsX6Yyu5FupMgaP1G1tzy51MB7OcrFLsJQkEk05LPpQMT3f+6qA4gW+Rg8aYSibiOv
	8kTWPDJTgM378rnDrwT5qcpKMErrkJA858sejzJ+Gih3KBTwFsDTPcNMXgBXi/fmEbjIN1/rBsq
	c=
X-Gm-Gg: AYBFou0PK+yVlPyFYMF+YFY0YdOfeJFShCn829RUeCMTwhBJZEaFWeFt3h6byMUSxRQ
	9MvEiSxmhG4CFNXV+59pJEs0lvoUq9zTde+vjswgg34xqXBH0v4d/Cmc42lCID8R/TH1YsHx/tJ
	HwtjHBk6UQ4v9JYV0O6BWcEjitEShXzf3YhR1VMCLLcJ+1dQ1mVavIeJ8/NC7t9/qMO/5Alh/ue
	u3WfZcBzGK1u9y3UPIf6RbUgVXrUydNW5ofvptfE5X5slFQfPfSLgc40hCRsMywUsxP5DtWEyva
	biXa0jkcBCJe2beJExY9rcSXbiLa7G9UF7eaRY3nuolkjXhCcMExsvCxp6kv81Q9v1789Wtjv2X
	pd4Yja62JyUKYXnvO4rcd9ZeRDpLiIATs4Zic6Ht4Mwg6yKwpy6JrwkMqLXu44T8EtUGjbhy07r
	kFhagmWSeCOS5GpL/kNE4Ukybj0h/1w9U3EF7mtCScL8qY6hOdhcvtjuWqubLJkWNHDKmrj5yMF
	9qx8eNq1QEHJhVDq19oRtjHkpI=
X-Received: by 2002:a05:6102:2928:b0:7d0:6e40:f3e2 with SMTP id ada2fe7eead31-7d301c19bf8mr734197137.28.1794312073125;
        Tue, 10 Nov 2026 04:01:13 -0800 (PST)
X-Received: by 2002:a05:6102:2928:b0:7d0:6e40:f3e2 with SMTP id ada2fe7eead31-7d301c19bf8mr734163137.28.1794312072593;
        Tue, 10 Nov 2026 04:01:12 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2cb2sm56820295e9.3.2026.11.10.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:01:11 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PM: clk: Release clocks across runtime suspend
Date: Tue, 10 Nov 2026 13:01:07 +0100
Message-Id: <20261110-clk-leak-v2-0-d044cf0c3f1d@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIMH82oC/22MwQ6DIBAFf8XsuRjAiKSn/kfjYYW1ElFaaE0bw
 7+Xeu7lJfMymR0SRUcJztUOkTaXXFgLyFMFZsL1RszZwiC5VII3nBk/M084s4ZQjZ3pLMoWin6
 PNLr3kbr2hSeXniF+jvImfu+fyCaYYHbQZlAaW9T2ElKqHy/0JixLXQb6nPMXU8Qan6cAAAA=
X-Change-ID: 20261030-clk-leak-3ea6f7c7da25
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: znoI7zF68XpZz2ZIGX3665csqXXEgPZa
X-Proofpoint-ORIG-GUID: znoI7zF68XpZz2ZIGX3665csqXXEgPZa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX7G2bcEYJpSQC
 IAbVEz4Z+Joa1O3apudZlR/6q82v60CHfdSPmjG3RDU4Tf8LroMf7+65wo+v8t2/660aoO45NEJ
 iwtxK5RXZLC9lutlknZVHxKfF8f7l9s=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af3078e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZpB3dmDekyYojdqYHaoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfXzvob0HhQsghx
 GzgJFv6zdcuvlSJWbqhZgi8HPNjkNDg/pFpDoP2D6Lh35jJwWS9MumABpjoRTHYWUbeywXltanq
 LYEis5q6OzVwg9GmiyIFWSToVEDZzUW+Q1/iMtR+Opj5Ly3xgct1veDr7zHr7SElQOA274OuomB
 BAwSx5hb0LVFaVmrqI0vg6OBnnIviQgdA2w6xLHRvpxtRSyqYOCoocguhfFE669vFZIyOBs/c45
 l9H/CdJrO5jV/rKgikvEQ30MPxtbQb33Kkue4PCePJb5Yd5Z9FO+L4zeq8Cs9cK66BJePBZIB5v
 PzrlZLSs63oYawAvFk5fL2O4wN5z+JVsXnmL8un08pv7lBEiH/+R+Klj/LMckpN1ak8lc4gRm6j
 FrOtIl3OmTZvSZF3TIDMfIajn/WJqN0vT5os9sTV3vvX2BceHk548+Ke0zScHHTu2M2BjhnLc1K
 TYD+2iUQ0VdM3W7wI2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100047

pm_clk prepares each clock when it is acquired and keeps that reference
until the entry is removed, runtime suspend only dropping the enable
reference. A prepare reference propagates to the parents though, so a
leaf clock can pin an ancestor that only implements prepare/unprepare
for as long as the device exists. On Qualcomm platforms this is how the
RPM XO clock stays active across runtime and system suspend even though
all of its consumers are suspended.

Drivers that manage their own clock usually unprepare in runtime suspend
245 clk_disable_unprepare() call sites under drivers/ against 27 that
only disable. pm_clk is the outlier, and only because it cannot
sleep for a device that suspends with interrupts disabled. So rather
than asking each clock whether it must sleep, ask the device whether it
may.

Patch 1 derives the locking from pm_runtime_is_irq_safe() and drops
the bookkeeping, patch 2 then unprepares on suspend. IRQ-safe devices
keep the current behaviour.

A non-IRQ-safe device now prepares and unprepares on every runtime PM
cycle rather than once per lifetime.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Split into two patches: the locking rework, then the unprepare on
  suspend.
- Keep clk_is_enabled_when_prepared() in pm_clk_acquire(). v1 used
  dev->power.irq_safe there, which runs before probe() can call
  pm_runtime_irq_safe(), so the flag always read false.
- Drop the clock_op_might_sleep count, the pm_clk_op_lock() retry loop
  and the caller name argument.
- Reject an IRQ-safe device holding a clock that is enabled when
  prepared in __pm_clk_enable() rather than from an in_atomic() test in
  the locking helper.
- Link to v1: https://lore.kernel.org/r/20261030-clk-leak-v1-1-db8cb68a5a8d@oss.qualcomm.com

---
Loic Poulain (2):
      PM: clk: Derive PM clock locking from the device's IRQ safety
      PM: clk: Release the clock prepare reference across runtime suspend

 drivers/base/power/clock_ops.c | 145 +++++++++++++++++++----------------------
 include/linux/pm.h             |   1 -
 2 files changed, 68 insertions(+), 78 deletions(-)
---
base-commit: e726cf08ee6ba7e8b852c77760f12c59f90f1338
change-id: 20261030-clk-leak-3ea6f7c7da25

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

