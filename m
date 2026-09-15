Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6296390237
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436700; cv=none; b=QzzMWwJ0iP3RGZMFHaI+zMLaMYYst98Gi1KYMllX+Lefr8PaD8zLhh7z7IHR7gO1+US2Kfg79Ove/nAyvuvtbZ7THvTRfWfI71XYd7OVVt1M4qL7RHPsbIsZ0di65fIj9tFUSw7Kza5oolGd46guz0pj/UBUfrYCqfvDw+Wjs1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436700; c=relaxed/simple;
	bh=Fqu0oL7/K6k2KKq/OK5mLZUwutadk8Kcdniszb9Rh7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ntD04o/XZ/1BdB/6XCXXsCXo5cih1rzudqQteidk3kU2VQPFJ3pDf1iqbUp8qn3dwUpLAPhk1XIRYzbXu88N1alVDyQ8ZznRFdYH6U1fCw+woVSWwwi56LWVrJa30H2SI/h+cRIGunN+mWVaFNLhyAMKVR6qf6tOKNuLokQYJ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGFmr99Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3hXjJ0P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGFmr99Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3hXjJ0P"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxsIM688270
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sBOPiRMao+MzpEM6RjwdPJzJszZdcrUiAbt
	zBim3oAA=; b=iGFmr99Y9qF0vJodR0WWwH/B7u6oWKphSluE/OBSPuijxRXbcOf
	2llVdMti1UzAZt0+2bFndpA84Tphb/UXs+sBImlHubaNL8JqXOJtbY6BRbPKaCrM
	cflawuM0yAbhaKn7+38gG3mmfbUANNu2MvaZmnChLryM6qmMJLqI5hhtoGyNGTL1
	kUls9NjwtjyQ9siNsnsZl+sSDEf2bhJxMim47hhWDTl1cWamIDd+p7kw/yWSptOl
	rt24wLQXOCMjYZl89Z69fOGUFVeyoeBS/D1C5x1/yUYuGtmUOmSqtyfo1VXR0bLt
	+mMpXxxsSfD+84UthLTtB9LYPq/IdilLJLA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergbcbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc44d708055so6709573a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789436697; x=1790041497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBOPiRMao+MzpEM6RjwdPJzJszZdcrUiAbtzBim3oAA=;
        b=g3hXjJ0PoEq1H3hMXmeeJk3qRlXsBI6mwEFyM3Lofd2Qfl6KHg0JItHtAPjSk1/1U6
         6ERS4wLuZ+c9wN2Ve9kgc3YA0nRboGryMNEAN55Sr99xe21ohKcnpOerfms5yXRqhWsI
         Br9B0QWzTdatwzlBtXTT+AP35usGQF8M14hbbsPte6M3MWvIlAemrMED+e0UjpNQr3Us
         uUGwXE++FLwb1NXRZiCB/31O6NjMuvpMYzs8xmGGB/vsxK+b3Tanl3hqk8rqibBqoiGQ
         HFGtcpNZY7/cHo3GQWNwlr4FnHUTVhnTTWTPIV6q3i+6MjNrr8hjwQseTb+DqtBQaQ8/
         P6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436697; x=1790041497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBOPiRMao+MzpEM6RjwdPJzJszZdcrUiAbtzBim3oAA=;
        b=SiZ0WD1sRFJetJFpF3iQVbGKPhzyvj4tokslq+RgH6GwQqGFNfCypd2Jeg8JI0SU/8
         MCQBGEiQickXFvNek8p3Rm8G0VSHMXLq45Mcs+8J1EiYl73tlIAyhjkStro5CJvwBRZn
         MKGNQmU2KOMz6shKsPONQtbxjnXatITJR2JF7nfSzJKTVHyZxi4oEfuNyiQ1DN1awaGa
         E9qakviDkP726ut6F3JIHEYbHq/FHd/VWpqlctyXKA36WJm4BYLFHIia/4jEvGJBR5ct
         I1tqZ3NYvCYKkWCtwz3sIg1M1MNRab6quPLRJa5Dt0+epwnmxzfbjx3Vn/AwkHF0fAxM
         gKbA==
X-Forwarded-Encrypted: i=1; AKwUvBwig0nK1kB0jGR2XVxcxA2HGK+UExdFE49DbQb7ry7TcZ2IRaeL3/y3ctmfm678wdIDqXCCQmfv5VQdtEg=@vger.kernel.org
X-Gm-Message-State: AFuF++nTPZBt8uSqekoqv1iaS5avh+/uZ5pgkaBwY9AHCAZt6XAJqG1U
	apOBsM/Iob/eYVhH/oUaVE2D3xiF9dvFYdadnCQM3s1XEerUmjG3IpC0B7Vc7tlhmp1L7TmD4zD
	sfPeAi7LNiHGHPvmxjNxqESsRyE5/JguUhFobOSMzw616NPNqmdeEMj3J+thBYfJjAtQ=
X-Gm-Gg: AYBFou3YqWnTqPM/s7qnpym3V/vFJFlLqxVi2svGMrYT4gI6b+gutwoU3XlFSoK6nkU
	9xI6gHc5/Obsc5zsMZdmC3n0n3BT9qB0Ns6NTROnmbz75tQhfmJgz8yk7kSPIdNTLCYtSUJUpBx
	eQp23Y+Igem+IKq3T20MPUAAYUxBozEmLWegvM0D7Xm8TGgKVJPTBtttCHNsyB0jkH76QnZYOpx
	quQjBFCor0wkYiX+FzRO0mphzyv85A1X/6lP0b8LOeKlkc0AqhO5vfKedrGK6YL554h4E3zqIf2
	LD6Oj8ONLzS/2H7oPm11r63IoqFeLhtRh3/dIdG8kqlFHh/Jt23PCiDYe0OqqB3bXX9BU+R+1CO
	YPbleTrA67UQNI9sQedsVyVxwmsfLTyMWBZYKv70K3FdYsLh1BBLnXwCMYDds
X-Received: by 2002:a05:6a20:2446:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3db404b5fffmr10475181637.4.1789436697483;
        Mon, 14 Sep 2026 18:44:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:2446:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3db404b5fffmr10475115637.4.1789436697052;
        Mon, 14 Sep 2026 18:44:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm33104723eec.28.2026.09.14.18.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:44:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix sharing a PMIC GPIO between multiple consumers
Date: Tue, 15 Sep 2026 09:44:45 +0800
Message-ID: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8a31a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=-rZZc-vT4HAifJYpZ8IA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: eqhKXX7vzK8VAM5PnJ5Q-xsuVowJAySn
X-Proofpoint-ORIG-GUID: eqhKXX7vzK8VAM5PnJ5Q-xsuVowJAySn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfXzdyjYKZ+mP9J
 DMZwgqsHbnhH1qcfMPBFWQLz2H414eGmTS3PmDJa0igFBlQD5KKSsFuzlpgeQNV1cHYQzFd5e6A
 v/ov2hXtldJqY+opLOBvN5eNibsUJhmPQTKkNwksi39LWKJCPVdGZqfeLMvqF+dVGrV2RrwSmiL
 74YFizqLIBiaVXg71vl/6wxEdYp031ISjEaUhvGKJgXXXn1hJ5b91K8OUFwBWz0DaPWgbPFtxgU
 2yd++WFPxDFWOTPxt+lPApuu1lVip/xgLnMLQPiygz7Efe9SHQ8JfGMIsqAupVPGiMHXvnLKyhU
 gzr+NbL3wMYgdaeDmgGIvbShGgt7Wo5al9i4jQ8dFZ0ELWySu7Mg0XcF1c6SDYGcyLqCRnS/Tn7
 JNMwayMsMi1BWNkxmpN718KC/n+b+r9+HwxFaOjsvaK9kV9SM1itjc723rKL7pK5ug+UYx2IUEO
 tdKjji1+VrrH5kw5AMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfXyh9RuYEn91Kc
 rpI/4M3n+3NE/OXM88wxeOldB42yFtQ+Yp4ZK+N2iXjgbKrBrYl52k1nztpkrl2J6B8xM0E1eA+
 e5666EmQzfa4Tg0FUkhPujoWAzKlTw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150021

On the Qualcomm Nord boards, three discrete regulators feeding a WCN7850
module are gated by a single PMIC GPIO (pmau0102_e GPIO6), so the board DT
describes three regulator-fixed nodes pointing at the same GPIO.  Only the
first of them probes:

  reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
  platform wcn7850-pmu: deferred probe pending: supplier regulator-wcn-core-vh-1p95 not ready

ARCH_QCOM selects HAVE_SHARED_GPIOS, so gpiolib creates shared GPIO proxies
for the line rather than taking the legacy nonexclusive path.  The failure
turns out to have two independent causes, one on each side of that
interface.

On the provider side, neither of spmi-gpio's direction callbacks clears the
opposite buffer: .direction_output() only sets output_enabled and
.direction_input() only sets input_enabled.  A pad left in DIGITAL_INPUT
mode by the bootloader therefore ends up in DIGITAL_INPUT_OUTPUT mode on
the first direction change, after which .get_direction() reports
GPIO_LINE_DIRECTION_IN even though the driver is driving the line.  The
same asymmetry means gpiod_direction_input() never stops driving a pad that
was previously an output, which is a bug in its own right.

On the consumer side, gpio_shared_proxy_direction_output() reads the
direction back for every requester after the first and refuses with -EPERM
if it sees an input.  The readback is not needed, since the proxy is the
only entity configuring the line and already knows which direction it
asked for.  It is also not robust: a provider without .get_direction() at
all makes gpiochip_get_direction() return -EOPNOTSUPP under a WARN_ON,
which the proxy propagates just the same.

Either patch on its own is enough to make the board work; both are sent
because both describe real bugs.  Patch 1 is what makes shared GPIOs work
irrespective of the provider, so I would consider it the more important of
the two.  There is no build or apply dependency between them and they
touch different subsystems, so they can go through separate trees.

Shawn Guo (2):
  gpio: shared-proxy: track direction instead of reading it back
  pinctrl: qcom: spmi-gpio: make direction changes exclusive

 drivers/gpio/gpio-shared-proxy.c         | 43 ++++++++++++++----------
 drivers/gpio/gpiolib-shared.c            |  1 +
 drivers/gpio/gpiolib-shared.h            |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 +++++----
 4 files changed, 37 insertions(+), 24 deletions(-)

-- 
2.43.0

