Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6400A47ACD9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807632; cv=none; b=mzzOQUD00IKfedAOskqx4JIEiAyUXyLjk/z+JDnWZKZuKbRwTesqftZYdlnnmJaK8/YyTLKh+Ki80If/bCuOX0/eGZuSSlXik+9hqw+xeqmswWotOO8VIsE/+EevZeYf3NGvoEwQxJrdAlQL6c/r3+T2xs631bFRLiecXqTu5Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807632; c=relaxed/simple;
	bh=T2hjJJZHHGPlA9G91JQW4jxl0fDk78KJswiSnEVNM+8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FYvpgzIROnRmnVsbD0q/2oYA3TM48GrYiWXp9N+Qxz9RR2sL5LXbYk1uf+X1ntKKehRbATYWiHHfezskF+BvBhpoC8TvVcuQ85S8xZs8CzpVDbQJK7lhOXCoijFkCZTCl71Cdq0VDa5RB7tl4GPWjgI0JFNj/TOXjOEPUYfolGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDleSMAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWN7LzWN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDleSMAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FWN7LzWN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC00sK800949
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kiuC635pBQZAZxWQFXVzDs
	uR4M9S6OEo2kN1VFbZJx4=; b=IDleSMAV4ZZfaKmOGQhd6mEXb9PaitkZyEi3S6
	55V05w6P5tKJc+evzeSaiRGop1BkkgPZ42ceUEGjg6tterhVYlAOfIdJuHHnmk/f
	JC7E/sRsIIml8LJd3lGw8RV4lgGNYu1gSC2J71PDbmo6iso/byue+Oj3xaazfx3/
	ozozKE81hxtwNXL1bQgS5RgJA0F9it4lffMYkN5WSbyiheUzgj4UXcXbxEHQhCT+
	3Fzn+j9BNgR6syl7U0L3UCsrGkgDacQwv59WO6FVaujJrhiYsfEG2IvaCqaKtFeT
	WPd6uB4hcd5cgMMdmRA1hdMLeFQ6jf6pPm9WuFpHwKQDvDTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrmdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so1206310a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807630; x=1792412430; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kiuC635pBQZAZxWQFXVzDsuR4M9S6OEo2kN1VFbZJx4=;
        b=FWN7LzWNNQrVEKLhiZrM9anwh15DxFm8WYCMx92VyqTaYumVN4fuNQvkXX/OIxW0Dm
         NBMF+OhJ1MLJGGO1dqM8clzefQBJS0x/WDHILTSfzbAFLJEj9AD+DqltaEpst++sI/g4
         qooAFcMCjb+IkizPhLLGzMbfUhw2Uhv6QnwfHNXyYKcJErhim3oS+bPzVVLfzXUE9cwe
         sNh+KCFFXZQq4sKwE82hzAMw1LwKEAkJ4ZsE8EgFOFoOwhiBqchMaQKkrNebkte5hB6b
         3kjqfVGW06sQTwmASS2XwE+/RF0yXDYCf3HOukfM8G4/yqfv2zCaCFwtDo/ogjpBJTd0
         UDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807630; x=1792412430;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kiuC635pBQZAZxWQFXVzDsuR4M9S6OEo2kN1VFbZJx4=;
        b=X+v1l99a/lSLbrhoCLkO/M6J7zePgg7ePN3A+N/9S0gatDiKTOGJpstiQDW98vGP4N
         l9AxL4JH4llgblQKwNu8swGm2SYDUM88uJ1g42nioK07PnQLWpQbg4/F1PIMhNMScZM0
         wwysDUw9Q8Sek642fyptDDndq2zK5iK2NyYURaCgU3vPpaI4SqXB1huF8nQnhKqqt5Oi
         b7QULoGAIN50K6qNIpaDteVV7W/5LWmUcyjLppqeMlk5RkPNg1NK5YkUkTM8h5pWfeUj
         M15HYROuNY8uz1YuyOB/HcYVOwBC6I15kqMIQmrsGN0Za0HWF2f6P4uHHiezI6Vkm5+c
         aAgg==
X-Forwarded-Encrypted: i=1; AKwUvBzdilqWloNscLPllSSJDglIYjmyLCO9aLKGrs5kRrIjv7EeMqHwZUMqWxoSphpP1HF8HWh3weViEbAymdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8qNe8hbeX1RLa0mfgY+i65+DdP7em6FOunjjDbuK8s6pJDgmz
	4MYdzTwSyjCurntYSgc515GlWSrrKnRTP4DAWd2Pt0NstDwKHIF3yavPONTJMHtPgNHDvE4dfAl
	DcJYV6qbrUfIPUkAo3T2Sf0qVv3oMK/muECxk8kFYbc4huKSfnyCMfcytozaWjN12QhM=
X-Gm-Gg: AYBFou12IEuV3kDdHDljHpSovncKGFIWx10f6VJKhk5/1d6M3PonKe+FmVu5s8FtXH+
	fxkQQ63Nf7wXINWIbkBFUCil20cNQH9cAlC5fa946zzsfSxTvQD50dfWyyq33HuOXMvzXUMsnmT
	S2XNMypAQbRM9qzqaLho6PyR6OLOl3tpwPLn+0br+1N6ejCWDtqzJN77yppUA2IHVKSJ18091u/
	uDCmBXDD6sqd7vevdKxz0WN9quepnPAoxF41LL9fxm5EkULS7TDz8HhQJXyObvFUCffhR0KV7uf
	4tFzkqO1U9ZRhzGDHduw/anZqza3l9UuetUpVpu5Ai2ro/SJfFaHCjkzTryO9hmNzZpL/GqILLw
	5KIdZR0KQoGVjh1700ldy/Bpbaqz4JUSzTXN4
X-Received: by 2002:a17:90b:28c7:b0:3a1:66fd:94af with SMTP id 98e67ed59e1d1-3ab3a99a3acmr7195625a91.37.1791807629892;
        Mon, 12 Oct 2026 05:20:29 -0700 (PDT)
X-Received: by 2002:a17:90b:28c7:b0:3a1:66fd:94af with SMTP id 98e67ed59e1d1-3ab3a99a3acmr7195594a91.37.1791807629392;
        Mon, 12 Oct 2026 05:20:29 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm15935932a91.3.2026.10.12.05.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:20:28 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: geni-se: Avoid redundant transfer mode
 selection
Date: Mon, 12 Oct 2026 17:50:20 +0530
Message-Id: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITQzGoC/yXMQQqDMBBG4avIrDtgUmxLryJdxPFPnUJVMiqCe
 PemuvwW721kSAqjZ7FRwqKmQ5/hLgVJF/o3WNts8qW/udJ5liAd2MDfoQVX94f4GK5ViI5yMyZ
 EXY9f/Tptc/OBTP8J7fsPPiiRlXEAAAA=
X-Change-ID: 20261012-cache-se-mode-578c2fa35af1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791807626; l=1222;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=T2hjJJZHHGPlA9G91JQW4jxl0fDk78KJswiSnEVNM+8=;
 b=BPaFSP+NV0YLhWZIfzDJR9hjkuQx1fxk9/1S0hoiCRyZPgFjmW6hAgnTQc7gaBdPaqutUMt0h
 vJcEi1vuzUPDEIH0UiUm4E0ZROJPQk2rmpxZhCKZig2CBWpKwKPvcXa
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: nzf6Io7pqfRlzqfP7D2gsquELulTnXNe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX4hGQP4pxqvpu
 wPYSTGhvF8SSp3QYn/cFogy9QkC+LcFNUFkDrNYHAgxn+P7XC+Nk6RnUvZW80EgBfm6J3Evvewh
 W+w426iU7fiHUZ8SFsO7LcYiW6OEvXY=
X-Proofpoint-ORIG-GUID: nzf6Io7pqfRlzqfP7D2gsquELulTnXNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX06VZA8NxVVn6
 vH6hwFPjNz+bzGIsNMAW3f4inOzO8I5pefYrkJFnysvfHL3CVBpOLoAr+7j8Qpl1ihCOXc2uYss
 eO+FxZrosW60jYfsZEpihDSqyAp9nyl5KCs2lpADXQwqYg+SDO+ikonPCPJGx8Mr+8m248z6yws
 Uv0J3hWW/iPGmXzLZpn8sRniUjVkLwbQGsWi8iiIb3sIP/OHgryagXSnZLiZoMm2RZ6ENlbTbxz
 vFtQAESUdJsC4RfrWjhy4DIXyx2T+5spC0W4uL9iVHTd6Ykerw6JbTTdJGIpcjQOEU2VHtu2Ce/
 d1yJGdK1D7znRt6gwXBkkFMWysXhR3oMtk1nhQND4QGkgarXzsP/CQD7cIfcLJA0eiMkHXh/ndN
 pRP21G4SEqMPBW1DlaW3HWXMFTGdalHNBWqtH/3kRf31VpuvrpCVytbYwU9py/Q7Uc/TcNz6w1h
 rqnJC0KSykSL97DstZg==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accd08e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iKPr-58QMpQu7SoaoloA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

The GENI transfer mode is commonly unchanged across consecutive transfers,
but geni_se_select_mode() currently reprograms mode-related registers on
every call.

Avoid redundant mode programming by caching the previously selected mode.
Pending GENI and DMA interrupt status is still cleared for cached selections
so stale completion status cannot complete a subsequent transfer after a
timeout, abort, or reset. GSI event routing remains enabled for cached GPI
mode selections.

This series:

  1. Separates IRQ status clearing from the full mode-reset operation.
  2. Adds transfer-mode caching to avoid redundant mode programming.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Viken Dadhaniya (2):
      soc: qcom: geni-se: Split IRQ status clearing from mode selection
      soc: qcom: geni-se: Avoid redundant transfer mode selection

 drivers/soc/qcom/qcom-geni-se.c  | 20 +++++++++++++++++---
 include/linux/soc/qcom/geni-se.h |  1 +
 2 files changed, 18 insertions(+), 3 deletions(-)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261012-cache-se-mode-578c2fa35af1

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

