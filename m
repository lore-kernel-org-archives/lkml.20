Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C02D322E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265725; cv=none; b=CETM9hNwOiHxni9QuMj7LHexkVnpKWmWmhycreYFi1VvA/KId4WeyV5dtyhRsnwjWvBj15XFHM/Ucg2ifd7HDhEcoJr767MmbBnctSTMK+ZwkxfT1Iyyoaj/3b+Kxi/JslMEI0itUub933XwjtziduhyqaVO5LT2rBWsxfn1iEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265725; c=relaxed/simple;
	bh=uW5IpcCfdHEQSmaxthsTEiw3Xy8qTsaPJxs6r/lEbKY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=R6gFlVjvwxk7q/Jn+V2EEqBtUjRxFocYlXXrdNqI85/mzwvp9HbMM00CLj+6p2aNcJPRsQ2wUwj8m3O7ImEDQCAxiNvj9PvXozJP3NnN/cFN9sgrwZDtfTxfdH60Tw/xjn2/5gtZZK8f/2uTQ4i2VdTiUl742OctSCoY1i5Thzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yc59jZQ3; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yc59jZQ3"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5301db51586so10140721cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788265723; x=1788870523; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uW5IpcCfdHEQSmaxthsTEiw3Xy8qTsaPJxs6r/lEbKY=;
        b=Yc59jZQ3B7noFmYqX59wpcDQr2+olv0dSyT59CYwN0BCk8psQfRW0B6UqxO1mhzKFU
         0B14rBQGPe/XDPfUcwPvQFADAZ9ekgA6vmIyVtR//ObYUY7JtpzvOD9yY0pmPz6D+jgE
         piqa2wV4rU0J+kl00bJAmcZgpzvNNJ2gLPcXLUnmr0V72fTUD1+HcbtovERfx1Sz/z+F
         crV6Tq03/vftV9Ccjewt0nVasvBgWtuJXEJMFoHFwbeOpSkYQz6qrVJFOF7kqKgdS4Fa
         16u2EnXcJdfKCZwlY9ehPIwrsSdov6SGfpt5dYR/u9tsFs9ZU3Djhx3syk9clBJ/hiHn
         w2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265723; x=1788870523;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uW5IpcCfdHEQSmaxthsTEiw3Xy8qTsaPJxs6r/lEbKY=;
        b=iEvRhaqF5+jnkN7LOAIHfRKSDBv5z9IyN2oQCAwCH00g0iHFWEfDjYS71qM3al8yO3
         gZvuU4NtaA75JqF8HXxX/mm5FgLccHYt71MAQa4cXgp/3aum08iNnKBrOqZitX5PzY/X
         t/LDlWYMK1aCseaHzyB0tuvZ1jRAy0EO8GZEHspLiUzyE0dM04q21jfpqe43gA778GOU
         snzyq3/rg4P7JIjHyMqBfv+X1ZXXE/tJt+tEYpSz9qVr13rxIE95OKKE7dwAV1pa9xUn
         s01rkQ3MJUz88gGuxSug1cuRW2dtlcKU+TKNFXXRNyBotkXoMEHvfbpOL8hnnwR0JYcN
         j/sw==
X-Forwarded-Encrypted: i=1; AHgh+Rrnq8D54MXudTfZd/+kcUSGgoUAmcLLYcJ7JZqEmWcwlgEO4GK92MirMP5tIRtGNE/wdHrLO5rrz2NYPeA=@vger.kernel.org
X-Gm-Message-State: AFuF++kMBKEsx0S8qv+2cNS3xVql8Rr5PeJ1mJv0xPyY5PMKzDVrRmkj
	2hyMEuS/WAz4nqPPNXZThqmelYd6wOZdyv4uadBwF6mpe6OEpE2zIyIH
X-Gm-Gg: AR+sD135sBfQreYNfK5yfLKpyKaIB1R1Hc/+uU0FXy+spJL4+EGX/1ZsjkL/IkYlKFQ
	L35VZ5eXBk4+jvgk39O+2OzwJoWH3E1m77kuuVWDFNsiRuc35JECHySsEUrkg15OEU1j9sOdmyI
	nR4zM387fVoDhzo5a/EoXk9M6qxnFzLrdDu+MjJiW3eALZuW7WndJ1U3AYbiyJPt6y633X4Md99
	V/OpS8yKRIwSozHrcdiqIrJg3g10uehI8r4n4IdolrFIhWZ1veo704EJbg50NUIVT4CYPzFWPkK
	EeQOEft3xAWp977P2CdeuLaEGd0yaJmKaIMm3Bl3zBrjz+RQZHgUM2HFNCd3ApcoD1/KfVUlX3E
	TcZCVHJX+E2il/Bo742h/8N5PlshAk701rFPDBeJunWxsnLoVNCM3rijJTunnPtfJbhPiieN7e3
	Hb0HXL6oQ5dg6HOiPkjxxXOw62wp+3d1z/Xv/YcSLPzk0ayIgdU2DBcvRPSsGjpsbj1g==
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2940063485a.2.1788265722830;
        Tue, 01 Sep 2026 05:28:42 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939170142fesm1016077585a.7.2026.09.01.05.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:28:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 08:28:41 -0400
Message-Id: <DL3ZAJ3NEDKQ.2ZUNLEUPN0JIF@gmail.com>
Cc: "Eric Dumazet" <edumazet@google.com>, "Kuniyuki Iwashima"
 <kuniyu@google.com>, "Willem de Bruijn" <willemb@google.com>, "David S.
 Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Simon
 Horman" <horms@kernel.org>, "Daniel Zahka" <daniel.zahka@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: psp: do not inherit the Rx association on
 clone
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Paolo Abeni" <pabeni@redhat.com>, "Norbert Szetei"
 <norbert@doyensec.com>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <BC10EB92-ABB3-41B2-AB16-266BEEBE18C0@doyensec.com>
 <924455c8-9f62-491f-ae3c-ea2127f46769@redhat.com>
In-Reply-To: <924455c8-9f62-491f-ae3c-ea2127f46769@redhat.com>

On Tue Sep 1, 2026 at 6:01 AM EDT, Paolo Abeni wrote:
> On 8/29/26 6:56 PM, Norbert Szetei wrote:
>> sk->psp_assoc sits past sk_dontcopy_end, so sock_copy() copies it into
>> every socket accepted from a listener without taking a reference, while
>> inet_sock_destruct() puts for every inet socket. psp_twsk_init() does
>> refcount_inc() for the timewait socket, so a child closing through
>> TIME_WAIT cancels its own put and leaves the association with one
>> reference and N timewait sockets holding the same pointer. Closing the
>> listener frees it, and the timewait timers then put freed memory.
>>=20
>> Rejecting the association on a listening socket is not sufficient: a soc=
ket
>> can acquire one while established and then be turned back into a listene=
r,
>> because tcp_disconnect() leaves sk->psp_assoc in place.
>
> So rejecting the association on listener, and clearing on disconnect
> would be enough, right?

I think that would solve this problem with sk_clone(), but clearing out
the psp_assoc from the sk anywhere other than the socket destructor
makes me nervous because of the risk of leaking cleartext to the
network, or admitting cleartext the receive queue.

Specifically about tcp_disconnect(), the write queue purge won't save us
from skbs already queued to the device. I suppose if we clear out the
sk_validate_xmit_skb hook we have for psp, those would at least get
dropped first. After that there is still a hazard of the psp_assoc
cleanup deleting a tx key handle, while tx descriptors in the driver
ring are still referencing that. That is something for which we rely
upon psp skbs being socket owned until the driver tx completion path.

All that to say, I think the fix here is the best option.

>
> I think that would be preferable: it's a pity to add safeguard code to
> the datapath due to a syscall (disconnect) used mostly by fuzzers.
>
> /P

