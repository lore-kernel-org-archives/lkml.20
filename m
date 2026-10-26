Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793010002;
	b=Tv+/cKLzQV2jTr6d7TkNid3DTWqzAu6Hh/L3v7DuUsEnH2ZoYTOCBnOMkgu9Jk/+CPsQ
	 lMUKwU+DwrGH2LNNauoA6P8aGWZ8KVCf2UdhPyI9366iLCf+99tya7iEyV8VzufOrdxx2
	 +atg5Nd5io+r/gDatrCM5/yWbup/w+kby1VSGmS714QNaC8+7pHpCOedRAgCvRVt1gpE8
	 r3VC5Lp1l0seYS2LF53x/2bV1bHNChK1mJUqY87Sl8MENV2Rs3Pq+jNkt8T8LpHkGWi79
	 VLPatGTAGIhsItrsKqoFvDShLOXKl1XciHqP3Pylgv1oTtXLrOCNvVW9dfly3pWmhCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fbJOoGCOLIQzP8MPpKpAlj4vz5dI1YiHPW1SWmOARzw=;
	b=3PcIcnpUrVrdGmgRRsAmHEn+2fu7RA2mRMD0J0S1H9MZOUcr58u6ELU7iQr9r1mDNjw3
	 aXlysjyQFCbq9RpTx2BF0Np7+oY/WxgJvPdirxOMKTCKkXp77kfwXKLeISBf3EPOXqeCQ
	 WysQFEVBIH6UrSnJ2frzczle5DIpiV2Yn5HuJg7chicoI93npUqfsF0zAL4d2H/Xt2KrT
	 z+IwjpsfVzeWUjXMgate2tuPsk3e6XfiTCydD4LUveEkH9RmBBj42jG3iCteEa+oajtt8
	 tX1+a9ipUOjF2ikcFA5AHte8Xmet+v6J3an8EE/otWB3s1BFsou6wB75mewT5mr6f9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V9SApA0h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C5606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65C5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V9SApA0h
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-704597ef1d8so1217482eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010001; cv=none;
        d=google.com; s=arc-20260327;
        b=d5XOfLHS4iBoeOrxP8/ibWihJwAU3lwzOtc1AI2Ai/Xt3qLF8FgJO7JImWh050J9a7
         h4pDr6auFVKoDX6IFvgxfojEwSpmPh3KY1KZBNStlW7BDa1xaE/44AjpnzUzP7uu7fFX
         8Dbi/WFKP6UoVCoWmKTFq0seRzKy2sj9Q4D1A3N2hGi/pLNotDtb9Az2YnjTEkChSRAm
         NIpKM3FlTR6X1WffLeRK0UbvBaS6E2R77jn2B64oae/H9PqnKNPtkyNC5F0YYrVtalgx
         zCTcwz5oGEzJ3YjqqB33gwOLfCliMNN+gbB7Jx70Ia4WD2no9pZlTDUdHTG6f/NwWM8V
         YB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fbJOoGCOLIQzP8MPpKpAlj4vz5dI1YiHPW1SWmOARzw=;
        fh=fnviWvuIiC0Y84rpM47lqOGd5JtNFeljD/i+s5euUPU=;
        b=oBJ55N1f0HxxegxFPWMoNZlqLbAJnwDz4aRo2Vrcc1zb5TIfRi+WRpsfA07rKmkMEO
         qjk0KY1CDA45ii5Ql28MJbb+3O/EvmRVt+8kwzoVvbIukhvZEZWfQV9b6mARn5Znixig
         A8fYymu8Yc4s5GWsdohj9LjKPuI2a9z4Ji8p61yTUMwBX8pH9raFo4yqVk7hj7qzagxi
         0wdVvjRn4USlQNpBOS/6hG4kHt7ypfTN3Surn4SXnTmc00FAVboUCzBYnhwmnA0bik/6
         PHm88osTMRnYLhW6m4wJOwi2bu2+oqVZa/7mUSmrE5Dcm+MvWJblklW3c/Y9jXRDizUO
         SCaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010001; x=1793614801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fbJOoGCOLIQzP8MPpKpAlj4vz5dI1YiHPW1SWmOARzw=;
        b=V9SApA0hxLuGymIPjHbh/F6yBV5wkSC8Fh/HIvW6yAhF1SboP48OLlob8Oyh1qqvdz
         hVJc6UX3LMQGz0fEROv1fGbqBDR4mdx+Mn/7qlJG3iORZn7r2eYymEc1iZBvn/K6ZD08
         lCeOxisCfCBXSk1b0UYdR8Jz9/9rf5lv1vAZMvMQ+jMtc1rvewyxDgRyEgpV/D2/N5/r
         r52OxvKJavCVDorFJPo62f+EjpbgBYO3+iZ0Z08Hppk7meCmmJOMOkrVMP6GxtAB0kPJ
         cUjB1Zor2p1Gb19DUm6MI2et2U1HI6xEZkH8j5+GS4r7It5vH1c5WO3BoUIVSHGxmG+I
         jQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010001; x=1793614801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbJOoGCOLIQzP8MPpKpAlj4vz5dI1YiHPW1SWmOARzw=;
        b=orjVy837QPRak9gkKbex0a4GDYrhC47Z1kb5zGtWX6lXqR2NWYmIMwOXFm28osaQaq
         LmMPQIs6bf/oY9KaiZq1aMfTPLW+KppBR5tEA+mN8vaVJMPkI/FdHkC1w2zkwwjNW/+7
         CMrZFcyR4irKW/9zQ9/QoPH56xopN4TKjG7+BpWrBcHxWQtQhiYebD0nAcoNRIiJp/Qb
         Qx3GAZjK32S0Pq7UAT3drpRCsHnQWT2GB5DwT4Im1xpRuGWE3+YA4ZxIVAnZW+enfvBO
         6Conneo3EAPU6XTy5GPIJyEin7vMHsdz5WLavNDJ9U//59dsQwzDv4pxpjLWyjki74YU
         6yPg==
X-Forwarded-Encrypted: i=1; AKwUvBzbRyvuGdvrmhjhlmoCFrQp+g2e3gkHn6gYeQUGCFr4VghU1zHUY2CBE2GNbGMBS/I6slIK2cVchavCIls=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpiJxWzDWvNnavqAHfOmxEeXToez4mDzeY3U1t4t9ydj4DH0sO
	zYOU7HsAbaIEbFOe8WQ1aEF9VtJPrXnq9vzRZUIFlR8L2670flhRSiiGSXQ7htrt5x9KETsXm2V
	lLBA+yl4vbAENuBuJUxS0nUrZiXH9d4M=
X-Gm-Gg: AYBFou1H0KEtjEn7Xeo2piCdXvmrr1CoiTDt7vDHxh49zj/O3RwJqxP9yAXPdQOLJuC
	jjNXfHXYR7+HC3lrcAyVUDuJ0/eV1WcBlvChBYTxVh0MtB0tJuFmc7goZGTpdQ1HYaVNMyhYLlL
	FGaa5xYb23LSXzzb2QAKIkIFTAYILks9iPTnILAUruTzoQ/WIckLLRLBHTJuBvicI7Wg6hRFcV/
	0jvA9ivHbkUGvay+z959psAI06xqo/4XG0WgnEA/Ym6hkcmFzn/vq6tBJhpHHJVh/TcuCTEZJ27
	3JBved3ztbOiYxgM7/TosLbht/JDuV7vT8c4gsXjXABL7QAPVL0AHAaL3hHSkVBjjHG5qLsf2zE
	DCZQ3Bc8d8oSdsvHS6y2PK35qx09y9tos9Ncw/R7tWKaaXTIB9+JolS8mlreRnzWMww7unhQ=
X-Received: by 2002:a05:6820:1391:b0:6dd:25a3:94dd with SMTP id
 006d021491bc7-70ba0e5707fmr3311431eaf.41.1793010000474; Mon, 26 Oct 2026
 03:20:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com> <at8h0ignZd8srvBi@ashevche-desk.local>
In-Reply-To: <at8h0ignZd8srvBi@ashevche-desk.local>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 15:49:49 +0530
X-Gm-Features: AclHuK_R5q_T7vpDB0YLNH0Ux2MdD6xxwDnqBRfktX82gSMvkXVTnMhZtHYzD28
Message-ID: <CAGLmz9+y5fXCf2-XFrFHfqAws5eODP4pSSro96R8vmt_aUQGMg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com, 
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> You must learn to provide a changelog!
> What has been changed? Why (whose request was that)?

Hi Andy,

Thanks for clarifying. I have sent the v3 patch and
added what you requested.

Thanks and regards,
Himanshu Bakshi
