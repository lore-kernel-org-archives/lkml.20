Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1064963BA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417459; cv=none; b=cR4z8HzaR8i0kD9FkEHrSso0sBWt+xbLtGzW3JKc5KE14jlL3aUf+tQgKO0IdMlmRynavvKktQ0Al8t0jX7a7+SJva1PscAyKB9Y+sJzbLo87QZWgMdkRa1OXexoiTLPoEI2xPQUw4iNsjukGOqQG/ZBqBhqAWOewTZWU9USJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417459; c=relaxed/simple;
	bh=MMDykQzy7x7p66o0iMs9Sx0TXt7mVPc64bBKVA3boHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOK9YJAjYaQAHdlyVL+IC0pmO75mFTVRIN6B6dE7xX7xPDik7MGbpIlosCFEO9PWCOgARZAjmmqnLCxmcaFZ7wqITcGlvjdyH31uM3F6x5CNKpWTnWwFJ7q4xrAbRimsKiIWWTERT46DBGUHepLpGoQP+7eWDH6HfgxVFewzZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JDKS3rqq; arc=none smtp.client-ip=209.85.210.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JDKS3rqq"
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-8692be1cda4so3125498b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417457; x=1790022257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5am8jY+Eh+kLQoKuHV0GYjrdnQEpm2u3B816c/P3fZI=;
        b=A2IaBl7pu/TN2apAa8pzVLJ8+h7WmhBK+yOB+xkDRwIxQlLfwI1zw5SB6LB/ctov4M
         UPjzfCIQ7DwQ8fldzRrtk2U8kg7RNEp/5lilDuHpJDmkqrkVvjKpgmeUKEHHKquwP9xt
         SB8nC+eWhcz0V06YxHxYSRDdb4avPlEp29x//pRXhMnI9+D6349IJNlfYKhGoZMQk0yj
         gNS2VoiWtF3gDFUiqOSXVoeC7PcPUZ5rpHiCpNmwtwz71cvDZhgAJHVKCslqYNfDEcEm
         5hVHnZao2W0Q6/gSMRhEI8u1feD0kPdbAND5kE4B1s5x2iFw1L23KrAI7Ci6XQ3Df8bx
         TbMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxw9cWDJPaDjLHEhamLguj/n+TrgGM5bf85F4wavNkPKBAhkD1MxNVSx1Myevos+ApBs4ehurT11x0/lsw=@vger.kernel.org
X-Gm-Message-State: AFuF++no4eAD+o6NHOYzJ+zqxk1StQ8lUUZJN/sDyDma96/hz7FWkGoT
	AaElhXqivnhxvBnWmzix2sCT7HYoQDyqsu1jyUZ5sNzI2rBjHgw4l4gZQd69uyVyWFKRlKoG112
	NCHXw7y5r8m8u1LyToBTjAdPE6PUdZTpP6N47lGrHzKSlcnN7Avga1CxSifGD3oB3rsBleaZwqv
	Wrov244qgJT2dflHYA/I7dGKYJxGXqEH76IuGoyW28vAw337ggqUPbp/QcUf4uz23qsj8BJpGRq
	uu/IAchFCxdv3mdVIM1WA==
X-Gm-Gg: AYBFou2fbsi//y007LQMUVoe8qRm+2WiXOlGRNmrGwa3QxoqFYJwhqb6htUO8qTmAAw
	FB975fY55qLLbB7t7qCmJMRjFrlSlz6Vi5W438Ge0ruHcYX+eFOw4bD4+XNU4jHTMsN7b0Uw59a
	XaHzAX849c3JpOPpe34BHNtB8RRb/CTDYGbMLTefBeuaCvkXAX4nXA0G1dRoFbuG8r0NJqMYbm3
	h11g8uYCLBId+ESK+Er+7SYxxSMfacVpdhAclgpTTPsi3JAwUXuhsNhgO7BkMKqR97vujYMEurq
	O+GQcZ8+Kza6u1uECsrpZ+a7E0T7A1Wu01ev+4Dkz8MW0/nyqsEtpp7nRdaKr+83dJpe2+wmdMx
	CET1gCETu/Q5suTHmJw7nBgkkJAKcI6xjL7oZBK8Px9bZ/VaH4O4Jn07nLfNAt/UsYVhS9h3X6P
	4M6QQ+mn8LYDbgOIu8hQrGugGCCTuPrMux6SzVcQ==
X-Received: by 2002:a05:6a00:4096:b0:84a:29a7:f3b1 with SMTP id d2e1a72fcca58-86f85107ee3mr8681456b3a.16.1789417456511;
        Mon, 14 Sep 2026 13:24:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc4c62a4114sm4644967a12.1.2026.09.14.13.24.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4e0b45e4bso4542788a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417455; x=1790022255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5am8jY+Eh+kLQoKuHV0GYjrdnQEpm2u3B816c/P3fZI=;
        b=JDKS3rqqEQImpy9+9F75bbUuu6e9gTTAY+kKa6GnTewaqNikUPSs0jXzipxY1c3WTc
         3OBZbiO8oxDrPF5SA7yWKYdBRnhd9anOzsukhUuM2eFwUMwRFryKBWOQbzYl8CzVqh0R
         4V/5ZrnK+ERmZAVYUmKKDtToQ3QbOBq6h7qM4=
X-Forwarded-Encrypted: i=1; AKwUvBxdwBsvwAHXzrVe/dizCW996ZOXvFiX/dUMtJ3F9u0kwtdzv5fZ8Ga+pKKpYNxO5aD2V0Yj2DC0DI2ayT0=@vger.kernel.org
X-Received: by 2002:a05:6820:1899:b0:6b1:9f9d:79f3 with SMTP id 006d021491bc7-6c53fd76a77mr2393528eaf.17.1789417454681;
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
X-Received: by 2002:a05:6820:1899:b0:6b1:9f9d:79f3 with SMTP id 006d021491bc7-6c53fd76a77mr2393506eaf.17.1789417454184;
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:13 -0700 (PDT)
From: Rishi Chhibber <rishi.chhibber@broadcom.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	rdunlap@infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Rishi Chhibber <rishi.chhibber@broadcom.com>
Subject: [PATCH v3 1/4] misc: vmw_vmci: Reserve a datagram resource id for zero-copy buffer sharing
Date: Mon, 14 Sep 2026 13:22:06 -0700
Message-ID: <137107b03a5e76ec39a0a7f453db892044ccb108.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1789413109.git.rishi.chhibber@broadcom.com>
References: <cover.1789413109.git.rishi.chhibber@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- Add VMCI_VMWZC_DST_RID to the reserved hypervisor datagram resource id
  enum and bump VMCI_RESOURCE_MAX accordingly

The hypervisor-side zero-copy buffer sharing service occupies its own
resource id in the hypervisor datagram namespace. Reserve a name for it
alongside the existing entries rather than leaving callers to open-code the
number, following the procedure described in that enum's own comment: the
set of resource ids available in the hypervisor is fixed and statically
known, and a new caller extends it by incrementing the maximum.

VMCI_RESOURCE_MAX has no in-tree users, so the bump does not affect
existing code. The new entry likewise has no in-tree user until the
vmw_zerocopy driver, added later in this series, references it.

Signed-off-by: Rishi Chhibber <rishi.chhibber@broadcom.com>
Reviewed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Reviewed-by: Vishnu Dasa <vishnu.dasa@broadcom.com>
---
 include/linux/vmw_vmci_defs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/vmw_vmci_defs.h b/include/linux/vmw_vmci_defs.h
index 60c9eacd2cf3..4435d2ff1241 100644
--- a/include/linux/vmw_vmci_defs.h
+++ b/include/linux/vmw_vmci_defs.h
@@ -179,7 +179,8 @@ enum {
 	VMCI_UNITY_PBRPC_REGISTER = 14,
 	VMCI_RPC_PRIVILEGED = 15,
 	VMCI_RPC_UNPRIVILEGED = 16,
-	VMCI_RESOURCE_MAX = 17,
+	VMCI_VMWZC_DST_RID = 17,
+	VMCI_RESOURCE_MAX = 18,
 };
 
 /*
-- 
2.52.0

