Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577664;
	b=CsI3Pl+w1ewpcTDAcGiy20EeO07/F3fHxGMkWqk+9AJXHnJNOR3t/bm6r1x8aBAfhZEP
	 eLTbhER4si2Ox7Ej/1DbEQbNjlDsFPEIQVJvC8ONrDKJBx4Pn4hn/nbYWYSSY/Q4P+KEG
	 kOhRVvp/4w2ZjtITbiPmCaUhKg/cAHwadTEObU/povuANknVqZjl7TQC3WjaVnknBL5M5
	 CPs8n2Ljmo06Kf5RM89mhLC7IyVi7N2t+bnfDeQjDgMW2iN4GKJsct1YvJyIcUbl6XS8a
	 d3axUnG/3vKhQqMtdwO88oA/jKHOyEKpAnBwKZvPtUol6PRXOLI30yCX/kx3wasylYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=58sEe0BHU5Au0xisS/lqaZE010aQzkxa4/+2f7HcCgE=;
	b=4yL+W2L2HjjH16ima96SLg3qJR3wL7y8B01EmN79ovOdKjkmmErLjt8172fp5/nYJGUl
	 lurlvlbxkG5Sy9GABQffS5t/i68oDz1fvXr0dJifHte8FaN/+/heEsfdB0QSNA3/+e09j
	 RME8u2rXo8bmz/zfdvB3WX8V+YvqMGb/RQRzzpN28m1KafeUUwR2rQIT7dwPXhOMHn8ID
	 +cJI0j64iQFL+hAeSU6Sj4ljSXs90uYjtYHwEggHIeKtFscZMpq08oUJE6lsf711p/ZaI
	 YAdXVCWw5aVJCXNZ2hs4/Y6jhuMW1MhNFGeDpondiq6KRE89B+hP8j+nrj+2TOzvpdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2PGJZqG;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4108606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4108606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2PGJZqG
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e942b1cc86so9450115ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577663; x=1795182463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58sEe0BHU5Au0xisS/lqaZE010aQzkxa4/+2f7HcCgE=;
        b=l2PGJZqGYxvhATo4F1i9faJA2f6ya8Kz/C8VrstCvC013HVx6eydXtIa//J+Vho4nh
         /U1Zy+Hw6O1g+GFO7bCWGTIaTkbERzE348WEtW1ubNS4ubuIyWgsZdRAxW8+wXJMjppp
         EPfKra56aTtMeQVuR9hl+pmOuw8u4GBEv8bTHQoJxciUWR693GN2hU8S58qVikYt3ZQ6
         EkPIMDumA8N/8+hDB7V4PodqLrOgfKgoScwoGaJnlC9jqeeBrdkVJ1tH9SSXoSHJCtCw
         lKQusZhKnbc5rptUoZQQN2gQS2g7unyWxW9oFOXtN1PbM/UPPeSfavdVNMA+CIRRXpDb
         s+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577663; x=1795182463;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58sEe0BHU5Au0xisS/lqaZE010aQzkxa4/+2f7HcCgE=;
        b=U73GBI0IYa0e/I2J24dylE5RqH8iFeiJV2fGwKQQddjL1pgOAj8KqL8j+8YOPaLdQG
         7dLV9G07D9pvcELQIG2eOwyQSDsJ1IZZLuEGelfgO6oqfuDXh9bhv9LDXKAizfOvANjO
         /7hbJmX+n2o89icPWr1DgZFAN9vHt1kWThlzsrG5Snys1toEi7IVmCmLy3U6EWhdLB3x
         dIRG7KLCnlDB48F0alVq9XDN2s4WPQo+5eBncKxedqZZKg/2ER+CmB1zSGs7t08dxAbu
         T+KadTHO0PQ4lD7AgSMEu2q+IPz9Ag+aZUkaiLeVtP5rcsUZfLPLEJlejWrmzfGQ85XR
         FMqQ==
X-Forwarded-Encrypted: i=1; AL+hErEM9/obldmY1M8+bcvNEM2E/Bf/7XcOH2bX16HyA+zOpXiXyLQQzKoCTZhfFXEv3D/g1BNOJxEvmzLC9ZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xCC+/iGCMSflk40hbZZoevxpb2mXM/0+GRvqdmknsXs6AWQ4q
	ABFiew/vs1kh2+/6+ZV6SDJkbqQNjXhwKjtQzuwaTedz9yFTYUBlRZMovVuJTnGX2eJbQM3mh4G
	KqJxXjQ==
X-Received: from pjbgg4.prod.google.com ([2002:a17:90b:a04:b0:3ac:7545:d82e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c7:b0:3ad:9ecf:2b88
 with SMTP id 98e67ed59e1d1-3b1b0a0b8eemr2120104a91.19.1794577663138; Fri, 13
 Nov 2026 05:47:43 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:16 -0800
In-Reply-To: <20261014200152.1365147-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261014200152.1365147-1-sashal@kernel.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441826288.81035.4880834403901234629.b4-ty@b4>
Subject: Re: [PATCH] KVM: selftests: Provide empty installation rules on
 unsupported ARCHs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Content-Type: text/plain; charset="utf-8"

On Wed, 14 Oct 2026 16:01:52 -0400, Sasha Levin wrote:
> Unsupported architectures provide all and clean, but installation and
> runlist generation fail with missing targets. Supply empty install,
> emit_tests and run_tests targets alongside the existing empty rules.
> This represents an unsupported suite without creating dummy artifacts.

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: selftests: Provide empty installation rules on unsupported ARCHs
      https://github.com/kvm-x86/linux/commit/7a2ff8e1f281

--
https://github.com/kvm-x86/linux/tree/next
