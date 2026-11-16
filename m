Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817483;
	b=VpMFzL8FEO0Qffa49VkNQlDZsOq4c7mSamFsXWYYw8cJkPHmy0IHXl4bVSWR4luXJozN
	 kqVCPNRLaNY09TgSzzDBMwBrvdikYnI4tXTkws5k7MHDBxyEzG+K/hovH3t7f2vBEc7jC
	 ljkdFPsEzr26+5uM0NHXhejdOBfc1VN6wk9M1EZMs4UwMwWzeI3k4/izJVcEHs7FBam+6
	 v0Ih5XBG+6UPhgt8ZUEz6aduMHE0+UV8y1bpzSIiZP58a+yDO9GBrWcMhUewNKFkJnmgk
	 +01Fasgv9d82Ob3+Up1asoBJ5cYPRJmtjzMW68mr8YDkeyY+ora9euk1mC3x14Cw1sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-Id:Received:
	 Received:X-Zmail-TransId:X-Mailer:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-MSS:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=58IfPnqHRKLwuXBvAs4GhM8StT1P1xBBygpTTFKoJac=;
	b=iuGtjMrK9TAiNac2eFAhnn2ilGMqi0yGS+zFMLJOmMaGulJJGxHDwSE/iKPDnLrDCJBR
	 EpPfFhwGf5WnQomGyhD4vn/kRTOiMpKEq02qzMGaGgnRFUiKhyRiA4crkO8Q+ZPA0rTOP
	 9u4c9sks+oaAJbJx83dYHhzgqEB31I133LyH3DI76fK2liN8SkuYTmY6VDGtlg/HBKsDY
	 J3EyheoRl5p/QE+oJsa2maeSSewD0mg2ws2pYfmvBIsk8eVpzv78v5zIPA1BMHPm2jGIL
	 nIzG9bq0gbpAlpV5XZle/uK8wo408tkw+uaxOxjj3Rw7HTeokuq7/OOSBWAFFXzRgKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=0f4mOhhR;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E819606A323;
	Mon, 16 Nov 2026 08:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E819606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=0f4mOhhR
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jSgrd4R8Wz5B17d;
	Mon, 16 Nov 2026 16:24:33 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794817473;
	bh=N0NdiKv+Fy5j35Vr2TJujUaTH6LyttgdteR+TV6ffEE=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=0f4mOhhRbefSY5NNdtIvw1DVYk5XQK2+Rbzzgb1HwrGMyfk8sl79doLDGgL+zf9/5
	 TZx0viM9kOUXmEyI2hByf68HLA6UFbUvQp0TMEhM0moDP7Rz52r6LEWN5m7/LNwZiB
	 xDJU8wniE2JxRtdTHUQZtz35sPBCQtOYIUX6fAc9myAJFo677hoNHlEZET4P1M8tXn
	 dnkWyVkTUpqKKm8v2S4IttloWW+LFVT9pFH+09lxITFxIUmn0NHqTTk3VGxESk3gTZ
	 AJHSHk+S1TcVK5Oa+yugiuVWJyCSc48Nw99FeiJbJB4JK66X7KmGiKg38I1mzb2jOM
	 gJBH+2cglq8QQ==
Received: (from root@localhost)
	by mse-db.zte.com.cn id 6AG8OXL4051238;
	Mon, 16 Nov 2026 16:24:33 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Message-Id: <202611160824.6AG8OXL4051238@mse-db.zte.com.cn>
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl1.zte.com.cn with SMTP id 6AG8GMN1074362;
	Mon, 16 Nov 2026 16:16:22 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid16;
	Mon, 16 Nov 2026 16:16:24 +0800 (CST)
X-Zmail-TransId: 2b056afabbd8e45-0504e
X-Mailer: Zmail v1.0
In-Reply-To: <20261116160310759KXBV_Mm-mVT-XuE_01dgU@zte.com.cn>
References: 20261116160310759KXBV_Mm-mVT-XuE_01dgU@zte.com.cn
Date: Mon, 16 Nov 2026 16:16:24 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <lv.yating@zte.com.cn>
To: <lv.yating@zte.com.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
        <rdunlap@infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <liu.qingtao2@zte.com.cn>,
        <he.yilin@zte.com.cn>, <ye.zhihao1@zte.com.cn>,
        <zhang.cheng35@zte.com.cn>, <hu.shengming@zte.com.cn>,
        <linux-doc@vger.kernel.org>, <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIFJFU0VORCAxLzJdIHJpc2N2OiBBZGQgTGVhcFJpc2UgVGVjaG5vbG9neSB0byB0aGUgdmVuZG9yIGxpc3Q=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-db.zte.com.cn 6AG8OXL4051238
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.131 unknown Mon, 16 Nov 2026 16:24:33 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFABDC1.000/4jSgrd4R8Wz5B17d

From: Lv Yating <lv.yating@zte.com.cn>

Beijing LeapRise Technology Co., Ltd. has been assigned a JEDEC
manufacturer identity: bank 0x12 with final byte 0x66. Per the
JEP106 encoding used for mvendorid, with the parity bit dropped:

    mvendorid = (bank << 7) | (byte & 0x7f) = 0x966

Add LEAPRISE_VENDOR_ID to the vendor ID list as groundwork for
follow-up patches.

Signed-off-by: Lv Yating <lv.yating@zte.com.cn>
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 7f5030ee1fcf..2d0a8a2e4a67 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -6,6 +6,7 @@
 #define ASM_VENDOR_LIST_H

 #define ANDES_VENDOR_ID		0x31e
+#define LEAPRISE_VENDOR_ID	0x966
 #define MICROCHIP_VENDOR_ID	0x029
 #define MIPS_VENDOR_ID		0x127
 #define SIFIVE_VENDOR_ID	0x489
-- 
2.27.0
