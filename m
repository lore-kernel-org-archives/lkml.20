Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42005492E47
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926238; cv=pass; b=TGfCugRyupUUvw0yntucuhW0jBEOdEVcuYavP0Wkr1V/hkS8315NAyq88L+Ihcipzxa377mD0ogNFnTWOmdW4GsTqsZk96NckwXS+GrBQSHphsUGKGmAPI6HX+R4GFRPW4czEWpEqH0eF9Sc1TUywCCdxkxngtzb61oBkn+N4Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926238; c=relaxed/simple;
	bh=x21Fq+BMWsHXEBP0FNYN937Cc3gZGsVjLTugOGsEAA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=la/EvvHlX0zwJ1BxRanLNUVdXmJDIIvgLWO8l4b4HWtKKZFa/Hhv39hsRR3iTFDXU04JbObKNTdYP6Y5mMISAtz0tfxaa7OOWoxXL6POBZfp8MUHAwvO5f/75wKdU2Wr2U3fHOMfjY+qejOoXk0AxCtrF0OtoiKJl5Kne9S6Qq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCBLC2+/; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCBLC2+/"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66e64e6e3fbso4748932d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788926236; cv=none;
        d=google.com; s=arc-20260327;
        b=qtaJ0a7cir7d/1elDXTCVVuU9sGdjGkHB2X8CiFWnSsfOMfSfoClsVWXfJuiFzCCWv
         sm7VrbkBOh9FSm1BGKp6AOWKc6s/pbwE3jQDGKC11mppnUNvpWnOl6gREIhTLUPKt9fB
         TXs2Ks6zMu2rXUBSW3eCyLtHAw+3tdZSqCbrAt8q/zhrGdtRTd6tJMTchLsBU7R/Kw3Y
         4D3BGLaY3eBgJfoCDqB9tdLFoMF6e6CB49dEwFHbVtcwftifmMTe3IXTPMB9rVFduIKy
         7tKWW7MHci9Kp2BmLqlyiybfvtdPBy674Ky39kNx+pHhgICBnydXXpYewH61neCUer4y
         9rBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Od0mHSJulGCnv5qFieBy+atRCSjt7BOnlfDxonrmf8=;
        fh=GHF789pQAi/8VpaSb1CPp6tE3hZYslLI0EA2x0CVwuk=;
        b=V575x410BFoyiaQHMhtQw1agI7PpOjAFdeyi/V3AR4TQcDfc5sdVd3M+9wQ706GBPY
         JZJXj7dosSTpYaM74/ZC3+mPN6n+BLitLMbuPrtaN9hGaHkrKZhMzZl5xk75AXrEBeOc
         Wqb6VmJMI/mZTjudITa+6p/ZmRIJX6TyMF6HuieAJiRBjKTqeUQNQWmjWZj5zXazP07L
         KfvDlTAHMjSiUuSUMfMmjJBtNA2iX6yRkYpZW8t8EqVqbfPKnEung5qo7uQrtpYOJEhz
         chfpS9Up63bGsqpx5ICH2acwfCPtIwd6jrP/ksjADJ2bpMksFKZSL/gcfem21YQGJ8hH
         tW0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788926236; x=1789531036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Od0mHSJulGCnv5qFieBy+atRCSjt7BOnlfDxonrmf8=;
        b=iCBLC2+/E+fmfGz0UrYq9buZxZICDiZq5KWHP2ClWylQY1cjlcQoBaOTjZo4mww1Ay
         uqi8ZpdNtSNO/0Lw4YXbawx6k3cm0BxUTWA577zMc6cftqGFGz8UISMOCjsti4ObTZns
         WJofHAfL5d0YqEiHGUjYZShmafARCOhNJFxhDGaV78wA67Ujysk43Hi/5OKcoPmTBKN5
         Oq7VOBs55ghECl4LYJVNQE3lJ9vtSIQ8+hPaJ6OTfki4Rql6E66RM0JQL0m1nxWjdqQE
         MKtRDG5eMAjNLqljAfPzVXWavctj5ngoepi0W3yLB/vw2s4boL9wGCuqGl4IYm+9qg+x
         3xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788926236; x=1789531036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Od0mHSJulGCnv5qFieBy+atRCSjt7BOnlfDxonrmf8=;
        b=ILMB05nyG5uhIBG49XZnpP9fnKjF5xaMby02FluZH+2ab473OIBvZNleKxxCM9R6C5
         bnVfVlnI/ATTIm2QQAAqgVgPRVgjezxw9wqW754ZzpPf7X+uRHxApnINbDjRjsb+Q5An
         +SiTltTjBlZJy8c4BZ9bv6rr5wx7xm+jF7yzc9jZDoXF2nsyiwKELhUtv5sGsMSZmcFL
         HSHH7TlRChWbXeMS4Kr/zyRU+WrtLZWfZVFQ1AfLRdMLjcLHb974w7Xr1xjocQ7LLxtW
         WCgf9BX56xQ0vp8P6W0xbw3Hd81JR9dOC1TEnDDXdBSTkaVNhxS3dKI/N2wD1F0+m+XY
         Uzgw==
X-Forwarded-Encrypted: i=1; AKwUvByc8tvGfHUqiGwYQwoZssXlxE/ZoYF4GiaZ+XxjKxErkSxHmnNP3vrKD3Fg2kEU300YkWWb2JW5MREmUf4=@vger.kernel.org
X-Gm-Message-State: AFuF++mA0yZcYqXSJgEtPuau3KLIrFRQPvPtx073ru6V+nNr9kF9alKT
	x2lgR+prIQG2xu/ozjp3hHynxdH0dqe4Ws/zzXR5hOtsH5Zoxhf8t84C3Spxk4mtAo0Khgcx4nC
	5PoEvKbAH/k/PrWpmU/tWyUHKuzU1iA4=
X-Gm-Gg: AYBFou1irnCxEBPWMGAVUmdtmZOo3GhXUqYKG7OlXq5fysOVsGnl+6/tgT/omvL+1I2
	AiYI8ZhYrSiw6efxgB0kU4RcdhGsjQLrCx2RRkOw6p76c8eCqQ2PtAj/2BkBMFl0jYKrcKQCtYX
	n+m3KHY/WsYnxmRW/yqgiPKv9XZEJN0txYJbCXfaNY/8DiAjup6jLIbC75QyJhMq7HuHKUOigSn
	vHpn+pOlEjNuQaLD0WxIGBAmn8WBh5xdOfBZYYfXR9kiN+UI425w5keA2QaUP7TWjgs/ETQ88WJ
	LvoBy7bbWAXp7sukKRsLJgmijm+ayWDFsEQKfLlQiyf5YbJJyx/eTqxx+fKH7LDV94E3DZOTyTp
	QzZHNjE8W6muu5TqQ1QufdhXEcBUrTKJWeMLySBZ9zWTn
X-Received: by 2002:a05:690e:c46:b0:668:9230:e269 with SMTP id
 956f58d0204a3-66fc1bdd0edmr9162300d50.41.1788926236014; Tue, 08 Sep 2026
 20:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906054336.20187-1-kartikey406@gmail.com> <ap_S2eIZW6bYqZFU@hovoldconsulting.com>
In-Reply-To: <ap_S2eIZW6bYqZFU@hovoldconsulting.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 9 Sep 2026 09:27:04 +0530
X-Gm-Features: AcwNN1U9v-STXCm9TBNQNcZXEwsKruqtT516HWo-HvVQbqB54_1fWY9NUQ7MIsw
Message-ID: <CADhLXY5uybqOzB7iec4YhwrALAAXgt_67RNAua+kRVkCt0JD9Q@mail.gmail.com>
Subject: Re: [PATCH] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
To: Johan Hovold <johan@kernel.org>
Cc: david@ixit.cz, kuba@kernel.org, horms@kernel.org, error27@gmail.com, 
	gregkh@linuxfoundation.org, michael.thalmeier@hale.at, sameo@linux.intel.com, 
	oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:48=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>

> Are you missing an Assisted-by tag here?
>

Sure , I will add assisted-by tag .

> Just a drive-by comment, but should this not replace the existing
> datalen =3D=3D 0 check?
>
> >       if (frame->data[frame->ccid.datalen - 2] =3D=3D 0x63)
> >               return false;
>
> Johan

I will remove the older if (!frame->ccid.datalen)   check.

I will send patch v2 shortly

Thanks

Deepanshu
