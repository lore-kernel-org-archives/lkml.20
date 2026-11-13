Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577805;
	b=GRyVgFKfbAVQCSN9e/2WzkS7XqOT5LIg3SJe4ZqlT4Bw5bRPB7Kz35MXDcsypkpe7arm
	 BEBlBWiVXYz9RrHyt2/LtL5Jk309Om6z2i6wuR5io/xr+tlVOxeQ0CgEfGpjiSCODw/LS
	 s/cP/KUrYqNv9hpI6fIzmL6pogxR05kK4NbRkIi73gi61PPyG+sKomorVkhX6B9ULWufw
	 PRapWauKxEgw2bqX+attVSTWGZ3Uzvy6soP09P20F9HnPj/WMS+CQdD9cfQEgHM5EmmYv
	 XfkFigZcjF1K00iTuOkge8UPxgjo1FhWvhO+FmeluoT42U6LpFWWqNTArRgT9fNrtwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DiCkgNSK5y/MvI+rznjQud7W7zCWMAX8iwhD1RM5p4Y=;
	b=fdXyQPdVOgiWfczCnkSN+o3x9HK+WUTM3ZXPGRkA47t3uP3VoIZ50P3GpXqjx5nBSL02
	 4ZafACbVyCeHbWjkFQJVPPcQ4ORENzNLPGMSu1QdcHUAO7o7ZNy3YnTTW+C4t1oPqrLgC
	 r2yFcD+sQDJ+1xoAU3NSOX4vuuDD31ToQVV1yRSHX0mf8SZIbxEwZXDySwfolF1+cmgG0
	 x2/vVErJu7GMGKFVEHC8nAOdb9z2yN6FuzJY0miJ1NQcitNpC5cde3G909s/Lz79DcYaW
	 sjKMWdY7bt0tiO8r8/BFUVe4xV7f1E7BZyZnA+Fck7su9OeSTVKzqMTYWohda/ckl6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="RGS3jL/H";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2021E606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2021E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RGS3jL/H
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so870465a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577804; x=1795182604; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiCkgNSK5y/MvI+rznjQud7W7zCWMAX8iwhD1RM5p4Y=;
        b=RGS3jL/HlFf8z2luT6W6Luk9ik0YGEeGULc1IYTgwVLLn7LE1CNTJ5Ht35o90uJeTP
         hUL05woXLRm9kVsuf8cG80uC2g29+ZPBf/lFfnO32pV7UooE3lzrNuieFX9g12+tbYlu
         V6q1f2rNvokjuwhkymy2rgy1hQnllPWr0NmPbcBKuG5ZxZRMWSxeG8ze/qVAD3Kl/6MP
         d2aNWS2FZThMVzhxY5Qth+G3Zj80RwpzhxaWDTCMavLNeUleA41bahYJnWxfuwj1eWcp
         LIU24u1Nzmk3vcc5+G7C5yLXhD4OmcfJEiGr2kZrkIZ4eUNZiptw3HivJ+HN9jquWqtF
         uZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577804; x=1795182604;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DiCkgNSK5y/MvI+rznjQud7W7zCWMAX8iwhD1RM5p4Y=;
        b=jD59iVBMEYjQZJesM2oxJDsdCzL+WkTrdGnmRY0SWcEEbC9YVZE/Zc8ci7Vs6dCFmy
         DhAjsZhfgaS9hTleH6iALKJFFsVuKuYQA21+HXlBNNezQ94X4i/F2Lzr6quaSLSrT7UU
         o08SMeTZ4dMGH0xekXfJ4esI4gzxKd/Oa/6XQ1YjzVLPl9aaMUPSjkB3Ikh29f9HFuMI
         vF2yzCce6brDr6nHWFausNvBX8W9gmcyomtijKGyQaKdc83+yZwcLWfhJSynuZUnlEuk
         QA/4QqbdzwGFEQrAm9u0dbU/w/s310qWe28vzq9ZSWqpzbeF271950PyEk5kWOh3ddYr
         KvXw==
X-Forwarded-Encrypted: i=1; AL+hErHJXJFT7IUPMX2TF+dIIFS1satC2AmLB7UfSvZV6y4f3uohDaLN/SpTx4VDqqFeZ/KNUizq3YjriDlW2uw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HtJMR05RENDlVQ1S4C/GaBJaGwPqpRxWZW7XPLSG/E6EaZGym
	HXvDB4aB26PeTcppKhxZw0zMgrboA9W0btDk8FhtNO0r9AoqFoJUpSrfwav/XVDxtWMBkapCIOZ
	alxl51w==
X-Received: from pjyw24.prod.google.com ([2002:a17:90a:ea18:b0:3b0:e553:8f2c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5604:b0:3a0:a912:e759
 with SMTP id 98e67ed59e1d1-3b1b0a39614mr2469908a91.25.1794577804208; Fri, 13
 Nov 2026 05:50:04 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:48 -0800
In-Reply-To: <20261018115229.315110-1-pablo45154@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261018115229.315110-1-pablo45154@gmail.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441764204.75151.9010393350555160808.b4-ty@b4>
Subject: Re: [PATCH] KVM: x86: Initialize the PIO bounce buffer on PIT
 control-port reads
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Pablo Azuaje <pablo45154@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marcelo Tosatti <mtosatti@redhat.com>
Content-Type: text/plain; charset="utf-8"

On Sun, 18 Oct 2026 13:52:29 +0200, Pablo Azuaje wrote:
> pit_ioport_read() bails out for reads of the control word register
> (port 0x43) without writing to the PIO bounce buffer.  The read is
> nevertheless reported as successful, so the guest receives whatever the
> buffer happens to hold -- typically its own bytes from a previous OUT
> or IN on the same port -- as the readback value.
> 
> Real hardware returns undefined data for reads of the control word
> register, so keep KVM's behavior well-defined and predictable: zero the
> bounce buffer before returning.  The read is still reported as
> successful, and returning the guest's own prior IO bytes as a
> pseudo-readback is observable state with no architectural meaning;
> zeroing is the least-surprise choice.  This is also hardening rather
> than a security fix: the leaked bytes belong to the guest itself, never
> to the host.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: Initialize the PIO bounce buffer on PIT control-port reads
      https://github.com/kvm-x86/linux/commit/54cb295ef092

--
https://github.com/kvm-x86/linux/tree/next
