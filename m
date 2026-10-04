Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496F347988B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141000; cv=none; b=duVbS2W+yTvG6w0y55k35B5uDMFbkhu2kK5L4z+b3x8HS25wk7psuR1soXqscxOIn5PMMvTMAY4lIGwJ5Lw+mixIwkYsTXeBgt0L/ODGiaS2ahPPu/qU0pxLX6g4Y/5iz31QNY5GITdtNAHl4TlELr5Fw2Sa8+DxJwoRF3pbbDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141000; c=relaxed/simple;
	bh=OXoGNIvQVsYZOLft7tClkGz9jX50u0uKTsBlp9+t3BA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DVraolQoJ6Ae7jL/aE6pL6D0DelbinxvWmsd27qZf1EmZkSfnU1hfiDV3fcEMh8UePTM6tI0A1bKsuDqNq1nRP4rox0PmAupikkEDpxD6BrteAYEG2TbhZAkUVxIYjSBLFzrvPitGTgJ3zOB/xrazlurpyjn2sJhW3beWGNZNmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDp8euvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AM81Vau6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDp8euvp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AM81Vau6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IHT1R3878990
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 19:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6IW4WO3lEs3YpZu/aGlG8G
	nOw4F5Xm52MYkpfN/zSx8=; b=EDp8euvpPyxKUXhkXSAZYPNsw7FD3ZGjGk/cD9
	NfoOoUACy+rxgE3tRItDLybaeUC1EVwP/8Aju3n+jHzQWqRCwLVEPaAXKqqJcdbV
	nGU5N/w3fsjyXQYpxvZws0ygMMs4C+of3eP83lM1da1U+8YkLcLMJCuV+fuTXESx
	rX1D/zSItjbXdkDZd5+HnPnR4ULqeVstgIO8+lEnFMeYuhDCjM/ktPhcwROzAo7H
	pkMULV0DCNi1k4iIK/H6nBsIgP1zPuOpcONEebcQ0QohGqObAuOUPesWOXUwChCa
	J9swkFbqHBhshQtyTNz4/XJlJOYrN2+86dJxaCnGQWHJOZ2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sx33ka0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:09:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917870a9be3so33216926d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791140996; x=1791745796; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6IW4WO3lEs3YpZu/aGlG8GnOw4F5Xm52MYkpfN/zSx8=;
        b=AM81Vau6f8qABCGUcFej67y078hGl/3rmagk4JGxqEQqpkGJOEkDqAOHg5Mm/AsSe/
         5bsWn5V/64x1mIMU750ExIKJ3zENlCX+IbzCHMCb4Q3xcO1nuv7qBXZPH98513y/N+VK
         v31bGG+VtgUQKhowzwUme+Z5bKRdKyYf5fF7K1RB8k4IITC25YVSI5/rnzqqDqgumhHQ
         KjrdxOKnIKIQmGpYNFz5+FOV7WgOp+vykqBv3VRNhqL85Ycw+E9QJTdGF7gQjqVeIdiT
         sl7q/j0CC2LP8zYEeda6mTia36MD1MaH2+dP/P4qg0wrvz/kDWzng45wX/mWkwyTcg6X
         2NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791140996; x=1791745796;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6IW4WO3lEs3YpZu/aGlG8GnOw4F5Xm52MYkpfN/zSx8=;
        b=YOh6G6hLhzPZJQqQTacLkvcpvDyrJcQKIA/oliNMZNSR1Lz13CTCISlxFUVVBys8K9
         SZb2hRIModhIw8hZQETHwuN/L6VMURW879p/CBlaut7vPi9cDsFradV/PyCeiGwZnyFf
         5whGe0O5UA/6KoxaUBcZMMZIrHykt/5tk00UslLTNXGX28piPUOZ7gl9Q3Q0wBCRrage
         Lp+k5dlf/REC1rPdK7ndkaFNlHJxUJecS0W8tTh9lU/Tci4Ke+DzkIuIYU8cYGW/Tbxs
         5g0ZsZBpypRqEydn5Lv93OQ8er3h3eOck9b+gIYGrFAGvIC9UJnA/DaeQLzPRCMSBHqV
         JOyA==
X-Forwarded-Encrypted: i=1; AKwUvByk3L8wyNBTQb5v3pw2OkzBakutHiNo61oqWvKGlLYCQisfREDqv9MO7mdEcdKt+tOulaKWpxg5S3Bo32g=@vger.kernel.org
X-Gm-Message-State: AFuF++ksEV8vbkaKnaJGi7k07uDqePVq5cH162m3RWFUds1WREWobqOY
	QV5XdAthfGo0D0l0ASaBQWIYMxFRt5JXjtcZhy+PN8xjpe/sv2uUKYo/VZO1cl3zQ3h3AOXICO0
	Ko/y7yO+R3aC9iHEDV5XrNw5ux9uAd7tdD5C9HmqKy+4sMC3nn0jYrT2yF8Vtt7Y6udg=
X-Gm-Gg: AYBFou3M42vfDlVTIXv8OC4+V420IToC8QsSmJlzaE3DnGWjlpf4T0qxb9cLSY51C6P
	8FSPRAPD5lith6yattoaYgnnR0eiYThdBt4mvIiGxvNbNgkVTEeurO0rtEK+dfZcccdj8kHrRDl
	sKzQw/KK7VQD0yFDiDyF7yt0CXxDz9BCUOXpo5Fzgyi8xhVJ4WoAw/VP9beBQer1qQ2+0XEsLKL
	iiooq0r8bNzDwCXWQTgvubHGFLf1ZARuOls6TTRL2k/sLGGA6FQGr6T9CD7UAgWMiw2azZtVXfN
	ZAJyQBy63G+1vVLgfrKabGoHNwTHWgog39f32ZI0h1psARM6krB+P2FoHaukQ78/K4ddpos8ajC
	BGa9pKYl0ul/g6BuureB1OOPAvQ2j+r8EGWT10asR/2qQkQc3mp7HVRlmYp9T+YJsu7z0AAH9/y
	L/uMHTBMu8qXTkzZyjHfRRbxPuVdFq6cjcTRR4+vmep1ujD9IKLw==
X-Received: by 2002:a05:620a:318b:b0:939:b053:ce44 with SMTP id af79cd13be357-93cb5b42a84mr2242652885a.22.1791140995360;
        Sun, 04 Oct 2026 12:09:55 -0700 (PDT)
X-Received: by 2002:a05:620a:318b:b0:939:b053:ce44 with SMTP id af79cd13be357-93cb5b42a84mr2242649385a.22.1791140994925;
        Sun, 04 Oct 2026 12:09:54 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([37.169.59.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm176318385e9.1.2026.10.04.12.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:09:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/5] i2c: qcom-cci: Runtime capability detection and
 improved read/write
Date: Sun, 04 Oct 2026 21:09:46 +0200
Message-Id: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqkwmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNL3eTkTN3M3AJdi6REYwsTYwNLSxMjJaDqgqLUtMwKsEnRsRB+UWp
 hKdDAEqhgbS0AWdtP124AAAA=
X-Change-ID: 20260929-cci-imp-8ba384309942
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=JY0pPkKV c=1 sm=1 tr=0 ts=6ac2a484 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=1Gfya9YG+27Uq/30OuQ23A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hgtt4lyW0_XcBbbwjOcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: yGcG1Bkxk9nznRghdfP6ucIVlpWbTn0z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX7E65fVh82xHO
 Mww8moT54LjaPAamqX8wUlEX/IgbBjdWj/2KjHT7YqcAfMFbhPI/8wwlSH6IYcHKZmS/JXbj5sg
 YDHmB7JavRZZBtot8Vd2FywIzOQswf0=
X-Proofpoint-GUID: yGcG1Bkxk9nznRghdfP6ucIVlpWbTn0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX0AGk1dTGurNU
 xzoIzqdXyBXU/9vs2EDrlYUNAUyoMML1Ngtlu+UxDU39kUcffSmXSuAkyEGPNQHVg7CgeqzjAfr
 qDPf+uPSlUSbYy91Mb5CpD0LYchfTgpjSgcU+mOao1sBb3orZ4nHpOzy/JQm/UfaKFl6HBvJQaY
 ubIpPMiz2efgd7zCK9lKNQKj2VhmJZjnFic4R2n9PhC2f2i1UEoNkni0/j0JNgTAGojUcqwSPBl
 QvzpRiVpjrv6IyYGNVpa2ZDFPTe2XMn3yq18OlZCgbqrG2sAK7uHHFSIeV/rTIa8aeGv+kdEH9M
 I45VdtQiBqaY8k6WN+mvu3XUzaKneI6ZUnRHDouc3sL0Cood9FmwknsR7ItB8Lb2IyRNoIi7Ln4
 4R/1wbLKgIkdO6IctfSzLnfYgqosCGcqr3D/SDU1g/gIzqdbVXSiu/AzR3McRB/N7zF1QNBqJlg
 9n2apTkbLYZJr9G8GyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610040076

Improves the Qualcomm CCI I2C driver in three related ways:

- Capabilities (queue sizes, max transfer lengths, supported I2C mode)
  are currently hardcoded per DT compatible string in a handful of
  cci_data instances. Patch 3 replaces the static per-compatible
  structs with a single version-sorted capability catalog resolved
  at runtime from CCI_HW_VERSION.

- The driver only supported single-command writes, capped at 11 bytes
  regardless of how much space the command queue actually has. Patches
  1 and 4 factor out the write-command queueing into a reusable helper
  and then add burst-write support, chunking longer writes
  across the whole queue instead of a single command's payload.

- The FIFO read path hardcoded a fixed 12-byte limit unrelated to the
  actual per-revision FIFO size, with a special-cased drain loop.
  Patch 5 simplify the FIFO read/drain-loop and derive the read-side
  limits from each revision's FIFO size

Also add overflow and underflow IRQ reporting, as queue limits are
now derived from the hardware capabilities and exercised more
aggressively.

Support for unbounded read and write transfers using the threshold
IRQ mechanism is planned as a follow-up. Such functionality is not
part of this series.

Depends on: https://lore.kernel.org/all/20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com/

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (5):
      i2c: qcom-cci: Factor out write command queue programming
      i2c: qcom-cci: Handle and report queue overflow/underflow interrupts
      i2c: qcom-cci: Detect capabilities from CCI_HW_VERSION at runtime
      i2c: qcom-cci: Add burst write support
      i2c: qcom-cci: Extend i2c read limits based on CCI revision

 drivers/i2c/busses/i2c-qcom-cci.c | 286 ++++++++++++++++++++++++++------------
 1 file changed, 194 insertions(+), 92 deletions(-)
---
base-commit: eb271d18cdcee558095324dffaa53d9e6fe78882
change-id: 20260929-cci-imp-8ba384309942

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

