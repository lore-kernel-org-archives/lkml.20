Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679507;
	b=PlGbMnnkJRjOoAxcbuUhQnFawoa64uSEyZuq89cQjGMjC79f69JvdPGGURrurqKyvQkE
	 xaMeVPleeab/RslZUAiOYXQib0l1AvOqYTooVAp4PWW511G6mEWbjT/5PXXQOsF/4ihok
	 zuZXnftQdbvWT8yhlaTEVOr2Mj9ayBf4WMfhUtow1AsjFushM4kjyq+DYuwPv+aN/yLri
	 E9SAjuij/+lgyU89nw9auej4/rPiBlhN0l+Znd4yCjtIL1lHEDcraucM+VEZHEy7KkK7H
	 3ubVKNeiEL3KI3GHT3oce4UxpLRg5lCT12oIoYwuDYiSUG2vXlXhobc51TqcJZzDbGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
	b=5QUvKx3B6seqO1B6jdumCWhVtYJIFVUqPXUBc51i8olOeqar+8eM5YgaG5gChH9RpjOw
	 80gs7lIu57ttcsiPa0H00rv9opRG93RrfndcMrDOdKDZ3VWf6zWVtMiXS/b9MBPPtYaGH
	 19Rr2x+Ow/4QKlU/dQiYYh7TnLGQ3zb87pSarWuZbQYFRRrcd/SY2UuAdWQSHE/KbblIw
	 lXt30oc79ND0oF2bikVXf1G1YkZoRfnFuHwv82fGVF8brRYAC4PsIxNeByPSFN+fbNSjE
	 UZv1Gi4BBTCzF2yeOxP59Rv9mNOw4k/Za9yGFiKQC/89Yec4A18xlIghUwme4HRwHOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXyOblNy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyMMpSVy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F37E606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F37E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXyOblNy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyMMpSVy
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31ehE22012468
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 04:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUX
	XPzT37bk=; b=MXyOblNyivzlhhDaxvbxapLabSSW4APLlwmdNnz60zphknHtWXP
	lEb/nG2i3qBSUuXwAO2cZc4GR4V7fvp28HvGBgsnQN7mVTdYh9qX6uOyFZOaK0hq
	fUsbpufi1B0TSIbS2+nwW3mALKaUO+P5iYbE5Yp7drdjcYOJKMnUrDFAN2cga4R3
	eeKk5vD3y+t1Tn91U1cqtOiQ3RktCSBm9uF1BjZCpiqiUxKqvf0X+F7ZTQbLelSH
	VgSVgAZCzRRIb8xospDrFES1BH5jzU3kIgNuz6Ctlu+vLsVNMj9XS1qpLJp03wd5
	/bLOo4cBVPd3fVdReK1qs06V9x5iWhWWB6g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6urts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:18:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso507277c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793679504; x=1794284304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
        b=HyMMpSVyg6Z3t9AbJhOBDrYyfvr4zpQ6+lOyk2aB3EFXA2jc+VoP0LDE6h/L2P0zZ7
         fpl7gkcuvUWYxpdPg2Qrw/eMsBx2YJSUVZy1+OXhuJmyhsSoghBswM/iNbOA5QPIzXvT
         Q3FK70D+TTbydiImusKCsAkdhBdHzUw3WHu3mgvUeNDV9YnH7AWSNKKiaKDEeaOWKRq5
         xGRjr3P4s7sctXuJIWgCwY1FhNiDT3ESC6Le0ZXlBnx06QeMlo5w6YCwse8f74YjfM0q
         xING7YImd6/tOaaTssMBRnY1700tIS32BiPHcepy/fQ8P9BIMRt4kqoU31lv+reHgYZ0
         H55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679504; x=1794284304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
        b=jlsEfzv/qvgiPYy51dKb552+DkI7E2AaDvwp3YFxdNb2xVRUcIpr3zNXGRTnGW2L4u
         9HqDnzOW9oru3Uen5u/yDukHIA13yLii1wwrQy9Ev6iOKnnv8AL92GVZJVxkH0qt3RMq
         fIodXLS/IRm2f4nXhK9DhoxqVnEQ0PYge63/7X8+X6YAXsDrglS1rEX8ZGWsKh+Uocfe
         GfFGc72FTgxz1ySwY8c8CT6HUuCy3EyjZuehQDN8xr9jQ8GxwKZfOJhY7mu5uciRXILL
         xb9Pk7GrihGuMWP318s4yRyMk+TAffiqbCJNOyfXbQQI5ZimnTfLTtZUokQetJj8Bpqv
         +u9w==
X-Forwarded-Encrypted: i=1; AKwUvBxLkjFEpODO5n5PfMMIm9MSVvuwj9exZuXtLyGwOgs4zCUxw0B5lgm1GJmwYSYVv/Lu70frKu8ZkwcxFko=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJeaojYGsmrd02+YkoXMz1VDYISjeFbqCG5xOnOz6ZyzuItk3U
	GPh1TrRFvmDdiqg047LI3VZl8kiOT2EfRVnH6y7YhvIPkuuLXcNotsBNcmVjp1rBRvoJqaYEyYq
	3/U2xM/S3bFU4J1TuAvTEDDhhf3mPjmiGdhaoQ7hKJMBZjygwBxpHeinLOixIuNHmHDIahdMOyb
	SzWw==
X-Gm-Gg: AYBFou0ywM9+wiDSyMUFtPsAFaH5kEqosRXVxDQ9Kt4K882iViUC3YJ2YcReiWlQbxg
	72FQv+kkWtUHrjMOflp+sYni7A+aSP7lOVCByz+86z24j14NCpx9O6GFhsvAK2A8/0kxqBIEvOx
	0yBu8/5hg4Lu1wn5lkaCiOitKL8xle0dlFcJgJz93tr1zvo7+fSHyH7czjL/L2VD3zJzmckQjgv
	92u5glCTzxFO2AHbfE2AIUj/QImlQwgjgMoJqkr7SFhv8ngMm6vwwuwC/XjwimJdnnPEpdYWLlB
	bBdYg3qFvzA3gEhQgOfotKboOpOgSBGc0/wYpi4ca2jYtIB/GOvHvNYU2k+t/WqyhIeVHYlArnK
	UTFhZHRLloK4y1RMPcN6GL5KnTsOwAdZLxb1EcOj4AhXk49fge9aIReKDNSFYXDnb0uQj0mdmpG
	PkBatd7+80SecNVPZ4auICml1E9TXnxQbD
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr16586698c88.38.1793679504080;
        Mon, 02 Nov 2026 20:18:24 -0800 (PST)
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr16586653c88.38.1793679503305;
        Mon, 02 Nov 2026 20:18:23 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm21701617c88.9.2026.11.02.20.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:18:22 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Tue,  3 Nov 2026 12:18:04 +0800
Message-ID: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfXx7vCCtxzsMuC
 BwDrwYoZAJnekCNPAarqb+virPvoEA/+ugdXCm3n8iQw2JHx+Azq1U56EZnEEXeKrXQluL5wndj
 jCWH/dvSoiRd19Sh99tMdAHsc9PRTqkcO4rG2+iSecuocZ9fODN6oveKZWHRzSxzJOUyA8M63pr
 jm/kp8Yz24BUv30CL1qVoPQ/1Dys5PeyeA7gtHwSRwSu447K1ZUwwjvQDiPaRjaDXg6Rj4nPMcu
 hhm8P3JBgKtmhVXqVNKeepiUknEMKOSSSusuxIFkghDyGoBDCfaI8UsKuW4UGoqINesX1BTGaRf
 24KzE5kP25TsN0GXPFL++RfFzl59d2aQ0HEAJHmH83HlIJfAc3nLmCHAaFJRJMPZgMaifthzer4
 Lgfsa6cdnYWNLv4PX+j2ot1G9hOVe9nRYQmPMcmv1hzYRUDBxui/pM/7vTE+MpXDOfLOlkf35f5
 CwrYr960A3BVSEefthg==
X-Proofpoint-GUID: CblIoADfEhPq_FzaPZgGgCeIC9p6KUTy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX7ijfmKbtJCxg
 gsrlxV4XtiJ1SC1JI6/zYA8t9jc7vF8hqLc+bZwhs+TzTo9PsegkCsPeLlhXNU5L4uLAgzc/06a
 7TQ6MHvpsk2am3G08eF95ZzS2BTHPAI=
X-Proofpoint-ORIG-GUID: CblIoADfEhPq_FzaPZgGgCeIC9p6KUTy
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae96091 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030016

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v5:
- Hold chip->lock while seeding the initial port state in
  fusb15201_hw_init(), so a data_role or power_role write arriving
  while the port is being registered cannot fail with -ENOTCONN. (Sashiko)
- Link to v4: https://lore.kernel.org/all/20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Drop Assisted-by: LLM
- Link to v3: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Address Heikki's review comments (Thanks Heikki!)
- Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 586 ++++++++++++++++++
 4 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

