Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442462;
	b=i3Ew+iBgHSoCWB+H5ecGyKJp+2yZSF5Gmqg6atHhOgPZA2+182+XRL3xIWuLoUKygo/s
	 BlnlkCT7rYGzpZbY4v9UThuxAPRXQUahY/vq8RPXqqWV1xdhh5IsDLsninupwu5nHLfXk
	 pK4wiXn7kJ96ki6iE5e9LWiq98W5PDc22JyVFJ2UCgTfy+YnIFwtrKrBS8FXxvtoW+hum
	 aTo250Rp/yCdOnJH3QlDd4eWxRgnzc1Z8yAAqUbmkKGAsldUQlQgRh+2KPzIJH9F6BAVZ
	 Vi4xHSUjfR8rZCmNhHK3FrgtYreClPZmGnkm/rtHBaJfWiPwQDA+88D6pEFAyUn6yDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
	b=Su3NitPl81xnejG5aQTpAWvyKaPy0p1lutwJCRuJ3UMKTZLRU0yutmlBZIenkZZtl2gf
	 CoAqzq43BXcIZKu3SJFin1RbdtbmhCQPHY6AZ+OHNtBqnllqKoWw9rE9DF/QU1nOlLODJ
	 yHvD5wH0c8qx50as8ethtbFz/h9mLyb/p30S7cl2dXzh2uUAWNvH/fKUq/91/qKZWSYtX
	 GBFplNH+Ys8HFItoZMPXy5KpqU5Cxqn40JJ3D1whc7bv7qUuFFhL1mVcBstY4M4BT6xww
	 30aMAcPdovpx8nqUEwZK7juJegdqAb1IBX3JJM+VyzkaDtidxUCpayGmfQWcZATwYNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SDyjaxyb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3130606A326
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3130606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SDyjaxyb
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so1587a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442460; cv=none;
        d=google.com; s=arc-20260327;
        b=cO7BxDq0Zyk5cagbgWstjLNVmiuNbBqVF+I44Ipg2S52cY6TQu2Tcev9Al/oh4/Eat
         klZBeG3a131J71ezbIegoyp+l/WwXZN8cDxp8K7HPYyOFBC2DVnfG/LMpK4OX5RJ5EYz
         tTplpwxhDLZxsq5FGL50OBsoyhy554Nw9X3Ja9rn96Vrm4Y3Kkt4kIQ+ypiyOjTHfPXb
         OhewYBWOA4a/Eoc3fSpVHnEu9hQVscpsnzGkJiJpwE9SkONIkpAMX70+VkE4O91uGf1D
         t7DzgfNbJRPmZppkXz3A0r5ISeprNa5/k65udj3Lt9Y6iNwH5v1RgDkZz8LmRkZhYuow
         vQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
        fh=PZc4nanZlnEg0kUaMl8xqmgf2qOCQazMWEf1xdM7rEk=;
        b=PboX+3lz0NAGNVzZXI6jxmezDDOL7gS7wpgdXpJkm3WLQVYXmO+kZcPEjBJQqUVmVw
         xRxlgxs80hK+WexuwUUjSR44nRT0eYiqKFtGGLhhwh3Bo92lkXX3po4jsMaI6cBRQT9x
         SCemnvFYTwLg0mD31hXx2z9b5v4ppK0q/LuDvnU2Ifg3miazuiGWezDmFa4Ml9FxX9hE
         6nyg5ckyG2XK8D8PtoHN8Gnyxy/SE/Tjovl++gX2pIa+6hcPCTP6iik1X5B1S8mDiO63
         3y4FoYWnsCa2zY7Jl+1LkNOU5JsYxPB9r2okE4qNQuuJWttqVb5BLOsnsQIir7xBE5mD
         EwXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442460; x=1795047260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
        b=SDyjaxybfpDZ+GWIRXwXHRgNXxO+19SgUyPxzBxooYLTFpYqLIiTwWA4lKfCpMdefA
         ADzdSU7SYgKFDnyosvW7whHJ6ZFRKXJswAkYa/ScGcEVt0/cAWuqiv3shn7VsTJdDFUH
         Gayd79YDMjQ+hlLvmp7jtusCjGIeemXeOBh+dZChDXwF0xZfsjg1vt8sxm/z1dT37fAG
         uF3sXlwYAzk7LBljJaLhKboJHyc+MrKQQ7jJPuxiBPYP/Kc3RHhWIvNS7kCumAqjAxJp
         kZjJlWqbexuSuxva3sF7tsLWP3si7+ok/PkDEwCBrX0Mr98Trfvvel6FVCg7CdOnTBwX
         dKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442460; x=1795047260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
        b=rqNwo6CJb/yaSwgd2jf+DJqQ7UfUIkalt2H3sX4Yg3zVA2cFTNh7GMnFdLIRMYwLTO
         1gQYVABCkm9aDm4hL3ltdMajAMf7BciCGtZXEznZ1hknMDXp8fUkMeI18AspUDHTxKn5
         zOaoysFFRd1bJqKo0xwrz7Ucexr/BGoPqC78BND6LLEzrwx/xB5xqdvQZQd3QpEGPrsw
         2Y9HSItzWYdPYfPsAJEdgm1nucPoeTESuwm0ypwi7H2H54y8ZJ2PnFceXuq8ecaRFvh+
         RX/ZmMh0BUpZUlV0T7qzrUdIHMF1++rmBtYkLZ3+Gu0a+He5iSlm9mkR/labdmhP5Wo7
         iY6A==
X-Forwarded-Encrypted: i=1; AL+hErFlAAAXLquxLJcw8ttKE+BgDMDY4gz52Dd1H/0dkD6HfccehFDMJohOXvhdXe3chMQhhj5Kl5uvdou5bD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hDm8aTWAWp+0weGwtvG2Ks15TGccvNLaYquuvHDin/xgkNjz+
	m6+MaFrMsStnLAAjisMon6pEQjzKqoYRNlV49abTXc+2DkaJj9aiLQM56X1VuY5U0NEiGgShYyh
	RIs6VBBhxdvLv6a6MRCNutzFyuH1TRntrWK1e6Xeg
X-Gm-Gg: AYBFou0nKW4jlFZsTnhLLlxo0RocT3DwauyJEfoYF/cMFYTDfabo2FHFbYYUaHuOTBa
	Sq9WGnrDMNfxGvYdrOllyI9Izf4WnEU1G3G0b//61pLpKl3/kGnqeboQ0XigebZImZuq7QNOd88
	W+3YfbgYj4RrfRkzROxhv0QC7SWM4iTTNYC2Rd9tPHQ0mqP/fDRYeRQLV0C1euCf/ser1O3kvaw
	d5kydMUvY1EwdVbWyhrC+mBjxrE6IUupPQBcEawtajCvcDQL9/eWFxWO3UNYWZLB9Yztb4Bs80u
	DHKgBuzH0UK+8/+oCJBaD5FcggZ0t6y4nnQ1S/hGI/Tpe+1lAv3/4KTphU6Ro1JvjBMMEUTuKuC
	EHt0a0hdcVzYz+nTzfdfZkX5L6MdSCi5q9bJDVrU/YDx0rHZwP+Z7aRVLtK9TtVR3A7mhooqk
X-Received: by 2002:a05:6402:911:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6b7a29d3f71mr25280a12.9.1794442459610; Wed, 11 Nov 2026
 16:14:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <07581ff5998d40092c2f171ffe1fb05ac48f9446.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <07581ff5998d40092c2f171ffe1fb05ac48f9446.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:14:07 -0800
X-Gm-Features: AclHuK_DBL8YBFb4m-FcpIKCAISr9plqpjdioafs2WWldumLjrzVfpqUvhMg3BU
Message-ID: <CALMp9eQ8ihM7LKSUHHOf-i=R+Gx=7ETZ3r_83P3SGovBEFX87w@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] KVM: x86: Move VMware backdoor support to
 separate files
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

On Tue, Nov 10, 2026 at 10:02=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Move the enable_vmware_backdoor module parameter, the VMware backdoor
> port and pseudo-PMC definitions, and the VMware pseudo-PMC and opcode
> helpers out of x86.c, emulate.c and pmu.{c,h} into new vmware.{c,h}
> files, and add a MAINTAINERS entry for the new files.
>
> KVM's VMware emulation is spread across the emulator, the PMU code and
> x86.c, and both vendor modules read the module parameter directly.  The
> following patches make the VMware interfaces a per-VM setting, add a
> userspace exit for VMware hypercalls and allow compiling the emulation
> out.  Collect the code in one place first, as KVM already does for
> Hyper-V and Xen emulation, so that those changes stay local and the
> code movement can be reviewed on its own.
>
> No functional change intended.
>
> Link: https://lore.kernel.org/r/aIEgVpjXDR0BXgHq@google.com
> Link: https://lore.kernel.org/r/aIEwOToiAkKfQA-4@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
