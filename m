Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB17315D58
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777646; cv=pass; b=auKhUIVJxMoEWWpADhqU3MXCaI/vZGMuSDZm0dz1AGnu/7mwEeRJkVNpXm9aBMFdnjOhP+MbsMZNQad84bZ2IfAOFqfL2ejQmMfGRq7TTbW6mIDa765P+fwzMyERe4GJtyV8ikZQ4NwUeiEIIc0Xb9CpLnFczavMj25gW7rbVpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777646; c=relaxed/simple;
	bh=eRYDYXq8mO0xqUTiGna2hw3VEfXp06tx+s1Wx9I3ALI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGFpSSfwYXb8zIIvTW9Bxm0dYBIzuCLkO+vp0L8F0v2old4ToCuwIW3cn0GDhMK71mH3cWxLk0eSkOYsCAakHWJsSlvkjmJgyZNdjPRvnJVNbGxdS8LkGolURWNm07QSuuQVKIm+txg7FQLE4tlY7spLLK7gWwkcm9im7UQmFk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mhCYJju5; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mhCYJju5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db33db4de9so44545ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789777642; cv=none;
        d=google.com; s=arc-20260327;
        b=sSCWf0sfsDKJ8676TvQRxdArzTl+vAgiKDl6o2D6lkrkitxvc4g0zPY7WYtabrlxPn
         FMF6VvtYfl5/sr/i9IdXMmv5m8vfJXSzVJRb64S6SPLwJDHZjXcyiDhGSensv3Kya4P+
         2jIo0pzm+S7i2Twdax6m54OBk1rnWnQBZ7ilNQaIIwNk2EgK8zc1o3PjRAb/r5KNxLK1
         fudVhDvI4hhHFwpZntUo7tk8omM2I890Mc12ATGRjUvb0Fbwt/GXTA9lYlGUB3cL0FMC
         qqrItaTYS9BqYQqsa2MS2ed7VdF1uQwqHtRCTo6SJj7Mw+MTeEuC7vx89SPdRtQeQo1A
         SCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LmqMKPHBB/mFOUskOMGcF49EXv1ypL8clVxsz/MHGR0=;
        fh=VwwOnw8WzKa1iXmucTVOjffpRUrMezbpYFvCtyKmI+I=;
        b=lKOhFnpcFdMZXrDIGIJQiNWgS3O8FvQnJjCzgliBqG4y5lJXvNB7UIqJ+Gcy12kqTM
         9q4SL1ANWvhWtx8WDeG0+Ha4AJmtTQ+EgwG3Fh5K3oBMwO8vMXjLGcS8JYFsSocJK2IF
         5KF12jlG+MesWRnjbTXWfPgPUxnkHCY6lMfO13ldX9k5zteP667RAIrD6lRQ3kQhKwjT
         U2t9cWM0vvZWhs0UGF/Y+tat7Hm2CYEhkjOldbzvqa7paZQt6ShWqIYn1rLW6TYsUcua
         LLJeqk1jULzHI5lAOoB/MHQ1r0wMxBToztBy/VAcvsxpA7q7xkmgyd6R2ZWZgH7zL8Pt
         6CLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789777642; x=1790382442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LmqMKPHBB/mFOUskOMGcF49EXv1ypL8clVxsz/MHGR0=;
        b=mhCYJju5RLperT/80kwTGTcKjRNJS61m/AO4/v9fq01QvhtP1GPxdBUs1rWQZqCLMb
         Q5J7CuPZHfhlDgsVVDTiEQAB1ZPUPVrG2e6x3rPB72wJ3EYwrvOk5HEG8n3yHK4Tp08z
         MAJ5TqgoqwJ363BnUMgRnxMdjHcN83KWP2Uu3Usd9syZRrbK8Rz2UOLfZuTwTT3/GKO0
         S2XOdwRAbJ1bRJFpALEVViREqGx/wSCh9pdaPpB3MHYYrouxgU/L+6KF5GrauP4QvFpI
         GvfZPGIXXPOeN9tgDhcUlVb55min7MhHSYMpelgNS96wvKzy+lVjtejB/OGyVTyRCh1V
         33lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789777642; x=1790382442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmqMKPHBB/mFOUskOMGcF49EXv1ypL8clVxsz/MHGR0=;
        b=tcUcuPTWvNEBCEdBZ2icMRmK4XbeReoaIi+plRgUtyygzy2ihUcVA90aaedmhJhvUw
         tp9R9yvQ5W2FrCeiDnsR7lljEI2gJVW9vJYvEwgNT8THs8jBtVPRK4mzChrRrQbTAt6F
         axVAj0OS/HR10hhbSuIZI4FGZiofoxXWGkG4rkETLPOLtW2sOCF3s/cxnTx0YFCzJVVV
         BGzagIUSwy4dMgkU8/iI1gF+0l/AAl+3zA5zwzvrTLtqQJxFI4JGFBkLWluD/Sg88jXH
         7n9TxQTwONlP6aCeyY9pMHZHlFjGGYAHCUWn0P6QfUADGli8eInHBRWZ8Mce7JsTSl21
         UL3A==
X-Forwarded-Encrypted: i=1; AKwUvByuUA3o4rlLd8brsmc8rnMkeEvn0+XIawRT+ugKx3Wwd104nNw/hD1cSjeAoJ7nhX2QVzHRgpGLs8w3QPY=@vger.kernel.org
X-Gm-Message-State: AFuF++lH/Guu92nFZO31CXne9rOP7qmWPgWtBTbwK8kKU/rYeBKB8dB/
	zKxEOFi2oAZGWAT8WeGNNXIUec0VGbzLN3EK9Ol+nSFlO1MCbGkGQlDZNFvm5qBNKlcUeCYRm2X
	3w+lkj2NhVXm4YcFAaytps0RlKUqrtDOwof9XSAa9
X-Gm-Gg: AYBFou0+awRSnwtwvTZLHwl41lLHn6A3vL0LxlnO4pElIWvS9bMFYJQADY61D9UgafH
	GxAEst8HyE+2bMi+24EAZmrn3WP1AxJzhvlPgMfbmp/DWMo3H5j/vYo1IH3eqYSIWhGGJ54NlIT
	C9Yehwog3jSw3Yy5BEPZoJeHVO4ipRG9SsJjtAvyPBBC2hx9Pbldq8tynXl0hzCtz1Mz5ssOgVA
	ZK2AQl9MbxsnKzdJUe3u0Wf3C8dX7mTbHR1QmthXfjXFfjJNiZiopHu+9Gdfwz0Yy+04ZqHhvUz
	t6pjEnvH5q1IXbvjeSuw/rLiiNJYAZ1rQtDtJgpNNfqTEGbz1bzHjLTT+5WyQCMTPQDpu90DuA9
	zUnHofPQd2w==
X-Received: by 2002:a17:902:ffce:b0:2d5:db3d:1a44 with SMTP id
 d9443c01a7336-2dec1f19e92mr1672875ad.17.1789777641256; Fri, 18 Sep 2026
 17:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
In-Reply-To: <20260819094903.3060020-1-xiaoyao.li@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 18 Sep 2026 17:27:07 -0700
X-Gm-Features: AcwNN1VzCFV9uA1sUp0UBFirw4LC7YC87Ka8strvz1IBLR6XIOyhlpfD4-o1ujQ
Message-ID: <CAGtprH9a3Cu80coUpg-1sHrmVF2c6ZQOSe1pOTUbEx4_xuHiEA@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] KVM: TDX: Enable VM-DoS Prevention Features for TDX
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	nik.borisov@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 2:59=E2=80=AFAM Xiaoyao Li <xiaoyao.li@intel.com> w=
rote:
>
> Xiaoyao Li (9):
>   KVM: TDX: Enable Notify VM exit
>   KVM: TDX: Check if there is valid exit infos based on vp_enter_ret
>   KVM: TDX: Set bits 31:16 to 0 for the synthesized Exit Reason
>   KVM: TDX: Don't assume exit_reason[31:16] is all-0 in
>     tdx_to_vmx_exit_reason()
>   KVM: TDX: Update exit_reason on wait_for_sept_zap return
>   KVM: VMX: Preserve negative return value in vmx_handle_exit() with bus
>     lock detected
>   KVM: VMX: Make handle_bus_lock_vmexit() a shared helper
>   KVM: TDX: Enable Bus Lock VM exit
>   KVM: VMX: Consolidate the exit handler for VMX and TDX

Reviewed-By: Vishal Annapurve <vannapurve@google.com> for the complete seri=
es.


>
>  arch/x86/kvm/vmx/common.h | 20 ++++++++++
>  arch/x86/kvm/vmx/main.c   | 49 ++++++++++++++++++-----
>  arch/x86/kvm/vmx/tdx.c    | 82 ++++++++++++++++++++++++++++++---------
>  arch/x86/kvm/vmx/vmx.c    | 46 ++--------------------
>  4 files changed, 126 insertions(+), 71 deletions(-)
>
>
> base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
> --
> 2.43.0
>
>
