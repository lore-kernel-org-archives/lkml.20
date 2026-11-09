Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229408;
	b=ZIuNquEQX7Mhfz50YF9/5Iyd5kQ/ERcqhEC60jLLC83PbBvXFJmh5d5VadBYFGq2wVCZ
	 jV+gml28dopnJ/SnliLy2ynsgi5VHLzJ2J1DP6Kn/JY7SNVlhFa5xsFhANgcqXKsvfPk1
	 Gx9QIzWxsWMG0SuHiAz64h9hqI+Bfi0v4HrVfKCrjBSwc84w5wPiBDFrE7BTpPUwIPsM+
	 zT69H4q2YjTGiWtbs2h+YCHO3CktodJT3neygtXxbRiIGZzLwmdtze2iS4rmG8LcwwBXh
	 Wv01/FqGkKdRiT5TIcASWuHDCZeh14flvUc/mWrholGjU5tCyMGWKe6+QpluS42jRqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=72Pzf80vHJ6tg7h9s2yhzIcCJ8giywOh4xxajI0FVfE=;
	b=GbSGeQuQ050bLT00/b4ulbws2EYdvcl4wEhLj7tuvnaaAWxNmK1Mz8OaVWeDTpOeGwij
	 jGS6Muly84GcJvzsdBPuEtDcpI+ZZHV4qHhQWFpn/z1ISYgdrSFpsB8vTkb4+JNA9uBJu
	 XS/cc22IoLJy/HeB2U4K7euLOvbyv9X82zFW2timCV/xovRwnDtb+DFVa6bB+U1bM25xs
	 ww+kBsGzHSSPW23M5agoE/H40jYAkI+OtGFdpSgT/5HGtrunilOgfnUHZc6T0J4UOMkp0
	 QxtZ/wqHbkCSF/v8MLLGtCaxET/e0R2yaap+9KQLgCtwipx7b6FcwDaZJlhaXwaYp/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Th6NR4gp;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2910606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2910606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Th6NR4gp
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91eb7d1478cso9159816d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229407; x=1794834207; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=72Pzf80vHJ6tg7h9s2yhzIcCJ8giywOh4xxajI0FVfE=;
        b=Th6NR4gpQlycRBLRjBND2+14b1JRjtLWr70u04hTBSAFERKPkfJOkUTK3TEdNyfRL1
         EdEWi4ne5l33XwRwB0IMecrK3EHlMksJaS2H9i4GxM3NATIPc+YcuZaUQ9+Us4vYWqu0
         a7opGItIC1bBR5aL256gy45CpuBuBzS9m6EJBcNYglPbaUfm6KjU+s0vzQDbqgTEukLK
         odJRimkIhb3JTbg75cf4GygFLOX8zJGE50MS07jGUEVGREv1k3k6wsr9OKQCh/zuCr0A
         1EKAsR/Sp/3331X2ZIGFsUFaefJHCQulLSSxIfqaMlOUKO31bI9O+oU65URNeAqzzp5C
         bNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229407; x=1794834207;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72Pzf80vHJ6tg7h9s2yhzIcCJ8giywOh4xxajI0FVfE=;
        b=a+H/+2D6LD+TaaJw4aWrLrlKo/9VZT0pPtRCbe1Dx5EGdVvkGsXrYFRL+o2rh+JDkK
         MeNQ0Rzhu86oM/g1+r0R0P2EesU8NJ0eqkAse7kEcrUVtXjjeOrK/iQL61QQsifHri/X
         Ixfq5W74HEZ9c5tjHrl9DdolU6eHLw4jlXJs9YRc+AE8hsEcpeluhSiboucafNUBPbI3
         X3Z7c3FzMYYIFSWCht9Z8duUvpZ+KJnrOeyxpEvFJ2mENFcx2xncTUHDvxvFQOv8LeuA
         JowxGW9W807FIQf/GsNtmKEUzp7iERgQzcKiV3NGonLfiHtVdFxUWLl603yi5Z7RtmU9
         PkfQ==
X-Forwarded-Encrypted: i=1; AL+hErFUBEzxiVyIc40dA/7EDQ6eN5M0/D+pO7ZlxlhPrr0cR2ldvvsAG0unzeZwFHCdojfoY9VQljnLffyj2GQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NZuIM4dTCOxXMKmrtZQihJvQu4TA8/aU6PGqrcUW0iKxpnrP1
	C1WbwfGXbNwlQHmy15eWcSNA1Vx+dsJ0AgZwsEzTNs5MwjsOBsvmiI27
X-Gm-Gg: AYBFou2nDgSj6XoK4MSXqN69Feyebhxim8qYyLCcXQZSg/LgS0yjcljTtA491Yky596
	n05gvYfWb1VrhtUkcF5dyVyuoa8+OHXYGP6GmcDxRgCwEtIshunzaTAkfgYpUr1xhU4zAuL526j
	44zR4aS5jbHj5A4fzTEYd0uSNWrCHy3wXBuS0NsIqRYojwyruR1rqZSnUKthvuuVUShppD+2Ktf
	C3eZr0IYFuBfowtaqqn7usBcoxwliv7WqQND+V6Klv5VIBOsAV53bl9Hhv4STDVJRDdgVdo1VVo
	3LbjPgghzextyQ4siqT+CPgktBe2ZwYZI1WbAwWJeUa7v3ZN5gBpB7Yz7SGYxo3Y8xbo+4lgvWW
	G7w9sH4imgKs9HPUQciuGJnCKa/BkEibK6oTyYjWTWMdIBPsCxEIsmcpUMwS3J6M4ozQlyXeHfn
	DUEojoCA0eLnxlkWViUfI/mDNbOJDb7SqOUfqK6jXimGK7JkrtpxkH8GtMvwTDIN4cmr1ZuWoDM
	WMiZWuHC/YDgtjir0lmSyFG6/StEz+ZXnJDJQyY5Pz91EIyToA1VAcxLweRB8CYa0pb7k9+24/s
	XaLSynVZqdczyGQ18NqkEblcQtbyEFqRKQ==
X-Received: by 2002:a05:620a:400b:b0:939:fde0:a71b with SMTP id af79cd13be357-947846073e3mr613394785a.0.1794229405262;
        Mon, 09 Nov 2026 05:03:25 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782d61906sm469034185a.14.2026.11.09.05.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:03:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 08:03:22 -0500
Message-Id: <DMQP8OMF2NZ2.3K3MJRWBNXWW@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v3 4/5] selftests: drv-net: psp: factor out psp
 connection setup
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-psp-v3-4-a8dd38f5a727@gmail.com>
 <179408516862.994134.13048510473902240219@kernel.org>
In-Reply-To: <179408516862.994134.13048510473902240219@kernel.org>

On Sat Nov 7, 2026 at 3:59 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The commit message says "Here we are adding some more error
>   paths, so we just handle errors by closing the data sock".
>
> --
>
> selftests: drv-net: psp: factor out psp connection setup
>
> This commit moves the PSP connection setup and the assoc uapi calls in
> psp.py and psp_responder.c into helpers. Other tests that start with a ke=
y
> exchange can then reuse that sequence. It also makes run_session() close
> the data socket when conn_setup_psp() fails.
>
>> The caller of conn_setup_psp() not handling errors was preexisting. Here
>> we are adding some more error paths, so we just handle errors by closing
>> the data sock to make the code a bit more robust.
>
> [Severity: Low]
> This isn't a bug, but is the "adding some more error paths" part still
> accurate for v3?
>
> Before this patch, conn_setup_psp() returned -1 in three cases:
> psp_rx_assoc() returning NULL, recv() returning < 0, and psp_tx_assoc()
> returning NULL.
>
> After the patch, it fails in the same three cases:
>
>     rx_assoc() returns -1 when rsp is NULL
>     conn_setup_psp() returns -1 when recv() returns < 0
>     tx_assoc() returns -1 when tsp is NULL
>
> The v3 changelog says the per-version key length table was replaced with
> the key length from the kernel's rx-assoc reply. That table lookup looks
> like the only new way this function could fail, so the sentence may be
> left over from v1/v2.
>

Ah darn. I let local sashiko convince me it was a good idea not to
ignore the return code of conn_setup_psp(), even though it is purely a
preexisting "issue". Then, when I was writing the commit message, I
think I was looking at the code from the next patch where
handle_tx_assoc() rekey handler, has an extra check against the key
length.

If I have to respin, I'll probably drop the code chunk below entirely.
Otherwise if we can just edit the sentence:

"Here we are adding some more error paths, so we just handle errors by
closing the data sock".

so it says,

"Handle preexisting errors from conn_setup_psp(). No new error paths are
introduced."

Then it would be accurate.

> The only behaviour change is in run_session():
>
>     if (conn_setup_psp(ys, opts, data_sock)) {
>         close(data_sock);
>         data_sock =3D -1;
>     }
>
> Could the commit message give the actual reason for that change? For
> example, the existing failures can leave a half set up data socket open.

