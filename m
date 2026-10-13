Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C4501F37
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896600; cv=none; b=mO6us5wFHfs46xKD0Mc/vsCg/xC/sxn13MKbsIQl8g2GRWyk8q30V1bwX18LiNIxM5mkZmBY668Uv06UwnAUmL1oT3EnB4U28GKuszuAdh53i5OjUHheW9+dTYhgTEfTQsap61xTb+1RETHgmrGO6wfCoZbMKgIJ5cLNpdW09RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896600; c=relaxed/simple;
	bh=xdaguOLdGcP82nbrEvbocKZ5hikmJBkmPYWY95xsSr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sIINSII0EktejLpaMtdY3u+WcbKGKV7mRFG9m/7zrI4KVVtkUU8p6MsttsYZqtlOQkwMFadEuqQ7w1AKHRK6ZWDcY9HV9e6kim68nqiwNLUTqlzWfs7zVGUTjtHcKQXK5SOeYXtgQN+ojE7aV8YIcgUJLRUMvCRVtcPACq0sVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWLRXztv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mx5PJLXe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWLRXztv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mx5PJLXe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8MFIx924262
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2DTvAWw8WDAU6M+LoNCax0
	5+1Ze0jdZwXofubnzIlBo=; b=fWLRXztv3n3OFnTT9S9o9D5AmdAcKWN55yYsiy
	7AJtxns1/0u9FTMdJLar1EsinZt4JC81isa+TYHVVzapOo9m9iMxP369mt66uwp2
	rCldItS8UfZPGfgX7b+A4cNyB7E4u43A8cFYI5NZgiYlKrVls7eZuv9oirQAbPfj
	zFvnRejEJQz5oGynLmRK9TSCQSYdWQNgBZnY9EsdTOIG3jdtk1LXCfq/jTlWNTL0
	5W8DvPneIjBn0kIQs/AkbToOuB4OETmq20u0xB81oxb1trVhdfxkEnhk0b13QECC
	aLnwocXj/Us4jM3FLyZnXPGFlOrmODCMPvU6SDZkP4ZA9UJA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1u1vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98909a978b9so158678241.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896596; x=1792501396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2DTvAWw8WDAU6M+LoNCax05+1Ze0jdZwXofubnzIlBo=;
        b=Mx5PJLXemPejV4hmSYH+Bu67vTFDMB+DWz5Fl6bTkGiKxCqt0jme1zI1hox7Ftaqh9
         koJAyteirlTLQIfIHqMZAsM65mWj8ARsmEGgmJoqbXPQx3qQNoWG/hMbNRjsjbiyQ/bt
         q+P+nG7J6LWiHZtvECd5Vh11hmXxhyMohLYx02XwvSpA7p4EjiOCZkoiQLx7Nb7qx5Ar
         59Jqt4eFJTf6tAOJO/ArV4dNdxzkMHzx6K35YMU/Ygqo3BSBkEjOjTdfjcntdSbWsCn7
         9dZZ6hD3wiAo+Hs2VezCyFOv1EHnh1/lu+1QsNgPR6go5rqNmtzlDFWmM6Ee0CNr6HIz
         qntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896596; x=1792501396;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2DTvAWw8WDAU6M+LoNCax05+1Ze0jdZwXofubnzIlBo=;
        b=vPpAMkjDIoGW/vb18FNWjE0P+IWTd00tofbBtA4YQz3C+VmHeMXBOmwPbW8vw/w8+G
         6YZjm5l/mGWXxCnBrrtfA5EAZzy1//QECqysaVVkI0UuYOZKj3HNn2JIhZZ7qS+HJXTa
         q6s3s7Ji2tSrGnkTPSqsLMAFtiNqQ8StnW1amrczni6vjz1+DPHsPJN8xAMMe+wO2dvS
         Nnsc06s5oUIyv8NoTFb4m5ZF2tsJWgVsU0lQhbPmPchd9O19befX6+pKS0hVqZJAvnRS
         3GAgIaqZVB3e1lXMc8br23cDzfxfnXxXr4uJhOOL53Nr3SF0qb1Sj5CuW97dMnaUG6Mi
         6ovA==
X-Forwarded-Encrypted: i=1; AKwUvBwxzLbfJSooiQHDS75/K80sDnXSYjYzd00j9dgREG4rt6Rj7LEj7FYH6SsHKPU7k4NAGw2XXyTCDVvUZg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMK16oZDf6MyI/5dfniLwbRPd8eyb7+wfu6Yn5YLzyZgflWkjb
	tIBVH0GdvLkYU3aSIRJgoLxnGEoyYKPYNJ2lbYS2iKFH2c47LdKrW9ByoY1JwFDM8YgwSkcr/q6
	Gq6fGYz7xPK1Ap3RwCUcl1islIqvJawOl+32qvZiCu+ci4hIJEheFTr+UOXtNMUYnWso0H8H+IK
	Q=
X-Gm-Gg: AYBFou23fx62r3AId2ujugYJdqb7zf8BvOaLky75jEOTQmclFPvvdRtJJcv3nSGqocY
	vK6PkFo17HAc6+jdFbmrnVEYxmAQF9dTNPE/xAIeRV71AAFPOQeHpuMeVSA+kLprwtpdRWC4lIK
	8m3FaPZzQjDxfKthsDl0OBccgInzLVXnFcg9ozMRAl7RHcQsyii+vzbjkdL4F4l1UmWrg7uKNkD
	lMYDLPHBLs8eAc42J6526AIfJKI3hPXGqAyB96zhOnGPQ3CHiN8rFjluM8o9vis8Cyioc0b46gn
	jajtQlHd63mF4MIYAJgplLCn+TneQ+tpZj6TFzjXv08xigrUprfNvIAEeVCx8mvs+JmRcEhHDAn
	upw9jfI9Oc0erooK8M5KjxdBv2PKk
X-Received: by 2002:a05:6122:d1c:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5e91f43e0f0mr4115183e0c.8.1791896594970;
        Tue, 13 Oct 2026 06:03:14 -0700 (PDT)
X-Received: by 2002:a05:6122:d1c:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5e91f43e0f0mr4115096e0c.8.1791896593004;
        Tue, 13 Oct 2026 06:03:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm401795085e9.0.2026.10.13.06.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:03:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] gpio: kunit: add test cases for platform lookup
 tables
Date: Tue, 13 Oct 2026 15:02:59 +0200
Message-Id: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMszmoC/4XNSw6CMBCA4auQri3pW3DlPYyLQgs0PFpbaDSEu
 1tYudC4meSfZL5ZQdDe6AAu2Qq8jiYYO6WgpwzUnZxaDY1KDQgiAiOEYeuMhf0ymRm6Qc5wsLZ
 fHBSMMl6etRBNAdKx87oxzwO+3VN3JszWv44/Ee/bv2TEEEFEq0YWrOZK4asNIX8scqjtOOZpg
 F2O5EPD5KdGksY5rZASjImq/KJt2/YG0XY+sREBAAA=
X-Change-ID: 20261001-gpio-kunit-plat-lookup-6434597e66f8
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xdaguOLdGcP82nbrEvbocKZ5hikmJBkmPYWY95xsSr0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqziwGi7N+UFDKFYZI4SQoCwIwwK/57jgkA5b0M
 UsI+TvE4pqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4sBgAKCRAFnS7L/zaE
 w3nSD/9LQlJ7mryqkjufKgCQEgOzMu0fpN0+goP3WWNLwCshdzeaqvYIi4CU/pkDGsj8E+/XYfA
 Grt+LOIm0jbPP14Zm5Ju9Az5B8h3PGfVs5VfF8R1f57qzd19hdHbKJKQ0aB/ohyg+VJ2XYFmeiI
 RLiqy4UQCcG15ZTUbS4FwiPZUctCAJgrghKSJvvN8eyY3CpK9ZEIj3BG3jPp9dsRQV2NCwDRZmi
 7f8huvm3q76OFHNndZeJklF4dq7EyPXqB3GbVozUS63serQDMnOgU/78bj6gSXWDEy1/9gtVVP7
 2TBbcXBcJNun6Dn0busohCi2VixpaQ2tumCB//HzkQNwhtwrsedzxR3N7+e/WUIKxEtH93+dsXP
 NW9Wluf+8UiKAnbv0E3hA4sNTSc7umBEiFNn3qE7Dcj+b6Z16xr57H6FVvEq6wxe8AgBuGtGdg5
 3w9jDH+sYf1mqFxA54mY5nvh/IrG1MV9TnW1lTCsKQK/W+wr33RWuTbYYsdf5BknvpPHYQcqG/N
 OVAOArs8gV7SSRajoxMCfrJSzZauF3h0DXlvkiD5q8E7VYE7Wi74jAgVtP9Tb5Wp/1CoaTpECeh
 J5htkdhZ8LaaMGAnGm4CjY200NQaojMU9imZxhXvemHMLvQp24P+BtO4vXo+KhdyLwOK/6AwlgA
 ErVUAT3HVyr6jlQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace2c15 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=q56TT9YAK2MK9SgkvIAA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: strFeKoW0-9gELyO3P1qU91hLAam8gI2
X-Proofpoint-ORIG-GUID: strFeKoW0-9gELyO3P1qU91hLAam8gI2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX2tKUEi1h8LCx
 hHXdiAm5ba7aGitdMk/aK5Ov4J2f7bMwaS2oo9MgnC2V2YZeQpBnEUjZFhYLVO/U0v9ehfKSbE3
 J2wRLaN9xwN/KcGjEBx1Qy2OOKSZnP0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX2eJKWTHvn2VK
 +bRC5Y4Az/E8eSWlNglo4jk0vgUGFMWG9r5g0r1PZeakNBwatxfEWWbzoTKXEBCRVoeFUg65vHs
 wh2n/cSlTjMSzSAzrCVtSYmqMAiFPoZ+UwipLxhdYmgE7j9Haaw5JD3Xga70FngbsCA2V/n7UDy
 MDxdQALFOC+jVWs3pf4P1fNq3+eLqeWdpg8GywxqAYkH3JuefnbuFDhVwii9XwkTIs4EK3WU0Jv
 +2kwmU+bFE/0WWzkhTWhI5FWjPUBjrVjsKDZRtYGJANNaRoQg8XZ3CAVGyCHpDs8ImtG5BevYd6
 q1PZQfHAc8EgBHq02aGqJjIikY4JYY1AIf9n6W2a0aOFmpNugboxr/r1EOIaoYPdjLaiscKfMiS
 PLhLzYwIegJlZj0WAXQh9oyMxQuTOJT8IpWZZUx9ZIi/2oBBDEMrNMwgDlPTONnq2IUvxPjRRQD
 byuYO2fDEpiiWawxBLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130051

Add test cases for platform machine lookup for GPIOs along with some
minor refactoring.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Add missing call to gpio_test_device_check_bound() to
  gpio_lookup_table_global()
- Link to v2: https://patch.msgid.link/20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com

Changes in v2:
- Drop unused variable from new test case
- Drop no longer unused define
- Fix one leftover variable renaming
- Pass correct flag to gpiod_get_index()
- Link to v1: https://patch.msgid.link/20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      gpio: kunit: fix the label of the dummy GPIO chip
      gpio: kunit: factor out common code for waiting for device probe
      gpio: kunit: rename the swnode consumer to a more generic test consumer
      gpio: kunit: add a test case for platform lookup tables

 drivers/gpio/gpiolib-kunit.c | 235 ++++++++++++++++++++++++++++---------------
 1 file changed, 154 insertions(+), 81 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261001-gpio-kunit-plat-lookup-6434597e66f8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

