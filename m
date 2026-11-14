Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684979;
	b=jffXI9QmqSqwqZhYzM5Y1qsQ+G+7bR48MHo+nhHqHeObdSWPpYLYHzz1w2RYw77aWyDn
	 b9dW/6zw3GUSMcb3rbgx9wcGNHNewRBr88pe1y3ZAlvnoYgUP6phFIqImjTJ3K1oZU4TO
	 4Y2ZqdiEZEKTZlGQSOo6495lFI+6TPvhmJ7Urzs1JEOyGbBm5zEXXnf7w7XRrjyQiN0dK
	 QHsLlNumM/MsoOqjYuHkgO3+uup5J5BNavYzRbscuFEk93qWazu0HIhDBOTaOkoGtC6Gi
	 MBgHW5m1w8g8nqL0CqP1ZMjaLoA1McE9HkPZKgQWOrTZTnNUMsS6/5RYEvq3XzgctVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=8zVUItnPHFNIUP4Z+vabblcyhI1ThNWFGye2ryxOmnY=;
	b=jYTwXmXw057oR1t4a/SQZ7kS6GNAnfn1NjZL9HJbK931/knT8Jp5YVTWJugurwPJ6UAz
	 ghRqGhG+IMYfX6E86wwzAej0G1IHOBdUZEmPwY7yKtPCT689OpaTBAFpKAdy7HxTa5xb8
	 cjiDMfufqWb7cIvdsx9+8U5GcL0d8Dq2GeAPBpqXD2qzj9s2V2gVCVxhejDvpxHDaFd0Z
	 DFsGqEhI7BWXiGy56Q+snyip2fEOzTHnk8DHWRwXgCB0GCr4ks9TCGRyT9vjbg3v70epc
	 mRFSQOZpJy2LPPBtR92r4IQX2UuFEg8JUAGo7ko7XhqSh+2HvAgodgNyy5I65n41oGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZLxnZCh;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3B606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B3B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZLxnZCh
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2793080a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684978; x=1795289778; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8zVUItnPHFNIUP4Z+vabblcyhI1ThNWFGye2ryxOmnY=;
        b=FZLxnZChQdyk+y/moM6mcBlLd9ZNuBhzt+gBd6Ols7VyBVMrSNtdAkaKCydZLm4B22
         ICuUw3eK91GGD4OKs5+ktA4ssURexzME56B4NihRNiC1LOxfvZoAYle1rhZIbFivaJu7
         Czn8mFXFNCxYt1mzJWwixcgMfWdYAynr0PqRdRwswhq9LYt4zcgfR8rWJqBBvYL8tK6N
         CxkwQl+3hLLGYadKwqsKLA6/xFDoBWwRD/TPGiSTGPTOQ+dR/UweDP0Nhp+uRTR6gs8K
         prGyDJbJkDZe8EJIFSo/glcotCm4LOHr+cuCkyz3RFMrcBIqVCR/ij8hj3Y8eyH7jOHh
         jETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684978; x=1795289778;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zVUItnPHFNIUP4Z+vabblcyhI1ThNWFGye2ryxOmnY=;
        b=XjLYKRS5euXwy3zGGK6QMb7XsucqSadohaK83IpGrSfocypmqd8TSXI10yXcm/gqVp
         /77bLEYBPfw3SOc6nxnPmWuiOJBNmzjm18WC2PLIUFXpjc4F7yVgrfnHG8KGfZDtr0Q6
         7k5ITS3/8oBE+3E28R5SjWE3aN0W3EiMW8vOKzktGN+S9XwHhg8ZVvh32Al3R2PW7JsI
         Zt0I9ow8k4BIYM1nTnW1dFJUb0cxQIRRTtKbEzMXyIjv39vuKscsI8h+BcCzoQE+9cTa
         4dpDgv5gSDqTE9FOOMqGNxusPmAsZzhvGO6OYSLopIDf1pk5pJLi9Pluib8JxE7Cn3U0
         gCIQ==
X-Forwarded-Encrypted: i=1; AL+hErEIE/ooFiwt1Y0Ow+4zRd2HIW+fSM3FvvdX3HJCj8X8uaXxMjyaJRKrZNYvbdodThYJZc5yQsU1fi91OSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z95GRHfw/eUqAaxWiBoeFVDq+oyNjXEG6MKk/Kuq5UAtAdSB67R
	ndjlgOxpojogAdnNenuvTvvTLykzkb9AzybHRjdhdTSRYjhwc/VTjM35
X-Gm-Gg: AYBFou1F7ecYxmHWMzfXetNiU9uEgubn+lJeZAIAIFppS4keJ5YaFhMTRvdCgsVnuzC
	FQXTa3ganyLk8SXSFSHMRzau90ZwaUhwpS9XTdnM67YZrJiCNZCkW8rgtsyRI+d+iwXIpWZtDsX
	FOevxe5dcaBSbUi4htDeQfYXyorQj6gtkbmmFIfeYEg6mezRNOUKYH8zaD0q9sp9loRiu3wzs33
	b3Ccc4YZS5m5B4fSA/JpUZg0HhJ0RVFpHGHOtqJy0eiV7epQ21elJn2U4EURlMPrW589Vr3D01F
	qVZq7nErcWa5XFs36bqhahJU10k3Fb8xyrnUQWao4Pd0CNP9axJpR3vBomzZBasfe+9mTmAO/iR
	NQ1fO/9x72OGxqJjZuNQQfWArqkcx37VG/nQ6DVnqDnwtWgSJdKdXSdp2TmgYZMu8swvUvP8zpQ
	efbax3EO7xPIDYIvm+hsShP4d68VyhOZ6pnB5KDUV8xhorApsk3ppQx0hQDeekeUbndT6cZCUPi
	U2Ugo61cfAepGvovDQ8R1XHQL9UlLI+fCkjqYeTSvr6+sW1VV5ds0XsYQ3ve8GGap6bEzKpRMUq
	IZRzIxEeMc0E+y4STNOf24oo8Nu1B6/tD5fw9AIKK0k8ybnNn8ZASNJszC/5FKyb9NGi0DqyBfN
	zEQ15vArbo5kTqJtw3/4skxjdQ6zkWTFgiKAfBogURlN3D+vGf1Tqk+A=
X-Received: by 2002:a17:90b:4ccc:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b1b0b6676fmr5703275a91.11.1794684978409;
        Sat, 14 Nov 2026 11:36:18 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm9924002a91.4.2026.11.14.11.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 11:36:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 19:36:17 +0000
Message-Id: <DMV6Q8SFLQ72.2AIN7VRB1JJOW@gmail.com>
Cc: "Kees Cook" <kees@kernel.org>, "Kees Cook" <kees+treewide@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the origin
 tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <avNO8cuAdnwv9D_5@sirena.org.uk>
In-Reply-To: <avNO8cuAdnwv9D_5@sirena.org.uk>

On Tue Nov 10, 2026 at 5:05 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/cfg.c
>
> between commit:
>
>   0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")
>
> from the origin tree and commit:
>
>   6771f70a47332 ("bpf: Remove is_state_visited(), bpf_compute_scc() and i=
ter.depth")
>
> from the bpf-next tree.

Thanks. It's resolved now.

