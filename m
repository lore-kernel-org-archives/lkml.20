Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F66F442FCD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109660; cv=none; b=irPu6YwL2v3BmGaDcNgDmLuHjrv1/5XB08E/ke6DVsJ3gX8UbO/h3DnB90e8cPSmT1JJE9dGXLPNEtE0HmpcdG8u8XGM5TzFtdILCrgk+EfMaP0RanqBVUUMaVGJqoWEh/wuSD7GsxOWe0otJeatV3p518PH5Kuj7NafFiFLkik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109660; c=relaxed/simple;
	bh=vry3klap9u4GjQNVsbX+2L8vo2NtkD7sLGYczUDYo14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k1l1hyvgy6mi+QMNx596MFm9TRGGVm9In7Jlo37Y59y6nBHdT/HkU3uQ6yoSvft3B/XzkLMncQhnTqtSOpGiOWM+kbG6GHEYsUET0BCX7NlgR2iHGFt1fAcDn7RssxcyaIQG8+38pUfwxswIdcFEkLYJjcy3Zds3A4DsJJ+0MLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlnzFUjl; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlnzFUjl"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398e9698a70so632484a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789109649; x=1789714449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45NBjTXP85L2NWWZj0GIgJ+kRVkTLutBHdaU4FJg9VE=;
        b=SlnzFUjlpJuAXk0c4b3WKTWOvoL+gm2sqyb3LfKwwJR8cVF9mDXqq09ORQttoyGzAt
         dmzREDFpCCqYAxK6AEihFp12q/BWiMevkgpjlBM9rx97zuYQ+EmRZhm5CCD6ER+EX5dp
         ex0RPQrRUusWtooZ11CaQkWmACqew9arfxr1FH12/0cjihqIHjDcia4owZHRMtREkuXi
         8Lq+71sdmKbRGpF8FO53Op0Fuqdh8DYPhAN0b10yJtUpfRqVLaqQy+60iNgLN/PMqZ10
         JAf3jPZqEC6enNRIquNHovJt/voL/7bFk/XZObOlMObsi1qatqJSvAEcc+27ZjGRbXLl
         5NFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109649; x=1789714449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45NBjTXP85L2NWWZj0GIgJ+kRVkTLutBHdaU4FJg9VE=;
        b=qW8ZCDWZyig8GhwSUmuSmFwrPsc/elDPcK2W9Qm6wep+DC4FhFQUaxlj4j8BkE/eCo
         /QUqt4gq8P9YOdMNByHeuOzBARK4A5/x6VLg2ikrYk2o6DIiHbIJqjwBEYggqNHN6sDf
         J39C4EVHVj9MFAful4WIH62TLYL2lSHHl/xUXKHh/l05nnzl+kudv3du5wgtz7YSTJgE
         m8zpMxy0jMNTnpvdNuncxJD24ThpEUhI7JURiK/l2dcRzzn6dtKptTHGNcHdcHcJFCOR
         r+cURcdHPKXlTHkd9etk0dgqLJWeucXULP0NIZHyPap0TQBJsiCGShoDLqRTY3n0M5sD
         3dSw==
X-Forwarded-Encrypted: i=1; AKwUvBy+wSCZj3y4vAi0oEGEjta64Uz8Ne6LUtQarcFWgIOdBMFslXo1ScsB1PdD/6WWyq7Lg9528tZ73kfywPM=@vger.kernel.org
X-Gm-Message-State: AFuF++n3jIemFALIjAw/lyfg/qolXBWtwXXHc+cmcCjSaTRY9/VQHSGC
	1WHlKopDYnT4Z1muNTRi+A87CujEHKEqRmCoIE3OUYct3EmCDASW9jtD
X-Gm-Gg: AYBFou3ofQuquX8qYi04jKZ9t6d0RPXsivAmkLBKgv3tOoHIXMH8cQF7tRK5HvLJ6iX
	s1Jbv3nxeg2kreFBBCuqpOscOWlC3ZM7xI9NsvS8UlITh1jpZA8Cmrk83/sKPxGEQhfNRj9Xxf0
	1DUTYqSI3nSITH9MDx93R5uyC3jMJWizfLg3PpuqeGKB75l1Php65QfOummgY/1vA/U2o4tfEYj
	yQS4aJbtgkEz5RUdnNL6HSFpRPPbAzUDP/M6G3ZfZfS104PU5RSakK4+qAVk/Gds/5bhIUDStwT
	nDARqe77vAs+zRxwmLNK8RnFm2T9s75siOLIBe2MZtskELikh4A0ynuZfovfO5aeJyUAPoLXv6l
	ozQWfguR46kRjgtO+YJTuP2sbkbwOL9W1oWA994V4BoGfl3VmYCRad4jVkoGaiUXoskWHWe4PJY
	Dzi0qqih5EgT5C1U+4cXNOy9+ahJJrCMv2alaON8PFGsEToF9JRM8jSonZUKlwCyFiiKneMdpie
	Xu8aZgU4eT26CauoHSfaMhTwcE11BZ/H9T2NaSl3eBuxeo=
X-Received: by 2002:a17:90a:da8f:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39d9bc1007dmr3989259a91.5.1789109649253;
        Thu, 10 Sep 2026 23:54:09 -0700 (PDT)
Received: from localhost.localdomain ([117.88.121.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da1ad5d79sm1830549a91.12.2026.09.10.23.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:54:08 -0700 (PDT)
From: Aohan Mei <ljp1205831794@gmail.com>
To: gfs2@lists.linux.dev
Cc: aahringo@redhat.com,
	teigland@redhat.com,
	linux-kernel@vger.kernel.org,
	Aohan Mei <henrymei@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH] dlm: fix RCOM_LOOKUP length underflow
Date: Fri, 11 Sep 2026 14:53:51 +0800
Message-ID: <20260911065357.3511466-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aohan Mei <henrymei@tencent.com>

receive_rcom_lookup() derives the resource name length from the
peer-supplied 16-bit h_length header field:

    int len = le16_to_cpu(rc_in->rc_header.h_length) -
              sizeof(struct dlm_rcom);

The 3.1 receive path only bounds h_length to the range
[sizeof(struct dlm_header), DLM_MAX_SOCKET_BUFSIZE] in
dlm_validate_incoming_buffer(), and the RCOM case in
dlm_midcomms_receive_buffer_3_1() performs no further length check
despite its "length already checked" comment.  A peer can therefore
send an RCOM_LOOKUP message whose h_length is smaller than
sizeof(struct dlm_rcom) (48).  The subtraction is evaluated in size_t
arithmetic and wraps, and the result is assigned to an int as a
negative value.

Both consumers of that length only guard the upper bound
(len > DLM_RESNAME_MAXLEN), which a negative len passes as a signed
comparison:

- with rc_id == 0xffffffff, len reaches dlm_dump_rsb_name() ->
  dlm_search_rsb_tree(), where memcpy() converts it to a huge size_t
  and overflows the on-stack 64-byte key buffer;
- otherwise len reaches dlm_master_lookup() -> _dlm_master_lookup(),
  where jhash() converts it to a huge u32 and reads out of bounds.

Drop the message when the computed name length falls outside
[0, DLM_RESNAME_MAXLEN], which is exactly the range valid lookups
use.

Fixes: e7fd41792fc0 ("[DLM] The core of the DLM for GFS2/CLVM")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Cc: stable@vger.kernel.org
Assisted-by: CodeBuddy:Kimi-K3
Signed-off-by: Aohan Mei <henrymei@tencent.com>
---
 fs/dlm/rcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index be1a71a6303a..14d5ab658f60 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -385,6 +385,9 @@ static void receive_rcom_lookup(struct dlm_ls *ls,
 	int len = le16_to_cpu(rc_in->rc_header.h_length) -
 		sizeof(struct dlm_rcom);
 
+	if (len < 0 || len > DLM_RESNAME_MAXLEN)
+		return;
+
 	/* Old code would send this special id to trigger a debug dump. */
 	if (rc_in->rc_id == cpu_to_le64(0xFFFFFFFF)) {
 		log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
-- 
2.43.7

