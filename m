Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792948136;
	b=sKj9leclkM2MJ2q0zDpVczVH3evP5n2RjErPDAasqCBLdWgN9MGe/ogEF9wU/CtDTlEM
	 Y9nElleWS6Qkj3GGTKqOM3trQM1z1hNeo4llpP3zs0zejqJ/7qEntsC0m+1oJt8YcfQUO
	 xaLg6PqRmZF68ob9xB3kXdYohqJUUTm89DZ3Q6yRIIcTKicwgaEjTZD3tWtwuVtjnoNfd
	 +cl21m/oSjxdIKS66axD3T3tAqCmPq1uUOTdkkCagO3Txu3tV9mmOM5YMJKJEcj2ImD4V
	 yDE/YCiHegt2L/DmQYI4yktY0+X1XDynFYle4WFbqtyo5UeoVEcfywoXTqR7mazecjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792948136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rhM/Sc+o0ysPmMO6fSmK6vzOuXvtLoA+qk1TN6KOMFc=;
	b=NQ3fmJK4U4pRf23QvO9RsEM9F+Y+nloqeJITTSo7V5E2pbM0Bf8nICKZE3bnpqn4ZdTv
	 I+E/y7lYFgZPQ0DvC7kTON9tiuO9C7QRbZtjHIIMyFCpQqHI4Lj0ceyVxlYxhbk8GC9Sr
	 7Cb+82k2wuq2BSdGitXkTwo4DHzgNF0FutVEt8oUhBabvhgos3os0ahjrfPBDzIljnR7R
	 tGGK77hLIoplfS1+iDcm+74YYu0GeyqNXu8+waSvWWGR/0aF5Qz7bIZkJJBehiNUSEeXZ
	 Ldu2ZpfrQGP/GG19KPb+Zink4dTbIVnSLzQSSuMm2mNZzLIg9LRxWkjb3dwPAeKtjPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYqY6Q4O;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8558D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYqY6Q4O
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso18351195e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792948135; x=1793552935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rhM/Sc+o0ysPmMO6fSmK6vzOuXvtLoA+qk1TN6KOMFc=;
        b=CYqY6Q4OcehDG29INBQMKR4DaLuONQF9Z6+RYnqmnDxH8Prqnk8zLhu0OssqK8Fadk
         QvajBSpOcFKRkCA2xszuAfcfxi1prXDBFnNFScwM8SjERibek0eBd179bd4hGgkDi/F1
         v+dnsUUslGayU+J2YPHOBPmGkPpo7MZ02TFElh7V8ub29tg4CJqDAR7rGTz7OU7cIi3b
         UlF5nXWyCfIvaTb2I4mYophdOcDZxMAQj4s3o3MXBj9vZ62S0ooEJGMR2u/xPcU108Pf
         VCQZYG8iOo1j4Ty8YfSwAiSFZk/lSClmm8Im//vd0+JqmHNYcJWk+OC2goFZ4XrWXb29
         0GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792948135; x=1793552935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rhM/Sc+o0ysPmMO6fSmK6vzOuXvtLoA+qk1TN6KOMFc=;
        b=1zLbhf14rVnSJq0IY4jmh/PW4P5KN/noCZrBb9FTcS3MmkywrZLHMdQl2GE64WkQQu
         KCECoOiZKgGwdCWMHyb98t+xHFQUMcanuGx0Xz8mRF6ze48nh5fTWwcZHODGGCC/Jsl8
         GriWQ/aKrRGA7K7R33PBHh3ePZ0Xw57z/5xJsS1PxrdrwEERjZTbOX1Ax895QcbEhn23
         5cAKOeKDLmYf6EkhZn8otMP9CSG/+R6NXlDKC2bqGbN9Enppxr0QJiCKsZjHZWlpuDuB
         X859a5y/9rP1WhTL+OcNpCROjKJ6/dRa6DZSmj8mWTRuGpRzE7BvsdM+/oqOLFGAUxeb
         sNHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhm+UXQaPagib3rRQ0w+z6IMSfrsYhb2UETKMMZtH+7CoWfbKPyOQR02LL+XGXsnjzt749oMmj61xvtUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgMbqkpZv5wk9fRyYMwbB4NN4sZbjs37JUzLPjGd5TOvoOq/3U
	pjQryEV1UCeRaS6qh7dFW67VhSsntwGgnZTyzoLTxu7ChWFTdmv15PLq
X-Gm-Gg: AYBFou3Hc9J/JIAcr97cyKkrivWQYVZGN+EHeSacM2W/Uv1FzcqBYwMBLpBhSngteD/
	XhU4+NpS1M9NBCVTQaIxAR/gFNwPN5cILA1t1Bq2KBl6XrmtSKCbdlRFL1MQUiUyN7XPPe6lVX+
	nQbvYxLrhAwKkLat4dII/13Qw1vvfxYGDp3TZt8RW+s39KStSOedOn8JBrMViRcC717LxK+kewG
	k7b3MWjz/hsAx0vanN7eHfusRQwd9Vhrf37fk+vM0/C6a0ffsHmVWhn1Kou3XLhpdi8zjGAhEiB
	6Do++mJkCu81PJW577vawCN4iuPS7/p39ANr9jjU50omVYMy/g3ZiyDt1mQqxUIOE0s+WpbFE9J
	L5mOrP1R0DH1ENKfJYTVSW9fZQDeEprB1gWVVxiz5c/4eTNaq892t6PWqCwe+QVCPZeIyi0cXnL
	mshy4O+GBzNh3EiJ421V7hbnuqdJdgGC/REGjIn7/AoGGsZu5MpDcc8tnQQKkKsxlFFgDpmz6PT
	Jjxsg46gGBFEqqQaD1kpiW3doOrHnWAqslfM1lrS3mt2KoD
X-Received: by 2002:a05:600c:1c03:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4a642ccc7b2mr10435695e9.17.1792948134926;
        Sun, 25 Oct 2026 10:08:54 -0700 (PDT)
Received: from fedora ([39.51.119.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm11352202f8f.46.2026.10.25.10.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:08:54 -0700 (PDT)
From: Muhammad Waleed Badar <walid.badar@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Handle payloads starting in the middle of a bulk URB
Date: Sun, 25 Oct 2026 22:08:41 +0500
Message-ID: <20261025170841.46175-1-walid.badar@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <af1ff8d7-16a3-49ce-86ae-f944978f869b@kernel.org>
References: <af1ff8d7-16a3-49ce-86ae-f944978f869b@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resending as plain text, the previous copy was rejected by the lists.)

Hi Ricardo, Hans,

On 12-Oct-26 15:04, Hans de Goede wrote:
> If I understand things correctly from the email thread + previous patch
> there is only 1 USB vid:pid combo which needs this.
>
> So although I'm normally in favor of heuristics over per device quirks
> I think in this case a device-quirk might make more sense ?

Thank you both for the review. Ricardo, you're right that v1 would
decode trailer data as a payload header and break those cameras.

In v2 I combined both suggestions:

- The URB is only split for devices with a new
  UVC_QUIRK_BULK_UNALIGNED_PAYLOAD quirk, set for 0bda:579f only.
  Everything else goes through the existing path unchanged.
- Even with the quirk, the remainder is only decoded as a new payload
  if it looks like a UVC header (EOH set, bHeaderLength fits the data
  and covers the PTS/SCR fields it announces). Otherwise the URB is
  handled as before.
- A one-time "UVC non compliance" message is printed when the
  workaround is used.

v2 is here, with test results on the affected camera:
https://lore.kernel.org/linux-media/20261025170220.42789-1-walid.badar@gmail.com/

Ricardo, Mauro: sorry, I left you off the v2 Cc by mistake.

Thanks,
Waleed
