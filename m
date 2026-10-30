Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398120;
	b=T8J+ZkMT24nzdV37H0DBCaTU4iOebuuUMujCEQZOt9jIKTcog/ZxuRecSdr87ywGMKjG
	 BWyFJxlmUhw1TUsNsPxQJ9Xaruohij2e37sKUMTppypBFbD9vDcqV7cImiBlkdGsqbb1b
	 /vqumhYbOCNYFOwRrnQQAw1eyoyXVrmu/SNv1+8wTBKyKR2KuG3lSoLRHcTGmMv/9VAzo
	 w+ZL0hN3twO11kkX+1hpWGbsQgYQ9lonMwwnQBapaqUX2RLATiuEF7C5EGgSS3rB/GQ0e
	 JX4h0EOJ5LhYouvwamBx4wK/oputO0Fn76SY1DiGQo0PcL5IOU5XO6RD4meF4SYZnEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6MP1tF8YbJWsKrQojtXpYNGggZHhGf8qvXrZ+jDl4EY=;
	b=eRDgHkXapkYFTRDx8B5kfSmdIgF7Zqw+AIj8KCrQPdfU4CwZgeXvfMt6TpY7E3OFiHlW
	 Re/IOCmxWKwC5zqcbml2BbTVnANlRiACfI4+GiBje5+8tAflmpoBxauzN8QOPxsNeTnaM
	 1OO4d3xRc6d5Bi43rlJAC2yHAvZCZXe8jZBZbPe7OrafLwTF+ltN2EWW/jp2fVS9l6nSB
	 s6v/nBnK/EE3CSONb6AbrXqM6IDK+/h5zKvvUeMA7bwnQXh5sCAD9gdQZZRobqWqYjaug
	 1lmng26gUt7xT39nQaFnZdKVqp+z6KMc3jbc7YNC8lQw7+tuHCd98vzz+UbIHA5ThJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZYNamf/V";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8311606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8311606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZYNamf/V
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso6207355e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398118; x=1794002918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MP1tF8YbJWsKrQojtXpYNGggZHhGf8qvXrZ+jDl4EY=;
        b=ZYNamf/VYWCnTct7RBEnVi+JFPz+0o+TohO4Y+EUJEs8LgdF/ztEk+zOKpZrEDf91H
         YpHEBexnSPhRokuh1sCBval92RStxkjgxXE/0VZpe2zfQC8gcNQLdRSDCMJ+YgLD4iMg
         PdaoVTevSLhEWz6JmE9DoyiY6fZFroK5VE/IolCfxwOCAt5ECOe3AOZNg0fB8bvOzOKa
         aHfIGABusUgtjWCqymOu0ZuR8vD4LdCh1fpLZ5ZUzrF7AaF1MJ1+5gdAXdaqIRCEGWYV
         Uj9CEbNSBxZrb/dCVZpRw8fEGmNHSSUxVz56B0UzQJVbH7ho66lUcrmgd/ELB8i/jrjQ
         vnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398118; x=1794002918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MP1tF8YbJWsKrQojtXpYNGggZHhGf8qvXrZ+jDl4EY=;
        b=MkzY0eSR+6GXC9pmMRYOt327NwKeWw1Tk0S5r2LoI3+zWrxIhPycaACwDpDy42DbiX
         hlNShZBOY7SGHkSeDkS4BnNaWIZsD5qTjrnu1kD593B2EN1LxJKhviu1NiyMy38BxGnF
         lgU2+t5IQD5+XUPHSFKLPtTM5VtwKQ6peddDYUeC699gu5kXsyI9QP+Nyvv+nAWtiDk/
         yidu0z8L6LVgjEoYiuiHiCXu5sTyDbuUC3rw61ranEZyLk0iIStDsGNRGj3tJar/btEK
         hqd5D3p1g702wzkNcJ2Om0lLsCXuSFjl4NGpEuTOQtxtxMoBU53YtXjTtaI4v1hlJTJ4
         0m6w==
X-Forwarded-Encrypted: i=1; AKwUvBwXk/fMZfokDbDQGAlS67mVtXAGn4kc/6wfk74D1Vf1CitvsoOF3S78EnVFXjAbUpTfJ8UqmlZ5KKhwHYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCWe0VGVUETsfw0JCW1IuWiURfhxxLE/ShLtaeiHKX7Z7TpdaY
	j85wvfLwyeLz8CIav9d31ECbAq+l8Qq6Vjr7fmQ3SZE/apI1P8IA2JnuXzYjvzOM
X-Gm-Gg: AYBFou24jOKvbdPsTERejTBlNLZcSu3AcoYhv8XbzWvY5ciwFzjzfQzpohSptikv2uZ
	uMeec01jxfp/YsrTm7oc/Eiipv7ahz015HaklcOycPKgdvAlFc6t7jOWgNCvKsPUg8SkzQRvXhv
	2ByDP/dygbk3y5HXwpPZ9XP0/OxjJeRTga7rYCCPj52MBjFn/wtnUOx7sQMvGHxKbEmk9fuZ1ij
	tXEQ+49muoyENSCW4gNVbpONdE9KBxWBdJM5eYwG4uDbfchKwZFdkQBF3yax9puT1R3NlnvEwL5
	bND3r8+ph7lK98y3gPhW6dz8yoX8PJ9VcAWNa9oiv2nesa9pl00ThB4jl980Z7J1/gQDFKtJyHJ
	JdQQyHEHbgLEiNXuoAC4nmDemhrnxSRETWwejYnGsAdWPpPj3f+wVfJzlPUXQBDHfKrrcRIBVln
	Rp6YBj93o+gJ+eqe2xXCQRMU2fu+vtu1oUwNqVP70MsSYccLbuMaNxYtLCP5WeCoOCoV2j25gwQ
	1AcoEFcaNFfCLicIWzRnEgnML9B0Guq3Mp6mmV3GcCNG+RzV9iztYFBQEUkeu9DOPQ1u1e7B4Dh
	2HpmKIvr38CxNLp8zs/6wBqZZvnBJh0PqW97Sgv5t1Noyr3piyCjgHAowb5tMpPC03qcmjiDCiz
	ji5cDpAT/8cN8I9b/cIB26ibA3mxALtlyOz1sqsNJN2s7mygDjqUBcu5XLQ==
X-Received: by 2002:a05:600c:630d:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4ac150b38abmr79417375e9.3.1793398118067;
        Fri, 30 Oct 2026 15:08:38 -0700 (PDT)
Received: from u1804.home.lan (152-43.dsl.iskon.hr. [89.164.152.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm56230305e9.0.2026.10.30.15.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:08:37 -0700 (PDT)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 1/3] wifi: ath12k: allocate the AFC memory region requested by firmware
Date: Fri, 30 Oct 2026 23:08:22 +0100
Message-ID: <20261030220824.915760-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030220824.915760-1-gsustek@gmail.com>
References: <20261030220824.915760-1-gsustek@gmail.com>
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
wlan_firmware_service_v01.h. The firmware asks for 8 KiB, one 4 KiB
slot per radio, where the host places the answer of an Automated
Frequency Coordination server for 6 GHz Standard Power operation.

The firmware's handler of the memory response records the reported
address and marks the region as provided whenever the size is
non-zero; it does not check for a zero address. With the current
NULL answer the firmware therefore holds a region at bus address 0.
This driver never enables AFC and no misbehaviour has been observed,
but the firmware state is wrong.

Name the type and allocate it like the other host regions, bounded to
two 4 KiB slots. This removes the warning and gives the firmware a
valid region. An oversized request keeps today's behaviour with a
warning.

Tested as part of the series.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c |   17 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |    3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 280e50a1f31d..0679e5d2d4fc 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2707,6 +2707,23 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 			if (ret)
 				goto err;
 			break;
+		case AFC_REGION_TYPE:
+			/* Firmware requests the AFC region at every boot, even
+			 * when the 6 GHz radio does not use Standard Power. It
+			 * treats a non-zero size as a provided region, so hand
+			 * it real memory instead of a NULL address.
+			 */
+			if (chunk->size > ATH12K_QMI_AFC_MEM_SIZE) {
+				ath12k_warn(ab, "AFC memory request of %u B exceeds %u B, not allocated\n",
+					    chunk->size, ATH12K_QMI_AFC_MEM_SIZE);
+				chunk->paddr = 0;
+				chunk->v.addr = NULL;
+				break;
+			}
+			ret = ath12k_qmi_alloc_chunk(ab, chunk);
+			if (ret)
+				goto err;
+			break;
 		case MLO_GLOBAL_MEM_REGION_TYPE:
 			mlo_size += chunk->size;
 			if (ag->mlo_mem.mlo_mem_size &&
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 6da10f3cb597..c438ef6c7680 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -26,6 +26,8 @@
 #define ATH12K_QMI_BDF_EXT_STR_LENGTH		0x20
 #define ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01 4
 #define ATH12K_QMI_DEVMEM_CMEM_INDEX	0
+/* AFC region: one 4 KiB slot per radio, at most two radios */
+#define ATH12K_QMI_AFC_MEM_SIZE		(2 * 0x1000)
 
 #define QMI_WLFW_REQUEST_MEM_IND_V01		0x0035
 #define QMI_WLFW_FW_MEM_READY_IND_V01		0x0037
@@ -173,6 +175,7 @@ enum ath12k_qmi_target_mem {
 	CALDB_MEM_REGION_TYPE = 0x4,
 	MLO_GLOBAL_MEM_REGION_TYPE = 0x8,
 	PAGEABLE_MEM_REGION_TYPE = 0x9,
+	AFC_REGION_TYPE = 0xa,
 	LPASS_SHARED_V01_REGION_TYPE = 0xb,
 };
 
--
2.47.0
