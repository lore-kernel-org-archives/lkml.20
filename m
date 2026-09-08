Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D6859E32C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788893896; cv=none; b=HjfbsG9QpZIsrfNWCBl64pJQSq0ikTGosHKGetY7xWnM58MtUH0+Op9TdMvXSVu98V6WIlDexkXPS+SlFC3tfnaazV5MUse/uJSBPbWFXITax0W+8M4L+lfCzq7o1fZXJBuFmdsB4zZgtEqL9eEHEkRl0WXSTFpmkwlt1GIK5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788893896; c=relaxed/simple;
	bh=gqkuU84b8kPfsWpTSDmU6qwxuQ/o0bHVzk4L84MkgEM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AA/lNa7+Ck5D7fyqg6yvo6q1RHE9n4ItlpQ0q/QxAJdDv5YUBkda1VG7ut5q+cjMKfWmb1UhTkqJbKQ8qThl4/6V41qz4mpQTxL/MBndspEFbrtIvLXsHeY2sEzZpF926tkPgku+VrJjKlBq5jgT66Zt9QEM17I2VzUh7+IpMns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tkzv5ouC; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tkzv5ouC"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90cd8e45460so69551266d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788893893; x=1789498693; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gqkuU84b8kPfsWpTSDmU6qwxuQ/o0bHVzk4L84MkgEM=;
        b=Tkzv5ouC3f0Wmaxj3dlgs3YUuOxaEzWhoLI9hcqEQt91YA6AcV/CKXjdLb15VNDnpH
         8IoTfGMeNjZHUDhW/3Viq/0qdoV1z0e2b0WMTt4ZTs4tlq/J5LkhKgfiNtsdgvURturX
         3daznP/ewNtg5vadnApFsXDvy6OzpraxNQLwQNfho5kyVRmj26lZG8qCmsDXeeEkz99A
         vNSRaF8XQP3M4uHVGw/rcVH1YsvF7TpjSA2zqttt2/0Y7RR1ewm2qM29CI9qphrYrTPO
         XCXpV2ljZV5Y61T9EAMLcZcbKFqcDiPu0c4qsPa3QSpiZl9dhevqF4uArOCCblAF9s7X
         DlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788893893; x=1789498693;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqkuU84b8kPfsWpTSDmU6qwxuQ/o0bHVzk4L84MkgEM=;
        b=NMk1Rc0/HTHjDdJEbdEMBEuzJxaALMZc0HQfL9rHC8H5nuKRXmbHf1AucRtn4IUcUQ
         irE1hmeEUeIioqSkPreKE2HtrCBcMfnbSPjilDTsGqlQnW27McQC7JIFzEg8riDlMWZD
         bOyPAUlrxVnp453GNdLxuc5cJJNAnXVnTHtx30MEXEzknXxAGDxbDygfyUMIaZnq98dN
         Jwo7pkoLY4L190EdVlc49pRCZSuYYpSjkaQp/h6+KNnVxe2YPaK4fIyKkSbka+rLLS/p
         3+kbf4z+djbJfiqSsJiX9AbWLaAmto8TfDnjILfS38g4lgL4I1YPFpF26Z7wups8UyUF
         ZXLQ==
X-Forwarded-Encrypted: i=1; AKwUvByT70dyIG8gB0JdtwnPglrDBnsAiIBmpOXsvbmsrTTsXIWJp8of4ginofLN61BcdoJcokbFjHgGC9wT+3E=@vger.kernel.org
X-Gm-Message-State: AFuF++m9KzQhibK8zaNkBCSDSOPp4wIFdESMVqbuICISUQvJgPyjhq7q
	fe7bYSOrETv+WrnL7z0+DZU9OblpC/IEP/SHuayLthDe05GYdQp0/2Wb
X-Gm-Gg: AYBFou0/2X6eICfftlLjMTwKaTtafITVwjHecLsO0d2H1r5ZCGu/qpLHAhUgASHKYAg
	xxXP4hdVSL83sXAviOXr7EEbRb+seqTAr9FCmgGTXuctUAmKulcRGpACRTmCxlfSZV2sD/SuQJG
	CPvEX7pkG402yee5725bBduvUC+7lIo+GUvsL2ZrthZrFFxpRTrYkY5B0fMMPr7/Vxc/FnaV3xP
	f4esoh1TclbSxw0LT4fQVxGoZSpHsRngVuVnVWil3tF427PgkU1Y/nXaoBtZ3rKBjk7fGNgvnyY
	EN+9EBuOXnhQpZELNZywsOM0ZrHUOwhtbycRCIh6QzXwBtw/DdAyR7efkVLMazCQoFo5HOgZf9v
	bMe7jV1hNYscWg2iLzmOgvnRPiUNk0jmN58HkYvrqGmdnXYv06yJ5MD74czRaOi+kc5DM47FPD4
	uBT4HqZNgJ1kQIsbf8mQwBhpXjgQw4OfEgqRv4EYP+dmcHGFPhaH3pXEbYseMBOuA69w==
X-Received: by 2002:a05:6214:2b89:b0:90e:8424:4068 with SMTP id 6a1803df08f44-9103f01236emr374454066d6.24.1788893893267;
        Tue, 08 Sep 2026 11:58:13 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406b0f51sm123602326d6.42.2026.09.08.11.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 14:58:11 -0400
Message-Id: <DLA5YKSPNN9K.1P59JIGVRUNK3@gmail.com>
Cc: <patchwork-bot+netdevbpf@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <horms@kernel.org>, <andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 0/4] psp: make tx key ops optional for drivers
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>, "Daniel Zahka"
 <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
 <178882561539.3212362.10949911837502586488.git-patchwork-notify@kernel.org>
 <DL9ZTV87UI2A.2QIEPTDS2ROKA@gmail.com> <20260908103326.7b240216@kernel.org>
In-Reply-To: <20260908103326.7b240216@kernel.org>

On Tue Sep 8, 2026 at 1:33 PM EDT, Jakub Kicinski wrote:
> On Tue, 08 Sep 2026 10:09:56 -0400 Daniel Zahka wrote:
>> On Mon Sep 7, 2026 at 8:00 PM EDT, patchwork-bot+netdevbpf wrote:
>> > On Thu, 03 Sep 2026 18:33:58 -0700 you wrote: =20
>> >> This is the first of two series which together implement rekeying PSP
>> >> protected tcp connections. Here are both series together on github:
>> >> https://github.com/danieldzahka/linux/commits/psp-rekey-split/
>> >>=20
>> >> This first series is mostly non-functional changes, except for the mi=
nor
>> >> difference that netdevsim driver implements tx key ops. Its tx key op=
s
>> >> were basically NOPs, and in the future PSP core can subsume the assoc
>> >> counting that it was doing.
>>
>> Thanks. I think applying was the right move, but I would like to
>> highlight something that sashiko flagged on patch 4, as I think it will
>> need to be addressed with its own series. The hazard is preexisting and
>> much broader than the way sashiko talks about it.=20
>
> Ugh, yes, the complaint was sort of besides the point so Clashiko
> has dropped it. But the problem behind it is real.
>
>> The high level idea is that netdev core should probably take extra care
>> to make sure users of sk_validate_xmit_skb (psp and ktls) cannot clobber
>> what each other has set for that callback. In the case of psp vs. ktls,
>> there are probably fundamental reasons why these should be kept mutually
>> exclusive and their uapis should reject attempts to transition between
>> them.
>>=20
>> More generally however, any offloads wishing to claim
>> sk_validate_xmit_skb should be considered mutually exclusive, and netdev
>> core may benefit from a generic system to enforce ownership. That would
>> help in case another user of sk_validate_xmit_skb comes along later.
>
> There could also be confusion about the meaning of the decrypted bit in
> the skb. Off the top of my head Rx TLS is shared between offload and
> non-offload so SW TLS Rx ingesting a PSP packet may think that it was
> TLS decrypted today. We should reject any TLS+PSP, not just
> validate_xmit.
>
> Both setup paths are under socket lock so it's a relatively
> straightforward fix?=20

Yes. I'll put a fix together.
