Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442552;
	b=QoTK42aSPvt8aJ1lLo5TZ9fHYExIzQxVaJBaRuMKzU39JbuSbJbxGhwlyX6kJ/AJhtqZ
	 AYJqlXnnG8KX+mRRjH+FUVhUkS1fl7VNAOPmmL/elGExGRBifgiwr/l70F0fzHGtUIHXa
	 /k6NVoQoIACaF7V9d1Q/8ZxATvnmU5cV6JsP2QdGZyxfzVNdkvCmiKhHAeYeiAiOPb1TO
	 26oOviL3us3KpYqmUwuKXbitJnB2DlPWwZjDYnJjkwYGlCDgLMVJIoATf5gx/vijBcKQu
	 RpBqXYYZ2k7rI+9AIaKMULTDJs9m68LvfpO5rpDF0/MsFx5dZb3z1ekUZG9TiUSbFBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
	b=FM6Gh/Kxnn9qeWa14xo1wJWyyi1Ppz9lVDr1WrOyIGYAi2UnT9blVhm8pFUcg5jP2U90
	 6iPEtOiblE6VFm97JssfFtZAMv3q/S2C7xNViskArkqgRmIbl/HXIwgOI1zxgG7sDcuvh
	 FeSY9YTPe8m/AAB0RWs9Uup0u2SaLPSGLwOfU5pAK2uPNxJwoey/YWsPcMKXBLh1GBRY7
	 gjz+HyOu9k0SF4Xn1BnnAvx38SACEqoBiaJJGqLB2jZR5WDMyZSvj/CUXVGxkO/YOKWJZ
	 pGCyzWvYfg0E42nBZW1TWFUp7TNxcYRtErnnkNzVa2yjBOeXaNcFxbhnDYbhIwMbAkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="e/GCmCMI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D848606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D848606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e/GCmCMI
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1691a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:15:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442550; cv=none;
        d=google.com; s=arc-20260327;
        b=F53pIPwkGIHVhC0zLdrwvb/kvJMchFtyvRIOqs3lvzpXH5Ayc/wzTNtMzKzz/H1u6T
         cGKwMATqwWhvQ+2+ho3clSSfv07BSfDbaiURMA9Xo4HO6LSxvI6aEd+XrfcN65QBhoAg
         cthzS4IQIbWkSNZAktTmLa4Lymx79uEhBjNqsmbLVJNgxsNwWcYAqnpJVuTmR0+o1urO
         nGqV0tRDN6hHCyjubgKPDG5cVFGFYjMtZU2M2rTnRSit13WFEyFBELMdwPUlJoV/sJxw
         Sw9sR6IwwJYbdblqvpWUeEFlqxQYBejaGBJeBjqXwkG9AMAFbrC8iZD+eOZEmAOrpfW3
         lgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
        fh=NXF92BVwd0mfUQtSrXUCH9BniHz1kQi+fX8D201C3zk=;
        b=heJUHrrB7vT6QRGGU0MXFWN4CTepMwaE3PltPke88WXEV/1TpQzCTAnnjTXpWgRtDJ
         sJm3iVN1dNh0z3QWxnusVCEBIUNEV2k4NF2l93lmkNwq/880NZtQvSptlVezDvj3Rv32
         eNul1v67CdQ7IQj1yfKGvmL7jBvLsjcwbbwsshTVbG5Z2hA//3kM1aHHbsb9lfyV6dxu
         Nw4S9lipRbQeStLVx0QsOwryphRRCiYvO9YX/CGArPY7hUZ+P1RzPBMexJqKZHBMlb/r
         pjXyE0ZZ42/H8/TO98+F44yEK0CMBr2My/wPpteH64P1yIHC6+WM6XIT58etcN0gtMrK
         LtdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442550; x=1795047350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
        b=e/GCmCMIh4d3cfq8R1z1xxauNFqtbohTNeCEpyA19Yeg8mtFZCVDn/8EpuaaxSQ2xV
         vbBPGzblo68RCg3AECof9kmex4/J+VkyTceo9nXKl6ACTagIa56x3pIFlQdvJ3TNGEKV
         lbW0PupZKpfTcaVvlxLyKn/NapgwIsK/dqB+YbvYIZtvioZ8buwyH3+bLAfsucQXI4mP
         XA1sVxTtDdszEIWtwZdBE6ccZnwWR5v3EHoerhw3iMc3XDdHWQwbBsHwXHbE5yH02AyD
         +XHfAVQ4L0fgwTbvzK7l1u6kW1g2ilWhONad9skjTyXj4xOpTwvt4tcoOFji34EMS49j
         8l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442550; x=1795047350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUkgOmlD1qUG4Wcz7+Mcimn61fdye0spBX22Tw8NSx4=;
        b=Fd3FxVKNXpD0QpxTPZAy/FOJsXIekFrafUvTYQQdH8gFj641/uJflO61UiQolan7x4
         1LAUsfheI/WpxUp3aDeo4HRos+qwK7IaM+7a9u/oF886ddmEVWIt79MCl9W2N/vF63W5
         P9dk/74rNIZcmjPEimhYoLI8GtC4v23ih3FlT54SqqwHw1YWX1EggeLTZB3eZONz440D
         Ufv+lYAmgwsh0DIsdmMWpTnFJvXe7UHt++wwAJ8Nn9xvPGAXoS7dEBmt5WWViQ9K7ldH
         hSfZcskZVsu/Wir8euFc3iSjtHCC/FiMJ+x5luUV/Y/8QeqrC376ibIOQO1X7ttrdgga
         LeSQ==
X-Forwarded-Encrypted: i=1; AL+hErGNt3vbJZ8/zZwprsMnqIQzgnx9zXuvEC7gQKXGhYJCwd8F3vLrL0YU1/GxvWg9me7VYjFJC/ZYYObF4mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lr3EVpQB+2E0UqrZyjqbbS2GVXreRYFN0kjwTbs8l5SzH2mlR
	YH7p6qpQowAUCBpXg8ZZT6/cSHDWyaiW/7lRBKbGBZ98AGVx+aW0d+ucFzqjZxaPt3FfhPrrdAQ
	0j7lLgu1sir91gt/WPj5BMzNKMoO4b4ceyYL9Ifdd
X-Gm-Gg: AYBFou0r4eIWcJ+LSumPLmES4v9wC3aCWaxe+Uvq3/p+ipZ+IsV3insfwzgNRe4U3aq
	sFI7mwFBsrYC47ZQ9RqN8YEF60zEvL9y39XfNf3yoD6+I6qRhtn47kcIr982h/6uSa7xH3urpmt
	gbCvIMPNT75DB5+2JpwmOPqatIJbVcCUnStqdAWeu6zoH0QGDPBqfXPNHk+ShwJxqfIlpctz8ep
	Hg1kIsUbGZBdlRsid7G3yuCKqCRBoc/3rofhhY/dczI9jlwjsKEkWWqiYhtOWdfVcEQbpE96Lm/
	rZCg0n3Xq6GC8kSDjd0qClVjVUsS3RPsuUlSalLcYgd0IxKl77TP0hvBXi9NhJ79aN29oKRuq+T
	sEG9Tk0HDd7rnw7cu9gSE/jNV8XjwWp4YRlsMlzyigatK7lTbtVVQJqbcN4PcTavsJGrxj4E8MQ
	==
X-Received: by 2002:aa7:c242:0:b0:6af:afce:184f with SMTP id
 4fb4d7f45d1cf-6b79f5c8602mr22296a12.3.1794442549332; Wed, 11 Nov 2026
 16:15:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <f58eca0b702b6e57d87ca367a7693793e619d3d1.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <f58eca0b702b6e57d87ca367a7693793e619d3d1.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:15:37 -0800
X-Gm-Features: AclHuK8BRDjHRWgUjUQI_bBfAQydWugPH1spbS9sNXXgu0pmOPALjqQkmfs2iVc
Message-ID: <CALMp9eTcUkG6wUaZXHSsGmz9Rm=MwYgrA8DfCuwUV1c1Hp_f=A@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] KVM: x86: Add CONFIG_KVM_VMWARE
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

On Tue, Nov 10, 2026 at 10:07=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add CONFIG_KVM_VMWARE, defaulting to "y", to control whether KVM's
> VMware emulation is built.  When it is disabled, vmware.o isn't built,
> the VMware predicates are compile-time false, and the
> enable_vmware_backdoor module parameter doesn't exist: a
> kvm.enable_vmware_backdoor setting is ignored, and modprobe warns about
> an unknown parameter.
>
> VMware emulation is only useful to VMware-aware guests and to VMMs that
> offer VMware compatibility.  Let kernels that don't need it, e.g. to
> reduce the attack surface exposed to guests, leave it out, as they can
> already do for Hyper-V and Xen emulation.  Default to "y" so that
> existing configurations keep the backdoor and its module parameter.
>
> Provide __always_inline stubs for the predicates that gate VMware
> behavior, so that callers need no #ifdefs and the compiler drops the
> dead branches.  Leave the operations behind the predicates declared but
> undefined when the option is disabled: a call that isn't guarded by a
> predicate then fails to link instead of silently doing nothing.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Link: https://lore.kernel.org/r/Zy0__5YB9F5d0eZn@google.com
> Link: https://lore.kernel.org/r/e3f943a7-a40a-45cb-b0d9-e3ed58344d8b@redh=
at.com
> Link: https://lore.kernel.org/r/aIEmawm9gLflg8zt@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
