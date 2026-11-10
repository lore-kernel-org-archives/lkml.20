Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344309;
	b=TkHgtqIyy495YQhQCQgeoLOkdYsB694I06V3hK4SZQphgUhEVVkMg+MVKYc9kZ5IDQM0
	 f1BwrVjqoOlXlZUMfNjljsMTwUcoDxZcFmmRgldoqrrB32jkTsCt2+S+X2dN2uq2jEnL+
	 01j9UA04WL22TaEend/9ORcPkGmmP/zDlOISVeonl98Vk/LEesZAjmbEu3t3BGZUvEzy+
	 iUSOYkx13iXMCfeKxSkdP7H/ShxaGxwkGQAmqHDs6sEfzLxOOM4nHtojRKtdYbdb08Jre
	 dzpniCZ6x1xecRlLaSc1se5GB99cFPqnkwiULFigvrTrQKShTGbxUSU/VNyWGIaU6Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kLM4bV8tdm2z9MSR7M8kpnc0mM3tftTsAj/9cIAHpAE=;
	b=KZ4Wr4cA5+jcWpxrYRG18N56zdKW0qsCLMGN/qXOb9nPK4q9H8KjHLTFGK130anvfkvO
	 HGy7aTbGjyqnPHv7qsCyv7ZqogYSEuCPv4YJ9/i+SGpEAc5vHFtFNChCRH4hmNOG7Xbjh
	 p2XsOoYeaT1VotfJpOg49fi7xSBJeqrdCCtJqjYEnfMOn+iduka57f2mbztfsPjb/R9jE
	 boV2KA5L9Qq3L5yD1O/359laXMPWT9qtuvDE7p/RnsqdtCfSdgVYdDfRFTtpfUDF1MkK2
	 icKinlIkXAzDe6ZybM8VcUwQjB0B5NIplJlrWE97IpRtr1AuXzkeT6nFfCXGBGcTMzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u6vii/wC";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73293606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73293606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u6vii/wC
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso1683926f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794344308; x=1794949108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kLM4bV8tdm2z9MSR7M8kpnc0mM3tftTsAj/9cIAHpAE=;
        b=u6vii/wCL34uzAZ/V4UU9sOlD0mAAHVKnWt+MtiUee6XFX3+EtYIBPVbQzyKv84YzT
         EY+NK1L/PGKAo0U0oqq/tBY0docNnoPMRDfJbD6/V15NeP9K8OwjYiosGEJlv6c9M9u/
         aHdIYdITM6DVEzuOIHGM2WXiiByTHo3UTX+UZPsvo07j5LlLSGTf9WdBfRnMJJ0qPSSw
         6JFxP9RyX3PadDCWVHHw/2S32uIea3zAmgznqdBD68xoi1B0ATXoM9Kh6jklmJUwU7N4
         UqYTXjj0uJFf/MZ6gHQ0bR1JNdaaG1+lM7dwvOAx0nKmZhq6ImK7aN7cKBr91ZjL2g2n
         sJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344308; x=1794949108;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLM4bV8tdm2z9MSR7M8kpnc0mM3tftTsAj/9cIAHpAE=;
        b=EqLY+I7CTMjukaBDE5jAeSxHFBIxU4I1p5zW7ZRorneZjP08w1xUItWlvvYzoAWzE6
         Gr4ndUmGsqdaPFwB9PLNBpGq+DLP1FuRQroAQVmYgoj39QovF1vdRdskKJAymYmGrTR6
         o1VcEBJgSiAj219s9I6W9EPOvF9WCjzbXkPazbuv1mu6OAI6I6vQec/ZI1bLbrh5AZKX
         9NEuYLE12nGGuAjEmF/RdJ/6Kkfgji4SGgAsGoNNRfDvYGMzn0f4fT36zu0ZAKrinxf9
         irtx9AsRq2g/z3tc+Q/NwMj5tj7j0YQ4sQsyqWMWD3nH82Moli/tgIzQmB0JNFx87rcy
         y3kA==
X-Forwarded-Encrypted: i=1; AL+hErFmrAh81T9BpQPRcvICz5kAQv0D3zSPblQ6Ryniv+B9eW/xfrkdAePG9l+5y5R0zHZekW3d9UmaA0EQ5Xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F616pjYXmc24cpZsZuFAL7D1vH5j+GfUfprKSjbgZ6MG+i5Oi
	CwFXrSxeg0vWCE6odDhDrRRGEnDbBb5iis+Gn4A8i35tURVCr26rmQXj
X-Gm-Gg: AYBFou3iaYwJLkwgKBnd//vPbcHQqk6R9vFg8pwwMrVWy3jIrnwHT+usfAgsS7Yw7AE
	zfzxq9fVIcVTJAH0fOddQ9C+cI8c44Pzfj4W3PxtNOhC+GYKBSSdxOPfBGTF7ZtEV4PHQOYAvoq
	7BerFtgQK3rmbSRN6R6Vp/v6KaLom6iZYsaXWDDdBE5NSfnSz1neOCDIPPsZ4PfxE+r9qAP9v6N
	vC7QZb2Mm2C2hR6vMV39Ym+mAHmM+TxI8wZDGXqMjUhZ6MPdG4v2UlX1PG0zmDtdHJHCWK/BJAV
	I/Rdq8UWGbgf6wNMiZMsY1bMoutpr6VdWVpObi1DB/4yrXId2hVChBn9dzfHKU1DPXetxYA7mrz
	Nhx7Xcqb83Oi8mEzFqeC6uJFttRLPOHv49AZmgqZRZH2RGgZ/9++nmQ648pRkO7CtlQCyE6YBzj
	FaymGzE6Ri19qwQ+OIwYcFtgDRbv0MSs7sP0drCzpyX6pOOk8qu9KMDlhBDpabv/9lCbUZKugLt
	XigjhZf/fKhRL+z0A3RPlzP60zVQiWjVoB/hdNSyQGH0vrnk9v1WAyT+f3WEjDrNxKkY6ETN5Ix
	DzAeSofn+pDhQMT5b4f3A+Ex8lLJLlIkITT7qKfSrJfBzytWvkZVdtMpjkw1H9Z5Sdlo9FUdoaC
	S/EHKPXST5XM=
X-Received: by 2002:a05:6000:605:b0:491:e062:383d with SMTP id ffacd0b85a97d-499c931ffabmr213029f8f.57.1794344307651;
        Tue, 10 Nov 2026 12:58:27 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm1662790f8f.2.2026.11.10.12.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:58:27 -0800 (PST)
Date: Tue, 10 Nov 2026 20:58:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, hverkuil@kernel.org,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 kees@kernel.org, justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA
 drivers
Message-ID: <20261110205825.18b42b0f@pumpkin>
In-Reply-To: <CAPDEY+X=pVsiY5cib8e_Vu3KNW0QNV6hXF+GSLs9gyD8rMXa6w@mail.gmail.com>
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
	<cd073632-0919-4015-8daf-39cfe24391e8@kernel.org>
	<20261110135444.7d8070ec@pumpkin>
	<CAPDEY+X=pVsiY5cib8e_Vu3KNW0QNV6hXF+GSLs9gyD8rMXa6w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 10:41:06 -0800
Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:


> David, I also see your point about leaving strlcat() in place until a
> more suitable append helper is available. I'll revisit the approach
> before deciding on a v2.

I really don't understand why strlcat() got marked deprecated without
a suitable replacement.
The performance of any form of strcpy(t + strlen(t), s) is horrid.
The only extra issue strlcat() has is to do with it doing strlen(s)
to generated the return value that most code doesn't want
(and in pretty much all reasonable cases is actually fine).

David
