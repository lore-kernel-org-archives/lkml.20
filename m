Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB542C11E7
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987443; cv=none; b=hHm478dnBZEUIOD8FmQquFPpzKA1Si8B37IkSgC1xNEtrvhBlDiTj5/EAuTbADm/W16wI2laq80CU3WaVlYtxorg5C8h8LpmW1k+VMGHY/t72zKANKwoP9qQqLmlFI8VMuaMIrbs+0R2cwF3pItL13vn5t6NxaER9VuPFjVp7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987443; c=relaxed/simple;
	bh=GGiCoTigCncSjQExhHlehqh6DW7zeUi0eG81bX9nqSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHNCGInFnF0ib97lronZd6vSv533vbOfPnIhuSOigz9M3/Y86cYmIoCRHh1/WMqW6hiZlD5cxumco789BZzQiFVtJWv1OvuVCj+7rESjiA0UqCPIuAbeB55I0hFA83fuW3ees+m+7C30rjIrZ8STeDYi4jRrUJB0ANAUXe4XiIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNC5KUgg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVSgB548; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNC5KUgg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVSgB548"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeAxX3337217
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=; b=CNC5KUgg3fx7A0Z7
	+hHpEBvxYuCPWD+0hPdq+4nISUSuTRsjpFas9BZtvfpGvEaMqzAtFb5lV/N6DX8j
	COg2iDsemtuFfteOTUYypEs2u7UBJ6RLEzm5cnEmpyL1SO9N1Ju3sRSeKhMAJl6B
	X2jkUntbbgVN4HEDPFQ9obq0CV4cAk0FQqRC65nb+zfIRfaUzee5Hz5W7ZQS8Zas
	T/JDl+gvZg3ZdM8nM+9Nhsv8QjhEbgC7A+z0FyWkfYw3TkjVglMLA1Jsy+PF6s4G
	J7lmE0+yxEyyNv6HJSh19MeZrNydzCQPUoGYEQCmjt3XbImtNg914TL4oUH+06Q0
	yxE/6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj033ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:30:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so18107585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987435; x=1791592235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
        b=iVSgB548vev1IcEic7yca7r8J6fcve5gPWu2AS7AeOInafl0SuOKG0ukbw/Wb/Ele9
         8ASepQfayVj+KRMOkSpqpWBisfjglGFPU2lrgf60y0c0OSqv38soHTs28yfnBhdQOXrr
         X/NTfnDUim476HmOGZhtAA6X+ssv7VineYler6wTGjkrhNgy3WqM82H7+OFx8wxCmdlh
         QJ6i/1adP9hRkgcCl7prCu2d07tZPGCaoDVvl6MBG7WYOZbkRlxZHz88NQh+UBrwnywp
         V1XJ0xSjlE9t+rTBBQIspcVSRHQ11s/TbiXMICap1iLqkuQog916bWP0omN5epL9iYWL
         G1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987435; x=1791592235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
        b=tYXe+h7EBZcUlxcvV8UrdemnEEOGPfpw8RXdUthtT1ZRiFEwtIR01rpyFYtbClU0eA
         P3KL3xG+OuWs76vc9CYYIi7+TkQzdaa854IqH5CnUpqzbK80FNVJ34RjX5yQ24eh52Id
         +fdfLPy0qjy908kdS4BDc0uRe2pxPoLYdHJnCBw4bEuhxIQRfZl46PE8LDoYjwH4/YHA
         K9BcRaFpfEGdkPZTCTt9/KRRR7gnLr5YzHTp7icCtmPjqx3C/NECBpG/fEZchFlvYZ8w
         t2x+K4LfRw3gSQiRJjjjqPgO+obso7rd3hdYuw1IGoXhtT/SofYuHb2BpuFfDfls+D3u
         ZW4g==
X-Forwarded-Encrypted: i=1; AKwUvBzMADfw1a+3lzv7KqE47PDe8uqFozIiLTm0MhUjHfLnCwFJNYEjMRHmSId+XtIt1S2PhTMfYh65YIUXo3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n5CFLX5ffohEOkupOM+3c6WjcQgwj6jhuYheNG+aaZO8o1/Izv
	ezO9VZ2rRskRN8aRBhOETxuAfhI+g5yCVgDEs0dUf4lNT8JSm1QI0rXLGAAggY8xKeIQF+39+zo
	Q8/SI9DJVu0qM+d20HKN6t+NcBFi86DCtcIq0GBuG8KBbsiHU58bsgm6vSUT9zL5iETo=
X-Gm-Gg: AYBFou0ydRRIdQHBR6HlAz8gHC6OWB7uhGHh8zCKM1jGeaP94jipKCxYh5IydfjrBdC
	o3NIKtqXuVNFjtXibJW65A7vcY5DSrVUIEZND62yVN5s1XsPxbz7rzOPv4nMzfX/DEXvXUi6Ium
	lDEluxJUo+csGXNNPZxn81pYEkknmP+2iGxwYP95wv1N+rKgxQnOQndzFFbkYJoxvJkrEgtGkGB
	eetlWhIyMFxlDhMJffw3FzzpgktP3a9KJ1nwWM3t7bVW5qSRydvm+R5MJ+2Pin4CPnJl93c/qR8
	+sroVm84WqD34BHlUZJhnrg3srxEnozxJYVM6Fc3o6srN3dasV0ymfDLJs+Oj8PuCOUfPQJIWe7
	b19WJBpwWihCZrfvrpk+AotnLoW8/GdYDyap8omWabUg+ym1rsHPulEJTIeV2FR5SEc/aN6Vloy
	b4i3zD8nbjm+//
X-Received: by 2002:a05:620a:7017:b0:93c:6e1d:96af with SMTP id af79cd13be357-93cf18b5676mr821632985a.49.1790987435164;
        Fri, 02 Oct 2026 17:30:35 -0700 (PDT)
X-Received: by 2002:a05:620a:7017:b0:93c:6e1d:96af with SMTP id af79cd13be357-93cf18b5676mr821627985a.49.1790987434697;
        Fri, 02 Oct 2026 17:30:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:19 +0300
Subject: [PATCH v4 04/10] drm/msm/mdp5: flush the interface before starting
 the timing engine
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-4-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGiCoTigCncSjQExhHlehqh6DW7zeUi0eG81bX9nqSY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEydEynMF+CREcOokKOoCJr7eUmaLWS9JqE6d
 CaNTF0/C52JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMnQAKCRCLPIo+Aiko
 1bsBB/9Usie+QA+ncwjkvmJl7/35DiD3s+wpkPAZT3Sbw3UIiyVxWeJoKeY1D/G2GNtFJu9FrjU
 EAUnso4T3Q9s9V9yKkJg0jhjIG2MUzP7kBo/V9LvPLSWoc2el1kVOMj4+H/LSLxCxP+zbbMPds/
 P7ZAWBh3T+tMLYYNEyPmNTUOo1bUGghVikMSsecG5yIRRyqZuim+GkFdUjLfwdZFPR20pPBdp80
 mwXYk03hTNAy+0Bx3jbadpTGpoVf19cLc5MuwJgpdHkGD2QUUu8Uw/qT81z8FJZEA0NecXA+9Sc
 yvqJKMcz4XJP6quXt5VYbNcyOHuJDks3ud/PZVp9+a6fFVzP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXyT/Za+fwlpHC
 U44BH5/vu0n6tqKXEKx+beF2YDOEp+pj6OtEBqQasAf1SwU9+xg/chMK8Mx7NFfbnJnQtrwZm38
 q8+S9eTF4BRjP6z/+Va99mAun8DIo4A=
X-Proofpoint-GUID: FbUG0NBl5eN33TZKaJpn6qr8anPTTrsF
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6ac04cab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=H8EOZ7U-Vh7qnyOv3DwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXx9OmqoyvUPt8
 KJ35QQvCaeh3NOyRdsrGsGnrv4+xG9NYoR5dt70Tc8F1YTfpmrqiI28TevQDUiHCpZ+3ZIFWPba
 w61sqGuyrAObg9xP66BtKuZe5iI79akZrVi4mYItAkogYwious4pCtgPxNe0UZCXGyhd8ZAfS+N
 E0jTWjX3wvcx68exTMhVXVtnJGhwVdnnqcxe/qWgfZLbfKjSNWiOXE4uq8ONwe+K4VmdEidUaFh
 hPgOEwxK87g4fnkCG5EataqzgrbQmFLi+CX8idiMTNlTIBq0YaNwFx7IicaRqQtdwJuFP5GfeZ3
 iBAHIWQuksTNocDunCPIkgRvhs5CyKxZj7zXWjjYTElCxWFJlC5m6K4eJYz1SIlFD4CL4rnqX//
 SmGYDjaBF0x+IgyAUuienjXnxN8T37QD2dPRlDaLCzhHbuB/Lc1ysDUwoBlWzRSGIEvpB3zi+//
 MDQVWJxDpvkVPR70EOQ==
X-Proofpoint-ORIG-GUID: FbUG0NBl5eN33TZKaJpn6qr8anPTTrsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

Disabling a CRTC and then enabling it again can produce an SMMU fault on
MSM8996 as soon as the timing engine restarts, e.g. when fbcon takes over
after kms_atomic:

  arm-smmu d00000.iommu: Unhandled context fault: fsr=0x402, iova=0x01fa6e00

The faulting address is inside the framebuffer that was scanned out
before the disable, which has been released since. The pipes keep that
address latched (CURRENT_SRC0_ADDR still points to the released buffer)
because the plane removal flushed after the timing engine stopped never
takes effect. On the next enable the pipes are programmed and flushed
before the encoder is enabled, but that flush doesn't include the
interface: the encoder enables the timing engine first and only then
flushes the INTF. The first frame is fetched with the latched pipe
configuration, from the released buffer.

Flush the interface before enabling the timing engine, the order used by
both the DPU driver and the downstream mdss driver. With the INTF flush
pending, the whole pending flush takes effect when the timing engine
starts and the first frame is fetched with the new configuration.

Fixes: 06c0dd96bfbb ("drm/msm: add mdp5/apq8x74")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index eaba3b2d73b5..e9eb1db92775 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -164,10 +164,11 @@ static void mdp5_vid_encoder_enable(struct drm_encoder *encoder)
 	if (WARN_ON(mdp5_encoder->enabled))
 		return;
 
+	/* the pipes fetch the first frame with stale addresses otherwise */
+	mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 	spin_lock_irqsave(&mdp5_encoder->intf_lock, flags);
 	mdp5_write(mdp5_kms, REG_MDP5_INTF_TIMING_ENGINE_EN(intfn), 1);
 	spin_unlock_irqrestore(&mdp5_encoder->intf_lock, flags);
-	mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 
 	mdp5_ctl_set_encoder_state(ctl, pipeline, true);
 

-- 
2.47.3

