Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463E244F569
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075972; cv=pass; b=ruCIfakECb0T+pw1tHB8Ux8CT7I/B/mCgJzoNfpaDYtjymRyJeDY6/rDlD4aeJuCv8Kpg5i7RpVxWXjPtkexe1bfiERFZJfFAMGbPqbrXKs+RAlu7q6Zx78swPNK1bSMbGC36IemID2rgrq9ZxiJ5geut0P1NoBLuQmKUo213uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075972; c=relaxed/simple;
	bh=ufzXj+hMnVisIYQm5mhRNXlmSHJ4HDjMJXpa9IW83P0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=ingh8nRLgA+O6Y725aMnZtwPCJxs4YNbYFXx8f4xBLiY7mN2Dc96/j0uB45y/PWUedGaDKMYUC/5zoLf6QXCVRiDfS0p4nE8XwxVBy8hSAMpZdtDoWzDTQQmzmGh/JBtKY/r86X3cO1jVsUfkM74+FkSzMcJzNwhfOqvLFZGFtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=nciGN6st; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="nciGN6st"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39675172593so220527a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789075969; cv=none;
        d=google.com; s=arc-20260327;
        b=V+dZjxbf14rOjg85nlDxhlk0r9ZSy53kZfkuC37vAv2CcL5M32h+WQzjDjwDeHJJpU
         k2K1loHcKP0AjD7EVq67WQEBWKxuufCKnKTZapLKVrsUCSHTatxIu6C2YEXY5Rz8Nouk
         /pcDammX/n4A/cpIjWCtgr3w1MWUmoAJr528evmZLvHsNsIiq2c+9HRFWY+1zen6038c
         FN4uXHGJjy7QB7j4jVsp/auLY1ihtKPlLeHyPdzZZXyiXCIrWigfCszM7Zrrg+KbOtkH
         QSQ3oTJaK/4vXYJH7xu0Q06xEIbqYwXFlDXMChjVhockyLTM1Mc637wvWs688NW8+4gC
         LNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=9LB6NWq/tHXmFqInVJbuTy996SeIixGc0WUFWyc5Eps=;
        fh=9gpeSW5/ItgohyTCI55LwPoSO2N1UIpmWDDlt7vwqfc=;
        b=MyWOtA751HC66SytipwhRcgmsu09tTfoEMvhqyr6H8Osv+jog7Su/7uRnmV56pvUBf
         I8VfSLoGhKgIHnUXjVwEszQFlyhdGh+3YGY+T0VhtmnrO+vqOIg6c7MtoNmImiefohGy
         zNjQco614AuZoivZ35hlLdtRRWFgUFPkmO1SPoPGKfxx752suwDQlBn8mUW/hQBQILjj
         3h7t8pHdc+l28G5JWIFjXc0Ltf88kWLdu2qfYpGkIQvXg9S2GwlFOOuYpGNaJp87vofx
         lCSUSeb2RYc+baY4hNVElRybM3xgsMXU0lmYiCtwQuhy2ZPc2V50IuekyioeI5RoSwPh
         XJIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789075969; x=1789680769; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9LB6NWq/tHXmFqInVJbuTy996SeIixGc0WUFWyc5Eps=;
        b=nciGN6stwsK/6yXVhMN1Rr4ow3y2aZP43LoanbRE2UGjRVXf3dw5dP5jcrBXDSzv9f
         fKddjgj9PW5sJVnCWQGrEV9zZi1u4MtXUylFOPCmF8QETaD8hXcHPFUiVDTsGTo5k+8q
         W01jCMN/pqPrmfyQfExrZ0Kn9OT/AOa8goOdHbPelt+3eHy6d4ENKjfhclU00IltVzfb
         xhXA421XS/twGBvTWSQuiWptPDOF6oJzkZEvMEgcEFxP/7XYyoq/xaKFXEPNaiCKJjpt
         WoC6JrcphhQUAE5ruCCuKMXKDN4WccE6yJL+q+ZbuVoA+Vt7OHCxUiAB7I7Y+VP7N38p
         8XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075969; x=1789680769;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9LB6NWq/tHXmFqInVJbuTy996SeIixGc0WUFWyc5Eps=;
        b=mBnXM9EOJtn0lD4X5+IRjNpd/yHTsRjnk6zvLUiGJMmfXgYZNUhC9yYlC99JBfr6Ey
         sOPntBpGHbyNWdIksFtS2dDKGSkuYrdW4edVaS33gcDD1Gg45tak9P6XMUOtZeGYw2gS
         TvlCRDkPzPxTullKnY82W2E5Dy3zTK+tyB7yaTT1JmZG7+Cp/5VlmtYM0CqtttVR9x/+
         FWpgtAgeWyiyl2CpiaH3S0/7yPBr9cr/azwOFajI+sEdyxgLtC/+c/ElH4vuxWRpOMks
         Fjm3iO66S3Cm+xIP2kAeEn/GEqK3eozbwKUUwi7gBPi1n2yApZkcxiYohtuQ6Sf6qjJU
         iOVg==
X-Forwarded-Encrypted: i=1; AKwUvBwZDPTU426v6VGGxC1rKEAtiwQqm95O7lfiXTPoOfiTjubtAM+efN8kh3bus+1FaN/YdvhCarxN69+49Xc=@vger.kernel.org
X-Gm-Message-State: AFuF++njiiwk+vrpAHPQUnjdXhQo6P9HGFOjN3Uh7o/rGcoA7f2VBuqQ
	I2JOmWPdAnStWWABL3cAPXbNbVKk7kIGlH3dmuPTWOoOiRyVIaOziGToN6Gm2hjYNkpyvwoMoPn
	kF9TNPTNa24iv7agZIAeWiphjDoOqPvVWV1X7GVGM
X-Gm-Gg: AYBFou1OSN4s+GPAbnLXy6PDuAjVXFyWveEWW5i7b3iVcUzx66qgjBRiEbpsENzl1NP
	IjN4pOecDAC6Wjqar59DYL2fOoBjzTn+uWO6CRP3536QamCSYN6mODHaquLSifK2QqpB4+otGn6
	n6QQWbuPR1YrGACwqT098VOXNksMs+22lIR1TXhhtrvl+x/PIECuWXfCxFzPfjCv3J/xctYggxc
	l9acq22fWBX3bAl8DvKNOXc7Ur7tkDHRSoo1c5HuRfMtdi98aRvU0ztpVu+IUPyyKyk8FDn3fXf
	Fd9grmFocB8fmx+flttBCW7JTYs2NgoKBJb9a7I5rkQ9H5GoKHAOHmBicELml0EfltikM1ZmiWO
	L7mxGwUugEbzLLLuySj3VyZ9zEk0HFRoc2N7sSbSOhhbfFcJbaAFq/A==
X-Received: by 2002:a17:90b:2690:b0:398:9c00:29ec with SMTP id
 98e67ed59e1d1-39d9c34b15fmr1113138a91.20.1789075968819; Thu, 10 Sep 2026
 14:32:48 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 21:32:47 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 21:32:47 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 21:32:47 +0000
X-Gm-Features: AcwNN1URJux_fomBEWD1vunfK0R38yI4yB1kHbbH6cW7X9Mqo9UdmM8PR6cgrpM
Message-ID: <CA+0ovCirfyOhrXdxmM3ri9-cShD0mzPptO1qtsaboS1xscaM0Q@mail.gmail.com>
Subject: [PATCH] staging: greybus: hid: fix off-by-one in SET_REPORT allocation
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
Cc: falemi@asu.edu, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

gb_hid_set_report() sizes its request payload as sizeof(*request) + len -
1, but report[] in struct gb_hid_set_report_request is a flexible array
member that sizeof() already excludes. The buffer is therefore one byte too
small, so memcpy(request->report, buf, len) writes one byte past its end,
which KASAN reports as a slab-out-of-bounds write. Drop the stray - 1 so
the allocation covers the whole report.

Closes: https://lore.kernel.org/all/CA+0ovCgLrz4WhPKP5LGW5HZa8VOodgeo6pWuyQGgHE7UY57Oog@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
The device was emulated.

--- a/drivers/staging/greybus/hid.c
+++ b/drivers/staging/greybus/hid.c
@@ -97,7 +97,8 @@ static int gb_hid_set_report(struct gb_hid *ghid, u8
report_type, u8 report_id,
 {
 	struct gb_hid_set_report_request *request;
 	struct gb_operation *operation;
-	int ret, size = sizeof(*request) + len - 1;
+	/* report[] is a flexible array, so sizeof() already excludes it. */
+	int ret, size = sizeof(*request) + len;

 	ret = gb_pm_runtime_get_sync(ghid->bundle);
 	if (ret)
