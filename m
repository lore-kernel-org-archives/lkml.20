Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6636494B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536280; cv=pass; b=GvKm4D4ClpNjcwSzGHz971mIuQjQpko4K/1OdWvDXw2E1mlst9PHUWHhBdg9b40Ch1W50qEJe6BKuAPnjZX89cH1VsBTOls5pKvkPR40hJDUoGVUTeytJZDOQ1SgpQnJB8w27GCn3FdQfibJhKrfov2NVf8u6VeKA3u4hJrJyfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536280; c=relaxed/simple;
	bh=NfETxoF4ucCCZgxIexpfcNpfV4dYp0/llOpv6Ji+XEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYjdmTnKyXzqVXJYJ0o6ljvYO7bHJOqB/x+gBtNM56ZF/gc/mJLZDB0CDy2G7wu3Z2Uy21SGjOm3/2kTRya2yefppH+JA+ntRFWgl/rv4FbJSg2GX4TJ9bPk6AluXXMp0WkbQeOUHXzBruFvJgDXDJUuz4BKT2TXzWeAbOfztPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhVxsxXe; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhVxsxXe"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c315869241fso707436566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791536277; cv=none;
        d=google.com; s=arc-20260327;
        b=ZBSNWPFHNznO4IQsdG9bUxic4O1MTC7thdu5kwsAusSTZ2xt7QNqJBQOKw8jwrSiNf
         UOwaCfykqKo6gwWnFCisyS9uybuvGYBMd0sUv6mM/2N1Xx7R5BAnvdebkzutdVGQvy6E
         97928didJxHYFA/ZtB/cyw92qE/C3eqmw/418vc4EyMnFy5uMDgA7sgAIIjgYh3yuP8C
         U36B+1yO4DphybvENGpyn+LUfvutJLFPE2uMHuCjQ8l9oZN0bgS+yrV1Z9OkSueK2xIs
         9b51Vgp3auVDq6p0+Op17arKMIAQiBXqWSuT9E6lcWQbKsLrFMMt7f8qzeB9+QmaIgte
         rUmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NfETxoF4ucCCZgxIexpfcNpfV4dYp0/llOpv6Ji+XEg=;
        fh=VbCQzb583LkRqfdtq2BfhehZOx6IMB0aLGo7hRGSaEw=;
        b=E0lvoxxTroe3mqmYjn3E4aEsj0k7hXI4aBjoxLmh2h3ndknpMVAWyY+K1ZQsw+wFap
         4GrfXpdH97zB6B5jpTn4AfWhnYzMGYD+dkx/DzL1mtnS508uhBO3mMvvRkk90AI6uA95
         ZuQhFy1iG14yEgkaBXWMWSk3ac5DEVSm0VLCSMG6qetEVTx9e63zYbEWR9/viLvX1lq5
         hU81n97I6XjRfaMi00IxI53ANGUNKkBWGwOm4oQE8Yp8PbqeVUDLBzbk2whag+mGxiST
         cTPLEwhe1w61PNOxtTJbXNSgv4aQ7dflftalE6hsXcXA/DMDxiOxcPX9Lrfa0sCGyLDg
         fpjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791536277; x=1792141077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NfETxoF4ucCCZgxIexpfcNpfV4dYp0/llOpv6Ji+XEg=;
        b=MhVxsxXecptYlID4IUm6AzVPsaZN7LkFCH0SBo4E+MoN+TJL/npo0mDZK2znYZIeJ2
         PW97Pa+Osx+gNnMHmIAs7cPvxS12or/PKKUz7/qbkHYy8rLZSxpF20DJap/gyxiYoUAr
         2q/bGcQby+XFX6NSzE67/53HO8jy5q5b4Cu3xasSGS8cKCfu8jQDgm7eINV96PwWBvc1
         qegyhSnNxBqvhzB8EEdbyFX6szGaQdDm/sZrdbYE4MSfL+V2UU/vJDMe1yXTZlufVh0D
         m72ZXvV27HvXndSuaK/h/286TnCgjyzB+oeT3+NhhWuGJ9T/NphgzhKucCkXKfltuH9/
         tcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791536277; x=1792141077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfETxoF4ucCCZgxIexpfcNpfV4dYp0/llOpv6Ji+XEg=;
        b=sjfKj2LwsgzYWpRcVfizMT1EMBgNKoX9umsquDleUAgL27vG35Y3g3XBZOgevh/qIl
         7Fs5AqtUpMR8nk2fhNHlcv0s3H+uH5ajCPAcmeIg+BpjU5lEJkAqBE4CX64UNbwNprkm
         MZgmED9t7//EBCb/rRy86/5g1hqolTJAAn2Ttdo4SIN13S8itUUBDooXGH89cmJivwMX
         AT6sUj36Kl7InlsWZTIRtQGMaDTUQvmDfV6GmQwTpprjEllkcxcgvDd8krK4Q7aQVhJT
         6s8Yy3srGSFD9mU0H3V3lAQ181n7T1c3DVcA1dr31V2SARMe9kzXtcuO9W4uHzcmQ9Bb
         xuKg==
X-Forwarded-Encrypted: i=1; AKwUvBx4PSGMFMeVUtKYavOSrtTbjgLZ70gYvgKu7FcEu8zmXSoXoxYAOAXwR+9tsyS3+Y8xVs81Lro85hca+qk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIZFogfIqOceyRLacnjSSjUtNLOFjNi8/bbmKyTSYDb7J51O0O
	ov9LfY4Kjr+wxOaQAuo8aagIsYIfLtoeO0tSAp8yVO1WWJOJscutPMN4mscsB+u5dZyXg7x9vle
	6caZwfrdZv0D9hdKqsJBGjNGbHz2aa1k=
X-Gm-Gg: AYBFou1iNtqHjpREmOIjWsR6sWNanluS30MnW9GHqCFeCYXDg3sURcpw8OidOrdQUJj
	DPHS9AfmoGQ6BxbMwjTWGHyqfIZEV5nyUinO54GhileGVHm4t4IJvFafvzBpRm7BTfdZCSn1Wms
	NEXluylZ9/PGxv0io0ZOaVrM3r/053SEb4NyXmOyV862uzpRZdPL1FFjWdItznnjAwKVSPrh0Jc
	jdyu84RzkXYW8JiuLZmqRAAmimrLPg2yYSYEQN48OoZj02pOj1TmWd+qj6WTlBTYx5An13W/gLT
	LCUzyxWPiqh1Gb7zP0PY8UpJdOq7PDcd9we/l7FEZx8K2t8s0WcGWRFfPLoeMWw+oKJcRiGSZGV
	xBEovWvqAb8eZitKVF7QRu5hScd+sjZqZHDZfY600+vKChEcttZBlFBrS2N3OFuyrr098Kmb5kQ
	cNdl0vzMeTiH1HnepoQROWc9P8HzBAKQsQuPDd/o3Q
X-Received: by 2002:a17:907:c19:b0:c26:19de:9ae1 with SMTP id
 a640c23a62f3a-c31a9f92fafmr107811566b.32.1791536277123; Fri, 09 Oct 2026
 01:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-aspeed-vuart-v1-1-d2be17c99cd7@phil.gs>
In-Reply-To: <20261008-aspeed-vuart-v1-1-d2be17c99cd7@phil.gs>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 9 Oct 2026 11:57:20 +0300
X-Gm-Features: AclHuK9b12DMuE5IdZa06_5PZbK1OQ4johR6fh1kbHOWemGxMcH63xDoKEpiMps
Message-ID: <CAHp75VdiO9tPX2vLqsX2-omNvs-YjkWWD-HOiqyDSzpJrrZ_5w@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_pci: Add support for ASPEED BMC VUARTs over PCIe
To: phil@phil.gs
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Corey Minyard <corey@minyard.net>, openipmi-developer@lists.sourceforge.net, 
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	linux-aspeed@lists.ozlabs.org, Ninad Palsule <ninad@linux.ibm.com>, 
	Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 4:27=E2=80=AFPM Phil Rosenthal via B4 Relay
<devnull+phil.phil.gs@kernel.org> wrote:
>
> From: Phil Rosenthal <phil@phil.gs>
>
> On systems with an ASPEED BMC, the IPMI Serial over LAN (SOL) console
> shows the firmware and the boot loader but goes silent once Linux
> starts. The UART that the BMC bridges to SOL is not a legacy COM port:
> it sits behind a PCIe function that no driver claims.
>
> ASPEED BMCs such as the AST2600 present this "BMC device" function to
> the host (1a03:2402, class 0c0701). Besides KCS, the BMC firmware can
> expose up to two 16550-compatible virtual UARTs through it, and host
> firmware redirects its console to them, for example "IPMI Card SOL/COM2
> (Pci Bus9,Dev1,Func0,Port0)" in the AMI setup of the ASUS Pro WS
> W680-ACE IPMI. Register these UARTs so that the kernel console and a
> getty can be used over SOL.
>
> The UART registers are in BAR1 at the VUART's LPC I/O address shifted
> left by two, one 32-bit register per 4 bytes: VUART0 at 0xfe0
> (0x3f8 << 2) and VUART1 at 0xbe0 (0x2f8 << 2). A VUART that the BMC has
> not enabled reads back as all ones; skip it so that the ports present
> are numbered contiguously. If the BMC exposes no VUART at all, decline
> the device so that it stays available to other drivers such as ipmi_si,
> whose PCI table matches the same class code.
>
> The function has no INTx pin and advertises 32 MSI vectors. On the ASUS
> board (BMC firmware 1.3.13) no interrupt was delivered on MSI vector 16,
> which is the vector ASPEED's own host driver uses for VUART0: transmit
> stalled and nothing was received. Poll the ports instead.
>
> The same function also exposes the BMC's KCS interface in BAR1.
> 8250_pci does not request the BAR, so an ipmi_si interface described by
> firmware (ACPI or SMBIOS) can still use those registers. ipmi_si's PCI
> driver, which matches the function by class code, can no longer bind it
> while a VUART is enabled.
>
> Tested on an ASUS Pro WS W680-ACE IPMI (BMC firmware 1.3.13): the kernel
> console and a getty run on ttyS5 over IPMI SOL, while a non-PCI ipmi_si
> interface uses the KCS registers in the same BAR.
>
> The register layout and MSI vector assignment follow the host driver
> from ASPEED's SDK as posted in 2023, which was not merged.

There is already a driver for this 8250_aspeed_vuart.c. Please, do not
add new quirks to 8250_pci.c.

--=20
With Best Regards,
Andy Shevchenko
