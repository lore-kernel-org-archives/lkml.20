Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232922;
	b=HUeKsib7LJ5cVJJ3x4MKD3zWbLDUzB+ESSmj5PlEzrsK/RXe95eSCN+d8OpYbDjwOVPO
	 PJx0hK/IYQZeOR07yHBAyd3F9ONTo5ptKFGdw5qBOzxey5sjMwXHtx4KztFe7i5Vn6pmP
	 aAHhZBvicI0t7AX+/9l+zpwkl8Q07EttkMTGDjGEdKaNreOS9TwHH/Xs00sweJaKmgnq9
	 QiIoqlDYKwwpc81nhnm3LeB3wbg6T65qG4+RIMLQgnXrysN4Y2lAz5YRxNooKMnb7yY83
	 ivIO13SbD8dRCNpwWwF1100H0ObU7yOg4Xjx/0qBpO0y4cT/4r3nS+/AH37JKZDXY1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232922;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VpqRFbE4DcbPh1FZMQv14KawzXTklyFyVf0uyoyfOC8=;
	b=RB6rDs5j5lCYJokYg+N7cTd80WTt8lrX7F+OpKbqkRC40tzq1vFT/eJ5mgAUu+AqvzPX
	 cdyxBZ7itbrwC0O8C0ampiCcLUKc2Zrj9Gbk13wJ+jlAkWyCCCSyQFSB2Qv7AbijENt1b
	 OsmXk6Dl7o7Y5IetuH5mkHoSfmZO9RM7Ik3gGFk/3qU4Fs3mre+9CK65qUz8iOG7jM+qN
	 hriSPo5y0uItdknWUTamjAw17pxU12/o/a4B3x4Pqc/MFt5uH4qPyy1C7qK6LIuxRfa8q
	 psFVq1+V04QE8C5UioGi5PhtAokLmYVHxS7bTP+DYFZrrSBqovIMp9Vj8NnEBXtDvow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JITHVDHj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESiFVH19;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6A9606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E6A9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JITHVDHj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESiFVH19
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DExSi3460755
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VpqRFbE4DcbPh1FZMQv14K
	awzXTklyFyVf0uyoyfOC8=; b=JITHVDHjqUsoBqo9OHAoaXL3mxeZS846p7F3wy
	mbqaeMYBH08TBD0/WJdUDvbPFdbPjV2xZIAcr5MjaVUwUf1nhsj/t72uVd2WX0sw
	ZYL+n2+z6mSNzNYFsNIyERchTMZ+oVXv5gxOXHZGhymKvOnrykv2ivR4AKu6/Nrj
	nSpltjBgBUzaPuoODCtifQMHImHlyijYxEoNn28eqGhqxmh3+CrAsNvZPgcVoT+r
	0tS4h/xZjWR5XUhgtf0j+3JNbLhcSHMtLERDLnAaCyO4AVaKYL6rfGf20plWi4Sb
	ne8/hi2IJhKKU+l3jIWCzkvW+1+dQrIBJ59yCVc0sTnCamXQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rrbx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:01:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edfbb5b812so321652e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232919; x=1794837719; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VpqRFbE4DcbPh1FZMQv14KawzXTklyFyVf0uyoyfOC8=;
        b=ESiFVH19Uo6Xyx4Xwnlo1jvAiAsVHY0miRlvuAOe1Ft7KSrUSumTXj13rScVakTIy1
         SBBxCTaz1b7875C5mGa16CJk6XKJ193e71m5oXEvFRUNw/Ueyf1jF1tuMuBLls8l0DHT
         hGGgqlnYmYgkJ+slTKrZre6PXOInbtvDBhdYdnt1Abx1LGG+W/+rbuI/z6b7aBtM4nJx
         VPAh05yvTkSVopZrk5/8cQpSEQmaGajDc/pLD30fMLU0HWaks6JAwepK6g/p4LzD+4QT
         XJ3vA9D6+kPmtoGDUV4Nd0qCtNNfzJJFxxk1WyIb0I3fdRwb1FlbAlvv50eBCrF2k2oO
         kDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232919; x=1794837719;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VpqRFbE4DcbPh1FZMQv14KawzXTklyFyVf0uyoyfOC8=;
        b=25QIuWHq/WsYGZJ61/t6gofQHMFfsuGxdtyDCFF3PmGc7uRZ3uJrIotraMnt1ryAf9
         QZGSHrMnlJy6aZhEhY8y0s7NUabuZUgj1oV7kHEgHeuPEzXZWAG2TOySyQZ+4wI7TBld
         cVlRWUVAdGNKKX1ZXHSdjsz6DF9ovMjbx5rOtpEmWizkQEm2jzH7zgNsLmtrwjD+TsiE
         cy3yS+ks6wtGrsNcSzEBsJyIrR4R9XwixWxLFnoxplF1pWpRCWqZHdFobbGXvLGQuF1H
         dQ6LQ2RzNdyYu+MJSRAATZXiZq9NRGZy65zaBYYnZzL7perb/nQaUZsMvslRHbgzq/0n
         RewA==
X-Forwarded-Encrypted: i=1; AL+hErEGgfovuT+WXHRHp/mqTeOo6LY0jEfXiOIdHVPt9uJHfDfBuPU+ajIRY02Xv+xDBulYidWbnGSnALAWIFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z87Zstob8uXCQTkcSM5m0psGlGw/2HGPJe6yvRPFdq5TFnZW4Rn
	BPNZnSDExT3ZaOv2oEzI2OcCx1HsfDHZ8gWtxJEMxDxu/8hJbk6gjaj7mg5TklUs7O8ZPajRPvR
	LAY6BioX5aglEnYH7dBDzJE6BrtOIfI/31lZ987rZeJiPcDzsXcK5rWGFQ309enyH6VbZ1qYzzi
	4y+g==
X-Gm-Gg: AYBFou2Xmek1ytfMon05nt3rxAOU1DJb1nPEhmp/1uqUCZyCodILwvf288WMXKnugpw
	VJXJeQ0DzVa0xkEyXxcP5v4lApq7msR286YELztKSpE97NvpADRlr9fZ1SyKhetFL0XoadZx+T8
	BMeYNI9euRBh7A/MAoM/QSFZqCfHCc2Xs/i4NgWNT6+AMy+HduxQP+nzNGEslHdjEulYLJ0TNjv
	ckhaD3B0mGfGbBxm+I/vLjiWRanBvxOoE4PKaZge9PAREU540PC9T0SFDZ82df0Fl8ETiNLXOge
	/PhXuL/OIPCZYKi9eaZXlf3/EluyGcGNjMSEeuCzglHoWL9Q2S9/DqJyDdYCByv67d7Ac3s/l/P
	z69XjRDfNdHNmUPr5ZXfeBUiVbJzB6v6TqkAwXfBWs9P0p+oMuAXyKpNeAqZwzFi8bmpapICYqb
	9jnpTdBw7gYe/gdAcsNvAz0dLjAawBkjJJz54TAn43Erej2xJZ/ZNweQ/V6HUAfAiAaeJ5yxsr5
	+cK5ilcHlqpwJ8PbdAcs2nEMOqN
X-Received: by 2002:a05:6123:64:b0:5c9:a60b:e5c0 with SMTP id 71dfb90a1353d-5ece724fbd5mr1250197e0c.16.1794232918692;
        Mon, 09 Nov 2026 06:01:58 -0800 (PST)
X-Received: by 2002:a05:6123:64:b0:5c9:a60b:e5c0 with SMTP id 71dfb90a1353d-5ece724fbd5mr1250098e0c.16.1794232917994;
        Mon, 09 Nov 2026 06:01:57 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:01:57 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/7] i2c: qcom-cci: Runtime capability detection and
 improved read/write
Date: Mon, 09 Nov 2026 15:01:53 +0100
Message-Id: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFHS8WoC/3WNyw6CMBBFf4V0bUk7rUBd+R/GRSmjNJFXC0RD+
 HcLJsJCN5Pcm3vOTMSjs+jJKZqIw9F629QhyENETKnrO1JbhEyAQcIUKGqMpbZqaZZrkUnBlJJ
 Awrp1eLPP1XS5frLDbgjCfitL6/vGvdZvI1/aVcwZk1/xyCmjAGnBweQyA3VuvI+7QT9MU1VxO
 GRRjbDDudhwCHiSpUJAkkupxR9c7PFkw0XAj4gpGo6aa/4Dn+f5Da+ggVo4AQAA
X-Change-ID: 20260929-cci-imp-8ba384309942
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: KiJR91VnfWdaC0B6H9tum4FpnKZ4wOSq
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1d257 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Pm5qjrwcTqiPDamcvu8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXxHUO8OT6vvkj
 v3paTBj15DWvFJr6wWnwOr0KZWMJE1jxlPGdfkF5WMdfgFBIGGMBYaBkTncXsQVKlP/B/9hp9dp
 LOS142QyRRY0PUbtg3Q02iWRAYJyW+b+3heHjatC6fz6o1kFAFMfLWPqUlEWOtkmBD4vubOWh71
 567OiQsrrTiz9lEx+C6/mrwD1AJJWVTj+1TufJPRXdE60GtoYiC4bSAH4Lacv7CVmiFFUZtVbY7
 Hhuw714SQSwXKbEcyN8baZ+SzauuRqYW0+vwtOzCf/9QftJxGeobRx6COoayD7H64fRIRM/2GrR
 2B838EK5sqmCMaoa28eOwkDx2TUbbR8n+2sJop/WJ7J0NPt/odhEruaDUcIxQ8X5OMoWERFNpFd
 DM+kGuvvBDQXYwunoRXxpSQ6FsjCLpGMz1JK1I+SPhza5r2Q4uOvNZgTEw49P4V3YXl87o/STU8
 M3QdSsUPfHR0n9Jlvjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX1QThxY3iyV1B
 oaBqL5B6/LV8dbuydZCzMQhG/ORVRd4ggBdDKw2urXeBx8Sn3sEOh42y0IK41+ciEpgEtmWOc+B
 /WhanTMSj3et/TeBOXzGckeZZwqFVs8=
X-Proofpoint-ORIG-GUID: KiJR91VnfWdaC0B6H9tum4FpnKZ4wOSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

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
Changes in v4:
- Reject an oversized write with -EINVAL instead of -EOPNOTSUPP (Konrad)
- Burst read: terminate the drain loop on RD_DONE instead of on the
  expected byte count, so the transfer is never left in flight when the
  last bytes arrive on a threshold interrupt (Konrad)
- Burst read: restore the short-read sanity check that was dropped,
  now comparing bytes read against bytes expected so it covers the
  threshold and the legacy path alike (Konrad)
- Burst read: disable the RD_THRESHOLD interrupt on the error exits as
  well, not only on completion (Konrad)
- Burst read: bound the fifo drain loop by the expected word count, so
  a bogus hardware fifo level cannot turn it into an unbounded loop
- Link to v3: https://lore.kernel.org/r/20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com

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

 drivers/i2c/busses/i2c-qcom-cci.c | 495 +++++++++++++++++++++++++++++---------
 1 file changed, 386 insertions(+), 109 deletions(-)
---
base-commit: 00fb8097ca5a4fcf0e0cc1550075aa7313bbd32a
change-id: 20260929-cci-imp-8ba384309942

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

