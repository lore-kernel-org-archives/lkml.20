Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255376;
	b=odFQUOksScm60V0A6XhCQX+QpIOIBFnkogfbSN7pssNePkw0N8lJLKDgpIk18h5uX58c
	 fwCMzS5cJigMYgwQckG3MmlDf7hhtrmdK+2X6K4cb/feY7u9QKRzhelIGwv1EMUtvyK9V
	 Y2Rtb8P/QjAwNR9ShKXjYMjNHSx0ROMWr0LW9X4XcEI6yfU9sS8KrEQavV6JHrxfiOwdr
	 5p7L/5pue23IBnvn106S8DtAjwiXm/wLEJ5e7ebnDj5MWJxnPvy8oY5rkzajSs0uujMu7
	 /2pAgL9AafhsohPQJYeByYtYsnxIPQ5IxduGiZM2Tnwpn5fj5rJxQth2x8AlzYHttJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2C2a0rTZmMb1b8kfl4y39LCIMoVYqOlFcBQYRTbTISM=;
	b=LAKSriy5My6OYbjnqlvs0b9yoFKVjqaQzl52kFh8foFr4vpgC+ufDQjBCj7e5/GqtGqq
	 qZAS0m1rsj3fO601Itel+ZNBLAHp8QWXEvx7IimDlxCrfSLYPc03D/RufnEx38q7ENTZt
	 usgv2NZ2Fk0PvUxUd16qAqOMxEvqMChIzRtKbFSAwMtE6W4n63UtjQ33gndear6bAP777
	 cclpmyexKPu2TSgIrcBxDbmcmjIdRmHhISMBojP+81GFkueoZuhTc16x+WSoAXwHmBGZw
	 Qjvnd+THaXAOm4uiypUFTP7H1sij43Hr12zBPFn1uaf2ctl/jLpTrduHxr0Ececn7Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GytkJLah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E06A606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E06A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GytkJLah
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53639b8903bso16401861cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:16:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794255375; cv=none;
        d=google.com; s=arc-20260327;
        b=WLqPYHAFPP3FI0xoSbzrEsdF9ZhkIb3Q7Kxp1uobtPAIQKz1huSyyi0hTwQue+YEjr
         dFsbLK/GNPGlmzkyV8FmDMITsWvAmXR6q+sUtwLHGbOSqztu4dieIRU57030YuBEf0Lm
         kFmwe9J1jrHFbLnyWQIC+4izOR4LdRwXUMh/eQ2GZrODP+X9ZgA+0m4PiHshGLdpjigO
         7YpldeFM/fAvNahymaDmZWWHejgoG+NGM5fQn9XDW85uEIhEvvYoXQ7YNakq8mwl5jgm
         UWVDYCHwCNC2lLFmFNEDLB+Pio/7tG9ab8mmihvgE9tvfM8wEARLSvJRmhG4gzPC/fJL
         FXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=2C2a0rTZmMb1b8kfl4y39LCIMoVYqOlFcBQYRTbTISM=;
        fh=jOMzWlLnHj8j/f63R+BdGUhSpP/KmNXLOSBFbZ4NQy8=;
        b=mbLbJGqw5tf+tDm22sgpO02mve1Se3+u8hf/cD5c1CQLfYIo4IXBnuB+p42/ygsr4s
         NOUQo1SWso2KoBmWc1C5V67P+IFsxT58Ln0jzZ/PpXAvFTkRwq3VoXuvHzxIHW+tfmYC
         q9ec95n/HIFBU3wUYiT0GJRuO92fwAWS+VjRdonOZntIpoCor9WuaDN1O+dVUESY47aa
         Rdgq5HS08goQCGbgViFH0ZfoXHBVtPfi+DKN85OEz9bGGN5xcOgedSDpn3AjG9RK4pHn
         nkOb+clRAuHmFep/Fv7z7M1Jztkia82+pmSBZo32i+pmTOmJNe8pUhoRH81u2xDhhzYN
         diqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794255375; x=1794860175; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2C2a0rTZmMb1b8kfl4y39LCIMoVYqOlFcBQYRTbTISM=;
        b=GytkJLahaC5gSknC2BeSaYjuS5OWPS9Q9faIFwuTOzFH91EGiGs85BgjFUJTt7Eo1k
         D8CmJqn431qFGnTi0GyFc3ATFK2ttZuCbLbe/3KL11Umhp1wO/COoFsseNvtoyIsQqyn
         Zae02ZVx3+j6flUP2At7E7YiGNc19tk8PZtWLEDAPiZ5VdBg/e8jfArsWaeTXlG705xs
         0GdW24ngyMXP9qi/6z+xXenxH563KQe7yhP+3/gRRkr88AHiRxrgnmm29tPrbs2sdLqT
         +yCEBMMmg8OjGyf3ljZFT0B5Z2rQEUOXoGzYU9eMpH6fMqpZZIjaoFj+ruOaUAsI/N7q
         PVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794255375; x=1794860175;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2C2a0rTZmMb1b8kfl4y39LCIMoVYqOlFcBQYRTbTISM=;
        b=iQY5OVMTERC7xIjv7srqrIv72WrFZec79tbbQHg91XGzn5SeH9OUdOSo5uJaVqCW1g
         JSC6B9jhlp6uoNmnhtjl/emHYlmULSUBII+yHFW5h21OmBo/+zKYoLd0eqNLNTugsT31
         as+vTQmgqH+tijVr/JYWf+K/4hACdFQllAKWLuajV67vwd69wTgUmLtIhjySVPEw2cvr
         uFp9k2VhW+A1cFb8gEspKiuFl650rVfOCZeQwAos1O+d9mYEyrY4CycDmd8Z9J8XPDfd
         YsZqs9ovelAXj+nEVIdb+geLubHf7VLTfOr0r8lI5NhZs+xaLyWm68OtmPlUxDL1JCIP
         qIgQ==
X-Forwarded-Encrypted: i=1; AL+hErEhOFsWL7Q55XhaloYt79Iz9BIQoCLQtjCK9Nejah62ItfBcov7WWop8DSUdwly+RDnbE2ZMsyeZuSpf5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pvta94+ANSTt3zwBjcEJIU/M9keWI/0XCRVrBySvTm/ccVmcG
	QNX23Q9l9iPtXGxWUxqAyElMDz8uMrdMakStCeohcH8KVJEZYxW4Mt/y5AZD30qvFWRWdNqadC/
	gkplAA1X7eKP0kiBQe/ypA+mUFrltwXAoNPq/U+1F
X-Gm-Gg: AYBFou26g5CWV9nqzeoi1w4IlTN4jXeenJk9BX7D90xweNdiW+ozNPLgvGz1QeqIzyb
	o3aLNeqnth4+ynESbYP9Nd8rOm8qQuVXr91Xk1Ma+c83OvHAsTv50tnOVm7ppyt3nUnVfhwMnIS
	0uMr4Zoc9ZNFOabEya6Ut6KHva6EUMmYksdMbDUn8yeNDaZ0f5WNZCNGAwfaoQ6w7GZVCBEzpqv
	lTfQLuzrnvClBRLzsdtagwjaFlB/sDnDwWJLEGVb8ACDYFE5gfv43peVW/vecSRr51XUZL7x77Z
	vPRjmJ79gj3uc7xl+zqNRUL1uKBoi5b09xajwgl8/lIX84hELfiNt8LSbs0sQRXtSWN7RJQYWXa
	X2o4iqcFDfsXYr/1jQFAcIHQwDCPfiw+s/s4xdLBMVhRyXl/vv0RQRRa24XhmPAMWqziDIZKh4x
	BJK7+6byYDiOZs1g9rCV1hlbxm
X-Received: by 2002:a05:622a:54a:b0:533:9381:760d with SMTP id
 d75a77b69052e-555171314d3mr10861961cf.2.1794255374567; Mon, 09 Nov 2026
 12:16:14 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 12:16:13 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261106164732.3939387-1-seanjc@google.com>
References: <20261105-tdx-selftests-v16-18-2024e8fa517a@google.com> <20261106164732.3939387-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 12:16:13 -0800
X-Gm-Features: AclHuK-l_4iDwO9BiIG7gu2Le8y5Qhu8OB2s6COZZNFQz6VTbcgN6FM9G3ViSYk
Message-ID: <CAEvNRgGHUL4-KSMCsOHznKK3fpvwh=D-H7OwSaqk2A2T0nL6ww@mail.gmail.com>
Subject: Re: [PATCH v16.1] KVM: selftests: Add support for TDX ucalls, via TDVMCALL_REPORT_FATAL_ERROR
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sagi Shahar <sagis@google.com>, Lisa Wang <wyihan@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
> diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> index d41a1efc8a63..9982aaaba885 100644
> --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> @@ -4,6 +4,13 @@
>
>  #include <linux/types.h>
>
> +/* TDX hypercall Leaf IDs */
> +#define TDVMCALL_GET_TD_VM_CALL_INFO		0x10000
> +#define TDVMCALL_MAP_GPA			0x10001
> +#define TDVMCALL_GET_QUOTE			0x10002
> +#define TDVMCALL_REPORT_FATAL_ERROR		0x10003
> +#define TDVMCALL_SETUP_EVENT_NOTIFY_INTERRUPT	0x10004
> +

No objection, just surprised you'd add all the others that aren't used
in this patch.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>  u64 __tdvmcall(u64 fn, u64 r12, u64 r13, u64 r14, u64 r15);
>
>  #endif /* SELFTEST_KVM_TDX_TDX_H */
>
> [...snip...]
>
