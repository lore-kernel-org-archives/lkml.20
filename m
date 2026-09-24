Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3C643846C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235503; cv=none; b=PC5xVPeq/vi7j0ZJvBNB5urbp+XFE+CZJUNGNBQpGZa97GZlfqyCC030dt3nZO6g8HZGrHl1UhJp0QgCKAEqbLtPIdR4BDdPrLo6rN+u6qjvnZ4s56RdpD6WS27vwOayZ8MzVKLiy50TZiX4Geo9c7UZ/42A718xmh5Gm1pDBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235503; c=relaxed/simple;
	bh=8XXN0JGE+aNQHVmkja0kyVPhb+92/XFFTPds/Qxn2ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ipv3OhLyFePi8ljxqgRDdH1yi+K5RWzQNIjWza5USt3xIpS80qGMEKi+MY18sNMw8yYs226eCpaD9tI9MZUDHQ0xhIl877Q8do64XbF/GfxXM72WW+R8haDLk05ZtbcMcb2IKZ/EpqJZJZUKL2Q0WDhDniYXjnj9kMYtlIyRMMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvApSJIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ets1Npql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvApSJIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ets1Npql"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eDl44147343
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LEuz0IYkO3v
	v3NkIV9hKvUGxpNw0DLo4XFrqlBEvznA=; b=YvApSJIg26yiUkCIqtY49o2Rn2S
	RQZLEU/0abNuxebWy1i691/5YtILrNLLRVrmrdr0Zs/dvgXDOj+HT1Mx7i7YvCwt
	VqSJ00sq6XIdnsMNrLa38U96SbH/QtvcrCz5HRZXMI+OWyOQb3tcIE5Se/zls/z9
	fH5r+OhALjcfF/bOM0BCBSouBgsqHyNKQGnx5ANzOTZi57NUdzqw1TbwZOetXhHP
	mUAuO9IzAK+kwKxdqvtlSAQ0RNPttMR6f8ilttFqK9QY/j1+4UCSTPnbPIMC/Xih
	DTcrRfL0m7D2nGcBTIifQyTDXcGFmkdVdj7UwWe+NdWfMzZI4uxzAc9WlcA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv3w5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2647765eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235501; x=1790840301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEuz0IYkO3vv3NkIV9hKvUGxpNw0DLo4XFrqlBEvznA=;
        b=ets1NpqlscO1T3uA/0Alo9c2dhy4krM2SDudK5tv8DgPtV95p1PStGBwD9pKhJBqat
         cHppZSUgsPO4oKqiKf8r7MD/gqwFaY0g0xsBF2K95z8EREyGpUl2TC6ui6y37GGO7n7N
         K9HuLX/fawDDTB7FfglxdK2efGd1vcPmftjPMR4wgw9DmbYjiJ0AOJnOyaknoLZ8T5jr
         9S0kHNCM80r4xEWQZfjns13thRjcxGX9oOzwSP7Zq4uCYL6h4+E8Jh8RQpDD3nelg/Lc
         zkaRL++c5IJtQbtgNocDwlR2cgSoHjxFvz5puEGT1Sd+DyYiAJWVmEiLWZg9MTke8KLQ
         vadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235501; x=1790840301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LEuz0IYkO3vv3NkIV9hKvUGxpNw0DLo4XFrqlBEvznA=;
        b=xsQNxyLoAxBp8HTpsSIDYwf+sf8nhRKhJIvO931M8gzCQKtzLS3FuW2ShRKjAlnPLy
         CscU6zbkraggp9MRuYSiiFm4dUuK2WM5zrxRoPPtChdGh9dMgWnMH0I1x8Fv3YbJUUbb
         5rVh63OmfKCNpmJnS0fNlaKYljr1Dv6WjE7cqx+Z8MqU7uBwVDPwQJ+4Br9dxDr6cI7p
         uxoQobHQf6cDoLAiJmJEZaF1eO2OVb7KWuVQQ/hVndwQZxXfglECBfwaHTOMYjij08xl
         QynbRfsY7n2a/JCtCwFPbduVLhWj7vbIjZTP71HbX6vo8steVsJUcsLmKkt9MCMWc4/0
         6qiA==
X-Forwarded-Encrypted: i=1; AKwUvBzx2yeETE/NUi7NDwphVrs2XdRPC0UWIPbxTEZt2ql9IpGd2LHo9IaFcLyMp1NBjLPvpq/52Q63d6/gVbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k9Wl1dyvE8eGIMa7/1GypGEIY0pZUxj1ZmmjpNrUZM0qdcUg+u
	qO7Kbn5a3UAVZ704ZRpMjRdlbLRWMF15e4rWq2gqRm3zynRLWj4tAqh8fMN1v/Qwd+avDfQfEi3
	FLrCK5oDgq8WwDV2I5TU7Tmjkf8y1IZksUg9IyBGLqF96jddQwSFwGqKuqBH9rOzOzjI=
X-Gm-Gg: AYBFou2YyXMK94OyVBu5gNHUBfSlIprB5m65lzf3FC4krIcb2oyz9ELW99W6Nc/ym0r
	2e6jb5EWNDiktKTqGwqSrwFMywSJYWZy4WVMHvXvCygrCiJulbr4CMQT5lNc3m6L5AxQirk87wf
	eGfH8zgfizDEwp9kj2FvDTvgHF68+KN55UXAdFiD/L3gNGo6JwsjJNMHXT/p7p3LbVkk/2jSFZn
	EH1OT1MgpKdp8CKg2o6hYSZOZi63TSG8hIuD1OCbf/wOnL1CcaMcKNcXX0+JUrt+V1vcEdWjO7p
	FPAZKbpHk7577J/UK8Jp5PmO4AaSTvStJHxG+4EgcKQ584RjtzsDG37Zj9KzQiVvQcBYfcqGwoF
	v0at0GV1aqacU30PxHjW1yCy9A/pp4+baoa5Sh0uU/lXZWitCgHFudsntX4/OaAQA3LjLr+ZLml
	okgI9Ton9zV7QOosrr4AuJHCE5
X-Received: by 2002:a05:7301:4441:b0:33c:1ff7:8681 with SMTP id 5a478bee46e88-33ffee597f0mr1649406eec.15.1790235500371;
        Thu, 24 Sep 2026 00:38:20 -0700 (PDT)
X-Received: by 2002:a05:7301:4441:b0:33c:1ff7:8681 with SMTP id 5a478bee46e88-33ffee597f0mr1649373eec.15.1790235499750;
        Thu, 24 Sep 2026 00:38:19 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:38:19 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 9/9] riscv: Enable APEI GHES driver in defconfig
Date: Thu, 24 Sep 2026 13:07:14 +0530
Message-ID: <20260924073714.1650588-10-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX1mCJQdk+uG+S
 sC5goRGkxIAEchRlLbsSBxS7hnWDC3snAuJDL46JfbAzIHMgn2tVyYfLaNESpJ27D+f32GPCAgo
 ijpLBQE0+LR0G/tQnxnyGJs9eEcHVIMO1/eOkUO88Qs5O1fzvCsZn1qJWG59e5WaEVAx1UElEqI
 ypsxwog8lyz0hclWMojsh7vxDHQ+lZZLQK/wa73BmhDW3i9VJMZE3vhD+TCFiXR8X9/ru2v14pZ
 UXQwnL0wMlMyAblBpqyfIkxXZxzHAcRNef38zYAWdaCYPGZPWJ2TZhWADmgAb0GjIPmBUykXBUf
 QMGChBdOCWiEK4UhOQCThH6699cY/VmMOsURSSG2z4SjiUPV576SlAixeEXXeZnUPT750rV1gWj
 GCFWeOQyElKXs33tTnlqUnI1opd5kyydDzENyVG78wRgQftsgsjBi/V6hD61BZi634vVqGUjqP/
 oZL0qyoYfTXEgvjW0lg==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4d36d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xUlk1AThICIXWUt23vsA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Ojnc-z4Gid4dPLUy-aC7mHmDtwCRYeyb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXzKKi08y5Iy3+
 0IdQCDbTK9ED/kT7LDFxsqFU8y+CXzkhmWn1vZnTexRi6obS8VZ9bFVXyvLMRbqtSVYvicBc0v5
 LjCTJS7BD1HAu+6eI6chUNodGXek9sc=
X-Proofpoint-ORIG-GUID: Ojnc-z4Gid4dPLUy-aC7mHmDtwCRYeyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032

The APEI GHES driver is very important for error handling on ACPI
based platforms so enable it in defconfig.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..66353b22298f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -48,6 +48,9 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_ACPI=y
+CONFIG_ACPI_APEI=y
+CONFIG_ACPI_APEI_GHES=y
+CONFIG_ACPI_APEI_ERST_DEBUG=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.43.0

