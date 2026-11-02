Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630821;
	b=4roRRkimZaljBzKAFVVaf9CklJYEB3zdhoNWSr3W5SkOFUjEuHP+lSNWWJJ1w4fCjkmv
	 2Dl78vjS3T0jMF02V9oP1Cq+AicrfchniPkCVLQNcD+6pvJnTuusX0Y9TbVTkEVTpHn1r
	 yHUWIHqyu7fcdQJZx2eEEZL7HfBUlplqAxM4xVlhBp6s2X46VEL0MaoF0IWKHlv2gTcNK
	 JAwN7qJElOFjDOwuqzogYzlhn7htiY5G9rVIEWsWo/KSZlNn8Z/t5Y/ZcamkQgqOlwsh9
	 bvMELGRY4l4ybA8GxoX6OdhzG1WOqiKXn6vAeRCth1NOdSk/eWmyZpmYtrZfDnt8mVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kshJ8ilku53BZA7u6QxWWNnkRsV6tkRQiXc+t6nZXtA=;
	b=c5zqCgky/0x7az0rZKnPnCVc9f7SM25gmvYSyZS0FqbNK3GnbmMMhzLpIromhgUx3Q78
	 JF1BD5PpapjfCPl/u8uvLqAHyQPyMTlCM8zYnGyoIHfrcG4aFkKkdyu6Z5ggVHVP1vIDr
	 ZD9uoodUNV5/SGtBLpK9cdHydhQohb0bNpUEYVizkJtHMZhZYcXhKmSXGqtiWHx1u6KSx
	 iI+3GiXfeNz58SB/YaMKgf4kLvdssyGyVRXS+huLJSvtVNcZ+bfwmCvbohF0aYUd6NHMy
	 ExWppDFjozZuRmXxAXMiDuGK0i449bstl+nv2EvyFVZ4E+2MfnY0trqY8giUo4487tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGY7swdt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bgTRiow1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C1960A5BD0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C1960A5BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGY7swdt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bgTRiow1
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpOWW3102701
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kshJ8ilku53BZA7u6QxWWN
	nkRsV6tkRQiXc+t6nZXtA=; b=iGY7swdtNcKNWt6Nr51LKWCaoLr7rQqSjYKbLi
	djhl4Q/lc94srtJ56alt5d0hlmRqvC4lrZVFBvUHVJzQNLu/QbpflRgWODahdLBu
	jjuA7nLYvlAFtnAsI3EI1BT04Wl6jokF8XJ96zLL+TwE6D/2igfBzGTPiENbvQRC
	T5xSRxCciXHdYefnrhy1i3yXT9iLJL++1DlQ7WguTpzJHnc0iwm0aWCv3sqRyb8L
	+fYD8KINjTdQsNci6iAuzNGtAAkvxPKIxfjpXT0nVIaYiJQOqviUsBpYXrKAosdI
	M5K2cPBEQ5x3zie+z1/VV0YYAn0FnBCv8jL5igxzwuObnNAg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjasy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:47:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d06f3784e2so760854137.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630819; x=1794235619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kshJ8ilku53BZA7u6QxWWNnkRsV6tkRQiXc+t6nZXtA=;
        b=bgTRiow1UcGLPEH/KDguYB1BmPxSR4neGrKm0Vm96kXQTWPGUrnA67NVFyfrXfKHfS
         HyEwkGI9EAlSFcn6SLMc6xwBb/Mj2lqORN4e2WqGt7KBtc9hoq6JUB+ms9EtT5WIDGmw
         B1hQ65DLwdxWp6x36++JoMqYUXNNAAj56tZOULlhIc9sNQyF4uUx6q0KXOj0RBCwNZv4
         mlQX+ODaa01W59WMKy2J92DaLmkK4TBzqTyUcfoLeYpEBNjKPXmqPgSXJ73WXTCtQz3W
         NgoLgai4+AZdQn6fbGnAgwE5UojiaW11/kasfnfX01f4UF8Cupm+WyJb7qC22LMZjNVB
         pphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630819; x=1794235619;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kshJ8ilku53BZA7u6QxWWNnkRsV6tkRQiXc+t6nZXtA=;
        b=cVvhWAzwmCM53VtGdGbQP1n5+s7BXEp02dY565sXcWT+Mr9MQFZfnCTF/i6/Hkt0Kg
         d+RE2MXo5xoPySfHvMp+AzjC51JSZBZHxq1ptMuNs4ArlMp7HmK/9DQGLnfoEJ9pDus3
         nYdOPlnNXBoEw3xAcUKThKvPIvm3kWzohZf9GsGkaj6zIoI/rWvBKhEV1ps0SV8/ngFF
         2U4W9GTcWcxJCM0+QO0SQdZ94RXzs/me1qE1gBOtFLquHCJBs6MeJzmC9bU9WNtHHGYp
         n0cD0yAGo2iWuMy5BQpFj2pdziToStB2BnMFR6Hj7txCw0h3Iw9zwSKuQxypWyGvUE8s
         YLCg==
X-Forwarded-Encrypted: i=1; AKwUvBw7MBkRbmpTAgeaSYzM/b39sitg91sqqXUWkpx12CQJvX3s7VnQjk44SgjgZdfdxwEKhvzEKDOnokEFfLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UvxLsbdfe/wIjcAxaDeAlM9qxwgwaDdR12A0B2aLi+rKDEVQ+
	vLN5JsjUGWEz0jcDn6MDTk2kgw6Qg4mpB8yi+nrj2EhnKI8S4Hq8BAUhTNRBoxr7vsRXozvC96F
	u4+fMxaYBghosxWr430/TlTNEMfn2d1rBnsRlxkmnr2yYe7QB/2b4EftXyUd8BzkCv16cOvnBD1
	QYeQ==
X-Gm-Gg: AYBFou2qO/XpbyRDx3e5W5TJnFlJNr0jlU0gkZUqw102DaJUfFgoBZEnlqr1OZI54Y5
	2MVsRzrxkTzKFPc+FJSEZIaGkxZrSSPISgj3wZEEHtG1hUULxZRV9q68p4EiCRET4P3LnYYCzLP
	d6/Y5e2EwSfnxAbZz9Nmtck12HjS212dhFzvss6pvdx3UV42hExuEBZ8StRBgRmsSpvRPwep2JA
	vb4B7vCIB2mgL87nwvRHHwgcizRRsIQjQMFAKUakxvDjzY0+5wnQvKq+22fR018rCtC05g5TkrL
	fIpRuw+wbuMG2hk6wtwau8Lxm8YfuIjHNIZnYgaksg3/PW4TcxNmNo/WOwpdjoq0Z/hy0cQcq0p
	VdU4mbTwN9HJ5vjwLsqkuDCDFGdmXC4WrB+MCfKONkVsFLzBcuTwJvJM4Yg==
X-Received: by 2002:a05:6102:3707:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7d072d11c63mr3314643137.30.1793630819166;
        Mon, 02 Nov 2026 06:46:59 -0800 (PST)
X-Received: by 2002:a05:6102:3707:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7d072d11c63mr3314617137.30.1793630818177;
        Mon, 02 Nov 2026 06:46:58 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm4004893f8f.54.2026.11.02.06.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:46:57 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] PM: sleep: Fix hibernation resume issues
Date: Mon, 02 Nov 2026 16:46:49 +0200
Message-Id: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFmi6GoC/yXMUQrCMBCE4auUfXYhTUugXkV8SOJoVzSGbBWh9
 O6u+vgzzLeSogmU9t1KDS9ReRSLftdRnmO5gOVkTd750Ds/cBq53llvQOVZElqJi334LG8o52H
 COMUYgnNkRm34DUYcjv/WZ7oiL1+Utu0D5itbCoEAAAA=
X-Change-ID: 20261023-b4-pm-sleep-hibernation-fixes-c39e49aa6600
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Ulf Hansson <ulfh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TpjDCDxjyShMTioaXJsBmpTOt9aj2od6L/uCbcKk7O4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6KJdPWGen0uj+yjZxJs22KFL+4uFJr+n3DwDQ
 6RkFmzZWwiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauiiXQAKCRAbX0TJAJUV
 VmEzD/9cS8LENi3UEa0MwSEH5UXPCIzmHZqlPVZg9sHCdolXVwSQ3Y+Z64HNEIs6nUt8JSSNE6e
 2SJCO1KwAy9lVx3JJ5VnWshO39bXf1o9gpGLYMzxZuqcadXHHhRovuLVPHuEAH+/Hzb/zR755Ui
 YxzE7k2xQcuWA9hyzhIFnHRvrm+sbuTh6/J/jYrur9gpwoy0Ls9ml1bAciTXl90hsWk3PX8ncKF
 IjTDlmwIKan3oVyj2nxzmBFO9FodSxcp1q0Gv1n74SgVDNg3i55LFdtyqIc9z0qonmmSd0aNUye
 a+MNZXRjsg94JUgIE1NVXeTfHSw7upItC4FVWyMZnE7cK47uB3Qj1lew9jei/nXijh16TzAw+uS
 ZqN9iL0BU/FpcAuoPPhPOz5miWHoV+yVlq8Rq6DW+t4tgoZgiOpEDDRgprkAsHOp9jlp2wRd6d3
 wKydanQYIx90UKDRrI3dbn6BcrtgX33yLX9ZsBG0/nm+zXS+tZ7/Sy+WsoesOjzFdH266p0BpsC
 mb3f/D39Zt4V/ME1vJ0r1QuDKg6eaSRGVEpGwcsneKMHZPWlD4Y2w4mIlW4cvkWCdGlCdzVsQt2
 eGRby5SnWkNKAZFeDmCRrXmv7dqSJ419cOfKG13La78jl374sC9ymMC9LxJoolzRwpk2FzzTyhQ
 QflY5tF6Z2SbrSA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: MOpqemSYcNxUGvaKP8OWK6juLuVExXIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfXz1wMAMGd/BuQ
 0/zvourQTZv6JnL1rmXAsgtmZGNKXkH912V//fLy2Kh2ViK6r7Azw7BfhAyDtX6GBSeWcJwB8YB
 3JJnQvOBwWiikMwkx7Eqgji9iVI/iCeGgwi4xq2cOIz1bDqaXA7g/a/s3ZHalkn0gfHz8YhF4i5
 VjG8dswyUzUaUhNeWXHCbha39MPute4QPMmODM4nHFznGDRe4BLJ4rBkcQ2QXbYEmBYiwtrztbn
 sZUPgTRUEgTSfmB1F+RPOtmOg1vwkdf2aD+CaBP3gjlDq5V7raUaEv3UuKQYvTPILeE2JcIjGI4
 3OSfJ3zuvqu4p7WUKLLAPWeOEFbz8NlJhme8B1BiXOYdMMMqEXykTAY8HpXrJnzJ4J/uFSL27QJ
 L+3ffyZGxppBR6OuYsH6TYAfNCrjCG/ZDKlkqlWQhboLkM7GkuLq8RKl1XiQ2Ts10gAMnvsDA4x
 LBUatw6kth8r24Ub7+g==
X-Proofpoint-GUID: MOpqemSYcNxUGvaKP8OWK6juLuVExXIC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfXz0NHcCd7NII3
 l4UwUbgySywpOZAs3cOmjrz+hVn7lTcnpILj5oTj1hX61uim8qC+p+3EMdH+/PC8kJYG770rLw5
 QRpJqMH5sITaX7URa+0PUyEjADxp6kQ=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8a264 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UGObRx22djLrfVSxTIgA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020058

Two things the PM core gets wrong on the hibernation paths, found while
getting the Qualcomm Glymur CRD to resume from hibernation.

The first one marks devices without PM callbacks as active when
restoring from hibernation, even though nothing resumes them, so the
next runtime suspend of such a device releases resources that are
already off. Seen with the CoreSight devices, whose AMBA bus clock gets
disabled twice.

The second one arms the wakeup interrupts for the freeze and quiesce
phases of a hibernation, which can only abort the operation, since the
system never goes to sleep there. The WWAN slot WAKE# of the Glymur CRD
fires as soon as the modem is powered down, and the hibernation never
gets to write the image.

Tested on the Qualcomm Glymur CRD, where hibernation and restore now
complete.

Prepared with help from an LLM-based assistant.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      PM: sleep: Do not mark devices without PM callbacks active on resume
      PM: sleep: Do not arm wakeup IRQs for hibernation freeze and quiesce

 drivers/base/power/main.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261023-b4-pm-sleep-hibernation-fixes-c39e49aa6600

Best regards,
--  

Abel

