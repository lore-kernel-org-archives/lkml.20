Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765970;
	b=rkHW+VE54c/12FHxZ3LCt9/e4mtuNYkPXQtDHdPtIldO85eDlwoJY188fTsSJemwIIOC
	 d3DbUImA3wZbaIsUhpvoXKhGWsVDnkOJwvBBHExR9JPXLLDqCxAKBTYylAzEM0+fb5WsQ
	 cHTGwymBGUr9e8+jXkC5nbCoQ8v1AOYyezyM3ZsxpQir4kOVXI6465eWpPcisRigQHvok
	 IVRnLyJdPcUCzhTwB+n2HvpYYQJhFUc3AnPRxETeXaElmoH4ob3o2l9pUxZALGBJ1VA4q
	 BXFNMS6AWE490txfbjHnHSH2TOmPFflW6Y619MnhM6gNZeX0xR7SFzp13OBhJRopawA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
	b=Mpcvq70UIjXdl2YOsIoRObPEwD/Mk2AmJ2c3vFNa57h/xZoqEdrBRyWg3sM34Nap16nj
	 +JvufDlJjFNwHCmWYxhMuv+OrEM88bdyp9S73Q70Gddm6VxaqMldnvOhHryiSe3HfsEZt
	 i2tSEI8Z3SSn93e+H+i/37yhlko7ezLdV/KewjDk/S1d/9nlKtSd58SHscxBmZlfzxg4h
	 j1Qg+7PBUe/k9eOSC/4lvPofWl2RlIV5SJqXfAt5sa9gMtBlMyIKFSboL56qDKCw5PpOv
	 7bZklU09E8zJT5AhPdH9b5xFDB6nSGt2HgrIkRgGtgC9q334jWNHWODmXemK8ZHdeMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=CW5cyxUg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49752606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49752606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=CW5cyxUg
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e00eee27dso623712f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765969; cv=none;
        d=google.com; s=arc-20260327;
        b=jld3dbeNqC5JioPUMpoihMgxE8oZfbZdpBwuNn1crnA4tUuKjEJxeSzBucWfbEUfrU
         wqlbVIS427nj2jMVxleP1Y0uaubyITjAMNVp+79uFIh2KwWhDKTlQQ1sCymfW+Fd48Fu
         qihj7YZEk5hrkO83wGtx7PgiO1J56fqyNhYKsnoV7XS67P4odWZfzsw0R2nv1NTLLxJI
         axjFnp0WmX41Kaf6nQXjS01jpxLY+2JHca7BvKlcSjY6y90iDkzNcBDL4TJAPLI0ihn1
         uFnxUR8Xj4gjpJ98yhgA2oQERgGjPkyIQNL6vECIH43qDMrOFUSurflze95bWhgVaDi+
         9S/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        fh=AbH3KHUZ2b4XvekSjxIbKQTZ4pwe/7NkOzmbt2hM1dU=;
        b=ooqoILe+OTRHyNmSsI6c+kamK7A3nVBoUQI62t+ZlGvf+ofMK2DIKRiHHWHKCQtmtS
         c2Zi3DoFKYF0WsfI3OjKWJRlTAKDt5ed6AXlJlmEUeuwziK8vLrIbmTdPkIrQCTLOJ/i
         kBt+QW8VFnyxI/ThH0wVHV+7SFph0zldk8AhIGh2akok/98KD12Haordkm0KdTIohaTm
         7JFRLPvxbR/yArrDkpGdBiVdYnMgdiTicFtbpryJDSccytGCFozgWjU/Ex5gjwKMxHz/
         CHKz8iG0SWt4c4tdLjAzWsRbpjOBBL7PHNfe6vt9tUHAxUtv5yo4ttnONBqmIZlW+5An
         LNcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765969; x=1793370769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        b=CW5cyxUg+YzOfqAB771Axxc/ZQTVjSG578tVeQcnVRNQ09Iq5D8wRMk7XCBbNqwTze
         c+GqhhqYmVr9O4rh5ahzaDLEE91O7LNidSYja0dIH5rDXm4I7hqiGPMpNq2Pud3fqVYH
         P04LsRuk8YYsDq12j5+3GeL86cfglQwa8N+pz6a7xVT5p7hXuWRtoPf9TjwNrlqOsPNq
         4td8UbhcXNL8xXvaa+8mMdESrk9uX3rAvoPoDES/4ClvkDRXwJn8qzC2K4zuHJyV2Mcf
         351b/JhZFi8ikhC9OIyYwFwbpwzqIeI0M+enYHZn+BtqHQokd6q7Jg4r3Q12rw/50iVi
         vC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765969; x=1793370769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        b=Vnjy5PAlcSSrwvrIaOIJpEReCZurWuAuGLmdHMrgybsSLW396r/nHZ9O1WBQpvGXlE
         Vwfizb2LurcIo3tb9jETx04pShl3eAe/xHo+0P2R4GY4pzoqDU6ByEa7KdLCiYF6Q57C
         ZkbwAXCLc3aiquWatcCVExo5aK7jWqAqhRI0IxE51GuQHJj/4hD+J5Hp+dW43MaRKt1M
         2v6QZ/kQKxltIDcy16rihdNxkPLWTMmWc6RNSDTz2pIj3UyeRbgN77eRTsu6jNowpih4
         rmxhqvi3j/7L4niZQdKDSc4j6ujo4G3TEj2vJzO8xUUSf948j8SXBsGbeSnqTViT3uPt
         cxHg==
X-Forwarded-Encrypted: i=1; AKwUvBwQVD02yZfFsLqP1vPrYmptwCdbFHfrxZESU34Dbyo2Pc3UHakHYg/Mia5qGKYNh/gPeMZqvtDV9iNhkSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu9djsaIYnFfk9UJSkKTk4m5c3RSNQWb8ShNU7DIhKCvMaIdVr
	62GpGdyB+PpGNqxMsB0yhJaXwodoN3kFDfeB3P2BUegprV/C6OnkShU339UGP7h37IWqIFn8Kf/
	tIPz8J7lu8VwcxfAk4CQ/tHY1ItJs77qTYpLqWwnOjw==
X-Gm-Gg: AYBFou1ukNF5cIkIAmjf3CjIniCWJGwzHnG8pzHwo+B0hrM5hlG5QWLr625zyA8ABg5
	KtzgnyzDtzx09MI7mWx12jl5If41MToKaq/I4vj/q+o6ab1ZxUugY/ESP//ps8sOBDgDl5jWVlD
	ugKiRIJp7eaHRFSXI4HKlRAIPWia+iedJgmmnfPAkfRF8UWyg2R2dW9GrJc1xcUMO3fxR6PXr8e
	FCw/CT/SzSkvemF1+VMcH8e4Oy3rAAOjiONFIC5z+iya1/LJKRQ11sdzX+MEY3t3DWIEe/NWxjn
	xQZs5T5Pox0kQDBHKT5sOIARgkmp7fsfnbbIa2x35jHFReJh0pvirS4hHVlthS0RUbdfZDzlQN+
	T2cK4/UnXIIBKAvRS544I414r+oqFlZ8ce408LNvN66K0NFF/zwOg1ZKN8xP8OxT+zKgOX/yub2
	gaME0yaa/hosYgpOEaJqUdy+JpGCElZ+7OmbNBj3gEE71uqZBgxkUA9B7A
X-Received: by 2002:a5d:5f86:0:b0:48c:6f3a:fe30 with SMTP id
 ffacd0b85a97d-48e3859dda4mr4501759f8f.15.1792765968503; Fri, 23 Oct 2026
 07:32:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-10-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-10-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:35 +0530
X-Gm-Features: AclHuK-ELQwc782e_gNWzhlyxMyHtzq3L9uZbtZpWmLCC250qaSxVHzfJurC7sQ
Message-ID: <CAAhSdy0uq6AjzigiLSjTZEZ4JTOphcupx88Sf24kjBVDWB4new@mail.gmail.com>
Subject: Re: [PATCH v9 10/20] dt-bindings: riscv: add Counter delegation ISA
 extensions description
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 1:39=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> Add description for the Smcdeleg/Ssccfg extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://patch.msgid.link/20260701-counter_delegation-v8-10-7909f863=
a645@meta.com
> Signed-off-by: Paul Walmsley <pjw@kernel.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index eee65cf73d6c..24efd3e1cf8e 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -181,6 +181,13 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pu=
ll
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>
> +        - const: smcdeleg
> +          description: |
> +            The standard Smcdeleg machine-level extension for the machin=
e mode
> +            to delegate the hpmcounters to supervisor mode so that they =
are
> +            directly accessible in the supervisor mode as ratified in th=
e
> +            20240213 version of the privileged ISA specification.
> +
>          - const: smcntrpmf
>            description: |
>              The standard Smcntrpmf machine-level extension for the machi=
ne mode
> @@ -220,6 +227,14 @@ properties:
>              behavioural changes to interrupts as frozen at commit ccbdda=
b
>              ("Merge pull request #42 from riscv/jhauser-2023-RC4") of ri=
scv-aia.
>
> +        - const: ssccfg
> +          description: |
> +            The standard Ssccfg supervisor-level extension for configuri=
ng
> +            the delegated hpmcounters to be accessible directly in super=
visor
> +            mode as ratified in the 20240213 version of the privileged I=
SA
> +            specification. This extension depends on Sscsrind, Smcdeleg,=
 Zihpm,
> +            Zicntr extensions.
> +
>          - const: ssccptr
>            description: |
>              The standard Ssccptr extension for main memory (cacheability=
 and
> @@ -1135,6 +1150,32 @@ properties:
>              allOf:
>                - const: zilsd
>                - const: zca
> +      # Smcdeleg depends on Sscsrind, Zihpm, Zicntr
> +      - if:
> +          contains:
> +            const: smcdeleg
> +        then:
> +          allOf:
> +            - contains:
> +                const: sscsrind
> +            - contains:
> +                const: zihpm
> +            - contains:
> +                const: zicntr
> +      # Ssccfg depends on Smcdeleg, Sscsrind, Zihpm, Zicntr
> +      - if:
> +          contains:
> +            const: ssccfg
> +        then:
> +          allOf:
> +            - contains:
> +                const: smcdeleg
> +            - contains:
> +                const: sscsrind
> +            - contains:
> +                const: zihpm
> +            - contains:
> +                const: zicntr
>
>  allOf:
>    # Zcf extension does not exist on rv64
>
> --
> 2.53.0-Meta
>
