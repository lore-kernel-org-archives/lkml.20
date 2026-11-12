Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504160;
	b=upS9kX8YqDxgtEubt/yjhdHhBchzmCyqdtZCdDQXPizLMRjd7XmA749OWvLUCYToz+Vy
	 4wIZy/RrOM1HsnszsRrm1xKM6tkZQWKOC0tTz5zDLfPmm92b/5yuFVCDr0pvpZJzrtEOO
	 yinNpu9GolRStRvEIUWFvvbr8Lno4HlD+gNrBsH+amp9DKbMbOU0vhdi0KuadyR8jM2Ri
	 7zVcSt+5zzZ13+pk4PpLE1H31H5IZEK8PUBrvMKvLVtysrzBp3qFN0onKaeSAGdwuCzgy
	 d81LcrLfhcjLILmP32hxFq2tsyVYJ/9uR4eybzGIdquhSHMjVFMQcKdKOpfIpeKwcUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/AzCjpFBcsxFuApem78XlXxlBTt4SuIRCgZJ1fWdV1M=;
	b=opxYmx85mfSD8oP7xBDO7PVoFjYFCusEb8Zl6n5LjzGZ5V5V58k/+CyJC5gW+0yFUYKH
	 23LY+5GNCANj2xCxt1AoI7hUeKqFaRgIGRad9/dE0DJP8jkd4U2iIsxA3n5BgDs9TcgCA
	 ZXLzZ/W9GaIxujMxVXJ2VkJoJxGWTMjDsifyxowp3h+5r6nqIFZ97NnIEHTqU7wxJdGX0
	 09+NLHZz4Guc7pjqAG2kvGfRFZtvV099oGAK6REuWjbOlSAqFEmZsqbB1olilugX5efBd
	 0SJ/R4poIsTmjCmV1P936CyNuffpTa3ddGj5CXHgshbX36/FhSTL5SaFR9HQqPDm2RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=El2U0FFa;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47675606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47675606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=El2U0FFa
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08904845so1160325ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794504159; x=1795108959; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AzCjpFBcsxFuApem78XlXxlBTt4SuIRCgZJ1fWdV1M=;
        b=El2U0FFa/1kTNlfAoi4s3lVxhBnMS+TuFDyQDMzpDozCU6OYPkMXzTzlLBheS9ebNi
         V0Yd3DCF7EeGNz2s9mFP+56Ruqn5gQnxeYbpeRRJbqvh/Lp4jyBdq8ocd/vt5KAPkAKT
         D2VNZQrDAoe3xJRCdLhvJxcSdqmg8Zi8tz0zysXNjqZDq7aPJfbnYWJP5HY08syecLfA
         bcg/mgjsaMvtszdLpZzl6hLZpgAK2xSBvLRHDKfm82rvyrOvqxUJhgBscGukgwQfbg2B
         92fjHtg2Yb2kMZDDZug49EaL6Pb0qkXMtcPvRdekwPocdqBwhwGYlBYOHOlmPkMzVAR7
         BhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504159; x=1795108959;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AzCjpFBcsxFuApem78XlXxlBTt4SuIRCgZJ1fWdV1M=;
        b=oA8h1C1jBqeSUdms+FC88qDvkb00aXy3pYKPu8nvHrFUbvLyovulWvv5+X1vPetNeW
         RRr+pOhyiRbujdwkWRNtQWOxlsUqJRapTWFUvD8Vq1aDnfz4d/B7Qg5C1XwKLKGAwvNF
         4FC1kUgqBItnKANXdnDUHy6P1Rsox0R5iUMJxT8SAU5pTSmoole2G4PH5OVC32pAQZRc
         OujWsmvtROV7FeNd8EUEjuk2gGNi0HbhR0dan/sI+6no0e+8Go87xIx1RPFwI83bzATv
         /XGndzY5kNJ7TeiGWUffr1K+lUWmgfp6v6ER2OshBtTHl3ir+R8JuZFyX6AQf5RcFKyR
         TGjw==
X-Forwarded-Encrypted: i=1; AL+hErHd0TFaU25i4qNB2itJ5cPNcNTPHafrMHGMYP/HwsU+52Lm1LpCKvJpUVL7GJQayWXfxU+Kdd796yOQ3IQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z99yGh8jTVa14YrV3pXUzh5YH9uEMrO6uDIL+aFsBV7lJnS5yh8
	QWbL5+srbwozQq4Iu9MZjfEQkYZVHZyMORrg8R/G4Pd0EBURaNjSZwaAnqQ/uE2RzKiLMsG847y
	wHVXTkg==
X-Received: from plgs10.prod.google.com ([2002:a17:902:ea0a:b0:2e9:5b68:4b7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2c8:b0:2eb:4a05:4b4b
 with SMTP id d9443c01a7336-2ee0dcc3023mr420945ad.49.1794504159130; Thu, 12
 Nov 2026 09:22:39 -0800 (PST)
Date: Thu, 12 Nov 2026 09:22:38 -0800
In-Reply-To: <20261112144220.30801-1-dwmw2@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112144220.30801-1-dwmw2@infradead.org>
Message-ID: <avX13o0qRkidIwWo@google.com>
Subject: Re: [PATCH] KVM: selftests: Drop stale exact flags check in private_mem_kvm_exits_test
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Anish Moorthy <amoorthy@google.com>, Shuah Khan <shuah@kernel.org>, 
	Nicolas Saenz Julienne <nsaenz@amazon.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 12, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Commit 7d0afe669374 ("KVM: selftests: Take into account mixed memory
> fault flags") relaxed the memory_fault.flags checks so that they only
> test for KVM_MEMORY_EXIT_FLAG_PRIVATE, since KVM may report the access
> type alongside it. In test_private_access_memslot_deleted() it added
> the relaxed check but left the exact match above it, and with the
> READ flag now reported the test fails for me there:

Ah, this is against kvm/kvm-memprot-v4.

Paolo, what are your plans with that branch?  Sashiko had valid complaints, e.g.
against patch 1[*], so I assume the branch won't be merged as-is.

[*] https://lore.kernel.org/all/sashiko-outbox-193903@kernel.org
