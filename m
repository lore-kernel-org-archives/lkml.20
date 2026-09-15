Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3464A3F36
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483685; cv=pass; b=dlpco/HtdmJpED9JYdGZBAzr4Aimu9s9/ffUiNqyw0OhZWndsg0VJhdX9IKuEUUbJU4xY3RM2/WMpd9yO8ES5M1Gi9tEnGv9+GuCjYX3egBPoF3TBY/m+ZY4MELQOj0JHUHq+gCy6epKbfOzUdrwiXufjofYw6fQssJs1VOhLcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483685; c=relaxed/simple;
	bh=JB4dzeW0yCT23fi0FjS+30+ACBaQQqxXbdSdVPolKf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCfT8AL4ngYwTnMmuaxbJdBZ8XMM+3DWBx/BqrJ5O1sp2gSk2RLVZwg4pYXgXHmpWV04lHY7q1FbYC3GnUtSLHpOx+TJohMnv3gYrFQhfm5lh0NZbFX8/6pAOCcWJQBBK0FiOCshoZ8AIguyVRdG1Mmhe6fiSJYHgJ9wf3WmRbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZKXz3cT; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZKXz3cT"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso6583424a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483681; cv=none;
        d=google.com; s=arc-20260327;
        b=GUyXKP+0UR9HQyIDq8PcQ/o6QqbLelaHRqb6xjd2Ow5IiM1qWepGlvWjAeZuUEDKPW
         KD94aZIFJADPzMpsYYlGD2i8GE6gXjDIO5qy926h64RLYbjfPtwoqCX/IJrFWuHUnCma
         HsP8Ke8an3Omo39ir3WIHYS9oOeJXrIe7fBFaKmOeZ0dRKMYnf03o0e8nIEKbEKvj+xP
         EwOMaCYmReeBIVP5ML2ftOW8ym8n5NrcnuyzbEtuDmdojQ8/RntOMmYQBNnxSEdwSKoG
         p1WVpEZi1kyTqnlBlwry/y0rLmNenXx6Mc2DqtQn81zVgv2Z/7vfxJSiiRPhi6aYD4QT
         5IjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        fh=Upo3D9LRXK9mJ61LOIk+Ko70QESYAk0YpkIly6lJOl4=;
        b=L/kIln95/3coBM256kNMkb5DPZ28QlFlNY49f+nw+Xcuz/ekVD7mJg/SdgA3eUnsA/
         FIud5PzqvX/skOxbC25tSdYYaMCiuYnp9IL44+iXOUm9VQ+O1IY9kpUVoYH6g6KBdv1Y
         49PPt0/R848v8wODXvGC7IDHNb/6TYTsy0c87SU4Md06qYQGLZ45x1zQR8IIm4Lje7H0
         7MvfKOcY9l1XpKut2pYvMGqcMMWv7jeORMJ/QEtgM1dhPS3VOM7HNJHG4pVXgs7OGLUk
         ZFcXgW1slz68qqwxT9EZ0lsJtMXYvuUtUsrf6XEVcRfnUNXsEMuTTZVah/aMtzH39BNi
         z+YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483681; x=1790088481; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        b=NZKXz3cTotnfq00AS34AmyHOBfyDkhsvaDZXsw6X96vIV68mn5K0vhHL5CQYc4/LDW
         YviLpKo0WS5QZiEc0LS/6oC7AR98DYTor5endBqbkObnRvwl0x0NIIzCmWXgMrBf4kBu
         Y/59uPVwYi6o7jl1C2EQUBpbXij/A0YxnukfY6iFPM8BVFFCgL80tfxCmYjZWYe/vb6w
         jOGII2D93BB0EneiKrx5l5jf02NIbjugqvCDlMV8u7V3iKBLmfntYYauJWtAhY9QvBtM
         oPAIA2xOTiRnLR0F7nOrDx6fzqV/yLFPjGW63iVoz8VfQ7hF1jVa8Pswogr/7JPj9b9k
         2ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483681; x=1790088481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        b=DDpMEcU7a5H2ranGouUi+gJbeiIcI2/wmLF4ix65cKWhcSSRWZiaFiwvidM1jk0Mo6
         +w88jg2F4JT4SiDnlAG0H1h4tGTK3ynE37N0aXERFQE/LCi3r5fd/45rdy1dfXC3CrLz
         6rLjdaKgdafMFA16/qpLy/7/9jmefhz8AOfFL/xg+0Kw6FudGM79Zgguz0huEdrxgWwq
         KOjpnUlnk6pwwgKwiAjw0FwVaYhl8I2WAdD5SRHLnO84aWbzjY9kdY0Rk/k1XKz0w+j/
         nAe2LDQFVgaPQPA/xSQF5K0qb1YaSIWLPn5DbDnIyCiy2sQSAWyHtny61SXAzGaLg6Cf
         Gd7w==
X-Forwarded-Encrypted: i=1; AKwUvBxrIzzWWmktwYfS9Jbbfj1Tq756K84u1AzuXTjg7gIwR1nm9ypIZYtRQJieejFfpeQqiTVWLkKs4Z5uFCI=@vger.kernel.org
X-Gm-Message-State: AFuF++k8drWbLVGpUPTTg8cS+CslGjV95Sf5K1yESc7LWe9k4wq3ObbH
	QvERA5pOclkSf3BAMaGJFo9Q/ZcFtrT/a1aErWWE1VUsBPJp5SClvh2edBIG/4bslYKtcT7LieX
	RWAmzdMk8SI6gpO+OQc6FYvshgo7FvA3QehQLPzMtug==
X-Gm-Gg: AYBFou0RkyjzfiyS0CEmjRRzZBzoPl8ukNL91V4fH1EEOowI8lfyIwgCT1EXxNnaJL3
	fRsfWKh8h9uitMrY6SjHGd5P7elNqIPZcuoxF4LbUVoFAqVhKC9ypMw0rErgtpV/P/WcDjTvMyQ
	1RPgGL4nctpYTqfw7XZzLZfE1OL1fmPWduZzfmU1sWrv/kQAKIB5DLDe3wqkynFztnXUofSy8dV
	GE8cvSPOxO3yNYxOOCa4/4dfIlaoeQVzPhYwjpoYKa/9iS+/GrCKBaJ7mvz/rwsEC9YzYDmUEQA
	dM00iD0msMLMqLjCltGwGnHBRXem4uGluiPzV9i8b+nUVz6sJVEJcPWH8pCQNmDmUiXJ3PWleC+
	h5qc0AvAAJQCQCtLGFVAj4I8f
X-Received: by 2002:a05:6402:4404:b0:6a9:98b1:6c36 with SMTP id
 4fb4d7f45d1cf-6a9f63e0d39mr5145656a12.31.1789483680985; Tue, 15 Sep 2026
 07:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:47:49 +0100
X-Gm-Features: AcwNN1WgvUO9gVcyHHtQQpCHP6veTmxEFNeRoziGdiQtPJVZo1SV7WyKK3oIExw
Message-ID: <CADrjBPr8EROpwaXsuqNBgyiJV5b041poTKzFRfrx-rCvH1CyRQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 17:58, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 911643008b9f..2128749d7647 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -176,6 +176,11 @@ soc: soc@0 {
>                 #size-cells = <1>;
>                 ranges = <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible = "samsung,exynos850-acpm-sram";
> +                       reg = <0x2039000 0x30000>;
> +               };
> +
>                 chipid@10000000 {
>                         compatible = "samsung,exynos850-chipid";
>                         reg = <0x10000000 0x100>;
>
> --
> 2.51.0
>
