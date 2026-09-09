Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF73B7B83
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991158; cv=none; b=ALwVXODXOpn1B0OAnlNUt774hyWB+Eh7P1CCORSuonvrTznzuacal93USiNYHrwUEQoSO/cDXeTI2jdDUdEvSsbOtcVGH2/rVyapTCrWU3DfHES+YFnMAQNvM6VbDzFI9lNYA9MawsVSh+lcgIBFlXULyL3Bzj2iKKqZZ4c0lKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991158; c=relaxed/simple;
	bh=E5EP89C8aSuUnaX74+VXVio9HwFAaQwDLtCultG/TA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C35FMxJWmpOPAJuputsy3KHAYgtl/IdbBayyiO7O5bLWxeZS9NNFU7kQdfV/xFH4f7YOEq83xwLM9Ner/3dr5pA2ISMdJeANRm4wjjswbwagS6cMMSI0Kjm+eC6SCHtEijJgJ1eiRKhCcbr5B1zhzeZcs77HjO9GobjSRCmhZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VS7ntVe9; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VS7ntVe9"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5c82d057971so1041087e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991152; x=1789595952;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qHHcpy5QeLt7Tn0UZNn69+aN/4XUzCy9zf9R/ItNdpQ=;
        b=T34RjM/8GJ4CfpGdCcONcIl7lEI0tVZxMuuGH7fCMmACh24NJ9bV7qMclosbUjuKvD
         VBeDuQIc3poWhxRbfO2ci2kXXle7ds62JLFOuQe7je783qnyM1sndni1eFmb8DLxtV4z
         6w6L2h9/5QsXoNX6HWmkSSe8pjDhN5TfS11ND7FBuuQWa1WoTSQ4ei5ZjmfETsBLOBlH
         i0nMEXeDtZKaBXAbVZ2AHzRpNK5S8o4SI1+z/mMdt4b7ubM3pitElkz7l7RYlGsNpoJb
         nqD54dNPYew2lH03MUK7fESdmtcViIw7XaeLa52GK6jQj9q9V58hx7Aew4R9od8yikZa
         7r3w==
X-Forwarded-Encrypted: i=1; AKwUvBz9D5KqJ1jSA8aT9/WiLM5JdPF5aJb3OC3Dq2Ov0yR9VArxqmQ6zXfy8Z/h0QvjmLOPLH2EP7yyzw4XvCY=@vger.kernel.org
X-Gm-Message-State: AFuF++k5AHW2dt9EyhgNr2vVpdeTK2u+uHjCTZ9KbVj/vD8h2QyNPx0A
	ltcIGblzDDqj5h7lUK7k0cX3eJz4dOT7d8DdH0tFVeXsD/RBzdQPx94mbfgL+5QzGMNTk2vyxTy
	JHafWtfEmkaOitRw5NnTIq92C/DQW+oyQD72phNvUIFMMGrdcQqyp6sgMcNDpzE7ZSra8HCIYu/
	aZDxTW6fL1MZOhufSZCXLB6Vse2T9BuL7DXchHdDI71qe/db0vP06kw5mtWcyqQjnXCNdpobHxX
	HMM0azMxSJukBzi/0RHYNKH
X-Gm-Gg: AYBFou0a3EGKUsj9WDK9Yl/Lu54Ik1zuRUVfG6FXWPQsTbfZ6YJpGco9hDJmTei+4EO
	yKgzWp45waxJ/20uMBpXAT4p7ZE5edFtVCeqZPKQHtDngziNR4s4ATWGf8T1cb6pCSo2EHrAs5w
	UuAaX6rxR4izpUoKeaoFIKqNm/vk1ALuDyL97w77ZHdC6B41lykU50sX2hP0zDSz4Ym/TtaPsWu
	EoLJZT/wBTRcoHdEsf8DD6tVOvo+snr+a/K9VBd4igOHbGtwaOLpaHWpdh4oVE0K/Vhumzi3r8+
	Op2akn1dqIg6X6+dH1h0/cY0GUlnFp2IKeoTea39mUs/wmzt6W88H8BMrxqmZBq2zUDM7axG/SY
	FRgk5cqDS9i7ibC1zLOV1iqE+FAlflwWYaay8GAyt0zIKWEzr+AOk0ecqlnJX8rPZ+xdcwMVsuH
	nc16LZcWQUNN1Rh5NXBDIvUhLQAJyN54o51cdoDBUgLfE=
X-Received: by 2002:a05:6122:21a4:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c83a2fa886mr243192e0c.0.1788991152185;
        Wed, 09 Sep 2026 14:59:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ec20f1desm8195213e0c.3.2026.09.09.14.59.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2026 14:59:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53088a3939aso63462781cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788991151; x=1789595951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHHcpy5QeLt7Tn0UZNn69+aN/4XUzCy9zf9R/ItNdpQ=;
        b=VS7ntVe9t2WlsDo/8zeKKHeHNvCb1mubn4GEfOcs37RJc713BEuLDsd6VVqaz4UF/a
         Qn9zZFQKauAMxlU0vu0O8S54rx4FIrusRbOkJUTDzWThoKPxnrHO6vDFhpQ4IOk0cdoO
         eWB22xREOrrj2jlN8AnH4yz2+kMImRSo14alk=
X-Forwarded-Encrypted: i=1; AKwUvBxM8auumZAt7okniESoITPWKR7DBPuCwuj7cmmnU0Or5DX+BL7w8XnC58FJ1i2T8uVMRCE6otxPCJwEuYw=@vger.kernel.org
X-Received: by 2002:a05:622a:2592:b0:530:3554:6482 with SMTP id d75a77b69052e-530548511c0mr498367851cf.18.1788991151319;
        Wed, 09 Sep 2026 14:59:11 -0700 (PDT)
X-Received: by 2002:a05:622a:2592:b0:530:3554:6482 with SMTP id d75a77b69052e-530548511c0mr498367041cf.18.1788991150882;
        Wed, 09 Sep 2026 14:59:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054180b0asm150783051cf.19.2026.09.09.14.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 14:59:10 -0700 (PDT)
Message-ID: <a4167b18-f1ea-48bb-9287-210bdd4f35eb@broadcom.com>
Date: Wed, 9 Sep 2026 14:58:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/8/26 13:55, Lorenzo Stoakes (ARM) wrote:
> A typical kernel build consists of a frustratingly large amount of time
> spent stuck in single-threaded bottlenecks.
> 
> It turns out that there's a lot we can do about this and doing so
> significantly impacts kernel build times.
> 
> This series makes allmodconfig builds up to 36% faster, incremental builds
> up to ~70% faster, and noop builds up to ~90% faster.
> 
> Builds are faster across the board on every device I tested.
> 
> Machines used for perf testing:
> 
> * Threadripper -   x86, AMD Threadripper 9980X, 64 cores, 128 threads
> * EPYC         -   x86, 2 socket EPYC 9754, 256 cores, 512 threads
> * M2           - arm64, 2022 M2 macbook pro, 8 cores, 8 threads
>                          (4 perf, 4 efficiency)

My AMD EPYC 9454P server shows an improvement in the order of 13% using 
the arm64's defconfig and make -j97. Thanks for doing this!
-- 
Florian

