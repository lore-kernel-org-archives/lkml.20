Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7372ECE86
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615954; cv=none; b=T71i+IQizLaA++rA1fijCFEQ5v+UEu1E+yxTB60QR3ybDBIS/dXm3P929eE8uJuosxZkbOSIq0RNqCl1mhrlsGd3uI+vR5wRlDx7O4pJR9uAcd5PN6JZltKiPJ9QhxqQ3jxZU7JyZ4IsSvL0MAF3xXeyuV+4sEY8wNsN8a+iBqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615954; c=relaxed/simple;
	bh=JMKAvhIXCNUjIDcumQ07uQ6ytuxwQvAU0JuO97CiZgg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7+zYlL5aBw+gNrqR1lL6EG3aS+oZzD0JmZQdPz6x5MnaoipkPuraKEKSXlMqmknWxrbfcL9MmQ6B8DeT2uRfQ2ux1whXnpVZ9EZW276iUyHvJg2WUHy2deHfXsk3AxofgVI1sBCLckBtbOQ/wrjalwGzFaHPKNWd/4IpnZh2is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxcfU1+k; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxcfU1+k"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b060ec084so222237f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615951; x=1792220751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M9cNNicW0o/hRO92NlnGJ2pji8f57gDd+YVFwHh22Sk=;
        b=HxcfU1+kFifjL4FwBpqnR3SP4fU7IVhK7AMgJ+vFB5YO1heTATpr6yWcwkFxR3wp4i
         AjqeHkCDyUVPG3/Uqs5HFkvttghiCm1xpjh6gWA8AnPL8ZZEomUwvgaxYFwnAS9yAsG1
         Ef+6Z2H51B+6++lbrXKKIAg/Ns5PAiGz9lKx2tqvSH8Xk6pG/KJQ4igdp6NcDlFhLKDh
         qlE/qVC6zsJaZK8OTVdwjUbySZQCnomU0n0lZEYSGUZgHTF/zUeKKnNNQggYsZjV3yjY
         yei3W/Nwdgq7u68uRiqtEGr0e7Xd4tMagdIA0tpscz0VPyJmos26SwQvVks73fJHExiT
         cyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615951; x=1792220751;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9cNNicW0o/hRO92NlnGJ2pji8f57gDd+YVFwHh22Sk=;
        b=I/Bkg6i43G66XNC4KqbBM5E8iTx16Op0tzSGeYIDHqmAqvsDKLf7BvUpn96DrBVAFw
         SGu+oO5OlkChz1d6mPbG0ypxTu5HN3keL4wvAJ3DvFa4bY+mBJj0ljqNdrXhyodJ2pfE
         Cg02JmsRjOCQ5umsZ8mS5Hm74rXlVfvX36XrD+Y8gDpOSV5TH6lPbv+Mfct3sKDfri7P
         3v4JK492+qImFicJxnrMpDvS3yBOIWPo+N58vO98ZOmixeM73zojV5KuAvttt9k22pJl
         4Fba47hHL7edJ4k+uNtbdW5D8+RtosjXfzfWN01VEG3Vm9m5gDeU0hX/ABXNJiRn/tsv
         vlHg==
X-Forwarded-Encrypted: i=1; AKwUvBz8ovTEtOno3lxAOynddS47B+XrvEqOnNis7KwG4rlwC40Ai5M68J/uYUOWKxthPcfFzlcGmrMK0F5Pu+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMg5Zk44DDRpRwf7rQkY09ifhvJMce96WFfy1XUl5DiY1UhLX9
	hFqXwhTgQ7DyudLKik/EnXVsHRNHfWKQuEXWYV/RzawDB1Oj15gWRBne
X-Gm-Gg: AYBFou0SQuLlEf9c5tBeL1HyenaPOoSVqS+Kp+Z6Wsvm3UqKoXYO7McXFIX1dlY9/vE
	PMlByUc7lX0LKa/NM9WGFYkBQqcff7/wT5VzfWXrHCvdvc8lCNwVEzoxwIYkrJJOCQBSp2nmXxf
	ZWowXs4Mql5x7j+XRWR1+Xatwqt+cYGUDg4ou3PxsW5vkUG00M/CsRvtnjBo2nHCjdP4AVg7Mjg
	jGSEECtx0pAvE9owzNBF74NHZ4EXAXjGeXT0U/dk4ynly/obIWOGb1LKFnKkI4GfcXJZDbgWGbb
	mrfsUx9kY1Fdd1Hvajw5R3DAITZiV5quxJC1SurG1e68cAhafxr/tr7n9RVYoXUnEcKBOTmKo5G
	rzwll0+0kD1QaMlKez3Z7Gely/cSE6lA25dN2lqTKBmQYwDDxoYX8L72GwV6p7PA+VUtN+AqLMA
	Lku6d1YxSSXs7JlTUj6ltpGzYzO1lciiwtxwTidMLZ/vzIgQXxU1qULLaxYAnz+OudB1K4bBGqh
	3ag37I0JC9YW8YPAgAMjN90QGtTK2vZOLt+VTJlx7ihhrqUiFI3q7VNt6KMbIfK4jZcGigXCBCR
	E+WDNix0SrraT7hFjyof7N6rwr0NnZXvuSqIUS99keX08GLRnEjmLjN/apEsVYHs8V2rPXnGavM
	ywcB0mk3aJVzg4i5eDidlJkInW57EiDXgTMXETVwBRVpT15o=
X-Received: by 2002:a05:6000:4308:b0:488:823d:5060 with SMTP id ffacd0b85a97d-48dbacf1667mr7353088f8f.48.1791615951135;
        Sat, 10 Oct 2026 00:05:51 -0700 (PDT)
Received: from systembl0wer ([2001:718:1202:45:4bf3:6161:9f6f:60cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm7449823f8f.56.2026.10.10.00.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:05:51 -0700 (PDT)
Date: Sat, 10 Oct 2026 09:05:48 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andrei Stancovici via B4 Relay
 <devnull+andrei.stancovici.analog.com@kernel.org>
Cc: andrei.stancovici@analog.com, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Beguin <liambeguin@gmail.com>, linux@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] iio: adc: ltc2497: add LTC2493 support
Message-ID: <20261010090548.789cb699@systembl0wer>
In-Reply-To: <20261009-submission-ltc2493-support-v1-v1-2-3dad1d4b152a@analog.com>
References: <20261009-submission-ltc2493-support-v1-v1-0-3dad1d4b152a@analog.com>
	<20261009-submission-ltc2493-support-v1-v1-2-3dad1d4b152a@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 Oct 2026 11:43:35 +0300
Andrei Stancovici via B4 Relay <devnull+andrei.stancovici.analog.com@kernel.org> wrote:

> From: Andrei Stancovici <andrei.stancovici@analog.com>
> 
> The LTC2493 is the 4-channel member of the LTC2499 family: 4 single-ended
> inputs or 2 differential pairs, with the same command format and 24-bit
> result. Add it with its own channel table.
> 
> Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/2493fe.pdf
> Signed-off-by: Andrei Stancovici <andrei.stancovici@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
