Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A04742AFB1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235468; cv=none; b=V/RLAZlg07FzgRCnjWmaToHDkKNQxNN2C6fyATYjdMh5tlDK9TQBkAzkJgxz8nZ2aytsknz8rbk2icT6bw85sXSKatQ4PZDjSsocQAeqKb1I3aFwT6vhSPtTI1VArI/EcBYjNfkhVVxQQ0gcqEEVVT9n5tTqymWBNvGi/eU3FO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235468; c=relaxed/simple;
	bh=Oc/lCz7J8IDjeFbK//EJABhRCbxS4k/rXQvZVa9k5zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iksesc+DKRseYeZnWpBoaxuWwnnC6576HZvTDDF1ScxOKB7ShxP8+BoHloyrZFaA5VjPD24/NKv1voremMIbzOFpGEVlhsPEOeb5mu0Xf//q30Lvgv8lmOgK4+oOw16mCiDhx0XrN4G00qiiprPxZlKHNBrUIU0hvV6uZg5svMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pe/wqpde; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOkfgf5j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe/wqpde";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOkfgf5j"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e3su567392
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pB6vrkBAByF
	zx3Q4zdQRRWEh7E4G3c0it3uuIjGmP0k=; b=Pe/wqpdeZ7PC+JWlQFS3sxeFLeb
	VUsxqEQqq4j43LQi5K6bmjtMVe7Can69P1VvO8utIXIxZxaGAqcbWbWuKtJ+0ERB
	VZXYDcKsb5/ELqplhyGtv3Mk/SyA7RmxMMJbC6ilvS4C1OCEKsNmNAjRCDAjZMQf
	KL+Y4zIW9MxZc6t6MrUuM+ZuP1ZPrfgA4p4fwYeTC6KE170rqUL99gsiG/IP34P+
	WJTMvjiYvhxtnkXasP2Ll1k79wUuhRlpnB5fJIWQ5jC4+FP+bTppMR/qeJUrvXLY
	vNQ1mDrluGHUlzuyeuqS80C8X7Dw8yyHcLUeomlQimYC7N4vdPid+uB48dw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh8qv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3295003eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235466; x=1790840266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pB6vrkBAByFzx3Q4zdQRRWEh7E4G3c0it3uuIjGmP0k=;
        b=gOkfgf5j3JjFY9XZuNQ/B4XPgI2W2ZJbHcjYeyTvOS0bgSDItljRsr6fXHNtYXIyR7
         lBDH0qBCZEhpAUDNwa+fhB3IrxOLMqg94gPNjts43Nuph7nL1i9jfcwU8uQ/74lIFK7j
         i/cXroLc/6XNvMgjID8qiRMXgfuHgSjixcDYvFpQyZNm82g0+bGU5HqcxautF7KoqTlo
         EKRp7eTP+cnBPbbxKwq+btKgOrg4ypLMrGBsRxwpIKYVfOFSdL52lnyKwBBvI6HBBr53
         mKcul+pv+dY9TMb8FV/cnUs35R1nnBIWUD4fhYPtS+6X7NlnfmZN6ldPfBWsyO5qAm0n
         sNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235466; x=1790840266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pB6vrkBAByFzx3Q4zdQRRWEh7E4G3c0it3uuIjGmP0k=;
        b=UtkSWb8Vd4HS4NWaOQiyxw3K+vqJnQL++krlDS1h1Y3z78Fhm9QDkDQqK43kaouBTN
         VziOP1uZK3X41leLmNekRNZjBoTkNCIzg8tqQ6w3oj8Mt9gHlkxWqljziP5B5sq1EJq0
         6GVlQ4cMqebg5Lm1BsY/RFD2gSK//LJZQQzfQeDSuRQfI5mlS9Ml6wjGZW3hSj/F7Ocs
         8mdv4OB+SWXOGHNm8zSp5XtS93SkvD96D3E3umBQC9tfS4oOANorFmjlWbYj6YpezEZ1
         7aret0MfsY9QtFmyZp4khanQTRMkvaNsQk/Oxw4ot6GZRA98E/dFGYleYaWitlBw0/A4
         sx7g==
X-Forwarded-Encrypted: i=1; AKwUvBx0k3Kw0nDld6VKkXsLFDGkcaHcBuuGVh+97llej0qY1nd6CyFl5wxD5d0NrqnZNf9WazDFbjt/1UWsW9M=@vger.kernel.org
X-Gm-Message-State: AFuF++lUucmKiqB+mc/KdrrTPPjUYV46rpV2sVxeo0ZXD3wySggTUVX5
	SzXmkBMVz1VWtogNO6ESJKv+O1WP1dlg4nZ7n7ujxPeOx15nll0r207KHAh9OKoXQV6nggkDtU0
	CoUt57DjCN9QNCr1gO5SBYS94NKPGMxmM2DL2Y97pukmhpy9c+6HeXs6U7QiXqHiCzV0=
X-Gm-Gg: AYBFou2FSZy4Wfy8LMIu4TiuSLLCb6mcLBe4UmY2mlw7XkqjUdB6a7y2WWAryCXL3aD
	4b8AVN42Ie2PNnEySu08mxzL3p0A+y6BzW1WUKI8nSJDAfzBl/7qH1C9haf1H+KIIWb4PrHoXIc
	xvhOn91rklHmVQssLW5hQ/8Ew1hqymCSUlDeMFN0rD2excOasEy5ttvtzTpLuD0SoJO3900DpXB
	xq04aY/pif1LfhBP4dwVYrVO/6R4ec90gwgVE2s2M6UecwDarf3q5F6uaTew0ie0d9acQyoxihB
	eYtxGH7Z50Khh0X9/q5zO5oxEearxuNjQi+/CbTWBbX70F03uVh3ROFVrlUkNOdim9uo9vv2Tpd
	qzywSKs3ibgCPogRG8BJSUw4U/4hoGmU8fUUWcTmkg6OInwpF8F0keP7Q2149ax2gf0xb05BK3p
	+aCLuqcKSYpgzqWJt5rBYiNm7f
X-Received: by 2002:a05:7301:77ca:b0:33c:e93:764d with SMTP id 5a478bee46e88-3400151e050mr1333141eec.39.1790235465900;
        Thu, 24 Sep 2026 00:37:45 -0700 (PDT)
X-Received: by 2002:a05:7301:77ca:b0:33c:e93:764d with SMTP id 5a478bee46e88-3400151e050mr1333069eec.39.1790235464103;
        Thu, 24 Sep 2026 00:37:44 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:43 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 3/9] Introduce a new HEST notification type for RISC-V SSE events.
Date: Thu, 24 Sep 2026 13:07:08 +0530
Message-ID: <20260924073714.1650588-4-himanshu.chauhan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4d34a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=6zSMeUNXk5_XeOI1LAoA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 7puQFaMjKd5L0DZiIBk8DfbLC8TmBw5w
X-Proofpoint-ORIG-GUID: 7puQFaMjKd5L0DZiIBk8DfbLC8TmBw5w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX6gaVJKNNGt0M
 tCWgbfz3vroGfFmUr7+yq3Hxv0nGy0utg78Shm/GwMMwDR8Envipqb9sUIpDldxLAABe37ePXBY
 P9I2+96zx7644rto9a8t1cXL8W8CweM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX7phtam2lWrV+
 ABhu6dw2fp73RSVpQTmw0+Yf1PQhpqOooWHmYuOSzkijJm+H+xQJ73Qp9F08zMiV4cy3qM0hVuV
 B4Il3dmTvgJHXBX1CMVZ0OVsWd1T4qH+D9aCa3a50Z2/5jtIEiV5WHa342ZWAe6ycfHtM5KMunL
 VvSXaKVAwey7D5h9Nk5tBjvES38Qkqm9IlYM+Tb+cy9/r+8goK9j/dE1kxkkTY6CrukybK6ppo+
 xvdm2+yr97wRhxb5IfwuX9bIJMVCCaWoXp4agnuGkejfj9jyB5rp/1pwFiIFoAXSi8uWo4Cm+cI
 Id+iGBdFeInPuzbwKbxA2z3eSGKF4Ef4dzn79KApP/5zj1aiB5l6QHeAbUfwxj7kwhT2RrEGEtV
 lnG00F9SCbu8ourHqSQecZMbg+si8VX55x5g8eHVdYIwliric6hnlpAVN8puNTLk3f0Bs07AWUI
 msBjuid9QH7jH3Qh7WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032

The GHES entry's notification structure contains the notification
to be used for a given error source. For error sources delivering
events over SSE, it should contain the new SSE notification type.
acpi: Introduce SSE in HEST notification types

ACPICA commit f73f39352c1170464afe812cc96b20cc9db1d822

Link: https://github.com/open-acpica/acpica/commit/f73f3935
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 include/acpi/actbl1.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
index d824838cb7af..105fd51f83ec 100644
--- a/include/acpi/actbl1.h
+++ b/include/acpi/actbl1.h
@@ -1798,7 +1798,8 @@ enum acpi_hest_notify_types {
 	ACPI_HEST_NOTIFY_SEI = 9,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_GSIV = 10,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED = 11,	/* ACPI 6.2 */
-	ACPI_HEST_NOTIFY_RESERVED = 12	/* 12 and greater are reserved */
+	ACPI_HEST_NOTIFY_SSE = 12, /* RISCV SSE */
+	ACPI_HEST_NOTIFY_RESERVED = 13	/* 13 and greater are reserved */
 };
 
 /* Values for config_write_enable bitfield above */
-- 
2.43.0

