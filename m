Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0058E38BF67
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941820; cv=pass; b=vBkwWVB2P+TPt3gkZ9wVFLSyTi7rbCUOl6wHuxGJ30keRxDJRa4F03bAmwagmRTOCX0MVSnP74vMGPct9LmvPc0oYamK3CG9XFf3Q9MlmnVhV8mJvBGcO4whsA0jspOfaus0T5uq1OqL3VFBmPeFXn+xmPHeJ4DWGqbCq6JoZFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941820; c=relaxed/simple;
	bh=RL/+hNFUOj4KbQxDutCqWOoq2PWgaMgLTb8N05pdrrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APAkk4DIWx4BKjt1q/52wLTQX7Sja/ROl8ptuelBB6mhysNsLx0ItFXWEpFcNparOUlzbWBz6yxVlAbQJWY6WVNWm+L6huheOE8gXITMUmEHqTlYbLSX8IukTNmfvhNYMKVQNPbLsKjOgawp8/T08kJ+dmXkZaFwiV22gO3b+/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUV0+3u5; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUV0+3u5"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-476ef1870a1so1873598fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788941818; cv=none;
        d=google.com; s=arc-20260327;
        b=js2qPR4y8Mnnc41Og2rIrj1A75zeGxBYydqvbbKe07r3bFX6f8lZKb4LeqBGg7fYHQ
         2Y2bV+l0qJAmqNnTKGkI3nR7cHSV3lldhw/3hyTj69gUZPSlRMiw8EVZ/dQFWR6XPEuE
         tQKrTN6TchVXwNDesErsSy9iQy6Rbszht4zCi6MpdU17jQ7a4IxMsnyqvI/JTmBZBNGf
         AVyAWMwwsey6DuXTeXuKU5V/l37V5Bim4Ym79sWQL37U8TVR5cjcT1ern0SWIqnqd/f1
         2JPYgbO3HcBFcJESqpASB+sy5TKgAwJEt5qcx2n1r/84ACgAVcg7loOJNJcJ4g3rVKcU
         en7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=;
        fh=XAFIL8VhsQy+JXkDYzNWfaupF+KKiyuLGuTk/kC6uDI=;
        b=UUyntC8C3QEhQnDB1RrSElwK74c530jU+MS4+qhYHaPepJrM80hl+mmXdHPpUmWpPI
         5yVsZRr6RREL9PfRmD+95JQKEeCDbLfGfpqRW5sqjufvjssTDyHr1tkKyEMQ+z6P+Bev
         id1py1wibxE4MpuKSVyiIwKEcSDyPfCwyAQ1nu5EGn0JcBnToiTjlWZaeMs5TkcIVpKh
         IiHZbUYa349qn3H657g9omVZbA2twwcNRuFpHh4ANLldHmnDPDSWVyJOzSoi8DkVdXXu
         aZlhhb6Lcv6drwDAXA+gqRoAjyd3zEvkE4vmOJuGB8+GOK56/c9JPXkq8x1PDfwin2qj
         Edqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941818; x=1789546618; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=;
        b=TUV0+3u5nyvPYtfY4FVhqB9In5GGIJ9Vkc0eu8gGKqKcxe6Lj8PXhWhf84nI4sFUmc
         5Y2YD4ML9CCI72kVmNoqgzjJdllRIV2fcpVbC4p70u9lQVx5YJ7L1htMccD8JWwx+fV6
         eyqp8ODnSxKOnlFIf22hxZkl5Xesr0p/WLRYPGyx2sK4iB1ngLYKTih2OBxFJv5rWAke
         BWNi538ZJT5xuOsl+YqsiJI5a4GWNwIroXLXtb2U5z/bZO0VERYzlVEftf2S4OfVclar
         pIVrrih+OE2B7RGu26+nW6hsQxrUi3L3QhLVSjClve4QANB0qDbbjnsJYyWT0zSktllB
         5u4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941818; x=1789546618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=;
        b=TQe5RmuEM80Wgng29I8YxRewwRsP71j9II1hUl/P+1AszIWx9wWNOko1S1KT15kybR
         2oMcDUvZaNtqpz84hJeYD/MNDfl9HtldovT7W2oJY02ll5vuYuc+GgLrU2jCiK7vfpLB
         ACcfDBjvQlx28CSWo0hfiHoJkRU5AYUYPmVeadj4DASKwgwnBREnwfACUbK6qFCKbm2V
         ZJBjIyJRiTLuyKoKaXBcgsKPL94m5Ou2vYdV3eDJLLMRbjN4+8nLw6JrftuaH114HPv5
         hjWEUDQLNIPkiS0vUR17Mdj2QXSuHElgSnE8Ao/jC6rzZ571QIqSScMtew0VFuV7H5xz
         hHIA==
X-Forwarded-Encrypted: i=1; AKwUvBxk43u0tkRhhiKNuUbzNgaYo1uCqb4O61t314q29zOHJg5d50m+kmsAoQYk+AqFCTOhGuIzV9m/I7XYeFI=@vger.kernel.org
X-Gm-Message-State: AFuF++nyIaRGzPtnA0c7EXtTkq6BP+J3kJe5l+BQespE6zz9hkXiJ+Bp
	W8W5qqFMYUrdGTGxUSkACXLgpE8TzlixOMFi+g6ZaL6fJy3l3R1uxO3aZK79bjAU11thjmWkVgU
	JtBV+w+rkwhTvzoNlQQGitQL1NKd77wE=
X-Gm-Gg: AYBFou3lKYiAsUiEb+XOKhwnayKvoShUwZSl40sc5Ue3mVkjT6shqL6CcajmY33jt4/
	RZDdpGdljNRcO5Tv7RYkwrOGkbhgXq467O7CgCobthkMq5fNbITQCPFWVfQXsHK8vXOIg+1+Dzl
	pLyFgdARplfBRpHrf9+RKnH8mjuX0BW4OChz1Tx8yjg1tRPQDTsDdgKnytKd0wgDoGHoCdkp34k
	GOF6D+O64dkxXPHraV/DdqXXRy6GNEZ/e3RtdPI0X7/0ZX4XTRwhoFPMcBtUgjhAWx6g+Z5nOKp
	4PubVBv8M7/Jv9/zEvitymMbQhmFIxLQIo7zamhBFSfOmTvwpFg6jQ==
X-Received: by 2002:a05:687c:418e:20b0:456:bebb:a894 with SMTP id
 586e51a60fabf-47801f0fcfcmr13266895fac.8.1788941817673; Wed, 09 Sep 2026
 01:16:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828150227.1062217-1-khurana.ridham222@gmail.com>
In-Reply-To: <20260828150227.1062217-1-khurana.ridham222@gmail.com>
From: Ridham Khurana <khurana.ridham222@gmail.com>
Date: Wed, 9 Sep 2026 13:46:46 +0530
X-Gm-Features: AcwNN1WCK5pqFslicnAE2Tiwfm5AldxOvhq7qzmoOZmdii5H4B6WhszyAfNnHIA
Message-ID: <CAOu+XQJjYeeRUc+9rj1ckLQ6+UcEtFJzM9Pv_8-v8t+_qbKVVQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7915: validate default EEPROM firmware size
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Brigham Campbell <me@brighamcampbell.com>, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I sent this patch on 2026-08-28, during the 7.3 merge window, so it may
well have got lost in the noise.

Do you have any feedback for me?  Is there anything I should change, or
would you prefer a v2 rebased on the current tree?

Thanks,
Ridham Khurana
