Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1656B3B7772
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015558; cv=none; b=Ak9cuM1fW5lp0txd+Q2kLM97mHRZjaeWbbN2RlSdrGyH+FA4Pi9Gzo2jDTeW0Eo0A9hDRKLTll1i2VCMBgsV+7pEjamj2JlTfhoySG42G9mf+XABZ1zyn1qVanl2ASrxP9tOE4c/mItFMLrINhHk9HW97f3l9fZszxwEO4+KLsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015558; c=relaxed/simple;
	bh=VC7otQZ74/U0zxfBSCtsUkyb+mSNjbA+kl9FOsvo7Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YNWE1bhEhwGobjib/FB8jQZT5OFn9Ln2A21nowsrELRfDMPdW+bPGY2XLEw7CrAD31/nivTv1thkma2fj0ZziGvVGFnDndFoBf3T2JycCQWjkHC9aB9/9UMK4WMCTFUuETGJc1bVZz+fzrrA9gUvMQ2nkqei1PDl3StqKwoZGe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anIo3uz3; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anIo3uz3"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso5856343a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015556; x=1789620356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0z6JGFLaGBLU0pTN5TYYEvd6B7WsmC5aNfWVo9r7wJ8=;
        b=anIo3uz3pF8Kh/xNR+O2qxLbO3aPRS97dpLfKX9zofecB2bOWzoTt7kL0112lDD+6Q
         wgpxRBV0cY6+ePD89VEmYmSBKTbvmAQjh78rBsjA1snhytv1RHZUHIM9O7hoX7iqh/RG
         Cb1JnbXCyrfsc3JSbR5S14kR6Cw2ygRRnz0+FQo3RJSMW7/Q3mrOv7CKm+oWf2a8nMJc
         07lSEmKQf65Je6Kfm4Gls4RWCa1YYmwuBk8mk12OTc3VgSobX7wsO7YyO4jzpXMUqA6f
         mMlVHHy3gca0Onne29drz17jnJN2U8DsGLUCGUsKeOYtUeWYbuGurIr1MSCfuxn42vCl
         4SHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015556; x=1789620356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0z6JGFLaGBLU0pTN5TYYEvd6B7WsmC5aNfWVo9r7wJ8=;
        b=qLwH2qYuQs52RG6n1vMDkPAJLFZ/t+vRfc6TvxU0W9lO2GygDuYDeo7/MrdyjaySNe
         oj6zePpSP7SBmpk4641OGLbau6mpSZr1vxhXiGBtLBMond+8xs33Ts1Tyq115Vr8OCFB
         A1dRyEoMF+jJ9MTquQKVfSkJjae2OYUIjwZ1GzlJK7o0lZGOuqK5OPViTKIhRUWTV6+b
         1WrXwv/3LQOf1Au367YIEWLXotjQN7BQy3PhUf4VpBDCM/RtnIAYvvtm8YB54reczYty
         A5iGh6NC241RSSX63oJoThGvDdv9mO9LBgXpSol0+qFsgnGUvEgaL/PjyM603kf+6jcn
         E3JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvlF1qeloKfOJZSxL/XbMfJWtLFa6RnlStDhIUQdWCqDHA2Y/8W/1ZB6I29ef4JD1A0QndNRxeeOVXmvg=@vger.kernel.org
X-Gm-Message-State: AFuF++k51Bpv5eP2yXpmOEBNMUH9aKtg6yiE/gXCsDR475Sl7MKiwTv5
	XrFOhhsbjRP+JcyHZv2q+IcT+y3LmmaownYviQcI3TKPReEuzxc4qSmzqcq3zw==
X-Gm-Gg: AYBFou2L9y2/Z4LEBGHpFE7V0enq8N7jTvu//4X0BZ5taD/w+SeMNqobfmCwSKTwTXG
	06FTSGgzRLULURbMtBAIzsWgwRuuZI3pqlLiuCRbooJ7gjNObX3Q8KmW9pjpUhcHSbNf+x/vsgc
	A4UGUTUkpWifH9iVeDzvx+uMR2WXbWTACUc//ncCcCfrQGDxaqpxdauYlDA1uq+pN6zDT9sCXj/
	YQ4JfJYppO7sOEwAsviFezmOwVoL80bdlO8FQOWOegdm7/vVZi1Z5rdCrFbJW38HDxs/WPpwVsY
	HOk7ecplLdQIL0sXuq1UDud+jojlCaapKc5xCyp+zGJhIFaKPoKbYt2YvSnlyXLnJn2beJlMg96
	SvDqgkUJXAEnKLSQ6j3V4S+wdpFDcTZdWRVMkW8syCLqkVtbqhff/gpcLMEtz+rhqlnAR/iMuMm
	8KV070nplEn4rybo/E4lLSo1sfa7Em4PPvrIZOTMEKbISvgzZyXT6u9L+W9rTdy7cH36Xx/IG7h
	P4sSbIzBszGlqirUadCHWJ9Aw==
X-Received: by 2002:a17:90b:2b4e:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39b2622b9ecmr58740166a91.20.1789015556341;
        Wed, 09 Sep 2026 21:45:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm45547140eec.18.2026.09.09.21.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: nm@ti.com,
	ssantosh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: ti: knav_qmss_queue: Fix typos in comments
Date: Thu, 10 Sep 2026 10:15:51 +0530
Message-ID: <20260910044551.50308-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "specifes" to "specifies" in the knav_queue_open() kernel-doc and
"accomodate" to "accommodate" in knav_pool_create().  No code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
v2:
 - use the subject convention this file already follows, which names the
   driver and capitalises the description (Nishanth Menon)
 - also correct "specifes" in the knav_queue_open() kernel-doc, so the
   file is done in one go rather than a patch per word (Nishanth Menon)

codespell reports nothing else in this file.  The remaining hits under
drivers/soc/ti/ are in other drivers and are left for a separate patch;
"indx" in k3-ringacc.c is a struct field name, not a typo.

v1: https://lore.kernel.org/all/20260907062247.9994-1-hemanth.selam@gmail.com/

 drivers/soc/ti/knav_qmss_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 3e4041454f69..6186454dff51 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -509,7 +509,7 @@ static int knav_queue_flush(struct knav_queue *qh)
 /**
  * knav_queue_open()	- open a hardware queue
  * @name:		- name to give the queue handle
- * @id:			- desired queue number if any or specifes the type
+ * @id:			- desired queue number if any or specifies the type
  *			  of queue
  * @flags:		- the following flags are applicable to queues:
  *	KNAV_QUEUE_SHARED - allow the queue to be shared. Queues are
@@ -805,7 +805,7 @@ void *knav_pool_create(const char *name,
 	}
 
 	/* Region maintains a sorted (by region offset) list of pools
-	 * use the first free slot which is large enough to accomodate
+	 * use the first free slot which is large enough to accommodate
 	 * the request
 	 */
 	last_offset = 0;
-- 
2.48.1

