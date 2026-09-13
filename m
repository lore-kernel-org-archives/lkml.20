Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A61862
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789296761; cv=pass; b=luY07wPs7OnplcPayOEVyeoTp8PNctGzMnoe70M/axO5adetFmTyVBDZdP9ELc2JiCj3XOCVr0dyRktHwxCII4o5Tl7Q8iBKFS273Jxpx9QWl07hgqcdYe0UPdlUVDSHuqA48aLEi48WpAPr7m2ijIJpF9UdIGR7zmbaeATwZbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789296761; c=relaxed/simple;
	bh=HyVh81acv/VVqBYXU6pxEMuH4M9TDN+c0g3tvkqj9cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ME19uGYjoBdUtwOfFlQrKbhw1ABrjfMshJ9OFS3yYreTDzNpvyDNQZxgWNeiXpsSAmQcwLSwFUBUTzG/77VUjIb+TqeCKXUYzDSaWnwtTPkVkEiX+TJfKEFy6EFmjBnpp9wbmc+ODftTIKaMiCLZ6BgWi8vbBohK/NARCOISrkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Fb1IxcLH; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Fb1IxcLH"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so234791966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789296757; cv=none;
        d=google.com; s=arc-20260327;
        b=nfRUUoY6MTuzrEG9VUsBd9T10+mJDX0wOWmSGz+gGfSaidxVNtewMmKar1Y1XHEqA4
         awSyFe91GnasPrc3MnJdwAQJYHpfQe5Fp/DImQcoGk9IyTPiEJJ6IgZAS1BhkRJV+u35
         z3o+U3sYd89tLmPLWhs0IU5YmW0VcwP0UblFEEFrATGacHJdLDx5R6Ko/myNclRgX6Z2
         Wovz9ToRgj4lXZWV9SlghAkuO5/pgXbd5CSedAJUv0qQ1/9HwdQU29PO6Wrm6iOiRWLE
         n/KFu6NnJEp2c67r+YBbvRA7Ht/BTq14NE4xb+Yx208BoimG+5pX7VgzdasoicvYnLMt
         qd4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=58uaTRU0ZGtZ5APM0gUBEeUjm77f4k6S3m0b9dF1lbw=;
        fh=dkuVO92+1WeBOrDSVEj+rui9cxSlVODyCne9qT/61vY=;
        b=K9tnHbCW83JaZKNexu51mKKxbeEnf0uZKLwDRRTnfMiT25oYGG4tScH6NGQUKIsETY
         bGesyIHCndvArtYmTBYlQhQepJVbG+w3LcvdwCUXO3+YWHwYcp8+FEPoWZyj62gkII/7
         xFSOzLWeLFK36rjv4beca7Wmi/JxOnqSA10gSWvhL73kwZYOaJWKMcdHJ2F1AmAildEU
         WiPA4qFMn2+P8UA0DkYqCSDT3r6fYD7jT17/diof1DR8cLaPRUBj9Xk+GRpHj8ORBuIa
         8eXvFKlLZXrcgiKTxDusBS05W887EBmuxzUDwQVMD2YpRtHeBtSbK5IyAsZ6umB7jpsr
         PdnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1789296757; x=1789901557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=58uaTRU0ZGtZ5APM0gUBEeUjm77f4k6S3m0b9dF1lbw=;
        b=Fb1IxcLHN2rIfehzfR+zMTNISf3mmO5pctaH/xSqrvYv4sneu68+aI5PYd3MgkHfIR
         M8B7PbIOa4z5XUIU3c+oqmZsaxdztbW8twgbEdlPC21SBSj/Fe3DqlAETBOyLQBQaZI2
         P4ZRaVrKrYbPR+JCvZaMd5220FZB5/QoHbnZTHV9zUkjBOcuzJYhDJFcznAgPxQ6XVgz
         4sEEpdLQVF5dciZkfSOxmvujSLdIwz6TMP98A4Eka3Ww2JpXeAtOtMz5xLBPoe4WBso/
         JNoQsZetGOk9VUi9WPzeGOx214EumCLS1BoQPXt2eArBi3GuvURePsoIowuRsHMy28Ww
         Fqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789296757; x=1789901557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58uaTRU0ZGtZ5APM0gUBEeUjm77f4k6S3m0b9dF1lbw=;
        b=KZm9awxJV7zhCsJJ9rnCPBkj7ZkTwR3Ha/w/RiWb+3BljnfCCZ6DdFXGvphhgXyFoW
         Y9dPOW4JugSlQbD+BQ60T97UgrUaLdDns/yKhNH+UGVrPgEzgCfeqGYmnetX0c0XF6u6
         snLzRsvtEIOA0QQW4B9ZH4S7uVLXsg8QnNraNN3gbJl5JHMU3EP5ZN45o6bdI9kaLAqr
         dt3gXtuVaE2Oq355U4Hk8PEdRLlfvglr8sNU9uuROWFCKNARZlMzwlTSEdYj5BtVhb1d
         4xxBtVOUUmEpLR4K6tLXhVFK1WzUW1cjkXmugyUQqyZmm+i31mBR41gVs3Po/8iheGwR
         VxUA==
X-Forwarded-Encrypted: i=1; AKwUvBxJwTrHUjKQ9WDpWBi6hvs92Dkkx3fdm68W1I/kpyPxxNanFQSBPme1zUKVnV00PUo01GGrfDUUO+ke4Jo=@vger.kernel.org
X-Gm-Message-State: AFuF++mPIp79sP3gkTkW9QtuISX69Z7a32PBWxUGz5A4x7W7rNizNxxI
	ydeC1mzL3ZJzkAAB8URwRNoGNRULSdGfQ77I3wXPqC0sDVvwkMLvEdFIyJy9Ziv/xKXiG0XRL5T
	zDvne0mjeV8Qmtlkyp6w1vOGjizt5fYHpmsGTbCwWew==
X-Gm-Gg: AYBFou3pIcX+Od2RJtNP6q1RvulfEGbnRzpcFObBZ51mag37Mw0INlR+aYbZkQh2sHT
	7ltcXvu04MCq0fOobryGUtbpV/+WIpmkop9URYbPndOpik/dCBeK10B1Rt0hiPPg0cal3pjQ1Bh
	b5bssj3KBj4XuWNbXRO53AZy9kdopmApAePzVYjfYd+SYBbkFlY5JWOh6Ielj779WljUBMk1uDh
	TMwnMXuYXLjF8MYVBGEtcV0+om8OC80W+CmV2flDF3Qbh7ATEy3GhyOBKDkq2HnCvioGnD05G7u
	iADR1FhgVUfAkg8r7rc7X52KTeb2evNCYrmZH82LQXm+xeRA5VvRBNz8osYSFG6U1svnxEH5u7K
	7QyKPxK2O
X-Received: by 2002:a17:907:97c7:b0:c29:4d81:c5f0 with SMTP id
 a640c23a62f3a-c29665e7c76mr1262379666b.6.1789296756740; Sun, 13 Sep 2026
 03:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-b4-send-io-wq-cancel-v1-1-dcfe47275c6e@gmail.com>
In-Reply-To: <20260913-b4-send-io-wq-cancel-v1-1-dcfe47275c6e@gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Sun, 13 Sep 2026 12:52:25 +0200
X-Gm-Features: AcwNN1WP8ct_c9ixYHaWQ6Oz-ZmLKWkE3wdkcaAwGZtujFfZ6emAJXtmLpUuKq0
Message-ID: <CAKPOu+-Lp4uRX1v+RXXg0g2p260bOMx2JMaP___24tR8bQt0cw@mail.gmail.com>
Subject: Re: [PATCH] io_uring/io-wq: stop a single cancel after one running match
To: markdamirkan@gmail.com
Cc: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:30=E2=80=AFPM Mark Amirkan via B4 Relay
<devnull+markdamirkan.gmail.com@kernel.org> wrote:
> io_wq_worker_cancel() asks io_acct_for_each_worker() to stop after one
> match when cancel_all is clear.  io_acct_cancel_running_work() discards
> that result, so io_wq_cancel_running_work() continues into the other
> worker account with nr_running already set.
>
> If the first worker there also matches, one non-ALL cancel signals a
> request in both the bounded and unbounded accounts.
>
> Return the iterator result and stop scanning accounts after a match.
> IORING_ASYNC_CANCEL_ALL is unchanged because its callback does not stop
> the iteration.
>
> A test runs a blocking open in the bounded account and a blocking
> pipe-to-pipe splice in the unbounded account with the same user_data.
> Before this change both operations are interrupted by one cancel.  After
> the change only the open is interrupted, and the splice completes when
> input is supplied.
>
> Fixes: 751eedc4b4b7 ("io_uring/io-wq: move worker lists to struct io_wq_a=
cct")

Thanks, that is indeed a detail that I have missed in my commit.
(Bonus points for documenting the new io_acct_cancel_running_work()
return value. That's missing too often in the kernel, even in my own
commit.)

Reviewed-by: Max Kellermann <max.kellermann@ionos.com>

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
