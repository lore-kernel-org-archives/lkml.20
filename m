Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA4D53C3AD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077353; cv=pass; b=oHrEam+pbwE2RfHd+nDii1DL2capTyNjcz1K3hbSV9FW9LZnF48jtAfSb2CHqrFMKx20SXQnlhk7W4OxWj8kRWHusbwwQKWsjrcKmBZEr65dZeNlJ4QCm+Fw8GzqdxhjiL/zGmB+sk/tx9VkwYXR27EG62KZ4LDNQegrgyhSrxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077353; c=relaxed/simple;
	bh=IH6C2ITjynYuyHLytAInZHJ667Lrpx57dguMaAwX600=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8Zca7jGSp9DUx+/1aY/wH/OxwsROUySMEIzKCn/THVgo85ucVniQ9TpAX0NppAOmqL8VS/Zb7CIElm5AmYFpAzRPFytKLiVZTrNGPqlPzp84Gw9Lrw2udwXP+SiUJCRi25iGmmBqYFLQ6ta4oz41GhzdEfVGoqZTw+joQQqpvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKnu4UbX; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKnu4UbX"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2788720a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792077349; cv=none;
        d=google.com; s=arc-20260327;
        b=g37zpoNVmW7osqduroWwdxFm9qHS+F1kwC5cHUJ2b8txqEOmxXnLf1bHx/eaBGxZPK
         9JEwbpO8FGzl0Y3+sbIaeHGMmQOzrPfb9WVPCLgJkRUcx/pRcSDdZeQ1Jf6C/F2Z5sWt
         hwg6J0hKyeXfuH7MMvJ8hOL9Wqlsy3ksG3ZftTgOGpa24lA+J59nIkeqQsepYDokaBOU
         z1r0fEmgcjGcopARuIrNoCLQr2nOSHizc8dSR83qhRAErf/V5rj/CRfE7QVnS+4C8YmJ
         DnjETFu1XoxaZIfACikPMP02YSH1PdK1u5EePeUbk+WAZQfjt7Q3tPJFHTl9cvy5eAXH
         UlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        fh=T9VkBnQC5OgFutSQkUxCsbd32vzORmg7Dy2ToQYGMMc=;
        b=kcf6Qqv0JDgIp3hp/IHEpgUoMGGhG7TyIKA4N2ICjYOZFi1vLIhyHA0v9UGaoWJsHz
         qqHrgcEHY/6RowDF+XoaM0DdfMDkQkizswpPShfMRHNWv+KtPWBrdE//LeKawSJMYAhJ
         NDSBBkdyUTQmMLwsihesTaWnt63LgPTFddFQgTEgyfR8GyjQFlD24tbn1GyzM8sngOMF
         YQeGC62aIizd+S5bvAaoTeUEA4ubXRXJHNTJ/gR0Wz3NyPgD7wjsDa7tHnwOKCZzNXfA
         r7TPd23oa++0ZlJ3EMrZAvDK+EowWfOr9H+9twc4ATeiGXD1bpkTq9aijq+A8PK4JXSr
         JxNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077349; x=1792682149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        b=nKnu4UbXM55FqTwsXsL5rqRbhxYX57pXWxdWa1UIfw/Csfnu/EABonwqCW41UjrO/S
         PBC8cak+s77RlztOUXxE0XyKjCDRZBaDuFgLcfuMpFXYXH6X3LnIUoZK/S/dsCQMGDTt
         DJ1nkmmtzlF+s72190lS6CJoMmrXM+kP6VhRyIKVmF1eaSf7HuoksALVwaHXZag9tbIc
         4NaavsXfG1fqgEbIqqPfjb/Txg6crHj+1zmHr2zHrt1s8mntv1AFLb5IBO/6kXlElJea
         QJnZyePcN4+yaZ2edvoUtAbu3NHu7uZbbDNTAs8Mh1AU2piH0hpBAZVpLGvA0CIN0rEL
         udJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077349; x=1792682149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        b=dWJhpK8DuCQpwvUb6xBFyMOOOX/Rd7D+qBMGy9sIn15SRzw/xOqieB/hV4kPSFzlT2
         95v3g47F8V1kKzWifmVXNKc09l1iQfqF1CsVMmXZ71ltwykgDnxngK+rGnPVAPzeC410
         T5dG4DJcvGgcKD3rRrgl7QfmDJDBodgQvwIWI6DAAUeLrGkSf/37VbCrKc+4ziKonGX+
         56U+jFT/C8aNotHugUzPMIyBhS64DVQksdRLRXZXHtq1k30XHiQn/Xqk+Hl8I/ZC0wxo
         fBWHbJRx6DrNEHT05Ya+XFprE7nWzVT49FtHrPVvXHVbT5Etimpwykf+vc0vLXupMVWO
         t3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXdXJ4nWR+BbHzK34bO5AepAMgBzDpwy2XW9kkBgcs6cbTifeQxMr3URTlaQc3vSc0Jybn6wIYrdUBQ8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZOP8B3EXFOl6fJNmgT7pn+0fbU4MYOp3+17e9bcJas4wGB6bg
	mm2z/WbY8K916AAr7lj6T3PKq+PQy/2+/zh4uNpcJz/eVm8UG0fb/wX4jKZBvKXVJLAsOomn7/C
	uMkHhGIGZ2M5odT973mxUJw9DmBMhAZw=
X-Gm-Gg: AYBFou1gf3vXBH5p3C0huHZ2T1oDUsa53Rn5f8ePyc0G1DzivLOU6BPi+woVGNKOjR9
	QCuaygqa85rYccKOnxJSmN7mHhjoScnfi4E7h7OBWFllfr+r+H9XSQLFXaduT3V+7mvR3B5FLeE
	55/AYH+aqEDC9QMNzRPJggBvo78ZCvVUypGXGgX9KNu/e0y5AKXDgp87RGzFQ6LL20Faqfbx/0I
	aoj30UI7PpYf7ssg6pb/U+6yOdPoZ9/cKked/spGT4NVHBaEtEEXHAMDljO+DOwMi/dThPXgzNE
	WdKbkjkCPDPCAFgDRmsL4bbbIO3Tudmgx/FKBhmNw4acEaBKHQcF1xETSnogFO9glq41diQEUjx
	aKdUY5aT06Kg4Fic311hMl12B3fl3a79cQ7gv7ysDQ4Y=
X-Received: by 2002:a17:906:c155:b0:c2a:d65c:c194 with SMTP id
 a640c23a62f3a-c31a9d56761mr1838328566b.29.1792077349343; Thu, 15 Oct 2026
 08:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
 <20261015051926.13752-5-sreeshankar0910@gmail.com> <179207236622.28934.8455006218721757519.robh@kernel.org>
In-Reply-To: <179207236622.28934.8455006218721757519.robh@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 15 Oct 2026 20:45:36 +0530
X-Gm-Features: AclHuK8CtOHEeDeQkZ6GhBte8PNJPOJgXaJdB95NIQjYT2X3-p2J5_V6n9AGVI0
Message-ID: <CAA-+uk+iNj0TxAkUgGSHhvBjDf7_EO_q9Zv6N1f+eoHBJf=q7A@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] dt-bindings: interrupt-controller: qcom,pdc:
 Document SM7250 PDC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, davidwronek@gmail.com, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, viresh.kumar@linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, danila@mainlining.org, 
	jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org, sboyd@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org, radu@rendec.net, 
	robimarko@gmail.com, bmasney+clk@redhat.com, rafael@kernel.org, 
	tglx@kernel.org, mani@kernel.org, linux@gurudas.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 at 19:22, Rob Herring (Arm) <robh@kernel.org> wrote:
>
>
> On Thu, 15 Oct 2026 05:19:24 +0000, Sreeshankar K wrote:
> > Document the PDC block on the SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Applied, thanks!
>
Thanks,
Sreeshankar K
