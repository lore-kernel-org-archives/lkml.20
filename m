Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC94A1E19
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194216; cv=none; b=N7R2pltSiBhpJbBZKW+O7AUh7QYX6E4qeqKXLYHGKjfSns/dz5OLvdl8lLMSp4IzuCqyI7h3qaIS87JEOHbBE1hkTaRG8J0LX+p/DVG9hwz3l0mIHrLl+i73b+gh+6B9/hThNQpK+SmbTIbX7MGWovFPr1ZCGC7hwmgz+egR2sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194216; c=relaxed/simple;
	bh=xTpOhfVqaVWaoOJVZbGCxX2ZY6YXW6oOFEBei85ggi0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B1inVDQhBeRHf+dBw5Nfyebm0cynAVG4FspTBo3YGRPrQiq44GFPjNgOM6px3GevcE7NKt7NpDnlrN+F7CYiQkTzBJMw4ZxrMM564MwXLEFRH1IAFT/gfxQpJkkyaleM63/rSYdszvec5qML7xn/e7OOgHFMChXG+fpFrtZw4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDeB5fzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdqOLFBz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDeB5fzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdqOLFBz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFqD3Q4079245
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rqfzRoa8lzdVEVcPPhGUKT
	zLirYY2hrbQz5zAHTrgZE=; b=mDeB5fzmXNU+c62b++t3Wdhu/8Z838ZL7VTpg1
	NfziV25EY3d1RXRCyO0jNknPMtkp4Ymean83WXcD3VP+Tv2GtAg3LJXZb8D8/sdQ
	XxZAFtfxx3K2VuM+ufNCpfKur3wa6s8IYPqsSYR7GxfKUa+A/aUx+u4IJYbI4yFU
	f6znz1Sw7CsMUYzt5DygpfPfpjhVSw0N01ULqctku3VejE8e0cmBXtbpRAz+uHtw
	zQWd6V3Voes2rYvXUQgiSRh2ygsHgn139k+mTnrcoQB49atDanV1EfBWaYHh8WtU
	35hsMrVUdCtWehG3Ufb3TLGocFJx244KV+0ORa9TXcRFm2KQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb9x5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:36:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so6355276a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194213; x=1788799013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rqfzRoa8lzdVEVcPPhGUKTzLirYY2hrbQz5zAHTrgZE=;
        b=SdqOLFBzQGLrl3qIesRGXgNTMUXttSBsz1oMKqWXpVIig3YnBhiN3I/UjA3NCACTV6
         QoO6jRbI4DwOomIWI1FN1VIm9NUVUbNC5WwY7/6428MDPKKHXzgPo+0TT0eGaNVUumED
         onKmV13VS2ph/H6b8O5mofxjALnB2DP43Kll4n1IPDXji07TMUVzCOSnE4T1c2yFuUQh
         ZZ7TkNlizNmmIzsUnu0FxL2KxXP0+hEk4zflyUpu3Z8tBIj9iZpquTPDBAapftnbAwmR
         eGBbrBdsAsrXrvpeC5ZlFE47AETYRwaLX1E4bxZo6H71w1TlHHnUt8/BHt3s60AM8DpX
         WaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194213; x=1788799013;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rqfzRoa8lzdVEVcPPhGUKTzLirYY2hrbQz5zAHTrgZE=;
        b=b1afygRU6wdFtf+OkC3oo+9BC7TUuc/R7tuFNGb9c9Lt7APHDaWjdHoZ+XaEmAjJht
         WkCkjuk+gwM88DVVZ6/0Z4mOqO0AF/5VixwpwUDarezNK2a11W8FxZ0TYbnAAgPDNN3V
         Ks34uNBnmDq9HU9sWTCoL7yDdcOY7O+KpB8GX0iK2EdjgD18l8jniERGiyzBew1Pjr8L
         XSUXMAks0TBKUd93iqMNLhM3j/PjGWebElRN81irFVVge2ihC4bXO5zRDirOEkmsfEV4
         CLrXXvli6Uj0LPJ6yPi8dIJZj4jroT5YWNefMd+AgcD6OACMuRwp4Ya4vlZkCw41xFLo
         4Uag==
X-Forwarded-Encrypted: i=1; AKwUvBzBg7LFdP0msZwDhWXp/MON1qSruoBtlUvBCgBH3oDo34e1UR814bI2Da+FyoDmXI573RM1dbKm13MjH9o=@vger.kernel.org
X-Gm-Message-State: AFuF++nPEN2IDeygT9MCuIamIE7RByRv5+8k0bb58fCAV3vx42JS0lwa
	VLE81wS8uOyuzyKBoCYSlFippRiglQHVsOiBFfSjP25stBvnaB+zT/iARNx7Z9aDFbbxumWCezP
	jeauLqDDDuNQZyftDraEeiz8B3bZpOEI7tW8Z1T4eV6Bp83GPRU6sgkeGRXFRcpniDVg=
X-Gm-Gg: AYBFou2N20Nsnrs23HFy/EVvSkWJSXQ9rIa5rzeYjiZxu1GGHjjc06/uKnOhUQx0hg4
	UDzqu5OQp4Bo/G3l8u+u0Bj+lz72yep6zB+LIfQcp9+WwM4wLJ93gyy6kugAlqEOdyZ8fUwRH4J
	289uyn5bmQZzV20dOut0llG+UmDVHe/LGH+O/n4b2kj3MHr6rUXAq6Cz10QFk4Rt/AK5MV+j989
	NWwqC2rML5DHQBFUB+BeqqltCS8rHhLLSYJBg6cQqiCgNyMujMnt26fvmVwskoA1OwtD8C+haDN
	NEs5F1QLDwfdG8IEd8vVj33wYP+GXlSAn9DajzqoAfDkkru+Q/URMT5OV6rWn2YIY/nmZx8FyVc
	iLfqLGo+kYqjNiiIe6Z4rgTzWGHrfWn068Q==
X-Received: by 2002:a17:90b:224c:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-3989c003c31mr24473216a91.20.1788194213577;
        Mon, 31 Aug 2026 09:36:53 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-3989c003c31mr24472805a91.20.1788194209805;
        Mon, 31 Aug 2026 09:36:49 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm271260a91.12.2026.08.31.09.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:36:49 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/3] dmaengine: qcom: gpi: Add trace event support
Date: Mon, 31 Aug 2026 22:06:34 +0530
Message-Id: <20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJOtlWoC/yXMQQ6CMBBA0auQWTsJVBTrVYiL0o44LGgzUwgJ4
 e5UXb7F/zsoCZPCs9pBaGXlOBc0lwr8x80jIYdiMLW5149rgy4EzOI8oS4pRck4Jo5oLQ23NrS
 mMxZKnITevP3G/etvXYaJfP7e4DhO8hCwq3oAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788194205; l=1247;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=xTpOhfVqaVWaoOJVZbGCxX2ZY6YXW6oOFEBei85ggi0=;
 b=95Frxty43ymUylU6j5YTJArM/YAiljzCRUdfAAIdm6roQZxJ33T2TqX/e48F2m6i62dODAzZU
 NKPKK3fBFs4BzlnXNky/J3IxpcExdaCEmQVqCPCzDWy795gULL/MMSB
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: B4e2-eltQ_xgl0zjBI5VDWWU8wz5KlgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX8mPoB4EUSNaf
 4Xh7oaW2gHv0BIBPy49JQF9bit21UQLGWkO60gp2jpLiccZ5xlk3Qr8nPxxAVQBiYU/IFHY5Iw4
 UO3btTJc+yOJu4XxjeGQ3H+sjDFk6D6ehcXkh+xk/DswVRv2jaIYWGyaP+HloVoFphvCNeEw5hR
 KSjnfitNFqygZm1VoBcZtyFVnGqnt1QoJ5tlfRjQ9nKjl6MKvVIMvmE/ovB+7Kd7dOH7yTfoJW0
 MMwQdW08F4LyfnPdhpz8XQAPHqZ4snZuFl3L8e6d+mMGlSf7Wz8R37q+2glU5gLlaVv0BDf6ogn
 7bDhzLOQ8c6kMz+QjTmT+ayNf/+thHaD0mg8+t4NsbCLvISG1+QlPgT2MKPFFoxDBste6YiV8V0
 KqN7mYQP+T8ap7JT7UdBta08M3K2ZyGgEVMXgJJqJO3EVaz+MBgKFkdvYZEx6+pTEw4I8AbUf+6
 kN32vaLBj9N3PJLVkNw==
X-Proofpoint-GUID: B4e2-eltQ_xgl0zjBI5VDWWU8wz5KlgU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX4tWDtIujCtv0
 suKI8mg3DjzYaBP8lRXlc2Jz9YtJAMEp9bJut3CcORuBv2VZxrnL9lYm3W1j4ds6VdLEd7SHGz4
 GRtslILzSR4huNzrfnBoZCO0mRaQVmI=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a95ada6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bEzAOnUhC74fLp94dtcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310143

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

