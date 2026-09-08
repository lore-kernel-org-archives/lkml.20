Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3033A1E81
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849432; cv=none; b=m5To0rmThu7lPMomt0n7Hednm4FGd5cwDYF4i28KU1z1vJfqvzITlsk752OkKM27q8s/XlXYBmD0RRiCKN6rrNrzfljf0njC+L8Gc0/Yl1blQkWqtBgH+/Xf0tFLGUIcfTDgBqxib+1oNJseLKoZctBz5Pyb0io/NVGQllzd7Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849432; c=relaxed/simple;
	bh=lARc/goga3WxAbuvumLeJVnNOmElAcf2/GpBXHeuFKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcMWxK42LOQH81XSfZOEJ+MqP5gb5s26kcoUUjfeNSi07VZnTOTBsxJnDmB+ZzWCM4q/bVts1DHfe5SuUPjhCZNOsK+tAqU77gtC6T1w/Hx9yfLmyRAGaVOO7OCeFyPshjTP3yJ4q661kZxDn2nK1tcsIVAmU90rHEVJXIYzMNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOzjtwJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8YhKtfp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOzjtwJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8YhKtfp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LcXl3299064
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 06:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4tHatCXe2oaN/qEuufOocukAtMlM1llSw+L
	YvX7luHY=; b=kOzjtwJ/E9uBXAJ2JUa8Ri7JRb6VQZcYzviTzw+/wdZYJMWea5d
	gl0N+fRlF85LODCxrezZ7bnAPFAP364M/cj9QRM4h79wJuBqTxV5JAKAIFQMvlUn
	rFxd8wDN9i1RXqYxOVg+3wD33LSsUoytDktLHZPTjUQjprezOsEVGS/bvczZl2JG
	pD1oZpqKy9eERyEgrwSsO++WEMSFYbBI4v19nZfnjP7wAhR8rx842za2SCfQSXk2
	IoOIKNs8szq48BsV8kSOKuM8+4KwbkFcz1zcN6kJt7tBi79/3zWE48c9q2l//66o
	zQ28mNWFXogFCcNChoHp9lBFtXUTCPf8i7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8gf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:37:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso637343985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788849429; x=1789454229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tHatCXe2oaN/qEuufOocukAtMlM1llSw+LYvX7luHY=;
        b=G8YhKtfph6fyUCE0yhz2KtQKqkU5VBJqUULkQuW9gA1cUWZEB2vsutrbxO30M7oZI4
         O8di+ecq4m84apXyMOYVp4m2uWIGJl5Gb072rM500QOiojCv2a26tE2HzJqfzLGQibDv
         3vEiaSN7i58wonVuVWYGpDDL/jzakDcRbYh1wjvyXq5TquLr/Ff14ksOGQdMuSnCjyXS
         I0w0p7vd7P+9H86fBzLj7Q7/rL6krsQVF5Ql4ums/zoUhnczSyO+OIEoWqDLPSPEQF0P
         JN2+mAkFr7bIHdH2kFpWT4pqulmwaee1SouAZDNukyjtzFkUcpi9iq5vXiWQXntPLCXm
         mDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849429; x=1789454229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tHatCXe2oaN/qEuufOocukAtMlM1llSw+LYvX7luHY=;
        b=nQlrEYkv9jxOpkDH/bqKY3J3QCLKP18jzMwLwxVSmp66VcHGHyqXwwE3ByNGvA18FW
         wHkVc6Dt6kZ2a+d+i/L6eWgK3aEP3ymks7Y7TFVMi3E0NLRDY/DNmiMguETjo/J8ckQN
         h6M61+6un/FqN/l/JLKtq9YDeW5adcz2LViSbRNv7faTQfT6hgGIOzqgM+aimT5LHSMo
         +iuEFFUuwaQGtIrMNT08zNgjxFpc5DLGr54vXPzjL1WZiUIN7w8CCG8rxiYJyS+llxxc
         Kwx9NFDwQW72mRsU/AetvvSIlXaSat/4eK1/jLMhnuIsIsN5dcTU/QlPsRUp70VqTc+H
         YtUg==
X-Forwarded-Encrypted: i=1; AKwUvBzb1H0/HnvXBAU6srv0G3MoHol5JPAqk0IsdSxMwqYD4j4dF8Rz1dGGplJt5DdBO+ELCSJkDwKSx/TIeMg=@vger.kernel.org
X-Gm-Message-State: AFuF++n16rY8KivDjx8NVpwkZE5EAQWuuDUvAEI8DtXFAWI7z65Un1Bl
	SN39BjIupAsHLjdJW9RxYNUEWUwc2VGPFa1IhmQF2Cgg4aResBTVJokZ1t4LAG7noK6oF2koSqF
	jG3nysyWfHB3ussop1HKeWXWxlRBCOk+3OyZXGZqb3rICs3jVW3jTaXgCwwcO3vS3aUQ=
X-Gm-Gg: AYBFou2klChPgHYURu6aSftLo6lh8tcSrDN188QRI2gqv3mUlGKk31ehgZpFte/Mmzh
	VwMXIvLVlcTB1NsoDaJruscShl7qBt6Ln0Y2R6GahgP0Lp7TFxFmwKaIgFGOMczRcVH1REQgs1L
	2ddXJix4zB8/s50UeNtC7/kyM+g9CqktEecFwuIexhCp8zzb1LWNTKEmR9xgev0up/10Yqd+MJx
	rHOf8hTET8gSIxUp+Tztt4xa1XCnCZhaheEyAn5d+k+Fo2+k/7T3TxgQxVoV/v2mGeJs4i9N78y
	WoEWNlyXtXNzzOSBDNbNjcIIzYZz6jXNIsqMfH9dOFnm8I/FssWTcgK+Yzk+KBrEBR1uylNtRUt
	cwtjO9lEuxzLsWg==
X-Received: by 2002:a05:620a:2983:b0:939:78ab:3c5f with SMTP id af79cd13be357-9398032452dmr2502843585a.9.1788849429133;
        Mon, 07 Sep 2026 23:37:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2983:b0:939:78ab:3c5f with SMTP id af79cd13be357-9398032452dmr2502816485a.9.1788849423835;
        Mon, 07 Sep 2026 23:37:03 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm277799675e9.13.2026.09.07.23.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:37:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: SDCA: SimpleJack support and small cleanup
Date: Tue,  8 Sep 2026 07:36:42 +0100
Message-ID: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6asVTiEYjIiAaSwYZEc4ORvhh1bMIL6W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX0MbDSIXGclgW
 sBCgQK1/zr6bUZKFy6YVQvVYVsf/tP0GxdYviqhHFM2h6MYnU2ZgrpGdhkKTYTKBJUPAx3l58Q9
 w6BzP7qt73Dm3Q4cj8acOJWZItRwqeU=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fad16 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=q17wUVZQUpDMiA404scA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6asVTiEYjIiAaSwYZEc4ORvhh1bMIL6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX0qx1Skz1r3wM
 /TnnDiWq5u2cuz0NBe9l5fzGiJJfUktyYz4pgiIPg+LDtXF1dCAblBjYStZfiofMOxKkke17l/x
 K83DCd5kwx0qDiAhDg0aus4ijIP1+TJ8KwG05J+7xZTFu57XFeuw1LfPZFaRyXQrnP+ALEWzlt4
 Q4aORE01LljHuTZmLjBDX13sPq+kSpyekUxgEh5FKakFSkUO0xys9zZeD5ul1zCV3K4zbNNz5n0
 36VlF1tFU03SdfnlVExmYzvvm+AqXXu4piXAbHvqnEOAoylYTHNjER7W/sgZhVFKRElbmt2FvME
 9YyX7oJz5aLOcJEB6zMwDf98xnbaCqIvhVW9f1L8vcPmqJntWMpXrELapXrQpdbNzqWCDr7yYdI
 LLehdzYqAQ1iiWMBb3UlS1ABUe00N7RUdMmFHZ4ibpWGY+S0yK0TCOZpXME4DZPx6aEtHF/K4Uq
 +4B/CWcidVWERhVreLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080069

These two patches were originally part of

  https://lore.kernel.org/all/20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com/

As Suggested by Charles and Pierre am sending them as independent
of the rest of that series and can be picked up on their own.

Patch 1 adds SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function
driver's auxiliary id table so a SimpleJack auxdev is bound and
enumerated as an ASoC component, and wires set_jack for this
function type so the machine driver can register an ASoC jack
against it.

Patch 2 is a small cleanup: find_sdca_control_reset() only ever
returns 0, so convert it to void and drop the dead error check in
the caller. No functional change.

Both patches already carry Reviewed-by tags from Charles and
Pierre-Louis from the original posting.

Srinivas Kandagatla (2):
  ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function
    driver
  ASoC: SDCA: make find_sdca_control_reset() return void

 sound/soc/sdca/sdca_class_function.c |  5 +++++
 sound/soc/sdca/sdca_functions.c      | 12 +++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

--
2.53.0

