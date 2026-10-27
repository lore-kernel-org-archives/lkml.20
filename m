Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793111696;
	b=tQPB35zOEoO+EnJbwK1aLb4uWpxYnU8Jyec53/rSLnb14yPBAqXGSYkFFX66jen2HHhb
	 WJyLHaNMRkdcCZzrTZLV33y53hnV7I1LZOjOFz4P5232kSRgrTzWP66iLbTjrLCeHdaLE
	 0uTQmMAvaVBNmmPtYOtKjtiK9Eq7Ec+XsAuDHwVxU5hsQ9G3nqGCdHFfN2/sDvntPnOPx
	 CFbpRtV4R5FgKtM6W7G/cHFDDWH9/zR9zMwBtXipHQFrHKAZFVCY5iH72cCGoiOT4iaFx
	 1Er748pfywhr23G4TVn8LdjcVtVa2GHGNfq0mNBik9pYPA4Wa8w1cV0eoe0lYNq9aoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kpMVzTEsyq+10ygaZmcWH4opP1T6BP5uZJEA0uY70vE=;
	b=FMNymwGQFeEI0ge/pro6LF4lA39Gczk28ljSwNUc0Lgb2ktUDH4A1dtk2OUqzVwbV3Uk
	 jo8YLjcMyq4mSU8HQZgzOHorG9vZS/wtEnvfPIsm2kQfRHGhgEH7oVmydv+7kjNYqdHTp
	 AbR7fhDieVeuo/d9EsbzMwUc6jay6YKpDpU3XSqh/3iNIXSUA/AdqGaTEuqcMNGe4ozKD
	 ZoqhHt0E1t7bp9ZGnB/mFzqeTzvJ2s87cbrZIikEI7asyfYqL0CmIAHpA04Vye/YcofXE
	 mu6rS9zYSWQOEy0zPT+WPcf/y2i+B3P3YQ/HDBoUWoF72wT0TRKYM7kKmkjA/zrdqUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNL1x+Xv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C07606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNL1x+Xv
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53669f7b518so44261151cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793111695; cv=none;
        d=google.com; s=arc-20260327;
        b=GmNNYhsYa5gTUYl4CxY+bpx0/vhyS79Akznbg6snGWlJqfH8NWZ5tg+fB0JG9usFBQ
         2qwJx0oo5oHfag10NK5EgnkxMZRUZiJzsqtnhQlzytmzrYTWMJg18FytmOB/8XQ1pfFO
         5A0fdp1W5Ov+jYAhY/RyaakSWBatfhgKTZvLFU0G4RCAgVoAXPKC6lUGzoKuFtP+C4pG
         YGUWpK/ytxpyu4cMWrwXAgNXve75epqVyLUV663fHytE33ycIHBjSkVw9KpINWmG7Ii3
         KzfaFEIHU9ux0b3UdB3JdHxjey0VNB/xeAGpZQpwjsw3lJAsJOw3V2lDnOLaHUW3FBEf
         vObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kpMVzTEsyq+10ygaZmcWH4opP1T6BP5uZJEA0uY70vE=;
        fh=Y5TMomttH+hkGkyUE6HzrG1Ls8HNMK0GG4knGGvygWs=;
        b=kUIPn8bxJx1d8rE6hDX4Uk6Iq8KoRfIGBx7vpIg3pq+1Lnoh5+tADvIpqRdnOeNPkI
         S74ZCNmPE1RAwRsh68tpfOoaEA3STzmw7pIiW+p+TjcmmNjhGwNOX6HtXidoRkrsq+xB
         6dF+csvEu7nrWOpGuwT/rsW53OVbqOV/jzZZUuqiF5xtRWtbR2Hu4fN8dIfr+oqY9aej
         w4w/InH75t6Yevmf6/zdvEQTJCKWPuxpYofaIxkgxtAAs8D2D+novqF2Z+sDxrEFHIkk
         L8Y9yDC06KoaUP4hgGyWJn2rSmEiJ2zyiW/kX8UjQTJL21KNl/CcZc4frJ2Lq72fFB6N
         s5rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793111695; x=1793716495; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpMVzTEsyq+10ygaZmcWH4opP1T6BP5uZJEA0uY70vE=;
        b=gNL1x+Xv1DnXFPpzgePiAQuuZuxGQYp4vZ1KZEbsXr6VBegt4pJtXNzLeNxrCpoSCI
         vyOi7v6/0+IApmMQXYD6AGe5EUrYKJPHhrDm8nm3kiAEl/doeYsPq0sQTlTGWyGIHSax
         8uUnTg6CWkRGKsQ5Qzhc3YiWHw/HIdwgW7WIjIl/n587BwpsChYbbMrR1t33toZDX5pu
         cO31gnJ7HsIsGJijHvaWYd7DrEnivbFfmTpnn+VmfvsLebMcgPHXqdxCtjs4hOFv+opL
         /7mt9QweVw3fEG1JnW37At3rsmCLkOf1b6RdlUc9/i//g2ff+EPN3LK9o7hPShF19pzU
         QRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111695; x=1793716495;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpMVzTEsyq+10ygaZmcWH4opP1T6BP5uZJEA0uY70vE=;
        b=0e4AScrcOKm/INJ7oXgwS1apl5obL+BLxgFWAmL1D04WfzdfvgJQpkMHf7keS1BOuD
         Un/Ua6/pDjMlqKbXQCUgyzI1uXI9S9E2fio6oB0miZsHfjQLC/JvOZCpTvXrGAlIBDYR
         wYL+F+H0ep+PdUncfltwyBa4OcCpGev88LIuhhGtqugXR9bLlBHxUw26hkGZxQEUK5WV
         JiiKlhCg/9aJs+ECjuyrq/5BlC/2XnOhvGWPnVId79b1A/+WOmkfJS4DdMH85Y7iGqL2
         ajVcvoEP02JNtoMeQM7uFL92yYcUU5zmWOLjjgshrTDrcg1W0Sl9/O3M/evJb/KRXzbz
         kx1g==
X-Forwarded-Encrypted: i=1; AKwUvBx8MimId4jZhc+gSxIear33pFA4Ef5ktsHhwz4ygBkb96myGJTjy471P+UtlMyryL4+RdpPgMhl/mvLFL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS/9Y214IxdyQ8jdkJWEoWDWBzvALimv0XooM+WbcWAGCUrtqG
	/jniz75jcjQA5Ak4G8CvqOGmfrpijxbVJKM9ChLg21cHkH4gNLn9a1sL2RoZ59x8wxtu7dCuz5A
	w/eKV2W6tiHynE0jeKcEMXGYUcIuoXWg=
X-Gm-Gg: AYBFou3kRvDpxcG9nBnDCqZVCbIS77Y+Djg4V4mJZA/h4xVgZn77iK5LR6SgYGIT3OX
	sw5qfKgZXFvdpLAL8+WZxiS1+ggPmKXjuD5ffN9ETpbs8ItjTQ2ebQLVsUUPe3zv6Ph+JJm2zMh
	+j130MsFH1z0c8Hk9HlvfCH0h19ASXhG76iX82HO9LD/Mws2bOz2/0I6pJzZBEztGLCUeIIxqZC
	XFToQ8Dk1Unnj/9z6HwQRNe9xLfInGOoU1hiOB0EBxNo382hs6fjYpIIn2Eg9Tm9RiK9TwGs6L6
	oVWXo5/GFOlTuSYisUPfnN7j8yNHSzQ3IkccRMMGt+4tYUYNfoOgVc3y2XxcdO3rrlFoU+X7eoK
	Bk9HbLzD+3B8TUZAPjB4kmzqfqlB2ulj/y2sLOOsME3BnaclaCgozN+qR1Ol4Duppi7OymNj3Yb
	sdTWK2GL1fj2EqlRL0h51xOeHiPEJ25+8dC0mdxE8l8EvM/IWm
X-Received: by 2002:a05:622a:90b:b0:536:6bc5:2fb9 with SMTP id
 d75a77b69052e-5383b4a928amr176076021cf.14.1793111694872; Tue, 27 Oct 2026
 07:34:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
 <20261012-fix-aer-mask-override-v1-2-49a0d7aeaea0@google.com>
 <CAMAsx6dLGdqr+ZxG8FrwN-6r=5yVY8hk-c+7CVrAkS0zpKPmGg@mail.gmail.com> <20261026175724.1482083-1-rathodpriyank@google.com>
In-Reply-To: <20261026175724.1482083-1-rathodpriyank@google.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 27 Oct 2026 11:34:43 -0300
X-Gm-Features: AclHuK_njZlT_A6caNrXNbbG7gBGxHmrzYc6IWZzccr4qUxgXvxpemc8dDRNGgY
Message-ID: <CAMAsx6fdOmV4DH4WCi6u_EadZxdEg10FFnAKSe=g7duTW+eDdg@mail.gmail.com>
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

On Mon, Oct 26, 2026, Priyank Rathod wrote:
> The reason bit 26 reads 0b on the e1000e Endpoint in the cover letter
> is Note 3 of Table 7-149: a non-VF Function only implements bit 26 when
> Poisoned TLP Egress Blocking Supported is Set in the DPC Capability
> Register (Offset 04h, bit 6; PCIe r7.0, sec 7.9.14.2, Table 7-280).
> Per PCIe r7.0, sec 7.9.14, the DPC Extended Capability (001Dh) is only
> applicable to Root Ports and Switch Downstream Ports, not to Endpoints
> like e1000e (and in QEMU, pcie_aer_init() initializes PCI_ERR_UNCOR_MASK
> to PCI_ERR_UNC_INTN | PCI_ERR_UNC_TLPPRE = 0x02400000).

Hi Priyank,

Thank you for the detailed explanation, and for pointing me to Note 3 of
Table 7-149. That clears up why PCI_ERR_UNCOR_MASK reads 02400000 on the
e1000e in the sample session of the cover letter: bit 26 is only
implemented when the DPC capability reports Poisoned TLP Egress Blocking
support, which does not apply to an Endpoint.

> That said, your suggestion to use "Header Log Overflow or Internal
> Errors" (PCIe r7.0, sec 7.8.4.6, Table 7-152, bits 14-15, and
> sec 7.8.4.3, Table 7-149, bit 22) as the example is much clearer
> because those bits apply to Endpoints as well and match the sample
> output directly. If you or anyone else suggests the same, I will gladly
> change it.

Yes, I would suggest using those two in the example, since they are
masked by default on Endpoints too and match the sample output directly.
This is only a suggestion, of course; how to proceed is up to you and the
maintainers :)

Thanks,
Daniel
