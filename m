Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312735;
	b=5iA6br3oSppFMYYbZTVG1mtyB+Au5l/IyDmVVkkTGHnyH+p/bTXxAzvqvdzfAXhb9QA0
	 OZLLCzvxw2T6l/1YdDXiVldE9CnZtW+xgkE18sgLqRzO/kckwh5C975zMhim0xfh6NWKc
	 wrBuBfl/Y+qpnjG+Fwejp1fSQt6TliOwPyr2hhfJClqe1DIjGsQVwC5qYBFI/waLI4gpe
	 pqEHHDKTg2KkzLih1JTDdZVr4nIKf/Q4HZnLTCORTP3JQmHb4Dn+2Im3SqKtJPglvAcv9
	 uII8Ql2KNFaesnukw5UWB+E0xPD/V01ThdJ+1EpfLYKi+Eq5siRQBQKLXhU9NgUe1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312735;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5z9aOghFimx59ky5KFeYfYZouP9AaiKbr2PbDrWMQBQ=;
	b=LjSsZUs8T9cs+0lDGRocEiYnrx70TjrOGkKistvY4SIK8EkT6y0T4RtGI3rV9gHj52QY
	 RDI8D5WryjqHsieRTquvzH7PPgxGB6x7TVcjKQBWfjD3hAKDVoYYu/yUp8cmilip9gJqm
	 Ydv7p2coNYF6Gj7R0JlArxMqNVMQl/KsqlPtFBMCI5UM/nDa1Noe+qU8zVH52nNMpe1lH
	 XCGMk0O5cNRCXyXB6ed/KqAX+72JcMg5jtEMkgLzB0CLwYoyn0wgB3zae6n3Vn14RTzhv
	 44RrUN3SKjWax9HQ/Npss+Nl9GwE6lYCHQ+YgvZTN3/ZyNgm8Gy9yawkJCT0wmpdcRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mT6t1gPD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0201606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mT6t1gPD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53CD1F0089F;
	Tue, 10 Nov 2026 12:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312734;
	bh=5z9aOghFimx59ky5KFeYfYZouP9AaiKbr2PbDrWMQBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mT6t1gPD1qyyo/vreYkCpkbSShJcWHVwYb5hbJwVrsj4EyKlNOtm6HnYl7xh+Yeul
	 d3RNaj6JMd+mOHeyHf01FEaVtYExDwn9zz7klXgvWrDhTYF2s7nPXhDkiN4GRdj2DK
	 NdL54gEejwlz7cszB1/xAzmadaBkpDdZZV0ZDONQsAawH24seEBbpfzC3WH7LjsJ/W
	 TlTSPiV4bQ98P7k98FUmVEN+XWPUEUdZq/qxNPyAVSuVELOiZ6CQikMYKlh5sNmMx9
	 aIjjzPV5rVbOqtmrF5997/WZPZcxlSIL6w/5NiAmcC4Llw9od+LnSJNUlfWgkANf93
	 MLfyRZ5UwV3IQ==
Date: Tue, 10 Nov 2026 12:12:10 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: n3rd <18670333770@163.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "security@kernel.org" <security@kernel.org>
Subject: Re: [SECURITY] mm: MADV_GUARD_INSTALL drops uffd-wp/rwp markers
 silently
Message-ID: <avMJ3Nid46Tag8Cc@gremlin>
References: <3f4b0d1b.bbf84.1a1c55cb666.Coremail.18670333770@163.com>
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
In-Reply-To: <3f4b0d1b.bbf84.1a1c55cb666.Coremail.18670333770@163.com>

One more email like this and I put you on an ignore list and have my mail client
automatically delete everything you send.

I am not sure why I am even replying now... :)

--
Cheers, Lorenzo
