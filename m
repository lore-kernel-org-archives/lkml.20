Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266163;
	b=wdDYtIG3c0CplGkSaxmL+Ti1igurv5BcT8ug7iFsFNjK2zGcAKccH/7gWD4S2+PSlCk1
	 RX7ohERP4AnXJzSyBnTXXlsncUWr2+6IyHpLS9zRjp6Ddq39KfRoMtdrsJ90gULdRQ60f
	 pfW5rYszU0UtCs25JFoQKxTUiF4vi0ymYpKni8GSqkFJ4g+od8kcZFb6l8deiq2x/Xfnz
	 XHqvhM7dhLHXHw5a0+H6w+QuPsijMk17z60ejXC2wSOktYSh+j9/Vwt9+o8THnB0DY6pv
	 NtOX6xZis7w7tNFDN2334EYvl77UKKpVkIWqKxJeiYOTHte+/MwMx5P6KJnV/KpZJDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=p2VFQ2YdVBVMlHGI8TnDXTz0Id7EK8o66F4F8DkIzGs=;
	b=G0dXDRsYiQkqwb9D2fOgHv91UiHEDSvkBETgxJVLhorA22XzfPRWm6aNbburblr3Qk5e
	 vNXkQ18dgDVxhjoSp90NPbfnTVjXo6DSy2q8u896o9r+QbzhPYg0lprUBOeXoXbBRONAI
	 B5XqJH6JOBc45urEJCYC5GkkUIRHojfb+/u91AiDQj8ZcZ27Ej9cJQq+1jRTpXzD/b7Qc
	 E+NuEZJeufQNMSmvOVbVfN3Ry6eB1NxNAbhO3PuV/IAje3rilciT0rOYCWenbp4kT/H3y
	 44gn0emuYOIHDp+Hs0nVC1st8CUawUZ9H8TzqtCNjv6MPUetSLHGfS8Q3A0Iv6dRtwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPSgiyD9;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D78606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D78606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPSgiyD9
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso1218978a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266163; x=1793870963; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2VFQ2YdVBVMlHGI8TnDXTz0Id7EK8o66F4F8DkIzGs=;
        b=KPSgiyD92WSi6Fh9CUiZtRObKuwHvCYU1NDwm4cWnnIA7pEELX9rauOCJB43Fu3NOo
         ZXv2LA/8civXM836gZzYBpGx09nCTwZsEJVvMtIl4pcX+uOalxW4hSFtDJ5OGK+owFPV
         pErEqMwvM2w67A5uCdRV3XGUNwpXN0d3/vsvkYuGCLoGk1QQ8fuqpISbH9gnOYQdCB/I
         qaKFdRL6/88+Rbg4x5fZSWnh8exyoidAKanO9FYBcvwXxKPryXFHIrvo/utQVuagAEeT
         chx3n6P+yEbtnm34hjtup5ljzk3z3ZKY1mEbRqcKnGsSHk0f3feGGqoHVtJ6e2eKF+zY
         PpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266163; x=1793870963;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2VFQ2YdVBVMlHGI8TnDXTz0Id7EK8o66F4F8DkIzGs=;
        b=LQNmTvdianXssfIjUPdVxOxLnjweGGiqDBEZXSlKXMJtSNKBz2JWeCTZPmgDkxTn+8
         YNzu2cvzCOkXcLObQcMpkPjjkZsVp/iSRNUqctiTOX2pwjpPRm+gX3eBrlSQLgi4/2lI
         KM4ioPrSohhbfHT469FHK+rALyM4vL4Dt0WJI1XQoIh1Lgtcvw+O/tnTe3VfYmOTJN1Z
         sMrMjssxeXUo9x+bxsPJAm7BmPZhKB9so7CmeouXo2F4spAaebeXW9xZQwN1Xp3dc5hA
         EZ8tx3BqSxLVDb0540jCgSczozVSV4UhWBs417wEqL4SyIzNf+4NyxSax/CWhk3igR7n
         OgIA==
X-Forwarded-Encrypted: i=1; AKwUvBxIgHWJhdxnwQ96qpx/uTbPNXY0nuvm+owmduPvyga68q6/CWLFc6rQiCcBErHKVEOfcLmjIlgmC7qDPek=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlGtDBufHJNxivMfOj8d5Jx5Q6fCB3SkPJEHh336Chqd16z6AT
	WEEpQEHjcGQhBpN7mVfFD6mLt+R7SnqbtEAm3mdGR1j/WxOBZ0qkuj0JgupMHNYd
X-Gm-Gg: AYBFou2wyMDPDd/gc5KeAYnF9AMO+VXrpiput6oFgtne/s6rOzz9Pn8BeHoH7V1my5j
	zqId6c7ce76m8Q74CXUS2deWFZyl+KBIBNLTKpKBYboZ41AkW5vlKlbA4odMoCO2FSYl6qN8F3H
	32IvTP6McWjjSoG5/Pp/pVfEs7FCzlaRq99aGWDS/P1vxT884VQBrCbL77vOeQ2DVhxA5jRJpC6
	Crie/0KToysH3QIX8HhIFsFSacF0VFBmQ/+gHBMg72e2e/tEByo1gPSWR/Th7S3Eyu3EeVRWpuE
	IVLAgs4p2s8SUfvPP9c1q8PfY1F4Yj99mxwDzZDrZHP6AxRpTphja+BziclN+PJesVv9TEZYKCm
	5qzMPZ3tY701OQu6pPctMl4mYj3H1blS/G30b5viZpWmGsM0nPo+8Kix16kUsXCb5ZTFMv2iC+2
	DVIwmZvM3e4LpyanX+DrUI5enwk7TfFEr/u5VGJGwmUZKtmHx8/rioOniONMEvetFF7O8b1S4px
	VKhtuWv0gnDuSUpi2lNL+b/a4nOfqDO7hsaxZHq9idSllXxo7em8sXukKy/EA==
X-Received: by 2002:a17:90b:3c04:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ae581e8bd3mr3092891a91.54.1793266162773;
        Thu, 29 Oct 2026 02:29:22 -0700 (PDT)
Received: from [192.168.45.62] ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb1ddsm3540149a91.5.2026.10.29.02.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:29:22 -0700 (PDT)
Date: Thu, 29 Oct 2026 02:29:22 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: Ido Schimmel <idosch@nvidia.com>, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net v2 0/2] bridge: cfm: correct CC receive monitoring transitions
In-Reply-To: <12c35123-2c08-4d3a-b08f-c646b1a7b982@blackwall.org>
References: <20261028164730.253238-1-pocj8ur4in@gmail.com>
 <12c35123-2c08-4d3a-b08f-c646b1a7b982@blackwall.org>
Message-ID: <179326615954.265212.11556019462202036381@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nik,

I am not currently using bridge CFM in production. I found these issues while=
 inspecting the code, and I agree that the fixes can target net-next when it =
opens.

Thanks,
Baek Kyu
