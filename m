Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442402;
	b=g6P2EYqZMRTqxThIN13+/L3RbmautjBm3/8hNyE9TgMUGpMtUUsMRI0lVydxJYR1mCSa
	 4EhwtVz4RC+CEzaqRMwslFXQ2JbG3bRnwiS2mgY+wMxt5CDELejhrLCFzDkBoA+AOGpqA
	 eQZDPWTMZ1U5tX6dXWsSbI/XUMUc/uHV2q1ig1bKupTtHGeRZfTkOMDBBcSWXHxcrTVNN
	 hyUC7vjr/I+B0SlB+mp/SpFzbtjz9FK6PlftedYCB3DVE3Cg8OYwSUhh+14eUWzQ5GLQk
	 D/6oCJfodGqPDDN4WOhdsBd+9jiMqBrlB2A4pUZ9oTl+Xb5JxbqFMZ3nwqNiKHq8Pvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
	b=o/eUeepHqBoALUUSia4qIicJRo8zJIDtrNVRMoIRLQ/U2u2iavExbrninA2k8kcv88jT
	 KcFD7zaT0dip47QTcOb5GnMC0XDG2Joz3pbz/wy7Mpep4BFWviDZ9SqyKVjTC2mDf0NTa
	 N6fzkgIX5qspB8RcezgvjDy6bUcANh2udNgA9noxNXo6tzNFg+7j5nw+/pZ+o8lStLSVw
	 skMb4pBrtugX9jSPnr1KSv3k7/lOs8HVsykOUZwGOkz6/isRNnYMZlml1ZcPHvJiAInAg
	 dgcUrZt+gXifR226DXond7Zh+SdDJnFmaIA5haNhNtyCvLlImMGLolGpvNVDMM6fGqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="iH/wd37L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A55606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A55606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iH/wd37L
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso2602a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442400; cv=none;
        d=google.com; s=arc-20260327;
        b=Injdr05HxV9giQXccVVA0Uw1CyBcgDA9Mdc8n6RlP8HmMleXJjwLmcjRLrQc0rWAsf
         PYxHthXShFjSlYs+UfDyIy6d7gbrZ90zTiRdvCs+HqlZ2v4g1w18KmaHM+iCyDBj8Tz8
         HX7+O8woAwr7bYxfaFd2QHaB2IZWqjxM/nNRtFV/AOQct9eipKjyTWkIXWkEVDvpSXN5
         N4BqjxUR4r31XqDoXea84YSh3kL6zxNi5gmTHl54yYiQm4y7cvNg2q8TeyZn4bjIAhG9
         fQ+AIDqrBbXaElec8ci4ICz+L27an8BH0beH1HUZ0UVnz1tUEf/FJTDvIrWa2oHrG2n6
         ySmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
        fh=LC55UjQCtmEnLNeSS052JLTjmRRUUi0h7c2UuAyW+/A=;
        b=TS4rqOcO32cr7ErqPM2q3rcO3lBu1QV6b0dC7/jp0EM8t/NO0uSu97Ebvs67bTlFKT
         6MGJOLVzHFyTIvUFd9rZvkx0nht22V0MPdXVjlslm78lCKl55rnVxtaCQTpCRDDA6d45
         So5AkJ8dzBLi27L3+dzAuRCdTh40MKYKcmH5FzsxlgYKo1Q9h3mamH1KlZzuT/Rh9Xxr
         pn1Pne8RgHGp+UjUJ0j+pgc9J9dTKoWAbsL8jjk09ysAQYXjarH9Ap5kj/arj7X29hJ8
         kUVb9B2TZaf7Z39JHG8dDrVk2enB5feih48AOs1WHMiUzS/UwxGh1JRRXq2W93vGQSSC
         RWdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442400; x=1795047200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
        b=iH/wd37LOg2hD3TTD1m4q0qaLfhoXoQUtQjEilEqBxnKJxbifvZHG67+MeME0M8WGu
         Ux8INvsQJMiPw/PdFkvNsGCSdtaFu6NBxDAsk1VA6RyZR1qKKE4Ckl/UH6Rig7phjNE9
         WklDOtODfrt37ymWxn1AQUGJUokgTSG1AgdjMwN1gkaesF4YiZ1DgZnnrUJr+yqaPWAT
         UUtWdqd0zZJpy8uuQOIaki113+rawIwWPmfRJmt0rGg8wPGEBlnazc8MLfvWbf9d4Z3L
         zt0wT6rl8FNYicdd1gO8Al8EClUL06yC17IuiUHAhAeEQ1K6vFZhcjqE0SueEd0Jut4F
         XEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442400; x=1795047200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
        b=ce1n+7omkpT8avCAMXbrgHn9N8o49HHP6zK6sMlxlp3MNsNrDjT/9V9iVbPiv5GFk3
         LFusIpPu5RKmwKtS4dawneZbsneI6mhFj0UBGNSX+81RSl7eWo6AbC/iDvm49ytzIFZ+
         7ktf+ig/k2jO4UB/ThaFGpuFUag/w0S13MHZe/XpMEIkfIR63u2rVxAL2/qGUEjl+NcH
         CIL5peQWitEtF8F/YMydO7kaON9g402Musrq93usUKWHmMvb/BTPOpkvSmlVQavo1bwn
         RGdVXyrv4U/NsxTVZJ/JDNXno72pUGOtGPCzyyeAgBWDqroZVOtLeFUmIPQ7NCeOGmzU
         Ea+Q==
X-Forwarded-Encrypted: i=1; AL+hErGoq0CQcSX2NngOULcPuVdk4VhRFqnTJTPgP1R6n3W/Y3Wtfjga9rvq1vtHRSZy3SyR3IzIkFpQwZTqzo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FslXWmpmaQ8bhG071rQX9nmYiNMyORTKEUbAUZ3gZGjVnJ0iw
	pIBQ5BHNXWBP/k3ObH1zFn6SW/RpZdBHade2cUuFX9AXE0frJO6e05dmCLIXd6C9vs5Xu0kbJD6
	wDbhhkZnFk+Y9uIWg4eYLHp1KFtUYDqBOlnDo0AO/
X-Gm-Gg: AYBFou1D0/WsNcJhLz0qVSjszdpMaiX9zXWrtyXXFS5XTqNfOAXGj0ohVnMuf3tX8e4
	tMdNOOhIDENTO/aNW4PDXT2LXM4rlXNfdu0HxtHQ7NQqmBibKPeRJhe7tCUFsVbUFFF2yL63w77
	+KKOGRGBZEzFot/2cSOjZ/BKsfY1E1NkLfaTC2HnOSISrEOrYBje/wEkI0WycNilIkv/RKFrg1R
	pY6goH9TKKJpCuG3lq6SkWeWjOXL8KDDAPOhXjUNjqoOjF31qg6I84aUiNgF+Rrwr2NQ+abssaG
	kOMHoopsC3od5zTy6ywEtygt8UfrfzCmzFw5N/4dXKO8MuFBI5LrIhhokJGpGVkC32+/qBZ995y
	9qC4G2yKz6I8TGjt+jT7CETdzedsW/5Gshb8r5xDCdnZpYJv2XaKLUh0s1U1TnWXfoo23W5i1
X-Received: by 2002:aa7:d1d7:0:b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6b79f51181fmr33260a12.2.1794442399569; Wed, 11 Nov 2026
 16:13:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <e08e3b6d0a8dcd25f1ee3e97a64acc1cbd3c0f1d.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <e08e3b6d0a8dcd25f1ee3e97a64acc1cbd3c0f1d.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:13:07 -0800
X-Gm-Features: AclHuK8odVhxcsphtnxehMA2gTchgOO8TDhX7Llo8FUPPxJ2xf2wIKtREyW4NxM
Message-ID: <CALMp9eQ5CAZ5GASL80qQBB-86nKskdiadFinbw+6g0=9ycYXGw@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] KVM: x86/pmu: Honor enable_vmware_backdoor for
 VMware pseudo-PMCs
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
> Check enable_vmware_backdoor before kvm_pmu_rdpmc() hands an RDPMC of a
> VMware pseudo-PMC to the VMware emulation.
>
> The pseudo-PMCs are part of the VMware backdoor, but only the
> emulator's check for RDPMC at CPL3 with CR4.PCE clear honors
> enable_vmware_backdoor.  An RDPMC that KVM intercepts at CPL0, or at
> CPL3 with CR4.PCE set, returns the host TSC or time to any guest, even
> with the backdoor disabled.  Inject #GP instead, as for any other
> invalid PMC index.
>
> Fixes: 2d7921c499af ("KVM: x86: Add support for VMware backdoor Pseudo-PM=
Cs")
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
