Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793590243;
	b=bDp9AYF0om8bqyikFh4NfvBC0co6yvsYZ6En5idAW+ukj20G85T9cqGRlE8BHrgJOqLi
	 WLTf9/kp6WAHWWP7dF/YoxcWBPq+XOI64D40aIY7UH9bk7oo54ssrxlX7ToU/bLRZpIeK
	 5eiKxlWRv6tbqJMZNt/y3vg6gv9QGgzZJlo4uMuPCDRUXBDvZD9Z1yHj1GdGNxFEEUaWc
	 +zmoPqBtgZguKo+s7yI7ZlZ+bsLR8yedbFV409yDjUDP1FmyeoI6RTHcbNhpTKWj8jyJr
	 X4bKl04ELdKqdOlcW0AHUM4DOGzEw1zo5TBmKoCk6UiWqbLxcP+TGEk5Gvg6fn9Prvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eMG3qzj/K1IfjUVt6rPED4KGZ+DREF1ZZtQ65RcHUus=;
	b=zl5mWcc7JetXQdIQBfxE70JuE2aPYNTjVV6kgasKLNdHjUnZczbEA2yCkA6VHn3levul
	 3ZU3zl/dIxfD06V6dfe3ou44kqZoJj200zqZVN57UOkmP6xIESfUH9mboR57lGh3LOmLo
	 fanjs6tNDY2ZyYvoisQFKY4KfccM+/SeuA9nH7TqeMlWipoJRQWUPhG/KWuJzKmVnRW4/
	 lRRcMPwufjjFr/mOCp4JVPohdZmUaBDzRTMmtlYh0VjwcbG9hI28L2Nzh+IV1fHCl9nFu
	 w1Szh3ryfO/2RkNvpxB9k1xiv/bOdy1MYeGhclCuKj4u22xH00czAsphNEvnLqWXsHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmlaK9vb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D8606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 651D8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmlaK9vb
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-475920b9ca2so581956fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793590242; cv=none;
        d=google.com; s=arc-20260327;
        b=T05CO4X0RBcM2e4WdBr3PiGNONV/+S/lPxd9VKAxY+lOACKsdo4eXr7GLvUYR5pYce
         en8SHK8giqdZ/n6cg/S9lIijgifkkjhTDjqyKW4mnrYH9U0imXCsuNTWL7jEtK8F9iQb
         lXs6gsHIqkMbBUnWdPYKEjJcGux8on5irvWLDxqYrZ8m68k6V4JN4KxWDfaEytbosiq0
         gJOjgBXdPPtns+yHd1enJznYK/BwaySxXffTsl5uj/a18rVuG3ksMo4gKb9CS47E6V0u
         zdNLvofXB31dSnrzJ4vgLpVB9i+nNyQLkxZMq7kV5teXsCd66fIRdlRrRCjjPnfVoRrO
         JkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eMG3qzj/K1IfjUVt6rPED4KGZ+DREF1ZZtQ65RcHUus=;
        fh=kqTVRZOYqPJkECCo7cV5Pd6LM0FPL4vEMcujwbhtPgU=;
        b=kSINgLYi85ozP19F+by5yj3EJ4kMDEirkqiTdlWDz2P0bH+6A47w2/x3k30dZXiVgf
         APXQUbC2G7RmyvqlahrK6pjzxKL6qCUi8lOs9Vtgo9STDXkCDdz5QRAD7cmtj9iPR73z
         3hfn2Vrs4H4UhEFT1VFM8dyHLrjlpH4wgdqrj4O+cJSTEwFAUYvWxZMhlkfi5qW0jLMv
         fncN3fNynNKFO0Dl1zKW8Lwrjy1EVYSqz5csCt21PdArbCfMHnpL2TGHaFQAtyKdzsYR
         s/wpuDpvkfUC7K3jZWJ7aZ6BmAP3fgKT7m2Y2ZdYDaOBNpF7Td81T3vKO/PfsluzCr+Q
         HNLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793590242; x=1794195042; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMG3qzj/K1IfjUVt6rPED4KGZ+DREF1ZZtQ65RcHUus=;
        b=qmlaK9vbjM2P4NYVJt0RHj55P3y4S+mGZwDeTnQV+XkPuXx+/zuxVCr/MudVzy8qwY
         1geRWP2CKMdgYrdDvadEBrdD/pYmAg177C2xXxBr0aN+P5pJJ1WRrI1dnT00t3j8CYZK
         WOzymLofZ2kIh6QZQRbYjq2rW/21BIXTgg6O0js5djEd5me44LtsTRDVZfbvoHS+QerS
         ZsuX0UIKrp/xWR84IgLg30agIbGoZavQU1zaBCqDjBPcdoPDGck6ABM/CFsYGX8ru7gN
         /NOq5REmOCUqrw+8M3hs80huMOrvKL+pSVthktEONjAtyIoEqEwbQPb7wF1S9qZRGy8+
         XXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590242; x=1794195042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eMG3qzj/K1IfjUVt6rPED4KGZ+DREF1ZZtQ65RcHUus=;
        b=PiFl8+5FGf8AqFVQcChKNflJw1Z2qhx7jgr9GVhFaiwga1XIWlrfmHXd1/r8uBDoc8
         QZ31jiAF98giN4R1SlmW0TTbRp55LoP86DpWtj0wWsF+5OzS+ATeH6byvl7UVI7UrvXl
         NyAZTdyws1E0+j17th1UCnUXiEBqPlTFWJlNksOngy78weNW2nW8I66P6hmbiV4IyQWF
         +VZzseUYa6lmCgOs6zLZ+o51rEq/zg0pLRNMshpc2LV1X6DmzJt84eWrT7LsMLA5OQaV
         zMtCopN6njyIneAHs16X1/wd5C1f61YjwvdZxjl45/MyU0Gsdh5FkZMJBygXzRVzIBil
         aOjw==
X-Forwarded-Encrypted: i=1; AKwUvBztRN15z7rr02y2NzfHczDQBJTubVH9skJ7+iIkrGW7RzZAqqmKCJaII4PFi6sFsk9kAgycfYG8D4hDZbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v5kCZE1YNZSNpNrMMSSSwP4ZOG4pDom5JqkKS7FFJKg1Vid2v
	tlxZKrArIgfOU5j2+aczx5dcLSH1dZLsYEbepByQCqpn5y79kwCTO+/sTQsd7x1NEomDT71/Ybe
	epkJfx6vKMQU33f9YA9LXoezEWmqCYoo=
X-Gm-Gg: AYBFou0SDc+YCMg++OTfUZxchY4rXmze5tSooewMPh0/xm2hdB+7F7Y36xQT6qHy/Tb
	anjWkAGy4E1wpBSElERbANgzU0LYb5TnJJez8bvLcyalorduWD20Yh3M9JG72X1zNiYH2GuK+gj
	qNcFy9Ocm65OK4XNmlj+9hghoHf4y3yhIBVZX1mYDSSPx86fzxIY6idNheC+WgTpzgi+Rd1u2yT
	HsP+BtVmbt7SIqt452drxa4U4mk3XWPJNlul1PKjyTTCZ+u+9nEGHl2jBiG4k2HmGKQy3QY7Fz/
	oZ6D9Me0HYgwnTRchU41/nryYrHfdl4VLmONsorwhpvdBqo8KtI21IUsM1GkV+71xK96vWmDngL
	7PxoZng3TVExvfv47E/TyEdYHW2rpz6YaH49KAoVnze5UtMO1lvhUqQCoMigGw2n3sSU1fkp/o5
	0lQbR2mdn20C5MhcoghA==
X-Received: by 2002:a05:6870:bacd:b0:49e:6fbc:cd5b with SMTP id
 586e51a60fabf-4a9077a2827mr5613306fac.55.1793590242334; Sun, 01 Nov 2026
 19:30:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102032425.8249-1-hjf3108@gmail.com>
In-Reply-To: <20261102032425.8249-1-hjf3108@gmail.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 2 Nov 2026 11:30:05 +0800
X-Gm-Features: AclHuK9UfW7MVkqaHjMNqDVksfpjO7v2dDScBxd8n0Y1R_iO0ssIBL334H5ZSS8
Message-ID: <CABOQOSWF25LgAw-ccQtMqhEyguGwGa5XS6JQAVLbo4BRiNjcXg@mail.gmail.com>
Subject: Re: [PATCH rtw-next v4] wifi: rtw88: usb: don't report the
 aggregation buffer as a frame
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	neo_jou <neo_jou@realtek.com>, Hans Ulli Kroll <linux@ulli-kroll.de>, Kalle Valo <kvalo@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Please ignore this v4, I forgot to add the reviewed-by, will resend.
