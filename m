Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6C233945
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895500; cv=none; b=j2Gj2ro3nnvPPaiJVSsLKqJz2P7dPmn+SJ7esXK1Tz35MbFI3NJwV6asv+fWORE4y0ZJOhJXmJnRK3GfQE++LhG7awkkyT0Kl0e+yXdRMT4imfeglHCRol1R7N87L6Lfcb6gbpFfyyRoGMERqo0sJpDOqONBUtC1AZsyM9j6Nmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895500; c=relaxed/simple;
	bh=ze4/KJ3EuAm6NIWKJY+q2AbsfJkY72VQHW9dSMtVRjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZM8HU7w1T6upQEHskS+9Y/X6jM2JT3FtKgBSRrIQhxbgljS2eSXqJK9FeMiP8SZGdmvfRZEUdjh63A8OeRhGJ7/iuzB8p01aNapNYGhuJaeauT66CiFoY4iZib0D4o6qQVtQpwduzLrx76RkbF7fJ0tzo0slXWqIpXT1vhuOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMwzSt+V; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMwzSt+V"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso537025b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787895499; x=1788500299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yOMy5UhVHi5zUg4dOHf2EhT83jF167GqUxIegg/QvOA=;
        b=rMwzSt+VhVNSMkX/YQ4dR+OJB0iEEiaQjqg30UnmniH5XnqShSMNiWdMakjtmLvgtv
         OfYZdUnLb4mefiN+PaDAjdA+q1I3Y/LLbc/+VU8v5/2wcMGAV1h1FShP/XQFadPV2U4m
         ZSMI79hqqYOXjp0CDElBc9dXq2t7n/mL6fwhySeAVfW+X52DhDnhOpDNGTaQVR+9Hndr
         k83cqAzDlcUEtUlw4KyV70wmx9/ElPn499J3Nbwste5kJLsnz4uSdhKA+iEtoVX8t0JP
         OTniwtLV3tg9+mA3NRiqT0enfrsnhjrTvjdipy6o8c/Es9pb2mnkixCcnOR06e+rj6SL
         Sgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895499; x=1788500299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yOMy5UhVHi5zUg4dOHf2EhT83jF167GqUxIegg/QvOA=;
        b=VisgT+RXjI182epLhpN05iCQ0/ArfsXEb7cLFRQ6uHeS/uXI2UXNVzG/l8j5AJI2EZ
         0k0hmumfYFw4+akSm1GCoZc4ZFxkyyPa/TWUXrsUhYCRVbCa/PPJBPMr5dkr2V3grYAB
         ovldQOo9KbzGRlHkUdYFTjpHfQyQyQr8uxI/dcOThK3HJfaZRxUI8otqLpyiRLXFErUw
         SO6yD1oJZptbVZ4X6yCpqKBYo/4gqvsYhtJRA+rTfzcuQ4wpph9T4gCBPTOWJDF8lc2Z
         YYvBnJe9vXrlPJq9A1NgAOHegaHMlx4JfePHCg15avozwxIW+XH6z6HWeYcgUIRm301m
         CCaA==
X-Forwarded-Encrypted: i=1; AHgh+RqroJ6pdh6sxVHBo85tMweOaUWNg6DMPvwrBBBlaZXXqt0DpBvbrna9fc4sDuhv6aisklKCyyHok7P7hvM=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ/96jhzXlPHJJq3/YvqFHsNfrd8u7phwn07ZMpJdYtS28dfxv
	O0vyQT9kgGg/Xv1m1g0KxqId1LwAtbS0xgAPV/510cHg4VhvYpyFXxdusr6ZYZqk
X-Gm-Gg: AR+sD13rXB0Y5IRURB6B6DPA2OS8/3Mt9NTKHPb659k7GC58b2UIwt2DwZM0KO99kVK
	uwITXFPX5Nz0/nuOYoGfbvxjaqqvqiXU++6BoKyrz/i2X9isgrpTgr0GwUGmWOxygGMcEUiG8Va
	1zV9z9Xw4o1XQhHUPmG9k4U97/6JmyzR8KPMZ+iviAjGXea72fooH9OFegDokbUYsrTV5UxqYH0
	VZHeyCsCw3M8F+8/DuHuTqTeZ1Snj6J31BAmOS2EiqPP58ZcdED239Lb6u9+PuvLkgNyeRssfiB
	NFIZYqq66iRsznWDjjgqwYboBPaBiVIfmUTX4MLUoHs59YnyrkmRnPQv9RQ1Nw10OJXYUMmroO+
	9Dp5dpvtptRzTUiVGdbP8OLkBSHcmqGYF3RoX3Y+W0PrmAJdEdETW0xvPJBoyt9tOuyIj/fbDOD
	idbEGXHFhWUilie0DJngJyAGw9UjW7UTvXHq+GB+uDmHHSZD5LC3f5qnkqK8IZ86ZZ2uEp0/BZ4
	Q6gAJToQRgO
X-Received: by 2002:a05:6a00:3316:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-8562b19ef19mr10115832b3a.14.1787895498970;
        Thu, 27 Aug 2026 22:38:18 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fbbsm219433b3a.38.2026.08.27.22.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:38:18 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com,
	lukas@wunner.de,
	ignat@linux.win,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: reject descriptions that exceed the index length
Date: Fri, 28 Aug 2026 14:38:04 +0900
Message-ID: <20260828053805.1410721-1-4ncienth@gmail.com>
In-Reply-To: <apEWZUFe8NmwgPDb@kernel.org>
References: <20260824113004.3755053-1-4ncienth@gmail.com> <apEWZUFe8NmwgPDb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jarkko,

Thanks.  You are right that the commit message should have included the
observed runtime evidence.  I had tested the bug, but omitting that evidence
made the report unnecessarily hard to assess.  Sorry about that.

No, the exact command above does not crash in my test.  I ran it as uid 1000
with no capabilities on the vulnerable v6.12.105 kernel, and it returned
ENOPKG.  There are three relevant details:

  1. The in-tree X.509 parser does not support an Ed25519 public-key OID.

  2. keyctl passes "%:s" as a literal non-empty description.  It does not
     request a generated description in that argument position.  An empty
     string is needed; add_key() normalizes that to NULL.

  3. On my system, the default OpenSSL configuration adds a Subject Key
     Identifier.  x509_key_preparse() prefers the SKID over the raw serial, so
     that also keeps the generated description short.

I repeated the test with a supported RSA certificate, no SKID, the same
32766-byte positive serial and two-byte subject, and an empty keyctl
description.  The keyctl process recorded uid 1000 and zero inheritable,
permitted and effective capabilities, then hit:

  kernel BUG at security/keys/keyring.c:1308
  __key_link_begin
  __key_create_or_update
  key_create_or_update
  __do_sys_add_key
  Kernel panic - not syncing: Fatal exception

For comparison, the same RSA/no-SKID certificate with "%:s" as the explicit
description created the key normally and produced no splat.  An RSA
certificate generated with the default SKID also created the key normally,
even with an empty description.

The original source reproducer, which constructs the DER without a SKID,
already produced the registered BUG and panic on 3/3 fresh v6.12.105 KASAN
boots as uid 1000.  The 32765-byte-serial control returned EDQUOT without a
splat.  With the patch, the boundary returned EINVAL and the control continued
to return EDQUOT on 3/3 fresh boots.

I will send a v2 with this observed trace and the before/after results in the
commit message.  The code change is unchanged.  I can also provide the source
reproducer privately if useful.

Thanks,
Daehyeon
