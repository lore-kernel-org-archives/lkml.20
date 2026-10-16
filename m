Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4413B777C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137616; cv=none; b=TE0ByWLsKVjKNNh+5GiUhhKt2Ap04Zh9vy/Plin6QOXphokQB/ohfON04E1Yv9oVdZKTi/yaFls3rKUYnQTEabdZPWl03bjWOOP0nznpiz8zKGxXGO7NI0M3doGmbvzF0frVF2PgHeF6FTt8f19vBGDIXT9/Pml5fJhNUmytFAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137616; c=relaxed/simple;
	bh=Jom/33lMvyROexEXXBka+2wEVnyD992vNREAbJ9xUFw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q1win9aWjXswk7ypLOmj1FdGC8pYA9ehLFJSVap7EYSPpfiedhz8vd4jpwmyYJ4b21YF6ifOI37143szGYvbO0KZRsRzZvbPTOkESKBHjcxhsjpZBz1zwasfYDyBnLEsgZ7PI43QVftPErVBBD3Sn7atKWchNST/AWffKomytGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDftbMo0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vh04l+Y3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDftbMo0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vh04l+Y3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2Tmt4405915
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=evMqfyXWXTJBLIRuZtTEpo
	fBPLXYO84fBR90qAnHG8I=; b=PDftbMo0OF2PX88jsiOk8q6JCNPYSGHMRXjeNm
	HZ+FziMYkLRrLfXV/Ighpdwv9h90BCEK0jXVO2s1yDuYaeIiDBlwbjqYu3qTqkgs
	VLo5uIDIBJD48BxSZIY+vST4UyBM1gTYOkxZeO6zrZjH+OkLrchX+LskQCLxkDvN
	xAL05Ghmr5lUMIDWvo41+ak7mH8ugtQq1MQqX2LS7tdI1daET8w/SX85vZyG219I
	LBdIbvuFEvktRPYDLS5GFcJRqac36iicMDAnN+P1ySpFYBpLLRJ1wzVu5yztWoAF
	5Bj0jrCNNUPfWcJHvXpUQpPoKonPejmv8MBREPOU6UmNtibQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2psh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so1366230085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137613; x=1792742413; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=evMqfyXWXTJBLIRuZtTEpofBPLXYO84fBR90qAnHG8I=;
        b=Vh04l+Y3Qx575IptIcdTmSxmE8KWVxiOzIAySJaDOnI/YtlbEqh3OPhrx8qZ1dW2Ra
         /wi4reSG1d550g5X2EFTWg0+s0i7Bu+e2UkTVag4WxcXDXKYBaxbBOkrpXfc+N6n33N6
         WXOv+fM62j6Kf+sK1IKELcnVZJ2bV+99io75O/2b1lEVP6GX+lDP1btVcbPA6VhLSxAK
         mb0k5T8l41DYkdQ+ioxS8DMjJXl0QieW1C2OxEC9E5VDvAEm5rElXSFnOI0dHrm6mLAL
         eCsM8A3UBhyHE9iZ2SIZudBg4/cyB9/iew1SYw69CbqKFkEtDDJt8LJfssHvmMhuKDG8
         RJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137613; x=1792742413;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=evMqfyXWXTJBLIRuZtTEpofBPLXYO84fBR90qAnHG8I=;
        b=GI3MWoKBtChdFzKB3G2kHZJ/xzUMMt9fZkIJZw0d9GNMgzI5JOdBorhNZkQ0S/7AJQ
         mB91TE7Msqx8LGG5nxUo1prE2hTKhAzz3f7GInGk9FmBlBXzzzbmnF/pZ1PDhTlfFDZ6
         Fn8ppytFBMA73SLpLgwybu0q8xiCPnyfCe1Gr273r+xG7yS1BdJ0g8mXAMIV2AEfdENE
         fJiyJpCxLee3UKCDwyessibPR/SByyq8pV+z9fkDsXa4xKNu4KCAjqfCiLUoKajJzv79
         5ANWtkFVzBiVjEGmKLNFMIK1uMcsW29hlZ+JIfUIB/R0RxAh5XKbSsNdOftp58zCVgI9
         dVKg==
X-Forwarded-Encrypted: i=1; AKwUvBwfKnliPLbEmMqwqwDwxRyLa+E/FMg+cCsGpoX1lAlKLNcKDT2JGFJ8e6JQSC7eqUhmnPCD1toWtFonjhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFkgxpaE89o9cBc7t2xdY4tJ6l7ARQUXcqXvqMv5l5HmXrwDuB
	hu8yvU3Q/ryQh44UmmyNPf3PG17Z5rf+Pa8hRnDDz+2D1KCN5XjolIPdd4qWOtuR5+JBabOpUWG
	l1MzKAQ2e5xLfAxQLYjEswpNRzA5K+KY9RbHAJ4OPipOUiTvzgZqnwM5a8s+2n9e5lVc=
X-Gm-Gg: AYBFou0XxjZivMne7Wvl4a4gal13oXch3aWSTunFo1G3pW0HNUBXYOe1MfdA+Wt7Jpq
	9/gjmfIbinEDH/SOBFBCRnsm4xqvs7QGdmTxHwsJGk9jg5JRnJ8A3pQuTVl4nLHLmCq1UJUYBsp
	h93A89/pHNUTrv6QJk21gWryN560lnQWSXM3hQcuZZRemso8+MTwK0kEPDMD7OWP6uN/XTEfgPg
	npmGeuM7cK+B501N9zeldbGwxUyxLH6LvHMPG3NVoSB853e7a1XX2uKQRhlMrZlkYtN+wPOf9o1
	Ki76jak0llNkgswdeQnSTCldIDK7AM/ILou6+LTC3lQfL6sxNQJ1AwuJm5HkVp/e0zsGgEPjy/+
	57RA0LvVeCNhYDvKmN7KKmergJQ/Z4MbObpmXbpfY1YiuFq4aE24tXpizRkan7waB0r1jfXZh2R
	z91yKBtyV+71Z6mWCeIsM8qaO6p3Egw7CvVZE4ZSjxQHxnrHS9nDw=
X-Received: by 2002:a05:620a:2b42:b0:93c:8e3f:3036 with SMTP id af79cd13be357-93ebd0a1ed0mr3577119585a.4.1792137612521;
        Fri, 16 Oct 2026 01:00:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2b42:b0:93c:8e3f:3036 with SMTP id af79cd13be357-93ebd0a1ed0mr3577113085a.4.1792137611802;
        Fri, 16 Oct 2026 01:00:11 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/7] i2c: qcom-cci: Runtime capability detection and
 improved read/write
Date: Fri, 16 Oct 2026 10:00:08 +0200
Message-Id: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjZ0WoC/22Nyw7CIBBFf6VhLQ0MpIIr/8O4oBTtJPYFLdE0/
 XdpTawLN5Pcm3vOzCQ4jy6QUzYT7yIG7NoUxCEjtjbt3VGsUibAoGAaNLUWKTY9VaURSgqmtQS
 S1r13N3xupsv1k70bpiQc97LGMHb+tX2LfG03MWdMfsWRU0YBjhUHW0oF+tyFkA+TediuafJ0y
 KqK8INzseOQ8EIdhYCilNKIP/iyLG85EpEA+QAAAA==
X-Change-ID: 20260929-cci-imp-8ba384309942
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX/sxqk2uPaCyn
 aJMulVRhJJ9OZyDsmtllpS+naCaP7efOISsxjQxYP9f1Wa74zWAyv4VRDzKEHH4K1DNYyEfm9hx
 QrJJoJYnWgQuqX1Mx4V3n0WHbdLFYAU=
X-Proofpoint-ORIG-GUID: xgE7xyE0VtxoKUsj2NvIgXrkgjhBQI9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXytffoI39098f
 oAFINIofXM4PIgqIVQbgI/oyOQKuW7u0IG82PiMqNRAa2Ec1LWmeEil7p+287RXlBxsNUyBYbuH
 0T0IE3HFMILSIvtrGVZ3fNmYN2QpLlYSIIppkwPmsBGf8p6IyNO21PnlJ4nqiF0PY+1FXVx2qFJ
 B4Dp12k8sNipuISHy9SVQGoBmt94r+uYeJWW+i1pJ1JDYvGvr9+kGLH81vTTTyXZnFpqYCBzN58
 +l0SMGH0xEOJx9l8Z1AAKa4wo/mhrsCF5kc+YaSWNFXo4ZVIBvmtTVTDwZORA+Qt3UCtWGtL0rf
 Zp4+OxpCKtZornTIqNKLvBNv7XVAeVjpXKbfmx2wUPcVwxicdR95M5PbVVU8BOXwxedYOoBrypq
 cUpWb05iujh5+QQsiaFHmruYmrT1r8B3lHmGA5UsWlxhJSFkp6bYrTJY1FzEA/3qL5a3SEdGoHV
 NCCieEgP2M4GnHSl/0w==
X-Proofpoint-GUID: xgE7xyE0VtxoKUsj2NvIgXrkgjhBQI9R
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1d98d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YGdjDy1V9CnC6BiKI58A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

Improves the Qualcomm CCI I2C driver read/write in different ways:

- Capabilities (queue sizes, max transfer lengths, supported I2C mode)
  are currently hardcoded per DT compatible string in a handful of
  cci_data instances. Replace the static per-compatible structs with a
  single version-sorted capability catalog resolved at runtime from
  CCI_HW_VERSION.

- The driver only supported single-command writes, capped at 11 bytes
  regardless of how much space the command queue actually has. Factor
  out the write-command queueing into a reusable helper and then add
  burst-write support, chunking longer writes across the whole queue
  instead of a single command's payload.

- The FIFO read path hardcoded a fixed 12-byte limit unrelated to the
  actual per-revision FIFO size, with a special-cased drain loop.
  Simplify the FIFO read/drain loop and derive the read-side limits
  from each revision's FIFO size.

- Add burst-read support using threshold interrupts, allowing reads of
  arbitrary size by draining the FIFO incrementally during the transfer.

Also add overflow and underflow IRQ reporting, as queue/fifo limits are
now derived from the hardware capabilities and exercised more
aggressively.

Unbounded writes, which refill the command queue while the transfer is
still in flight and so lift the queue-depth limit on the write side,
build on this series and will be posted separately.

Reads up to 4 KiB and writes up to the full command queue depth (451
bytes on this part) were exercised on an imx219 behind CCI v1.8
(128-word queue, 400 kHz).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v3:
- Reject a write longer than the advertised limit with an error rather
  than ignoring it. (Bryan)
- Build the command words with FIELD_PREP() instead of open-coded
  shifts, which also documents the per-opcode field widths (Konrad)
- Actually program CCI_IRQ_MASK_1, the RD_PAUSE bits were being ORed
  into the value written to CCI_IRQ_MASK_0 and so never took effect
- Clear the per-transfer status on entry and stop reinitialising the
  completion in the read drain loop, as RD_DONE can fire while the
  fifo is being drained
- Link to v2: https://lore.kernel.org/r/20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com

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
Loic Poulain (7):
      i2c: qcom-cci: Factor out write command queue programming
      i2c: qcom-cci: Handle and report queue overflow/underflow interrupts
      i2c: qcom-cci: Detect capabilities from CCI_HW_VERSION at runtime
      i2c: qcom-cci: Add burst write support
      i2c: qcom-cci: Extend i2c read limits based on CCI revision
      i2c: qcom-cci: Add burst read support
      i2c: qcom-cci: Build command words with FIELD_PREP()

 drivers/i2c/busses/i2c-qcom-cci.c | 464 +++++++++++++++++++++++++++++---------
 1 file changed, 355 insertions(+), 109 deletions(-)
---
base-commit: d6dc536a4c8bb99dd822bc349a9e801be7ea81c9
change-id: 20260929-cci-imp-8ba384309942

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

