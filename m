Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577759;
	b=n8eJN1qUtken9M9YxeRd7wvSdlSDhbtkvE9h9XwiZnjgQS/9d+dqGTYQZMl0Iyeeji/u
	 D4nAtdyGmFVwCVhSjiE9r6UY/Ge8A3u9/7sr9k9YdEmcTYQL9za7i/jWS5Oecgf2mLbtU
	 dbWlnNS7hurVBTvsNe2J1HFwZialvQegNsii0B0PhOkk/X9ekdg8MkfvVXD23zWSgucSe
	 X/4WL3xD+w5CXih8I6fGquyn8cPhawnXa1rNj/e4ZSPLxZ6TKMSMBns+UQXXLaP1Sj7px
	 +NzF9RxEt4LDQCfR4zDwwv6BYgE/PiUFuQyAaoM9vTtJOQQ3KdmD7vTwzyPg4MYbQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iaZEgFBO0oN7uYyRNO34L79aitowmvFZR4PRL3xrbhA=;
	b=Q8ibhQLum9AtsFitdg8vzP97Tbaontfmq6ChZaGZuoVuDjT4xQplJcfzWdG2oIUsekAM
	 jMTVadXvbJbb3wju1WhycqmbHAIGuom5p95QamM8lyLqlA6zK93/0zXhFczycRHm5DFOB
	 teYF/yd59TBT/IK+nAnfYRJehWh12/7MLZOr3PUmmpScGD0nLbeuWPgGhHJ1Y5vUTAsZ7
	 URmYmEbWJmrcg4ULcGAhdA/5oseaOroJRiLQ08qKxJJlngvjO3Ahkcuati/xqKt3Zl16s
	 pgFpT0NKCdrDf4Nqdq1T4CYk5a0bZt7KymZuuS1/ekPQoeGg37EbinXfhaBQ3BiSTVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ldea60Y7;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC488606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC488606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ldea60Y7
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so746619a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577758; x=1795182558; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iaZEgFBO0oN7uYyRNO34L79aitowmvFZR4PRL3xrbhA=;
        b=ldea60Y77L8XdLaoFVYj7SbvCOAQT3aoZ3sqpFSGcD2f4plIFiedS905Gt0APcYH0k
         jRhtDQqE6zKe+9LpBG1ufAX2UgJMZjkqk6JGSV8hTx/qi4J7v2zC1shw6z9KhL2i9V2b
         COfWUvBauXn5tC0VJRNPvD+YpGN95+acz9kH3Q54VDHOFSsvQkEGUBWscp23gYhPByLb
         X9VousiCKXhv0SVOSb/7ukmkTOeSMoLk82UfSBOgUCbuJcBSvf3sdZ9ezWcb/g3E6yAZ
         t7JEj0yWX9AIjqbrPiYqbbyU6GyuC6f0LvWDWgtr1feCG8ugz3F8FjfCbPziVJh6A0+6
         P2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577758; x=1795182558;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaZEgFBO0oN7uYyRNO34L79aitowmvFZR4PRL3xrbhA=;
        b=bx9fECs3cwh/hFgpavHuXlJeZTlSOcRxWONfDFB2KnRxXVJMg9Go25e5L/tpRNHJst
         +Ngf5Y8wAUuhSaCvK/ExHRMRXK43Y5zUrHgpdNVGQ2xdQDD6IWK0YgMGsVLS9HP1RnwQ
         As27eWTOAsEtJUgxiCakHcp3JwH6COBjyQVPo1npWlKfEEdUBwOZIiuae6Jo64eG2ji0
         cx4J0f/hL7ly7kCzhCBo5vd2A0wK0naeaHrz12ndUMllzTz3p07TVHP7/g7G03TyXAOv
         cTDXGZYu01PzsyHQJW0nYR+3G5ELDZZTHYgNZe82eDeWQdguj3hcfQUORV5nfLK0zSNy
         5h4g==
X-Forwarded-Encrypted: i=1; AL+hErEjhGI+8oYwApR5T9esk8fTEZ/PhJ/CiKv5B3kNp3V3uzcKOtbys6cbydoeMJ9/QaoG4Qt7RcwW68LRL7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WK8qED87mi5l/IRvVZj8+3Qop7ukY5ESQWiP7ggd4i4JrisoW
	Cxsg6otGwKNpCRXgevzLjMrZ5XGv3hsMXwHb7SO0uPdibH/zRyebX8bneRUixrgZgkMGWlm600M
	X0AjBJQ==
X-Received: from pjbov12.prod.google.com ([2002:a17:90b:258c:b0:3b0:ac19:f886])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54cb:b0:3b1:832b:bb3d
 with SMTP id 98e67ed59e1d1-3b1b0ba66d9mr2028281a91.57.1794577757932; Fri, 13
 Nov 2026 05:49:17 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:38 -0800
In-Reply-To: <20261006093354.590415-1-bruno.produit@trailofbits.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261006093354.590415-1-bruno.produit@trailofbits.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441841896.82698.8297015734174614821.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: x86: Cancel PIT timer on failed creation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	Bruno Produit <bruno.produit@trailofbits.com>
Cc: kvm@vger.kernel.org, Kyle Zeng <kylebot@openai.com>, linux-kernel@vger.kernel.org, 
	Dominik Czarnota <dominik.czarnota@trailofbits.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 06 Oct 2026 11:33:54 +0200, Bruno Produit wrote:
> Cancel the PIT hrtimer if PIT creation fails after registering the PIO
> device.  This matches normal teardown and ensures the timer no longer
> uses the PIT before its memory is freed.
> 
> KVM registers the PIT's PIO device before registering the optional dummy
> speaker device.  If speaker registration fails, a vCPU can have already
> programmed channel 0 and armed pit_state.timer through the published PIT
> device.  When I/O bus registration became fallible, its cleanup did not
> cancel the timer before freeing the PIT.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: Cancel PIT timer on failed creation
      https://github.com/kvm-x86/linux/commit/381a21cfe810

--
https://github.com/kvm-x86/linux/tree/next
