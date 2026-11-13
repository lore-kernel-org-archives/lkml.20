Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596042;
	b=G7D+3zS8RbDEOgquf6pHeOE626vGlBw86kbLrIjnBkRJBDFX7xq5bVXl492GFyzU9+JS
	 OIGKxF78KRtTdq+MA1tSG/pNqWB0sZEGsjOWAfLSX3IFJi8En2YSRhMCLUPDt4ezJ2ux0
	 p19p8YzmGhSaWNnPyFa6t/g1aS1zQ9d2zmLY89Bc2Qr5chGZDXUyyxw1h3DhMe49EO1FK
	 dbzEpM6jvKu9d3D6luqWcRdvEFRgyhANgcWWsnAdR80tWt0fu0Ab6Mr8nAYgEN0voKjzH
	 l1mSfdlKWJqsa46+qUqzEJ2rqI2zhOY1X4xurfMaDbC80ADV8As9W4R2RVFV1k58Jkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
	b=2JGFQPInWRuaCD2BJs3TdaDepRYdDpvf1mK6Q76poF4JzB2YNTGvgtL+XpEJOpKQStYo
	 sqJq2/sllBJvjLbfcwdB7LhsAa3jvdz1wmzW4oi2PLRcKKstWIkOt9SB4VBL55zDYkaSu
	 eh3tyrKAqqz+kEjPCKhhZcDlTBNsK7uC1RXMxge89GFZNPrPFaTESEvGT2/AYumIwPA2f
	 LKWpB6kzZ8xf+ACxz/3sEFxBfKoXCwiwEvRyvWNmBauBWeCSnArXI7P5JwNK0rl/vmMaM
	 VhUV93Is2cOBaO5h0AloszBi/8PZxxqUldD7KZ0TqH7RSenwBe6VmeNaOn6b/Qlco3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSsCY0NT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GHytcXNS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC30C606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC30C606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSsCY0NT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GHytcXNS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR2kE075723
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVUhyr3d7Ss
	o/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=; b=fSsCY0NTXlvartabOwFgIj66jdN
	vofpr4TxtrxMNECIXDDGSBZ4KpYyrhYTR22a4EUgWcuv63U/2PTmqs3ULD3CkdPq
	Llei5ZU6jj1qUsTDW631MVD1FiEcIk7BQEbbw2+tXuZvKSxPCnai7kZRuy207yFp
	g/UxbKZw+JgwPOOa2tGSsHsdNgn4ZSMYLFMLBUb9CY5SdSNZ/md3q4FowwvrWQKp
	6YofDJm5ghJqsl/s3K/6TNRLLGFC+vjjLTl2MNEvjT8WdHKvcGnAcD7dLzUVRcSC
	tqqiMB1Thm7dyOl+aYwTpeuEMH1orm+iu8pz5ekAhw9DKzxMoOelPQWr0xw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu3xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso2684475eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596040; x=1795200840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=GHytcXNS1MQzMJvlBcVGI1AiUYKMnPmJJd7p6BzDiqHjFWfj7F6ubXp0X7U1YN9e+Y
         3BjUOQTU1y1gY1GiclLWyYwH5r+ooljMRyzlAEn3yRhn8CPH5IiURq0F7FTsIQx94Dna
         tjSWVgTr1D5dKwGEwEfdEhCEzM3U5VUPALZl0pNjauTNYOqF9jMru1U6U0OaVe55aMD7
         noX31il3Dp43rivD+euuvU3MMzaaKaVi7hPX84dNyl63mRSc+8DKPutjKqQSicPYS7Y1
         tXkHXv9JzpYFtKcuQv5WwJcGiLkZwDoXTyTN8JLD90LI+Oza4Eay/7jgQT2JKtTsVKI4
         J4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596040; x=1795200840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=nlqnic8bpcbZMBnn+toNHDSe1lWXzSRWg+l3IUvHQzldzyw8oOs3gMjs8spcet2dPu
         bLaOyqKVigejgs0460VUBTKnzz7WMd/+i5W9reP3V88vEAoTel+l8tBVD8qogBebQQRG
         Ao5cN063L4BDdkPWV6KlQ0FpBJ5D96n3GDQHtxABU0XVj58XQHnMHQhCgDKEIMKGInv1
         m4DR6D824OoVZJPHLuL2HuaPwBJmtfjysPUh8Zn6q2upNBkBanpgCBm6VmUm34y+7+tj
         M75Qn7evt752US9IdQLx14By3VdtGERI6DjiBDrOxGLR0cHgrwYIlr9OqwO4YBjfgEyZ
         asyQ==
X-Forwarded-Encrypted: i=1; AL+hErE0WEi5rs44w38UYGQhSRFOlVwal44ibQI8sjKdC5peCh5xgcGCc/MpjG0qh5WhO9NPpNnXmW4On6bfrJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WgjQZ4bOuEnW0MOt1frwzSevjzEQKEDyAY7ESV1Zy+4Ar7m2H
	BoRVGRmq2dkQHD3JDxX8AZtY2uCzfhcEpwYvLEACUNkVU4rhgSzE1NuiADVaTfTiw2RzD7pymBe
	/1/gbCNMTWF70jND/SOj6CM6GX7KjpMb2fIJaO5Tg2n831jKSahEPwW2JgkAIIJJSu+8=
X-Gm-Gg: AYBFou0Dmkuqk8Wq7TaqFPvLdRPRNr6Bs8edTMDfFglisT5ydqfLZpNz1xKGOUAWIAh
	fnocrxOzMtBYrM1wUlRjJk/JxXRCzXdn8ANpJuq3r7OD+/skkyu8Z9Zs8kRAVU1uHjzVd5bu8v9
	yt93Y4Qc3MSs0Tc8jALkRPzL9XmsrWWlsyRLP6KqPgzLfKu1CVJRAx/UF+blwhyV2y5E2T0yrNV
	QfHi4UA8r+KUkOPqHx/43PHrXoncISjN3aXBi4OecTYaW3WcNt8qlYGFf2SqfPkK9k943DtQ/QX
	x90nObM8RL1tSFA9pHGoOe1DxU7sxr+pUmBXLVsOJRjgUksZ51sFvBCnr3hd0X6gHVAK5yVCmMi
	ZrCsaZH4lgMT5Z4kilBcGsJk0kVIt01qeL8P1yW1LtdFWqCcLi2KInpyzEEQniTGRLGG7kE654Z
	k=
X-Received: by 2002:a05:7301:1c18:b0:375:b560:a323 with SMTP id 5a478bee46e88-3796365f033mr2852000eec.1.1794596040390;
        Fri, 13 Nov 2026 10:54:00 -0800 (PST)
X-Received: by 2002:a05:7301:1c18:b0:375:b560:a323 with SMTP id 5a478bee46e88-3796365f033mr2851980eec.1.1794596039826;
        Fri, 13 Nov 2026 10:53:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:59 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 5/9] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:05 +0530
Message-ID: <20261113185009.157893-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: C90RfW2Zawg6ciOWMGxcSyO-8M5EdqL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+V1bxQ3/8ROf
 VFRTu3p5Z8j4v2Nih3inrHSsvhlI2GnJ9PfvjIH+s/ahlurLsrhzFg9qJ5LlTcDTeff0eOKD1QX
 lqsF+viENUA99T56SZmL4PhzLAF4yaKbOdvLLfB4tIzQPPvqItbqj3BRMEGBFUtB7pl8bYR8XGi
 xyqbffy7lYgVG7DnQxTlLGtfHaSSRYYxDHIR81HgQbf+wC4K3gtaI+OgZC09UtNyYK+LnLXkLdZ
 MB/mUWbFgCHjA0rwFgaXoSycAQcv5SvHv6GvuY37u1ahp/NEUP1796WWpjL706XztwJRtdqU2xz
 G2bSh65l+uzxjS5+RKh18dS4Rn4fGSkyc4aa//IuJhjOBbP9ABOYmFM3aaf2R46wEj312Mkh4Sh
 rQuItg1pejtydQ2nJ8ckjaHilc17y7dsqhk7Bizl8hiyctOEfJXJ6X9PAwU6io8BewYrPLA6ROO
 8VD61tfRNeA/d5GI9dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/y7AGyeD2J2D
 h0/naTW11KiCx4wuaONTyL7am6fD7T8CC2hRiku67B9mG9uRWhcRxIC+/Tyg8B83rPlQQOQpFVL
 +IL/Tz9iuJ5qEq03qxP2cenifemUWwc=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af75cc9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VuDNxQijsV4jnZh2Ru4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: C90RfW2Zawg6ciOWMGxcSyO-8M5EdqL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

venus_load_fw() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
for TrustZone authentication, which is the intended behaviour. However, a
new qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Embed a struct qcom_pas_context in struct video_firmware and initialize
it with qcom_pas_context_init() inside venus_load_fw() on each call.
Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 93fa77f05834..84a0d4a8426c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -228,6 +229,7 @@ struct venus_core {
 		size_t mapped_mem_size;
 		phys_addr_t mem_phys;
 		size_t mem_size;
+		struct qcom_pas_context pas_ctx;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..704343e241dc 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		goto err_release_fw;
 	}
 
-	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
-	if (!mem_va) {
-		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	if (core->use_tz)
-		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
-				    mem_va, *mem_phys, *mem_size, NULL);
-	else
+	if (core->use_tz) {
+		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
+				      *mem_phys, *mem_size);
+		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
+	} else {
+		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
+		if (!mem_va) {
+			dev_err(dev, "unable to map memory region %pa size %#zx\n",
+				mem_phys, *mem_size);
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
 					    *mem_phys, *mem_size, NULL);
-
-	memunmap(mem_va);
+		memunmap(mem_va);
+	}
 err_release_fw:
 	release_firmware(mdt);
 	return ret;
@@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-- 
2.55.0

