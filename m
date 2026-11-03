Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793712175;
	b=PBRM+Fn0dWTkGQwfdo43jVu/tMkFGKrUZiKjXVnrojL0chOLjYpqlpVtVYzkdqHD1BpQ
	 +KAKEMVG2sy1swVqY25WQWKaAPlpVIQ32PP5WtPhlTzX897Lt2Ypi+3r+S66W0z9FJw1i
	 FopEiBSKxQCpCS/NnCco/BrCXITE1bqLiZx0F58eDmbDDJbXTB1hH7dOV8y6KENZi6QPy
	 6g1O22+C9L3b05rMk6Eibk5JUCEWyhU74O/uKTmtqAyr6mx8mHjQfHgCOsLKgixP8WuuG
	 U7TPNqwRahm9b5zdBkzXa6yg/WU2kq0j69VRRIuy1BKoqmYs0hz+XKM1IDy0b6gl2mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9KwHQjKFgpi0i5HGrc0Hhrq2/ezRelX2eB7Zkx5u6DY=;
	b=sQG+oClqMF90fiDjOFZEq0hQWP2so8CycurYkZNoTpBgGEiFIxO3G4UedHMUy3QM7kEB
	 dSfWGH3AOSdgjZW0s54T/jG/8KCQ6ki4WSsNfKOcvlo2Y0EI71shIECcPSGFVjZnP6PxU
	 WWTv/lz6WPYOrzSNVdWWD08dR+XCTO1tpknCaO+1krqzy4Jmkq1zH/LqV/nAA17Q0YSCx
	 mbpYNr95iZURQm+zrvv7ZJhAm1Yo8kfqi5+9oNnXT8QZ0bMP8t8nf8Aauvga/UWKOzVg1
	 xFjOrRBLIalxcUyGNuYeoQ+z0lHGysTNe1BZH+MoUMzAFc6cDNE01u0ytHfoEyIiBTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLh5VG3m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C774606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C774606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLh5VG3m
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-19305bcb72cso3084013c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793712173; cv=none;
        d=google.com; s=arc-20260327;
        b=b04/9aUtCsK/jMxZmSZpXLojzICIzVv6xSvKWdOnu25fT+Fae/5RL5uLhvrMLlXqZn
         yoE3fHVX+TwWJIscO0Q9LdrFsakiqG0yOOR29K0b6cW3ljxYiMJbIA6y+LGhvwt0gKwf
         JSfUmWK9hTNOY0upWmZ4P5Q0nFKg5rruAQxWb+NNzAK1tj35eZsqq/Jd6swxTC1+QR5D
         VumTIZF20DJUKrAjfLFxQevKsaPsEeySnz+XMn2YvDahBOuDs0JIoKSITrYycnUxO06d
         4pgcIZnNdgzaI0M69XGgwQzeYU3zktFpPjB/OeICwY3+PPUg4ySD0slcDcmtahQs0wTR
         aW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9KwHQjKFgpi0i5HGrc0Hhrq2/ezRelX2eB7Zkx5u6DY=;
        fh=/0kFfSXesVABJdD4UfvQEx4+5cGstYO1XM4iVWuTmN4=;
        b=f3EidBSmXMJy2rmBjpvRubV1/IzgTyGmUWs0/c3SmUW/RTWUZY/f3/64If1iA2m9Yx
         zOH0LqHdNc/xLIR6fiDPo9y1TbdDYX5Ro++itZ4PF6NpDg6iZ+pzUJ4YUPYu6cJqxxyo
         I4PBWl/poAf7jZaTNSgpczOjwetr1pfkD+3INKvxK5FBMV9hn7juhV7XVHnGZg7wKpdk
         z9IMhWEBPbT54RE/aUDChyQ1xDC5a52rNRKgw9VacPPWkRPaPySe0j8S30CpSDHC8SUL
         7EF111UulPXCWTOZJvAKMJRYazbwd4YUgOiHvfMDBCKihkzjllLdaehOsmDQdwgd5IAv
         4Wkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712173; x=1794316973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KwHQjKFgpi0i5HGrc0Hhrq2/ezRelX2eB7Zkx5u6DY=;
        b=LLh5VG3mzq6P73mPT2KOAC9nz25lAyw+SDCybhoVaLrd3LAVuKn9AZhFQT8xGoUAd9
         iQ0eRBok6NHOOLJ2ANEl6qkXp/wt5IFJ/+Qx2f95sa3nhX6NdymbhjVQnrmkJ/AJnFto
         ZIaj8rqgn2ZwLoTcs5CAJwz/kV3cklSf03nxZajGgeydaiA8pC2fG3kAnmNZPwkGTiar
         qhI7W8mhvvibw/2NFz4T7Lt6IwCOEsfbpbsMtG1d5ds7bewzjqZ419EleHQXGlcPto1l
         zCyUnm1bouoFLg00MNC9RnFVmUD61LraI9k0+bE6MoTfmm/dW30/DztVcoNEf+rF0IJg
         a5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712173; x=1794316973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KwHQjKFgpi0i5HGrc0Hhrq2/ezRelX2eB7Zkx5u6DY=;
        b=Cvnhw4LM8qVD0qUwvKsBbcd2r/BnCwKyQO+oFq2y9BzioTBsw5H5n66e4DHai75xQV
         4h6XmZHtQCSghxIjIqXu15Ko5H95ZzxQGu1DbhS6C7PPnsceu0iCqNWHW9t4pCMajcJX
         ObTYcxDpWC26w30ojOTTdpDp321vcRIT68ehQk8qeFkZh+z6JiTFKllvEo/7k0/3qmsp
         QHyVsezYEsKEGR2ydd7V20UtH37uEbZGgD0oKtXlnmLMMucW4JxxR4SOU5vMjupcmWFQ
         Shy66mQWxi2xBISx2aI+grdMy2/Ze5WHEBWpwp6SRIEudGvgcabFGRkiT8IAgapd8VSJ
         xzuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHZoLhsLj5x4Vf3kQoSA2BniaK3RSR9tPR47X+yl1ixeHrCzJ3k3FVVeYcfkFuhlijDaFAsgAhO0Md48g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lMwp5F/e1DPb+v0M28ZvWL9N3VAOfwsgSnFO1827meDp8uak1
	74lo5fcUmVtufOtozKQfvkvx5cIvYQtGMXY1uV8Rp+lfHSakzL436bUwPyI3rijTN9OiHfLdsOU
	JIvgTOVC8Dsw3YuPkCoyAUV2pEdmexpI=
X-Gm-Gg: AYBFou2EayHWl88wpfEtrVmtpKCM72k9/TQ0ADsHuVr8SJDFd8POXlFoljrJy7B6WKs
	Vtwpik4VuPSh/HlifnC5PHRNZq/+eZBpWa7VZ3uMrjv21AUroqjM0+fc/2D95GNiwB+n1LLpbDY
	5v8WNHMbAA3wScDimOCLFAYsm0Iuqf02Qa+uAQBVHNIUyEvsSttSm2sEpcL+y3Z1A3NEmK9rhnk
	MRGRIcj/WdKoWzS170P95sb1R/1JILIx4w+jeq4B8n9PW0uv8byukmoW7XFVjE3fVaESJOqa5Fu
	0iv163u3Eo0/H4WDScFQbd5tBoUf9mqKItuDL/tgj0fUntYikD3tvOFnIIGbnjzU+KUe8RFfI6A
	i9lpBB3xYpS4gxFdIGmj70ZqsJqITLYEGEhZx
X-Received: by 2002:a05:701b:450e:10b0:14c:637d:682d with SMTP id
 a92af1059eb24-1ac5d69f6a1mr19043531c88.43.1793712173117; Tue, 03 Nov 2026
 05:22:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101150240.66292-1-timur.stukan.linux@gmail.com> <179354572351.3286.5042962273582442842@kernel.org>
In-Reply-To: <179354572351.3286.5042962273582442842@kernel.org>
From: Timur Stukan <timur.stukan.linux@gmail.com>
Date: Tue, 3 Nov 2026 15:22:41 +0200
X-Gm-Features: AclHuK-C5xGCzX7-O3YYlIZKLZWlvhm5d8m0-ahEBg7449qGEWBHvcs7hKepSTA
Message-ID: <CAF+_u5DHF4UW-8p+BRKzCPWELOLVqhnO5Jz+WiJR0dL_BWS7rw@mail.gmail.com>
Subject: Re: [PATCH net v3] bonding: fix missing down path on speed/duplex
 failure after FAIL->UP
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Hangbin Liu <hangbin.liu@linux.dev>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Fernando Fernandez Mancera <fmancera@suse.de>, Jay Vosburgh <jv@jvosburgh.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Nov 2026 at 17:08, <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Hi,

This was found by manual code inspection of bond_miimon_commit() while
working on the bonding driver, and then reproduced in a VM with e1000e
interfaces.

Timur.
