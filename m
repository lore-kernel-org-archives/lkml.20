Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649822;
	b=bG5jwAKEko96KSNPvJaK4rWAq25SgScbZpwFmicxQVnKot1JmcMHJIusMkXp6nx2urvW
	 /fdNi5J45XcMO0u2up9SuQvLWlE6UpuEG73uoZBlptvxjgDYtTWrzzsoVEOl6Sl140M5Y
	 fii+X4Erjv5FCGvbkfiW6RDpJs8HqWRyU5kpq8E+pyKZSMrD3ezNsjN/WGgxJDCo3aiUQ
	 l7kexoLVMsfBTOuSO6j+z+a+xDXbl6nZaXkfsfLDsCXJz1vjIYP8bpNfprjZ5uDIsFgSp
	 SIlQYj9Ob8vGnRKxhCDec2oGgtV7VSJ4JmQt3/UjThFkoHVhtSFXmrtZQi+fvTu4PyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D/Ms9ONYznkwN2YshUZVtSjU9I6nxLEmmuHZPDFXFTY=;
	b=a/x5P+xWZUj+Rt736cPILi4b48A7ItB31we4PwfxPc8jH2lfkKV/tbmCofGIgZg95ldO
	 gdJmxg3kDWGh9oQPnWFoagsxjza4Dj/+3ec0xSrPlz9lIf38Nta8dMkgoKRGpIpJ4+E4w
	 Y5SlCh/vq6aPJE/LvyZb66HjWq858f0kU5PNtN+eDgDKttDd5B/YvAJzLQ2fuPrugiHhm
	 QM6sBw5JEqR9UuIj0hSHM9fr9qZFFEeILdN0arbYvIM/J/Y/8x4EKHUqa2yJd1//GW0eh
	 TITUXpjVK9P5WbKLHAgOJIpHxJJPY05J1OgDOeJ5V1d/x6ZpAFKZsEpafDau4YIj2eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkHMNo61;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6741606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6741606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkHMNo61
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3273142f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649820; x=1794254620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/Ms9ONYznkwN2YshUZVtSjU9I6nxLEmmuHZPDFXFTY=;
        b=LkHMNo610oiWCzS+1m/1PUvgxODcRNNRZlzzhI6gsQC8v5zGfrPiqF0zIk9w21BvjP
         n9hRpvtqfYewStOURLOmqFvb3TdiFkBw9jn2Ms630KDJ+VjP0OSDZcwB4zBkBK2FvZx4
         jIqoLnT81pawmzS1ChPOPVUkFV8s3eKT1UNWboyZSiDnjskDfX2c7o6WqKpjRuyOMOdA
         hoMDc7m/5JR1iQB7s8O7Nu4dDHFSo3aGrkjMCSY1nV/l0ZtgZrAvU4NojeT/Hh53IKCQ
         wCxHwIz5z5J6QPOR7xKt4hh8kg1fGJ9o3Di6095bL42Pzh3RUu/XKMpkagxxevxueY88
         FyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649820; x=1794254620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/Ms9ONYznkwN2YshUZVtSjU9I6nxLEmmuHZPDFXFTY=;
        b=rE3SI8Dl72CUxDpcyqXuLTwUcLKqC8Wo1/CH61mnrPebepKemVwYKJT0qSkStr6gmW
         VAB+KWOCiZ7A23VQAsD+obIxcGreMO4AXqEfqGzkbWdmbxh8kQffYFoUAw+jCitKk2/6
         XiAv131P2sY7wnmOcGD26O1V5PUNjMJuoA8IyVpbC99hV62jhN+MZnaeWRsPb3qyrx+R
         K+WGy+nP/wfFkICh2+qCpHhVgHVk0ZLcPlLo3mTyxohytTo60IHvMjKlDLP3JNzghQJ4
         bhGGu68QSRb+n3Ctuqe9DWMyeziV8DXS5f0Gjbl74GDdDb/LhYkVCBSAFPR3PqjP4KYX
         p7Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxZbRGsyyOxLGSMB+JC7Q5fadP0xeFBsO8BXkaJUg07oqIbDlOasEssAlBBZ2NZ4U7JLkvMlfn6n6I30ZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HKziVIwRiT1XsH0EaPxwZtpT75p1KKR0+dhe5uZIh9BMdYd/P
	Pf5vkf6o/jQqI3FYQpxm7mqwxgO7SFdDfB2F6DFxWIZTUUaTuP6CGy4i/9BzJAB3JgZwyA==
X-Gm-Gg: AYBFou145SGfLNJUY5SXPe5kYFX3QQzsT3q6pLCbifR7UKdxtKmWIIc+/8GuFd/vUnj
	uohyCLTsn8ApqTp9KBCPhtpsOwOBsXLu1r3MjhznU9i6+xLR5wRi5FSem921iakHBJVBj9gniFN
	PImvPOlGaN4NGJG1JRPRcNv0BXM/KTtpnr4ThUrRJC2CqSfyw3puKbWMaAzrSCCzaeYL862djMK
	yra+wObCLj4P5MYCfRdLNyRsAOU64TsscNLB9NdGSzC2SQ+kqOILOhRKjiNCd6yPcguPhDfly1S
	WLGAx9pWcbD2pkKzhLgc2pYHXM5gq1c7Y5vHU9mKxy28P3qFQOeabYdZq940YIrwfHeUJB9zi/X
	0N7CqZjT6M3Z075ObtFNJD+SrsGlB80nuSyFVl4xHGdhWXioh7EFrjIueYYy6XicenjSyIp5/vc
	2HdayfFRAF3L+XHUGtIGlrnZj/tKVEeSizTibcxDvIwJwVNfk4qQVhRMPwRwpdiAYHlXI/k/HjV
	+cFvYRevwPLkfPHXyjLblBduzgLBpvVNuaWbddyuvpy2eOqv97oD+zTv4KIRYmTYph1D8W9hi3+
	Qqr4CiNPjpu4sKS1xftnJpQWnmUyeOzsVChWoNf2HiOjlcqyTm7vWtHFwbtaRb+snbOBnKKIGVJ
	68IJB2zJnEcNP45eYxZblmHVhfZdZtDXjYRpcEa9YXImpiFCEemBpWrF9aFqfghvkHxwb8E7Bhm
	bp9N9yJcf1jXc=
X-Received: by 2002:a05:6000:1786:b0:48e:6c09:cffa with SMTP id ffacd0b85a97d-48e6e50b221mr26395521f8f.48.1793649819769;
        Mon, 02 Nov 2026 12:03:39 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm21191574f8f.47.2026.11.02.12.03.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:03:39 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: report no AFC memory region to firmware
Date: Mon,  2 Nov 2026 21:02:34 +0100
Message-ID: <20261102200235.48973-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102200235.48973-1-gsustek@gmail.com>
References: <20261102200235.48973-1-gsustek@gmail.com>
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

QCN9274 firmware WLAN.WBE.1.6-01243 requests a target memory segment of
type 0xa at every boot. The driver does not know this type, so it logs

  ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported

and answers the request with a NULL address but the requested size.

Type 0xa is the AFC region: QMI_WLFW_AFC_MEM_V01 = 10 in Qualcomm's
wlan_firmware_service_v01.h. The firmware asks for 8 KiB, where the
host places the response of an Automated Frequency Coordination server
for 6 GHz Standard Power operation. ath12k does not support AFC.

The firmware treats a region as provided whenever its size is non-zero;
it does not check the address. With the current answer it therefore
takes bus address 0 as its AFC region and maps it for its own use.

Name the type and answer it with size 0, so that the firmware sees no
AFC region, and log this at debug level instead of warning. No memory
is allocated. With this answer the firmware sends the memory ready
indication, reaches firmware ready and brings up all radios.

Tested as part of the series.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v2: do not allocate the region; answer with size 0 and log at debug
    level. New subject. (Rameshkumar Sundaram)

 drivers/net/wireless/ath/ath12k/qmi.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..55952da4343b 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2755,6 +2755,18 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 			if (ret)
 				goto err;
 			break;
+		case AFC_REGION_TYPE:
+			/* The host does not support AFC. Firmware treats a
+			 * region with a non-zero size as provided, so report
+			 * size 0 instead of address 0 with the requested size.
+			 */
+			ath12k_dbg(ab, ATH12K_DBG_QMI,
+				   "qmi AFC memory region of %u B not provided\n",
+				   chunk->size);
+			chunk->paddr = 0;
+			chunk->v.addr = NULL;
+			chunk->size = 0;
+			break;
 		case MLO_GLOBAL_MEM_REGION_TYPE:
 			mlo_size += chunk->size;
 			if (ag->mlo_mem.mlo_mem_size &&
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 1b1c88906f1e..9d9174c6ee60 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -177,6 +177,7 @@ enum ath12k_qmi_target_mem {
 	CALDB_MEM_REGION_TYPE = 0x4,
 	MLO_GLOBAL_MEM_REGION_TYPE = 0x8,
 	PAGEABLE_MEM_REGION_TYPE = 0x9,
+	AFC_REGION_TYPE = 0xa,
 	LPASS_SHARED_V01_REGION_TYPE = 0xb,
 };
 
-- 
2.56.0

