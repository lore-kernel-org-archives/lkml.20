Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198540;
	b=r9iFU+nW4DdGkH3L4LmbdvBEcch9xTGd0yBRV70BJCM/iq8SPK/eU2RmJ83yVozb+E9x
	 35h6+2Ij/jg9TM31PHrwGbo6ti734YTn1AXAm5dd26uAL8mlb5vvxQDKnR+wpTOxGnom5
	 nL0I5pqarJZcGZjXdByo4U5v4TuaMVYDWnhEYdFjmFX3ephF2VQ76JSdxYJ4CYRH7XlMS
	 Fk4UveXLUfsgh5Q56uPMLPXIRTlEZb/o3x7NyJybLXxfqlAbKpArpntP70qWB48hs2/wC
	 vdPM0LIvlWhiAbk4b8roM3yPlgm38WhS7+uV7Hg7wcqCI9DN51bwar+a69ezB4N4pXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LJwHANRk4tsTqKIG5HVa8grr0FIcoaYoEAnJnona81k=;
	b=cTtfhezUlavHEXd+2UkjAKnYD0v6kUMfHoFwgrcfEZ9qEJRp/5szESZB13e1QGavkEdw
	 qTqpkKhi/zTAaRMCzjZiDEd/0of7yndMqg83n/09a2OkjJqku/D4wIO9rDLansjSA/ys/
	 oyCSk5mJHbtkYz3XUeKZQw5d7W2GVbFkvmr6BOaRIcIG4DsHIKcY1HDgZjV6FRpxnCGG1
	 Cv4Ef0AY8KDrUUgKLiGlaQfZNAlsihul0FMb17xDcl7sDBQVbhQ9hf8J4pcsTW+rvieDK
	 zJyFEy8koEd5WbH9p5laxKLbzHPKkmrmixGIc9FBxozeSdKzplWZI+wXSEkW12x/nTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dg/1ADdW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRhhKj79;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2A4606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2A4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg/1ADdW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRhhKj79
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K26W120588
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 04:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LJwHANRk4tsTqKIG5HVa8g
	rr0FIcoaYoEAnJnona81k=; b=Dg/1ADdWiOGDtcP7ApMBmxrDdb8yocp1SJYpZL
	0Ux+tI2H7ygWfveTOoeSVb+oA+Akm5KSjOC9zTX67IZ4nIMd8HWGZsXxz2SP9zOZ
	9AbCahH5/55oXE5ys5AYNAlu6L9WjQGMQwQFr3ZHUWmi60aIRk8amMYpw/fHgnG+
	ol7duHA4L5ImhR3h4YP56WWqbwi/rVF14cA9lCzk/kHzr08GyxNIkfI33DsGj3Tu
	0y6NMgczE7sXSxb0fyfDiwvW7k/L4OeIw9gxLUbdC6fy8j1v9zK6Ojfbt40E7MS5
	PPmm1+yi16Qc/p7s/JvA212RwPCpg0f+pkTQNAy6BzyuVL9w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxscs6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:28:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1ac19c6bc71so618614c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794198538; x=1794803338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LJwHANRk4tsTqKIG5HVa8grr0FIcoaYoEAnJnona81k=;
        b=aRhhKj79xqFwVidt96guMcvvEhRpd2/OtrUg7NJTbn6+llkvwtiBoQ16hnWCa3sjTd
         37MqlQhmFeMnQehWqKCQzJ0qC7nakUh+6z8q8RzxfBdth5hd21FCTk4/qp6r5FgtEnTj
         d7GIQ44mMZgQwybNGY8dlUv6X8M3WUohrcXLwYDSwUUlmC5d2U2gBKA0R9IIEhmlZAOZ
         ct6mCPO1yPNBdf+hd5vNZaSxC/HkCfjPoq7TeUzSzaWEEJUozUhD0dtXxigm1EW6BdD0
         YrQxgRRW0r+nXqO2I4RRlzLEjXgMDIYXdOzKAI7CYR9TLBq+0itCu7mUo4g8qgxQGSP+
         5ZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794198538; x=1794803338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LJwHANRk4tsTqKIG5HVa8grr0FIcoaYoEAnJnona81k=;
        b=KRvAHEve19f1MABIVHrEpYQ8RKjti+mUp6Qzhmrc2/fTyX+96CBgJqzO8ZKpdhrOLq
         XhvyK8hsD++JPlh/j6HtxuJCndMHVUb6sDUZUcbGfmxoA/HviA6vHOp6eTVFr15039VI
         v6piE38eTKR5PIsLi/wB7nQ9mMbsh3qZhHcKH6k7Y4ioGUNj+7C0W9YjsNAkM/zdRyPD
         zaasyB0B6JUx2/IrN+Sg6lfT4g9FFvJeMUBE++30ZIcrccDJ2/mM3/6a31tuVN2w2GB3
         hVJXyO5iKKUwISEj8H8dnR4ejQS92bumAg9yUHndQXYBT1HBcZv6rmoxa6aBvHOhs2og
         USNQ==
X-Forwarded-Encrypted: i=1; AL+hErGW5MLK9U36sWoKqzZwPxsNz6ucNxzftZNxzkD0cgCarNk+kWDCVXDSyhdLjk6OlG1m3hYgNp8mwcyqN0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+txWH3igEKoZo7oSQd6zSGdqCrrLqG5l7wHHyukvn91b3XeO8A
	sj2R4gKFoPS530a8ntup6/W2xTGlFRX9xh9TyVUn8tGKlMYQYpHYUc6Xrd0C7YYZH2pj6j/+r3Q
	Qb9Mmv4f1TZ0eDclWOdeie1E8Y74N7CgoazNplvqEWhsR6gtDvG5VyhxVvUhzxQPs+zA=
X-Gm-Gg: AYBFou1MMtO5PyBto3zO3JfvDuByg5Q7jAneujo9h2RK4gN9ngA06m3KK8E6wFZlKbt
	qnY1LrjInpDY0u1/YFAJugDNDM+l2AubML7XXsO1QDkVdDwmKd6EmF1BWV+0qgRyO4p2ryLQm8e
	D4n610vWaM8Xrq+5ItWHxSix/mqeJy/MNiLwgGB4Tr8I1/p2ZSTbl7KYPKaDGsZt9KPYffXaOsw
	8KF3ouwDKDy0ufyIj6ZNUEJGRrOcjb+CRT7MCoYO8s5T+A9MVDsGXiBJzPq1n0sPbdn5VWHdJla
	Vkl2l22IhY9qynYb3qNQdDnDWUCYq7k/8d8y8kJ+SySRhdQ2082KVKk/go6nunbn5JDweGPDJFk
	xe2SA60CEkgJTn8+oXFHC5IdV3AjxM+EFcylwl1UQC0VKuoRDcqI1QDM3o627mBl45kYHiqI6R8
	rS1JfdvQ==
X-Received: by 2002:a05:7022:7f1b:b0:1b3:abd2:2eb2 with SMTP id a92af1059eb24-1b3abd22ef9mr1860363c88.10.1794198537688;
        Sun, 08 Nov 2026 20:28:57 -0800 (PST)
X-Received: by 2002:a05:7022:7f1b:b0:1b3:abd2:2eb2 with SMTP id a92af1059eb24-1b3abd22ef9mr1860338c88.10.1794198537076;
        Sun, 08 Nov 2026 20:28:57 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3773ea50asm8995525c88.23.2026.11.08.20.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:28:56 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v4 0/2] dmaengine: qcom: gpi: Add trace event support
Date: Mon, 09 Nov 2026 09:58:48 +0530
Message-Id: <20261109-add-trace-support-gpio-v4-0-85ed08134917@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAABM8WoC/4XNQQ7CIBAF0KsY1tLA0BZw5T2Mi1Joi1FBaBuN6
 d2ldaELGzPJJD+Zef+JognWRLTbPFEwo43WXVPItxtUd9W1NdjqlBEQKIlgFFda4z5UtcFx8N6
 FHrfeOiylUUWuc+AgUXr2wTT2vsCH4zvHQZ1M3c/afNHZ2LvwWJpHOt/9LRkpJpgr0miSRiu2d
 zFmt6E61+5yydJCc9cIH00SuapB0ghtBOVMKiXEisa+NChXNZY0UXBQDc+LUsEPbZqmF07eqAZ
 xAQAA
X-Change-ID: 20260831-add-trace-support-gpio-99eb54d42729
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794198532; l=2238;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=uZVsM1c8oIXO7DcXPRYabeES5UWADGd7YRW30QOmPMY=;
 b=dD6i0TZeO2EkikZu+u8mBbu1ftPGi2a4YnQEgcar4pMs3uLTQBLfDuLmEjuY2o4DBcS5zgLBt
 XhZGQsJF0ITAa5Z9hJprvAW1Bu7xypmJ0sLICCjonUaIb8mllMnTHtv
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: rDNI3k3lqfBVc41VxjHR0j7uTsfdRInJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxNyBTYWx0ZWRfX5K8Wx0UJnE2I
 7oaKE7Oyr+WpSiIL5XtwsoUbNtsLK+l+NwVTvJewux0y8avsNt0LWcvUEXGr56ugJ8plLWWdHKW
 j+CeGyso84pIu4uCx6EYGzuvPyafMV4=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af14c0a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=bdZYBwkQuwfaf9MGlS0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxNyBTYWx0ZWRfX6faB+A1A8M4f
 oN/Cp1nGfxZHgeZG+NVS5SgNUKD5xUjS2A6u/lV/TFUHcWRlJX78Gk5KoImlwzjnJeoRlxVsyl1
 zHy60G3ZwpjKrzCoCV0OuECQHHeJI4hm3B3PYru9pjx0P+R7e//fIVvCSgcsri0eiZNyqgwv7OE
 nqrzRtpgZmc3NiMNcUCUeG0hODcRw1YUzvc4KLXzz90Dgq+5QplsVVj62mH+AZb5FZFlgUnKgyd
 rdBAotvagFadz45Et9F5Up2xemxrmx2JFPIAVYNqiaX8whgZa2mMhHsXv9Cp2y+K3mbEdcZirpl
 o1yfC13UksvbtVJJoOk+XfzSBhVDaFQxkQipytgriHeQnebPDl1/0fDEeekZ6RO2dcipcidIIxI
 D+fvIY4b4liH5AYdTlVO7TUqcFnRvTyJJtA4xjhksc0xlj1+ttyyv88o4ONeXKUCmYVMfHPAVgA
 MnT8ZnAVVTTiLRRALEg==
X-Proofpoint-GUID: rDNI3k3lqfBVc41VxjHR0j7uTsfdRInJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090017

This series adds tracepoint support to the Qualcomm GPI DMA engine
driver, giving structured runtime visibility into GPI DMA behavior
without requiring invasive debug patches.

Patch 1 adds the qcom_gpi trace events header (private to the driver,
in drivers/dma/qcom/gpi_trace.h) and wires the tracepoints into the
driver alongside the existing dev_dbg() calls.

Patch 2 converts the remaining dev_dbg() call sites in the driver to
use the new tracepoints instead.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v4:
- Use TO_GPI_EV_STATE_STR() in the gpi_ev_ctrl_irq tracepoint so the
  event channel state is traced by name along with its numeric value.
- Link to v3: https://patch.msgid.link/20260926-add-trace-support-gpio-v3-0-8572bf7456b2@oss.qualcomm.com

Changes in v3:
- Move the qcom_gpi trace events header from
  include/trace/events/qcom_gpi.h into drivers/dma/qcom/gpi_trace.h,
  since it has no users outside the GPI DMA driver, and squash it
  into the tracepoint-wiring patch.
- Drop the redundant per-function breakdown paragraph from the
  dev_dbg()-to-tracepoint conversion patch; the first paragraph
  already describes the change.
- Link to v2: https://patch.msgid.link/20260909-add-trace-support-gpio-v2-0-01f81739bb88@oss.qualcomm.com

Changes in v2:
- Reorder TP_STRUCT__entry() fields in gpi_ev_process, gpi_alloc_ring,
  and gpi_ring_info to avoid holes: 8/16-bit fields moved to the end,
  and 64-bit/size_t fields moved before the __string() field (treating
  __string() as 4 bytes of metadata). (Steven Rostedt)
- Link to v1: https://patch.msgid.link/20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com

---
Praveen Talari (2):
      dmaengine: qcom: gpi: Add trace event support
      dmaengine: qcom: gpi: Convert dev_dbg() calls to tracepoints

 drivers/dma/qcom/gpi.c       |  70 ++++------
 drivers/dma/qcom/gpi_trace.h | 320 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 348 insertions(+), 42 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260831-add-trace-support-gpio-99eb54d42729

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

