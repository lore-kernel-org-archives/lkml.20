Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648456;
	b=FIfq+aarK031AGp3oRVvGoQdrspalN4HeMs9/I7FECtqtJrzNsDRFEeUPSCiJX3lURme
	 q1rUka3ptkNXdUmSPGHQPYHhrdBatDX4OsB7diJopvNQEFvuhV6/v0vWptpylc3SOPsFi
	 P9oikuVQ0HntR9YTyMDU+zBkbKWVusj7mcGT3Cby9Z8YXo4Z9GNQ3FTnzrVbRYQLvL9Yi
	 97t0yfe2+43XAbwbLRcyTQRMo5s6lICIVjb172JfEayqZ4L05MumsMaILuyO0QHiwSXGX
	 OyM7HKr/QAvxYj8wNVEaO+0HOsr3/6MqTSS+CNKFsfMHCEChS44aNYO8klySem1/yLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IYfseqkO7OC6/oxcEmE8wFTp9WLs906rRXW1lcqa5cA=;
	b=NkwxH94mbu/vPluhlS9hrLOqOtFLLFsynykDZsZIdJ3uBgtAL9m0n6VyTPN/QWobAnyc
	 DrptHwDTS2A4F34fSegidEsxkm3Qx/8SnXKd6gEDybYFMggRBNf++MyeeI4p9uYk/HwFj
	 6/2SdyJ4B9mTdOk4hTXAJdX0rezB2Mqd2jTPpYNHdp+yftzlAhi25/KTaS6HoSlqAma/6
	 +gH7YT2ec+ozk1+ebPX9oLpat3uc25AmQHKjI53VaFAmQVDJ1skgUphModIM1qtXjW9Lp
	 QlpAjwXiwK4Tp7vrcfKrnQjwfDbfNo8FQZW73Y3kmd3sSj+fvB3MximoPKHKKkTbLyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5KoJgFd;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693A606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C693A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5KoJgFd
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb5f49a61bso3038775e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794648454; x=1795253254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYfseqkO7OC6/oxcEmE8wFTp9WLs906rRXW1lcqa5cA=;
        b=N5KoJgFdxbvutLCBYOTB6R6ZTP3aEUY28rDtGlIBC0bus6G/FW07ChZpcDTCaZ6KwO
         AOQFdqxzCWiXE++cG/h+Msh7cNLIrH6FmJhmeWn4IbFVX13PbykYbqubnJwauBxeNvVp
         R56/W8xpxsRYrwpWjMediDdWJFJoMRzVsXYgxAshtggdDCyxhdfhzyqWohsI0WGdKxIC
         1N7WKSaLs5i/syvZdDXVSCuS+EgEIcDpRjxC03WdUuCWngHFbpTG3XX1BOt2/dl3TWRD
         Q/cjq+tYLQPGgZApIJYnbCQ6jOBG9Kk+hdpyugC8uYzxJI4sowM2yK5YADlEgLgOIEyN
         VfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794648454; x=1795253254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYfseqkO7OC6/oxcEmE8wFTp9WLs906rRXW1lcqa5cA=;
        b=TkoAeSm9V0wlCRs86gT9d6ygxaq6LimPfFGT/WWvETpRnqg7DkEaa71pdVJw/lvEC4
         D2FpzN01RwymwlYizLZmdA35CT9aLdNPt54qm+jflIKIwUAz2IPVTmYrtzWnBJXy8mtS
         0OnWqAfzcEdgxct7e8strmzpprxe1PBZeIxqQ/RY7uNSj1L+ebTe2x6U88WObRlU6mok
         PsxF/LOSH8jlDgnkhHm2CVdt7fSMA0izJiKvqF7UmHRXh8volAa5zFubyjEBXMGIqqby
         yWc50mjZFnzpfIGxPw1vsM76wU/YDcBb9qqncu0Ogc9Hpy6kA5KMBNpIHrlnu992jsgc
         wGBQ==
X-Forwarded-Encrypted: i=1; AL+hErF+vLt2fEX7odDdpQBgaB8BIyAjQECX12O1iFoSaZvk6mWYFgfncHpLZvNjo6QDYTdzj+/VpsRl55yqqmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z93mUtuaxWbKqc1Q/vNDeKyu7fuq0Io/208VtUPy8nahdHKnTH4
	rxcNXYsjNrpBTXCx4chKdRLZ/9MVdB6v3M4StqeuG8HjNCj8w8VX8OUV
X-Gm-Gg: AYBFou0RlOwLH9TNbY5cNXM+2Hr8nIaqPmOT2MdBzQIe18JErWU3hANs8ynKUsvoMe+
	KKRufpEHFCCysbfPNZ2jO9/1hLu+MnLjngnTGER2tADR8WuEmqUZztX5htstks4fA1tPdAhjR/j
	O4xFLT9rRKjS51OqBrqH5aCpQ/C9r627G2Ldz1lYVPkdsfsmRBkmyhUmEihGxLKLTSdQBZ9EfX7
	ploZrpoNogq748U50IWNRZ35lBUKFkJ+9+xLgyYMrP2v1AKbXEhUuCPBIbFP0ntsuO4Vd7iEd+s
	87rCDihy+9kG2GAPI7NnPxeOfmwvYImtpPPB5SbUXQU77ffPHK5qGP1E2J1DrfS8oJOtr4wV87x
	3PAR/l1ev/JrTp0arJAUniJw0MVTJ84K3umfoFyF7CxBMuVXqnlD1JMAjNLqH4RhZquW6zHTEdc
	2+QzQ04iy6yrrRkmoPbwR/XA63itmgo8AyX+PcKh6bKVSWxV8bJyRST5/0bVjnP9C3r1dYLT4tj
	0GkavmyFUNJuWhCAs2rgpCn1+DAMJ/13V2kDwn555pUG/X2M3FZiz0CHhxpVzQpjAKY4SCA4NxL
	vwJoptdwGam/Jm9yRqXddJiSeAOA81B1/ScpXDbXiSbOv3MVyKr32gIComJNmI9OJbUUicoh+TK
	C49Us/FIpEKJhtK3eNIqzYRoDbSrUnig9P5U4i8Za7mYfusJYU/XT6kg5EYo0pRAtHRCHr+n1vL
	EELb0/IB8Mb9gWaa6yBXencs01RlPudFNzGcyL6HZfocnBZQx9sdC9MkM=
X-Received: by 2002:a05:600c:3b2a:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb55aabdf9mr108908365e9.25.1794648454037;
        Sat, 14 Nov 2026 01:27:34 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b358-dd01-fd08-0f0c-fef7-8409.310.pool.telefonica.de. [2a02:3100:b358:dd01:fd08:f0c:fef7:8409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm62372995e9.4.2026.11.14.01.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:27:33 -0800 (PST)
Date: Sat, 14 Nov 2026 10:27:32 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Hari Bathini <hbathini@linux.ibm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Naveen N Rao <naveen@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Abhishek Dubey <adubey@linux.ibm.com>, Dan Carpenter <error27@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc32/bpf: return false from
 bpf_jit_supports_fsession() on ppc32
Message-ID: <avgpYvt_Gf_1obem@gmail.com>
References: <20261003184226.76740-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003184226.76740-1-kmehltretter@gmail.com>

On Sat, Oct 03, 2026 at 08:42:26PM +0100, Karl Mehltretter wrote:
> bpf_jit_supports_fsession() returns bool. Commit 92258b5bf1ec
> ("powerpc32/bpf: Add fsession support") made it return -EOPNOTSUPP on
> ppc32 until fsession is validated there. The negative value converts to
> true, so the verifier does not reject fsession programs on ppc32. Such a
> program loads, and only attaching it fails because
> __arch_prepare_bpf_trampoline() returns -EOPNOTSUPP on ppc32.
> 
> Return false instead. The load then fails with "JIT does not support
> fsession". Tested with a ppc32 kernel on QEMU g3beige.
> 
> Fixes: 92258b5bf1ec ("powerpc32/bpf: Add fsession support")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202608010958.cYfBCQAC-lkp@intel.com/

A friendly ping on this ppc32 BPF fsession fix. Patchwork on netdevbpf
marks it awaiting-upstream for the powerpc tree. Is anything else needed
from my side?

Thanks,
Karl
