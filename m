Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618268;
	b=4eEPFRZ+HBmSGIDwjONi/41z6pHLfdZ6RjlKnE8iRBlQS84g5usM/latRcvYXZgudyo3
	 xnCm3tKTTA0AHuLlNakVRP2GeNtvoUTJUlxKJtO8k8AehM3uE2hXjShs2JrTwXyXNEf5w
	 XjiXxEXZXnDbJBwN0MLva8MmafC33b4YmiMSUm5vAWRVDJ5vOR74NRXf8zEXXuqBuzcCD
	 xjB4MVD2AziExbJdhz75GkAZToRkfhMqF4DO0+HZI8bUCdz+vo2kIeFYkFBCqwnDsa1PN
	 GXLOsnO+aTIhlcRdHsyENsZ8HZ193uXLO7GTe+xTL4h44YQHyGvl5SaUkJ9HgJ6vjoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
	b=mxHZDtRvVe+Gz4kljVoV18Q5QG07XDfJ/SsBd8HsLRoWvCoHj/Ek0csNISgW92ZVuE+N
	 02drbm/M7O10UNvDDOeJymfDDOdkDF8iT/HFw/euCtNW93KDixd3Yv6ZT2k0PJEe7s1U4
	 2kKZPIpJaEe3TDFSZII5SnCb4PWuqNzm9IzXt8aVLNqjbM00aPTnJPPBTVnTk/CNP/jc1
	 JOmjDvk3mRKbqxzIqcsduYwFG6fCo8ZbZEdHnqpHWuXU3Plx0xnC5vbQby+BpOJnTdbUt
	 P+vXZgFYkibJFKzj2V0ejFu6spiXBk9nMHiF5baOEUuRNbc+bdyyPL8Q8n8vctyjmDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bcD33cvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhkeCBte;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C45606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C45606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bcD33cvo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhkeCBte
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMsL1821174
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96
	etKRTtbQ=; b=bcD33cvokbebHC038E1MjpApESiL9JijynWqJpQhJSje1qkHHtz
	oEfv8Bftbbqu31bs2g36sMjRr9BLNoSfQxAtvek8YbXFn4XQDVkspjO0+VvBpBcp
	WL0UdgEP6aBqXRTycX1SYbj4NOkwDzqfSpKywJhs4goLJu/XJHbHVDtQPdSJVPAZ
	X+gd3qFxqwQgi0RRw4WUGe4fuMlUSJvnHcat8V0Npd/Sd4Nd2caM2XEx8gkniZyp
	4JjzwAXR/CAfcojJcgIdLifjXaNcK8yNVfVKBxF5j2m50xQ5+Ms647JLiFbIw6Bb
	KMZfNPqm3nEhf6VMSUIfojsboH5EWxBv/GA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hdby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:17:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so4158120eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618267; x=1794223067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
        b=HhkeCBten0JAY4UYxT088DhUsXuzswkqbsJYabQodzxtY0DaFrSb26NGpLEdVRyxlP
         Ht+YrCxhZAEduEMW8ms5W11xcYY6H97EO6t92HDGRF+hdNQ3EG41GZKAUa8MaPczQYGx
         dU4Wgcdoh1OmPSLzoptQCmXK8dgMKG3rSIKqcgSluau2pmnoMXnY3NXZHSRj/7fr2Rxe
         GrEK2OCyUcODkcUTpNgdcW7BeUHOqdarYh4FLy3lyCIeREvQbLjX22134E9JN/zICCSw
         MJ9LNgxv7KBO74bRMD7Y0Uvwx6Bgcu8pGIDmnZiZbKN7tuG+vb4Sf+cRlIWEiYhVKlCk
         lcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618267; x=1794223067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
        b=gRSKKPfW1mxW/I0Y4rU2fRLpIZnBWlFHj7ZdzdaMHgT3jdH96amSrUPTsCoxFHcE+9
         b0pmCHNGQiC8HUqmFrNiNFBaay1u/lBcYZm2IEtrC4/BZngqlh2DEowJOeTeg84wrWUP
         q5CmwbmGInFOqYnZ/n29H+JetOX9zFBOPRfPciPy/ikNJTYxY69nwZk5qtnCcqd2iUEw
         /63AvKArsh9g047g/h7bCbd2/uHTF2wZOkl9HjodOCaNrodTZJeYfojGWjnQUCCGgKi3
         lLLbIeVcHgYxPHGTs3SDiB0qckMU7usePF+4VTtTRVZvMeXnQa8QP2Vbrt67OyQadBw5
         /s7A==
X-Forwarded-Encrypted: i=1; AKwUvBx5zsiFLDnFXV3Gy+NQps6VXLkOPiMGb1x+43NQ797ohzb2EpX5vK5t5fyvTe7Ast9mqD9c5zzfFvaqVHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lU+rBCKqgiP4oed1oNQmDug6DKyEe3PVwqxlFbBlhiRgcWo1E
	otaZTKci4HFPUUwzcb8LoPN2/fZicRYJpaSoPzZwg7oIuR6lcgVRCuK3DceOaGqHZ+IgYUSSTll
	qzYgYYsSbJDh2lNXPTgd3YUP7yBeQURpDgGLBL814N9HnemETVLcGiXB3C2TmKMPsSrE=
X-Gm-Gg: AYBFou2ssF2m99AZNar9FxvfTKHtYys4D2iP9qZd/+DgubkiCgOmuw97xrQgahwniJV
	iWPxlVx4102kobJUlBIy8UuOMzc8pMO/Y1or+7kx7J6dgFBenm63CDgiVU59hEeNpGhA74MEQNX
	srKRfKGI6Z5r5Yob9csiCbSVdLwFXA/lZG7TiwMiz/IniP/IBDdldtxxao5aSB2EItpjZ7cmlwU
	ze2QEownFaqMkTGdwYOpEZcodc64DQT6IqipQwN2Xqg94Hr8eNk0JDQFw56i3LF56gtQrvvTRcq
	j3meTLo+W9eAKRJYPsT8N/RJP2bESns6Pe+ov1v/HblTb8v4TqXITJnUqiBwWVnUozejv14Chd4
	S8+NUbWNmMJ06fRdxgriTsA6/hIxChOSytxXzOYLaP5kXOgz12pHpioQNJQhcs1iKpz74LHBVuB
	oEvTj20dNzrGWaVRlpnE+tUUo2b+3g1pgN
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr14292681eec.9.1793618266521;
        Mon, 02 Nov 2026 03:17:46 -0800 (PST)
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr14292638eec.9.1793618265943;
        Mon, 02 Nov 2026 03:17:45 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm16492078eec.17.2026.11.02.03.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:17:44 -0800 (PST)
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
Subject: [PATCH v4 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Mon,  2 Nov 2026 19:17:29 +0800
Message-ID: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: QQ8hBSiaCv-GSgrrz5cfcdOFIdXRozMr
X-Proofpoint-GUID: QQ8hBSiaCv-GSgrrz5cfcdOFIdXRozMr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXzbWWo37KBZqz
 qvmIeVmxf5vd4NCBx6w/tsm4mZaTC6Crql45oK9u4Z6OOSgfz7nn9v9eJ/BmJf9qpqNsCTzcSLb
 MipmjDYOX4v7qJ9GskksMtNh2ZbB6Ow=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8715b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX3xW7mWot6bk3
 RoY3SGLY7KpgpNjOYl9ATGCnaz3yzN8upXBWS61R+0HlRuHRktNF0uPOHs46qm5KymlJjdGS9p+
 QKZaKdQX+59XM4GbYKBdRspvArrcvCVOCWqX6A7utz2qLstRO4WZyNSxebzT1MVeKzY0AaPOySi
 y51fHESeEF/+66y7fsYEVB2us4VQ9UEcxjaHDOsZKChmwDIGqe5TCOuERvmruFHGBMv+a8E2ceu
 Hcs/qm065DqUfv0D2EKDcXHr0NB/gqIzb/D4PYBOijfd+zuaOHuwHwzHIkZ6UDRxw8ZBkn0Yov4
 PCcraklhyOrA02T5E5o4OtzuHusneZWNHTN9kKu21xTn/jgG+hwGKuf/8l+9ZovkzM2+UuybBO/
 AkhnEU3jotUriWhvJ7mb+pzbyBZAnR69lK/3ztrnh7ZV8U+mWwAtdz3zuR1HsambcSurVz+F+4d
 2WfMKqc8YJ7+b3GeZCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

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
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

