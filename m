Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442511;
	b=dcRX6/rM6fLtQJWryn4F3TcUjamuoaGN5OKl6S69Sk53/UwuGn3mKsaPm+dm9Oy+vwoL
	 e6DX1PrNJ1Ua4CxGGPhIKzJSsQpM30Wop+YK8qPQSOuKRQImht/gyAUXr2Sz9Z8lq/mhh
	 rGpMi7816k2FydpPu/7464RPPknLKt4HNjbWRbYvl4zTEHsZDJoiFqSgYD+3B1YtVEpkb
	 DzZtNBl6+XpBoR1y5vGjhHgfobEPr4h2iw6MgQorqFoeXshBJep5jCbyNG5fogRvLdvYu
	 BRy49jJttXLirIMU/TTN0fF2kZebiQRaDlmv9725GXUhX/ty/+uG9UvM0CoiIO1Z81w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
	b=SG75fij6/OlaOn6c/RjwTn8q3a53/uR8Mgbnxta4SOovLWbDFLKJoNXYOx+M3PbSONtK
	 sj6C3kdVrjvTrquismIgxlXd7b3R5I07T4y+0uk4h2Mv1lZQYJe+i+WoNi1B6W1BDZVVn
	 kpLEdIb1LNe/iTKC8PQg2dlOSjbXJaMBd47m6bS4Pm4NDY8pTwD+OqpXRA4mt2PxNs8Bb
	 K1kIyTHsm8VD6IEsOpTipt6/e5aNw6P28O+755pMMwqz7yBr3rD1huipqPYtVo4eswV1B
	 EL5azqYyolPlZgWaGUTXZGk1iyjW/rerCGsLL5N5kRQIxMLH4QtHYUio7hE2fG1RVjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PeXxi254;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2B5606A326
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PeXxi254
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1679a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:15:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442509; cv=none;
        d=google.com; s=arc-20260327;
        b=N8fJS0/XrXoPe6z4PyhAX+Tl/dH0LvdNBrPcYPpnQ+ajUqt5Wnl4IZMue7MBnlrIqH
         ubmbfNIFHiC3xk+utYLjFRZWiv1f7fkbj+M/AYoeraxVz9DL67p0YYh/z6YiDJA9QEkG
         KTQpq00A1O3JvrsJ5tTq8pM0HnsXyjLfP35y40ZWPajx3U+GcHt9T44mrNaRhBYfQNfy
         CMlvGnSqRD1bs9du6tf5mWMAymu++eTOmAh+haMgGaBL3x2mvsa+w352RGhisCCLIJO0
         2KQUpVWo8/R7b5UHY2ImZp/R3hG2p+XgWYMSGOXIZzK0z8Mp1Z1SKCnEP6+3TJhD9Wgx
         M3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
        fh=qdDD/PeoI8jYDFIJzjZaVChZPUFlwsOzAqPASUX1Wr4=;
        b=lI7em0ZIA62Ls4SHZEso/C5k/q6h7dzzRE0PtS9o9t8ZhD+enldqR6TEqiAb/TfF7L
         gMz2QNgu5JeSLAx0KejP3nxu6J6VnsPAnBJt94IVhfh8w2RyR85djDLMxyZBi9lZtLHh
         ddd4PNuxM2IficQrLAXnHyPI0MmXPoizAYseTgLa1oj+UbFlG0suD6FDQ0RdFn1FPKm5
         9QgIyeLXVW9YmfozrilsmwZnLSth7FeA4fgAYU83maMR/LIWkHTU3Cf57pOy07iEyw7i
         P+1MUOlNKwo29wkWXv7gGFFPsEqFDVGA3C27gtJzqN0cNb/+BX+UI8LBpMCUaJfmFzr2
         QIEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442509; x=1795047309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
        b=PeXxi254jVjJacLsg6c1v/0BankO6tVHFh6AbYJLckSeraKvBRZxAmvwufFHuIVvYD
         jkbmKo+FCqg0SBryL3bUXvdBw51kokdvPo2t6gGxmjYdEHwSqQgDRMyLkfxw6Qp51+n6
         ds9EgQSzXH+7ac2mHfXsp4u1eSCMlEnVwNktB8TG93pvpqlbZBzyalG5b9BR63ygTWb1
         54jvVxknikvPOoIpc0TQ+p4Y/l5uIhkotGtCrINmedkhL7tPKuRHQebn+aYEdDwEO9WT
         RBjg4bOD2siCWSJ9hGnHGD2RvFWe4jctIyHb7Z/Vd8399Z05QaZSbFC2/xwSG/vqhQC/
         fReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442509; x=1795047309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
        b=wYNVyrsMg+wsT4qdbK9nGuzjH6EB39D/0XJEVnWKWh/N4a/BEOjeD1SjxC6+yxy+a4
         HJJ2KOyH4w7VZBf005ehvSOZbyk3fF5fjGmTqqvXK9C1uaBeCI0V9Gez4F0oMF1F/Ezc
         o0ztkT0ZLnlRizJsbUzv2BbQtHEvx50sLi41nAE6aRo74OdDhfpQuqy/+1Hsdf3ylu/7
         RYk/EidUmtkN24J/iLpbEzObMg5tVku4yiYcNjFeajZyKJwKSIPHKjshDXROvqRQNsfG
         4rqFLSHGTcivAMwgxQLIrgp6mnx9IoKOm+gGxKsXBENb26l0eFRD8WhIR5+ucXLxj66V
         5hog==
X-Forwarded-Encrypted: i=1; AL+hErFZjUsxQQ0fb1c/F1NzV37PTy24V7IK6zRJXE7+nbyOehXf2WIjIG8lQE0g97DMBZicr7RT9lmAoj9YTPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CWcGnLDO0Fta893SRIQ4t1Yc+1npdEG/8P9KqWexMeq2v20xT
	bl6GiqoKMjpD5/r7vjAah//cO92PQF3X0S0ddieLYIdPsoV052k3yzEMjw47We9hL45aIj2pr5Y
	qagDlGO9gKQDQkhzggvGg6yb4smdvEwq6jnxXRF7u
X-Gm-Gg: AYBFou2o7rGQH7qwDKWXjlAIdRTMCHD0m6YhCl9PTbUY3Afkb3KY1Cf/fWsWop3/naP
	/F5Mkr4rzHvMN6FFSKQeRfkc5duAXuzfInEKNHCNrZZ9SDBvM3mfoKtLxvMXGsI1XenKZ6soF/t
	6DBN/j9XIR0m4MCNMj91tFWhqDrdn2eGYmD4hEvpO2lQ2AqJbg5St3b/n9tZ1Ww59z1SJFAV4yC
	j/UKAj+lATRP3TRZ2PI6YzzVxvYRR88KWvQPBsXhnl+CmR8Txn+TR+JNLS3CF9RXrEwSgVDz2o0
	E4JHBqA6RTRVzL8uFdevHoUO2x6Z8nOn7AskgED+phRUXKt/YqhFHx9d92IZAMquufFTqqz87Ih
	rCyllb5L1QOm5fvJCwBKuPmbFk3IOqNxL016myjoDjCq1BicgCsM4ZlTAWEMTnOZ1ztcl6sXZRs
	huj+zKGdj6V1l70VTFFg==
X-Received: by 2002:a05:6402:a3cc:b0:6b1:b3bd:1576 with SMTP id
 4fb4d7f45d1cf-6b7a29ac02fmr15840a12.8.1794442508697; Wed, 11 Nov 2026
 16:15:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <76008acc660e337e7bbeab3310623a87046ac70d.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <76008acc660e337e7bbeab3310623a87046ac70d.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:14:55 -0800
X-Gm-Features: AclHuK87L8uvSccN7ek3E-oclf6HfrUbptT1NvBilCQRrlrDsTQ4W7H0chAi-Kk
Message-ID: <CALMp9eQQG5U1JUbAiYBTaSRysux=F6VS8vra2KpJaEy=L6vBKw@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] KVM: x86: Encapsulate VMware backdoor checks
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:08=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add kvm_is_vmware_backdoor_enabled(), kvm_is_vmware_io_port(),
> kvm_is_vmware_backdoor_pmc() and kvm_is_vmware_backdoor_opcode(), and
> use them instead of checking enable_vmware_backdoor and the VMware port
> and pseudo-PMC numbers directly.  Make the module parameter and the
> pseudo-PMC numbers private to vmware.c, and take the backdoor port
> numbers from <asm/vmware.h> instead of keeping a second copy.
>
> The next patches make the backdoor a per-VM setting.  With every caller
> asking whether a vCPU accepts a VMware interface, instead of reading a
> global, that change stays inside vmware.c.
>
> Check the enabled state inside the port and pseudo-PMC predicates, so
> that no caller can treat a port or PMC index as VMware's for a VM that
> hasn't enabled the backdoor.
>
> No functional change intended.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/r/aIEgVpjXDR0BXgHq@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
