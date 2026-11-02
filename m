Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614976;
	b=vwZ9VaEQerjtQqxZfVF1GC1hSrih5G8X8ygRMeqeBast0eHegUpfKDJQ4xdfY6mDbgPN
	 i1Ug39K15utMUiCR9kh0cr1Yea4uReiLNBb3GkduOI6+5onOPncp8uT+oDBR+AaNw7INS
	 TOg0EFMHGOn6iK68+DBteaa66nPIUJZdJKiR3gIazPLNvOh3qW/FMcML15MPdLahuxtWj
	 xhvsmY6e4jQz+MKrtywpsHms0fEk24eAii9TiJ/aeiNYGIiIHZf3DC8jDish+e6dEUxV0
	 JwDeQpv2ScQRLbDyQYVlUEkXbkvizjWmIUn+LGyekqbIB6iz1hYtfyhMSmBySpAgbsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=txDbIO54teYjP545chfzMHa6XzfSozkBD5T780zcYFc=;
	b=ay0u7z6WYiZ+JdurZKzdNyczL/0jHEFmZrmg3Ir0HZWKZJfMmKJQVbSg18x4hddIwURz
	 U4WBb8uEBKWDhQx5qQiqsi216OMFrp3gwrdPLiO7kYtcmp0Xdho9UI4m9vHrBAwgJgemR
	 7ItcthlDhaD1S0uSMhWgqKO68YULo2W87pTPHqB0Z1LKyMuvxlJlTt14UFm895vqtd1i7
	 nXmG6DPqzLGahFR1+3qkKx+rXU6q21ezBa6+on1oGBbyTToGXEJznY3CB5g/2TKt3dJHq
	 FP8dNvcb+sNfRo4s9mzOFAbiE3T4nVQT6sMcBEkWVM88F1cbsSEW4yYH42lVwlkvsIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rh5UgEZM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RhhvsvxZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878B606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4878B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rh5UgEZM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RhhvsvxZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ASNZ3440486
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=txDbIO54teYjP545chfzMH
	a6XzfSozkBD5T780zcYFc=; b=Rh5UgEZMSgEk4sQjOAyY5jW2wQLhpfttW7zir/
	TKyfSxvjo1qLVDFNDjKnPXk7E7cRFpnoZOjNzhdRQLgtwTXEGVulBjDMRw1a7Ydx
	8JHyYi5CtPSCk+P5uKce6xJdjMnRhxsg0rK1+CKNLi0BWNvtNEjkAp6i7d5Cwfix
	o++e5cNlGdncbfsc74z7sGnQknjOIYLT8XAUcUPm7tHaBziq5r/rc1DT22Nd4cbl
	rDoAEdYdjsQq4+ZBYu0OsztO89/h4eQF6zhGZ8L0Nhv/sVWKrl39AZK1ICZS6Xts
	2q2qvK8RrFBNJITqaScMmC/TUb0YTJQZHfnqI5dWeCFVnWrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201vbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:22:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-945b0154705so187337385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614974; x=1794219774; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=txDbIO54teYjP545chfzMHa6XzfSozkBD5T780zcYFc=;
        b=RhhvsvxZmEf4oqDRPUwh0XXs2jA2YC83cRHJp48tCHO1ASD8EIuGy/Z1eemcSwU12E
         Z0zNdGJ1v4uuluNqHdaNBT+xXWNyspuFm4vZDgEC9eBdFW8XLLEq0ZYJErsO8dxrlFrY
         Q8ChWn2DnhpnSOnGX6jk+PbLqhVBtdh5DkXDBAVEd91B6MPUv1iyppaxs++KPsr+kF/s
         7qJOoNTeQI6pbBVxrMpHDmCs/n3UUA8dVyO1hQOzXGp//UWUFDVdTPGh9QPwQNjUfX/g
         /mvfH/mdbSZSYF+E2N7CuCeV0nvNafts8n8X0uiEi1GgyoM7mIHjFjGRka0OkVLQRiK5
         3+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614974; x=1794219774;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=txDbIO54teYjP545chfzMHa6XzfSozkBD5T780zcYFc=;
        b=K2fEJO1AtZkYB85Qi25i/9+XmWwg9SMaSLLkS4ItocNLYyRPhqWitmewAA/aV6bxuu
         US+yH/ZIi1gQYMwK+yEV9cRPgz7342Ubmw8XKf9v6AcevWVq9S9KsxLH+DZy2z3F488W
         RzksQF+gdGchOfDmb/ysdgOJijhvkO/0isr0x4OBivX2FCzfrIujPzSL6DTvA0Gn74Ds
         Mj2Ty77XmfmH6UY7Fgxq3upYjT8xsdWmcCvr8zBhXsCa7f7dTQTsiidWux9fZTX8ick9
         A+JA+eYqVuIUlXo8FbhTcay/z96kJ/eGk7m2ShZE/UXpioVxEey5Hqc22DkH9rjk2ynD
         UMqg==
X-Forwarded-Encrypted: i=1; AKwUvBy5NzSrI6erLbh1jXcEFbRCoVTrgyhjxTBtH8CVP125gFaGiLWgb15+9aMEkCgizmrujLiLZiBRUfjzFzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv/yHE9tlg2epfxv867WWhX/tO7IVnmO/ssdmBSftI/ixNSp1G
	Jnw8wXrPHm0iolK9DVBepqDUV23QyAtXTu6R6j/1hyjkIC6kmxiVDf1wkp5k/fjDzxqBOhJjfID
	M9GOnbCmMrtKuwSQB+cIU9v2uvtrFs2tLoYYmE9TRSRlxAB6hlZESzAN31xIgmgsk+4Y=
X-Gm-Gg: AYBFou3MUr4iSLWUgXvTTbXAo9OMBuaIIYCC+dTIyhuVRdvjxH3EO+4s57nY8qp228O
	iH98E+vby+SuUIbcTeeVKVdJUcGYucNDgZ1d1mQXk5eSsnmaXJZomAASKWx+mLUhBZLtji0qmRs
	eIsRZ9+uCEokXdj8w/HTW8MrJvzruiHOnyVAIyuXGL8T8AqUnLRackEUYfEnUX4irP4QY9Iyx1x
	D6pgWjMpKzUh6O0M7ZGBedEl2i4x4YiSGZOOSOk/m+57CPdLQVO5MFJ5WsNjuTSZBmcgHDMwVfw
	ajjI6QfZE+Onlnedrx2UCaw3VnT3/OdKvWvI0bX2QZ2Ddx/6BAV+A9ZJytd0YCt3KpMG1OQ6twf
	twzxNbwBgPuV8tAhyHT5BOkFngtae4qA7WJR2lTxXv/8v6sdTaLNcsQ4Flw==
X-Received: by 2002:a05:620a:618b:b0:940:f224:5a6f with SMTP id af79cd13be357-944217f708dmr1465447485a.71.1793614974200;
        Mon, 02 Nov 2026 02:22:54 -0800 (PST)
X-Received: by 2002:a05:620a:618b:b0:940:f224:5a6f with SMTP id af79cd13be357-944217f708dmr1465442985a.71.1793614973456;
        Mon, 02 Nov 2026 02:22:53 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09fadb75sm173842435e9.3.2026.11.02.02.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:22:52 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 12:22:46 +0200
Subject: [PATCH] PM: clk: Report clock enable failures from pm_clk_resume()
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
Message-Id: <20261102-pm-clk-resume-report-errors-v1-1-ba6e1dddd522@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHVk6GoC/yXMyw6CMBBG4Vchs3YSqMHbqxgXtv3VUaHNDBgSw
 rtTdXXybc5MBhUYnaqZFB8xSX1Bs6koPK79HSyxmFztdk3tjpw7Du8XK2zsUJKTDgzVpMa+je3
 2AO/2EVQOWXGT6Xc/X/620T8Rhu+SlmUFIC3Fy38AAAA=
X-Change-ID: 20261029-pm-clk-resume-report-errors-b5d538eb27de
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5326;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O6jdgaz4i2fF6JPagpblmH1Np8pousIfoqISKdES3ig=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6GR3vaYybZlkrv8eUtlbCmriJPb95Yo9hb8bi
 PkHhpNjOEeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauhkdwAKCRAbX0TJAJUV
 VvOuD/4/jla2bm6PSOFoZFTRMTPZKjZ6f3aB4beD7rUY0bnNTG37utoeuEGrHB/Ot7cAbFthPMo
 oxUElf7OrbkLo5v6gFJJJIv3OeiK2fPlAswO2gISVk5DkB9nbB2Shs9/4cLTGXO1dpATp5wm8Sv
 sw65ciO78L8IacsyDCfs6ame/ZvarKsgSoXt+WJI45IodzJXB1aPT5JwAb0OUjdV9Ijjl1yts2W
 nY63YIorEOJogradD2orGgxWc/UmMynrNFXmQGYDlpCPBK9R9SJtElHURMlvpBZTbftJDz9eMEK
 kioMMNqC+n98zmhiTk157yQP078xuIq54lbXB3x5uOGIBGcfoJiNLfZ+/ipWn8gWzNblgaf0XL9
 PWw4pZoUDUg32cs4Oq0GXhX4+CyPERwDy6a1VL8eRA1XcgyKFV5FTgFeTjS5xqOWGxR6mBYjkbT
 /h9H9zVe0ni8vurEi4BQnmezFs64SgK5Ayq0DpH3YRaBvZLDg91CO3IVvXw0Ae2Y3pIOvQ1AI1p
 WhyVVOi/gdtiF4fR/gBJn0S0gAcq99K5jIRUTVazc8eCQB0Zr6dUZPCWqt0kDuUr5wOPFO8/Pq3
 UYraE2/dhly98+w2+LAjSZa3S918Eo2wbqcupqxn5KOH3yeXtW/H23z4IX5oHyrGLJRjZfAQqmO
 l+CNG+LDzz8+JXw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: A5nvE_tDMz0dYPG5BuO42Yzqwzrq_I4u
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae8647f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_2T3vPzLGwBzaavU8JcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: A5nvE_tDMz0dYPG5BuO42Yzqwzrq_I4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX7p1v5CJ62afo
 orYUnG4a5GoqwTCSt6Dqm2eY2PUq1Qhc/nBQtvyq09Dfb31OshzOw+80uW32+33F4jnTcBOXT3/
 ErP8b/fhOLQrDm1bBeJdBVjc7fsacuKNip1Rr0cM5B37wcpXfghUqxGVngi82gNlrTbyiPgI+95
 8VIwsckfLmRmk5G7qwuirs05otfGoKTSHTzfdtlaR/gV2iAm9NZMCPZCn/eiEpYxLYbCnbi0am2
 X6BwLQjUG6xhzFI5Y8WDHT31zkBomARj+G3ktZGlVARtzG+mbKX+TUiIjyq0kbjjO4rVBkKFUFX
 qR3zZhjq09luz6CZfs7uoPXpODmu+Od4s2xZ6F0uP2x1UoN6V5gIKF1BVFgoIqZhJCPdGrR8jOf
 PA6tHxUtyyJx6SaEvxSGGfSG7yuxuHNtNsri7VIMDHqJAXbwaEE2CIsNOulkFpUUCKTDy+d9b42
 ybnx9kccyjzOswZ2rMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX4rUQRlHD78SF
 3rlrLOdS3UtqKHkQPhw2AxUqZhf7B1e9Nyh0buq+ffErxqUH1ZsTfr8XJFHinkeddd5++pYPxvw
 c1d5LQmSfhIGhO0cBDXvEXtAHEIMQGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

pm_clk_resume() logs a clock that fails to start but always returns
success, so the runtime resume of a device using the PM clock helpers
succeeds without its clocks, and its driver goes on and accesses the
hardware.

This happens to the devices in the Qualcomm LPASS, whose clocks are
provided by the ADSP: after the ADSP is gone, like right after a
hibernation image is restored, a sound card opened by user space
resumes the LPASS LPI pin controller without clocks, and the access to
its registers then brings the whole machine down:

  qcom-prm gprsvc:service:2:2: CMD timeout for [100100f] opcode
  qcom-sm8550-lpass-lpi-pinctrl 6e80000.pinctrl: __pm_clk_enable: failed to enable clk 00000000b90a5151, error -110

Stop at the first clock that fails to start, stop the ones started
before it, and return the error, so that the resume fails and the
device stays suspended with its clocks off.

The callers of pm_clk_resume() check what it returns, including genpd
and pm_clk_runtime_resume(), except the MMP2 audio clock controller,
which keeps ignoring it. A device with a clock that fails to start no
longer resumes though, even if it used to work without that clock.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
pm_clk_resume() always returns success, even when a clock fails to
start, so a device using the PM clock helpers resumes without its clocks
and its driver goes on accessing the hardware.

I hit this on the Qualcomm Hamoa CRD while working on hibernation: the LPASS
devices get their clocks from the ADSP, and when the ADSP is gone, like
right after a hibernation image is restored, a sound card opened by user
space resumes the LPASS LPI pin controller without clocks and the whole
machine resets on the first register access. With this patch, the
resume fails, the open fails, and the machine stays up until the ADSP is
restarted.

The LPASS macro drivers already check what pm_clk_resume() returns, but
never saw an error so far.

Prepared with help from an LLM-based assistant.
---
 drivers/base/power/clock_ops.c | 56 ++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 3b8ba27802a8..a978eb3d5479 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -143,8 +143,10 @@ static void pm_clk_op_unlock(struct pm_subsys_data *psd, unsigned long *flags)
  * __pm_clk_enable - Enable a clock, reporting any errors
  * @dev: The device for the given clock
  * @ce: PM clock entry corresponding to the clock.
+ *
+ * Return: 0 on success or the error from enabling the clock.
  */
-static inline void __pm_clk_enable(struct device *dev, struct pm_clock_entry *ce)
+static inline int __pm_clk_enable(struct device *dev, struct pm_clock_entry *ce)
 {
 	int ret;
 
@@ -156,13 +158,29 @@ static inline void __pm_clk_enable(struct device *dev, struct pm_clock_entry *ce
 		ret = clk_enable(ce->clk);
 		break;
 	default:
-		return;
+		return 0;
 	}
 	if (!ret)
 		ce->status = PCE_STATUS_ENABLED;
 	else
 		dev_err(dev, "%s: failed to enable clk %p, error %d\n",
 			__func__, ce->clk, ret);
+
+	return ret;
+}
+
+static inline void __pm_clk_disable(struct pm_clock_entry *ce)
+{
+	if (ce->status != PCE_STATUS_ENABLED)
+		return;
+
+	if (ce->enabled_when_prepared) {
+		clk_disable_unprepare(ce->clk);
+		ce->status = PCE_STATUS_ACQUIRED;
+	} else {
+		clk_disable(ce->clk);
+		ce->status = PCE_STATUS_PREPARED;
+	}
 }
 
 /**
@@ -483,17 +501,8 @@ int pm_clk_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	list_for_each_entry_reverse(ce, &psd->clock_list, node) {
-		if (ce->status == PCE_STATUS_ENABLED) {
-			if (ce->enabled_when_prepared) {
-				clk_disable_unprepare(ce->clk);
-				ce->status = PCE_STATUS_ACQUIRED;
-			} else {
-				clk_disable(ce->clk);
-				ce->status = PCE_STATUS_PREPARED;
-			}
-		}
-	}
+	list_for_each_entry_reverse(ce, &psd->clock_list, node)
+		__pm_clk_disable(ce);
 
 	pm_clk_op_unlock(psd, &flags);
 
@@ -504,6 +513,9 @@ EXPORT_SYMBOL_GPL(pm_clk_suspend);
 /**
  * pm_clk_resume - Enable clocks in a device's PM clock list.
  * @dev: Device to enable the clocks for.
+ *
+ * Return: 0 on success or a negative error code. If a clock fails to start,
+ * the clocks started before it are stopped again.
  */
 int pm_clk_resume(struct device *dev)
 {
@@ -521,12 +533,24 @@ int pm_clk_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	list_for_each_entry(ce, &psd->clock_list, node)
-		__pm_clk_enable(dev, ce);
+	list_for_each_entry(ce, &psd->clock_list, node) {
+		ret = __pm_clk_enable(dev, ce);
+		if (ret)
+			break;
+	}
+
+	/*
+	 * A device whose clocks are not running cannot be accessed. Do not
+	 * pretend it resumed, and leave its clocks off as it stays suspended.
+	 */
+	if (ret) {
+		list_for_each_entry_continue_reverse(ce, &psd->clock_list, node)
+			__pm_clk_disable(ce);
+	}
 
 	pm_clk_op_unlock(psd, &flags);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pm_clk_resume);
 

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261029-pm-clk-resume-report-errors-b5d538eb27de

Best regards,
--  

Abel

