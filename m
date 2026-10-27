Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138957;
	b=ny7PTgKAwjvseBASV6/heZn2XmXmAm1stwh1cJ3zBuQQGp8SowZOK95hfTJPGvN4u26c
	 ce2xCMUz/UpK618VxqhC98A5Mi1zn7y0tQ1s6Kl7KLrK/0toS7MtwkpV++ONbg2YLjXRv
	 9RBg0xerVcsCeTvoB3S9/vFtQ7s82+m2JPKEOaQmekcMjvjEgThrGL0X0EktTO6012Qdm
	 JdLwEFe1SoDGlMsNWG1DpQ5Cg9w14oNjPrY3XTTs3yUa5eY8l0k9kwUi0qBDUsC2G13+0
	 PUKLfS9pojwwTW8njm1avx8EIi75NUBH74W5eifrmtPWPi/rXFtpuNA966DwxTx4Rwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rBwkpeXs9IYTeLqZKiGyRddb6tb6kIGdVCVxCuWmkaQ=;
	b=DI9ORaCzzenTHCBv2LvJO9ptwi/KslLHNtHkylkNqn2cRo1ZsHUXWEZauh1+uE8oLjPA
	 aNS05SzZmqRc88wXKpgivRbmkb6txto6LL0YZ0B/fBzMY4sDVagfMyhYvkf4fai/RHRCf
	 kwdsTs+hpBNS6uRbya338CVHzZw3fS3LrHE0ExdIiy/8iz6z6JP8GsQDjMcYCWdfiJ44s
	 UoSgsxe711hRw/wSmL02p8o6gUhfCH0t4BpqLEgVWwdzPqvKi2MA3jpMfSp7Z/eOJMlak
	 +Zjw9FI6MDXCra3LsyOL2dVDAhNjzKvCLx2hvXxTPINFaPegkB0C/UgS2e8LRYHA+Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qrqnZ0y6;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F364606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F364606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qrqnZ0y6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so2804385e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793138955; x=1793743755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBwkpeXs9IYTeLqZKiGyRddb6tb6kIGdVCVxCuWmkaQ=;
        b=qrqnZ0y6YZ/9dGk5YnV6G2G4cuHt3qa5epDxGEeShFv/mwOZJh4aOm54jjfhK0cKDC
         w7WCz/UjL9XZ/aI/QvmhqRNnx07nQ8dwoV0QC2gOJ+vilg+v7Y+BeXT2uJC2OXmSLPhM
         MQZX0xZo63tTsvnHpQeFFMNgBbw1aRStexziSiX2W838LaSPkEihUaVdl8iAB/KMPXq8
         46SJ41HrwUr7dimNCHQ9mOcdMe8/QTCCbVhoevsZ3w60Jf3LsLaIGjRn5lGHkVrl87UV
         m5WTA0wfEJqw1SceMezQa68mcifLLXgLxywcmRWudfr5sN9Qt4CHdRI0VpSVKxuTYWPr
         rMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138955; x=1793743755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBwkpeXs9IYTeLqZKiGyRddb6tb6kIGdVCVxCuWmkaQ=;
        b=WpEwaFOcrNYrnqrDcCaFl3CSUutDB2ya8KJ9OxskPUAnfzIqfrrCoNyeGezUblrEuk
         CiuJUDm83DlDm+JMBRkP9LsS67uczu8q7ySpTRSto4zChXTBB7s9zldQUt2iGt42pbDb
         vMLcXLB5l0JXVmlUs7tPPUQ3YH/lAUGHRdscpBVmiP/gsdP8wh+dtrWoWN1EQ9j7VdcP
         y+reRorPE9KInT4yPJhUhn45inFaV167S4g/MZ2ZBsNFHM2k+3p2M5B/oETr1rzwhh5V
         qnhLtx6tcXsG9AsBA6Ibb1sifaPUPLBPpDa/W0bwrAuXTnNTP6bEZE5g2z03LZpeEB37
         FIyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRLzc1p9tR2fJbNg4VhfGpUE3+xQ14flTLNeWFionh874PnNEuX1gOHf6/qnSCn5YD7xV4H3XIWMrD0lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrXcPqkZQ33rk+DtUlq4RSbfbeXOijJVeJedokwR4jZkhCsM5F
	3TdhO58kPWG17BP9cgKXDMjCfTLZIKe6VXYlZii61HhoZEg/m4JXHxDA
X-Gm-Gg: AYBFou0CMcqNaheD0D2YY0EhpHgHdgSGboIBP5DcL0B4pfYPEqGUCed8sApvhJoR4Hx
	f1x53ISR8HbBgGbRjOPHX70MK3LktZorK9FVd7lZVnMcQsT3Ad+rbPi6J3uKt8vGAbmHtOqiI7E
	MrQ4Nj6gyOPhmTujSMCyKryHWn9ZubIIv3ohaXG9ldJc9r0qixZqUYfe+AFip5KD1NE99kcXNEO
	s8PjKDC0dMe9Hyn2FgkFxm4rYoHgRQSOqEIGlCJZlvE8iiH2zemthl+gTHSqxzlwVqEZKHo7cBD
	MIg1D3upnFECJKsNXU0t+QFmXkU+kwZAeVDSkS/wJy8hFDXuIhic0WZ6V+u6TBPSsJCoajn+kTi
	fTXH9ofTHXghhjqNgvZZyy3E3qHtS2aav3kFmaJ+5azG6aG+nW0/WxEicQy8i/ghJA+1bZTZqHD
	hAVwbIU8V4ge1bpgwrZXxoW1dLchVsO2/uvF28SeooQ5AOSNI3v+kqYTclHV9I9MMt2mAnopVDW
	hmwgb6BqmexnJFm6qLHHcLsqrpfRNGVK90pCHBaK77R6DEhVWoNNpK18A==
X-Received: by 2002:a05:600c:37cc:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4a968552939mr5068125e9.34.1793138955534;
        Tue, 27 Oct 2026 15:09:15 -0700 (PDT)
Received: from thinkpad ([2a00:1370:81ac:50e7:d3c8:c903:5898:874a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9792269b2sm1720035e9.13.2026.10.27.15.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:09:13 -0700 (PDT)
From: Andrey Zakharov <dedemorow@gmail.com>
To: x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	hpa@zytor.com,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Zakharov <dedemorow@gmail.com>
Subject: [RFC] x86/ioperm: boot-time switch to disable iopl()/ioperm()?
Date: Wed, 28 Oct 2026 01:09:04 +0300
Message-ID: <20261027220904.15896-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

KSPP issue #97 (https://github.com/KSPP/linux/issues/97) asks for a way
to disable iopl() and ioperm() at boot time, so that a distro can keep
CONFIG_X86_IOPL_IOPERM enabled while system owners can still turn the
syscalls off.

I read Thomas's recent explanation in the "iopl - change I/O privilege
level" man page thread, and Andy's reply that iopl() is low maintenance.
So before writing any code I would like to ask whether such a knob is
wanted at all, or whether CONFIG_X86_IOPL_IOPERM=n and lockdown are
considered enough.

As far as I can tell, the options today are the build-time
CONFIG_X86_IOPL_IOPERM and lockdown=integrity, which also restricts
/dev/mem, kexec and other features. I did not find a boot parameter for
this in next-20261022, nor a previous series on lore (I searched for
iopl and ioperm).

If it is wanted, the change would be small:

 - an early parameter, modelled on ia32_emulation= (kstrtobool() in an
   early_param handler), that sets an __ro_after_init flag;
 - a check of that flag in ksys_ioperm() and SYSCALL_DEFINE1(iopl) in
   arch/x86/kernel/ioport.c, next to the existing capable(CAP_SYS_RAWIO)
   / security_locked_down(LOCKDOWN_IOPORT) checks, which today already
   reject only requests to gain port access;
 - an entry in Documentation/admin-guide/kernel-parameters.txt;
 - default behaviour unchanged.

Questions:

1. Is a boot parameter wanted, given lockdown and the compile-time
   option?
2. Thomas mentioned that the permission bitmap can also be changed
   through x86-specific VT ioctls. Should such a knob cover those as
   well, or would it be incomplete without them? I have not looked at
   that code yet.
3. Which error should be returned when access is refused this way:
   -EPERM, as for lockdown, or -ENOSYS, as when CONFIG_X86_IOPL_IOPERM
   is disabled?

No patch yet. I will send one only if there is interest, and I am fine
with "not needed" as an answer.

Thanks,
Andrey Zakharov
