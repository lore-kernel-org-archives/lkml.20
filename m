Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792765965;
	b=HDBVyoeoDGgVO5LjMbUGRu4PODYekfqAENWXXdsKvrom1/KOSb0gKzfsQBXLo1oZUwKS
	 OPPFifUgCBCUCT7pfKc6yaKi0kfYJz4icCPWAeiLk83cdSF8X5qzBN8stYNKlY4xN6usb
	 NbdpDnHDGh2rkG2pB/bhTXLLHTQ2HBQieY0xADn4gvlqWwVQNdp8DGYLwMJTpDxhhTw1m
	 G5emovPDkK1DEysrCSHsGnTjRdXvO4HSRZ8uxEpjudLdUjjOokwTv8q8Hq31PJ/lDp+Hx
	 SRxlGlKn2ym+JkeShQLbEZscmb5fwdM7DDKe8+1wS7zDG35WgFpS1gxklsWr7BSz9tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
	b=l/LHQewC9W7rRmM2Bm+k0ANKzELvq6jwiI+c6DELZ0lmugFIQZ0+eHxh2CqMCyqBcp1I
	 iGceonEpb78ow9Lzp4IiMCWPoeSkG5O9gMg5G5r1C/FDI1wZZifIbLV02R9dMkAgKm6Eq
	 QoxiiX0GgTNbS/ckHyhEGu4Sf34VKbf5lkDISNyML/doT0Sf/N/h0CWYbgumfJaWmsgLa
	 R5jFTy9zthGadimU52dmUpdlXCp6+ZMclApoPN/0cNht9fykCpFuNKK6oz+CA0H9oG8tG
	 +Qj89Sui6QjPN/voNWlzcBBuqvLydX+jYsQznSE/R5vpomBhhEnQcd43J7S5eu1Rspg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=fMoP0H2Q;
	arc=fail smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D39606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=fMoP0H2Q
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df8fe8513so861151f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765964; cv=none;
        d=google.com; s=arc-20260327;
        b=E+s2ltgUrziXuiEOYSOCNeSkuqVZ9FMmHSq1HIn2hzlpUo5tXHqPA33qFX2WSUhEDy
         vgUbylv3EafufLIUwc8uqFieO6iV2JDX/hFkFzDPGWIm+LC3rndIZp+lIjBFW44/gXiw
         DkK063FUqslfPr9hPQMa4VCzHJVKxsg3s8YSOQqQqv3wNU3QTuJG19wDDtbJseDvzVWy
         ObOQWiZX1g9a/TsZC4bCvNaWzh/Vb05wTCbznoFs4xn/KMOz88rQnylfh5D6oHggOwOW
         PnTLeGITZj9zxP9Pl6nnQVnwauhx2LI5lJna0hSXbC79zydD5+4ktAfgkwbf+z2Yy/e7
         Cwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        fh=xQIJOq5FlXtdeqG5eYDspChFHg2oQMVF9I8R23tfRYY=;
        b=LpGTucz94lC2ecnjCxmDHV8Se/bhecIV258JwL/81inGfZOlCI74XfC4UV8+ngoLgI
         SdxK9HLWyuTyKNBxd2lKIP/AAJfjGCN1eQEgmJAgESGsxPAiWEY5E7tbO+dQKS7LslT2
         hQRtvkbAP6+J6SvP140FHajYOF7E6sVqRkVdkkjE6MaPH9OvVr+78TPR+/1P/JkyhXQI
         jsz5dJmYz0sy1hj1Eztx8o6Nz45yrEzcHVSpBmd0mpWcwpwD4dBOIQD4KV5S8Ng0C/IP
         mkCAiXFaBWYoxHTZBN4HSV8R6MmGPC1nXIRG/bRotUqUtK6UxTAYQ4dEvq7IrRfy/Xbn
         vLKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765964; x=1793370764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        b=fMoP0H2QKNpHGwuXAjxXuJcMZCnKegravDJQMVUHj9yyTWYdJWfi9RH5cgT/8IHBbw
         JH6R9bCShRqKMC1Xob78FUMdD9csZTPK3lnGW0TYplitrpeiH7/KMMf9vfaqtnrvs8HP
         mPxghVDeslu8gQ2L2t/dCSC1zClcjLn43t+UAGSS6/08juUKCRru7PnXvfVrJS9h2ggx
         5ZOmrbd6bsKgliAl/0viwgvGzIdQcYsLGb46QDW/UW5MMdzxrh7KrLydWGLMitHj5kU/
         mCWWPdnrvcVolsZsFjnXRKXlBF1/dwvz3/vSJYMtJbPxvnZuz3NlmoiIO66VEPwmhFKf
         5+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765964; x=1793370764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        b=Jp+Ynjm1VRwJ18kgaKJ+69DjZWZRl9rGC3Jnq7V+AvzMz5MRexIVEzxmv5vk+JmB1E
         T/YtLWsuT/zPvP9seYHz90mYCJFhXNw19TXFP+AnL6a5y1fBVfkfL3cZStFKdE0nc2nV
         bhQL00jT6KU4Obv1mIvDkF7z42d37/9m6u9rWAHr7iAHVbqdZAxxd0oNpVF2nHS4pBl0
         2tZBd3z86oK1Giz7zQAbNeNTeKChbzrt+v2cfzB3GzmsIwMwbvJvuETwQ7719gpClFTQ
         0G7JuqEh7fHAga664uO4hnNdG/N4xNa6jErOMNAvaHZMmY90e++wjCjBcFdmqS/KuTyU
         eybg==
X-Forwarded-Encrypted: i=1; AKwUvBwAFMoBhD2ut5jSMzo0a4XuLd1rbDDLcIP4GwBCzFINsGOq4a00HltYx0sGcadV3mF/B36AV4auyr2+vpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj39SdC1jrYFWbEKbTfswj91meNaiTarCNKS6yii/8QHHjvODX
	gxwtQpZzi2uygtmTY6kgovFrJ3ToenJzf9qpGbI3EagDfhcV7Ms+bD5gvznKMH45oOzZjMgFIC6
	82rBeULdL3x8u/8KhKl4iNqL8qD6hrfe2BupItaBZog==
X-Gm-Gg: AYBFou1Wue/nVVK1nc8IPHi68WG/b9YJnsO6+o2G30iGlbNitwayqBkGB05njV3soIk
	I3HDitHj6F6ALbRqK9Df/a3VqQG9oCBEfqRxiHFBusEvt2rykwRFwRDlioy4vktZvMmWFm4niB0
	0Q4IbgE4oK0X/XhzMS49v952LDU0w58LjyKDbZTrxyQZBjG944xWaBujzJxLONH4iqhCTRnWDyS
	aI2E7UBDq7E12uYuOrdeEDK3t8NKVzqDFQH41GqfoZr2/oyJj0eBLlaZOKzv/APN+8F6cmG/iCU
	K6MKQ731EnxLqgKlGpp4Tn79MS1YUgYX2k/SbDWUW7BUz27R5iUvNOuyKTapu9qEBZ8J+mYtElD
	dpshGGdtRltDv6q+baqByCENXDEs+m6reHgRoJTfmcId6T3pUfT8ug+kqmwog9e2jzpajHNq1Yf
	AQvlUrUf/9NV+LVFdM32NyL7hRM1Pzu8q7pQgoZO2Wzz/pASV4e/49EPmk
X-Received: by 2002:a05:6000:98d:b0:48c:7ee3:e07d with SMTP id
 ffacd0b85a97d-48e385bfc42mr3907352f8f.52.1792765963409; Fri, 23 Oct 2026
 07:32:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-4-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-4-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:30 +0530
X-Gm-Features: AclHuK_j5l_mLkVqrJqA4yovkMFdDFBB6LDPnRF9bN2ny94R09y2JYZPHifdEPA
Message-ID: <CAAhSdy3rxvq4X=AFx8ps9dSwKR6Rw6M7m8ra9PEbV42tH9o8Vg@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] dt-bindings: riscv: add Smcsrind and Sscsrind
 ISA extension descriptions
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
> Add the S[m|s]csrind ISA extension description.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Link: https://patch.msgid.link/20260701-counter_delegation-v8-4-7909f863a=
645@meta.com
> [pjw@kernel.org: use official extension names in the patch description]
> Signed-off-by: Paul Walmsley <pjw@kernel.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 16 +++++++++++=
+++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c0..ccff2be1224d 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -181,6 +181,14 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pu=
ll
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>
> +        - const: smcsrind
> +          description: |
> +            The standard Smcsrind machine-level extension extends the
> +            indirect CSR access mechanism defined by the Smaia extension=
. This
> +            extension allows other ISA extensions to use indirect CSR ac=
cess
> +            mechanism in M-mode as ratified in the 20240326 version of t=
he
> +            privileged ISA specification.
> +
>          - const: smmpm
>            description: |
>              The standard Smmpm extension for M-mode pointer masking as
> @@ -226,6 +234,14 @@ properties:
>              Profiles Version 1.0, with commit b1d806605f87 ("Updated to
>              ratified state.")
>
> +        - const: sscsrind
> +          description: |
> +            The standard Sscsrind supervisor-level extension extends the
> +            indirect CSR access mechanism defined by the Ssaia extension=
. This
> +            extension allows other ISA extensions to use indirect CSR ac=
cess
> +            mechanism in S-mode as ratified in the 20240326 version of t=
he
> +            privileged ISA specification.
> +
>          - const: ssnpm
>            description: |
>              The standard Ssnpm extension for next-mode pointer masking a=
s
>
> --
> 2.53.0-Meta
>
