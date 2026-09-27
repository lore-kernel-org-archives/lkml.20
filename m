Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252CF3EFD1F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515798; cv=none; b=N5tpVht8k23TPbx65DHqJtDoLmShsgDMoGILYzBBXlVc0YWFy7MnUpacoCv/N7M5cOh4GOHS1sN+XlpfKQ+sV+3o+Vg9ct5SKDLY/OOCnNDDIFR2ogT66WdQicqGkqATJn7ShN0pbb3ypqXqHgw90oeM6SCz2OgikAwb3D1D4JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515798; c=relaxed/simple;
	bh=CSXU+uGibWfyJfAVlk6Ie8rPbDeL9xwULj92S6z2pSk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tK7tz/i2IKuKp1vT15HqZkgPXdOAzo8LRAtdY8oIWBNq8KfA60F4gpNuPKWH7uzz3xRwhb2BFVB3zLf+ZvwT2qoVRlJ0HTgClvcGrfOdxHstQvAD27yOqI/og9glR/XOLJ1l79cUB83CEU+507wUoeNjNnMWkjNRZ4heJX+wvRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XX26TeO3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHmHjSn1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XX26TeO3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHmHjSn1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QMftv71566098
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TQFlpRLe6U7SwfWR6ZtQDf
	0jbMJGb6d6UWV3uD3alro=; b=XX26TeO31zf9K27bapuA4NRLfAYK04W2O1yZjA
	4UKGUSCiigYJZI8whtADSY5W0+LnAU0wP931TOcxourtrfO3oyXUDGHNU0OYwiIY
	uwrQbGk9bMx4lF3pQZuXk4lcOaE/l2/nD7J+SgR5ZC4aaLYldjRpZOjwwurFQBkh
	vu7pexqS582JrZJ4tXJVEPyLIOTa5fYu0ZBTXSPlJLbbEVU2l8WVlXGyK/uqgLuI
	Quivklsaf5NmR6SXJqZFFzMYUYKPxg9XLfmmJ4bYPEGKK8gq+Gc7buiPvkjj6P+q
	ltJP12meqrH4GVFEoT+cGFX6F6i5FbqrTGk3uJccR0XcKINg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mwb1p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:29:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ae8e7e546so468362885a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790515794; x=1791120594; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TQFlpRLe6U7SwfWR6ZtQDf0jbMJGb6d6UWV3uD3alro=;
        b=XHmHjSn1lPihpG2oDNF0IUcFe3b1k/cQaxjmK2iWFiyNlUOC7xpQrTMHU5lfNogjqH
         mPRuC9d8l+8n58qy+Zhv3mlDO3SqQdPMNJTfZdoAFR2C0dufmyHst6cLknpOwcCVPBYq
         zUwdnA95sZiwLJtPvff1x0vZV86aP1QUR8dZrIqHpNB9d8Yw4litSnepQj8zq3K1F1E6
         URcq8hoEW8flH5/Jy7cgt9pzetLYn93xgTgjlJHq8QQPUqDJBLHnvvdklc2/0FZFEoxy
         rec1ynvk4OSS5aB3R5zWXoSE6D/Bp2vTyRfVPRDsafg6WlFu/mSjEmGXNK3/8t93bfOn
         nVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515794; x=1791120594;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQFlpRLe6U7SwfWR6ZtQDf0jbMJGb6d6UWV3uD3alro=;
        b=iK3hbVAbyhYNdWaiRaEfLyUl66XtAkheC8mjFowvh5YJm/lSckY9wpeT2SI0xBgUIo
         RVcVHh7viCptaNKPv3GWRlqKGNAN42mI6ejDdATOEhBURl89o/bYx7J+rdee15KW3Eju
         EUN+RoYz+RoiU7Dk5O9EzafYpEe0EW99q8QtZXL9MSApUzTXtpESKCY2139YWXo/Nj2y
         SNBOiQuHZu4Jo5P0jh+DS1In4MHQFYtB/XipP629rWHaYFWVFsQjfQuRBu+PpiMNOeR8
         Jcp8TGJYB1FjCBkyXF+Yi1+pFicJC4xtlRJzoC69P6Vw6NG/D1NjHk4v4yapfv4IGwP0
         YgSA==
X-Forwarded-Encrypted: i=1; AKwUvByFyQ39vJR9s6FRjVJEM++cLpBYEowjpqEsi9stpyAIbgo5csIyOPIAwIXWOxdRTaU3Vl2JlbLUFxPy5ys=@vger.kernel.org
X-Gm-Message-State: AFuF++ntIW03ZPp2ql2RAeTiSn7hJv8B9gXX8cJJiMMfoLf8NCo0KwX2
	+LCqCXI/qB3wbSZVUql4Dmr6yxLQ4XeXusQaKTd7UlIimSqRK3vS6m8mUkavk19YcKUvIAOMV3W
	0HuBdu8siLaRtmDVViVnuuje/0giHPmxznf4uM7XiVs4blqUr+d27fpkvCkT2ksDXTLY=
X-Gm-Gg: AYBFou0EAQYUDXejbCjQi73SLktv/GPA4tb3W0ZnbUqgHarbWOLTwVyIfOdPgraQSpO
	4lbHQ+q6nhpY3sqB6GAQnyFRoj5WVeiCI2ByVc0fY+DewmW0XLmZ4PjehyI/kpWn1k7n5DD1VKC
	gWTlt1RtY72atNSkVx1RYKWJ5RTKAHQRUmGUKcl+duuvINx5+4RV7AazafglFtgkzQCh5RfBtxn
	+/k7OCT/jb8We4zc/jkJJL5BjbA9U7DdV1IEY7BZuaPRqUani9YQnKt4Sigism+TirLl18YA4Rl
	cza+ZCW4Bk0P5YBBYHoJoIx2aK3IQnSc7/0VKswFc7ubbRGo7J6kXZAXQjbPG2pa378obKyiRLf
	ghB8n5pDKfGeKIQKv4nuaCIEmJL25JOMe+4q/SnyQiZp30VcvCBVw6NqCWsxZOmWVmjtUpBpKp/
	XPv4qpJfqXaggizMId6MH6Qa2K3ELEdOAfb4Ih102Tk/sM9PSeuEc=
X-Received: by 2002:a05:620a:1b81:b0:93c:65e3:dfae with SMTP id af79cd13be357-93c65e3e490mr629249485a.50.1790515794065;
        Sun, 27 Sep 2026 06:29:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:93c:65e3:dfae with SMTP id af79cd13be357-93c65e3e490mr629245885a.50.1790515793577;
        Sun, 27 Sep 2026 06:29:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00179c729sm94636745e9.15.2026.09.27.06.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:29:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 0/5] i2c: qcom-cci: Enforce the required CCI clock rate
Date: Sun, 27 Sep 2026 15:29:49 +0200
Message-Id: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4auWoC/3XPTQrCMBAF4KuUrI3k16SuvIe4iOnEBm2jjRZFe
 ndHN7ZSNwPvwXzwniRDFyGTdfEkHfQxx9Ri0IuC+Nq1B6CxwkwEEytmBKfeR+pPRxrinQbgSu+
 F88EZgh/nDrD+aNsd5jrma+oeH7zn73be6TllVIMDYw1jlbOblPPycnMnn5pmiYe8uV6MCTMlB
 BJeltoGYfdM6T+EHBPllJBIBOmN5BXX5Qr+EOpLWPYzRCEBvLI4QitgfIYYhuEFVPZV+HYBAAA
 =
X-Change-ID: 20260721-cci-clk-fix-fe145b2acfa7
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: mpnZct_AQh79kNsoszUK_mzrheyatIXu
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab91a52 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CakdkRaH-b5KpuXxX4YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mpnZct_AQh79kNsoszUK_mzrheyatIXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfX3Nbdkv4ws275
 D7DAZLtx8bpBUnvuY9Vpvvnm7CT24pmTGN5l6pIH9KWnoXtX3gdXtmv6L4pk2Ku6NsvLk1gRnrB
 ozxHL0MoC5WuYEPI31rfYKijYrl4h1RqAA6XFx3nhYl7VLuEQp6n0229auI3LsUzco5nQm2GrVH
 smHv6qaxxmabd9xy+DzTwjZXLJVzs5f/bgct0arkVGw1gAy1ccsNVqq/3S6CXsVFHLzYn5DyDfU
 HUCbxqx9wVf+nFru4Lr9mimhvwSTD+3fv+1GBmzgiNKVc/AXL081tlpIHWBsWVgGsAGdky/BMTa
 cDecohvzHrzOg8v1RKLMTUIGakk5W6Qd+VxqjDSomKiOjGcT7ylK5EOuW6ioIX6cIeZET/r0ebs
 o7pcaOEJ+ljVAL18adJUuAVZVW/xyjq2+r8jQaUju2iaQWLpob4ta+YXK/yKCYtkZVdgQ3MXEaR
 ZEIBwVhJlj8hzmH75lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfXyCbbcRr6NEeX
 2COMjtNZqlqZ4xxX5GF1zxQhGTr+UgLQdbqY7pMRwSBAhOmed7SmU7WxA3ECg3eIW0mtYhqK6KS
 2z3NAZwl9Z7OCpMLFr/STuUy2Wibl68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270053

The CCI hw_params timing values (thigh, tlow, etc.) are expressed in
clock ticks and are only valid at the specific CCI clock rate they were
calibrated for. Running at the wrong rate causes incorrect I2C timings
that may violate the I2C specification. Today the rate is left to the DT
(assigned-clock-rates) or the bootloader, which is fragile: the driver
owns the hw_params and should own the clock rate too.

- Move the msm8953 to reusing the common v2 config.
- Turn the timing table into a two-dimensional [mode][rate]
- Add the 19.2 MHz Standard/Fast timing sets for the v2 CCI
- Promote v2 to the generic common table for all revisions
- Actively enforce the required rate.

This ordering also addresses Vladimir's point that the clock rate is a
property of the mode/timing settings rather than of the CCI revision.
the per-mode [mode][rate] table lands first, and rate enforcement is
built on top of it.

Patches 2/5 and 4/5 are the result of discussions with Vladimir and
some code sharing. I would expect him to add a Co-developed-by and
corresponding Signed-off-by tag if he agrees that the submitted
implementation still matches his original intent.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v5:
- Check the rate returned by cci_get_required_rate() and pass it
  out via a pointer. Never call dev_pm_opp_set_rate(0) anymore,
  error out (-EOPNOTSUPP) when no rate fits all masters.
  (Konrad)
- Set the CCI rate once at probe, drop the set_rate from
  cci_resume_runtime() and the set_rate(0) from
  cci_suspend_runtime(). (Konrad)
- Declare the loop iterators in the for() headers. (Konrad)
- Crop the now-redundant hw_params[].thigh check in cci_get_hw_params(),
  cci_get_required_rate() already rejects rates lacking a valid timing
  set for an active master's mode. (Vladimir)
- 'v2' is an arbitrary name, not realy hw revision, mention it. (Konrad)
- Collect Reviewed-by tags on patches 1-4. (Konrad, Vladimir)
- Link to v4: https://lore.kernel.org/r/20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com

Changes in v4:
- Rebase on andy/i2c/i2-next (527dd7fb6209) (Andy)
- Add 'select PM_OPP' to i2c qcom cci Kconfig (Andy)
- Link to v3: https://lore.kernel.org/r/20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com

Changes in v3:
- Reorder the series so per-mode clock support comes before rate
  enforcement. Introduce a [rate][mode] timing table and select the row
  matching the running clock rate. (Vladimir)
- The per-mode patch only validates the running rate (error out on a
  missing entry), the following patches enforce it.
- Split the addition of the v2 19.2 MHz Standard/Fast timings into its
  own patch, keeping the [rate][mode] conversion a pure refactor.
- Drop the "Revert ... Remove unused struct member cci_clk_rate" patch:
  the per-mode [mode][rate] table replaces cci_clk_rate entirely.
- Introduce a common params table (revision agnostic) (Vladimir)
- Link to v2: https://lore.kernel.org/r/20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com

Changes in v2:
- Instead of adding a 19.2 MHz cci_clk_rate for msm8953, switch it to
  the v2 config (37.5 MHz). The msm8953 table was internally
  inconsistent (Standard/Fast for 19.2 MHz, Fast+ for 37.5 MHz), so a
  single rate could not satisfy all modes. msm8953 is the same HW
  version as msm8996/sdm630, which already use v2. (Vladimir)
- Remove the msm8953 fix tag (Vladimir)
- Apply the rate via the OPP framework instead of a bare clk_set_rate(),
  managing the vote across runtime PM. (Konrad)
- Link to v1: https://lore.kernel.org/r/20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com

---
Loic Poulain (5):
      i2c: qcom-cci: Switch msm8953 to the CCI v2 timing/rate config
      i2c: qcom-cci: Support per-mode CCI clock rates
      i2c: qcom-cci: Add 19.2 MHz timings for the v2 CCI
      i2c: qcom-cci: Share the timing table across CCI revisions
      i2c: qcom-cci: Enforce the required CCI clock rate

 drivers/i2c/busses/Kconfig        |   1 +
 drivers/i2c/busses/i2c-qcom-cci.c | 332 ++++++++++++++++++++++----------------
 2 files changed, 195 insertions(+), 138 deletions(-)
---
base-commit: 527dd7fb6209857f8ff4426055b3a418e60faa8b
change-id: 20260721-cci-clk-fix-fe145b2acfa7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

