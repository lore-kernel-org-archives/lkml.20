Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C2336EDA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014803; cv=pass; b=FYHiYmOoiF4y40+yQAtzFKcjM08ZpwfcffwE5trFZZiqy8m9KC9/K4xdnwxBowv81u2E+ynpWVUEQLgs1Nn/fCUCXs6z2sKKzHMDJx2ccbiFGSreAc/Y+Yha5gQDZ4FMusL7Ew8wOwR6PH1NAW+Z5EeXkZ9fBcvuilKrOwa9hOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014803; c=relaxed/simple;
	bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrVtx5zWnnfpSLfOhkhSvihnvB04+d/oiJq/oDK6PPqpUSyH+t6WXbhvR1mUjTY5ZXTZI5+hNyoExxUO0nOMYGODN8MOAsvZOsDzAYZrdt5JirKYb2w0QvqDa339WP6CiIgpuBW9gHMd1U/ZgTC6xED8M+4CZqKf5pQtdabj3k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPW4EOGO; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPW4EOGO"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso618394a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789014797; cv=none;
        d=google.com; s=arc-20260327;
        b=D4vvjYK9tEDmHuTm47UoGIWdrLWwm82pfsyAAJpR9VhGJfG7GfJGEsKn90CjwUeKFy
         k/GuxoxiKB4TmkFbrBgT9iqzHyh4tWXkdbUsL2Fn4MsD5xsuJpfzk8r9q3MJvm/F5i1v
         qNqh1HTd9N1fxs9QCkiaKZUrBeFYAIfx632+khD+qVDxVwIcb6PiXFfld/+TlOUKt7iF
         3E+LpTN/JWj3+ykNN4M+GcXXdQFC8f+C8toP47rbgu4WTuDA5s0Ur56Ta1im0vrT/UWv
         ZLXX7sknOaqQTJlzhJg7qKe8xIkOsZ4bWY6LmtqxcUORG/iyMHl9rPkzN1bEkKLArHaD
         HeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        fh=hH+VbvzQyoegSwHrSwJyn/FVUZuyx0rA/k+rTIEgQRk=;
        b=M1pBHRQJVTgc18GbY9i6PfkFtcCi3lts8OIhUBATCXIjNzDpxXA/ruLaJEgZUwYw+d
         lLw12qNNFbxkuxKhL4L/P4AlhpQ4jsJBjneqUWLkJ3jFE5FNfWyWIxb2udEbwNpsfgnj
         lo9Bz5O4RJRWshPx3AKzE7vHYRjSDi5tKa+AaSyTOlO1HCnjMAo31AcKJlCIEAISFATQ
         RrIgHrWYZR1jn3vWXXgIsoM+p/aVFCzvAcLkWhC/f4ylire1aRDxmGP82hwh4AXMR93W
         PTWCwYnZZEb0IE0CD6zHlWzrNeD5BiH4T9W6eLkS7+wFjiLFeJWRfyKNV708ss50QYvr
         Bfhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789014797; x=1789619597; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        b=ZPW4EOGOYXydmmQe+w8rHbFOV25UH3Ht9q5dKwT6yC/bQ16eMBBr7MYXy9zewDLMKc
         H/0TmsrLd/tVvm1bh3cbB5h01XbrGDl0oWdMb5nb3UP8/biCoibOZCCE3HJh4DXD3yCK
         61YzP42wLEZ6NaVN+lWiemQvBKNwqtfOLMVrgDlCC4DA1L4+Tx0kF6QBxqbuocjns6GI
         AQ30eFix8/FyA40RniYGchuX5oHd+dwnnxJufVfRdlZJbxM8xr0YQaInXVL5bsuOjjdA
         DqjKyPpBoa7ztMI8tWBHQFUCCyX5gqVxDVzN81iV6yb9KBxHDggObpJXnWktT14f0INb
         lsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789014797; x=1789619597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        b=n4C3tpYTIrgmMqtCesh467+YXe+kUBFxfXRdoaFXecRjXu9pVrxhFLZjW3v6I6VRkC
         Qr60f23SXPlW1/w/geASWDsd6fHAIah4M5n09M3lpOyJjaaNjw4kTjwv2SgwHpi/EZLI
         5Q7kS+GeSv/BGvdqZPGvACOOvLvK6u5bnkSvMz8l2HDVj1X4UkvLbZFwCk56GEc4H2lI
         HSauoB690aXpGXtCngMtBbeRqLxcWlbMXQzdiD1A5ZurF9DBtc45hUYJplJKoDcaX+ol
         sadE60hroa+X/YqBClFqa1UwDut35zkWObiWCVXEqFjklQbC0ADKVLaeuVR9m3NW6+EM
         kpAA==
X-Forwarded-Encrypted: i=1; AKwUvBwxuFySme1LDzssNVJb90NLGLnQHpekUTtyCON1/kyCgjopB7vy3A532nyMxLIfXeyBHhvyxthVrlKJKtw=@vger.kernel.org
X-Gm-Message-State: AFuF++n+pKN0DqT1iYFNK3uFzctxECQ6MgslTxbRI3LqSsOVFeIATSHz
	WcY1RgfJYKD0fAUgBagCUfDHHTqlwTcaYl1Bw++3DFO3W9KDWAw0El0fBoa9e0QJjM9AD+lYf0D
	FNHWgIb3d6AXV7G7wZYDMnUDzrpzSpvg=
X-Gm-Gg: AYBFou3rA1XFNZT24PP5Wtt+FraTRiKjNasueNNA+BdNJ16f8RerPviCyuzgOtTwkgl
	J44+NnNfwHRucNwjklB7WTrpX6xHi7FlcEl9zvp2cxQ+l7favxD+H/Z1TTpSCY3OAUYLR3+VZWy
	48pan32STxcZ5luBYVyqLPLlRl85lHFb6GlBnQ5CXUii1snJK8uKCSH5FeO94a0nmDpQUrKAvx9
	FGFFCG7IEoy1aI4KWFTUQJSBLfFrEZgDige70uFsW5LJkx+6PaXwdVbqPtAz9/g7FGfNJ6cUppv
	WiyQ+pD+uM4Lhbr9VL7RPIUkQUaZm9/ovqC8Vw3WiaMAifNOj7syXtEMbVNDkfW/TLe+EgpRozu
	C6x5uHhcCkXyGAcOmo355LSRrlUlUGDFbN1v3dDdyk4+jGiBj3WYEyWPA/lUiZBPT/Cc=
X-Received: by 2002:a05:6300:218e:b0:3cc:2552:ddd7 with SMTP id
 adf61e73a8af0-3dacbd6e443mr7502421637.5.1789014796911; Wed, 09 Sep 2026
 21:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907120310.135693-1-phucduc.bui@gmail.com> <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
In-Reply-To: <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 10 Sep 2026 11:33:05 +0700
X-Gm-Features: AcwNN1Utf0CzSWMalbFPITyh7LOjNeseUmdFJ3DO0v7FQXT2fxbgmZ8RRqPBOlQ
Message-ID: <CAABR9nFqerKXDocMxFfzvvj1-DfyQDvh1z8W81S_Ss4cMok1tA@mail.gmail.com>
Subject: Re: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Kees Cook <kees@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Trevor Wu <trevor.wu@mediatek.com>, 
	Douglas Anderson <dianders@chromium.org>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cezary, AngeloGioacchino

Thanks to both of you for reviewing the series.

Best regards,
Phuc
