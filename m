Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269302;
	b=pJi88FK5wkvCstszWb9qsnZHObOC9R+QjrIjYZiJfcmCgz7qpbFLNxQ5LslkguR9tDwb
	 AqzJ6YMfTniaOyvPBvCAkHjY8FrfD8it9+6zJwzaedI+80MrfsXjuBXLLsB0efJYZ9BIc
	 oXqonlsZX4gj2AmhlQ2ywHgGVGBa/r4aWpm4Nm7fm2yJO5L0Im4vtTAXDt4z0s7W0KaGZ
	 mfqzzyZwryAQQXoN6VwDw36Xe69WzHlU+eL9fiB12WM2dv+7rx6GHeI3VfUyYp4UGTUdC
	 qOZjIJE133qpDOpEoxdMRa9xcbaZiAIkDq9KqxSkhPSxgx285OSPRkt4nVk9fsW3scg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=p4CsFDjPOd5dzP69uoDvcx2oKYWrFhACnk9N0TgFakE=;
	b=j7XRiMDp1NLY6QrM3wKaF39rWqSLtgxU0AvUXVcZl+PVRrEsD8/jUnq6FkxUudmVsJiY
	 KEf/BzipGCXniS2CRiZhYrYA+h4NXdOrnBEHYLlEz29RIxTmBDRqm347CHhAydc18Pbgn
	 bwx9uTnh6d2WMP5rgsg3XlYGN3+4wP0dNSRDvuLcEIjZFfSencKAvDxyh8VRl2z55ZFRD
	 rIhKEOQ2COEIXnbdmyB/r+DCwod1sX6DIUqRvgbRmFR4YZh3KL4BvuLxtO0s6I6fbuE77
	 D13LV3hMmSbrXr+Vtp8v+5cUR/uBlxNqZ7PEZ4sFuW0LoSZWv9Ih0GZyOpKaHHEKsAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYEkEP0d;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B562606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B562606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYEkEP0d
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so3615347c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269301; x=1793874101; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p4CsFDjPOd5dzP69uoDvcx2oKYWrFhACnk9N0TgFakE=;
        b=bYEkEP0dNxlhTdG9foSUPIsWMX1MtvqNyYtlLTMcLbRq0lyy2cratV0BIr2gtYu5ia
         H4zg9Ixd+52wVE1IOa1nwYwk0JaaaTVOGzCRbxdtp8UMWRBohoa59HBAkTPnVp6UCjYG
         MM5tpk3Qrmw+LDihNTctddLyIJcWuFt153NjbOak20ztDLbLw8MGv7Ayc/Ncpd/eY3Q5
         g7OrNaKPat6T4uqBs/NJ5x4Js0oTp1QyHZlkxvIILTsOo9tvGe6YYKzHiuNHZC8yKsKC
         JClp1ejGPTY4+BGdjE4Jd4Kl1RXPXXteK7SPhdDpfqTYVwJuMrAI5HkWguqSUZ37URHf
         datQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269301; x=1793874101;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4CsFDjPOd5dzP69uoDvcx2oKYWrFhACnk9N0TgFakE=;
        b=H6CY5vLOBck+sBs4eRJ2EQuXJwf3VTqvH69I3y40Mua7J6HA6eA0wzHHfnScCpBMlJ
         QxI7XH7cGlsSAItDHKK/xYEciQLa9d4vrKdXzhGsiU6t6uXN0VRGBHnPZKmNZuIzcM7u
         kIAtQrsezcTGyMYRJ6I//IhLIZmZF+YYhwZ8kAffLqn6PvkieYTvrUyF8G9clJSlk5sc
         99e9nURd1wfajY55QmfNwtBupbMOGU9srv5jFTr8o5yrWwy/zKIIOAo01CNmGTH1q8uQ
         BAdpELSA+L2Y3vml2jqOqjnEs1BRx1L2bn5hYuEJR8OIxkqAmw0cR0ctECeq8VHFJRtq
         BFZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn56eQnDqMgctVOgR6N8UtCBqrdZxnQyXROfrPxnOGGLtUvoMgs9pu0NhUe21p6L2u7FgrYndDHUaVB3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwga29KWsyQ7kH+P210d8i2rt+k2JROxZMtVnjXWPpIztkC1JT
	Uf2rVmJfpQpJ15pOO4TKLfQuUcyBv7OtCWYYi+JWPndw0hRy2I5gvpqb
X-Gm-Gg: AYBFou1Ex0OFT2BdkNpkO25WtvUD82FM/BsqnXw4PuUGAj4/S1hy7E/8Narhb9RjBcy
	HXcQp+uDq4nXoH5x9tEDRz79Wrb7cW4PduJvwvzOi8R2KnOnk2Q1LX9SeAe+n3TnxHgTOBz+YA3
	SvC/pK9wMLrLb3ap701Heemn7isf5kmRvHAo+ae3D0hI4ro1U7JAg1H5TQHzwOsQQ4I3WKPIRE8
	oBwb0fGavdsBdA6RjAkTnhRG4yX5r+I2b4hK22ueqMz1X1HXxJjcI2nApg+igOotmAGiK9P5DXz
	I3cb/pIIq8BCKjHyMfZ1GieuwcDICA5WQf5piBWMyt/asRb8MEyO21rqFxZ1FMpej3wv9dU1O03
	ebIcjIN0xuqcQ2drKk61bsMllJ9zhABGWhPJOHOVzDlNvHcI+xXqNKgCuGi1hIqD+45wsY7sXEW
	+bIV+Syz4iMZUs2F8v7PxaYFPeXEE1d37Adr6ycYCsOpwax/SPvjjrtsQZgdgKiihpHxRHq3itI
	8onkYDKsTFDmF0zE189trmBrjp+W5y06BpMG4cpnJjP22tq57EV1xz4C9lR0xGRklfdYCC4tam9
	PCRNwF7XGTpKsit0QHE+HLHYSnxnzLK9mUeFWOZjdm+iYiCTtEftocnp/XI6pdDWCqw=
X-Received: by 2002:a05:701b:4211:10b0:18c:ad6d:b790 with SMTP id a92af1059eb24-1a6cf914593mr7053743c88.45.1793269300875;
        Thu, 29 Oct 2026 03:21:40 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm13556801c88.10.2026.10.29.03.21.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:21:40 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <20261029101859.6893f1a0@pumpkin>
Date: Thu, 29 Oct 2026 18:21:22 +0800
Cc: netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Eric Dumazet <edumazet@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <20261029101859.6893f1a0@pumpkin>
To: David Laight <david.laight.linux@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On Thu, 29 Oct 2026, David Laight wrote:
> If it isn't a silly question, how to connections in the other direction
> work?
>
> I'd have thought they'd need that ICMP message to get through.

Not silly at all. The frag-needed always goes back to whoever sent the
oversized packet, and only the client side filters inbound ICMP.

Server -> client (downloads): the server's full-size segment hits the
1456 hop, the router there sends frag-needed back to the server, which
accepts it, learns the PMTU and resends smaller segments. The server's
send side was never changed by 2640e6419594 (tcp_current_mss() still
uses the learned PMTU), so downloads always worked.

Client -> server (uploads): the client's full-size segment hits the same
hop, the frag-needed goes back towards the client (via the relay's
conntrack), and the client-side firewall drops it. The client never
learns to send smaller segments, so the upload stalls. Here the only
thing that kept segments small was the smaller MSS the server
advertised in its SYN-ACK, which is what the reverted commit removed.

Thanks,
Yongjian

