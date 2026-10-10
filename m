Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95908376A15
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639531; cv=none; b=FRRWQB7r83S2IVCc7Rh43tSigDV/z9l4AgPT2FerI+EAfPSOAchkOLB7xGK1lETPxQkJLW/qYOe53VBrsUZ0l1pLWy/LheW0vKth0XjEYJWrwo1Oaue6QDo33Ko3+Qw6K3ElKqirxWehqL2J+IaXYURjFbF6mgbhDAUL9riWneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639531; c=relaxed/simple;
	bh=XUyNTEFcipgH+2wGah1ib1FvGFg+4/irpgIv/e8LCDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIE13XtMBw7TEpEH8LaZd1VTjU2+fwAxXRDV6jIABmNy5z9RsVz/VCg2/NjnOrZrzs+0lbbjwfOGrmzTe6Q/LJzdmyGQGJkOUYRVAVGw5CQW0keCEEl+WqSoct/jPUJgRm6SxFkCvk+Pn1DJCgxoyKvsPv+x+fhoNQU+/G0Irjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCQgeTtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOOAPDlw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCQgeTtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOOAPDlw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACUeKT028245
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHtZNyMSXq0QZGYx+q1LRaidhBCNzKIUHBntx67BFgY=; b=aCQgeTtgIGhdrwiB
	YjmrpND4nMfQ8tj6qPSMv+MKr53DjHmQ162Ihg6mKm+VjodG3/kqXnLAUfcfP4ta
	0P+Bd0gZ2isBAa6RZ3LZNQ9EJbe2wUDJto3MQcFLyg1fkF/ZcLLa+PZgjBXyd6V9
	mrowKOXyl5FiJDd+mkIuMaXLF6TAnJZJZmBfcs/bBc7oZLZATHC879SmRxk5bjoQ
	zEBrmimG8sNJ9D+LxQ6BXiI79r/LpRHWNdQbrr8Gz2FXhhxMGOFzwp72Gzb7O1xf
	tXYyeI3i3tsE79AgOjH0jV6pe60wRn/WX1Imyp7BjuUaHD1uoenIbRGidvsTxT3/
	F1LZXw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4e9096-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3592749a017so44259eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791639529; x=1792244329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHtZNyMSXq0QZGYx+q1LRaidhBCNzKIUHBntx67BFgY=;
        b=MOOAPDlwHj2j+Jy8LmL+LRERbE32K+U+ppjYf12ODWA3PxSkLWXnuVqh1va/0g7REl
         aFY9HxcRXKo6YfBPYzRWfybZbIlLFUjECqewPk0jfG2qoSjaavCgM+PWKusDaj9jJgKV
         OjghV5YDx1rnXJ0PBGWASyEnijOC03rzMjeh5MuOilqrc4wayW/DCTyy+rH+abYbMkY4
         HY8IIEd1/503BaH65oLHJ7kWcY16eY1fyHsKY39ilXVIw6ZDIZFiqcXx0MrG+OjPTr8r
         OTjbpzohth1TX8Jis2Lvj0mCZg9sSeG0SsNWLBt2NHkmgpwHedRoAHOpYBUoJBNRfDes
         0T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639529; x=1792244329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHtZNyMSXq0QZGYx+q1LRaidhBCNzKIUHBntx67BFgY=;
        b=KXpS/9Pg+JkmvqdzBiHC4QFcI67MFnJ1SLpojSsqz+1Oou1gojOewaiOy75qRpMHUc
         J5KbrOmuSWDmTYA40DnlUG85FV2/MVbVCfhOvICqd2u5BSHwBfrZubiC0JTYzUFYY/9J
         gt638gAtUTAWtEzPAjJqchgd7W453XF7jOUkFDMZvJYq9Nq1J6rUoNl8pqBVV1uDKkYx
         7aErPNXmkrH6oT7dvIAZfSFuy20W7HrQqvSZhcmEiefLRAq8+h7jQYcf5GOXoHXGJhJy
         lV2ga0xh4D5yP8n0VOQe1AnhFhX9uzenGJqDP4iHFerSkndCbWbnF2OtKDmJPZdZPNYm
         XvPg==
X-Forwarded-Encrypted: i=1; AKwUvBwkTUWooIwYYsYylPHfOCdSNUsN9q2GOVdjjZitbI2uvjjCXTwr8cW7grSx1irkx6B5jLVHPEaj/0+3Ivw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZQhnyxieJjtaJFRuAAaFFyXJqeUThaDXLxCVEQf/vxBxGTGzD
	pUPcft66FBnNmgicEwNEsP5H0REy8w0EkNPjCq4ubARXaeH1cp2LUsQjAdYEf8Vb5Ll1IUpJI7o
	Jedd+9SiVeWGbO0l916wY0n7VkVt+YtUjdIBSURwBgE582lWKozH3NH1iRbmY7ljIqkVobjfzN0
	c=
X-Gm-Gg: AYBFou3qfQGNlquUG4JKBUvLRYvH43FMjqHtfLL301EG5FqJ+KZi53CD5qblqJOp15o
	SWO661vIyBmVFvova11jLGy5sa2wMlCHh69mDNi2kQ/JxghvmejsSsBssb1VK5s+xrlX7hWLizN
	nbuU8lJjOsk2h3dbDmmuSaciPNa4lqyllJZQ2YRPXtsih64SDMEBs9+i8vBqgYpKF0f19zqIdEO
	mRew3yy3gGL1/Kdad7WVVFihWw06isXx98TioIwX9I0c0S6irZbnsloO4ZNjz5jYnK5bYZTb0Rh
	11CszBPL7M8DpPIcpfMUH6tH75vFMoB03eO5r2M1tN+ZjQ1B7mc3EUTEKAlBVoNk4cQmHdeRGe/
	/Ab6Rewk7DI3kNIra9acQixdy2g==
X-Received: by 2002:a05:7301:144a:b0:351:7cfd:21d4 with SMTP id 5a478bee46e88-3537dfb8620mr5914347eec.8.1791639528926;
        Sat, 10 Oct 2026 06:38:48 -0700 (PDT)
X-Received: by 2002:a05:7301:144a:b0:351:7cfd:21d4 with SMTP id 5a478bee46e88-3537dfb8620mr5914314eec.8.1791639528375;
        Sat, 10 Oct 2026 06:38:48 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm15232827eec.4.2026.10.10.06.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:38:47 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 19:08:24 +0530
Subject: [PATCH 4/4] drm/msm/dpu: add source split order op for DPU 13.x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-pipe_order-v1-4-9d8bd29fd78a@oss.qualcomm.com>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
In-Reply-To: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791639504; l=1736;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=XUyNTEFcipgH+2wGah1ib1FvGFg+4/irpgIv/e8LCDM=;
 b=3iBVoMZ9oxmiDYlnLQzzE0n7Sdih9UpAJ/RQKw3pfJS0uwuZ7bnHGlVsXZ3DKcX5B86KKw9Kr
 ySwU6rpIqkyCS2JgoInLJ19uO1oHzobR+C4UMv7KI+E0N/SoeuVoEhQ
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX3dF4T/FJnVv4
 U4kkLx1ZDKjN8NVaeAeEJ7YpjAQSYvcOhn5RmVo6JwLoP56IdQ6aI7dBuzxEnnta3RKYxpj+sm1
 JVlkN+LwyLxF43y+ZEMgc1ZOTohrxHsy6TcYtKr55eMAxeHEn/+hjGkZjKpQ6JHwsovMGP0ATFv
 mueYmYr0+MZtLYtr0a+40dK772gOcnRArto7Iue3OrARSZI767Z9dWgCZW0bIZ5ITU93/ulRqS9
 VBmoAxRg30IZ8FJAI92G12A+E4Zb8jd/2fwJl7p02PVCuWnZTKl0AnHzgxCR24O284IKQb800sU
 FGciveTs+kZjJfgF7FE+t1IWSuMrW6H9B5Tl49xZg8N6D1ZdGvkGjQPj4QLdEkxepPOBiCL0e9t
 5/ZR5xmYSzslzZ7v5eUyTrOpS8GPMh5GP+1izbNWVMl+udH6Il2OZyRDTwZ7geuyOJIvscX4uLk
 2+7xLrfHUOEqagqZWPw==
X-Proofpoint-ORIG-GUID: 5kADlPJDUr2E09R-tOJlOmFRUIUj2qnf
X-Proofpoint-GUID: 5kADlPJDUr2E09R-tOJlOmFRUIUj2qnf
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6aca3fe9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mI-fRwl2AojlbmlKxQgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX+9ZXk2XyYXz0
 Wvb6bzMDtiD2RmI+rXhfOmNLtsWP+w6eLsJLDI3Y0HAyW8E9Vx+R7FckB9rHBRC7TuO/cEXrbi/
 e+YlujB0IWWjqLkFBhkW4vRUQi2Mbcw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100054

DPU 13.x places the SSPP op-mode register in separate REC0 and REC1
banks. Add the source split order operation for this layout, using
the shared helper to update SRC_SPLIT_ORDER in the selected bank.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
index f8f96ad971d7..bdf1201d8134 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
@@ -149,6 +149,19 @@ static void dpu_hw_sspp_setup_format_v13(struct dpu_sw_pipe *pipe,
 				 unpack_pat_off, format_off, ubwc_ctrl_off, ubwc_err_off);
 }
 
+static void dpu_hw_sspp_setup_src_split_order_v13(struct dpu_sw_pipe *pipe,
+						  bool right)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 offset;
+
+	if (!ctx)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+	dpu_hw_setup_src_split_order_impl(ctx, offset + SSPP_REC_SRC_OP_MODE, right);
+}
+
 static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
 					    struct dpu_hw_pixel_ext *pe_ext)
 {
@@ -299,6 +312,7 @@ void dpu_hw_sspp_init_v13(struct dpu_hw_sspp *c,
 	c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
 	c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
 	c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
+	c->ops.setup_src_split_order = dpu_hw_sspp_setup_src_split_order_v13;
 
 	if (test_bit(DPU_SSPP_QOS, &features)) {
 		c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut_v13;

-- 
2.34.1

