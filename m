Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794683334;
	b=x0U7QXsrXYMFPxScMGvOQPxUkg4+s7eNN5A9Vc/5wxTjWO8qNTJZQxogyHKOBqDAqQC8
	 ZJpoUa9DnvRmEktRCmPP+Wabu4fxCptA4tHiiHMR9lhNDBC/TQMvTMIJByoft7AMjQ+J/
	 mBXJmEpakcpVVyar9Ke+x1fWNNYTMAbsHDz7l7X6mC4zSq50wFHGRvkUgmYIl47S27cwA
	 DQp4EQtjuISB9ypsAhSre2GL5nxHXJknpS9A1UWFt365ForVTKqIM5YoVGTb4nqCh6/8I
	 zJcENZYlPJ1ZOwyyjxAY/A7DR7fS5vdJlMy2FDhq3OBaOkfaawKVm/CXTsxExJMCuLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxmRDFoHxpt+qxahysWPY8cNjC08++XK90U4r6nVLsw=;
	b=TpUaWO65u5+UYEFsbPB8sXvsPbwQoHfEPiSf1vDs1A6fkNU5wwi6JYfG2PX5nU4jNLj7
	 vP0Abj7nd78ArS/QuVVau6VVC5T+/EdQ8pnAIzWprNrq24PC6iFWmzrKUX1I6NYA+bNKS
	 L+D0uSYmMP22u6vadiAmlRUfA7WvH2PL+29gI+44hMsNO1mhthE5YJ3iD016IVyCvwkFk
	 J+OJUIfm3NFyB6OaOIvJL1uI9BGtnjUB6zqzJ9kRImwpm1DQUPn5WX9mP/1WzxatwyHEO
	 KOcSTyakpdai3ZKbb1M8QFyWQspdsJ06aRKxFILEX5dfvFms/dsmnoW5V4UbaIYxJYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hX6nwmg8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95802606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95802606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hX6nwmg8
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so7614255ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794683333; cv=none;
        d=google.com; s=arc-20260327;
        b=FwJSa4ZELRTwvpMJGZHlvKCNadoVBKpTgenS/G3rNNHNMF/9wDvyFsHoeciNkXMzWW
         Q5huzwBmrM7nyty88iYz8LffrPWkyL/vgaBZGNoz3lGBmWGJ0YJLn35VL36W1hCU3hnC
         3+b5wilPXObgqRHB3iFQ27Wgygrh6OsWKMI5U1KPB6RulxANRpGyzWuxuvjObPo4Eqv5
         eSwsgmHvkQpy7JVgW3ngQu+QFP/ko9uYyareId8CzY8RrQtBbNESWoFX9KyyhGJie8JY
         TLwv6SYLEatl88pGO4Oxrbszj83mAh55PYHtIvOuTPSWIZqiQ/C9TyTXRdzSPCgFUQTL
         G09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxmRDFoHxpt+qxahysWPY8cNjC08++XK90U4r6nVLsw=;
        fh=eXhvudjB9VdfdLjt4v8tUZs6eU8RWTgM0KGlnLd1/O8=;
        b=gIoGhG0U5qjaygdZK0MG8KuZMbXZVXAgN8mopNysd4k/2iVoM6k9HI96wxNB2zdM7v
         vNOvRdZeBBxl+2FoJF3N6hVCkPa0r0sKWjRHGkkrRUyVI7YuHXmYgpMeWwnVgRS9Vdg9
         Kyb0ZQZx5C/V012AGuO8wt10Yyv4H626xCrkZqU8HTCNKH4NsXVPhnCId+SLzOrjHxJY
         phPjgKohPwt8OyMyKHWvM20KIEYguwISsfIw0na1BzcfVC0QC/t3THUt1GwrPEIhRItS
         rEzu+GGeJWmn0NgsvWRGeqSeX4RUUCvg2+nN8BNeQkO9XtuWkTcpZ/RCq0E9eO1bZ36G
         hVCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683333; x=1795288133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lxmRDFoHxpt+qxahysWPY8cNjC08++XK90U4r6nVLsw=;
        b=hX6nwmg8Rs65GoXZ5zZB7Gd+AOh9hOUa96uBWwnYwRTzYswLc3aPgt1QSSWIWJ2ZNL
         w1OYUFY9NOmjZaShrhx2Jj1npiVNQ04Y6Hhu/S4bTfRY274mBn73KcPczVJKNfaDyTq/
         s3EPjaXHTJx4ZUmVMtOGA+yLUeLpUtEhqR20JdQzsRQOCACtHjU4EzlwKOZC7SIxXH1w
         /D4nbX2IcT9o7JbKePam36e+s+dAAKf2HaVd137ni10RqdwaEWxW0E6gqIN2/d1OAQBG
         HpgEmk+cE8pKWnk/iVZuCp+BQ/Maeb2RHfQd/nXiMu3P8rJ1lUkCy8bZejy+nfIARXfJ
         sWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683333; x=1795288133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxmRDFoHxpt+qxahysWPY8cNjC08++XK90U4r6nVLsw=;
        b=clHWBV22yoGfCCFl97nU1binDNffzvpzd3aLiqDfeiaqOtRdHxm6J2sOclJG51cqoI
         lueX3KaNOY7nw/HWG5ebkpleslHjBAVnB7UoWWI3kXUWwbqjRJiKYsBdyFmMPHpA6zRS
         5RSZmmINSf41TxK8YlhWTwa1GgcijZjKKzW9G8Ox7gbvPzi7oaXKJie5dIf1/UWXlIRD
         69QE8OqVKKnneKhYsdJhvOQijOwXpsFPrJO2aWzlix4CcSIJIJqg3TSrinUOhqFClQVX
         4+NjxTes0EBoRfJx3rWxmCfVgRzMuy77wXooWr6+3mxV7WO5EC6LsQXMAmrCXSUu/ogE
         3tBQ==
X-Forwarded-Encrypted: i=1; AL+hErG49JI8G8xw371J8nt4gXH4L7or+MNoFy2NdWhxeyoNS0CMZQCOdwxdeM17n7w/bAEWxRjvsJ5zKdGGKuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ny409drNQa+o7C5R3gvueTbz6lMxxCQOfyCoOWnssKcHfUipo
	+3cVvu5gDIFno0NNLGfc5kWjo61BqWaKjKlW4ClbXagYFFmREEo5t0+8nV0eqLJNf/4PKVseuzP
	vV/rIw3ozpPsGX+1R0WoI5WlkRx28hjs=
X-Gm-Gg: AYBFou3gmBEjVLFCuR7GqmtRPHY7fDW9eT5aAebsUkgP2rfCVZMGc62ZSUeSvvj9Fe1
	lGfpIBs6pYi2JzEIXtdG70eF7hHXKQyDNS49p4aql33fRym0ySmkVDp/ZuQx5hTIWDrBpiPpiyE
	NOfmu0zg2I9/EoWOJ5xuoye4NcxtiKKols8EcaRh0u7BeGFdOVO9MIF9heUvJUYlzhhpQajzHJv
	X+0q0jSu8jneur5jhpyg113bLk/X9++zuJYYYwn+9tanDRRFT0vs/l8yOtudecKPR9J6xLD4QCe
	YdgWwdgfjBHMVjiWva42b2nZ61h3QB9anKfhgjQHFjDYkANdEvcQ3gvQy4FNCKfgdctY2Cscu9/
	GafeK/4U1bmHJUZNOYgFyvre5somHJS9CEvcTp2C+FvDgLfDV7nELQsSfK/9cIom7lq6mi+6k0O
	qiy3DOJbmLtkUExfz36nW8t1fs/rU7op0HaKcvs/2URzBGwo3JVjg=
X-Received: by 2002:a17:902:da86:b0:2ed:1fb0:7784 with SMTP id
 d9443c01a7336-2ee0da7bd5fmr58535095ad.10.1794683332797; Sat, 14 Nov 2026
 11:08:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030042138.73739-1-kylebot@openai.com>
In-Reply-To: <20261030042138.73739-1-kylebot@openai.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 14 Nov 2026 11:08:40 -0800
X-Gm-Features: AclHuK--H_3_n6VCnyOL61NaQc63vtDDD0D0yPb0rGJY-Xl4-Bos2pmaPEQ1p5E
Message-ID: <CAADnVQJ=nsuU6GTJFG8VnF1drWW9pQOy9=fB3UhUyRYAOUmGuQ@mail.gmail.com>
Subject: Re: [PATCH] net: skmsg: fix copy cursor when coalescing clones
To: Kyle Zeng <kylebot@openai.com>
Cc: bpf <bpf@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	outbounddisclosures@openai.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:22=E2=80=AFPM Kyle Zeng <kylebot@openai.com> wrot=
e:
>
> A splice or zero-copy append can leave the destination copy cursor at
> sg.end. If sk_msg_clone() subsequently coalesces with the last entry,
> sg.end does not advance and the cursor still points at an unused slot.
> sk_msg_memcopy_from_iter() can then walk around the ring and write into
> older entries, including file pages spliced from a read-only descriptor.
>
> Software TLS can reach this with an ordinary MSG_MORE send after a file
> splice and a splice from another TCP socket. Both TCP and the TLS
> encrypted-message allocation can use the sending task's page fragment,
> so the TCP-sourced plaintext can be contiguous with the next cloned
> encrypted-message range.
>
> When coalescing with an exhausted destination, move the copy cursor to
> the tail and set copybreak to its old length before extending it. Find
> the actual tail on each iteration using the ring iterator, including
> when end wraps to zero. Leave an existing copy cursor unchanged and
> preserve the normal coalescing, reference counting, and memory charging.
>
> Fixes: fda497e5f5b8 ("Optimize sk_msg_clone() by data merge to end dst sg=
 entry")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kyle Zeng <kylebot@openai.com>

pls respin and target bpf tree.

pw-bot: cr
