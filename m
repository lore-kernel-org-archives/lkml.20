Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577793;
	b=IX+cD+y/fpOvUVrtlI/v1EKBtIepCMjh7nnPdmnV7R7QFqM3nSGt5hHKOpPSF6zZzE7J
	 PPukto4WkeZMXtAu4z9F8+oZmS8d5uty3ecHQ5CP8ycUB3AWTu5FaoPfWT9iTEu3uDcUG
	 zLay3jhyKdyD4ZrCtd2o1y34w/Jedl3pLMAvrFcTo6YoH2qAYXYUqUqAsajhCyS8AaAxL
	 7FSB0rg/G8JH97JGVPwKeRQSxopmwi+PTq7zZv1GCnC69S/IuovXx4tGodoEk7i0KeCk+
	 rDMu2ZwHpRUsNnTL4Mal3yD4OhKTFW7g4WtdLPEhXIB4rJ1+8fiZlPAIDYD8YbwtbSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=b69T+QcugpATwxwKqdMEujcVwSj6b7odGHK++WaklpQ=;
	b=ETMYeSq25CfiZ52HXft7mMlNxqpGSh/3zJJ7Ru1lj6bRsmImSpzNB/QwqmdDNBAKpMie
	 wyXhpsCH9MhAGg2OpN8uOT+6u60CIhsVnm3pu6EknvD1SmeX5/GXFsV62YUZIPxUmmhY8
	 QaO/cXEsg91ubjkrigE14PCStDXoN4TO1oCUjJr4wQLeVJVDLlrLSoSJNVeAxc1psTaxD
	 ltHxLkXgMJfEhdlTrM3PD9OcDloPszsxqj59mnKE5aiuf9BFsitL6F5SVcKaxYiZKylR/
	 EGEhDTevPBuuOU/ggeNccwi3Br4gvbNPRS54M9TbxuYV5lKGbHOQweSaNeoZtTNpbXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NTpCEFA5;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2751360A2622
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2751360A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NTpCEFA5
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed2c307e62so17425595ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577792; x=1795182592; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b69T+QcugpATwxwKqdMEujcVwSj6b7odGHK++WaklpQ=;
        b=NTpCEFA58Pmno0zFLkNqa0oGWJF88P9imPpX+E5AfxnbiWWMyRW94nDaKo2SeeyO2z
         AEmG42yTokrScGY8bygZhWASPfhMBRlJNvopg4rmHLGqeCo5EErL4aBV8IPLWCOAbkXb
         WKSJQifPR1F6o15fMlysacrd7L/eAK8UD9l8TLU9G4ZOe1sxu0VplnQLXoqPXfR4W6xb
         TeTg46VFw3TYiKkAPaKZTktAJHqfZRLsb4QE02M6F4qKhfWWJJT3xpkwspmHYWMKsC/c
         xpl0nmxvcm4WN8udxn0oZF/OgDhrQ6MfSn2WOBzjU3h9dm+gG7w5uLzbYsFiCrAMnSsF
         0qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577792; x=1795182592;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b69T+QcugpATwxwKqdMEujcVwSj6b7odGHK++WaklpQ=;
        b=zKttVm6G3dBzUwcN7HqTqdw1LinnYEJ+jrdz86ZMXdi5fBsTpFCSFoMM1DSKS0ZS8w
         ZMzfBPOFBYJVyqP+mcLbrKq6OFDvw/XY7eSr6ETIqWQTFYmnTtCDXuVXhNKQFTc/txg6
         nC5xs+aw5d/vuKVPhopEnko+Yvl52ugHKkS/EARTBKmalsna4o0rY9CpHHL9XZs7jszb
         aK9mhQ19enAojTMjfL59GcqaetX5PxUqlsNnW8TfRi6wQdd5tACdh0KeCs9dxbMCXbJ/
         DtPw5S4W4PdPZrfgKzrwKAXlNA8bkAjZ+qzgvX2LblX46uhIRokKAmh72X9jmsOXbQvL
         hwfA==
X-Forwarded-Encrypted: i=1; AL+hErEZw2TGv/c2PLNDuNFxKbn5u476YHYC2TqC42dbOKrM0HG95CC4gk44VzsCOEYEO98iU+QLgByzYdFRwc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z919KYWpdioBbu3HF4aDKcnxH3exD9bsJo65wC+mPz1z5SQKrKI
	tqsDNN9IBrIEEHL1J851kBBl4dj+0U322vtBrOrXfQLjh2YaE7qwrUewykjY/Nzlk6/omWxbpbE
	lnlVavw==
X-Received: from plpw11.prod.google.com ([2002:a17:902:9a8b:b0:2e9:db6f:41b3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1846:b0:2d9:599e:df95
 with SMTP id d9443c01a7336-2ee0d6600acmr27342415ad.3.1794577792313; Fri, 13
 Nov 2026 05:49:52 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:46 -0800
In-Reply-To: <20261104212456.9835-1-laurian.iacob@yahoo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104212456.9835-1-laurian.iacob@yahoo.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441817794.79965.13636393461318165442.b4-ty@b4>
Subject: Re: [PATCH] KVM: x86: Fix spelling typo 'RECIEVED' to 'RECEIVED'
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Laurian Iacob <laurian.iacob@yahoo.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, 04 Nov 2026 23:24:56 +0200, Laurian Iacob wrote:
> 


Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: Fix spelling typo 'RECIEVED' to 'RECEIVED'
      https://github.com/kvm-x86/linux/commit/1d58c6b5db04

--
https://github.com/kvm-x86/linux/tree/next
