Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18D346EF75
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152725; cv=none; b=gZypvTD0oqERYsdtuoyW6PXCCd/qL7CLZLeI0Q/nnWle5oarlF8avpHTjH5s/zypI+909h0AoixgRDEInRUcuyb0RO6dDbtWsbiPnhzheRMthOL43Kitl2RE3u+iFv25qEA4ZqcHLt9JTteUdAjkjPUkAhaHZfd6+wDncIMHwYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152725; c=relaxed/simple;
	bh=oSQ+Mq6A5TscODmoyrIVu6iJjtgM1iNvQM6RlsRFikE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cyx5IuiA4F8xO7eRJwU1m/sTSNGfJSH+8iOLKnfOzOcFLH+lRHKwoVQaWaYvUvoujVu73suAqLW2m2h6Pq4/xwZhD6LEh5mbQjVdqTBnOYmNq8/Lew2gyKiTGCU2PG8HvNAKnuxHW5biB+9GM6eKGTAHKyh8j1WhzDj3ikm87kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vuk07DVS; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vuk07DVS"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a9b7e63963so998911a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790152719; x=1790757519; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rrd89OsQ/qKLyQdREPNPgMGcGQacoElL1Au38Xxqk8=;
        b=Vuk07DVS4C4K+iYU8h8w6LKcGfNcCk/P9Io5ViTz4W0YlFLUq/xICsnqvehIpeC308
         nHHhV10RtpNwf43aghIOrkyioFmKtMC0BRqyf/IYFv5Hm/cudGUo9CKHQcnpaFLI+gnu
         Rz9hnpnFcjbyl9W7PBFq1lHw6mf46t7MPnDKijRIHEsvbdsDIOhCvjAjH5n2SF5rPuab
         9BsiIW1bxSOhNS8ib8uxWtYL4kzWnEOQ1u1FuU7JXpAj+6tnSPtka0kZiHdGL8Kty238
         uG2/4qG3x5hkzRYCQDtJcDzdHPcsmi/x31CocI6bUh5IhdOdIIAwzAtB2MldNBs869v1
         gsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152719; x=1790757519;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rrd89OsQ/qKLyQdREPNPgMGcGQacoElL1Au38Xxqk8=;
        b=FymGMBt+FcP4j3rCo6ccY8LgijiQh1GfPt1cqayvNnL1nDhHSqVuJyErkomZ3q3896
         N3uEjmOuLqClQgk8plNVsOy0xqVCcWc2rH2RJZib/ZkseHqZdXTB2l/qo1gJlB/+a2WY
         r7v/sf/DrwQYDkFUYgc7DV15Yl/HhN34lFJXwS3jwswnuWYRkZ8M/aeEO92ghmO/9tYL
         SfUxX1tQp7RscOHjZwXYUhy89W+vJkP1qmI1EfBRcYQcIWTldE3Hql90zX7QuQ+5pkLp
         opRgSuSnHrv4FLWIQmtMsUCJwMXw5Bc572NgJ0EJCcbEIjgx2t9EggE54U7kmm7kbNpZ
         sYrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVXGpbdhbbPo4/mpYDfLh935zxGAPRChEUR1os0PiY35/tk9jNLKrzfN8u163kgy6Xj7bsTgf35aUfu+I=@vger.kernel.org
X-Gm-Message-State: AFuF++nctZyZ6sbOtz4nCX3cvVYPQQmKsMG6PuBBZy4+D8n/P5mlVvuq
	9czwpx/p9B40cd5wAGWkbxU+JRLq+5GEnYYKeY3ULZg2KmAphAY+GqoCxjM6lqn0W0YLfXpzM2U
	2J7FFpcD8xi5laFdh3M/oh36skg==
X-Received: from edxs16.prod.google.com ([2002:a05:6402:1650:b0:6aa:12fd:fc3b])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:23c7:b0:6aa:9fd4:987a with SMTP id 4fb4d7f45d1cf-6aab3b985dcmr1498844a12.20.1790152719283;
 Wed, 23 Sep 2026 01:38:39 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:38:37 +0000
In-Reply-To: <20260922-chubby-cicada-of-exercise-bbb429@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922-chubby-cicada-of-exercise-bbb429@sudeepholla>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260923083837.4133676-1-snehalreddy@google.com>
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Add FFA_FN64_MEM_RECLAIM2 function ID
From: Snehal Koukuntla <snehalreddy@google.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Tue, Sep 22, 2026 at 01:15:52PM +0100, Sudeep Holla wrote:
> On Mon, Sep 21, 2026 at 04:47:47PM +0000, Snehal Koukuntla wrote:
> > FF-A v1.3 ALP5 (DEN0140 rev J) introduces the optional FFA_MEM_RECLAIM2
> > (0xC4000091) ABI, which enables an Owner to reclaim exclusive access to
> > a subset of pages of a memory region without requiring the Relayer to
> > maintain intermediate transaction state.
> > 
> > Add the FFA_FN64_MEM_RECLAIM2 function ID definition to arm_ffa.h.
> > 
> 
> Since the spec is still at ALPHA, I suggest to add RFC in the subject
> if you post newer version so that it is *NOT* considered for merging
> until spec reaches *BETA*.

Makes sense, I will mark v2 with [RFC PATCH v2] in the subject.

Thanks,
Snehal
