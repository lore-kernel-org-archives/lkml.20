Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0252D52189B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865137; cv=none; b=TCPoxjzt6BSSYIfIi8OLJMZhCB3YsTHnL+ltqvDWkHlKg6Q+JOq8ol8bLnMMlVlby7LHgyGBtmJ/IWhJ7WJeIDwLCyPWnNsVlo4NtZnyCPCMNz9A+uy4o6FCBl39BsCg1wRuKt1zjOOsxQbRre9CAOzvqvlG6fQeBgLmdDL01OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865137; c=relaxed/simple;
	bh=kRZADiqOjZe5jz2s8az1r/M8biZ0eRMbfERIE8Zhl4g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=elGyFfHB+8yPONEYLSGzKhls7Ra8WoIMTATSOXowY6s9QWH9hB7MAr1d066mg98VwL2/QL0x+HdDMLS6NyjlKzQ4cs5E27016Mv0G5Yh9gsvxaAYF/d8dY0PGcbzfCjAoEbwv97ddzKDbhWd5Qzfj3JuhlexTsfI9GJZydXI6jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhYng8Ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4A/zP5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhYng8Ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4A/zP5q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjH072825529
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 14:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1cmaL9RGb6jD84LGYkf1L3
	vwyba0iTkgMU5Bz7Gb9/g=; b=ZhYng8Ue/hnySrrybKaRbUlVIeX/lfplDF87hn
	DLNVHFHWKWMMRFoMpBBUcYfHHHrj9sxumVbgSdMfRPZLr2Vmg6e8dA7NW4AQB0Z7
	eg4AivQR+AplCRMN3a0vyZXQy9D2unBtQD37yGwLjVSLFLlI4FaWrLNP95Fq8cdo
	SJS9FjTyzKaqjQENYFEcPJlswW9gZy0fiwyRGHb/Hl8zjcMy59kxPJcLFq3JSiNi
	HRgS+IZLwGRfwWVGkOJcfOknxGacY3piCleZd8ZFDyv+x1bpd3WM/7lnUdHbaOPK
	2khcryD7baiUS9rDXPkGKYW+dRDLxsy5EjZ5pWsPa3u0TlvA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcft0mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:32:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a8c1a5870so102923241.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790865122; x=1791469922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1cmaL9RGb6jD84LGYkf1L3vwyba0iTkgMU5Bz7Gb9/g=;
        b=b4A/zP5qD3DjikCZbmPQufRqU0HzPnO44aHeYV4eKLO7GL0PHvO5pf8WNqCAXEsJp5
         yncuOuhbYJhKEISqs6xSvnWxLiNSa82o/+uvhJbmy0vzT0ku17Om5tvIxlsXdUwF/8Sk
         qqu4YmJFEmqY2JvpzFTKIeyoI2rEBh2f3eTOJY7h5NL9JipNnVFE9Y0V+mu29bPtvv2i
         Urq7bGFzcHXZHPUVNg4M2jRPWJt9U+/l99XdKCU8vPl+vP8hb8/moSnvAcidhPoiE+11
         VTVqvZduFPxqx04Gqs2w6cKrtsEPPA/7YunBasdU9rbQiscdLZnubvXx4Wty/JAfg0XU
         BnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865122; x=1791469922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1cmaL9RGb6jD84LGYkf1L3vwyba0iTkgMU5Bz7Gb9/g=;
        b=wwd7GH7aYxV5Jp6kQZcGIywvrh16VBn00ZrRdm+L41/chX1ivOlp52R6fqdNnJiMi9
         dz0Vbl2T1k9EmL+ocgn80n9BaEvu/tSflsXnjVdsyZHg2WaZCWj70LcRa4vXJh1/q8JJ
         sKd0czVgYVsPRczaEv9JzgK+Ab6usYpfC/+l2yc72pGluUd8Fad3ub1cVAgQEY2LeVnt
         UUEjgRxPeLbVLcujis3z/y5UHrDpz3JLRcB2DzuXvEnZCjY2Q+AW+2CfTBr574N0ToyS
         VIyGtCiP+nSBsfW9vZyGgsX12cIHy0YM9ddtjhDanUCwYCCrAyKA22AvjPtgAfoDbKlV
         pK1A==
X-Forwarded-Encrypted: i=1; AKwUvBz11gZG01R5DfMuPTBrran1KwAu+HD90ZyHw6BwCYPanWDgL48gBGf/SxlrPzAok7wzhoCsgntI+FplLMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPVz3gKxmL3LmC9l1GKUyx6swCaim5eFwD0dTTEas4+D9Wt+37
	gC5gouWmd4gHF5XOQWJWCJJdrJfqG3PM8KhCpRzCyZN8DgzIBCwtPoVzNoZc/U0y0R4Qx0rd+Tf
	gb/ojSIrEnokC6sLPkBbYyD33TJGxBKmLrxqF2ooD0AuFgr+UO7hvPmzMyumoTAKc24A=
X-Gm-Gg: AYBFou0O5BoDppVf0UYdrEtP2cZFxyVuhhSYz0O5VDFBACMFNAn2zqRgnLNsOq8osM9
	DDjVw1fCExJb9US4YrFcbpVb7ZjAr9Urit/UdOdPkv/B8+cvyQ6IlUKGHDZOv7pJAmPJoRrM9ut
	F4exWb6ymKGdjnrH3Z5rG1zJb9UZOlT4y2SsZLJSpwPeTD7846rjYOhhBeNY0eo79YELkYQxDAw
	oX+tugRJ/az4qnk1esZugIBbq+prNxHjGIxYr6vp/41HqZIHUjaxtGxcjQQCm5rZtCm/oqq1Ux9
	qRKL1tq5cz5c92AkdLIagtjB8HeMDFDRPN8ARFjcBu41+r8pKzxblKH5+qQdhNlhdqW3NLMm/3Z
	9ZUUyRC0RLOlbCQ==
X-Received: by 2002:a05:6102:390d:b0:7a1:f7d2:e839 with SMTP id ada2fe7eead31-7be7359f0e7mr1235417137.25.1790865121739;
        Thu, 01 Oct 2026 07:32:01 -0700 (PDT)
X-Received: by 2002:a05:6102:390d:b0:7a1:f7d2:e839 with SMTP id ada2fe7eead31-7be7359f0e7mr1235404137.25.1790865121042;
        Thu, 01 Oct 2026 07:32:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027276b6fsm321855e9.6.2026.10.01.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Thu, 01 Oct 2026 16:31:46 +0200
Message-Id: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANNuvmoC/42NQQ6CMBBFr0Jm7RDaCIIr7mFYFDrARGCwFdQQ7
 m7lBG5+8n7y39/Ak2PycI02cLSyZ5kC6FMETW+mjpBtYNCJzpJCF9jNLOh748hi+5rEEg4i92V
 GyrOsNVSntSUI+9lRy+/DfasC9+yf4j7H1ap+7T/WVWGC6cWm51wpS8qU4n38WMzQyDjGIaDa9
 /0LPU3kockAAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kRZADiqOjZe5jz2s8az1r/M8biZ0eRMbfERIE8Zhl4g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvm7WzR8TNdsz4/x5bTcxAnGjJeX8r2EJb1C37
 moJ4UZ6e0OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5u1gAKCRAFnS7L/zaE
 w+gxEACWWij3wubrPtuVmGsXj2MrHEEEu3STfU3drE7ktHuAxqWU8bA6qMm4mNwT5d1mW+OYEej
 /vUxZwQ9GG+y9EEhQqX+Voxiur9klj9QC6cjcQN/lUHyCNzSOP4Y8QBy3O97CAKef0d1GGb0qbM
 Nif9GAkffxgouQWZkcYOY4gMO5cE541I34UMGrmZ+Nrk7xC5ycYlu3z9qAY9YIqoq1bz0fB1UEq
 V9DBZn50CCcCGkqxw4Xnk0vdCFRFjaTWzLSOxfaMnpqhR5b7PQHMRlP15Bo9sGAbVccspr2IDOd
 2Efl8lwAgjj0pF55ZIAPjgyx0yzxgNLvj18BXDD63Y6dT3zOx+y6uyJdRhV1k3uXZpb0BiLuN73
 dbXu7WyCBpqDbp3oCiLl2N2naJcbIlYHHNDvQg4dp8D2D1XdPMDPHccWjay36IRBN16x15PPOqt
 2A70qI9HQ2r3q+QAxZGcjm31HytGlKsardwYzyvl53eRjBYhbHEsUrzgRJkeEDxxm2HScfFHvCt
 p5nV80s5Ve/sZpbGAsp9XhLM+c2tO2Qn3nZM4zHKHy6bLPGDnkvnPDUsQgdwHGUu3glajHVsUWs
 FL3sIW3H1tC1dOPwrQGeHtCNwkZNAdRusWYYnZPHVx1QrjzNJtMnEdflCtxf/o7HpjJsOhxDODV
 qNb2wLRFRTaH82w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfXwpuVZvEaVZY3
 MkdabTHp0dSHor92eVKyayL8tTfiFR+I8Oxyu47qNnwmZKYP7xcBU5CPFdBWXHcXyYfi+jLI5Yy
 N3lvkxhqLinHG7LLKuCmT6hQ3i8fRdM=
X-Proofpoint-GUID: Dz3rvHrnC0CIFZWU1rVmzhBczQCKakVr
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe6ee7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=0KPjAr2lXiOpQlSx2uQA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Dz3rvHrnC0CIFZWU1rVmzhBczQCKakVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfXyqHiFAeIkiWM
 +yzu7RMwqOwxT2WF7hGGAaGq+vR0CZJkt2cKgtKCkF4ViFmqP+sMmdGrqahVbq6qiSI40oGv8c3
 amybgF7JEr9BAyYhfnr2zxhpYtB549GfJG1PUb+wqyMbO93vKmoaGTQAKkPuAVBkOB83zf6DBFj
 6sZ0oGg7fkHlb0va/OG/1AxP/vEcOF65zMBXVd/Tqq4WnVnv6OS3Z4R/LYtsWRQK6t3shaAxL78
 lZNilGZJ2eJtLhGpMo7mrCMh5qS6lomvHRdLdWngtXPDij8fZwa1KmE4q4FuwjwIWSAM/T9QECj
 iqwhds2/C8CEjW694H1fPqj8F81udh6SredYPAGVZ75JN0vEboDbBVpZAVsKiugqLSqI4ATlsJk
 Ba+mnhSKoR27mUulAgPzs/XENndDa+/1ihLYvmdm1BzhoueYvDOj5n2WIA0kRDezYZNKoLAYByR
 E/KktBChBLSgKgKrFcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010057

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. In fact: we trigger a NULL-pointer deference.

Making it work requires a more serious rework. This is what patch 4/4
does with 3/4 doing a non-functional renaming for clarity.

The second patch fixes the NULL-pointer dereference in favor of
gracefully returning an error. The first patch fixes another problem the
clanker found during review.

Tested that the issue no longer happens and that fwnode-based sharing of
GPIOs  works on Qualcomm Eliza.

Patches 1-2 should go into v7.3 and stable. Patches 3-4 are v7.4
material.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      gpio: shared: fix use-after-free bug when adding shared proxies
      gpio: shared: gracefully handle no-device lookup of shared GPIOs
      gpio: shared: rename the aux device field in struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 118 ++++++++++++++++++++----------------------
 drivers/gpio/gpiolib-shared.h |  15 +++---
 drivers/gpio/gpiolib.c        |  20 +------
 3 files changed, 64 insertions(+), 89 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

