Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD00544E67D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044542; cv=none; b=kuIrteViubn4LIVKL1VVDL4GN4wPY0IROLi84810tDfxSxG0Z3OdBFVLiZDl1DRKWWDk8+tsC9YflhBiOpLTOiU3T0aZ+Ww8NzOSZL7KZQKUUfmBCi0Mfyvp5ksaVn2pkzDGDYph9JnSpXvze2xdARIP/XpjEfDIRYEV7RcE0vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044542; c=relaxed/simple;
	bh=aMsuVaXWH1b8osllmjJ1hmgRkfZ+5/T/2kOdW4StroE=;
	h=In-Reply-To:Mime-Version:References:Message-ID:Date:Subject:From:
	 To:Cc:Content-Type; b=XFpl7TMJmmeyxIIdRinsDIhlbUnE3o4uoONfO2FFmFGTlKHDb+TT3UhSK7VYDNdYxLyEW/AQTq0ThXokFz28OHnKx0luBkduGrdf7Oz/XSuvOYCDG+WquMc8b5SSDdyJiX+g5OPFPxJqTBkzhQbaBuhWxDL9PJuga7Phmk+CdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oqVnG5Z4; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oqVnG5Z4"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88bbc27f85cso6662225b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792044540; x=1792649340; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aMsuVaXWH1b8osllmjJ1hmgRkfZ+5/T/2kOdW4StroE=;
        b=oqVnG5Z4kRcSXU0ACFWV6OMIdKewRzW20eRe569l3LqYzCZbymc+lcyWFXMEPRjx6S
         sL3e99JhOQ42Njkgy7GfMJEj67EN3sUw2gQ5ZvvLklBrcZ1xLid4+rA9KQCy7IkiARir
         +559tqnsYvOiulPKYzCW2LqU+9xFo03G2A9psfQUVrZeNjXhfTeJTowzZv+NPaWOCe+8
         3lQmggivAUIvD3slx7ndGPVZoYU9lQjoKkIuACisIYVQfNYrlpfbbwemFbR1T9tg0dU9
         fF5afjZPSFIckNaDssKksJMgGde7w85ECfX+W0rSJCkV4HbI69JDIRHu+JMD7BmxZYTm
         s7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792044540; x=1792649340;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMsuVaXWH1b8osllmjJ1hmgRkfZ+5/T/2kOdW4StroE=;
        b=h1JNBjtUzXKjV33Y1TMqxuCTyYCiN1wrmUe2vQwyuqLGNCafQPyIAsdGBXaejR3UtM
         aE7DcUxM/52MK5qG1elCsZiYPv3+vTgitlB8crycm8L530mJ7JzV9qE/K6RXVh+vYC2h
         xnhMRHzzeSlhxCIOlSZvc7KsL7aHqeUSux/X3PZKOQXZTrpwyGskgdygdlEhOnxX3QlT
         jkdaxi4pezRJ8kZOFfvDUuN70P7SeL9XsH0UBzRDVW05zYYmk/cIbfC0DcoxjnZiguO3
         u1F2rkHhfqTvi59LaCLgZQXJ+1qItA0VI5mOZ9RpHPn/UgHxELGMQEaCodg4/41fDwZQ
         I43w==
X-Forwarded-Encrypted: i=1; AKwUvBz6cE4OjNru3t85R+SdEZ+tlzNWoj0w6FQ44XiVNf/NjiiriWI4DiL1idbTIooiZCq24xbyTLohefeU1nY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk/yIHPTcynlG2eOzvncqn/FufoAnM9k2Z3KiVfXoaIU3RHsuo
	kMdsDS8WBsqER6U7GkYt6Jg67zQj9MmpD88C+60bNP+CPnqEb3vUPL8dJSIceDH5HiAI017pw+1
	Q0KYx8r40iEHMFGfhsJN47w==
X-Received: from pfnf23.prod.google.com ([2002:aa7:82d7:0:b0:88e:c0e0:7ea6])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:88c5:0:b0:899:a361:ed46 with SMTP id d2e1a72fcca58-899a361f1bamr12086714b3a.58.1792044539812;
 Wed, 14 Oct 2026 23:08:59 -0700 (PDT)
In-Reply-To: <db212304-4ae4-4b5c-a39f-74c3f0b7d791@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012120059.1371653-1-stanleyjhu@google.com> <db212304-4ae4-4b5c-a39f-74c3f0b7d791@acm.org>
Message-ID: <18de9f03a5560051.3137322e31362e3131332e313435.544be.0000sendgmr@google.com>
Date: Thu, 15 Oct 2026 06:08:59 +0000
Subject: Re: [PATCH v2] scsi: ufs: docs: Describe how to test with QEMU
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeuk Kim <jeuk20.kim@samsung.com>, 
	Bean Huo <beanhuo@iokpp.de>, linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On 10/14/26 6:14 PM, Bart Van Assche wrote:
> CONFIG_BLK_DEV_ZONED has not been mentioned. Does this mean that zoned
> storage is not yet supported?

Right. QEMU's UFS emulation only has conventional logical units today.
I'm preparing a series that adds zoned logical units and will post it
to qemu-devel after the UFS patches already queued there. Once it is
merged I'll send a follow-up that documents CONFIG_BLK_DEV_ZONED and
the QEMU options.

Thanks,
Stanley
