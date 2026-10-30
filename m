Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389954;
	b=PMHGw7CZBVAUO+cxDbg/QtlPbTqo6RjFKD4QZx3vELaNK+x1O0ffRDA+ss3SooJz/JFi
	 YC6Br8fTC0PFDMes/Daiji3MZThJFg1gmGsdAaeyPwuwnBMqCRfuUAoY2NLevVr/pK+jH
	 +40oPlQ3Clv8HHjpZH6WVQYYCaakUuS/RjBjeCGLBwhuHiYbs+nHB8j9CvRPABFlRfMjf
	 vX7PmzTTx1Z1glReAwiyoVLFY0tSzSuthnMLo9wt5cZPQcdb/lRXrk4nb3s04Y0pSd9Rd
	 vKPyAK1rVNX5uDm46F0B+Usfl0Ki67YwlIKZ3zvuAHD1VsIEh/Xl60SmqqeRnW42TNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=J2FNx9D7Jgf8hIvN2HsGFMpO76oeiBS4WlAa4ihS6JU=;
	b=yjrEh+NaIzx2X5XA1Ugy4EiQSzTLgWJePwME71nkHRDPBt4TJq8xzYL/B1vQ+oYgv7d7
	 hUdsk4Ry9p/LO6+CC9m7AM6UTA/GqrNaXAJTkc8Dy1oeDVJiLu/pcJ2knDfWNeM36NKNV
	 dpmnTuHkYlKKtnqopRUAjeBVUKtE7SlxnRbxitS9eoTMT2QrQtNKrMtlAqUdT29l3BynP
	 h7ioTxju2JDMD2pUKTn3AYWAyMCrHvP0bC3ma8BYehwOxJ3Rw6QyQBuDQTxthxP88l1ae
	 /Hp9uMbp6GEXT/Ff8vzzPot/hdyAeeCW8Nz8eB4Zxjzljd+SqgRmxYTJweZ8qheqk5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seQZx+ZI;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8344606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8344606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seQZx+ZI
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10296055e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793389952; x=1793994752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2FNx9D7Jgf8hIvN2HsGFMpO76oeiBS4WlAa4ihS6JU=;
        b=seQZx+ZIbtq0KWnnRxo4qAuwbIfTV5M5Tt0hFEfcSZpVC/4qfxmXWAlgHkvqs7Fonf
         JP9ViFl0pEjC3CgF2HUO/WCVpmZY+4xvkwXY9cPeunqWxhvuyDIEWExuK2UJ9XZHsB7X
         PDv7KIS+vlLZU1gFWI219gYmvfDLiyVupNSrvHopLA/QfLBv7T0XmQvLIAVp+djwD5TH
         ftdz9KJ7ZJzUPr6GsdJniA5JJ+WDGjkb4enwdnu9d0Dn7D26fpf94Xjl+44GXJcWIRJX
         HeXegDYhhwLj9FqGAtu+EzOKHIf70/D95SuRDpU/wFukrpVI4VUn5VkLvVTKg65k0l+M
         /aYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389952; x=1793994752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2FNx9D7Jgf8hIvN2HsGFMpO76oeiBS4WlAa4ihS6JU=;
        b=VjDfsBgVv9Ppk/GDFikYiUcgckaXLOutT12CNX0tXS/w+V2PJ43XqEPa2XtIZ0crGa
         tSVxdXDMlznQFyMc9bw7YXjwTN05poPb83WXPkmYgMCvCLu/84vTBtsUjqdTQrw4EU4d
         3aP0i/3cxFoC68qje7WRkJgD9CcKbfDa2rM5yAcCap37kfS8xfkGOBkaOn9R+NNj3+Wd
         /sk8dCOPugruVvkcfVd3Izm5rM95N/ZkSctFuS4xlCgno9BdO+c5CClKUoAXpiT+VPyo
         ba7QrrGluCGJOonXOkc6+MVoj/rVyycjyLmXNCX1HHNObeuX0cl5KhDLMARXqC7rDWOt
         nomw==
X-Forwarded-Encrypted: i=1; AKwUvBxbku8XqQEMHGI2UcUfAi4FK65KFhgEiZl942mI9EMtBiDYtZHNZnY5z7s0GrqeMqQbZVtPEpxSLvbdjpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzGym/DumU+7NmZ+56ekPGAFUcIevd25FoMO3wHkvFzLriV/1k
	WPbGASXhs47Z6haNjcuB/TjNrrydqQTXaa9ZszOfoN/mapinf8a9zvFCsbfEfhz/
X-Gm-Gg: AYBFou3uLCcECMK4glIGK7wAFjVwCstm3njpvrTKIq6Vs2oQ4IOQvGMM6P2uvnys0AS
	LemHBVo+q2vyQ8ZHqD/vJlGX1wHW12PgeDmh0W9Sx9F7Qg4dYm6fCXg9x5SbgQ3oY1C2yo1fSM3
	dEg+G42YyfVSoqQGSIfw2EhkRKJBAnE7jcjWVdYSCiBDDQi4+EpW0SII8ZjPGGvnHXbrr4dQmBd
	/JOg232WH9C6vuDpj+e5rmCEKGIev8yZpwTUjwALgrPPdrkcEW2TCQvsvFtBzQF+12hxqxI+85O
	Zp6dN28MNADN6FssVU5Ocb4z4OEKwRrSZBkxMCGGYw4uTaJw2mK6lgVUHfpzLL3DKlnJ3nNkyu6
	whrCvF3fJoDCDzx0kDkIuecJsM5m7VkIiNRHyoNaR8yZn2aLnkzrJCDWM+PoXYodvzyOzrDziFy
	7O+/2bXxsXC+aT5W+QCuIeNdbqEFKJntMKeUCytv7VlENBdy1bS8L/2Oa+58iIZK6uf3YMSk7OI
	yliCzdLnYlXbU9EwXB0zIMIOW6jH7d7sKgPHhtqHskDgLT8n2ONrsqUhXPR73DA3kdzMtAzgLnz
	cNdLIvJMYYb21IN4Ss39WTyl8MHPizZVM7HKmU0QoMfNpH8pDu1VE92yUI/XnDduGwHZERQilmj
	WIJVYCdqmlmI=
X-Received: by 2002:a05:600c:630d:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4ac150b38abmr73624505e9.3.1793389951966;
        Fri, 30 Oct 2026 12:52:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm179193345e9.5.2026.10.30.12.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:52:31 -0700 (PDT)
Date: Fri, 30 Oct 2026 19:52:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Zhou Qiuyue <n0ps1edzz@gmail.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Hangbin Liu
 <hangbin.liu@linux.dev>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net v2] ipv6: raw: fix use-after-free in
 rawv6_send_hdrinc()
Message-ID: <20261030195229.50841726@pumpkin>
In-Reply-To: <179338190237.9376.13820542101227461550@gmail.com>
References: <20261026044808.613-1-n0ps1edzz@gmail.com>
	<20261030160532.4832d994@pumpkin>
	<179338190237.9376.13820542101227461550@gmail.com>
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

On Sat, 31 Oct 2026 01:38:22 +0800
Zhou Qiuyue <n0ps1edzz@gmail.com> wrote:

> Thanks, David.
> 
> Yes, in the redirect case it passes the old rt->dst.dev, while skb->dst
> has already been replaced. That changes the NF_HOOK outdev, so it
> probably belongs in a separate fix.

Does that actually mean that it doesn't matter?
Or has no one every actually used that path.

What holds the reference on rt->dst.dev?
Something needs to stop the interface (I think that is what it is)
being deleted mid request.

> A bare rt6i_idev or dst.dev pointer looks unsafe, since dropping the old
> route drops the refs they rely on. An explicit hold/put could replace the
> RCU lock, but adds per-packet refs, and doesn't avoid the deferred route
> free. As far as I can tell, that uses the embedded dst rcu_head; the
> temporary rt6 in this path comes from the existing HDRINCL lookup, and v2
> doesn't add a new alloc/free there.
> 
> I'll test moving the RCU read lock before l3mdev_ip6_out().

IIRC the rcu free happens for every packet and uses kmalloc() to add
the item to the list of things to be freed. So an extra reference count
may be better - especially since it should let you do a not-rcu free
of the temporary rt.

In the non-redirect case the temporary rt_info would have a reference
count of 2, one owned by the skb, the other be the sending function.
That would mean it could safely be freed at the end of transmit.

I've not looked today, but I remember this code always allocating
an rt_info for our application that was sending udp using raw sockets.
The app uses a different raw socket for each thread that sends udp
in order to guarantee the sendmsg() doesn't block anywhere.
(There are associated udp sockets, they have to be unconnected and are
only used for receive - monitoring 10k of those is 'interesting'.)

David
