Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794339797;
	b=ROyCblJy4ABeA1JiofhKXFZPTg17QigPncI0QLE+qLFdPL9bl2R6hs1LXR9jkBe14cSc
	 rnVpXX2LoolbYKTzxK0w3TRnkKLXr1A+2Ss5tqwZvQ+OT/9U0laOvfRG8M6i8b6amASy/
	 EnecVwhs6Gv32zvQ4WdGiNFyR/M8+GqqCKt6z02RUO6oUivKiVFErF45Slrbe862oBZ/p
	 Ng4AQzGx/EMqoLA0heFcSL6jZ0rhjt+V32yiqxTzXjGa9R8zR81TaChtvpWvnxNdY1jkh
	 YRGRwbagA4kmgRPyuHIwmSJEhEaDlEHxTAEVqPJzci/tMLB8wrBG1BwcmV/HWyfag2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qM/93cSQyeNnAHHkdo1VwGjK9q5xf41HRRdCtb6TXfk=;
	b=JdJPDmhVandFmWyxCIalHZId1sEaf1GGbxvodanQYrqaifKjWoLUcmgAxtEpPUwASICb
	 /6SAJrSGYGgV0gZ6+miecOVbLMFf+V9So4ckaLdvIzInuurddbMhLy88jkHgAg5CPnN/S
	 MY5j3cbRK3oM2/C5Vu02tHuasrsyEDID+6ZsUhD4iMl+MengCzz0hNnbBF3IGPmvFJAw6
	 lB4jQ5DNsKbTxdGhbiBKZD5Z4Cx+hMYYtTMNBg/j9iA9mo8STAc3DrKIRoNq2BJhOw5nI
	 qj2ZRzgl5iD+BWNMp8l+durTd2OZYjmLCt69imn8909bK28dW6aP5x+/fOOALbLiPqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O0CtDJzO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC71606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC71606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O0CtDJzO
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so1552a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:43:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794339795; cv=none;
        d=google.com; s=arc-20260327;
        b=V7B1EneypTEa3J88JEY7HNFXraYUDLyORRjAalduFcqw7xYPAT4LiN10VQe2MKZTzM
         c7E9dgfQO7q+Mr+sGd5uy0RVAHldTCFHmRmFBm98FYELYzuerF/E/BeNJIxrstReeHhc
         Y4g9Je1hjjhdw04IBZht5WR71oYZoCPjZL5s6SSabXoK6Ciy1tmXdsAsmGiOlM4Prbn4
         6induMMLbBc9g9dUXsh3EjsHdkAGtgpwFeyzPVvjrRUB5zFIUKqQo1D3cN/kgbLPC5dQ
         b/yyjAQpTgjMWfWgoY44ylERhygTNX1gC07UTuY3pQ6i/YkU8/Kum1h5S2FQ4vk0gVQd
         JAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qM/93cSQyeNnAHHkdo1VwGjK9q5xf41HRRdCtb6TXfk=;
        fh=8IXptzRLhLI7N0OLs/cpyWpmyff8LNbfLp/Um5hm7Y0=;
        b=pHF4Y1hnFDC9V3+ql93V77TD8tLS2BNx7yzvDi0nbg4oeXDY69xvdsbI70DHRqdA/m
         1TNUv7wZJ2M2MEpGA8BvwJ+atpP5djleFgcVTwMXirReiOc63bZDxujcOOVp/p1AjJaK
         Fc3VUm1O+GKwqBWzFRYGAeNdfE2lryBaLEfW5WufxLfTgoYY6egCIshOnBEd6zKRt4tO
         j5RtPwc/UnlY9FB3ylumZFGySROiHtc6LUEabYpIqVHQ2IxKT3phGED8Z2S+r9GUAoal
         wZRV6xUdtCLrlSIAu5vEX1mhiud/XAKVvwq6TPJtm2H9i5goP/MInJLza81OMy9f5Wy+
         Kg5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794339795; x=1794944595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qM/93cSQyeNnAHHkdo1VwGjK9q5xf41HRRdCtb6TXfk=;
        b=O0CtDJzOjjNC0WVqvnHuYlMnqCk1kGw2+bvcyW9YCCUiCsFX5MRYpRMl6dNRBhF9VY
         yYJmfleMQM2iA+umTOCJjHbZFdELUNx+lNRfNsVtILZWshZqw79EbG74mqBM2T69B2uU
         aLjopHMKKA6Tbldrv2V6knr/8k3q9MN5VsuL2xPJKofzun4Y6WvTk6SUxbD2wLAMO50x
         xlCzDEqnilJe3DqIzc3qO6NxcwJf/DFOUiw+XbX/4w3BOPNLnfRu4/Gxw58h08Xccd6j
         fnjckvJnnbEhNDuBa+SaEFlgpZ14Te1HBs0nNg+N+j+x0+AM/+6Lc1L3L56WhAU2ip1R
         Vs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339795; x=1794944595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qM/93cSQyeNnAHHkdo1VwGjK9q5xf41HRRdCtb6TXfk=;
        b=S/5KUicRkrIxt7xQX0bZ2iIvmCGvq+h36qsFWKF5Z9j7fXqzGJey3Supd2ECOsIwzY
         9yVdbwwuzZcs/arpZchMFh+4Dv2/U08v6BbRe/2yeE7wwMGjos8vPPCvgZNqSpH/733X
         9wy8fu6r80xGJtrXp1Rf3XCaJmVKT6JwCF5yrMfQOzgHHxoX52rrMtfLTgpKmpWO2ZPy
         Bfqb6ijJK7A85K82gFvulELfZu4RKU2Vu6PncWMsjo5DnFrd8V3/odPkr0hy7YSB9/F5
         wfua8orbV6ww+ZNK3E84uQnG1TD+CuowKuMDBjpB1QqJ9OztR/I+8bJ7Z4hH0Ofe/CkJ
         RXgQ==
X-Forwarded-Encrypted: i=1; AL+hErFCQU9fYmlzeBLRLlQFN1OD6dbiWTKvRcmpgvPp2EQ//U3OieMp/ThxAyow55lg+GrpuBGSK7KYzV9sFNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j/SCnVg14Uj1ZEBxIMpvkrzDivVFTLGL7Ylrjivo1O2voKBI4
	rjGGrIfFYfYIOWK9ykZ9kE6G3bzYOV921ftvzxMdLrPQmP7NO7tuWF0ZJrOKw1o3FEnxzJYNFRQ
	YwpXHk8jje/LdDgilHOD6ONaVclR0JOyETbNNa9J6iE+WPAoKlVjH9+Dl
X-Gm-Gg: AYBFou09ihBiGfChbNEvZw83sPm17/nHpe7332CVuLjoOAKA1DX7lkqpplMzsKvHmM4
	OL/dgYoP3leRalxvOQqKKtw251CssrJ0svoSmOxhpvk6RKH7l+vKLp+JhfdCv7CLa6KMX+JVUHE
	NKdLAxKoSNDoj+0fV0g0dqiV/D9sxwxfQ/yXEFK6VZzpT4BMFA/NUt0m1xgMvgpbin0AGDGkzu8
	LW0EBxt9C9S/UZ14uXgszfv8nGAKHlA4c3nCZfIBWLAxaySLGCgDr0CXlLP0P+lbUpNiX2uuaMw
	NI794NMci5pJ070jc70laqIBZR8nZplsHSsJwwZ9PoIcUqtGHwbofGT5Ul7O/P0T2lQLTPcIh0W
	eqPZflwZUuob9/xgZPvJSwmMRVv7PS5vCiKgeEx7sqj7Vde0cW5IKaUJxDzCLSwFfEMQQJ2eg
X-Received: by 2002:a05:6402:c4d4:10b0:6b1:c6fc:aba0 with SMTP id
 4fb4d7f45d1cf-6b77780feddmr10348a12.7.1794339794646; Tue, 10 Nov 2026
 11:43:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110004037.125692-1-jmattson@google.com> <avNYjOevOv5s2o5k@google.com>
 <CALMp9eQAxDhnJGrxt8MquPKE2jsUzezn+nbRXV7E_OiATFhsow@mail.gmail.com> <CAO9r8zN6W=95uOEUhzSenbJeBECjWk-HRgX7PSewwJZgfmQLoQ@mail.gmail.com>
In-Reply-To: <CAO9r8zN6W=95uOEUhzSenbJeBECjWk-HRgX7PSewwJZgfmQLoQ@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 10 Nov 2026 11:43:02 -0800
X-Gm-Features: AclHuK8u2h4MgClVL0RWHK-Jelk0_JEcMjg6Ljnk1fspltvatt8zpQ7C_OMZRzg
Message-ID: <CALMp9eR2RL2JgQSAehE36YVzG=pvHKxmOH4TJz03u_BwGAqOOw@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Add missing CET VMRUN consistency checks
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	John Allen <john.allen@amd.com>, Chao Gao <chao.gao@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:30=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Tue, Nov 10, 2026 at 11:18=E2=80=AFAM Jim Mattson <jmattson@google.com=
> wrote:
> >
> > On Tue, Nov 10, 2026 at 9:56=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
[ ... ]
> > > One last question, in the restore path, the MSR may have not been
> > > restored yet, right? Can the consistency check mistakenly fail in thi=
s
> > > case?
> >
> > Not with a legal snapshot. Note that on the restore path, the 'save'
> > area holds L1 state. Hence, RFLAGS.VM must be clear, because VMRUN
> > raises #UD in V8086 mode.
>
> Oh that's subtle, but yes, makes sense. I was going to suggest a
> comment, but I can't find a good place for it :)

Saved by subtlety!
