Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA43483BC6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548401; cv=none; b=N5CIGhBGIrrD5xOOlsnayFA49fUFIV0h3f31rRgWP7Ceue+WZtIj9Jz8YC4sQiDPzMBdXRuSE+/EDqwz8E+ooNmDB15hmIO+tNidomUr3Rz+oaR3Artdjq4Y1VO+bAE02SdVrnIRpKnQPYIcoRbWr+1i0GzyX9bN/LdlbIGRYm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548401; c=relaxed/simple;
	bh=CzpLtfkGGwXrRiqJRcGIpPqye67qSq4ze3YOpFxTn9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqDKEa0jEGjngM/ShEMT3fhA+V0Qy4YXT/ZF9vLJidJ1MHuBAB+QiOJErW7r+6yXkd6NhEpoHr8XtmcHGAmla6aQNOtZNA/tSZfEV2T6th19qcJb/DAYeBi5ZyP/WMrTybdXMDf1I2vlld0YmYEvLPfy8kqWdvPZ/+FgGINu9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBD5QjUK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIGm3re3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBD5QjUK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIGm3re3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KLKn2369636
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 12:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mBrbuKgt+Ksrs8OD0jodhFSOayu6IsdycZC
	AqvixHQE=; b=DBD5QjUK1KbsiWam97SpZYY6vSLDPASbYZv5wXijvxfgZtBzfvA
	K6SEs8M664o+OvY01QfwtnmUfd1dpAEzIUxosBAFWzZmRB1yHuD/IoOAbcxi2Ouq
	6EeK4AcfrRV8l87XL6VZN5e1hO1lARJ94RbR44Pq0ameL7GV243i8F28+XvMrX2a
	HF1hUd9LwPKu/Ex1CAbxBrL0Nhv0oXICeW6jgWZ4a2M8211TrJ8LjAR6TKt7VdMq
	TsopKswppescV2N9nBbXAKf5XrAumhWzTKzXVBJbmXkrtnAdlp2yu+wJzVRWxi+v
	g8qyp5wea6zAhfNBR20Qflq5H80HBtcD2mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwbg5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:19:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so1589099285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791548390; x=1792153190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBrbuKgt+Ksrs8OD0jodhFSOayu6IsdycZCAqvixHQE=;
        b=QIGm3re3q0sTDAFr7+Hrr/yJfVbBDrExjxHq1Kqnp/LrtUVLhm8j14RfOkjjvcQHYs
         FABjVACFQInm1o2GJH7cmml/WyNY0WUkTqYxZTABLFdvAt/NlJ6Mu+Uip21TUpxKsU8x
         Ptpzh+Zu7EGDALwXQ5EYjWKdYP20b30TmjRYjQ6dW4Q+1yWycCUwvz9I/aaU6sGxSwks
         AjFjBCny9y5Irwf+BvxOaGkZ4wYi7LjuvPGq87TZM0rkAEr88D2cetQTdZc555HujFOT
         ORaGhSiuvy3XGzmlFmZlBlHgt9OqpVROHWFW4h4Sm2aSSjvPv/AkQSxL7pk5Sea25HJB
         YV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548390; x=1792153190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBrbuKgt+Ksrs8OD0jodhFSOayu6IsdycZCAqvixHQE=;
        b=HN6TP+GZFA6zfcVkILFMgyI2k/NeoOq4LJTfjdQfO6fPMBlyafdJRnECZaunIOaGeV
         JMKTFYK1gkryATVtMpt+837IOlyXFQ60SU1VQSSD7K07U1jOJdTsz+CMHEib5nkeNJlg
         +I6rsTGqS4mKb9SPxzA8/YuIwg4JY7oQNRKFy/xyFb0VLCqApskB8BG73VTjvnE72AsL
         QKoY0Le/dEIunmH6mINfIOYKOplp0gy/JtnibDUuqZNGBtgf5yJOelRKnjGRAVHN9D1p
         5IaMoD3YIva4v7xVbHttcOyy2I1jPrsjXOMsn780IxeMfalmnm8ccHqzQ5gCYUPdjTqn
         cXQA==
X-Forwarded-Encrypted: i=1; AKwUvByyBKSqJk9Py9Xp/XAlxPOz/rZ+4t3zS7iHN0qPs6u14ktyMEyKbgzLmN/OA4YHHYXHI9EYTuYc01e5U/k=@vger.kernel.org
X-Gm-Message-State: AFuF++nl7F1wmqO9C/uUF0uh72+E0BteLz1hzUxIFjcVMEgWL64XIC8x
	b4+GeFwgKg3zamyVnhjHqQL3kIW7Dxj3odepUoAbA3OA0xM3jkKVkhHPHd8Tlv+y4CiJogzH4E9
	G9Wacx6gt6n/Z2u9PTFsNN37AS38b8HDPVwIyVNCpW0i/1u/PLCJwupYR9LWoO6IIq/abtskiU1
	g=
X-Gm-Gg: AYBFou1OVNOYt0nE/kY6o6xKaqGMqAvdp0drX85UTS/IIvmA4aoiN/PenD95SPW6ipZ
	6++/FKjK32lFNlFsdvpYWAg6JvLMs2Tq40Q5TTU7aG/md+i9oFCHk76C2flv7NaYKnt8x2fLiFV
	wzPfJRlX66k3kJnpx/5M6qlXRdGJtHzV8yAx91onfD/7fUmm11NtYxl0DzjMEx8f8bEUMdd43px
	tBzGWWs4Cf0s7J/GqUsVbxVel44BgYfvsOM3BdEw3d0FEIAk5Bk7XknT9qNeQcCvwA2WEYXHXRY
	abiWq4XpOTnY5Nu/UQrPcVZs5s3fafALye056L7kf1DZBR5bHic0k8r/hjkllBj3F8b84bmSwZ/
	EvcPycuBIgJP/9d0i3RLKo8p/3C0=
X-Received: by 2002:a05:620a:6306:20b0:93e:c12c:fbc5 with SMTP id af79cd13be357-93ec12d0793mr98793585a.82.1791548390306;
        Fri, 09 Oct 2026 05:19:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6306:20b0:93e:c12c:fbc5 with SMTP id af79cd13be357-93ec12d0793mr98788785a.82.1791548389566;
        Fri, 09 Oct 2026 05:19:49 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e481993sm40485285e9.2.2026.10.09.05.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:19:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v7.4
Date: Fri,  9 Oct 2026 15:19:36 +0300
Message-ID: <20261009121936.1882361-1-abel.vesa@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0OSBTYWx0ZWRfX0PoKz6hka5hk
 p7ncqe6Q6AKhrzj44gXn5l4TpqZhBbBpNWmZhMKY8LOG5EEfjW+7TXnAoULeNCPZyKeO6X7x3b8
 Dg7vrGNwyc1m8DUew/nGNbZYtpmQe8Yqn1LCobrLr/Z3BLsNlUPK6aq2mMmFPA3guk4umDfHisz
 LyknHqt5s8DA7qfXKZ2HrVhtw8x95Vyx5HLn6CGHt4/TLCX/oC0V4aG1eEXAdbmp1G4wc4UbIlj
 YOIDUhZt4VdZlhvX4XpRL4ibedq3GDL3oxcq5PvI7eKhP9zGKZzfzpheWPGtEhH/+FN1TKHIOlY
 ZGG+9WFoXdkKGBr0xH/0e0tAXgSRXoOhJEEoQLqG5a8541zKuUaVfN/Twc1ImIkc9k3SnvfCBW3
 LdTtDzgw1fLPI47l/ZjMCW7r8H2+eKzwNyg/hVOY0Bi8RsUfHy9sqriSTWWbznQJzFVWrPMKdAQ
 uR8YqLRyjZBChMJKO3A==
X-Proofpoint-GUID: KPuKJTsr3lDzk6bjxb4aBnfvW43DxYZL
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8dbe7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=dMgMsFW6-PjHuSmHTgUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0OSBTYWx0ZWRfX+hyBoU57R/BG
 TBA3vMdi2f96diJWgTf+zJVYmxz4e4v7N9mepru09GGtu7eyqsgjRtHfeCa3dKBX21AznFIEHhP
 JP1bPHoUD3STMmY1wIAV71H+RU2zFzs=
X-Proofpoint-ORIG-GUID: KPuKJTsr3lDzk6bjxb4aBnfvW43DxYZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090049

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-7.4

for you to fetch changes up to 52d4d1b26a5bc64de95099d0a3dd8b90dba1f3a3:

  clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw() (2026-10-09 10:55:51 +0300)

----------------------------------------------------------------
i.MX clock changes for 7.4

- Propagate busy timeout errors from i.MX93 composite gate enable.
- Add 350 MHz support to the fractional-N General-Purpose PLL for
  i.MX93 display use cases.
- Fix clock reference leaks in imx_get_clk_hw_by_name() and
  imx_obtain_fixed_clock_hw().

----------------------------------------------------------------
Linkai Gong (1):
      clk: imx: composite-93: return timeout from gate enable

Mikhail Vaniulin (1):
      clk: imx: fracn-gppll: Add 350 MHz support

Wentao Liang (2):
      clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
      clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()

 drivers/clk/imx/clk-composite-93.c | 11 ++++++-----
 drivers/clk/imx/clk-fracn-gppll.c  |  1 +
 drivers/clk/imx/clk.c              | 15 ++++++++++++---
 3 files changed, 19 insertions(+), 8 deletions(-)
