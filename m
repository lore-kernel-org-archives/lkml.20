Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112065;
	b=B3K6zXtCLx+v/4KERA5oWbYN5J4NdMcj5jrRCDFFegMnwHar9RzuvFJJLxK97NRWMGBe
	 zgnHpE76HMiWTLk279fG5dkzZOxNBJlWhZ1bO9PhqiF9yEj1p191L32AxFmmvmSQ6x25E
	 01NMBqWdaf9EyByMEd2RAzt8PrXhEgLQdUxIypTZudscE3IuusiULj+XdM8mGBe6+g+Ne
	 uErvKreo7FAN3XxHda8qaIFdh1VtUmLFHI55lEF0heMJyn4mH0aasyxiD5PJQBzZQ4Tym
	 lUvPf/LEyfufcMJLChDyHJNaThX1+ZjVBAna0YR51fE183CAbZcrl5bj/OoxbE478ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bYUBF2rOkLD/SmrVZb+dI12qHDch2kaBBxDj22+nT84=;
	b=NXsl6MtIvqOt/W3dyYmlMDY1yF9Pcs6vwlc9FDoHxcuuNLWXZT3LPRGnHkdqTu6jX+Ub
	 h3FOoHdidqFtZp9fleJECLI4szMdTWlvGWMzPnSQlrVxVVLoB2Ur5UvzeykdI20jQO1Ry
	 HBxP4NHrqW/G/Vp/pm2Qi+PsC3XtKVpphoXXNvyZKkt6kXxgTKbScAbqXNVtVBfaZHBCx
	 lBZ4St4sa5DigNkck7chuVDwQ92vQ36focOweJN9FDB7IdE801rPHhQp4Z4JCWtUIfrDI
	 CqSapIyvaGM1Gae4RO9V+CLIDrjVdyTRI9rBKax3Gv0k/9XJD61ATh29Zj9PX/Klp3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aIVIu/zx";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dd6eZb3G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E04606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E04606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aIVIu/zx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dd6eZb3G
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoEQM1316483
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bYUBF2rOkLD/SmrVZb+dI12qHDch2kaBBxD
	j22+nT84=; b=aIVIu/zx1n46yLnQI2S2T76jqppwr7K0wZOSd5S89ky1nPePZ0D
	FflfNHGESnL9xtcty23esbzf+yCruWVF8037+MMOMvPf3N4TH1LQQrn49PEFn2HG
	v+c1odHzXHkI5D9UsdUuTsjSBEj34sdLdTBrIlq8dRCz+vuE4LHI0a9Fe8EgnE1W
	eJUsYWC6uc8aYO1VVUkOsEutjfMd35YbCM5OjNqvCK2iV/dzA1FTu17HmE4bzukg
	Ixz6lWI/evgxvtnSelOozcMl2IBUpLBFgEFxx87nilzLLU2FL1aXYkdsPJr4dHm2
	/bFAWHjKNzRk36olczmKqj6YVg2+LZYvMjg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux98k5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so1012376985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112063; x=1793716863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYUBF2rOkLD/SmrVZb+dI12qHDch2kaBBxDj22+nT84=;
        b=Dd6eZb3GbXpiQk0O/PLUk26LMYWcO3i/COI1p4/0It95FD35yxEAk6aFCV0mqCctPV
         kSEFvArGap9wmBRrtwh0wiqMSUb52UjmtjyuUoZBL7I5gPOeJXFjz/1Yl/x6D0DSfml2
         DOzhgNg3FnCHE/2ijK4x45FJ0teb2KPqP/Wtw88SudvyXQfFAx2Sw3Oo7JyhYaLkGYL6
         T6QjFMWfrhSlwwh85QSaPoOH4yQ2ShOr6QHvbcwfyGZYQebjhIscQt8APSJLnr5VAxhU
         gEP3NT4QK/XmQ5lit/U7nWUiP0Jmu1Cgy9K2zaANzvqvFmUJ/dfphrRo7SKhybZRfXpe
         Z+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112063; x=1793716863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYUBF2rOkLD/SmrVZb+dI12qHDch2kaBBxDj22+nT84=;
        b=yD0keCOBSaxelEt24S3wqnK4cwB5l4mTR5aSKeUq0WNBeF4bTAvdweX3vWL1yn3+61
         AzlVlp7ocs1BlV4waE4yByiA2ubG+GB4S6VJx4rY8T12dvPKk74Oqi4YAaGrptjUD89I
         flFdvIE1T2HpDELGxElXZHp7eqj5asUG4N0HtSKclk7pQT6mJvFktyFMWXPIaplWOz0h
         mnfzHEaiCJfDPaopHTZVpThfAFgLN3cZnrU+uZh1QHEQonn+H2CgYkMjGpu+yLv9hdPf
         WHdAn58ZTdXpWj44nGIX8+rWN4uSWkuKfDska3KoZrNvKni1EWSViKEWPxSimLsJ7Ssk
         40Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzGPU1sXY9d5AjdXYpWxdbg97QU4WpLz1ojQFh6CVo1QmjOI5nzq0xMG68eqGYP63rdUviGK+/3chJzfS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtvZCIwtxrmxkih8XSUx6mDZ3cYWpbyMZJLEi4A5kggE09ah+4
	ydRczN6TgXM1aVaj78tn2beMVRDSn7J3J9h9PXEtu2pdkQ69gdG7oFZJ+kr1Jvv/rGNdI5fB2wF
	+TtL3NHRdXGNesix+pFcl9AmX0TwF8/xag30osf+x+xcsazZKEyrKvAngitLSDWmCrWo=
X-Gm-Gg: AYBFou3BqovYFoxeaE6U0Ri5+2wNSFitkgYkRKHmW3pngnn0xlg727ABKyZ/STAqFNU
	sHjsx5P6RAwQa+K/C2X0VQZS/KYhkrypoIUe8RjZigSQgHlMcoVBs9j3LxN0HrYHnhaWi9lIfq+
	/w7/ra9zUG1ShTCZjFBoFqfj/o441hCJIFGV/wBaz26z8Yk48zsdj7NUg59s5WS1mxLiqqoPQkM
	8PGvs0mX7hF76PDIVa6yEUtDukKO7UsHntW/rlAX8t0RT72t2DiCOPEAgt/iPxHyUIiKhQXIy3+
	cDL43vT1vjAdSyML4P03CUvnneYlfXReaOf7Lfe9Bk8L1WOlkj6AnX3ytc9YnOkcvFH3Ew9wDJY
	scaYRPWKJg+EYu7qhUotpJ0lcehWpymOfmBkqb2G8PxZKtn/bTG4eLIEzkXhcIF587iu0ZrEIfP
	jRxg12oBZFW50qlLUqrleL/ZL5UHdhcHg=
X-Received: by 2002:a05:620a:2b46:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-940ef9402b0mr1493372485a.41.1793112063295;
        Tue, 27 Oct 2026 07:41:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-940ef9402b0mr1493367785a.41.1793112062760;
        Tue, 27 Oct 2026 07:41:02 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm468527766b.56.2026.10.27.07.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:41:01 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/6] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Tue, 27 Oct 2026 15:40:38 +0100
Message-ID: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0b800 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Hdwp21HFdB9ZbaJ7OW0A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: GuvW0bxyOPSC7qNvdMWpqHJRfdC1NqNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfXxirwJPIji9zI
 LlSnS+Ko7vFyhGzwvuNUSEmRpuMAbS3x1vSPZuajsPB3r3OJn0OYMHJb/5p1qwQXgACh5QdqpdD
 YD2s0HTpi1hpo0J2jqONkSVR1ZDS44ykho97xS6zj52Udpu3pnWo/kkcl40y3JAd96iZN2RFk7W
 alGMrMK4AmqiheiEVm8yM+LyFDYD4umPnT6goS1PUMYAVBcr6eYpKzzrFEHAu0uFPYgQNh0Us+c
 p0eJUNLKbUd+iqXeCbWm5umE0QUiUOjgEqVOS3+x4fTFLyZY+vv5A5hcQ5l095d8dtpX8zIQroo
 dP/LS8UIk8M8BeO08aM7Ba7vqpHe7B21Dnx4xB1MHWl+2BRqbDxaMF2QW6wklktgrkZJUsDs+5a
 8xBW+LWakhRafSeLRMqlgC2iRMoejGj9OIEnJ90R3L3w45wxgd+e5kFI7DQzdhWFWi81MLgVMHC
 ll72yRVg3Bb6ZwcZqUg==
X-Proofpoint-GUID: GuvW0bxyOPSC7qNvdMWpqHJRfdC1NqNO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX4awc4San3P7B
 6zN/dv6jZOvXr6rdxSjOIRw2Nd9nbQyDFwF3Cq0RFNkij95yTUzKwb0vUq+noa9RIt23nJkBBJ8
 Z0DkuljmqwgHXM1mA4CHUslk3GR+Sdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270058

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware accesses the
card directly during resume from Suspend-to-DRAM, before the kernel's own
resume path runs, in order to load boot code using hard wired logic that is not
field updatable. The card needs to stay powered and responsive for that access
to succeed, and since it is never power-cycled, it also needs to be reset
before the kernel reuses it after resume.

Changes in v10:
	- To help out with the implementation I offered my help to try to move
	this forward.
	- The DT patches are good to go so I included them from the previous
	versions.
	- Patch 3 to 6 are new, but based on the work done by Kamal Dasu.
	- This is completely untested from my side, please help to test it.

Kind regards
Ulf Hansson


Kamal Dasu (2):
  dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
  dt-bindings: mmc: Add reset-card-at-resume property

Ulf Hansson (4):
  mmc: core: Add option to keep an eMMC powered on at system suspend
  mmc: core: Split sdio_set_host_pm_flags()
  mmc: core: Move reset functions for eMMC
  mmc: core: Add support for resetting an eMMC at system resume

 .../bindings/mmc/mmc-controller-common.yaml   | 10 +-
 drivers/mmc/core/core.c                       |  9 ++
 drivers/mmc/core/core.h                       |  1 +
 drivers/mmc/core/host.c                       | 10 ++
 drivers/mmc/core/mmc.c                        | 95 ++++++++++++-------
 drivers/mmc/core/sdio_io.c                    |  7 +-
 include/linux/mmc/host.h                      |  1 +
 7 files changed, 92 insertions(+), 41 deletions(-)

-- 
2.43.0

