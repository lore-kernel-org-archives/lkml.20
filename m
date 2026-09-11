Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3498830AAD8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088438; cv=pass; b=uRBecbc8/+ya6D7YJKqhMwTqCekQywCqUTPMTMFfH8DycburZ27NPDx/bpwIcvsbLS5hhehGMPmvzYyVqYeh/GC4oDKt4GsAtp0zEHBQ/zKlc+5mSHHk2Ft7agIuXJH3HK3L9cUZ6F1HT/WqIjg+ddlU+CT8k2hwNXRLI2rvF0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088438; c=relaxed/simple;
	bh=cm3sMjj6dg/Ij/Ch1aHvmiK0QfwA6u8gf3sSA0DKTl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fhx4XUXlkaLLIaWyjJwaLx4RHWbEh8BD/KBRxWnX/uPBFFWvgW6CjZzheb7KqPsFuf7ZCWDqr5MZwIayMyWU/xPYebc+fntiPpXQk8Blgu5Bh+iNXEDlbbyHX/Zf12AriOfxxpB9tLb1sJrnBiLhONIPLQIDcMf4y83QJLReYWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EAQZBrs2; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EAQZBrs2"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so2810a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789088434; cv=none;
        d=google.com; s=arc-20260327;
        b=NCypNtNKUaQfJc17m2d7Cl9bacOuvod8dfyGbjEiFvYwe5Tms0m9NeZeQQav3T3Qyh
         H4EyALQ4LQgSgeW4v3nC8QXqVXDGHoJvaO/OYKHabo3rNl1BoSHKWKt0UL/gKKlwBW4i
         pk3TKXf9KBxMz+VRNJVuwait2lHXeZf2ZOLq0WBlKFHJbK4ZtCZU5qMYBXr/v6Ka4qHf
         dMGkllTtuhqXHwLvpSMnV32aSzBzPIUb4Ds9Dj8pRp82eCyxDDv4XScq0ZyEtZEDE6PD
         buM7679bCBtbkFrWuMGXUmwYS5wc1VlgLW4RdC4HJsPJOI95E20E/XW3ED7zj0Yd6Nn0
         00tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9W7wf5Z1q//5NgqTWb191yrPA1yIRBuapqyaZSNqGrQ=;
        fh=CUzyKAbNPjD+Bgv60PBX464h0FjEdBAhrEyPam2PqBI=;
        b=Iz73j75gWq1RmWSR1Zrv7x97+KEV8TznXdrhqLTqqrJqs6LSQa57WmGT4+tstNMbQY
         Gntazyt/ua2nkV5LWf/SPaF9Dd1LPWS6U17ygTakbzP0jrR+phcTHJXJjxYxfz8U1Rfm
         EkxSdXPHcwNlgU2b4HbWotuukRXUxwwKZfKw2huZ4nwqcxnMXTmuTD18sOqjwdV9Pg+W
         3gx1oWi6Mujpz+j6zWCPuczW7bWMjklDjZAJ+et6YGXQF2XJdT3/qaQcQ/s9DNkGC5UV
         E/8aBpPxM6wGhAiIxtFRSSutoxqtT3oaRm30ocqfe6wc3clk1HY53A7B8w2XUn0J+4u3
         SoGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789088434; x=1789693234; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9W7wf5Z1q//5NgqTWb191yrPA1yIRBuapqyaZSNqGrQ=;
        b=EAQZBrs2VaqQJSisxlmkVHMKRYElEl5yzM24IdKWNVa0bgLBpIqAAvMvRcYZfb49oz
         hOVjJwiQBGt9t3fDm6+n9s4Grw3HSuoj2XlElWit2RviCG6ReYcPu898/zbIOlE9o1nC
         EOaDrb+DgJGIWh0j2CzTpS86JcCyjdvb/4BP+/IoBqsMAqR8kExZxASMJ+AlwqQGfMJ5
         nvqT6VJIwwcdsNUG6QsM0/4I6S2i3gujCdfJweNwSDz6EjMnhG+mLnrdq9rHzJyS5NPb
         1r3rT/2vDE7CpC9n2mD4+RSPrGjlhNB35EBYf1KTzSVD1vsd2sYMO6gmUyj5RaRCc2T3
         K9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088434; x=1789693234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9W7wf5Z1q//5NgqTWb191yrPA1yIRBuapqyaZSNqGrQ=;
        b=GLJPQuT7p3RHAhBxPZWENtkJFyX7RO/ewn7kTbSnKAfUPjX9P5ciKmCaCC/saVLeJe
         3V7dmC9+6oDtwRS7AKeTq/zeIQ8cyxHvet9so6RiGP9eOJazcN6Udr9RgpwPJqdjv8bN
         NRuoKk5NYmpHhPMg+VyJN5ejmZ3VJjOe7vTm5owDA/Hle8l9kUz8MlBaECXRREr+Bb8X
         R9oihLzaBljO4oGguhxthyN95/5jVW9qM7EZHuQe6dLxCoFw3bL7Yu/KIEfwEv4v4/wX
         IHUrAdrSSrReSZGZrft4eZgbJj4Dc2QC3Ijfk6jhezQ+yZh6OOY3k63ASjYET3/iceem
         Er7A==
X-Forwarded-Encrypted: i=1; AKwUvBwNa4n4EU3h8+qq8EXfl99DOnDtSEUupl/vwudqgcNssC8LoQcnfYnFPWrd9w0JFJ1LMAaJY17waL7hR4A=@vger.kernel.org
X-Gm-Message-State: AFuF++kFt5Lngy3QQOiaC1Qr6GUlTCw0vb7OraX6mLlX1SmXIVAk0z64
	RIXk6ydUYERyHMj6b/Nk8pULiz18dL0r4m69YM1JSClA0xRfWI97WLMtzqUyi4gjonHWQNwfPfV
	g+qe6Tk+F+uY0n/8picb3JqvKbvwEUwEYun444Uo=
X-Gm-Gg: AYBFou3bDeR/mnc5cIWHwApFPya39Lu4W0Bfvo4u4REl7b7lbOywNjwax4KIIlEdx5v
	L0LwhXyq5fQhLOMI/Of4UHy5jxOlcQQc6DE2wbjk5tEEEe/zT6RzG5jbFut0+cRqQ4r7W154dZ3
	ibAzZ//oek5JA8ZNu756Ot/Ws3xeGgN8+UhI4GEdkhIhaB4ac3O4+/ftBN3ApFdhxpoE6Yu8Hw+
	/VafhPuFAtsGWhfZTtxbRUXEfXV2gDy/qD2X3HpSKFRdJpipC79tDH7A8hzrohiFmE5ItPMe5k0
	yzEr9BjEbRluSwC+2R1TUgQGohjik7FMwHAuekKrr5RrTOXEFpf0A0MCe4S7GjhZvBos86PCIec
	8OOsew556mf8=
X-Received: by 2002:a05:6402:424d:20b0:6a4:abe:b08c with SMTP id
 4fb4d7f45d1cf-6a9b57cb410mr21122a12.12.1789088433597; Thu, 10 Sep 2026
 18:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com> <aqM0RIiLVqvwit-w@google.com>
In-Reply-To: <aqM0RIiLVqvwit-w@google.com>
From: Jacky Li <jackyli@google.com>
Date: Thu, 10 Sep 2026 18:00:22 -0700
X-Gm-Features: AcwNN1XUgXbbn5nwS_6gLkiHnK1ioVC0BuqHuY5_oGbYdwxTTcUgR_nTxyMVzt8
Message-ID: <CAJxe5cuFaodQLcKvSTytobb8hszH+YhPpvoQ14SWQpqh-2986Q@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 10, 2026, Sean Christopherson wrote:
> When stating what a patch does (or doesn't) do, phrase everything as commands.
> Passively describing the patch, as done above, is problematic as it's not clear
> if the changelog is talking about what the patch itself is (not) doing, or if
> it's talking about the side effects of the changes.  Whereas this:
>
>   Don't try to validate guest-provide ahead of time, as such checks are prone
>   to TOCTOU races, e.g. with Page State Changes, memslot updates, etc.
>
> is more obviously talking about the patch.

Will do, thanks!  I'll use your wording in v2, with s/guest-provide/
guest-provided buffers/ and reflowed to fit two lines:

  Don't try to validate guest-provided buffers ahead of time, as such checks
  are prone to TOCTOU races (e.g. with Page State Changes, memslot updates).

> I don't love that userspace VMM goofs will bleed into the guest, but on the other
> hand, KVM already uses this pattern for Hyper-V hypercalls (and worse patterns
> for KVM-defined PV features), and practically speaking this is better behavior
> than returning -EIO.  So I'm good with this.

Agreed, it's not ideal, but KVM can't distinguish a bogus guest GPA from a
VMM goof for now, and killing the VM is worse for the former.
