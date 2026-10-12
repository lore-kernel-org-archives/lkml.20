Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33A25B099
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768915; cv=pass; b=GMlpyeO9NiyvlSm939GkfcznIbJ9KdVCp0w1Y+AqW4gvZRi12Cn6/i8v8zAMGn4Qb4Ix31LO1Ek3O+uBGxlLbnZ/074qtNgP2v/C+/RcElGa328wifVuw/INabIHgBPST4HJU1FFfAQONfOsNbbc/T0cmY7YmBm8U3/AqU90UZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768915; c=relaxed/simple;
	bh=PMRcSohxNKAPko8/kVl+2WR9uXa15ypsNsERd33VxbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ja9Zl5Np1erx4FegkbRMDKg+EmQpygVjmGcfuBt3DQNjs7l+gLCIWQBpJh+Ij8t7UPcMygt0jJVPJS8sEXv3M6yIBd/1n3fzL7BJsntZtj6+7S+bfSzjeCOGdRSii9IDIraiWzswpwSxWMjDVCepsudrKWjLiysoYiCmxM1drDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7XNSEHi; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7XNSEHi"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so1099154a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768912; cv=none;
        d=google.com; s=arc-20260327;
        b=alQYZaesijEWgr8z1CyN9K1IFll2BpO1T/HrLW1SKkcdArVZUlZqFctENOuBrmfNAC
         6khIzEiMW19yjp/3KILGYWEf5Q7KtAK3fNDH6TF37HdDAqqPiOKfr/HcgAjCWXd3ZvrR
         rsTgeD0V8iM5tG3zZpz5eTd7bPpk4xvufDbrl/sk/uYvP3ugIaMI0PS5RtRb6jebVHSn
         vwA54tbKeoNcVQvax9GANl2nIIehk1gZNiNKKXvTTXoBQx5IAYS+CJ1wOA9KOQGj9quq
         WTuw09ts6XigWASYl+OYO5NJHhVTXBERNRBICzHwFN2cUw/vRhzPs0zfd1YEcGhCikwK
         LrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p/kXiBrFeOBrXAt12DfB2NBIwep7UPRa6DIr90jxU4c=;
        fh=7s0kM3pazuVc1I3defXS8ot1hkRgWUcuNWKe8z7okCk=;
        b=lZenoemjOrYHpYKwzYQP9n0FX3sjiXskwRrLkPQhaA9HWYG3HALev4lk9Xiy7SgN8n
         bS9ArDK/3n3DdAkM7cu+uCvkbNtHWGGKRcoJp5rag+ohbQ3y6pSnz3dMU+vC+RS5VOXD
         xQ0SGyRm5Npxz9vCV9ez9wkeTgdgwM1vDfRMHFgoH9XxEXqtAlytuseQtt/gBGrMVSjo
         +5Ig16tuz7V3Cz6j/h6KrdFa205Fe8ncr9Vi2ZCYnlpqTcdLivrZrLu2JPn/hvmYokx/
         2bDpZMTY2+SyJYaFGyG7apOlgyDUaD4uSJ3UyF2v/BCUoPH9VV7UaujO9e1JCcB5qjiL
         BKAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768912; x=1792373712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/kXiBrFeOBrXAt12DfB2NBIwep7UPRa6DIr90jxU4c=;
        b=S7XNSEHiTZ4xhvGn4cxN96dhCK81xL0SCoBh/5tXeDQlyMUZ6Oh4prqhgjzOiYCcaZ
         oOtdK5icpo+ECMt1lCdi2veP7MxUMZo52aQZHxvT/95DJB6s5GW+cqkc2E6pKquj3Vd+
         pILdjbP4Mi4SqTnplQy3uapeQ0Llv2kXLNQH55vM3Y9W40KvkQC0GwKHKdjzESaMU5lh
         HzgZy8j38kXdZbo4vMTh/eLA/f13QaQjTE+zx4/r4+xTkaECSkVLN+E3S3Y4D3FKVy1N
         9wOOemiGoprhiMS7VRbg88oeLTUEkxMjBow5ve+AZ6iuN3fqxh8bT/Dsyq6NqNtn5fea
         1iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768912; x=1792373712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/kXiBrFeOBrXAt12DfB2NBIwep7UPRa6DIr90jxU4c=;
        b=mDLZZ288RX9AsUgiL+QZU4pwQkGK7wxY2XQMRSBH6K1ls0fGKxbQF+a7AnbMTGxi8c
         7SmyjjOqOBjniIB9WXkMxxNbqmI4SevoYhF+E1N5NwXGNnmq2XEA4dpnAcqAgo7K4+bg
         xrx+rBgkTSmXtBJB02JqwsgTDchB16Usz8l6Pfine8bazm2e0XIu+BGMk3YDIExOKk7n
         QlVvjQMrsngcGs3ZsiXaPG89LBPUY8h/AVvbzmWJPsK0O4aQK/dsAvddawN9vIMi5wjR
         CPoVqmSXjYOzlmFyYsWM4ZwFB6MXrrGNVXMoShIdAFvtg9Bc9fcRAE1xcKup9BPZs+3o
         +JrA==
X-Forwarded-Encrypted: i=1; AKwUvBxDxpMtzC3DkXPQvFnC4S1kLo6/sIXgejcUJDYzR7Rj/xyAIFJ+u706kf7/HxWCaqpyXALRRlc7lbM290k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcxDKKyxIlTsyL87Zt6uQjnPzHws4csc2G8ewUt27mvEVeBpvx
	Gell1ufVuruB1Xn3e0vGerWbMc1/Hg6OnQKwy65I1YyqH40YBTrmIvGh+YWTI5TL21RfzaRjq1g
	0v/u2+C8zTonU2O3MNBkv30UxjqZ7IzA=
X-Gm-Gg: AYBFou0AXmmGVqk4vblCvD0d9HN8Lw7YHDUfOw0KugB37h+4AS9ePElM3SWvOZQIKA9
	QlZjYpMpEckGjBN531IW1cpC8Lxt5msZf55PxDCSASGs6ryx05HxulwCQHABztZWfCNvG3TmOY/
	wZ776PGzBshPhiF6MkGgkCNkg4y5mRAb2Aj2wj5U/iqCa30jCIVgNozJ//BZNQUCMC5AwI3gz9R
	/03oC95sZSqGzJVDJD13gnzECLYRSDpzvRJX2pN9lJAS34R5eI6vXETmG7TBAAwoc4T8BiUdaGn
	a7uxhV1CSO/YACI+AKvtcfkQxgEf0jrsCYuWgpb7rrOzCldcZw8uH04=
X-Received: by 2002:a05:6402:a0ce:b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b1bb19e48dmr1653193a12.25.1791768911701; Sun, 11 Oct 2026
 18:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-apcs-v1-1-33087bf44620@oss.qualcomm.com>
In-Reply-To: <20260827-apcs-v1-1-33087bf44620@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:34:58 -0500
X-Gm-Features: AclHuK-wSHQEHwchdDebJ1vxNqwtw8jXYVnXM3lFwyE-VJGEOVOwBXaUkTBV1ZA
Message-ID: <CABb+yY2XUPngcEVBoT_pQGgGjYtjD5iWJDMDXJKCtq0Sg+fBVA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPQ9650 APCS compatible
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:18=E2=80=AFPM Varadarajan Narayanan
<varadarajan.narayanan@oss.qualcomm.com> wrote:
>
> Document the APCS mailbox compatible for the IPQ9650 SoC. IPQ9650 uses
> qcom,msm8994-apcs-kpss-global as a fallback, so add the valid compatible
> string combination to the binding.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.=
com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index 39bc374300c3..11f4aaf256a7 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -39,6 +39,7 @@ properties:
>            - const: syscon
>        - items:
>            - enum:
> +              - qcom,ipq9650-apcs-apps-global
>                - qcom,msm8998-apcs-hmss-global
>                - qcom,sdm660-apcs-hmss-global
>                - qcom,sm4250-apcs-hmss-global
>
> ---
> base-commit: 41243c778cfc83f8d70600be6dcd0c7924603aa8
> change-id: 20260826-apcs-43612991b1f3
>
> Best regards,
> --
> Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
