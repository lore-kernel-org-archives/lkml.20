Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797612;
	b=ONXZFY2StX5a4Ptp9k2l42yz7709cK685mCN7rxoP3wOFcIkBp6K/er+KCCB1XNR734j
	 hm1jC6+E1liS8cVsoldyR/dRwW0VNLXVqQcTi/vlAntltYR1+Pder/Zwo+XVXpnuj+lDz
	 KrlMhOViNhJHGtBqUciNoY18y4tRIkcVfhc1MftEjFvuPjEpSZKVDnk+grcdN3mkZLYqK
	 XcHGkJSXawpeS648yHJ+ggla85onf/mEzlcdxzLIFuT5PQTP83W8MYSLCBOwF4F5wKGTZ
	 UlrznZHTKZV+6t+TPhRAMbcGWSAhBkuE6AbEcxjG42cm9p0EWfGkOSjy/+kw7SmUQCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
	b=n1GnfoNbGfQ1FXzArfHozwHW6oF9BVcatY6udHPAWPCPpTLVeVGYOncsSA0WRULdHoOK
	 hopYxqG+W+UOxw/jLfcDq+1JyynT1W6ofvIB344btXgr3tIyrSA/CBqmXb+9TlskpogMN
	 PkYfhJvf4hw0v5oVsHLsvjials8voraBruvfozIlFMRbxOeR/DhERSz/vYP/T15zzjYQF
	 E9AywL55bK8f+2Ph2mKpGwojBAN7hz44cAYEj7+qdMfXAb1BuSaOHbwNrM0CV61HXwWoX
	 e/vbTTxyYYBSdLO8pdiBLF7pRGDfob9UecxSk8CrUYqrJ1709CQxAHys9VzKNisJvdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BdenOtPv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WvjFykNq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B607606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B607606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BdenOtPv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WvjFykNq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv1112495580
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=; b=BdenOtPvNGQ88enF
	mSltnFeNBzigIkUNVQHANOpwbXdkWJyH9wzXgDcRmVe0PdLbp4qrzLRsEXhtAJme
	7L7Trw4CKtpldjkV0lpXiZSQVU0705H4m1xjMkEsjDRHNyQFnmenrPxrzWa9Ersi
	dRPMYNI7DlBM5NKfjqx1iISnhvMJsmByvrpIBJ9hZa19tbv4J73I1vq45hPLGky5
	jSrWPXKTNY/Nmvbq+LSq7UyoZYtlJKSeZ/LRbvQMTNz6jbYuWnfCzCPqAxHJxnRD
	daKdf3a61vTO4Tob6h8nG/g+jzdTPlQacyOIwUHKtfUJz3XfAK2PxLoA6PQVpCvD
	Bnjm1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr08vav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so93768585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797610; x=1793402410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
        b=WvjFykNqmqkdTqs2JIXCnBWEuzlb1uSKG9tV+VjdbuO5ARdKDD89YnzwDxV2GuX4bP
         wpiWYWCF6x2yU1k7VsI4eGCQios+e1Gp6nbCLXO6gVC35q0c85Cuow01unDiICnUntJ6
         GtiPIxWJJgS8nEQfAwzTEjOjGMbb5um4uR/l6+aABYWfBYdTmTtKqztbqJvQR+K2z07r
         Wu4Zl/nCP7qZlaVFJgN9dzcacm5yQHWYqU0GqNXyJPwguXCR4exm2ElhU9RWfLcUSHYB
         fy5NtnX5u8feY7EI7/H03ihbgWEs1drvvws0vZR/f++q/+UjLZewwHPHirN4kENDuHsJ
         JjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797610; x=1793402410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
        b=NOrgphjNOi1MMpjhFdXmuWav8bGnDLZWm8ny4s/RxdXhiAimU3INfh+3jFmOOLRzXc
         d65IrVWhLQ/+tb0czWJA1nJe+2CZYoLYw0bNBK9tc1Ajn58GjdpuWj4e4ygdDn2pZgN5
         lPqXGOQst5GHM6x9WosNojix1Sq+H8nHYYNJCGxD8MQ+qIUVsH0Pfua1sU0r5dm29/Zj
         QMz42XhOEPNjUYMDF7YVX0ee1nokoAmmUCWOrZqO0iA9ccanGGW646gC1NPOPQQnpyrB
         38dmaNFrFGFTTmhV6mGN+rz0YgodIsKnUmsTGUF8seksLKF/PuLW1/jXLclkkCvJrmQI
         CYQA==
X-Forwarded-Encrypted: i=1; AKwUvBztmFdr9Qo7+j8oRNb6fivd7imRbNz3HIQdAQKCflAdC1sPawFRNp3CVWWPHyd9JBDJgHb0y+vU305Un+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7vvyA50h/AYQkFRURsjlssFtsVSN5tf9QP2wPYfVBpi06K6vF
	wExSbnw/RgX4+qAg4KVOlMCTOo2pbJv8gUu+0LFCb073O+gyxcEinosHoF9K2K7bp/UqPbgwM9B
	Mi0WqcgsR8KPgiiYdmSOPv15yOnsT4nk22Gg91RfXnADs8L3/oXhE6QFK4e9GAHQpqyA=
X-Gm-Gg: AYBFou0OdOVjXwT96QkggocOKRHGo56/cH4YXWTi4gKzHjfTJ61MClsjrgb2JbP/T1R
	K83Zdl3tnNTj1idiQGgPuUm2q6qGgxl2dDOMZqZ/aRweqKfbNFEuG2M5GrfqB83/eTw8Y4UKz9q
	21ZcEdVH7AfRDncMg6EjO+Lhh+onr296V3OomOofnFQmUN2zJQs3rgspL7vgsPVFxt67p2p6OuP
	iVoDaWKfDp60p7bAjmpgLojcH4i33NmDwe/cpLnLiiUvMEoaW6qOJtewRqyw27QkcuQ+CyQJUnz
	s2J3BbOcw6yOGa4Ki1nRq7cM49eX8quoA2wKWf0UedlA7ODnIlXUHpcV0ZU7KLgL4cM5EWlzJOU
	sdRzGLxDMByTquwssR/KS/qOO2yzbhvuLr5bIT9wORYK/dOdWQ8vZFH5itszQeotZoUZELBLvCb
	/0gAaTltYE1D3H
X-Received: by 2002:a05:620a:2955:b0:93f:611d:a18e with SMTP id af79cd13be357-940ef913527mr82731985a.55.1792797609543;
        Fri, 23 Oct 2026 16:20:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:93f:611d:a18e with SMTP id af79cd13be357-940ef913527mr82727985a.55.1792797609014;
        Fri, 23 Oct 2026 16:20:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:37 +0300
Subject: [PATCH v3 04/14] drm/msm: order the display snapshot sources
 around its worker
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-4-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3385;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iM9tCgrXdMoAc0lpkEnlYv/1Wi0+ANIcrUxdVoj0Zoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uQ6bCAvbaHcUOf6zm4fkNhaoPgtnI4zjMEC
 UZfQ4tZd0qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrkAAKCRCLPIo+Aiko
 1RXaB/0Y8Lonvh6jZWrcv0URyoAS1bINrba12P7NMwDxQZfoRpbYorwdGNjkccMf7Uxq4Snd4hF
 cgOb5fJB0c5EtcNIjBwBVyIfFB5J1ZzUAREMHFvnKyhu1xV0jKOQyGEpszJPOa6PZSpmyq0eqIJ
 EoPvxH2T/s4kFeBdpeqJi0B8kpikE48crpwJBGdLSdE3538wcVtRO1nNwukiHCtPuBJnGYhrH+/
 gl8jI35CLEEyn9PNmaSEcAxscTQ2ntFXVDqJN1ysAe03SIAIfv5pI8WsftdsIx/n+dHzEy7ROcl
 F40a5Y1QmHJjjZzXnn1MTRheZVTda8+3hmJ7RwbITAhNwv7k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _D1E23D2U-sy5B0afzBaGf3HL53t3fwz
X-Authority-Analysis: v=2.4 cv=FM6OVOos c=1 sm=1 tr=0 ts=6adbebaa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RYZzOHaK-VtI4H7RTV8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _D1E23D2U-sy5B0afzBaGf3HL53t3fwz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX+HIOC/0XUo+I
 7NdHGqTkcx6iz4eFjDgKfjptLKmWX0ezRwVA7pUcVYELdBSAGz1P+UA8ECsR0ybb0M6RzYTrBlV
 VnCTOIE5Remm63LEHcQicAvhlxjL7cw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXzYFqtumHBplH
 l+sCi28gk0cMzVSZONxlFzuohSh24j7zESMDxm9ZHgBOov9tHFOprwtoY9gBJhAiu2khX/NEh3S
 lkXohWQkc7Swlv8pzdORLOjORG6YddDqSplPFw7KOjwcr89zSF6BWWsAeAscff7IQFCMH5KFQnn
 UIhWpQUCnLU9sfo0PfLHADfMAxBWV1dRwJSunRCXB1oQ4+VCr1maFPWnYbx0eF8XgCwCoKpZ3w9
 5URt3nLp30XDGec3kCqqeQ5Cq2O70fO4UUkOCSNFqVBovbQSDYl0fqWzSC9WDpmPsrxHmZA1SGC
 gg48CtXBSO2Co5NoImTZh3tk9s68MY2mpbz/LSPCDCd9kxes9+pYLMb7SPv+c1N1O1E3WcD8zT2
 UaDvpTmWo55rQtfm/e1GiFXGP+PD0GyUct7EaLnUJ2XDbZHitq94DxWj4QtbYxZ+dlNevvJTCAO
 QR9Ej1WMHMiGXPvFDDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

The display snapshot work is queued on kms->dump_worker by the IOMMU
fault handler of the KMS and by the DPU interrupt handlers, but neither
of them follows the lifetime of the worker:

 - the fault handler is registered by msm_kms_init_vm() in the middle of
   kms_init() and is never unregistered, so a fault during kms_init(),
   or in the error path of msm_drm_kms_init(), dumps a KMS which is
   still being set up or already being torn down, and a fault after
   msm_drm_kms_uninit() queues the work on a destroyed worker;

 - msm_drm_kms_uninit() destroys the worker before it uninstalls the
   interrupt handlers, so an underrun or a timeout in between queues the
   work on a destroyed worker as well.

Start the sources only once the KMS is fully set up and stop them before
the worker goes away: register the fault handler as the last step of
msm_drm_kms_init(), unregister it first thing in msm_drm_kms_uninit(),
and destroy the worker after the interrupts have been uninstalled but
before the KMS itself, so that the dumps still pending run against an
intact KMS.

A fault during kms_init() therefore no longer produces a dump; the KMS
is not complete enough to describe one at that point. The handler is
cleared with the kms argument left in place, so that a fault handler
already running still gets a valid one.

Fixes: 2ec5b3dc18ba ("drm/msm: add disp snapshot points across dpu driver")
Fixes: eabba31a839a ("drm/msm: register a fault handler for display mmu faults")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f3e39c3907a9..a94d2888a21e 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -182,8 +182,6 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_de
 	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
 	struct device *iommu_dev;
 
 	/*
@@ -211,8 +209,6 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_de
 		return vm;
 	}
 
-	msm_mmu_set_fault_handler(to_msm_vm(vm)->mmu, kms, msm_kms_fault_handler);
-
 	return vm;
 }
 
@@ -245,6 +241,8 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	BUG_ON(!kms);
 
+	msm_mmu_set_fault_handler(to_msm_vm(kms->vm)->mmu, kms, NULL);
+
 	/* We must cancel and cleanup any pending vblank enable/disable
 	 * work before msm_irq_uninstall() to avoid work re-enabling an
 	 * irq after uninstall has disabled it.
@@ -256,12 +254,12 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	drm_kms_helper_poll_fini(ddev);
 
-	msm_disp_snapshot_destroy(ddev);
-
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
 	pm_runtime_put_sync(dev);
 
+	msm_disp_snapshot_destroy(ddev);
+
 	if (kms && kms->funcs)
 		kms->funcs->destroy(kms);
 }
@@ -339,6 +337,8 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 
 	drm_mode_config_reset(ddev);
 
+	msm_mmu_set_fault_handler(to_msm_vm(kms->vm)->mmu, kms, msm_kms_fault_handler);
+
 	return 0;
 
 err_destroy_event_threads:

-- 
2.47.3

