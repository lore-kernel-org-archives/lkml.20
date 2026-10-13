Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A81A47427E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887432; cv=none; b=AWrF97sju3XDzUJxj0YSX8rJ8Qo+Oh68aJCXddv0LbQoWzZgvyHaujwAXKBAqLhDNTFl/MSYHDmiwp4Ez3BjWgTHO00ckBI4efQLHeEcAMBFQ48adrDJhQzcWGlEYp1PPu31XUyWIlitMmYln5wLaWG11ZFLeDUmoZ8sO8nKNfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887432; c=relaxed/simple;
	bh=llUSfK/j52895Up498qaYYkhoVfBtms/teGO4gw9de4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QuMMr9YKt8Bt6Kwf70RJe9m0tx677uHGsfBADrQyebGHl90666xFxF/f8YOpzNHeWG5U0IxA1WxycxjWJZr6WDSqvVc4CDs9LOlx00XcXxLUTVGP6JJ7A+c3uIM8NpwQRJCpauVTSFE40goPHZvT7DwhIq0wMJ5NBkzuNYxFCBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyBmbbDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEMfScuG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyBmbbDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fEMfScuG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Ur8k922843
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i8/Q4Tq+4DZuh8QWu6beqC
	0Jl3juQa3zTScBd6grHSw=; b=UyBmbbDZT32sylslpoJIJjCZWWne/CFTe7nuUN
	+0PkAsJIkRpr1xIuhlvUc0ekv1U2y/apFjgTmNoTRQgZyTICSZlZqysUfYC8gJqz
	YXEmg1pq3JJMOEuWAuEiqfySSZiarVcGRD6pTuym0VaGW7abJEeZvNQ/sje0BQxm
	qXm2leegsgzZLCxj58MxhjDUVHkvqVvNYJ0IJnHKO4gbVnUgNeAE4ib8R3MfhFN3
	czM+UAEqH5IKns8/25Eoi69nwxlldd/rgGzdyJOWzmtU/xT1FQIlhhmANnqvM+Uq
	2p4LUZGqijQ/pwZ8XTC57RNycTP6WACybKAAmiEK0rbv3G3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tf6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso628909185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887429; x=1792492229; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i8/Q4Tq+4DZuh8QWu6beqC0Jl3juQa3zTScBd6grHSw=;
        b=fEMfScuGkS6Au2LwbLgBu/EGRk088/exRNhNbRQxtNwFNKbOL1zS0AawCynt9fbvgU
         q046qwWG/NE7YeFhIN9gehpl6sK5+iY2511olbbCPKh3++QLUf9km12yPkYN1Em4TxiN
         uPHrD2XmZT94W23ZNgfhWlLt1C5C+L1i7Ap9KSckyLEZq02LszQQfziogRuGJtE+MoMl
         mf99o+ZHoArRIVDrxEoL7svWjNlzaZduH5OW4CCkw2sW/LN6wV7YwiX8Ak4r4rh05Twv
         ZPA3ExGJ40/SE93J8PgDieJH1saM9od5LvA+VyFq9AZuiBWOeihBlh95RSIjgK6+i4iz
         menA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887429; x=1792492229;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i8/Q4Tq+4DZuh8QWu6beqC0Jl3juQa3zTScBd6grHSw=;
        b=Vm6ZeT/pfTCHL9sPqN9sCvfjzQOuCglz7TdjpBOvPuKQXrPCWJ1zG3vm6NF8jAwXHb
         Jrw8ZaiIMlfWgopkNWmxjZBhP1F2JMq2fOGqaQ1kb5eUwkaC1vEB/o6kMZLAbq/Ckzoa
         E8U7OvdTb+6DPApfWroV2V6K4uPS50ccyj+MjADAdxfA5spA8LH6a7qUd4OqA/9TVSyB
         HhZXpLRvrhtHXo6QCvzlorNJWhBjP4J0R1COhYyfIWhTqv//tsgHLV+jedlfRSBAAatg
         7ZwwAWsFjtb8Pzqv2Pft2dP/Hovp8PZfkkx1epyumP19TaAgS1gWl3pOc14y9kRdn7Zy
         OCiA==
X-Forwarded-Encrypted: i=1; AKwUvBzgmA4t2g5aVATjuyZ8s5V4/vnyTzkdaXY9LcY+uE6l2AVDAADA50W3YXZB3n6W97rXurjjwXZXudmGocY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoV6924uNF5SQ/WDCgiCA7DOcVpBXhlGcWM/2iMa4OM5xzwXrV
	lDj9wpXawa/AWi/LL1DkTl/IxZMuYJdp8IR0NxwU+0Ep54peS6txRr2XRdbFvRza84cwSpPHzGE
	r7SUXMzH/moGj/BqFLL3L1NXWC+li5yqxlrgFmY9FcmgChZUMKHo6JoJ13MxxVJZ79/Fw3O3jHp
	Pt69Yg
X-Gm-Gg: AYBFou2jzrnE51hT99pupdwcZW6nTuiDLm73bmmGwWBoGK+uPI2zd6ENKiVbVmSvI0L
	fRZb/QEn16pFTPRGWujYqoAWO5UU5OFa+IfuIEUKeS0sAVMxTxsApDUj/GBPqZIcClDL7w6kbsn
	Kw023quE/ZDtKF479oL1eCcJSaL8xiuuglpyrXe1WAIBHRM0yWD4WVPK/dY+oor1IHqd60WC01a
	lP2KP0F11LlUxFPfduHd5GfdX6zfwycyE7JKYL5WO1uxnZCn3JzdtvarhaAXX0dMEDppslERIj0
	7HSC36660Gz3NWkR8fXQSBrzolT8SJ7dvQY6jm6IHkz90Ex8UaOUkuxWx45TvcLTgYH41cECN3W
	aotPL/ho0hmTjilFNJmBaPzuVF7yHu2BA5ZZ9saGInGeJcQHQBdjQlzuS8wQCfFSk16fUoOd7B1
	fBKTDxcm457Xfd4eLrLCaKadlKS4vXnjvJhwXvVghKzQlPwuR3g08=
X-Received: by 2002:a05:620a:29c8:b0:93c:6450:9ceb with SMTP id af79cd13be357-93ebd0c3781mr1856371685a.1.1791887428926;
        Tue, 13 Oct 2026 03:30:28 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:93c:6450:9ceb with SMTP id af79cd13be357-93ebd0c3781mr1856366785a.1.1791887428306;
        Tue, 13 Oct 2026 03:30:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/6] i2c: qcom-cci: Runtime capability detection and
 improved read/write
Date: Tue, 13 Oct 2026 12:30:24 +0200
Message-Id: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEAIzmoC/0WNQQ6CMBREr0L+2pL202jrynsYFlCq/MRSaKHRE
 O5uxUQ3k7zJ5M0K0QayEc7FCsEmiuSHDHgowPTNcLeMusyAHI9co2bGECM3MtU2lZIV11oi5PU
 Y7I2eu+lafznYacnC+V/2FGcfXvtbEp92FwvO5U+cBOMM8dQJNK1UqC8+xnJamofxzpU5oN627
 Q36A0cyugAAAA==
X-Change-ID: 20260929-cci-imp-8ba384309942
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace0846 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fqBssBKcfzBu9c0AyzoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: RtUHt6mryAD7gFMq6r_XE0XiAruYjm-V
X-Proofpoint-ORIG-GUID: RtUHt6mryAD7gFMq6r_XE0XiAruYjm-V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX9y8PNxlEGZaE
 cgnQuX/TfsDSR95qs/NU6ZizWXV5df0QQVGno3H2i5nO/H7aBrrsD1PthgfKlxMr/4zakGcXWy6
 i8dZuypnQgCBmaEPpRJK5Y8bdwe9frk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX7LqcNSWgzMPH
 yZr/PHJ9BnB1A9lfZF2T/tG8yMoNqSOz9f1qSFmLAynH+R7IxQdNzEUvLjqsuegCVT8q4J+OtRq
 V9uCZ6CDmdbM1xr+EkC1Vjz+9C7Ej5Aig7A7jIFy/2dl/Sb0PUfIh/ViqvF0bFFur/NhjRxtLGk
 1mzYQZvx32u0RSxG1TBP8cF+sV2hWICuv3QZHhO3NgxJOvaoZ5nZksCML1yIlIUIxrVis5qHmC7
 M/hVUQpkfZwd8SPv6yqK7Eo6CuxJuS7yM86BrXR/OPw79F4/sSNhhgpGwNh3bYQAI6AUSFGV9fX
 x7gwVX970xAw0W+YytfeqSAxo/p55UOe/BsGxQ98d7ByQN1Me/462zxS7z0cHxnrD0y+w7jd27+
 oOYeG3bM0APnZEW48P4yfNhsxCSDIm6j+D4VRWWripvqpVLhwFDPTSCbpcF+OFKNTfiWCKcSufr
 aMup7uUNwWrz+OjxI4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

Improves the Qualcomm CCI I2C driver read/write in different ways:

- Capabilities (queue sizes, max transfer lengths, supported I2C mode)
  are currently hardcoded per DT compatible string in a handful of
  cci_data instances. Patch 4 replaces the static per-compatible
  structs with a single version-sorted capability catalog resolved
  at runtime from CCI_HW_VERSION.

- The driver only supported single-command writes, capped at 11 bytes
  regardless of how much space the command queue actually has. Patches
  2 and 5 factor out the write-command queueing into a reusable helper
  and then add burst-write support, chunking longer writes
  across the whole queue instead of a single command's payload.

- The FIFO read path hardcoded a fixed 12-byte limit unrelated to the
  actual per-revision FIFO size, with a special-cased drain loop.
  Patch 6 simplify the FIFO read/drain-loop and derive the read-side
  limits from each revision's FIFO size

- Add burst-read support using threshold interrupts, allowing reads of
  arbitrary size by draining the FIFO incrementally during the transfer.

Also add overflow and underflow IRQ reporting, as queue/fifo limits are
now derived from the hardware capabilities and exercised more
aggressively.

Support for unbounded write transfers using the threshold IRQ
mechanism is planned as a follow-up and not part of this series.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Split the HALT_ACK reset fix out into its own patch (Andi)
- Fix a typo in the "Detect capabilities from CCI_HW_VERSION" commit
  message (Andi)
- Use GENMASK()/FIELD_GET() to decode the CCI_HW_VERSION fields (Konrad)
- Derive the number of masters from the DT i2c-bus subnodes instead of
  encoding it per compatible string (Konrad)
- Add burst read support via RD_THRESHOLD/RD_PAUSE IRQs
- Link to v1: https://lore.kernel.org/r/20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com

---
Loic Poulain (6):
      i2c: qcom-cci: Factor out write command queue programming
      i2c: qcom-cci: Handle and report queue overflow/underflow interrupts
      i2c: qcom-cci: Detect capabilities from CCI_HW_VERSION at runtime
      i2c: qcom-cci: Add burst write support
      i2c: qcom-cci: Extend i2c read limits based on CCI revision
      i2c: qcom-cci: Add burst read support

 drivers/i2c/busses/i2c-qcom-cci.c | 429 +++++++++++++++++++++++++++++---------
 1 file changed, 325 insertions(+), 104 deletions(-)
---
base-commit: d6dc536a4c8bb99dd822bc349a9e801be7ea81c9
change-id: 20260929-cci-imp-8ba384309942

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

