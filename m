Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792937980;
	b=Zyc95/PKa0hoBHdFz4T4X89ajX5lbW0rKleVX5A5Fou26ajvrzQ+N4UbLuLlfGxLXGju
	 V2Fg+o1nUhgyLm7CZGjx1ZwgIpus8+KiYbgzI7mZWqXUvUViUOS+opj36JXK53dbeSrox
	 OX/Nv51iGZHUHYRf4VlOnD1zQO0lrs5JkuDriqTP0vwxpJJ77Y66HBdvAmZ26Qtp+sBrQ
	 NuSh/zC4HEUooB2Ppp1fdeHrAdQYqEvrWSKLsOWNCX9lYwBnbWg+GlVSbwbT0j8WsaGdU
	 K9k0BOlD1nyLq0PcCRZkkTygY2WdvyHjCE5uiV5nqvAijMDa+yvoH7xSbJfBC24/O2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=afEw9oZKmLEt3nCw5DyljPgEXMVJGWyX00qdwnVO3iE=;
	b=uhcLOWQyDNhgaRYZUGp9fgvwa7RlqQr/GH7JsylN8QOZRSsxAehzFZLxGL+P1/KuAzJy
	 LRoQyV6IuOgVN1R+JjSZvPIiiGkkprACHRPSxBd+/KS2hFQMtxQgeszPm/D/I+t5+zjzh
	 bSL1QsJ04RD2DUTgG0nSANlYNR8+r+U5+Imw5S5BGWplemya3PNRaxjh+0Iip6WuaspC9
	 DMN9WiKIXMU9F6Y9NTEdjxJnOy95G3xbXzgPNRmojBZTnCv+T/r4OzFSEhFe1cAeFX8UZ
	 gOrONgmXM+c8ogD7YpLaYnsz2tkZA+ZwzmpHyeDXJ/lBcovs/WwPVUFG3foJMmgHduQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rpwWsubX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE3606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50FE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rpwWsubX
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5365f9bef55so30494271cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937979; cv=none;
        d=google.com; s=arc-20260327;
        b=MCwXa3b4Po2j9MKaji7d9xlmEx2uaH475I7yCkNf29UCAdAIgMU2ZNHyyEW3Flif7k
         iMnGJQftW2U6KUI3SPDhbSJO131fEdFkhgApjt6Q6kXHe0pGcceNFzgu8NhRhFpeuC0X
         PdKPzKyy7WkYyBivYqVYTG3f912xiZnFypqqEvBAjrd3jClZOg2IQZKJG+W/b6pEVHbF
         kdhoqnw3rIXMZwVBB569B9NZJMLHZ+XcHv1omM3qtsQploJ9zt6QLwiFRY4FEa3LOoJP
         Runa2kKqH6oNGwS/vTyXxMyvgbr8xYXIE8Xs0FJ1rmb1viHPU0Z868UzuiO4i8Kx2gp7
         RK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=afEw9oZKmLEt3nCw5DyljPgEXMVJGWyX00qdwnVO3iE=;
        fh=LsM/H4y9dzXLnsQ4y6/G5vlIUsoxNXL3fA7LBL/l4eM=;
        b=SWqcc7wmA4sApGU882KbPCK9YmKJv8SAHQu06geKdVpIImJ7iapZ4e03p0HB5PdP2K
         iFu2wotFyZoGjkGwI9eLDOK6sKJwHrc7LUVhn/zxTivpmLzWcxDHpv73bDiSsrclDREo
         nt2pAbq2q70/8XJ8Azu6/wLs+jDXgA71wbvrwp65tJBIzgDlcAOn6gcg6qFJwIw98gQ2
         EShZdkRVtBIFgstKtt4Ywnfgs4WtVJtS52rfei5IxpDwO4NCzEiki1mIm3voH5K9yDi8
         8z5KBmjhigmVHYY5FOi/EKGtJt7FOgjuqwp7FxxV4mBOBxJPEEQhTkVj+3y36KVHXbUW
         AI3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937979; x=1793542779; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afEw9oZKmLEt3nCw5DyljPgEXMVJGWyX00qdwnVO3iE=;
        b=rpwWsubXievo0YLcf+Vs4oyL3gUbEkkg6C/OnQYw2QmkGoL1qKvYRJywg5ShhEZKOy
         MisnyD6P198DHVaIT3z17H+r3SCXdXNuADpOlnmAUbMHDbljFh7euejz4u+2PeIJGXm2
         j12GCrd6aQ5Gpp1MoNwrET16wv3oSBf2kipGQ69776/FBPtADAwSfOQDL680cq0s43BK
         /9uMfVW0W10KZBZjigT/5ww3s+CfO4TlIAn+ErZAbnshbSf8Qc+dABZhxFWn11iXxoSZ
         AJbi8CHNQkmbDv6KDkZkYhEMKwn9xLgzYHihgLdHZ7Ez9OJZ4z12mPgj9iIJDDLr/bjK
         d4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937979; x=1793542779;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=afEw9oZKmLEt3nCw5DyljPgEXMVJGWyX00qdwnVO3iE=;
        b=m6ZavLK34XOxizudkGl3qYvlnFBcIzT1Y4hYJRNdaCvWdmwrG3F8cUvYfE7uqf/ksV
         IH4nnhBSS+vDjlFZd/4LDa/YnsZk582O4wMrvGtusyevAhFX+CI09WvD8n2i5XGxIjPl
         VPghM+g5QkLIgHxmONoJcwWGQ4MPZJeIXD+iImaDasH36w78zDX5BoRJLZ+IAxqlgiew
         Vr3btHM9WWkoGS9oEe9tgphjpdiLwbdwXcTIqTy7hd4H61GgHS5x65F6jaFenRIMEcma
         QqqD3+eV7lcJrjTBv8X/ZO/mEgveywYjTGeojHH3dmiUz+JrQcY2jNAwgYvg59IT0v/0
         kSiw==
X-Forwarded-Encrypted: i=1; AKwUvBxTIrr03jXs74d1qrLlw2ZQCZlofmCBIe7O95WTJhHxmPXhzvsJKDjINwj8LIvceWbMqDSH0ATUTiwjcEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGVBXl+Y1PGvMi5tkOGCAWCGConYaV/7m9nTaOxhECb1S9Q42m
	JdyZH9NTYD8N4iX/h4lm93JQPB+bpWOaLPfBKxw3BuUvw1Ur081iA8DaR9jsGGZi5njo4xnYv3d
	ASxozMmaUsRU0gnkEAKvAbYs60VBfzOg=
X-Gm-Gg: AYBFou0qRVezbAtr4u0itjywcPpWiwUD4QPy/ba5PjxkShjl43KcRR/S0lNTXt+JSdK
	iOnAJWQF9kRhM7ErzGA4Befwlr/gbw9a10D9fy26zDgjSbPhB8h/H386zvF4DUGm7DHSXRVvxnW
	UYgJiYwx/xW2CdXpOPF7N4oHtmY4PdcL3VwSBrAKJWGnWGDnUVwcUYH/39R6RfYiJZOcDxDD2wl
	3z1JWs1FFB6vHHyRrMNzCXy7zZ1ygi80SsbMe2CUw9iPN0wmmlFtGwSqO8KElthr67myBdZmVVR
	vbjCIeZvNyk/Ec76VYESIB/6/PcrIR6OY7U6yOomGsrBB1qo+8HnXD6NVj86S5n/j14oyEt7GEF
	BnN9I8hk8sz1muz27jh310TvXvLTMUy0SRD9ZCe7Ju+eCtxIWDQ07Xi6WRFYQ8q2x6j+qlNosMQ
	/OLyJi9XwXiaL9KUrPFJ6ZIcStSE/MFopOKWtEbYYA7xlI7vi4E3xwCrxfD129iFaxzLojRZpX
X-Received: by 2002:a05:622a:44a:b0:537:548b:77ed with SMTP id
 d75a77b69052e-5383b66676amr59161561cf.30.1792937979282; Sun, 25 Oct 2026
 07:19:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com> <20261012-fix-aer-mask-override-v1-2-49a0d7aeaea0@google.com>
In-Reply-To: <20261012-fix-aer-mask-override-v1-2-49a0d7aeaea0@google.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 11:19:28 -0300
X-Gm-Features: AclHuK8BBiPLOfqYYGvUYpW8KblsSf6Aue6WOkhnIkNSO4BT_qaP3xQuaMz486g
Message-ID: <CAMAsx6dLGdqr+ZxG8FrwN-6r=5yVY8hk-c+7CVrAkS0zpKPmGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: PCI: Document aer_inject's
 aer_mask_override parameter
To: rathodpriyank@google.com
Cc: bhelgaas@google.com, lukas@wunner.de, 
	sathyanarayanan.kuppuswamy@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	dave.jiang@intel.com, prarit@redhat.com, ying.huang@linux.alibaba.com, 
	terry.bowman@amd.com, corbet@lwn.net, jic23@kernel.org, 
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 12, 2026, Priyank Rathod wrote:
> To exercise the handling of such errors anyway, e.g., of those that are
> masked by default like Header Log Overflow or Poisoned TLP Egress
> Blocked, load the module with::

Hi Priyank,

I read the text against patch 1/2 and the current tree, and it matches
the implementation:

- the -EINVAL refusal for masked errors is the existing check in
aer_inject() for both the Correctable and the Uncorrectable case;
- 1/2 drops the writes to the hardware Mask registers, and
aer_inj_read_config() clears the pending injected bits from the Mask
values it returns;
- the hidden bits are kept set in dword writes through
uncor_mask_hidden/cor_mask_hidden until the module is unloaded;
- PCIEAER_INJECT is a tristate, so the boot parameter form applies when
it is built in.

The new section is also a proper subsection of "Software error
injection", and the documentation builds with it without new warnings.

There is one thing I could not reconcile, in case it is useful. The
text gives Poisoned TLP Egress Blocked as an example of an error that
is masked by default. In the sample session of the cover letter,
PCI_ERR_UNCOR_MASK of the e1000e reads 02400000 before the test, which
is PCI_ERR_UNC_INTN (0x00400000) plus PCI_ERR_UNC_TLPPRE (0x02000000),
while PCI_ERR_UNC_POISON_BLK (0x04000000) is clear. The vendor register
descriptions I found also list that bit with a reset value of 0. The
Correctable side does match: 0000c000 has Corrected Internal and Header
Log Overflow set. Internal errors match too, since
pci_aer_unmask_internal_errors() is only used for CXL.

Perhaps the example could name only errors whose default is confirmed,
for instance Header Log Overflow and the Internal Errors, or cite the
spec section if it does say that Poisoned TLP Egress Blocked is masked
by default. I may well be missing something in the spec.

Thanks,
Daniel
