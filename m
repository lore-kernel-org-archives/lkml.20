Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037446;
	b=n1mBZq2YE4ftWfpbAfVhPADQ3A2F2p7dvENkJBVLvVyJ8NOW0QKO+OVwsg4BAAe9O/P3
	 KAZSojz14MGh05V+hOxuvsCLsYctxuQQjloAVsB9jl/8M6CFCr7fRai94jDD2O5syFyLW
	 RHq7yxacHhG9NWcLcG8ZgP+zB54d+k/pHQ9uQVqZL54kn7UANWiR8kfDMAdrqB+bY4PiP
	 QltBHlX8jgcC2QisMOx5mKATJPCbd/kXy/ClyZILDDQEI33CdDsCX7qd6EFgpApPxU5lc
	 Qt1zsLBiXT5CQfqxLcZDD5GVQVLr9THBk+yVOLMyeUekUcn5vcIeReLq0xCcFme1fnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FiuSLn7/IP2TjKEmv1diUaRQXZE9EbLamaDyI3mYf7M=;
	b=zJ5BApaLMlRgPTQ8q3FZhQi4u8CjU9xOg9EVSsC3+AFVAUaUgg4Oqx4GrgxASdfqAUIu
	 BF/uke81k/SKn2ocD1+nD+WT/RPt4E8l+7IYTvkANSX+XzR6XKH9UGclJXrnT4mZFqIE9
	 3DEZOaJWMG3I5BQlI0vnaPnZII9IwyYVoymiQU3B6aHGESxH6/qJB0lotnfvu2T9yzt7T
	 3hxM+5Xqghv93gltAI8aT7TzeiV7SEG4nDWLzgZ10DJKpa5jXceqYuXgpRyr8AODeHZ+e
	 wFO1QLT+o17OIfpeAd71T+uTqdADQsSBH44n607NB+r71uZSA93ZWbOHcGhGbwBdnZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XISFKRUA;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6AD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XISFKRUA
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so5290583a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793037445; x=1793642245; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiuSLn7/IP2TjKEmv1diUaRQXZE9EbLamaDyI3mYf7M=;
        b=XISFKRUAf1c+RoClOafojfY2G/derUG0ACrGzvBriTeE719kBcJOJqZrhOAqJ38PbL
         7fsyrNOQUP0akFAcs1K/wL4n+EIojO57I+U27uGBfnYUp51ODNPI8Vms62CtsNyUZ+PK
         gOQ09aWw8vqTrIBPvbKbdeDJ+PHrDqKBo0eMJXDtX48HDTwK5VxYVYpWqnfaLkFvg0v0
         DIUAMlhAPBUSpk764z6y/OZ2z07VJmRQojstEOPJwrQc+U8VRDHxlhrnXKIVV85ue9JW
         K8QPXEh4ZpqinlYkpuUv7vI3lFZj04RVmxPImjpts5Ck12YBBNFIXwf1xQFOLPlcqyda
         23TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793037445; x=1793642245;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiuSLn7/IP2TjKEmv1diUaRQXZE9EbLamaDyI3mYf7M=;
        b=fxQiOpEFtcRjPTo39FSs0Qm6fBKjHih+agwTQJ4z/Wa5odnZHcLdG4rW6GcEgWMkZG
         YCTfzyHVFQePFRpH/5UWBtqUU00VAGwyS6y3KK4FKSMJbsyyclRHWX7hpsCE+h7Vf1VW
         /58iBUmPcZS6eR6NOMEy5MHgp1af2qbtYk7k9NpJD+uCCJS4NLpHmhOnsXen9fhnQ/ww
         btJHNbGqscrNmLvLpxo2sfeRwNrATRkAlY3UnLdNnvqtVCRnexUD48B1u5SvcOrrdk3q
         EVy+bLAceWcydOejwatK5Vt4zlRrC009XynbMxRvpvHieCUGN5G5lIw/Fx13c5NyhFao
         e9JA==
X-Forwarded-Encrypted: i=1; AKwUvByMHrLT1mb10T/laVuvz//juSt7whCQLxchhUAdvLcriTX8hlXAeLyqHD8cNmKV0cgZeHMWXNPFAaT5N4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgfjQifo7qV/f+Ft2j1bd0WA0RhottyiqQdxGmnn4wTIag7i3q
	SjU/G4NnWiPhKAq4M43ui+FfTiKEGh0CT/M1IFb5FMUQvEcIcrsIyNcOjVDJ5yl7xCSV834+dvX
	5grDQQjFdb7wS6tpepKI1uaLO5c9itJHBSw==
X-Received: from pjyd12.prod.google.com ([2002:a17:90a:dfcc:b0:3ab:2cb3:28b2])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d605:b0:3ab:2236:6b3d with SMTP id 98e67ed59e1d1-3adead57d9cmr6211022a91.27.1793037445023;
 Mon, 26 Oct 2026 10:57:25 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:57:24 +0000
In-Reply-To: <CAMAsx6dLGdqr+ZxG8FrwN-6r=5yVY8hk-c+7CVrAkS0zpKPmGg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
 <20261012-fix-aer-mask-override-v1-2-49a0d7aeaea0@google.com> <CAMAsx6dLGdqr+ZxG8FrwN-6r=5yVY8hk-c+7CVrAkS0zpKPmGg@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261026175724.1482083-1-rathodpriyank@google.com>
Subject: Re: [PATCH 2/2] Documentation: PCI: Document aer_inject's
 aer_mask_override parameter
From: Priyank Rathod <rathodpriyank@google.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: bhelgaas@google.com, lukas@wunner.de, 
	sathyanarayanan.kuppuswamy@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	dave.jiang@intel.com, prarit@redhat.com, ying.huang@linux.alibaba.com, 
	terry.bowman@amd.com, corbet@lwn.net, jic23@kernel.org, 
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Thank you for reviewing the series and verifying the documentation build
against the implementation!

On Sun, Oct 25, 2026 at 11:19:28AM -0300, Daniel Pereira wrote:
> There is one thing I could not reconcile, in case it is useful. The
> text gives Poisoned TLP Egress Blocked as an example of an error that
> is masked by default. In the sample session of the cover letter,
> PCI_ERR_UNCOR_MASK of the e1000e reads 02400000 before the test, which
> is PCI_ERR_UNC_INTN (0x00400000) plus PCI_ERR_UNC_TLPPRE (0x02000000),
> while PCI_ERR_UNC_POISON_BLK (0x04000000) is clear. The vendor register
> descriptions I found also list that bit with a reset value of 0. The
> Correctable side does match: 0000c000 has Corrected Internal and Header
> Log Overflow set. Internal errors match too, since
> pci_aer_unmask_internal_errors() is only used for CXL.
>
> Perhaps the example could name only errors whose default is confirmed,
> for instance Header Log Overflow and the Internal Errors, or cite the
> spec section if it does say that Poisoned TLP Egress Blocked is masked
> by default. I may well be missing something in the spec.

Per PCIe r7.0, sec 7.8.4.3, Table 7-149, "Uncorrectable Error Mask
Register (Offset 08h)", bit 26 (Poisoned TLP Egress Blocked Mask) has a
default value of 1b (RWS), alongside bit 22 (Uncorrectable Internal
Error Mask, default 1b).

The reason bit 26 reads 0b on the e1000e Endpoint in the cover letter
is Note 3 of Table 7-149: a non-VF Function only implements bit 26 when
Poisoned TLP Egress Blocking Supported is Set in the DPC Capability
Register (Offset 04h, bit 6; PCIe r7.0, sec 7.9.14.2, Table 7-280).
Per PCIe r7.0, sec 7.9.14, the DPC Extended Capability (001Dh) is only
applicable to Root Ports and Switch Downstream Ports, not to Endpoints
like e1000e (and in QEMU, pcie_aer_init() initializes PCI_ERR_UNCOR_MASK
to PCI_ERR_UNC_INTN | PCI_ERR_UNC_TLPPRE = 0x02400000). Per sec 7.8.4.3,
"Register fields for bits not implemented by the Function are hardwired
to 0b."

That said, your suggestion to use "Header Log Overflow or Internal
Errors" (PCIe r7.0, sec 7.8.4.6, Table 7-152, bits 14-15, and
sec 7.8.4.3, Table 7-149, bit 22) as the example is much clearer
because those bits apply to Endpoints as well and match the sample
output directly. If you or anyone else suggests the same, I will gladly
change it.

Thanks,
Priyank
