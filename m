Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501893;
	b=C3DLVMm77a2BAP86+Syrr1biBU6kI1qlzKOQMiJpl1TE2I4eWjBWtkTe1SLVdrruIrQU
	 L062fSo4Lly37WTlx64NYC9XtTeHzGBxzOtkMOV321bJ9p4W7dQPh1jT2iGfJqYPyJAhe
	 q6cuDwk2viSPV4ZWiWYr/L2H7TUS+1a2OPcR9U1X5eQ8rUzi4vmuKxde2865WIbJd6+oQ
	 9PDNQRotHaswAk3c2sNsTCuTp5DkmP8usDL/rX/wFhq8ui+yhOYMVQ5l34qEnozfn7vQh
	 4aObFLRrXcwavzYvAspC8L6sp7VS0S6tkvD9qkTCMVU/6S6hCuAWeawjKhnoUArPd0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=N/JJjQAxr7gs5XtFIopHR9Vrbslfj/S3BZMOowPnB6o=;
	b=2UyRdgJGYVZJbvjyW3XXPRdjksv/bMF08M+qxOianCBeGnamSThWKAdJJyhacenPcXDQ
	 dpamxkEYvDtoaglEpD2kGAH8YmLKM87A5Gj9HgF6H+c26maLRL2Cj25gjOp3dfSoqYcJ1
	 yC5iKtKbXdgdvvZT2saA0grN44d7RCxTX/4Jr02WRxv+z8SwcVQxqQhWcFE4EhI9T1dOH
	 cnqxFVndBAvtVa8zGlT8c8+0JGmF/GYIBlCUucu5Bb5zIomSwxy9Z2NAJ0OwOtzcktdky
	 nGpT0FgKxQb7KVC7TJlUKOJRw5WB9Ef8bDzmyiYVsWmTkFXnf2nQtLE8toOepwlsWrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KgyDMV55;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8942C606A897
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8942C606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KgyDMV55
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so26938a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794501893; x=1795106693; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/JJjQAxr7gs5XtFIopHR9Vrbslfj/S3BZMOowPnB6o=;
        b=KgyDMV55dgAMB96NH6xPoULExcKQ6F7+p4ffGn/u7ogvRLZG+3wGkwPVFeKSaOqkhY
         31+ZGnNQ4yJIf1ndpeldECdolpnZwx2LYh43xsuwgubZFVizoY5374paI3PJrlqbpERh
         YmqPkPPnin0+XMmH2X45vR7l2BgtpR0cMVRTX+TP5H5kQf2ZqOIaGs7Ov1hG1RlyfmT7
         TnaKb4/53FLAKn8iHG73Qpgre8lp5oFkVH7cU7GAyux0eEjEoTnDFdvS3FkklSMsJwWe
         cNz7+jXpomogS+CvqfViehQpNSdFumH1prz1lE6EnnLhQGhThZ+CkmtM1IQ3GmOBkn/o
         0RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501893; x=1795106693;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/JJjQAxr7gs5XtFIopHR9Vrbslfj/S3BZMOowPnB6o=;
        b=fHWySd5tcZI9qSTIOJB7oIv4Tug+wjofdH+p9S8iFHFNsq+NIOsx3iav4hIVDviH/t
         /mVcoLlJg+h48FIUnha948rtF+y7BbS4ExAU4ym61ZN+5tU4nBWdo+ur/8lbXKgqaHuN
         yNmw+Z7J0URRtgfZPdradR+Yk3BmwpPsBglPOdPGyTJArLiCX25J7PN686BKT+PVpU9w
         717twqkP9pA/O6AZkFR1MlS/AsW00bFrR6ir6nWCJVUNG3FawF/7yEoYhy39wUblBb0h
         r25dx1USW5/aLU3uw/sFw3cba3EhRfbnfjhB+SW4zJ0ZCCaV5cx5v6NGiwQmddL3w/II
         Gqwg==
X-Forwarded-Encrypted: i=1; AL+hErEj42isAzusvE88s3ZV3I+jK7lx4H8OEepQC4968o8P7UbwLCumd4W6faWZ/v5AdLtWuqdVUWdbuVOiR3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qQIv3Noq8zlBO/nbRn+seWXqJmZ54MrBcnE0J8kSXR0JVohBF
	w3p6MQ1feM9LM6okwRT/MtRf4diF9Rbmk0LDWxA3apqBOLsPrpnQ3CdWRwFmsVeaX40CfllWYZr
	Cqsc1RA==
X-Received: from plhz2.prod.google.com ([2002:a17:902:d9c2:b0:2ea:c4fd:59fb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d481:b0:2e9:87a2:b4f8
 with SMTP id d9443c01a7336-2edd775c023mr63208465ad.29.1794501892291; Thu, 12
 Nov 2026 08:44:52 -0800 (PST)
Date: Thu, 12 Nov 2026 08:44:50 -0800
In-Reply-To: <avWnci8x0fn_4ck-@stanley.mountain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <57324d544da1e92cf3b30ff7c40595dfbca1933d.1794465097.git.priyankamani2100@gmail.com>
 <avWnci8x0fn_4ck-@stanley.mountain>
Message-ID: <avXtAsi3Llq6Ua1n@google.com>
Subject: Re: [PATCH] KVM: nSVM: Check full nested state size before writing to
 user buffer
From: Sean Christopherson <seanjc@google.com>
To: Dan Carpenter <dan@pereq.eu>
Cc: Priyanka Mani <priyankamani2100@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 12, 2026, Dan Carpenter wrote:
> On Thu, Nov 12, 2026 at 06:41:43AM +0000, Priyanka Mani wrote:
> > svm_get_nested_state() compares the userspace-provided buffer size against
> > kvm_state.size before adding KVM_STATE_NESTED_SVM_VMCB_SIZE for a vCPU that
> > is in guest mode.  When L2 is active and userspace passes a size that is
> > large enough for the header but too small for the vmcb12 payload, KVM thus
> > skips the early exit, copies out the header, clears and fills the full 4KiB
> > vmcb12 area past the end of the buffer described by userspace, and only
> > then does the caller notice that the returned size is larger than the
> > provided one and fail with -E2BIG.
> > 
> > As a result, KVM writes up to 4KiB beyond the buffer userspace said it
> > has, and if that memory isn't mapped, the ioctl fails with -EFAULT instead
> > of the documented -E2BIG without reporting the required size.
> > 
> > Compute the full size before the check, as vmx_get_nested_state() does, so
> > that a too-small buffer is rejected without writing anything to it.
> 
> I would prefer to instead move the if (user_data_size < kvm_state.size)
> check until right before the copy_to_user().  It's more future proof
> that way.

+1

Side topic, your mail got flagged by gmail with:

  This message isn't authenticated and the sender can't be verified.
