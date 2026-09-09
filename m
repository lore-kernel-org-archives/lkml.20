Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE03360EE2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930598; cv=none; b=qk0cOybu0xtryn9HRp1jkGgv58Q36jlo0OvZumWZx/jYU/0rG/u9lih2jAQWr44ES8ynUWPjr4JsWBWjc1crlZy3hwHnaWWWxHZw2m4P26dNb4Hy6Fpc0KkZ9fXE4eehBp4d4uzEmyfmoI6aVO0CTmgY8PMcc5L+FQJMkY18MPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930598; c=relaxed/simple;
	bh=medeQtILtXnou9GENFPGPSE4wA2XEvyNNFClxGKY+CI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n36FbYIU9IoKCQajLOkBhkX09sE18Jn38FqviENhZdubgUYG5wahWBvWtPKT+q6jvKx2KWRRRTmd1M9CGuXYtjOnMu0q7w01T0Yi8KMFFJn3Gk9rMiq8l85EVDEgvwaScNkalYX9ni5mxaLjEgh7UhJ94phrGV4cwjZ6HRtrXT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIUo0t/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjqOe05Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIUo0t/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjqOe05Y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgbCh045678
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 05:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M9wz1eYsrgbeb+Bam//FWE
	dAOWGxAvwV+SvxgKwwx1M=; b=TIUo0t/8y5Tj3Voh2Et/3KLbTRW+C2DTW7v56p
	ZoXzrzUPKHq2x6kZbEoPg0OOXqD8tdFpjQzh8QneWAIY6k2IaG5FHVwyxADVkHMs
	y10UyZzkOBOzDk7gmZ6zorOImUMA9aOk0GGiiJp2u2CzAWXV/h/DWYm/4UxKD5Hm
	sh+UPL1ReFged0lwe0WM2HzGV4MeZxgtDlcGmUfZ7fdsSML2LxGO0Ey5vfCisz5i
	NAZbl+Gd1SdW7w1+sZ6kIx/cL96iwh/j2YgLi4tlXDe+e8H6XLZCC0VEo3/XZSVd
	C8Ht0fkEDupHgrzbaVeG0pzg/7Ae9mAQJqX2htLM9jT/G6bQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewj6m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:09:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so9319116a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788930595; x=1789535395; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M9wz1eYsrgbeb+Bam//FWEdAOWGxAvwV+SvxgKwwx1M=;
        b=UjqOe05Y21sNBq4KcB2maqKzOSviYXHL4qzZC24xDXEVgcjzHy+9lpUpjpL493JVDk
         lcgnFegeuwDyms22FWlAzmW+P3K1hwBBhrKT+5Ba3F6CjNjGhhAPMR0kTOZfMiB7KMpn
         qD+bCbaKdTt1IX+IdQvSdF9wI9FEYEdH/wEfm2Me+vMlYi+ruoApPJSoscnM1+VKNx0v
         QQO9Hlsk1zSQYyYFLifrUbIT7xVWwSazDuzyRLaT9+AjqX18suMSo0FEWtdjZAo690WF
         Pb3Tb+aNAcbY4tELKBTIi1AyuQIV26Tk57l01180l4MIMG7qC9/8A0ro6f7EZz7JYvcr
         ipXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788930595; x=1789535395;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M9wz1eYsrgbeb+Bam//FWEdAOWGxAvwV+SvxgKwwx1M=;
        b=jTAEZsJCyO809W19BB+jlXEUudxWJOyRRb3lUrEoOFfdkltfg6/ibWUAhaN8dqkLxt
         MkeU24qwUCfPZR3/DJF7oBRBFLiYyju7Ki251349B6u0VlNG0iybYoI7rcCKwoW8HYEr
         4tI/ZX2RRmgIfmp4Qlf0rgS4jf1NMxPBaAAi0zOi1MxclAoCCzJKfznqGsGvrh6Ep8rk
         5T42b2yLw+nK8sL06A7XDfozjyoM4gOfUQAT57MxYckL5Dc1cyxnt4MeqxWIjqiwSimP
         2t6bbgdij2/kOs8I+gvc1Dy5Pd6CyoTo63EYHzmW0OqPpgWuxgRLR3cehB6bBjBzFj4T
         i8Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzhY5PAAVs0CzjaVwUqi/A3vF7EfJTqjk9vhpu6Y2K3IxlU0RKcGiCABhSkAgkda5liz/toJ9h3nkdqZBY=@vger.kernel.org
X-Gm-Message-State: AFuF++npviQcx/fiE7xLr5fF1hFsYfVC/AT4eiz4BHTw+aXPCYbg+Ppv
	X9IS4a2TIy5aI4Rlgp0Z/5Q7WunHZWnSraSrP9EgQAqLtRH4DXVKrpHGSBvR3BMtRzyD7ZSPzcs
	rTjckI/qyKZ1/MX7qI8Vnrey/NnxBQ/i5X+BcfM2PYypFwkdCfwBUIyBYHhKUQYMkj0Q=
X-Gm-Gg: AYBFou0O2dZ1IZ4G7uUdMiMDoas2iwQoX7adyeHTWrUKZlNJ6PTbUjCecHMZsHnCvPw
	wP+PhmrOIRtbvzEQGQ7YTcPDzrOuks0OKmD6j4PfWpZS7AkR58wsyze7y8+hK6e7tIY//0E8Db8
	M3F8Tt8d1cvs9USYt1Hn0788bYtTvktPV68BGjuqzoBY2HB6fEhTbLeTi1NhiGH5i3EEtcPdh1c
	XpYaAOacdZLyXSbcHXBPkASJd+GErL1/rLZkjZR6jeeFZgXuiX7eP54gh3PEjVdaDu/xd5P4Ey2
	ikI1Tk9DTkzXK2KV4/cfyXpaeuO3gIaMgT0GBAa98S4wlJbNqvx318AZAd0UFXSNJSthE64E0Zp
	jhn9dyZsQxcWdCZTVPcwHFeRuu3kuhkKJDA==
X-Received: by 2002:a17:90b:270b:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39bac13b38dmr5724110a91.2.1788930594988;
        Tue, 08 Sep 2026 22:09:54 -0700 (PDT)
X-Received: by 2002:a17:90b:270b:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39bac13b38dmr5724013a91.2.1788930594402;
        Tue, 08 Sep 2026 22:09:54 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm11082833eec.14.2026.09.08.22.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 22:09:54 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/3] dmaengine: qcom: gpi: Add trace event support
Date: Wed, 09 Sep 2026 10:39:40 +0530
Message-Id: <20260909-add-trace-support-gpio-v2-0-01f81739bb88@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTqoGoC/4WNWw6CMBBFt0L67ZBSUMQv92H46GOAGqW1U4iGs
 HcLLsDc5CYnuY+FEQaLxC7ZwgLOlqwbE4hDxvQgxx7BmsRMcHHi57IAaQzEIDUCTd67EKH31kH
 ToDpWphK1aFgq+4Cdfe/Dt/bHNKk76ritbYnBUnThsz/PxZb7ezIXwKFWvDM8yajy6ojy1yQf2
 j2feTLWruv6BS3nAKzVAAAA
X-Change-ID: 20260831-add-trace-support-gpio-99eb54d42729
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788930590; l=1648;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=medeQtILtXnou9GENFPGPSE4wA2XEvyNNFClxGKY+CI=;
 b=016zUGsLJxeo+zQ3mYzHto/4nRE7sqB7+G5Q+miZ9CJV6+Hn8hRGIQouhb15R/ZxIG27LXtRZ
 3JwusuYeTRpDHx9qZ+vY0xAgV1U1nVAisfmpOb4e/6bSofGxgvLUXX+
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa0ea24 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=bEzAOnUhC74fLp94dtcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: cCpqSTwiOB44JKKgyQBeTEN6y8cUO1Co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA1NiBTYWx0ZWRfX69Re+VOEOKjt
 IU96oQpkoyR3lPflG8y+e9qDZFh8Fv1DgJO/18EuPH0TXoBsX6fRCUh7A4D+AUsBAsSADzDSFeE
 RoJ+3rror1Ygn60il3AVZ+rnEFZgwLwmt+erq1msZG1PwqFzITpkVch6NUDM5OfUJN25lOjq2ls
 motqieOXjzziaKp3HuvsyYrHLNIbRM4vK5pX7ukVgEPKTEzBO1kI1R/mGUG5nNJH4/veJNXrOXM
 5GDmbNgxAUMghIBuMnN7cCGHDVTaS4jUgXFmwJwJ0y87JM/bJWPJPELCdejeXAdg8RQEWWTGRL8
 uSBaGY4/sf3OS5Rqx37ojx1V4AZnivmuHHUY4Q84fEApDADVT5StcCOfK0CW1shklBhokwcxVHj
 fDIi+UHgOprcCtXTiSQXU4XA+O2w3CcSdhKAVFuMBC/pmM5Ue2FIEv1kaxdToycCuSK3wPTWYJ4
 fikFI6cAMVZEV2rSbaA==
X-Proofpoint-ORIG-GUID: cCpqSTwiOB44JKKgyQBeTEN6y8cUO1Co
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA1NiBTYWx0ZWRfX+iGw3cS6QtWw
 jF6RLf68kTmHzr1RyNAjPUcuRj9PGgDXMJ4e2lI9LXUFoZQTyExLVSSYdtMa8CDxETUo0MjCMtq
 BUcKtzqBQmHgfK2j0P3UdaOhI1k6xRI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090056

This series adds tracepoint support to the Qualcomm GPI DMA engine
driver, giving structured runtime visibility into GPI DMA behavior
without requiring invasive debug patches.

Patch 1 adds the qcom_gpi trace events header, covering command
dispatch, IRQ handling, channel/event control state transitions,
completion event processing, ring allocation, and TRE contents.

Patch 2 wires these tracepoints into the driver alongside the
existing dev_dbg() calls.

Patch 3 converts the remaining dev_dbg() call sites in the driver to
use the new tracepoints instead.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Reorder TP_STRUCT__entry() fields in gpi_ev_process, gpi_alloc_ring,
  and gpi_ring_info to avoid holes: 8/16-bit fields moved to the end,
  and 64-bit/size_t fields moved before the __string() field (treating
  __string() as 4 bytes of metadata). (Steven Rostedt)
- Link to v1: https://patch.msgid.link/20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com

---
Praveen Talari (3):
      dmaengine: qcom: gpi: trace: Add trace events header for Qualcomm GPI DMA
      dmaengine: qcom: gpi: Add trace event support
      dmaengine: qcom: gpi: Convert dev_dbg() calls to tracepoints

 drivers/dma/qcom/gpi.c          |  69 ++++-----
 include/trace/events/qcom_gpi.h | 313 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 340 insertions(+), 42 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-add-trace-support-gpio-99eb54d42729

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

