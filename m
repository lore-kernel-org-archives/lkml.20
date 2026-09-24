Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F65B439354
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235486; cv=none; b=TMMvTtH/pVkH4Z5/4lNPnKegDErul5n0MsEdyxlcu5W0qzt0TSxmWb0Vgph09GoY2Ugsto7GAYMsYE4V75MYsd+e46VotROt7evcsur9Tgz34Yy6PIwM/4Rvd7OB0ONx1yHJ0xP/kT3m4yZp1MY7W0T/6MrP2db0HTyeNKaJm3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235486; c=relaxed/simple;
	bh=PL8UoLF+ygZWvMxeFtx85isf5jQ4edZiCN25qkiuVPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMor+2WkVLNLBgh1ZzObwCmef02CtxSgxyZwlu0XWvxlpzGIi1nQWeHt3CACyawVwhk6E/lshC7JYUOviKTQQNuYEwyUipdnNXNB8CGR4xFPm1HYGVuiNM3Pk8v3FLyO/gF395B/rUBEHlJ4eGY2bylynv0P6+Ahq+G/c/BJLWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sww/9JMG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eyjUzuyQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sww/9JMG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyjUzuyQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eAY92277189
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9ko9wYXNb1l
	9AJ4BTleLCn1bm6Eblo34heY8xr2hrJM=; b=Sww/9JMGycO/MuG9UC6K+WzENPb
	Ik/71spcOH+1tGG/HaLWYAHINktuuyBGK3SROiojJndlkOsmfbeUEC05l3LPaAFQ
	m+XZaOqGc4/KUqv9jRERX/+W600Q7J443C7rTtIwft7ddRjU71oLEIBe5Lu89ywx
	mNIxMEDVc7UROB2DLovIbWv8F0Rk356pjV/L0NIm+EHLgozUs7r5vmhDgsVtuRtW
	3EYaGt4H6yRXZE36c04XUxOwJuGYFZi3s0HPF7XIMIXzEccSn+VW7C1bLPGIJdJA
	MjF8AVgSt5lWVCWsUHnocS/U8b8kYA+7GWtMGWEXz0IA7pW+H/bXST6B8QA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxux04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:38:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so3295422eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235483; x=1790840283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ko9wYXNb1l9AJ4BTleLCn1bm6Eblo34heY8xr2hrJM=;
        b=eyjUzuyQVP3Vu1BuqBc8KD1nCEzpx1JoiHS975yD0+iQGNsn9irFZHhdywBvbX5gzA
         +6Sr0ku6UWeBsGxbLhABwoB+X/iVK/UrREx/7xn3Down7uEjOJSxyCkGoK874qDBvQGx
         KIWaZNMolxgRizmKZ9LMb5YGPJBqsWgPMzRCAW00ObJ2YQiFZfqzN4d92EA+SotjYqwO
         iu0kqiiNKh60uijq6v976z6Sc8Agyj/Fx7WwIdkWvRITDh3onA/LBeEuV2xMJEXtuNpv
         HgfcGBUcobw57zCswe/+4lWnFqHixpaqDjiynzb58YG0xizhqUMXFUhk9MhC+sJlybsK
         8gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235483; x=1790840283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ko9wYXNb1l9AJ4BTleLCn1bm6Eblo34heY8xr2hrJM=;
        b=HoqGiXlf6wK9XOOUbZEdOahLH5qcrXEGBIHxQDptzQvjSeY6z7SNNwVCL9FuVaFBbX
         euWyWkxldI5Wjg5+3rpraZbgIzH8b2/pbGcVd1QG2wBUXYpQ7EbtpNGVvLTSCS5nJnuV
         YaF2E+dDxroTMLWbL+7jCJpzFRiqPQ6bCAO/5OUvGBRihOwYwky8WlnUUWDqlMrpoZIX
         t20QjjSpzxZpyqwEVmi828p41np1L8Wn/Ck89R2Clr7TjSbTHTZhlA1WQZXG6SchDLak
         htKPVg72L28bqvK7A0qTpBHkShm9PLSGZ+mrMmPIDRAO2p1Gr8c5lrQXdEhG8qj3vK2l
         7KUw==
X-Forwarded-Encrypted: i=1; AKwUvBwQOmHT3LwWdCfSCUqwCDEVQ+k4CTIWT7hjYyHzz3BPjtGRMWPfw2mFsxJFUKvXPPhXYfGDYR29uGe+heg=@vger.kernel.org
X-Gm-Message-State: AFuF++mWpYhvW3YUorqIG/5s7fBB3KrvboB15a0fHbtXJh/F4A0fA5qr
	0m4PFjeAxu27mCsEbhX5kVazlyQb2WeVuRnaJivNxNgXYf4XyhgLfI/Jj3Oe9NrdDGLlfxB+Jbt
	N3TZPNGWDXL0DyUguhZvjYN6DclcEaSxdYzwvgdYbeR6QOh2wNUjWvfjk397DrxNuEk8OqJaFx3
	c=
X-Gm-Gg: AYBFou1/bysMcFq7I5663rzLJKYyyxEUHnM6o/fe988t1ZB6wgMS/0OivytOQ/+b6Ao
	Zb20hEpXTQeHMMKs+LicCo5UmqEW9S/6mmOI7K0Cba7ACUQxXyIuAaBtgTjNcn+8GHx8XuwbQ52
	ZeHRfe/GyVKRF4nE1oENCaEENndVRahuc5Tp1hpk7pTw2wC8cDt38OpRLsBtetMpmKJjQrRWVQ3
	MH+QcM2pgdZQWDlco50dMcrwmn6uO8zMv1OVei00gfCzGBk/qhXFhXUQuh+EgRA8cWGlT0X5o56
	+Q6IJtZhnG5/ili00Fgbi2iWeUr6965MmjQb8Qslpod4tklIPoohMUVQR1wvaG9+Hk7K4S/Gtrv
	kFwujcsa1BkIKZE1VYsm8C1XBSQ8WpjSAxkmlp8DSN6hhP2aqSRbfg7DfDkj9CmLVqSEeid6kg3
	/e6W/SGtryN7L1Vga6KINr5TY4
X-Received: by 2002:a05:7300:d115:b0:33c:e82:70c6 with SMTP id 5a478bee46e88-34000b32287mr1161300eec.29.1790235482997;
        Thu, 24 Sep 2026 00:38:02 -0700 (PDT)
X-Received: by 2002:a05:7300:d115:b0:33c:e82:70c6 with SMTP id 5a478bee46e88-34000b32287mr1161277eec.29.1790235482398;
        Thu, 24 Sep 2026 00:38:02 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:38:01 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 6/9] riscv: Add RISC-V entries in processor type and ISA strings
Date: Thu, 24 Sep 2026 13:07:11 +0530
Message-ID: <20260924073714.1650588-7-himanshu.chauhan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: P0oTMDPNwoDtPTbpR3PMLBtfdJi-wa0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXzS2dSAFfYsFg
 w9Z4vE0QOsm5NasC3oBh0rZWAfHMpNBrq+qQYN8eKtNc+2vAEx7t082M5vgbdkD2kkhX+TZRG/e
 qsKUvSY5C5SaE0wFhaDP5zxz/8IXJbFWupD2D7zTWc9UFjaJxoY0HaytHDBa7dsA0RMzFUm5iSo
 EQ+Vlhk3v9gUwUNEbmSQ+Uvspmn6BA3N40Ar0FTYd34gr+D+Vc1lPsCKRalihPZ1KlblvlUiGB/
 2enBWn/gCU15AAndQjPytGxwqEhQJKhH5+dmGyEy0nghqvz5kaeLSm016fQXwQbXsD0+Ub4lJ3/
 rVqxiWPPiDbABj+0ovLly34pjDgrMcguiciygdqLb8QvAHv2UyLEsvKgbC1BN+ELRNlWI34c+5r
 Egobvom1hkE+k3sC2p1OYwc+uOaBqSA2RhZfJJmrxmCMRpnCZprXhaBO8Ia1UcfZ9UajUyIQXEQ
 WwoGuYzAqXTvZ5Xde+w==
X-Proofpoint-GUID: P0oTMDPNwoDtPTbpR3PMLBtfdJi-wa0G
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4d35b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=osVkw33_48dge00NZUcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX2UaLTJnFC90M
 NrHkZHtDbOzCOT94GaOYReZAk+m1DcvToYWtXNXE965uqnlhnUV1HpApvA8bWmw/kD8E45VtCSx
 wndEb3Qro7Tm8Lqb9MvKebOnmqhuAxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032

Add RISCV and RISCV32/64 strings in the in processor type and ISA strings
respectively. These are defined for cper records.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 drivers/firmware/efi/cper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
index 06b4fdb59917..1b1ab2f1355b 100644
--- a/drivers/firmware/efi/cper.c
+++ b/drivers/firmware/efi/cper.c
@@ -170,6 +170,7 @@ static const char * const proc_type_strs[] = {
 	"IA32/X64",
 	"IA64",
 	"ARM",
+	"RISC-V",
 };
 
 static const char * const proc_isa_strs[] = {
@@ -178,6 +179,8 @@ static const char * const proc_isa_strs[] = {
 	"X64",
 	"ARM A32/T32",
 	"ARM A64",
+	"RV32/RV32E",
+	"RV64",
 };
 
 const char * const cper_proc_error_type_strs[] = {
-- 
2.43.0

