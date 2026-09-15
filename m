Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A3C48381D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469046; cv=pass; b=FoCq6I6qbV6PApPdan6GQaxNuj8XbXi8215FvenR6b8L0X7Ed4/02qeU7l6y04xowgNNHsV6VBdgqs1oic6bmIA6aS3YvgEKbPwFkbLAXduyf9PgVZakjzf0ul/pepJI7e8SxpgvS4btJY0V1mcnGDkTvtzi7Ne3uujTzMmA1nU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469046; c=relaxed/simple;
	bh=BC4g6GYfVnAJusm4bR/i3m2jTHJwUGIeIFQs4VGY28s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaLjGeZ4bh7oX4zINdJYDc4jtr4fmtlY1ZVtp3B2tbO3uQASXiXuAJXG56Gn8QOkdcM6ZQEFihihGzbet/rIxQQqZ1d+m7wPG3GV57picNkjcDWapn37rP9ck+sKWZxXSEhNm1UPdWTl8UJea4+Hn8RngXsl38UiMdnqJ6AKpmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sujRAyas; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sujRAyas"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d20963so78060b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789469044; cv=none;
        d=google.com; s=arc-20260327;
        b=lM44lvaWorcMYnKaq61WqYgYwcxZQOlg7UycYu9yp2V9J8jSEB4X9m2dTQE7iAveuM
         JbfWTNPn+G4kICgQl90U0wIBZON1xQMbi4H6Ans4/Cfi0lsWXjrRWcvP4M+zfZeU1WS1
         B8eSPVsf/pWV6rM3Wb0bFvbq6KYnlENhkgRK6/QlTgrc1nmwzpYuiLuqqacr7fKbl5JU
         WB5myX89ursamWIHDZN5ThezSvMkXDFOK0X8iJb5Tr1aPVSrF+Se/4glBEbXPJb26gUX
         QUKQhP9zpLfqYoWE+NT4qKPirh7xw8GtSABRvcgvpAuMEiUGPW+H/box77zSGnb8pVZJ
         DAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        fh=Ox00sJCi+S0DPdQbmKL5t102ausN1/G0phbhgpHl37E=;
        b=ZFdAUEllWt4A9JH5kUFvEErdrNuLGawCmwOosMTKpqKVEqSKSyOD9jwdXcRyfDgiUB
         tsPL6lFextE0kcgQElELUKSRviRNdmvilMplzon/l/9+zp/dG4Pi4Y8kGfc0buua095S
         MWnt5ijoJsPz4J7D6Kw5iODFZ/RnUfqvWZCxo2yE73s8rq6PRCJOJK62Fs7//qEnyBnY
         my05ZcH7aEk85ITs+iyamhqP9XVrJyNMdw0RiGF7eHJCZ4G8CLiab8MHfguj2AzZJ/Lb
         gFSIcuKUEo1lLJbpxeWi6pkR2TUFNSISC9WkwXZspOgrD9zZwWr7tEWZ+DM9I0HXlktl
         Ck6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469044; x=1790073844; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        b=sujRAyasZwRzpe5lhMm0L5AbsV9R20Jxr/mtSd/GiKn0ObaOX9UlaRNkhKkzZlJneZ
         QfdJd3wXOscB3Oyh+7UcA+geYBsRFZA/pKQOJMtIQFapUw4T+DGokZp8oj9UX+X/18yz
         nw+K8r3cQwc4Qm2G+ev/E+EnlPm6PQuKYgLJv72OFEh0HdedBiR6b6DF+FbEcfepMXSE
         KQaofKxr3EsX3ZIq43PXPq6EnTsuE+QQoEHa7+7bQrON0y1uH5sH002aD7y+asQI7C1n
         9s1Bw9R2yMJl1aYd1sex7HKVYUToa57/A43Nunfi9nxrTWAkQ85DtCGWM4+FhcPnE0YM
         87VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469044; x=1790073844;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        b=0pM4pLZ5BkNfWwFCSJkCwLoDNHLcCEu8vxtr1/QEqs02xZptlQapurwIyYckgZ0NXV
         bk7ks5g3QDp0tP9blhsn3EZZjhPMr5ehAgcKV3LTpZ1jLVH/P+bvqAJQsvL5v5zHYs86
         1UoQZsoHX3o/JIA2J8utKtopjB74KQrzp2qAhblLsrX+WaUrX5nvsQJLZLTCcY9RSIEl
         6LJA4oDJyDMj+4nsrltkjbRL8fiZJZU/4Ax7MpWH0OxplxwANrDh0xMf8ihzTDdC9rOM
         XK7255yhpd8IoNBvn1dqYuXhzAGl2TOjPUZjQtelgJvMXiVpkzaxCFtHaCOvIxL9cwry
         qxhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFKrKpCxyDpGn0Nihype9CPIPgZaZHgywOh0QKVDD3RQGhVfhkNDJyZ8cHSBPQSgpWk01ewDki2snIHbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nHLfw4Kq4uYj9hZzUl9ioD9tMHU1npTU2VaVVJzKXPXuDgwprC
	KhsY0PCB8rjbWtaanzPZN5q7yYxi5BqnOo6nD2rLr+HWtfxNbxEbiJ+6c2kj/veKoeKPILrtTOe
	SI24zdiKf/zuzLoujE56vuYd/z2XKpXA=
X-Gm-Gg: AYBFou1QwcammaNNJH6E0ApU4EGFou+7+GXhCVlidKmjwPw8lV9j0aIQ9zJDSjbZx3e
	a11ckkRn1n3VZeS4+ebBoMx7QnHMt1/zf+PH9zv/fhShLCwG+FJ2G0L3nZR00hOV/8d79HlrqoW
	ZQ/gW0RolXlEQuwP9qXAQnIhBANuM1bK0FjBWL5Vhl/qGA88XW8KbwRZQQ1pD/7GnHFk3LHK/4A
	L977Xih0aFdoq+Lj+/GDTINY1nHwNgup5HKQDuQ439VDxnk7lHCN2TjaGQjuYKSh6fLsFrdOttf
	1+ud7F9fIw+2Olh1l0N0jYJeJXQCQgWT2uTnjcU5t2XqRM4pNBIfbd5fF6Hu001rr8GhMtzZpsr
	Ijp3lxK6kTHDh2h7KLlwet702FfBwxnzlrEUdBPUw00T/Kz8fnFuEClGPsIFUk7umeJA=
X-Received: by 2002:a05:6a00:4b0f:b0:853:59ed:5539 with SMTP id
 d2e1a72fcca58-871802d02a3mr595616b3a.16.1789469044380; Tue, 15 Sep 2026
 03:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com> <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
 <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com> <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
In-Reply-To: <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 17:43:53 +0700
X-Gm-Features: AcwNN1VdN0Kart2_fiEKCb_9XCui4hioEfW5Bf-MzLe9rBW1HbK36VRqiUYolUg
Message-ID: <CAABR9nFHDNw=9WYiQM1C-dyA_GDr+b22w_SCmedzLJNgFOn5=A@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > So if we remove this part:
> > ---------------------
> > if (!afe->regmap) {
> >          dev_warn(afe->dev, "skip regmap\n");
> >          return 0;
> >      }
> > -----------------------
> > from mt8189_afe_runtime_resume(), that could actually trigger the bug
> > we were just discussing.
> >
> Well, then...
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ...still, please check the other cases.


Thank you. I'll keep this part of the code as-is:

--------------------------------------------------------
if (!afe->regmap) {
        dev_warn(afe->dev, "skip regmap\n");
        return 0;
}
--------------------------------------------------------

Best regards,
Phuc
