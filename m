Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640010;
	b=BRRd43EAq9gM+aKJ5XiObgz52dV+WtdY0N6D1vUSaPBL5nsDkgv7fXwyVNqaXoLlPK2Q
	 w+rfWYXhbLFzC8LgAcqONzotwZyRwgV4r1YjfAcQGRGyZnpr38DGJ/5n2ywiDWopsOOmx
	 3VP0i4X5TA1uWevsjMaSU+2j+8eMOoNRgX6gFIYIDqdJF8zkUrMUhksqCnqDRvLXn2fkT
	 7Wrleh+zIMksjNOChuRjiyJFaFu+spDzYq0KnekzV8fhPmbCsr5DbdNoRODOzoreD9cYt
	 Ek4J4XH4Vxahgq+mNcv/TXKK2qwNYwFbOzY36gFu5LWjc+it3V0u7uk/PF0+6Vq4Mew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MvyBPhX3FXrO0Az/fY17mKualm8a8erVyVPUaeQCugU=;
	b=2nM5sbq43/NNW6CVB6sePO0c/rSn6UDjEHjXHKFn1APAyAKr4YjEzoE3YcK6qdat4YKY
	 YWlEo5DyqPNCrYGDWtxRovg4bkks0R/zFL2IsRWPk4Ev15WUUVvMH3/xQXN6PaV97YbyZ
	 Ck7noTQoAkwc2Mq0Hb5iR5DVN/vvFWO2fOmRhyVQ06C0pAo/BYd8uQqfGAggEXPiviI6y
	 kC+kcKYwHWCUzt+plZvtgJoLpLzKoZC3V4Uc9dr08j8+98hax+/wSZdutD5x0yFiovz/K
	 EMRYxXkgoSRJL7AZVeWtapFVpvswYLTv0ZVOoadJvvivqBhiYNtHwe33b48Ifta4EAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BRLe1t/L";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgdPr6r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014EC6096238
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 014EC6096238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BRLe1t/L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgdPr6r
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZHV6215225
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MvyBPhX3FXr
	O0Az/fY17mKualm8a8erVyVPUaeQCugU=; b=BRLe1t/LFtTQtlIXteozw6MOBCN
	REU68L19mcByERTTW0XagIqobsC6PEkD6XtgRfY3sNFXdz0Dm7i5iKhfgPmthsHO
	hHZtau5AlhCG9arqdDRVjz9b04g6LZF/uBPjscLb3hNMQWaON3ZJ6tL/ZgToVdN9
	VU68ggxsZLmOOmKFp7Refl1mNTSDLxxwN99FQApWx1UH1z/jo8kdyH/KdGRGEalP
	VLc3IEI8CEMgI/bN4Xh0hTVerdHiZgMn0608mt5wmJBenxyXWABs3Oout5SVGXZL
	TyzvndfeUJKrdNw0TZOeF9tOdstvjY9f+Gzy8gt5aiNWnZDXkb+iCrUJ+3g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfeac97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:20:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso3709789a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640008; x=1794244808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvyBPhX3FXrO0Az/fY17mKualm8a8erVyVPUaeQCugU=;
        b=VUgdPr6rY+RxmApV6nWj3MTygB46wxIfanOkLkDIUlWk7wY2pnNGHo1ac+BUGZZd9W
         x099Etj2RgmHOBdu6JeAxljgoOOxNSfb5Tm7V1xF+evYeCkzYqmzi4V2JhkhlBSXrTZp
         17FzG3nenJWHT+cXoMbznG1Pb98V7cnrCDdR0MXVhI0cr5wL2G7N9cc53j6EfGXut/Zu
         klcsegOzzu5qrScFgMuClRM1+cDAVUyKPMzxJSW7T9SluPgmEmcz1ig3psKSNUfbWyRv
         xcsq4bUHh7GlAYAddBazhlc63payx4szyZIDaGGNk+SaMKcXA8he79hcD9bgesH/WIvi
         bJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640008; x=1794244808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvyBPhX3FXrO0Az/fY17mKualm8a8erVyVPUaeQCugU=;
        b=EDUG6eZXSV6IL2BwnHqxc50dih3l2dVAJqnf/sY6uDaj1AvXdEH3fQ+edB0QPP8prI
         AmetaddrAl7pZFgI5tJyEo+n60pvqTG1UyykGUsWJtlcDOWfGA0FlH6wySa4C5E1Bjz7
         nziL2w/SsWK7G4krNIxPH81+OnS4AWkUYAFhTJmw81SIwRdr/Pae4eeqMknQF3wSwi01
         uBH80h8n/fktvHUXIqywGDT0lzlf0ZJgLcdZJQ9ovIOwnPhEg1kuSyJtfrqjx2sZYasx
         KthxnRibfqcCl03/rBvVhmxbe3U7tJwmbJf9Jj4umiEkHrIY4ZkWh4BBmTI7iqdA4Bxa
         yguQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLngvs8LGFBESXdbfcDCcNszzixXmHPs2vEOXgmzMGoq+md7gb00gJBSBxasCaszyua86DRRYvH+zrOCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cDUHcnhogv9eK5M4L2SH2BcwdjlVPveK990Dfr1fH77uhXpof
	eM3AfW2nvG/PZAol4Mi+tSnhdrqh1YDkQ1SWfi84lK4gTUmbxPevhUOjWghVVUf0hqIerjq6Umv
	v0Xx5D9AtKjg2fOqVzMx4ilaJwVuefb9dw5Zihdx11YBxH8DfsfmXDuILvBOWiUarD6E=
X-Gm-Gg: AYBFou3blEqrXGfiCRIzD3oSUwVwqjN+CEZyFRnbbcCJrolRhj7ooTVCUt6TxiGQgpZ
	pAVs1YC+HkvskUADcQq4M3XM81NabggYUPm4rvzdHfkkGQrh4BKyTGiAlzVjLZeXQWKPHPMiFvG
	0UabeLo7MfxYGGJOuQCZObGn0IqAdl7Pm4PDS3oTBCLEYDL4Z3HpZVk3/ffqWlkhswi78YUO30p
	YtEYQkVAWVZXQDkzpoe17UAvNCGHEN0ARQ+1/GUeWqOnxGwJ4MzzMFAc65nqBGoJvWpkZk8p84y
	mgyOsYgSbhy2l661U7wrfsrnk4siGRS4gdELWTPrGVVZpc6+dzymXf1sCnOqotKHDxh4NyoMj+s
	L94DTEKcE+U25al84H7r+bFnC+9hgxq1KFG1cHq4nQhXdXAx9T/thx9P/kWB7mAkF8zGQhLqn2o
	cyrSnVfTZW/5cLfODiD+zOPw==
X-Received: by 2002:a17:90b:33c1:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ae89751035mr9022454a91.32.1793640007603;
        Mon, 02 Nov 2026 09:20:07 -0800 (PST)
X-Received: by 2002:a17:90b:33c1:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ae89751035mr9022428a91.32.1793640007103;
        Mon, 02 Nov 2026 09:20:07 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm89644a91.11.2026.11.02.09.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:06 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/4] drm/msm/gem: Fix VM_BIND range check
Date: Mon,  2 Nov 2026 09:19:57 -0800
Message-ID: <20261102172001.508440-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8c648 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BFYDg4fWK-pXFiMG0zkA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfXxLtS2ng5/Y8P
 7xOdQufTOVsxxNJVAr3j0ffFpHwY74+VVI8oJABmz1Nop/mia75NYRBSev6Cf0M57nBsbFZoTqT
 2f1hroMlPwQVVcFrwd8+Wt1ogyJ3rEObpXEuUTX6JDbBRw9H/m/eHDoiIGV8KorycvMyD0/ZqYG
 /poyy+yQkClYoWU741FRFcpD51ydA5tUEaqr0x/di8cw7RQublAfoA9lq2IxZsvJBFeGCb7Twqz
 dNxPynaZujh25EATkY1EN1D/8jULkJHpEtP5/yNHMmMm9tJhsT364sPyHZra/BpxKx6i9Hb/Z7n
 7rhjnFPLIPNkgvRpGFSevZpKI2WO93wKeXxP3rJo2rO3khxOWONwjVDrnEtjl9WyT6uLclkZUYQ
 HF8RN8B2P5Alw3DeSjaSe9EIcoe70e9GQDwAD48w92oAuaOInNAlL7o/hW6/qF1dsXwqJdEZTAr
 ZIgkFSavBsnzwBRshag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX1iNBe1q7BChW
 ARfeE2uw3NXztCcqKTL/IWmkhHPLWEk/m/sq/zuwbj45asITNSlAlckg4wc+qA0Hjcyq1inWT9d
 wBOIP41FNO9uoBbv/N4ronXZ7Owo0EQ=
X-Proofpoint-ORIG-GUID: cZEdGo6W2gmvP-N4cavpLCqmoWueRWGd
X-Proofpoint-GUID: cZEdGo6W2gmvP-N4cavpLCqmoWueRWGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020069

Use size_add() to guard against overflow.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index f687a629629d..bd1c3ceeea51 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1012,10 +1012,10 @@ lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 	if (invalid_alignment(op->iova))
 		ret = UERR(EINVAL, dev, "invalid address: %016llx\n", op->iova);
 
-	if (invalid_alignment(op->obj_offset))
+	if (invalid_alignment(op->obj_offset) || (op->obj_offset > SIZE_MAX))
 		ret = UERR(EINVAL, dev, "invalid bo_offset: %016llx\n", op->obj_offset);
 
-	if (invalid_alignment(op->range))
+	if (invalid_alignment(op->range) || (op->range > SIZE_MAX) || !op->range)
 		ret = UERR(EINVAL, dev, "invalid range: %016llx\n", op->range);
 
 	if (!drm_gpuvm_range_valid(job->vm, op->iova, op->range))
@@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		op->obj = obj;
 		cnt++;
 
-		if ((op->range + op->obj_offset) > obj->size) {
+		if (size_add(op->range, op->obj_offset) > obj->size) {
 			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
 				   op->range, op->obj_offset, obj->size);
 			goto out_unlock;
-- 
2.56.0

