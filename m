Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F427057D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730685; cv=pass; b=cnF/dL/6hJnPMRCqqRPJb/XnF+dWmW8R1cveRXDpYl+JBXOoMEVmlizzsJuPlpF4NSrfgMmGEpB/S5cz5XXw4hROFEhK80PRyLx7MDllmg0pjw6WWj2W8hz+pi5noEeTHHu7CdvlOBmzwAeEoQyF1+rpqVwWC66tmU3RCCvLBHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730685; c=relaxed/simple;
	bh=uBnC6KA4mFvaE05vQovsBFoi0Ky2dT/n6cHsROU3IVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Flk/Vr8GV+dit33NWPqjIa1nbFpnsPUuSBvOjvJZJpGOwU/Eh7/0EEoOrKslY7aNGkEWGJrpfA9M3ScJTcf2jLkQpMskGqrDM04P22jnHAZVyIhvgp0UX+byFPrkx9AxRR9exM4mx+xqjL54kCJfW+1O6kjCF4YcikWHNlABoMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o2Q+F0lQ; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o2Q+F0lQ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so5289a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730680; cv=none;
        d=google.com; s=arc-20260327;
        b=AhzJwEi0N1tA8q63ZmO25gh5Z08rp2o6rSDIIT/crPijKNASWnqfef8neBLqJvVgFM
         HwHEK3dRI4pQymad+3ADhS6HDMUM99z24SqgeeU4px4z3A1kICS8W+obYnbCTTo+mpgP
         zB+E4BHSdBioqjGKuESXPO8ah6A9NmcFwCq+8xJpbD70y9AspKTLQz61uq5ssv/IsOkS
         QQArX2sqMcIP+6sNXWp1H/maJGeOhuZ2l5iA59mdwB5l9BRAG02Tlau+sYY5Xxo4A1el
         hKsX4nOCvxeeTe3pnxQq2vyTV+N2/0HvvX5xjWd9cHGAJcNwvOFlBQLcgqAHr2Bl2gKk
         VIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7a5izxf6YFzXYW8w93EbliwqXIbZagpn1chA3AffJ0A=;
        fh=3r7E3lhC1vDul1oLNyK1SV1BDFoD+8RFoMXbS+j2w4Y=;
        b=i+l9mzYYQhlAgVBgO8pWIedkt+r/muqCSoNsp9bojN6XAHq99LqHzAUYYYP+8o1pkK
         FsVVO5hKNMbX+DRKV01qBDXAkHba4OhtFL9WIPoHbm9hAMZ8n+ZdG452uAkUbn/u6dY3
         kajs5+yAHX+Y4Z9Yt6Z204rNKLNv78wEO1+frAVOkd+Mr9z5dRXwXfm50m27XcxKNWYO
         CfkwSdjejQEEQ/DaTZVIVvwlAFR+Z+TNrjLtxHBKs1p9Fy2sgeH1LNY1eevfnKxp1Puo
         oS3YX6wnQu/+GsDMs4fyJ15lAVq99grPFir141mrmaxUKLcAoVj9UE1W4GCDztwSNtVd
         Da3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789730680; x=1790335480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7a5izxf6YFzXYW8w93EbliwqXIbZagpn1chA3AffJ0A=;
        b=o2Q+F0lQUDOlildXI8CHt2tuRsVMh7RNL6NsE6gE7zgjPqAmIzvxc3mMaTj7iDJ4qi
         6Kp5a+pysfw40TIAlsZxZ81qAnHe9p8jcGmZhafR0URdMZeNWtJYjbEbv//VBmstq34Q
         cfFA+Z6vWvYXnpxPRiUztO6W7pQkJNT03gsbajeaTvTpSaumUYEplNxArRaBRur4ET4t
         35KT5FLGfSJx4qY8TCU2307Bp7bLztGVwTz31oNj+uPnnDVu69waNHuBvI+0TjgYLWxS
         3/C0xDli/wxKsDyCRJwF6coH7erjAVcivNN+Ztq0SCj29zTatEaDVCFSxmaayPOdWsL5
         LUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730680; x=1790335480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a5izxf6YFzXYW8w93EbliwqXIbZagpn1chA3AffJ0A=;
        b=ye8eweLQZIa9mDjwD6gBGDg9m/XuMz453cDmMeK/vf0XJ/IZrT1sZYobhE0f8DIf4E
         s73qiQ+R+fRZr0bwIGk8GSntJqNwoOjosAuxVuICRLwd0SKg8wRtGH1HyDcq5ng2yHDm
         ySpuL+Ho3KTdjEuhdi0PaCN2PeafkinFJK/PH4UwPlPtqAAjPc/NKkr8UbMAQ+3csbsX
         KGWhExYsS9uECf8sfvgPIqpNu1bzJXQrHbl11pAwdITDlSIwvXfpeBMlyQ+EEY7f0IUf
         ikNuwNiV6et2EIOipdRYujVXyyQbWmtBrUZeNDQ+I6MglfZ2FqVb8NX8P+fJaZL1bkBV
         bz8w==
X-Forwarded-Encrypted: i=1; AKwUvByYENWK2um4Rkcv1y2k9/zESNz79lwHJYaTn9BVU0mY1KedRPWe2sUI6xCDymVOpunouxg3+mDw7n1SaQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lbwAMFRcDzjQKP/W8Vn4rq/f0snxKRW1iafc/0KXLxs8CJGXmW
	lsmsSQXQXJUXts24ieQzMZgNPysb+9qEL8gR+lXYbioYkaaM8Qw9dzUyv5IQ5oklHyG4P4U6n02
	/LOflG3OQrOxhqoQC5r+agZcs+J/dEltsZGBLxS1D
X-Gm-Gg: AYBFou24s23OAKqxIm7r7Rwp2jI/7oZOAiW9zZadYH3w1RdtMTjCtQlQHsbjCb9/fYl
	/4Cs9RqpT2s8zJaO8/sqYaVw5LoHL95HkCl3Bc4VBxxbVVb6dTbArTqujxlCTLfSaK/fqy/5Wh0
	sWvYLdl5mUbrCCoBa1T9Ka1WuetHuyg+dtAsnSSQdvUmDXWrqN5QmOrzw7GK5Dbr0+ng9RyNbQN
	puhFo5zADOi1VbFPNrXb4wcEhECL9jsGPeffEsDamCcUZh4TToFyRrsY09Y7AlK4JQi2h7DMeFZ
	Hd4AhSbUww8dvW+qPe6FxuFtxGWTUdwYhTzKPmnZp8G7dIvNU+rUx0iq
X-Received: by 2002:a05:6402:3c7:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6aa4df21b4amr30464a12.2.1789730679801; Fri, 18 Sep 2026
 04:24:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <1355f32599087e8f4d0740bb92ab5f0c9c329b6f.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <1355f32599087e8f4d0740bb92ab5f0c9c329b6f.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:24:27 -0700
X-Gm-Features: AcwNN1WGefe8mq1Aq8R2hXSQ4KSfm5bPolxygvJQEfdVJUvpg92P3z4X6vU4uvI
Message-ID: <CALMp9eTM3WN7idYYK3hhkuYgdDbwE94VTZB4F0fj33DTa1ExuQ@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] KVM: selftests: Add nested SVM DecodeAssists test
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> Add a focused nested SVM selftest for DecodeAssists.  Verify that KVM
> exposes the feature to L1 and provides EXITINFO for representative
> MOV CR/DR, CLTS, INTn, INVLPG, and INVLPGA intercepts, including a
> MOV-to-CR0 selective intercept.  Check hardware and forced-emulation
> paths against the same expected values.  Poison the instruction-byte
> fields before each instruction-intercept test and verify that the byte
> count is cleared on exit.
>
> Exercise instruction bytes for hardware and synthesized #NPF/#PF exits.
> Cover a synthesized #NPF that follows a hardware #NPF in the same emulate=
d
> instruction, an unreadable instruction tail that leaves only the cached
> opcode, and the absence of bytes for an instruction-fetch #PF.  Modify th=
e
> MOVSB opcode while its MMIO read is pending to verify that the emulator's
> cached bytes are preserved.
>
> Inject a userspace #PF while an MMIO read is pending.  Verify that after
> MMIO completion, L1 receives instruction bytes from the current RIP,
> not the previous instruction's emulator cache.
>
> The hardware instruction-intercept, synthesized OUTSB #NPF, and
> userspace-injected #PF cases run by default.  The forced-emulation #PF
> and instruction-intercept paths require kvm.force_emulation_prefix=3D1.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@google.com>
