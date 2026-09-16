Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE1F445AE7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543919; cv=none; b=eV4/pZkFjAmeyOQ4KJe2F0hcAosuiu+y0+fUtCJU9hFHSgfik200FFFWO6cd1c+TkBqQsqb5UQYKRdPhWtuIe+kClDxfTxEbSh7IU7KPrJG/D47AsLQ4O3egatMqeKN8DpFqUQIDLSqPpDeTvulgI2eURxU1iYjdOdd3dnBYiTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543919; c=relaxed/simple;
	bh=ZyrfuVHgzNC+PNVJXQV98WMFauqBlawhDtQ1dt6HL3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Odj6stlcoIjYp0QdMxKSJuMsk18Qi9Pqj+a2o+cpV88X9eCMCHRfnfGo7Rxsrs5jcaIFnBrQ6eRadTEc2Ay4S1ahsq0wmSoPhWNt+atb2VK9hMfEgvXrDHPyiOnBLW+2JDEnGDxSQ6KLfSnfDUIcZaXDc79ZRl9+ugLUSLdORuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6tFYu5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIA7RURg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6tFYu5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIA7RURg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68niE2986953
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P8KKfo5sbLQxqOv5tsVd5a
	F9hIQUbmwLnJcNjmMKWlM=; b=E6tFYu5RTnjHy/yR2Xg2gpx6iuSZCbHwWErCqp
	RXrefFJX2w6can1u6qKKBm7O28zRH+4dY3/J5TES7GxpfakGI4+yjPvkymwvaZ5S
	RarpURDc4Q1dc4NPkaWg3+lChl9Q04mWPa2p9h6Oio+p6KTxVn+qN7tgwwsmj5Ex
	N7TpDBuHUuppBTssySh1t1kpNYOif+PkcHXpELJzfm09H1j9IyVwzbF/7bAyg70v
	ds8zQXBvHttBpSWWxxcLj98NoY7bAAhcTJz+Pps2uhhCHjdil2z8dUailEFkGnda
	3ohf7dC9fqOkcK4Yjso8/0J2xL/dkZqhPv7OrDQTvfYAHrBQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp9x9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:31:43 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c1b7981b4eso4070288eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789543903; x=1790148703; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P8KKfo5sbLQxqOv5tsVd5aF9hIQUbmwLnJcNjmMKWlM=;
        b=QIA7RURgPUfdiKMpgs70MSzys7QmNOpWj4D1U6l/HdjBVgGnLDXc9KaI9+/GjZ6dSF
         AaQaNfJMkqR+Wh497NDM/NcNq2f/G3lq35C4s7d8nUhA+qFW/Nj1zzzX9Zker0EIZx+e
         zfXMkHfP3DlZY4DK6roE3iS+hbO4lMFqUGRzYF9q+eWgn1ohf5MgN3Afyhf30vo/rfWa
         e4zO4lXqfIk6a9ejLwxfAcFmnrydBF2zdJV+J6MbgywM1GOxA4qo4DM2V5W21OfJ3CW2
         +VhI3tJx5yQWLxkBv9qG1sRnEHFFEmtUrk53FvqKDroH0jlOP/mIl1IhH0i74EzPEz9O
         erVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543903; x=1790148703;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P8KKfo5sbLQxqOv5tsVd5aF9hIQUbmwLnJcNjmMKWlM=;
        b=qM90Aj6A6xmcausii3aJfXNm3OeKEN0DuROw6YRqi321jAktSJtjC3m4lJl9nVGT4C
         bY93t0VKc187MbGAa3TYjRn/tHjL6TyYtOUGpxJDWIAGDX0MCfFzxWNjzHuSagwYfC+l
         WEltGVyJeFN5zGtyR4WGAnINLI6lgMUpFy9Wu1AC2O/xK8Pwew/UVD00jBFqr2L22pt9
         qCPckzP16f3eiS885jRJQtfvc0lW13GNCJX4jiuqpWi8vDLgp6ny9svJNwpkhPOK4+pj
         kmNy3vFXZxl9/YexFNkkNC8BFO1zDWu9O5NnVAY3kAnrgwRDdAHUEdJSmv/lTqT9TuvV
         IlGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVP3k5Xvv0wP83slFNzwdKjm2WtQf5M2AoQvGqmPai7N8km8JDvDaEeYCBNF+On/PzUYtaSPATXeVBRxM=@vger.kernel.org
X-Gm-Message-State: AFuF++lMTdlX/+U10iFdT2sZq2aJo83FPxQ5k6psYhoZ+B+DNpDZxmNO
	f+Ldztp41VrQkQI6Z0JvTynnO4UvxmeW3kKJMahAS3ooBduKYrp6no+sVoThMeWgPZR5+TvaMu4
	ElLXI21s6/h74g9mJh/ytJfK+TrHPWRPbKPudKeVxpg+Undl5OQtvDfaeLTA2V61j7BQ=
X-Gm-Gg: AYBFou1MmI6srIYt8/R2S/2E9arHwBbY7DxNtEub9tr772HTKhpF+UB2EzGnSERmpwW
	KkE9F+t76R3IEREQhQ1TWhn4ZmnjkGYz871GGwAA9a1FIbU5xC1ockcJTWTR17zayZDZD8kgTFT
	Q5E8MFWsSX53Wb4JtsyGG/1J3byLgTWDjTKy0y9nWAqX+VymD0mjnK4zDriwtWK/HNmMprhWEvn
	AtqHa+FJ82BhWaFLVXr0C1/iFxOlRYPfx/x79k0Zg2dgk0tl9U++1rKseol2cfK1SXezEumwLPS
	uRaAgV2QipHiOt+74RBUSr95/CzUH2EVb6zz5lHNhq8NXRuNPMP/TrI4ERhGAlFeDxtw2oVEcCO
	1Nk2wGJkojTGOCOFbLoNCuYy8tXyVPrvOggZy8g==
X-Received: by 2002:a4a:e914:0:b0:6ae:a950:9faa with SMTP id 006d021491bc7-6c7d15d0823mr1579560eaf.10.1789543902744;
        Wed, 16 Sep 2026 00:31:42 -0700 (PDT)
X-Received: by 2002:a4a:e914:0:b0:6ae:a950:9faa with SMTP id 006d021491bc7-6c7d15d0823mr1579538eaf.10.1789543902286;
        Wed, 16 Sep 2026 00:31:42 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm5696661eec.28.2026.09.16.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:31:41 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:01:36 +0530
Subject: [PATCH] mailbox: qcom-ipcc: remove stray disable_irq_wake() call
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANdFqmoC/yXMSw6CMBAA0KuQWdsEmoagVzGm6UwHHT/YdABNC
 Hen6PJt3gLKWVjhVC2QeRaV91DQHCqgWxiubCQWg61tWx+b1qAzkoj8JzzYR9GAT/ZT0jFzeBn
 bIWHsHHHvoBwpcy/f33++/K0T3pnGPYV13QDMntCxgQAAAA==
X-Change-ID: 20260916-b4-ipcc_wake_disable_upstream-28bcbd84cef4
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789543899; l=1453;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=ZyrfuVHgzNC+PNVJXQV98WMFauqBlawhDtQ1dt6HL3s=;
 b=OaTATW+9t4dQW4ufEg94XiS191mo0u4uXO+4JQKayV8CRmamhn6BbHrrCCGEBzbw9QF4x/SAx
 NRg/dOIB5QdAnCl0KYjqN5lYJQm4zKYJfLQcrwl7DLVl2imcsn42eUU
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA5NiBTYWx0ZWRfX3BOC7rtObTvZ
 TSGTF7BkM4rr/RnD5OO51KaRC0RpZ3yTQH2IEjdmpwar1NpIrLl1x0ffg8dn4r3wJG/NtERc+aO
 CpZJ60SXvWxT4IAomMn//VNxPKdpnP8=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa45df cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1FHrmId7_miOwZ4Rhn0A:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: 1mSwzGo6-GtOPzeLLHG6Y2lPIKrv8cz_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA5NiBTYWx0ZWRfX2qLUSKkwXS4V
 Xra3M5Kk/8LsBEsk4/ZwcgTKuM5Pn7ovUQm3EbT687A0QjmTpoQhOudaliVbHizk/OtvZPNgooY
 pUYCEFrlLXDNpgU2J4fIcQxyGcP6GlQUBPpdixeI/Q63YptN6T301Ku8lFuCDYHcKdXo1TRPpp/
 iTChiY5DM1DO0v8XUCdDdNvhF5OwWTAVwX39ZwdHPoTVqzO75fkXGYGt/AYUZPAjh8ecXxF2W6R
 4IC2Xq6ilj8LixM2azrcJPZncaB/kt1EgHHUmLpOK2araAVTVE5wRZhukOMEvcbvj0FtOHdxO35
 UwOFLAklQKfg6tig2/WX1UvKKx0ldnFjeVnpz5FXSdC5emA2rvgr2oPa9Gj0OI9XnglI2pM5kI/
 hG3VoE9Etg69FJ4nUYd4wkV91FswxkuCUBscJQEeh6KBePRrQaY4MxCsIEdHFM3x1FEM/S91OAB
 UzX3lCz0mStXwih3b0g==
X-Proofpoint-GUID: 1mSwzGo6-GtOPzeLLHG6Y2lPIKrv8cz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160096

Commit afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up
from suspend") replaced enable_irq_wake() with IRQF_NO_SUSPEND on the
IRQ request, but left the paired disable_irq_wake() in remove()
behind.

disable_irq_wake() decrements the IRQ's wake_depth. With no matching
enable_irq_wake() left to increment it, wake_depth stays at 0 and
irq_set_irq_wake() reports:

  WARN(1, "Unbalanced IRQ %d wake disable\n", irq)

on every unbind. Since there is no enable_irq_wake() to pair it with,
remove the stray disable_irq_wake() call; IRQF_NO_SUSPEND already
provides the intended wake behaviour.

Fixes: afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up from suspend")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/mailbox/qcom-ipcc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 185b63f724d4..759577055671 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -348,7 +348,6 @@ static void qcom_ipcc_remove(struct platform_device *pdev)
 {
 	struct qcom_ipcc *ipcc = platform_get_drvdata(pdev);
 
-	disable_irq_wake(ipcc->irq);
 	irq_domain_remove(ipcc->irq_domain);
 }
 

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-b4-ipcc_wake_disable_upstream-28bcbd84cef4

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

