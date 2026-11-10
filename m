Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794338276;
	b=aKeKK7M2xC6QpNeOj/xnZCzznd54DqIMqwL9shsilFy2kyPIOCQSyDkDEh+dePCuLhdz
	 5MKDmUTFU40fIfR4U9APQjcMBPLGMc8XJakrrF13propcMX0RGsaRJuuYEhDBlulGuMN2
	 B99W5xzA9pcJ0HHVGq5pI/Sa2fGDbQHCx6YxToSq/Yk9I7yeIrESPParW8wDSubW+QesO
	 C+be7HKeFHQSzx0nBVI/frtdFOcx3DvXoCTNXYhUG3QQh1pNvGWL8NrwRIV/+W2Cdhk0y
	 gqCg93MJw71e4DU2PXWAOwXktC7sE2sJsfePK7bdpdqFEGWQ8PEFOIScza288czkfDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
	b=YWxvytKPbaXOw3rtTMORZ82gxGknRkYbWS7n8tUzQSR/0o/+w6lmsp+z7UuCG2XuyCds
	 mR4BFwUu2+aPGqW4RWXJrr9dHWW/+Qyr7oQMHitiKwh8a7x2BwW0UOISja0Uylg6O84KI
	 9Ox6t/AKj/YBxTmGPzlfoR2KrNNiLA0QO7eyWYPHCzXIOApmhe4bwOnarWTm8SR0IoaUc
	 kH/bbPo7M6huMvtON9L6PfxZIRYRj3Iwq66u8RJqZzHgvnptfCcmQbmTajg3sM4uZMT0o
	 zsyVgIOtPKh2vE5XrJasXBKlmvM5SD7gEDWzXPGGbSv1qUwp8hSjGsqcUUwaWAItbTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wG23Iavn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93071606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93071606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wG23Iavn
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so3054357d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:17:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794338275; cv=none;
        d=google.com; s=arc-20260327;
        b=R9G+3T9CIHC4gWQHiuNHFB+j+irp2pVnPP8IzMCWJjy8KuoVZ4Kj6dC1wwXmWSwj9m
         47IYXlCODxCSvwDGTSOMhQFVoJM5yln7QfUwBXHNxZc6CzwRk3c8zfr3Rh7YvWn8WpO8
         PhKBF6aOdFe/XsnUweJ8iiz6YBSkugnIJy3hWFXqBETDsY3cpKUUrTMqlxct+JcnaxKZ
         Y7GFHUJ9o0+GaNfaQyeuQ42Ka6XH/WLpr2dOx6SOxWp1Ya1K+mWkIUtq2kMsVFkwRj1q
         EybBZ2u+TImone4lerj3a/kIx04gRfjNWfHyI8IeVOtEl1IBQ2S1QHm25qT/JSLBEo1k
         2q4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        fh=PLkVe6XzePdjz4U331Nseibl0IoKOW+zP9tvTNqTK2M=;
        b=ENPXtVpHnYXwfbTROiBCwu5h3rg1mcIO+i9HTSIvcxrgTRQNcowpVCdQMycmXa4Txn
         difBrTPxxT/SYrPECUDID1mY5hh+KQeUcGCbNsAac1A9N70ySz4M10r8DMO2/N9LPHcI
         JNiJyCpOAtSX7uDyO29n+9xNvVlGBVncqe3kCEWQ2DvtjnhgIgIhMIDHKdHRMhs5Pnca
         niZw3z2cw31OK0kJhgN3Tc7cVevr1GGhElrTVjvoZs2MGrdLTVPu8M8hqmCSFXp1gRQ9
         2T4tje3uYB18V3Kee9+zZP3PbzezUdqzE3HS5nPuZmM+VmRAKbVep/OimzuCFayL+0U3
         Js+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794338275; x=1794943075; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        b=wG23IavnEf5PBf4OCbe0axelDdxvC0oY3LCq/Qk5QPxH/rJRPbl1XXe8r3rYttBY0E
         fjHM/7cXvWIJOf+q2vNQIwIEjoTrZ4lcPzTPR0Cbory6gtpcZYQ0tn/+iq+VhxnsqAOh
         KOcWZkFlnc03XwyF5ACIQ/5jRaIbKXQNf/1yc+DJPkNi5vpBGaJKAAMxubQtbxkEiH+j
         0nTJQT/37sk8uPHbwHW1hKInsYKMDL7+SMKU7BZGWXjXPlbjMcOy2l6agl9UyQSrvPAw
         LQ8IzBeiVAawq7CUrMxeSucHicW7iOyBOnZJFtiQCNxlMz14X7B4ZKECymH4sJsjiOiR
         lBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338275; x=1794943075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        b=QFpktOeTdgh6mJ7pzUEufYR6KqYbrGadowQPwjBsCVlexy5U0w2g1q7X65W/Ih1AiE
         9UQEetGP8VIAStMPFnT5zueSKddgSBkS5e9mlGmJsnqq9SLJU1C3JcL5xFK6SNL45NhW
         XuJ9SfFe9Do9Uw8CW+8rZluxbW77UkxIcnbvCib19zHzh2tnlkipFGrVxlNrawL2iLCD
         VmVl3YwXKCwoWjwlHBiA2mhfBEpkIZqilKErJzLZdWQ4TG6KaZR9PILPhOk62VvkfKAj
         +NZvsF8qPQkH1U5QTxNedYGhmLJ8EiQoGcRuk+JjbnW1CnxkZM+Qc8vVQbeyi5Dnh5p7
         dxXg==
X-Forwarded-Encrypted: i=1; AL+hErEZflecTmQ4vD2jDauzvnToZd/uwuFJJ6X64j1ecdTKcJ6UYH3TKanWAiqz5ksAXQw1V5b6VhCmofu9kxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jUOU5q5FdFdbKpZbHsoAL6DKNEihmxlrvORY9cMJ6qykaifEH
	zf0q/DetmyEbTCcjtaaZyqjxiuEPUvKtjObMPtuy3BWtSmQv7wWGVY9Q3T9u96s5PvP/POUrc6s
	+8Yrb/OdgAQbcqCMykoN8wTAwtyX/4cw=
X-Gm-Gg: AYBFou2ui8v59sUax4DEErtVh/i6AX2Fc/RH5HTy53Px46gdLAK2tOp/C5l1f2WBb3H
	vPjMYZjvy2tflT4LKtkS5qrKBgvvpDqrgiInbLvDeHV4PA9bSgdLomSt3tossr77/wJjHMDckzN
	lT4AWI9hVKBSAOyUelpACFfPh/I1h6tyjhE+UTwK5XbPRi9+Hml9xlgB4tAsscNHy3TJeR9eq4e
	Deu6yRgN4mSkBVqxSGwbJa5Etfgl8WpYj9vrP45YfIHcuznmuLuTSOSrQdAtCxAa5nIjTUPtcUq
	VlMGbGaK5iE6wM+HIamgfI5dM4+CM7aUsK7PaoRk88VY/ijeGNrb+8WJgK6dN3E6VeaOWwz3bgK
	mWJpriQYkJiohFdKR8xLnHoyhQoqf20QMw5DlqQ==
X-Received: by 2002:a05:690c:a045:b0:8b3:59dd:11bb with SMTP id
 00721157ae682-8b3a80904bbmr1548667b3.32.1794338275490; Tue, 10 Nov 2026
 11:17:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org> <20261108-04-k3-pm-support-v3-1-b9dc0857039b@kernel.org>
In-Reply-To: <20261108-04-k3-pm-support-v3-1-b9dc0857039b@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:16:00 +0100
X-Gm-Features: AclHuK8pMvnG1Q-j9dHb2iJ_gKQ1ShQm5guoJXhhleP_Gp1CskmuEJKcLhqrA_k
Message-ID: <CABdCQ=NCwHn_Qtg-KZCRYWrruDWrP5Fdpeq_Ci_vtcbm92hEkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Patch 1/2 is unchanged from v2.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>
