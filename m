Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090115;
	b=HThdqB36HSpFt4L6AI0zGy2oi70FnkuwjS7EfCjQ/C8rO0j+V5lLwnRT4SJFyXimJDl6
	 NjfcssHZMk2+6ZT7gPPs+ZRvhRoYT0THTydmDP/agWZwfNFpDF6GFxcxEkt0YrU02WXmC
	 7mzGrh0V3xZN+JS8L/Qys8yhXY931YYgKe0eVZTo1sW34MJ7w1Se6UQktjKuHGurTprEH
	 V1VcZA1VaKJSklJ8c6+WYwfDU8R6dlQ/cxhnJxVb7z/fHT0cQZDZugEjyYhyUaxPLnmEw
	 95NUxebZG7is8JDaxx/GBCwJlizzVZZnQCPXMzJsH2eM/Fzmw0W/G8TEAmCs6PxLOIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7YA8P+muIJDBbbr/1PLa8S19fZTHN+SvrUEgHhvUB0Q=;
	b=neOHSJacJkzqi9HpyReefar5YYExAtxUkSk4fo4fCJPSaWJ3SCiFqSL33Kpcly/4JvDa
	 Q/32hl652vE6CP0xtY7jYTx0DH9bSlxItaRajnIHKH4lluyOaw+9ez7LYi3r0j+OidW5l
	 X3bWQ2JP+E6+RBFt/WEnXlXxd9/aeNJWa8y7piuDwwDqCplZlkpcdXOFpHu1k1VYQOPyc
	 JCmhQB5hCkIn8HngWHm3ub9Bd3EwoOR5t2foXYrSQJAA18/cTrLKsNHUxz+3Nr3hvKmMK
	 Z6sSefs2vtLqhNTjaOAWUinIUjWZ4ppH/Ak7hY0BOxP/Suxnkj8fAw/CbE31nsE9yag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ZNSDyy/z";
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B762606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B762606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNSDyy/z
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so1176254a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090114; x=1793694914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7YA8P+muIJDBbbr/1PLa8S19fZTHN+SvrUEgHhvUB0Q=;
        b=ZNSDyy/zyhhCmgZWgl6qcdmIcef7mMr+iRmpVFcu2dq5I+uaR0LbVBeoDUwc7BppFw
         JTA1z90X04oWX+uVnK8SDnajOzG9CIu9cGRpt3Ad1eONnavGivXYfWgxXPbBHaGuYMbL
         sKXeJuzauv/A5JKlVvLd2rCZGZR3lYdok87md/Chbi13U2yUfkXZmwoYjRqGnin9cH+M
         TMFf3Hr5ti2un3JHBpg+fS2qsCyR2C6q3ijmjwVuNDsJ8KRBuCbpcjttGmMLSpqka8/6
         1MSFAfZP4/WNh8hQiylQ97JZ99dtGOZPgDO7VZC71jQkXGbVyxP+gjjFPAQW8ttc7zWW
         Crdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090114; x=1793694914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YA8P+muIJDBbbr/1PLa8S19fZTHN+SvrUEgHhvUB0Q=;
        b=qitzmIYHs4Ozi+6kPEtPrVYh+ZyGZ5VpIADL7xfOMZ3j2pZKld0T22lSPw0dG9W/69
         q5tL8fqWNaYrqJIfr+eM6LOVtLK6TVuRFX8p4I9DnMSQcyMG9Lbwqbmg59b06rjmxWMt
         7OqdYg+eVTd8hQYiNpAEcbw7r11PrfOrV0b//uIeT2MaXjF7kK042ln5NwUpWjXZmBjO
         CDWBng7eUOmp0psDT99lghBJ862QsDDkp/Hp93QEodqxeCkJNCG8uCB179vcWfJ32oBg
         4gf0v53LYLJFcxoU298SMs/A2lzpvfurqXUyOOOZQFqQF4JARwnHUTudoNRrB5vfyQ6J
         XY6w==
X-Gm-Message-State: AFq9FYJaFUdx/XZWgkFSoHw/tlzn4VqYZ1u4FYB30m77uVAbrv2Ml27N
	1R27Jjqd+eaDpC2HMlV28hJaOLWyZ5F/eOZRNYQHliM+3Ye+LqVurzQM+37/ZRM4
X-Gm-Gg: AYBFou1FbBz5G45OdD+IWB3Dzn3rQNppnR47MdvBcf7I8GHN+rq+tu8zRLgoD+04hNJ
	pRg7aSo1yXFxZNovQFO03o73Rb+e5IQLO8KzrRArCBqZLzA7FIxQutZBV5STxabzEfddnSecQAJ
	CVg0rHMuWMj7y/3ioNalOOmrCo3kgYmm8ct/LlAvKofmzUccEw+jqeNOP0FG/leaU18eCUHfkq4
	y3kJym2MHL44embNv8JmyncVJWoqeS0WaMl5H8KtBN7N+LPeZiZvS3Mhe/Jv6j6t8wnEibTzbvt
	twadArtA141bF3e8p1rpMalbxiXQGS7zBIWSIgVCgAQY6yhs9/dJ03nM5m8ctSQMFM5/esbZ4VJ
	Oyh8IPuYhau8q7rE+Hx/Ftwnmca/HufSyHMBW47Q66oIFnc92wjMq2wfm2/swL6mkTkH4go3CRC
	kqNX80h3U8gmPsg1306w31tSBYRKNLhAdxAyshDeoT+cl1ime68Sdo14pvh87NY6xEgILAkyx/k
	FiA4rQPc07/tiqIc6eW9XA0Ghx8Phe2tTk1Qm3/6u+EQFpRxYgFgcJy7OCe
X-Received: by 2002:a17:90b:1c12:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3adeafca234mr6397843a91.52.1793090114408;
        Tue, 27 Oct 2026 01:35:14 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404274b2sm2750182a91.5.2026.10.27.01.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:35:13 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Warn when firmware leaves PARTIDs disabled
Date: Tue, 27 Oct 2026 16:35:07 +0800
Message-Id: <20261027083507.48226-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

MPAMF_IDR.HAS_ENDIS indicates the MSC supports the MPAMCFG_EN_FLAGS
PARTID enable/disable feature. Firmware is required to enable all
PARTIDs at boot before handing over to software that is unaware of
these registers. A PARTID left disabled silently ignores all resctrl
schemata changes, as its traffic is treated as having no resources.

Debugging an IP that implements HAS_ENDIS but had no visible effect
from resctrl took a while to root cause. The fix belongs in firmware,
but warn during probe so this misconfiguration is reported loudly
instead of silently.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c  | 16 ++++++++++++++++
 drivers/resctrl/mpam_internal.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..f03aa40faa0a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1159,6 +1159,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 {
 	int ret;
 	u64 idr;
+	u32 en_flags;
 	u16 partid_max;
 	u8 ris_idx, pmg_max;
 	struct mpam_msc_ris *ris;
@@ -1199,6 +1200,21 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 			ret = mpam_msc_read_idr(msc, &idr);
 			if (ret)
 				return ret;
+
+			/*
+			 * Firmware must enable all PARTIDs before handing the
+			 * system to software that is unaware of EN_FLAGS, so
+			 * a disabled PARTID here means resctrl schemata
+			 * changes silently have no effect.
+			 */
+			if (FIELD_GET(MPAMF_IDR_HAS_ENDIS, idr)) {
+				u32 en_mask = GENMASK(FIELD_GET(MPAMF_IDR_PARTID_MAX, idr) % 32, 0);
+
+				ret = __mpam_read_reg(msc, MPAMCFG_EN_FLAGS, &en_flags);
+				if (!ret && (en_flags & en_mask) != en_mask)
+					dev_err_once(dev,
+						     "firmware left PARTIDs disabled, schemata changes will not take effect\n");
+			}
 		}
 
 		partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..008dc4e10f38 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -574,6 +574,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 #define MPAMCFG_MBW_MIN		0x0200  /* min mem-bw config */
 #define MPAMCFG_MBW_MAX		0x0208  /* max mem-bw config */
 #define MPAMCFG_MBW_WINWD	0x0220  /* mem-bw accounting window config */
+#define MPAMCFG_EN_FLAGS	0x0320  /* partid enable flags config */
 #define MPAMCFG_MBW_PBM		0x2000  /* mem-bw portion bitmap config */
 #define MPAMCFG_PRI		0x0400  /* priority partitioning config */
 #define MPAMCFG_MBW_PROP	0x0500  /* mem-bw stride config */
@@ -608,6 +609,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 #define MPAMF_IDR_HAS_RIS		BIT(32)
 #define MPAMF_IDR_HAS_EXTD_ESR		BIT(38)
 #define MPAMF_IDR_HAS_ESR		BIT(39)
+#define MPAMF_IDR_HAS_ENDIS		BIT(42)
 #define MPAMF_IDR_RIS_MAX		GENMASK(59, 56)
 
 /* MPAMF_MSMON_IDR - MPAM performance monitoring ID register */
-- 
2.34.1

