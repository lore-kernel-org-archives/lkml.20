Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2AA468C23
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435001; cv=pass; b=luU5O08GLcwl3kxx7QD9YA9kf7SgwQQUM1DWPphorFybWYYaT1Lj+vib7i7Dungx2DygVwRHOqCM77+XqblF27voXkdiCoLA1T7lzr6Aah+nX1ApbyOWYQuPgzO6dSbPpqoSBymr5GJhNi0vaIekIahlEzmP/ay0s00SPMEtHi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435001; c=relaxed/simple;
	bh=zVxEUER+vovhITHpwOAeij4FL/yULLzNoKNM7GtRucg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KfKSy/xFYGQHEIu5PBmGELdv0QXURhcXX6cF/6LM+jAX3rWgPiZgYDH60nC5pvu+oPVSr3md6wJfIpePYOuqUgM4LSfDQa2s3OFmTokwZf0DKVZd6NrU5988XnNXk0DIgmwhjMGbF49RT2O0IbLt4NT6BLMpKzzTwOCHr6gwSN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NsTtA8Y+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzNLwE0p; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NsTtA8Y+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzNLwE0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788434989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=XooQYKR9Puxgt0G9f+A4PYpT9G+l/snRHdODOQmPlVM=;
	b=NsTtA8Y+iZ16l1mCXQY2hoUVWqV7b+0sDAEaIf3yA+b0CecOiEaJVQJ7flPsv0MDj9MkgJ
	J8Md/G+MvyjcX94334bqqQqrjsqc9tsDaADOWSQRIJ13aFrFMWBZS/hYL6RGLvLKMwevTh
	HJOr12jYY7DI1KHBCRZox/YIY2xM91g=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-kh9CAx4cOV-l70Pb3k4E9A-1; Thu, 03 Sep 2026 07:29:48 -0400
X-MC-Unique: kh9CAx4cOV-l70Pb3k4E9A-1
X-Mimecast-MFC-AGG-ID: kh9CAx4cOV-l70Pb3k4E9A_1788434987
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so3398937a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788434987; cv=none;
        d=google.com; s=arc-20260327;
        b=nKx7f+mdWaFJHaZWaqeCqV1fe9/YGFTROG78IOMNqD0CSnfI0G4OBc1/KcwN7hqRRj
         yS7Icu0uLlWbnsllIPzWv8BM4XgSFAIfMZxgLokF28Gh4911idJEHnJV9/uhCe+w1JUr
         lKX0rpUhIirKAbfwJCJ4OvS16YXFv20YhTEzm/RDRmxptlKVXF8Quf9C8NBiTlVdn1qI
         ueHfAup7QFYmT/d/l21jKJvYT56xSzF8KQkFEq5mjZQtScdRz5twPO2PHXP0BDLFdnAN
         AQ+3A/S4Om9dmdU2qOpUJr8Pmw4wRyJNccimeHh8douQQC1Krm4ZHIvhL3OTGZcehF+r
         wq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XooQYKR9Puxgt0G9f+A4PYpT9G+l/snRHdODOQmPlVM=;
        fh=6Q/HFsihf0R3YkQPIudtnGhqPhs3ExwDlGc90RLWrNU=;
        b=WiyIs2E3yvncQBzEeIHwLJ5TOMpOi5WcGLNiUBzx1f3OvFbCiaYqVIsH31/7HQqoM4
         0NaBhO6+NFVXWeytymvgT2Um2uEVhPyf10q+RspdDSAX/evLLs8kikP05GIfF5a5vPEj
         6Yqj/JfhLYF5DcPj8s6VNheFo60cEaOXkQxyT1m2/kIOCj31jGuJbSR94zDTNyjYPV7j
         fTB6752f8d6kBNwB2myni5KRABJzsVBS2VU2CqZsDN2QhF5cWg2/JAxyveBH5PBihTHZ
         X8DQqRBeSRHL3cOgkHGzPsxlA4hC5bclZYPMNVQP1sHRBg2intNwIabethvqed1QiPmH
         kZdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788434987; x=1789039787; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XooQYKR9Puxgt0G9f+A4PYpT9G+l/snRHdODOQmPlVM=;
        b=hzNLwE0phY1SmJggT0ehhnelzeIyBxjsAp9ZHdbPEm7bVSayrU3vpFHmlclaqK6PXH
         uECal8ggTtXofakmes+XWIYHF8XfycE8o5WpjWDp+MwHQCAYwuEQkDqBDGEnhhtNLEVc
         WhBwQAfHkyr3ElimXJsuj8TQEkbKgesL5hbKEPiWN7ulxkSFwA9eI9MSV4xZo+fKnzaE
         uL5GJRK1bdzqwoSeQgSQStSbGPS4gf+zNLow4jTxoEtvLeNl31vQswFYkkUZ1xy8YjnE
         W0Gbapu+lFhex52OpEOE8SxpE79wDKnVG8jBuYh6zmWziNlQ7xIQnGSq3LmFqfJ8QfRi
         jeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434987; x=1789039787;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XooQYKR9Puxgt0G9f+A4PYpT9G+l/snRHdODOQmPlVM=;
        b=OWZ/dw/21UzvfEAZyXkzyLZS9WNlqpT6ScWAdncQn5O4DQKcMyn7V7wLNUbK5gWm2g
         8phmIeNDkaggEXLs2Q3GY6bavgkio3O/qDfMeU8gQQC8s6UNCNeW4xwzI/MnhUdSUZ74
         JQmHBXgi7NLMfWWDGQHIVc9Jz901iUvHUJt/cN1w/JrJfaUMJSVywJ9fHbLWDQAuasFu
         ngzs6QMtAdFrTKrr7lKYvlQqKZVsHqW/gazXGhFk8TTzciALrbumYvjRhSp6vFYioJt5
         81/v7mZsf5cDCtaUAKvUJZ8Fe5dTAx4z69edXEbh2rw33bbgVSf9ru6ifcT5XDGWQXOz
         WAtw==
X-Forwarded-Encrypted: i=1; AKwUvByO5yy9lygtvdBJDsC6BCnCBnDaSsQaFsOJ8zXv1o1Dx1X14pBoOG/RBPz22TSOdo9gvrCx6ycngK2kzjE=@vger.kernel.org
X-Gm-Message-State: AFuF++kkSa1CcYDSe1fC0lWYfdjDO0XJ1xCjWigw6gwPX7iKioeiLQyV
	YWUP8hJ2TSYL25eWg+g0HmGgMeqoIez7DmLWc80oAEA7TRbnkWcsSDsrlIatjchXoLKE0N1GIvA
	KdYF+ZLQEDVOUkjRynn16HKpBiPBzVavSimPvag9t/bnd+3xITZf+wOblwyORfAZCtUkaMNVPDv
	E3TsQWUtLQ+G5fx5yWtIaKdwtBnJkZsFTm/8bCBX+2
X-Gm-Gg: AYBFou2M3rc779aZXagtK0A9YlyJzuGxUaiH5nfq5s2Y/bEDPIgSp9/T+xMZ9TBncBb
	KcSvaP0go2S/GldkozNKgcV7Q7DwqhE3ZljKbHBfWjNyjJpogisD3/EkVEVe3tuZEG+RpzkZ19N
	oEUnceYyKRJxsbGMTSjzqzB4JiWHzPu02A4L75IcNDnntjciymLRjlK3Lo
X-Received: by 2002:a17:90a:114f:b0:399:1b08:28de with SMTP id 98e67ed59e1d1-39b13247f46mr3961970a91.7.1788434986642;
        Thu, 03 Sep 2026 04:29:46 -0700 (PDT)
X-Received: by 2002:a17:90a:114f:b0:399:1b08:28de with SMTP id
 98e67ed59e1d1-39b13247f46mr3961904a91.7.1788434986124; Thu, 03 Sep 2026
 04:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Thu, 3 Sep 2026 13:29:34 +0200
X-Gm-Features: AcwNN1XauK1UHYRFaqFGM29UmCm7nNRZqtPbHkS3EwnXkUnjWmV2sSB-gTg8_vI
Message-ID: <CAFqZXNvOGbzy8-ZnJtKi94jfu2H173Tz7VYpK8KuseMQS-9tNA@mail.gmail.com>
Subject: Heads up: Moving to a different email address for my Linux
 kernel/SELinux contributions
To: SElinux list <selinux@vger.kernel.org>, 
	Linux Security Module list <linux-security-module@vger.kernel.org>, 
	Linux kernel mailing list <linux-kernel@vger.kernel.org>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Paul Moore <paul@paul-moore.com>, 
	=?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Due to certain upcoming changes to my employer's work laptop usage
policy, I'm being forced to more strictly separate my work-internal
vs. upstream/personal environments/identities and in relation to that
I'd like to transition to using my personal email
(omosnacek@gmail.com) for my future kernel/SELinux (or other upstream
community) contributions.

My work email address remains tied to me for the foreseeable future
and nothing really changes in terms of its abuse potential or
whatever, so nothing bad will happen if someone accidentally sends
anything upstream-related to this address (or continues an existing
thread), I'd just prefer to use the personal one as the default from
now on.

I'll soon send patches to update .mailmap and MAINTAINERS in the
kernel tree and SECURITY.md in the SELinux userspace repo accordingly.
My future git commits (e.g. on SELinux GitHub repos) will also start
to show my personal email address in the metadata + Signed-off-by.

Hopefully I didn't miss any important detail and the transition will be smooth.

-- 
Ondrej Mosnacek
Senior Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

