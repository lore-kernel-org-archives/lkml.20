Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181134;
	b=gimhE5c84phEdwIn2Zrhf1ZDPDketp4rHsE6plTQO+5rpoITB3efIBbPMYAMPo1plBoy
	 iRP1eMIkTY6YcZbfO/a8DVWDXc2xnU1Jz/zM7trH8R7ac2p+ER25uaCRMxf6m4FhkRjdo
	 /du861MkRxC81yL5DJEyIbZNi9nRs0yMxlaA5xVM6WNNIPsVXfvQfN5dIhHpTUE54Z/FM
	 9u+PuKXZPWJIhkKfwVgcUxnVhCANqONAqQ+PtBEa63ccqKqDi4glQILlD9GlGxWcvLTLf
	 xZjqIedOyyUDyawWkPwi8yd4AOWTm1JA7z4v/MwE3oN6InTed8lwQRJFNJTvqcvU1Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IfDKzNsgAHeLY6I7naXl/Ti8gw1wunbFLanBQnyLppA=;
	b=OXxVWpseAJLZmakf+vUoc2LO+MU18kgp3dLOerVVugE2kU6A1MPh6AXp/DStIhKYp7c+
	 qslHUAukk7NF3DAoJ3mT/lHchizmt8tKPKSptXvs8oRGsyyHElkj4PHtGTBKQHDgH2Xkv
	 OGIXAOtDRQ6oXT/B6vGQ6+tAlS4z9MIZe51ru3Tyr4+Sn8uViZeBaCkkXQyziDKKaLX5z
	 Oav9jyIY0rZFqNnZgYkQWnzBugXv8A5pSip3K62Yzy+MI6IUSxaZu2oXzFtEIHlfbAGpz
	 bQZ/13bsoWhbmo2TC8mA3ZnqIcMLBmwk/sKN+oF/heTcwTk0QW9O1gF21f9yz26PIQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o8lMw/aM";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJRRgqg8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C8F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C8F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o8lMw/aM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJRRgqg8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K7SK1667692
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IfDKzNsgAHeLY6I7naXl/T
	i8gw1wunbFLanBQnyLppA=; b=o8lMw/aMs1SPxXVNchecSlFSlZ42GWcqNlQyPH
	hwJrPI5O1kaHSbYpH0sUcnQcYyNW2hHL+4jnV7q4dkHEEsFXXOYgzfeNx78u2ILj
	aMYhggByYTWkLMKfcnw/GKtzhztPfHShz4yv+pwLHP6zAWBYV6mk9H/DtaGM6o7J
	xhteXrBCIiGz9d50rZmh6BxP2zW1i1e0+c0sNSkpcnWZ7zFcd4WhDg2Mqz2dHYRb
	a7INfbG/iIX9VYaND3IV27iA4QOVbQ6CEry/u2Q4ACDg5R7Wb2QAC3pVm47pM3Ni
	2/ZdwboAfxfxxZ7K3ck0C8V2n1Eu2pDgmpezi54daDptvqiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12ptyjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so160422585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181132; x=1793785932; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IfDKzNsgAHeLY6I7naXl/Ti8gw1wunbFLanBQnyLppA=;
        b=RJRRgqg8JAcll22pYb5ZJ9xWecZrl4OBsPAb+sz5SLdk7kF0WmKjawYgCctPCN/jIU
         3LZqsP+D6dKLsY60JJ+CkgHDOJgvkpMHrWOHey7iBH26d1BBXdRsG4GXs6vCA9eb3BE1
         dBM2fQVocBe0gJcq4dp4lBA7BkJ8xJhujT4VSAtHl3Fn3iHCWuP1E4oqTWt4iwoOS1/Q
         X+ZzzrZPkfTc2mvnvrHbEy8U7zSWhWZVsp4eE+yQ41HBTL2XKoUUQ0imwyz4sgxQD56U
         xusume097vSguyTUamjEcioWdYqkx1CMVxPKvf/ZGORatNqNCPulzU9ClDU9WlWHfcO7
         gyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181132; x=1793785932;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IfDKzNsgAHeLY6I7naXl/Ti8gw1wunbFLanBQnyLppA=;
        b=N/5fruxdlSVdkQkTesEmWXAtOlKzIRxnReSjZleVkAlWMkFC4jjwbz25U3G8hb3lPb
         +pDA6+l0nHXnCqo3jMR5RRNy09THNWQEZ/GKX7Ob+oNMeNeiHqiBYoVLloxDW6G+Hu0X
         0yTNxtHnSVXfKCPZtWJLUYJjOQL2wNA/mUSW7HUKV17XFTDfQovyEco1p33GAB/U/coN
         N25khEkGnkr5IaEWr2nVIoBO4hQDrVU4N5cBIHNId0SqKoJwGYno3Xj1rqzlauLufTDK
         HGjIU8xn116pQsM70Lurs1LSO0sc97F8UvhSlwp+21mzPmFYiGuVJpQv7gvFiYjCYVYO
         qSqQ==
X-Forwarded-Encrypted: i=1; AKwUvByyIOdIafmKOrN0R9jUqAt4Kp/gFd5L+XiDL0F1RVRbuvN+m4K8pyiuLAofldV+Y2vdkP5TdRnjbjWlzgo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHqvsCZSizwPeMF9O5eMH0+rbcpbX9ytdhlOMWyZ1sY3rmiPGI
	uHzr+P6Lt5VeA98Ag22Gx07BeeWY2t+Obogr3geBZ2VtQmtc1zdT7u1MpsOSZR1Vxwj2JyFM7MX
	sN0qbdIgybgahrB3GWHQaZfEOrKyBMfmd+1Nnq0rGZw4Qq9P2XOa3I2qmZLhU/lKYXlM=
X-Gm-Gg: AYBFou0iVb0l89DSaKmDpJBGCuc/EaH6e4lZItC3HGrkJ4qjeVrqTYC24DEWOb3UPvX
	hu0lGLY/0OH3sPLgfGYqJ6VG6E/31hpnTiKzPfwf44yC5ye0LY98TQpVKfXDKnRl7eIgGlOyGUP
	ySNi0pvJhS0i/Sb+Puh+RMZrY3nBrUBq8VZRbe9RpLY9zLp7sD2gaWgJlIn/ugZj9Lok4FhLBwY
	jFKYjo4vMih7Dn0IXnLMMQdOEkS6fEVC+BvEVkmhU+ztdYHAr29sJ5R5/7kIDe2JPraQvIm6Lc1
	sfh1hEutDurn4Kz2r3/299ypEJFjbnjIHrnqyEETCLobwEnVHJgtgsyOKIUfIms27OgKbQ7dKF5
	HmNvuLqsP6B8b2h3lkPbhz7HqRsmmIaHEtU9yO4sM/qSJ0t9+DOD5LsmrKjY=
X-Received: by 2002:a05:620a:470d:b0:93c:d209:4ea1 with SMTP id af79cd13be357-943f4b8ef57mr892402285a.24.1793181132088;
        Wed, 28 Oct 2026 02:52:12 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:93c:d209:4ea1 with SMTP id af79cd13be357-943f4b8ef57mr892399585a.24.1793181131501;
        Wed, 28 Oct 2026 02:52:11 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] clk: Restore the clocks of a provider after a
 hibernation
Date: Wed, 28 Oct 2026 11:52:03 +0200
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMPF4WoC/yWNQQrCMBBFr1Jm7UATq4JbwQO4FRdJOmNHJS0zU
 YTSuxt1+R7892cwUiGDfTOD0ktMxlzBrRpIQ8hXQukrg2/91rV+jbHD9LijkpVRCQMXUhwkkuZ
 Q6hh3HTO7nsKGPdTMpMTy/l2c4XQ8wOUv7RlvlMo3DsvyAX4bTEeJAAAA
X-Change-ID: 20261023-b4-clk-restore-after-hibernation-74fff1dea5f2
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=w3jz68RcqMoy8uBJpAr2vq/NID/jlj1n+38Cjr6e8wM=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGrhxcajhPRtnl1/P5MpMKjmO3wAHx5nIclRP9Qb42we8Rrlr
 YkCMgQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJq4cXGAAoJEBtfRMkAlRVWk9EP+IFt
 h4alqJRTEr965fdzj2YzwsdsX3SVxZYw3KmWbKdsZigTS1ySR5J7dYXE+BgeNV+uTYQzUFrmhEO
 B/w25Z6I/slmPJy8WFfBzPssY7i12jKR/hukbD9/hdd9j83CkXTrUo7IEBT0VH8Xxwo+3VPSAbw
 yiPBAzNu6cIWiwcmkhm63v7gygYQoD8kYNGlI7ODjLpSRfVQv3KCs1KQmXcYrpuXZ6JxRkcLywK
 UKcG4Qs6GT3GVvnt+c6qu4QjyZ9899Nx+zExyFuv7QzxlAz+p09W74kkgdlp1DRjfEzNdI2zsZO
 NknRQI0ZGK2vGOi3P5hXpgyHgkMyZPcAw3uzzmuo+USDinqeXTa+PwZqDcNIpfJUEF7z93RN06s
 5YaR2lrxoSe2M4apKmPRFBdxLGHlbQodq0v3qy5fumkOYuc+DQc5bZUls3DipGkJKRckB17iVbZ
 ni9IXE43ySAAUp2jECfaa0gR+GHEQHQ44UZ4mUzBBwhJooo6W5hsXPrVc496sMKH37wg1cdkfR7
 h6KvcwsbzRjiIi0KnYwOis7DNRLkV7UhpkAJu5Es8OWh96ZIkU1UM4qnTG2T8XaMg4h1Dmrb2aC
 kn0qzndII7d3fkjPz+gSWFs+Q8oLmVs69biJMe++R2M1rzbEyoZ3fnPz75UwrrXOAfGSkPF9Uz6
 ImkM=
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: rKk5YWw5JtK-3hr7bHiHKn78JRxZ4-b9
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1c5cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=mQFjCgyIq3-au8Xv:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ktzcv0D_gfG26edE9_0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX3LJ9g7akygb4
 hYXeYsNDDOMCUtbyXd7uFP/N5C/fsQKL2fb/naWOBegFhjfHfIAjeQVdu7AWXnPmYyf/cQ4M8mc
 XV/73aiXVUvg0sYMwN4sXICJTvUjCAHeFRTLHZVF+g1XNDVFd8FJjfS04xgvScUteowfc5Inby8
 eNDBJ2hYzDwWNj0mHZJF8LKc8X3ys4KFffFZ/HimaLCX59NaQOtzJpZr/Qp8tEd95mvSFy4bJym
 SVXD2hwPq1wuU7v5AwfZjROouWk34abmRN1tKfVjw+n1jUoqYgobAAkRDPYOX2rP+kTTYtXr5NS
 cD05eNNZ9f9QRIhiZesXYqtyontavx4GLJn1Q1ux5aGXGyz8Rrsc4hcYAUrtUF+gIvihy6YfjCh
 8zWlno4KQ1dz/ekWfviZZev6Qg5ZY7+H3616qtI3YD/Irg6cl8DcFZnaWnfnXSil3nzhl8poudU
 ay/CJKpseRziv7uh+dQ==
X-Proofpoint-GUID: rKk5YWw5JtK-3hr7bHiHKn78JRxZ4-b9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX7kIQcrIq3HlM
 DEys2WzKBn2oYxW7zA5o/Vr7/X+0EjXmhDSxRm8PGM6HnoDOPCxvnTtSCtVXKrt5ZaYS+zBkhEq
 kiW6m0oCjHvypCqS9vXkUiOWK0p+YQQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

When a hibernation image is restored, the clock hardware has been through
a power cycle and a boot kernel, while the clock framework in the image
still holds the rates, parents and enable state the consumers asked for
before the image was created. The consumers ask for the same rates again
when they resume, the framework sees no change, and the clocks the boot
kernel did not touch keep whatever the boot firmware left in them.

Whether the kernel that loads the image probed a given controller at
all depends on whether its driver is built in or available from the
initramfs. On the Qualcomm Glymur CRD, the display clock controller
driver is a module that it does not probe, so after the restore the DPU
runs at the 333MHz the firmware configured the PLL for instead of the
717MHz the framework believes it runs at, underflows, and the panel
shows a solid blue screen.

The first patch adds clk_restore_context_dev(), which re-applies the
cached state of the clocks registered by a provider device, parents
first, as an alternative to the global clk_restore_context() that
depends on every clock implementing the restore_context operation. The
second one adds a hibernation restore callback to the Qualcomm clock
controller common code, which redoes the probe time configuration and
restores the clocks, and the third one uses it for the Glymur display
clock controller.

Sent as RFC, as the same applies to every clock controller and I would
like to know whether this is the right level to handle it at before
wiring up the rest. In particular:

- Instead of programming the cached state into the hardware, the
  framework could read the parents and rates back from the hardware
  after the restore, so that the consumers asking for the same rates
  again go through the normal clk_set_rate() path. Would that be
  preferred?

- Programming the cached rate of a clock that is not enabled may not
  work on every clock type, for example on an RCG whose source is off.

- The Qualcomm callback finds its state through devres, which only
  covers drivers that call qcom_cc_really_probe() once per device.

Clocks left enabled by the firmware but not by the framework stay
enabled, and the phase and duty cycle are not restored.

Prepared with help from an LLM-based assistant.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      clk: Add a way to restore the clocks of a provider after a power cycle
      clk: qcom: common: Restore the clock controller after hibernation
      clk: qcom: dispcc-glymur: Restore the clocks after hibernation

 drivers/clk/clk.c                | 68 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.c        | 52 +++++++++++++++++++++++++++++-
 drivers/clk/qcom/common.h        |  2 ++
 drivers/clk/qcom/dispcc-glymur.c |  2 ++
 include/linux/clk-provider.h     |  2 ++
 5 files changed, 125 insertions(+), 1 deletion(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261023-b4-clk-restore-after-hibernation-74fff1dea5f2

Best regards,
--  

Abel

