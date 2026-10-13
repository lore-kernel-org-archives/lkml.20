Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE53E226D18
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855914; cv=pass; b=binCWGt89zGu9XULqyfahl7DUBtedInPRfKBWoHIp8ElTS6KH7TGVRGEbyQyAz+yn/arjGJjrWYYMNRelQnsbvrB40KPhZ35uEeJg8hEF9oQIUz48IMND74wUKqcQRm7Rel6V5gl284LM4TzQLLmA2uTRo1VNJEcOjoePOs6Jdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855914; c=relaxed/simple;
	bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJd2HH2A5701jqNA3hB3mIcWd2emTDnIUWWFgntuZLmNcw8xSJqrbOiepZsylX2B5FfgVfK7s+8G0ud0IfTTtNyVJ12n2s3FWyFCfnXvB7R0xK+5sY589PYZFzGd396h80G1Ul4F8uPe9k/MHJSNBUHFhyf8LXA1NyLJO+ZEdC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXsEqth1; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXsEqth1"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533952f3714so29252311cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791855911; cv=none;
        d=google.com; s=arc-20260327;
        b=ItbSdSz5/USmPPR94wbHDUHWkOT2JAPV4n3cSUvj6yyJltKPEA6TEOsh55ONzjwYS/
         ANxuatFTar+8cBWpi9qlLL5dVkzwhqL2BVgFCMfizP+inMA8ee7Kke8XabEZc5k0Ljp0
         tApIY4EhWcd+nsSFKAbrPe0dHtIKbJaR8/nXQ5NYapACTtmVT06LC1kaeJNwgaYdPEdv
         8kzK3qUQQURje7+hmLR69m19RlOeN8ElUl0ELlzG4HwkfcqUph1d5lHZ6vRwea7wf/IQ
         4s3c6YCDaLWbrDxEx1reDad6VtmipkYxAvK5aiQiezA4Ja5hysK0ki+u7Wn2yFZ/jive
         5KlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
        fh=LuWeaLFusQM8yPh6sV3gmGKtYJdz9ZqGWkgEhzVeh/Q=;
        b=NJIaFgBPs0eMOJ0eV0bK82xjVsTdogXxKZ/EXPcrXwmxv7scvTMmhgaghYN34fCQKd
         wXZcYFXJLGohJklAHV7bZQZuRzh2UrQQcGd2Qvzdk4tLUx6MjNxdPUz6sEEne2HDpdQe
         9DqbnmCKyKj20cXir1+n6O5cKNLKu8U3UitT1dzrul6eBlWDBUFnxG0gPxNHJisCCTO2
         cZypX4El02Dki4bI1CsNpz7uoLRXavgalDUNEcEiUO74uOrluavC7TC752o+82zfzJZu
         1QNqGmgOja9MvGz3faKY/vxwmN1ApgwYDGNsXZfVVoPI25EsvdcClDg/4jmKrsquNso9
         Hdzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791855911; x=1792460711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
        b=dXsEqth1P9jLVPPBygKZYVsdWxVsgJ001QvH6xJILCjdlHJNtXXFmUrPWXnAoaYPKf
         2YaADamCfb47RAK/+GZ5046cFz9FJJpDnLJkI9it/4Hq3rdXleE7Hxrl/O75O0aL68CY
         CcrmyphYhMN1nt6zk/rGRSdSOYgqW5fJK+YH8pY6JLdO/XMUNf06xVM9b1dvExYXqQ/2
         3bqQxG5m06URnmTFSCqEPcyziNcgwqLJfg6ayLpJ/z2JHxdF9KE7gcNPeWzmfheCD1Gp
         5mFlgszfUEdoVWbKZhQsP7WZsBQjnDTSjdR4BpWsN/47562yAJyrA1dDNr0BETOLfzg7
         CVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791855911; x=1792460711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
        b=A5CA57hUCjflrH1zAX/KEg+lCxO91Q8ieZq3SeECzqYr4iTvSya+NKdnD5RF9V7JzM
         QdTdRGOQAX1OofXA7OloFdJbZsew9jeqw7D+Zs3Zz6TFVQiweJ70SJm8Er14is2rI6fs
         hAmzBWCqIH4WKHsX6vPfgTc20yab9guHCLIYVknSahnRk1OkA0PAxw4cX/Z6lzc34GnM
         xRFmkZA8CKq0+BXaFcI8548LxLcxI1AsApFKX3d0qc9C8dX0j5a4SjKoh6Y8Rik5XSH4
         UIXcYWc794sTXrngLR96O4ynVyXN+HwvWqKVatd+HyAS5hBgwMXsFqpT/dYY9Q/nXs7+
         C0nw==
X-Forwarded-Encrypted: i=1; AKwUvBwBopONAYk6cfklVgeyPjA6iOQdP9ppuxdADIH3VGntn0A6etE0FQLNfX6p3+gzr4N7u69OMhWI++475Ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSgXT1XpYTxmLsNKT/Aw/vaBB+OcIFDU/9qGC/vnV8FNHmFEYv
	v3H6Dhg7cdrCsoBMsRkOsx8l9o1arrYa7jDRCpMrxzh3ZOrTQGFOv4ZZbMSXKrQ3OwKMJB6D7l9
	L1ywebk1ZCyOa9xyay2dWZKi4q1VYkXs=
X-Gm-Gg: AYBFou3XqC/0iiMpiSNTLPdq8Aqg+L+tow1IT+ugZMWR/S3yC9MhTIDddolOeI0CL1p
	EFiXKc/zdnDwjpXzOVf6DHtT1jJ8P0gkUQEhXtLxghWPlGC/TY+2ph6cc+bXbaksqvirU5yf3fQ
	gbnoWZmJEDe/hQRNF2Z0NrsiaHXoTzeOqxpH1dxOYJj/6XelVSH8GfbWb+qAdp1BLMnHgroAUck
	rUK3KucfuBx/WyjxQuNll1LV24KtMTLJXhMP5atib1rAdgdIQevEAr2MFRR/cSH37P8Ld1LYvr2
	svHk7mbet9lAD0YNBnbwLCCSkzVe3ZpMUoONlOy3k0gNkpZlTad+8affWg96jyw717lzpTQ32jr
	43EryfFMZXsH8QdjI+D6inEWYLgQ1z31qjTevqiq/E8HZoQE0hi8ydPnACTM4SVlWdbZ16g==
X-Received: by 2002:a05:622a:342:b0:530:430d:87f7 with SMTP id
 d75a77b69052e-5359fba77f7mr196535301cf.47.1791855910479; Mon, 12 Oct 2026
 18:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-vsock-guest-ns-v3-0-b32447c66b23@meta.com> <20261012-vsock-guest-ns-v3-4-b32447c66b23@meta.com>
In-Reply-To: <20261012-vsock-guest-ns-v3-4-b32447c66b23@meta.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 12 Oct 2026 22:44:55 -0300
X-Gm-Features: AclHuK-kA8q05fe6Esk_oixM2BCHb47BieLQLjZDYfiDhY6CS2aMRdOMVHtXa5s
Message-ID: <CAMAsx6fKVQaYLzkK34v5DRkmQS5Ym-XqwNh-+Jj_Uue8NJCNUg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/7] vsock: add a netlink command to assign
 the g2h device to a netns
To: bobbyeshleman@meta.com
Cc: sgarzare@redhat.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, stefanha@redhat.com, mst@redhat.com, 
	jasowangio@gmail.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	shuah@kernel.org, rdunlap@infradead.org, donald.hunter@gmail.com, 
	edumazet@kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	bobbyeshleman@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 12 de out. de 2026 =C3=A0s 19:51, Bobby Eshleman
<bobbyeshleman@meta.com> escreveu:
>
[...]
> + Movement to an unreachable local namespace results in sockets being
> + closed with ECONNRESET. Peers are not guaranteed to be notified via
> + an RST.

This reads a bit differently from the sysctl documentation in the same
patch, which says:

Connections established before the move, from a namespace that can no
longer reach the device, are closed with ``ECONNRESET``.

The net.rst wording also covers moving the device back to init_net from
a local namespace, which this sentence does not. Maybe use the same
wording here:

Connections established before the move, from a namespace that can
no longer reach the device, are closed with ECONNRESET. Peers are not
guaranteed to be notified via an RST.

Daniel
