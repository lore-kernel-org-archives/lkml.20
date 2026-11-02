Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652609;
	b=z9LMTp8It9rw9NUZEQ0DqhxlTf2GcDhl0tFthlfjfWwmZeR5MPxcO1lHgGFbfysXB4Y4
	 aXwoEQht58DfYyhvvrHoRcWqHrLjBOY6XDc7CD0x5jmw+iZL6xS5jNj30EovHJtCT+obs
	 NVHKJLOEheZt+85NB8y31Jew1ay74SHKBHlHsBj5qsSnNLH6nUshH2wGrMr/4MLOiW9n4
	 4bzMoDuJG8eahChO8swwYCREnzTxQLZrpZadhHFXg/7D6ytriBqTE/+nSIVnuqjB1rDcA
	 JI9E7zFIXQc9IGMpdN4/NBqLbjw08pS9Uomnx3ni6gLsU4+zmaDkHX8JYHcF+vaEyKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652609;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YZHqs0S+0eF//NcnMf6waWSJNb6hMzfVqF5rDbvKzzE=;
	b=nvhvViNLzHjnWBPU9/0auwxB7+3RAjbyaPFkXefc8ijjThCC/jEATW8QvKVHFoVdZrY0
	 qxzbbcL5Lu2K2Smnw1oX0k5bIpfL4ITA5GjYd042Q+GhmnnTEO2Ur2MITRnKBXNGt62C8
	 +GKYh+oCpqLMth67AdLZoLMRx/uDR9fL7z7H6+1l2XWSfQ7q6sQvKw1RVnxoK+Nvl4/6X
	 zA59RYWgZ0aY4cwaNfa8NA5bLUqQPr8yE2CMUFreTXNfWz/5G3kbczYMnlpJ1vb/tzHab
	 6+aGulNmyk3SkR2RDQMSslkMgQ7Tq5LfQWoecVIa+CQYLqoVQ/OwaDNZFJDEup4rnMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.win;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8F6606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8F6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c45551fa84eso506363566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652608; x=1794257408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZHqs0S+0eF//NcnMf6waWSJNb6hMzfVqF5rDbvKzzE=;
        b=uNutzDPwTmzcYiiKICyeV/oJpOUvol+dd+VkpnM18mCXZ9LjjU8fcrjZVycTZ4GbGx
         DD2bQNIhEH4hLbOH2XpNLBYcIGMWkmg6xrzLvcrHeKokOfcSXLtpNZSYcM31yPOCvAxb
         XEldqMQF+TIY+Wz9YfkStINMx1NTLdvU5PnbIrcfocTGrNwwchBDyNYG4md2Q+WRWP0e
         wxnHmALHyTfiInGPZD2CG3W/tmhcFvBXZwww82+lIdmXRjB1Nj6oWbCnzoWFgfLH++AA
         Le5VIxn8FdJjrYKohbBVa9ut5d3wHQNGtV2K0L9f4U5XpAESmR4n78+YqLVDjc3HY6Fz
         SrHA==
X-Forwarded-Encrypted: i=1; AKwUvByxtv14jwf1iXIdkEngZnl4IsVIOwY482lu/KTh1NZcaVgC7yPBaTLsP6OF5Xtv4aFjZhYnySe1GkaZHW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z92v+LGUwZ1y0j6sLzn8HVhhAH1MOSbLyETCVI8YWr2rnJTeXZv
	87r0vKABthbQ730SHW/4iMQdivkfD78gUml/a2NGBLu7QZkBXUXL4X7bzaBeLDHmCoo=
X-Gm-Gg: AYBFou3Yeau7PBqSceZqEb6w0wvDYzSiZWTlkNKvBCpu4saZaZ5nJq6nnN8d5taRhIH
	tS72slIfmfCIjPhrMBp1OgY7evKMJgUFDLF5ZkqWK4p+jQGnJK+UU5Dw/xIlayPQRwosRc88LvC
	AALDdvxN89Ntm8CzchxxVFZZpEWRS3cIqGzuF8opEbkMBUVeSrK7sQmMAnFsvv/xIG0kYKUZaPg
	VihLturmOWEULKYTSqKglucff7DaQ78RlUPpro+8TGAzaGN+GZlZSexi88Eohugi3an+RqrXzD1
	Uq9jhoNuiqTff60gQ5z/Zu2s2/tMS6JK6q36lw2kFEO2I5QtUopPt0dJUwW1v/LEVIHVBZCx02r
	noVuJWE8JWTqajRwQr35MN4e1STy5J7ft8dg4Ak6GGZIjpHkJsU2WfCetnRpoUA4KqxZ+yYTBAc
	dnGmkHg2Qf4n6myMND15vZB3gxaKKgtAA2/wCznEfMcgwpRMnmmpncx7RH7P+reWbob0UL98fOn
	SHA++HHAs05PWn6+jtHwQbMDxp0kNHe0VYwtdxQZe8cek8KHsWktqjIOC4KqVMclLBK7xQhKJZ0
	Q0svS8CgkqrdAcpANJSvysKWATgFJgyOSNouD2Pmf37w3wSXur/L3xUh9OofEJ/gQsASzFkrovR
	jh9bS
X-Received: by 2002:a17:906:eec9:b0:c26:1648:a076 with SMTP id a640c23a62f3a-c4ca7abf2aemr911098466b.49.1793652607607;
        Mon, 02 Nov 2026 12:50:07 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cec189913sm22338266b.84.2026.11.02.12.50.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:50:07 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4682977f9aso424954166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:50:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzk3uJXnf+sXVzgyLNVyQVJTTmewUiEOX1Z7M/qoYPb0fXnq/48e2jVoVUZXSFPUd5aar5AHnZtHwwMIks=@vger.kernel.org
X-Received: by 2002:a17:907:930d:b0:c46:9ee5:eeee with SMTP id
 a640c23a62f3a-c4ca79357a1mr947048866b.6.1793652606765; Mon, 02 Nov 2026
 12:50:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102074934.2925339-1-gubowen5@huawei.com>
In-Reply-To: <20261102074934.2925339-1-gubowen5@huawei.com>
From: Ignat Korchagin <ignat@linux.win>
Date: Mon, 2 Nov 2026 20:49:55 +0000
X-Gmail-Original-Message-ID: <CAOs+rJWjCTUwuYQMcBcbiUk8K_NQQtYGVFEBDEMZAKHWCLv98A@mail.gmail.com>
X-Gm-Features: AclHuK9uKtGwMBZoHntdWHPm90lnYY-0KuyQanxDFP3TVplvFnPCOByhCba7eNE
Message-ID: <CAOs+rJWjCTUwuYQMcBcbiUk8K_NQQtYGVFEBDEMZAKHWCLv98A@mail.gmail.com>
Subject: Re: [PATCH -next] crypto: asymmetric_keys: verify_pefile: fix integer
 underflow in pefile_strip_sig_wrapper
To: Gu Bowen <gubowen5@huawei.com>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:32=E2=80=AFAM Gu Bowen <gubowen5@huawei.com> wrote=
:

nit: the subject line looks malformed: weird "-next" suffix pointing
nowhere. Otherwise:

> The pefile_strip_sig_wrapper() function validates the win_certificate
> wrapper that precedes the PKCS#7 signature in a PE binary.  It checks
> that the wrapper length does not exceed the certificate table size
> (``wrapper.length > ctx->sig_len``) but fails to verify that the
> wrapper length is at least ``sizeof(struct win_certificate)`` (8 bytes).
>
> When a crafted PE image supplies a wrapper with ``length`` in the range
> [1, 7], the subsequent arithmetic::
>
>     ctx->sig_len =3D wrapper.length;      /* e.g. 1 */
>     ctx->sig_offset +=3D sizeof(wrapper);
>     ctx->sig_len -=3D sizeof(wrapper);    /* 1 - 8 =3D 0xFFFFFFF9 (unsign=
ed) */
>
> underflows the unsigned ``ctx->sig_len`` to a value near UINT_MAX.  The
> following ``sig_len < 4`` sanity check is bypassed because 0xFFFFFFF9 is
> greater than 4.
>
> The underflowed ``sig_len`` is then passed to verify_pkcs7_signature()
> and onwards to asn1_ber_decoder().  The ASN.1 decoder's own
> ``datalen > 65535`` entry guard can be satisfied by constructing a
> PKCS#7 length field of exactly 65535 (e.g. ``30 82 ff fb``), allowing
> the decoder to proceed and attempt to read OID octets beyond the
> allocated vmalloc buffer, triggering a page fault in look_up_OID()::
>
>   BUG: unable to handle page fault for address: ffffd1e986cb2000
>   #PF: supervisor read access in kernel mode
>   RIP: 0010:look_up_OID+0x14/0x100
>   Call Trace:
>    pkcs7_note_OID+0x33/0xa0
>    asn1_ber_decoder+0x363/0xbd0
>    pkcs7_parse_message+0xd9/0x1b0
>    verify_pkcs7_signature+0x24/0x80
>    verify_pefile_signature+0x7b/0xf0
>    kexec_kernel_verify_pe_sig+0x1b/0x40
>    kimage_file_alloc_init+0x1d8/0x3f0
>    __se_sys_kexec_file_load+0xc6/0x270
>
> This is reachable through the kexec_file_load syscall on architectures
> that verify PE signatures (x86 bzImage with
> CONFIG_KEXEC_BZIMAGE_VERIFY_SIG, arm64 Image with
> CONFIG_KEXEC_IMAGE_VERIFY_SIG), requiring CAP_SYS_BOOT.
>
> The oops occurs while the caller holds kexec_lock; if the faulting task
> is killed, the lock is never released, leaving all subsequent kexec and
> kdump operations permanently returning -EBUSY until reboot.
>
> Add a lower-bound check on wrapper.length before the subtraction to
> prevent the underflow.
>
> Fixes: 09dacbbda935 ("pefile: Strip the wrapper off of the cert data bloc=
k")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gu Bowen <gubowen5@huawei.com>

Reviewed-by: Ignat Korchagin <ignat@linux.win>

> ---
>  crypto/asymmetric_keys/verify_pefile.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_k=
eys/verify_pefile.c
> index cec99db14129..cfa85ccb1cf7 100644
> --- a/crypto/asymmetric_keys/verify_pefile.c
> +++ b/crypto/asymmetric_keys/verify_pefile.c
> @@ -146,6 +146,11 @@ static int pefile_strip_sig_wrapper(const void *pebu=
f,
>                         ctx->sig_len, wrapper.length);
>                 return -ELIBBAD;
>         }
> +       if (wrapper.length < sizeof(wrapper)) {
> +               pr_warn("Signature wrapper too small (%x < %zx)\n",
> +                       wrapper.length, sizeof(wrapper));
> +               return -ELIBBAD;
> +       }
>         if (wrapper.revision !=3D WIN_CERT_REVISION_2_0) {
>                 pr_warn("Signature is not revision 2.0\n");
>                 return -ENOTSUPP;
> --
> 2.43.0
>
>
