Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794381102;
	b=pPLm2+Str91CH77giJ3sfx8QQ+pEmkUFy9EZ7U+3EVgGyacKT99T7xuwmbCotQZ+8mYC
	 96/iC8HQICx1UHeo/Y/WlHL9KlqIBDCLxs0sXLN6jOrMTaBELltghwWzfB2UlBPZK/8i7
	 pBJqWhVqZ+S9XCoBX41e+stJ79NES+DEbxhuOtJCmnh5wqnC8A5SL+c9BXcv1+/TaYuQ7
	 CeM5BvWbtBnHg47slIkNJduw5bBKpRqLciBaO5Wj4VLuDJaUMUIHTHrpoRtXWAUhqvQPd
	 zzCJ0Sg4URQZvEN8H7K4g8ERHd1k9i+JLiDhYkt5mtB0j7wC1nhyiPvMwtj1hizY9AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
	b=CRRVi4Yvl89kFWifc0BnO1Q2AjhAT6efq80Bd5/HSz2CIgUx0e567sPhemQqbSef2UQM
	 WenN8aRzgNJdBIESb3tZ0NwLqG/ZaDPsb0/QeG8n/dPN/nGHQzN4b5T7WmD4k/CMh+bN3
	 K7GqZBZqhHdjmxSRWecPjtk5W8I2MpL1BvFhycaxzRizpvUaV18Q++ZwkgvbFOtQing6z
	 LTJAMe5VjidBUA2wX3frGS+kjKbdUaiLLBJTY9HqBx1SfN+gbwnT7/hU7AAEqoUDBo5G3
	 dwQOjNWEGB0P+IpefEkcaY04d8TXoC4z2yLfumKutO/qFbFEKDBocrk/t2K7J6GWT/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=s6oUx6ZK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A5606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E68A5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=s6oUx6ZK
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677d35fd1d2so3395942d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794381101; cv=none;
        d=google.com; s=arc-20260327;
        b=pUf3mV92W8FPysrJsAjGcLazluzJHFK4X7V9aWQqSdMDIhsxOA/X0yilVODJ6TNt27
         GwgsIFaYSNr1QvHiwIVgkA4Z9nrYGL1q3hAnojV80AtNS8rB/1OEJCFaknb0yVvcHeZw
         HvbfTcQUC2+t/zNo4Mo2Rf8o9n+7wG/tmkqFclnvHWspJi/7x388V7oM1gxdU9hfQHW7
         RVHVFLtwtszv4qxwez4uO61On4zTwgTWZo/ToGD7B3mzgcYmtXWa560fd9RU3QNbgb9N
         givxOrkvDiyng2PMkwSjr8sd4q7yP6ZQVrggLv0RSq/ICSxpwi7wLfbECfhBMFmzN5Gq
         ZLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        fh=HTUvdaENpvUu1yxkHoBgnoB5MovCgE+JmzI5KXjoF74=;
        b=XTjv1qHk0GEUGxCeCmHdIZYiIRCWxLdqRFg/z3G/HHtfymniL+F0svwhl02u0hpxL5
         pYnA0JOaOC+qimSXw8WtQFTcJyeLQ1U/da1OoMHb0bL8PnNplTbG5bGGqO6Lad24HcpZ
         OIoJTDdCivQQT0MVR4X1XOoZTf6tOrgRatfQhO1NOGfsPQPem7c/HhasSmSVquqXXsez
         tbXh/eU/NEIVBvTXzvdXWk9lsWIGZSS0Sd82S+mpm7+A5xQFJCm9WMd0fzrGkz9vOfJs
         5LwwTQ5AoMGNcwi5OfVAcqOe6rYah/XK4gH1Ojl7iGI2nKR7W2NF9uN1BAmGggnRUuja
         nR/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794381101; x=1794985901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        b=s6oUx6ZKeevuidfRlwNMdKJPTIsPpbkp2mcs4Kcbuv8WwhUkLhNQoS1Z/3De7P+yUF
         BxKMBfQEfpMszWs+Xy4VLmarqGJW9Advzg0seCPQ4Gc4Iogmjw8UNBosWeprCbN4kGie
         Bnh2ne4WN2yNpyNtxb3fw/M/acEuNtH+ysqtQ59EnLLpUBfA7uVJ4TzQBLxLdqckyODh
         7ceG9EPfaGUdKYDKgGsznLNriDqqe/SvkJD17/T8EnbkPKYgbOH3hF9+wGqxuxLx79dW
         cHFzD+ICL9+Wo4d5wyKS5ejdpSl2A6PnmVphH7N3PPBNLlJJxqMuTsL/6kVCnGEXl4gD
         ewXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381101; x=1794985901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        b=1gh3h3fjU96pDtB8IyRkRDcH5ispZQm3j2mmwd8w5jM3gCeBrqEAnyAiV91mYi/OwS
         PwWY5ChihU8envlLc8PBsGcHk+Tr5r1/NCYId246gjfBm4fPn7Y+LQ/aazq6IP450FCp
         11waoP5j0dSx+jU1P4+OCj+sMzl6+2aMehofM8HpJP8R1oeKN6F2pejFkGEe6A0UOdyp
         dAArxpNhwFDQoa1bHYm5kZFZp6lVGOc2BBbg6+JUF62tYwSX0yUB361MZhsaND6oIBHL
         iE5CNt5wW8f9ezo131y7SQkE4E41fUTZvYxSktR4tRTo3AtrL3f1rhcEBwySviKaFct1
         Tzhw==
X-Forwarded-Encrypted: i=1; AL+hErH9UegkU9sCJUBBrEPKPmNi7VhPNLUqEGLgmZt0mnMHzaOCzrEtq0U6APiHDCJQFCfWILzTbGQJd+Qvr3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+88zERXtOjKlnfBEa1iZCQGWEzLuweqUyxbJ6aR3EwzgsTke0w
	comEo/MDGhmsTlqf4AeR3klqXmzUg63fyUadgU86t99r0hDtvQItDE9uPLM9PVLA0QFNM6FmdQL
	u8ieozzhiaztrSNu77V//W3nDnUtz2gw=
X-Gm-Gg: AYBFou0YL2zhiufT19JmS5Ht25Clt0Bt8dp5k6CSR57wEZEMcT9IUEWiWDBmiTwQHRI
	GXnDCzEWaPF6yaZf7pszw6wFIEyxaKFLwdqZFqgpWFKerVUcwSv1De7YrndalSQU2yIA42gIZ4v
	uKehIQ2nHovQAfK6V/aLCQbNoQRIN5+y+VxFK2xI9hHpwJmpuNIWRta5uYHyMmSw2DX7xRMzAdG
	0zlzmB/0j0OpP8JjTp82H2SgQj05BSxWtuEAG15BSJZsRvY0W8FXi2AcyTobFuUvtSD3vRgxnVp
	+cxRqqe+VNME532kx1q2/A43alooW7nWyZnkHGznygcNxEblXTczwONyhBCtzvuvHIOsW4CFEb6
	AqdjStkncAS2nUKVKJdlCZtw5aeXdr+RXN5n/TFS3zwtsaVSczJADoPeerwXNvSZRswBkjA==
X-Received: by 2002:a05:690e:440e:b0:679:ad60:a9e with SMTP id
 956f58d0204a3-67c680f240emr733978d50.91.1794381100740; Tue, 10 Nov 2026
 23:11:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v3-2-1a8e395d923c@stu.hqu.edu.cn> <94fc2be2-01a0-4d3b-8d27-a4c42d8449d4@linaro.org>
 <TYZPR04MB7491E5F7FDBD54FEA44C3735FF762@TYZPR04MB7491.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB7491E5F7FDBD54FEA44C3735FF762@TYZPR04MB7491.apcprd04.prod.outlook.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 11 Nov 2026 08:11:29 +0100
X-Gm-Features: AclHuK9fq2VWohEXOgnq_B_UqUHperL-B2npuqbYFfMCGdSky6Fm_yMTOOxsxcQ
Message-ID: <CAFBinCCwzqi13e82tVW-Je93R_1dnHvJN+ZRmqzseGJgozXrxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: "raspberrykan@stu.hqu.edu.cn" <raspberrykan@stu.hqu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 3:04=E2=80=AFPM raspberrykan@stu.hqu.edu.cn
<raspberrykan@stu.hqu.edu.cn> wrote:
>
> Hi,
> Just a gentle ping on this patch.
> I was wondering if there are any comments or suggestions.
Neil has already applied your patch, I can see both patches from this
series in [0]
They will show up in Linus' tree for v7.5-rc1


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/log/?=
h=3Dv7.5/arm64-dt
