Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794172016;
	b=0ZfWf0+XNjABqYMvoj8+ns2MZ4Jl/1Y3iY4x2AqHCYvenDbIy4IF2gvKguXmu3RhKi+v
	 gStKRvsmK7nepHSlHqd6ZyEtLk3MN7bKc4eBiXzP+aDKEjXif8NXUYy3GF/lPaVb6a5xt
	 tVgl9bd+/z8TsL4frcAP4Kqmgb7lP+j63F0l/xIcu+ew15RTtj5/mt4fvJ/HPB0wbukC4
	 45HxI4hhWyUF19z2u7pvTo2AubUdizZXDAERBrPh3d6VC44NI4eTDe+JF68fKXmPyXMfC
	 OtzpRzRtjUL9TSBh/S7ZhaqxUdHBiTLy8UMpZaF0KhrPX4E+ovYNT7EgRPKzItFkN4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
	b=v15v+UhnXT1ktmrTxS22lmjXDsaqGWWrtVSG8g2jXsYRCscU4/MzEhJpHX+/9USdNCLw
	 8bd6REWv9pG7vLI/yvku4J0XERCIKOxVX+7KhWSyV77GH7fL3NPF8geRSu3R9dAX3Kpwh
	 h9berGWqV+li+y+IckBZSA5s6uwgWSx2t9WbHcgYx8ntHzPHqWtGyT2wf/49K7EYWKPz7
	 TllMGusKIrIoDXkpijYWI0HookLz7niJQKbnUf4RQbsTez9nn50oidJ3DKqjysLRRqGvZ
	 5YTb+x8lB2O6U3JCZ4Zj9CZg5tugctf1bYsz4+aDO5OuyF1UQcEXO8GlTq/g/KhDnXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="V85/hf9u";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A71606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=V85/hf9u
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677af43eed4so248202d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172015; cv=none;
        d=google.com; s=arc-20260327;
        b=lQ7dmwoCrzed7XT7ri/ubgBMjZwJPhHSLprEgQV8QWpf3qquHPvJD/TuhTwMZ5gBaO
         VBxP6dI8a0kHsIEjIII+hSZG6JesWJ0LgLKpLeljeA0n4y6DTARPcimqqruaIDypAOsK
         +zCqlbRts791c2UyL5rySkDeWoXwHMkBtaEWGisFXcV87bmMMVcKM51xNgLNsT/SlsZu
         sEwUicgR0g6PALGhXHIu0vJNb0Elc4yqsG39UauIfkp4+QgBsHeeCDrxMHLmEE89ux9p
         Uabyz0qV14FKpHzJVU0cRKERD6hEnXO/k2ZlA7ZSbhTfFVWfqrvrG1aRwbVgsA+RJW8p
         gm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
        fh=ljAr9VNboBFvnRcCx2VaDA3+kh9fBwxW5PO5UeLHCiw=;
        b=FYDe9wcAZQOdq4vWlh6oxNxZRorJtnsoidRlyzay/t+sotZ3kQ4WVbCs2CCO71R6By
         m/Fy3clOLr1z3CTuJF9wqRL9GC4PnK9NNaCo3I3IWaSyY+7Rsj2rh3ozX288hRlMSCsC
         Brp2skmh9yWsrfiCfUodT7loWKu4QmKbzhbmm17387CtiWse7/hhd3mXsPa573i6VOCe
         8H4+zuhdAYUpIQDNI0NRptMiO0awEd24/xW9W8YSm4DC51aLlTq1VjTfyGvoabX/EQAA
         Cz7C3+32Ba9iEiGd4vZHPYaoNvdj+LhoxZpGXiu14Qj4xVg3CpYhG6Bwy1V0PyS1aOOY
         KDpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172015; x=1794776815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
        b=V85/hf9u90ghx3A7sxECxUZhOaH7CbQg4qo/SSPFUlDdIJmrmpQt/ivx824AWCa2m7
         WefO5cXfAq7GVNpV/oYsMnkWobgtB1pH3jf8nJZECc5zkP2wsCB/shZ5JXAXF96tVDL8
         YPA26M3Y3aGoDk1DplbJb7fRi+wdme+tC1Zk+t0Og3Y6AAlS8NX4P5S+ktkwAv4Yx56F
         5yVmYZ3GAuFS/41zMprN9oP1IhPKAOgHhkbXpLVFKPf1XJGGLNFf9kf+q4TZea+xuzqj
         1fpihBNTIFn4MXblf82TptOvEugj8jT1q1hT4vxIV7Q8vvIrbmEFxotXc9tDIXOeP1Hx
         wnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172015; x=1794776815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
        b=uhoIpyGIHj7XWNoGti272o8REJ0QYCfvv8HdKeOkZsYjxG1TyWEN8Wn+OcrIzPLMse
         QwGQ+VtTrs0zLr0suidw5ZpsQA5yFHuyh5qj5ec4Z+2JtDDbx20n4NaUYGizklJz+T7N
         ZZeVmXMUSnvQhT18VGohZ1YU5IGxT3KepS+iMQWYK2ps54OjllPjrERr+KWlIYZkBBb0
         Q4FB7kilpFAQXda5TVxZm/f6f9QTB7a2mNFtZrfNMaayNvz/FAHOl/FFrrtNM3eVyPxF
         AyelKbMNq+sJNDVPmaJ+c1nNK4Twq2CnZQ4SX2gOX+vKLbJNB7uJkoVIY7xlyAgT6Xrb
         H2Qw==
X-Forwarded-Encrypted: i=1; AL+hErGXpzPgeoaE/XbaPonpJpyzxT5yEFJ4em1QsJrKYX3cvu7IixPrgOMFLO+WKxivi8HLkw2vQL8z31inC7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KZ9/rsQxnW8N+nwgWmd6aF7G5Q6PyDzV5d7HGljfE3P9PjSdd
	8aXtkyG3crbPOHYhWpwaSDaQWOq0NxjU8VpqGCatAnOpdpowZXIQvUEbxgptZ04kVaHZQVhWd7c
	DdpAWrfrnpczHuB5IS5xPF2s/3egCv9s=
X-Gm-Gg: AYBFou3nrrS7HQTXXxQZ1yztJwCQUeO2vMOMRvgPLBp/wStOzU1F5NY0xb9iCcTicDN
	Hvww6qgbJbJcFgMFeIc7XHLWreWMLYZklwWyUidNJ8vv3aYQVC38OvwwXHyquZ7On8sOv+alv3q
	4y1hy2nyuUQNIBW3VDJIwOOHR5+ydtKDN3g81IXaliSv94JzUXQTNdOFbUCl8roNTUzkT6P/X/4
	M8YxsChy8RMuEs9Fuc9uJ7X2g3tP+kk7vOsYiVdkAyYMeBdbbuuGV8jrqOUDPCqcsPsZo7bcOsK
	Ephopkw7YiSk0AJZS0HyUGeOsABEnhzIAHdBXEa9L+wA+/pFvad3djhAnOxn/jd8TM57SNH6E3v
	hOOi8vk7rUFoiYn1Bh6iED+k8MiSY/1nXUOOs1O45+jQMk8C6eEi0GLkoe5g0Rr2QPoq9wg==
X-Received: by 2002:a05:690e:4084:b0:67c:307:205f with SMTP id
 956f58d0204a3-67c3d9bdaffmr1517575d50.50.1794172015392; Sun, 08 Nov 2026
 13:06:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at> <20261106101913.46664-4-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101913.46664-4-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:06:44 +0100
X-Gm-Features: AclHuK-74c2fIbgObwWVEcBBZUrlkOFXR6g67QOovSh9WdTOcreJmeRwgf3g9rg
Message-ID: <CAFBinCDKUmA8UPL86znCo1XwvDrwcvDsO9ZWgs1KkWSA9kZxcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] thermal/drivers/amlogic: do not log the secure
 monitor deferral as an error
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:19=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The thermal sensor usually probes before the secure monitor, so the
> first attempt always defers and logs "Failed to get secure monitor
> firmware" as an error on every boot, although the second attempt
> succeeds. Use dev_err_probe(), which records the reason for the
> deferral instead of logging it.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
