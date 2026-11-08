Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138862;
	b=ZZCKGD7Ci5yCTG2zg8AB7G/3JBxqZWFuEC47Z6wLojmY0XgXw4gxRRGk9WGAR1KvdeJG
	 LX9Z02P79jGgIMiL7oER3C3sDvoMGjLh4h4eKUXXQjvkvO1vQGGyVq5A3aChYqX0KkuFq
	 ux5DV6gJZCctPe3oy15yfov27UBSpEPBs0JFnSVL9wbeIawqUuVGz4HC1j92snZOUxCTV
	 vCHjRUXt3y527OWngo5CBx0c+7J9pEGJgVaA2RNXNPLIKLfL56hFXAAzOU3Z7oer6LYKu
	 UgpzGoTefqs+Gn9ITAPeKZ73EJ3xwCpKuejDjdmDISBg4DJnXKtOqsv6SLxbVD2UDdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+hSDoeCHV95MTcU0exwJ09QYlst4DO6dsxKv2LnugqM=;
	b=lvBTYTzt04bOFPRaR3iaRitot1gm/1xOoyqLKVG2R/qP49P0R63+wu40BNoujh8b+p7Y
	 cIyALoEXw+BXq4aD6FUIdan9oWIMVDNVzPJVRNbl37IRvUsNmpGWDchm5UVBuVA48BUvf
	 AoFY04WcZ+ZahXqq1Jzu/Krj4ovHyDbdNRbNxYQa0rjsuA0LhliZrLsXnlUwO1P36AOUf
	 vw3SgE3hyxWPVovqVaKjlq5Xqmd53+DJoWGE2kpJ2oBYvR24JvKqBQF9y1e4gtBeUiS+5
	 u07Wv1pAz7/UAK5IvLWRxyBvrcykstgNNs49OPXsIxNZNETXb3c+IJEKFVjPB3qz4UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoHgcRgQ;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E171606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E171606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoHgcRgQ
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d73027aedso63224eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794138861; x=1794743661; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hSDoeCHV95MTcU0exwJ09QYlst4DO6dsxKv2LnugqM=;
        b=JoHgcRgQpO4mryH5LvbiD1VQN5AbJycvWNP7w5k5/l8/3Zf3lyKstieOp2M2+BcANc
         RYxfXH977egJuwbFIB49WvOGV/YX8MMTw1wbFFf/iGfKCdKvunfbC2FSlTot4ZqF1DX1
         oFnRRt/Loezl1hjAZtl2MhRYXtZfj42MPtZedSnZSzzrp3G8XpFwaw9JsyqXqTz+mAXZ
         QJxgET/pE3W/nsn9snm1CoRmafeQid0r+YjrAJUAPQHmQbC+0fsgM47/zG4nenU8aVRU
         TCLf59Pl+8g0AL21BO0wbGlhcFljFhwJ6+Tetj035tKC+sGno1bgSkq/U8tKT20ggNxG
         QBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138861; x=1794743661;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hSDoeCHV95MTcU0exwJ09QYlst4DO6dsxKv2LnugqM=;
        b=re7Z/M6Z+eVsTXqRwNO6nyjqeNmCaVu6rIrN1QzlyJ4nkTW1Qwc7gV8W2HbmA5GI/e
         sgT6GiJAsc2tFOFWyOd2q9npTZQiDXN3R71yeXSB9N2bD2Jn/EvVnb4HlCnvE3Zf8LJA
         AO4ae56EbwvXxQPOC4HEwabKc00YcukOSvNy1Kkq4zXK7NW18LPisAs7VI5UK+lnv8N5
         l+906e6/dBdGsVkgEI0aDSRANsJD7xYSkUuBfTiT9fP7g2nKRJ+iMzUI33CwmIZfJNAE
         dgosfjJcjkek3m9semvB6Xw4lNRkYR2kJU/wP+M2JPIZ9inJFmxDudl8dvYfNshDaR7G
         CXaw==
X-Forwarded-Encrypted: i=1; AL+hErHnjOlWLZc2YBaeEnWFjXfT1X3V5gk+NNv9Q0slhbsgGAcmdSb44bEi3OMNUwMJcfhr77kQxBN6Q0p0quE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VKFtcOe2Cr6jDIbWP2Xmvxn4ZAIiLfSHjS7kEkSipcK+ewaUM
	OzptvX6rFu+k3ikT/MVWEWKaeoW4OlgEG5jvf+xcMAUK7GdwBggNCiiL
X-Gm-Gg: AYBFou2RH2A5+6AwlmVgvLTQxbJCYGB02Z+3d/OduZHNIV3+pgREuHaOxuDBaOh9+zG
	QLo4xiPPtO6l5ufbiNL0KHPqYfdI9YE6gpyMzqFI7y66Bx8spcYw9TjXhEiM/pESZZnw/pXQb0S
	NYO36mbZgzpLWLcBOEMFpunQh97st1uDD7ZYB9GjcJ9EkSXhwHTjyavwUD7rfM9BFEx8DVTbF9j
	qtQWoYw0HdR8Hgtubmnwai0L70/kbwGfH2mUl88aSAMv+RDWzvxwPyRCJlelFoRnNM/ixpvrp4/
	OOHrWQZL8XTFAOVZ/j3ZtEUzH87VmiuK+1S+xaZO3KyAk+5WaYsI0VK1GDxCWSDfW7LohyOaaB3
	c1KhT2S32rgPo5j7/swCXe1ncL0Pt2qtZAY0ibBwCJ2kn58qfBSQUdveDMM8Surq0ofsJLXfvlx
	+FsCK4KvoOMNI8oedK09ZcKEkyCixz2Cm2Ihn/euXV72WcdU2mzvJ7ohzj1DJlPR5cB6U3J5GrT
	2VeOerpvwGQhRYeA+0yGWyAMVGGwGGzZyZSk44nOnIqKkpHn1BUxJzWqPhWzxoCzxFrdMpMdxS5
	xA/vt86baUsvRdfAK0X2/HA4qEmG2Fk=
X-Received: by 2002:a05:7301:c83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-372566144c7mr2538503eec.10.1794138860540;
        Sun, 08 Nov 2026 03:54:20 -0800 (PST)
Received: from [127.0.0.1] ([45.198.20.201])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a179c1sm4715288eec.11.2026.11.08.03.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:54:19 -0800 (PST)
Date: Sun, 08 Nov 2026 03:54:19 -0800 (PST)
From: alyandra5b@gmail.com
To: sammiee5311@gmail.com
Cc: tiwai@suse.de, perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
Message-ID: <179413877928.27072.4989388975502966406@localhost>
In-Reply-To: <20261108113645.1730429-1-sammiee5311@gmail.com>
References: <20261107111056.667-1-alyandra5b@gmail.com>
 <87pkwgyck9.wl-tiwai@suse.de>
 <20261107142950.125901-1-sammiee5311@gmail.com>
 <CAJYQYHxrpmBPiyMiS2oK8eugUMR=KFmf9D5jwLdoYUYQgKkXjw@mail.gmail.com>
 <878q33y4z4.wl-tiwai@suse.de>
 <20261108113645.1730429-1-sammiee5311@gmail.com>
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

Hello HyeongJun and Takashi,

Yes, that sounds good to me.

I'm happy with putting my patches first, followed by yours, and moving the te=
sts into a separate selftest patch.

Thanks for offering to adapt the sequencer test and incorporate my test cases=
. I think this would be a cleaner approach.

Best regards,
Alyandra
