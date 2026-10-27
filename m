Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087749;
	b=3KtrQLoO/h1eN5k371KTtkH+Hc0QqNWYVK+vy8jAaKhbSvCEH8cycQZuPRil0B9mVSDV
	 YtWnrJEeZ63EkdJYlEkx9jvhGj/FrzNeu7Bg1p47IfnXPiHQ+mYx3ryH4hx92BdbNkDnC
	 +Ec5gZ6D/1Kns6usJ6IwvSshCFcSbxl4svp6oVgjVjPtbOMGFxyVz1KAjUnjdnk4DsEf2
	 jWz4Tkd4aBnECF9gZ1WQH//iOtMCr8NtrS0jESES3reh7QP3bgL2lY9XWzbab3DMoqKJG
	 nguPXQcDmDPH2PO2ELs0xJh3XZPQzktMfZAKcuhXwrEdFgIExOehpru1ig1dncCP6nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n0TwnzTIHDwFQ2i6Elssq13LiQ4D8uWjLOq+Ut0imnI=;
	b=HPQfj4+g7wH73Zo4MPJoTTHYCrbVMF39ccV1Yjqe9szTVU9EHz+hGilHSS31TUW498O2
	 MGW+BfE3V7aQS/lFdY9V25fosHUEKK489YvAGKHXK0w/yEIGvQY4h+h0SbxEfUemsFHZq
	 B/TmRKbJL3/mprTH7tnzV4vsRivSqHj4yWkZTNNQtKgfH+Xb4lXpsOY8GBhU7jL1ATKhR
	 7JiX+mCxaLLH0GNsn9lC9xbKS3IwqbC4Jft2RaXBcL+xCd9fq1HacnFpTzfEh4X/jTqay
	 /7xXpZo+S6ACZgj4jz/bzPPnuBNXaMhMMGx0L9kgqLEBobb0frDOzgTiogWtoluDR2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PiBSa8rS;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE63606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE63606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PiBSa8rS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40f29667e6so614849966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793087747; x=1793692547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0TwnzTIHDwFQ2i6Elssq13LiQ4D8uWjLOq+Ut0imnI=;
        b=PiBSa8rSvy54KWsN+ho1LC/FHhJynbYcwVoKLdey84bQgVuWUJvYtnGQ5/D6Y4dmrp
         67B0g9HuEMsDwqkBa+TSPzpUCRXE3aVI8N+T82NHNoovbd3TTIzkdT+10ACK6zgnmeh6
         CCHt7Ye4dz3snQu1xQg0roB6Tl45V8CgMbsqh1+ww9ZpasJHiK5fkcLjQqx/Itlh9kWT
         Tvlncnyktg8j0hkUwF1tyPQ+HF9AkuTNBCzMKc7NQJj8uRGj2JMbm3QW4Np+z3ht1zE0
         h4eo+j44yNsdAto/YyFYEx8hyA3zNAb3rtg+0a4ykw+Z1Ykhg2jtXZmUT6gU2dSYxgxn
         3yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087747; x=1793692547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0TwnzTIHDwFQ2i6Elssq13LiQ4D8uWjLOq+Ut0imnI=;
        b=kJwFnwMMKwqlDIjuAdmSIqsSNfsr9Nwv9En+MQlMryW73Y/FU4olwTPiaGEhsCZz//
         DdbIl640pWH6VPatNOOsvM4yK6HijVLJQGGW8zq3hwaAg4Uodd2+oqJupXT5qZsDiDvH
         Zs8i8DYZoiQywdA2mk0N2ktjLxpA118bFXMNgYo1xgydf5WspcBAyfvDZ0wkXrM5dJ77
         sMxnndTs/jYIKfQHAIANTh/8LglUfS2RTfQs6wVRg0F0ATYjV+oMsTuBSqYlCxnTXi4s
         0YlUEVs43HSu7JwwVqO55f/q4Y4QLqlnTdb/M4bfk1KRNJxRrJuyaI0HrZk5eLbM81Vo
         SpCg==
X-Forwarded-Encrypted: i=1; AKwUvByr/fk7p6vhKT6OFkSNa8tawQtDmvLGxQUdv8yNcfydxuqRsGcvNKdtxg2qabk50Ooc5ZP9oZNTAGMHvG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrjo6UCofLFECXoFB6BR2ApPaRXt+4dqjg8SQUAaYZD8SJCAyE
	RrVTq9f3wjzgBJ0UTAqXuE/+Qruys6KHJIN50zSrD1U8DZhwiDbIsxgx+HlGwfhxqg==
X-Gm-Gg: AYBFou0i5DgaO9+2Wx7ln+NN3g5TVxwgcnecvyv4rsdq0fJIpU7NxiXzaH9daLjroQ6
	8LmhmI5arnxxSzXVWQg3qgcS7BYE5K7dSWfL65fRzGwcaUZ8dJoXNAlWj8+4T+Cu2dXQz+bi8H2
	HoFw/24O6vtusq9s+GBjh2UIfDmI0xPEbShpQb0FzK9pcRKj2VCjjWElskfZB2chZeNfMl4d8tk
	fkLJ+FI1/qULt23JlpecOAtO5GjG8Aj/koGNO6rvqill50zASfSrIY1lX6eLm8GQTg4XmFEdO4g
	OIga/oc67EEB34vLp9rn1vV2AfXzIJluzP0ZURPZg7Owfpj7pdNUfYJnrY4KZ8TTYdaaZJ/8cRj
	T3OcBo0Nyk+gUDfq0vAPAqXulZ4W1zz21OUoH8sxDLFvTXzMPIOBMtlBUJaTr4r72OCostcDjrL
	8KvfiyH2zzbF9YW95TtPIei7RKOQtoyMZa4+sSzkZlmSSKKOQiMsIZNUPo9kFLDUgDHPNk78F7W
	ipim5JERUe0urfhFnH6sR41QGvC6uQ3eiFEyKQP/o2i9fySd8asxz6UUTac73SRuD+gSFvMc7M/
	O7dm7KDLh7lSO0ibXZk4tA3/TDyOkNvV/jSYZtLASGdTyTw5gElCZR7T9t75FoylSXN4p4xjHQN
	VV2bEPTJoynu8InR3BBDuk+iDTJ5Cmfd16KOxrIyc0QYuejKrtLFz9fwD5+8OLF8tk/lPBTomJ1
	/DvVt+V7yMvqfPAlN9PSZF7oyqDcE3boZHdveSvcsNy8OSE6kJaI51j89HCtEGjl8xlIhZdbxUZ
	WX+pDcf
X-Received: by 2002:a17:906:ee82:b0:c32:414:b72c with SMTP id a640c23a62f3a-c46bde461b5mr926740066b.45.1793087746615;
        Tue, 27 Oct 2026 00:55:46 -0700 (PDT)
Received: from Desktop (pd9513dae.dip0.t-ipconnect.de. [217.81.61.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4669251a12.19.2026.10.27.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:55:45 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH ath-next 1/3] wifi: ath11k: skip unknown hardware modes
Date: Tue, 27 Oct 2026 08:55:42 +0100
Message-ID: <20261027075544.19144-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027075544.19144-1-julius@bairaktaris.de>
References: <20261027075544.19144-1-julius@bairaktaris.de>
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

ath11k_wmi_tlv_hw_mode_caps() indexes ath11k_hw_mode_pri_map[] with the
hw_mode_id the firmware reports, without a range check. A firmware or
board data file that reports a mode above WMI_HOST_HW_MODE_MAX reads
past the end of the array, and the result decides whether that mode
becomes the preferred one. Skip every mode from WMI_HOST_HW_MODE_MAX up,
as ath12k does since commit 1e9b1363e2de ("wifi: ath12k: avoid array
overflow of hw mode for preferred_hw_mode").

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e7..b3c778eb15876 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4776,17 +4776,19 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 		return ret;
 	}
 
-	i = 0;
-	while (i < svc_rdy_ext->n_hw_mode_caps) {
+	for (i = 0; i < svc_rdy_ext->n_hw_mode_caps; i++) {
 		hw_mode_caps = &svc_rdy_ext->hw_mode_caps[i];
 		mode = hw_mode_caps->hw_mode_id;
+
+		if (mode >= WMI_HOST_HW_MODE_MAX)
+			continue;
+
 		pref = soc->wmi_ab.preferred_hw_mode;
 
 		if (ath11k_hw_mode_pri_map[mode] < ath11k_hw_mode_pri_map[pref]) {
 			svc_rdy_ext->pref_hw_mode_caps = *hw_mode_caps;
 			soc->wmi_ab.preferred_hw_mode = mode;
 		}
-		i++;
 	}
 
 	ath11k_dbg(soc, ATH11K_DBG_WMI, "preferred_hw_mode:%d\n",
-- 
2.53.0

