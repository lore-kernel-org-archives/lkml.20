Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794586995;
	b=yuzyfoGkqqJNCLpDcm+oLXonXHRavaTdovK6uRSktibM3dwWr0Zk7EG7Pvop3V8Q3/LX
	 aWMeSbm7N/KufdDKbrafmnnvWlWeMO4eZi20fvbsolYFHhstD92MIk8NhrMxcSijyli4O
	 B7mcJTXKEg9k7+ORIUcz3E+E1TU/6iEkt3DTaDLIZObV1K8wc+lxuQo98YpBP7TLoG5FB
	 Prtl8lg8EAG6AZBx7pZKLzgwIKol04ToQc52WRuqUTdkd3WOr5TyxL4N+kK5UsC2R8Cc9
	 a2E0QAu4YlyNat6SjRlAxGMrMBQmwVWQ1aXV1ueRpwJ7DMOp4p5iQSo1Afa1IkWboMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CJTYIzmEgvGVR2zpUCC/cFO0VF8PI0DwXdborWCtJ4Q=;
	b=BrfOtNYRKpiWKNgLTsAxK7b07KXrTzzMQg+UB3sgkHQiqW6g9IhKIg3I36zfpXEbd2IF
	 2B1dgyjhl8YFQN2boXMWJSggyXB/poJMIo9CWOZzajAMSmW/X9hhDA0vUR5z6X9swPcVD
	 yyx0XEdjGAEBkoEUJ8yCGXX1nlDUPQhLxnk1f2LwHE8E62/1coQaSccTZ0ykIqmCNY/oQ
	 8jSAFHwVyIaG+5g928i18H86DcZ2cbkTXywchu46PvjfC8YFM/aZd4o8c7mWTQKJ2Qtae
	 hpSKohBwkCVzEOm+5gTUBJy7yMRhdUTRmPA6HtypXFAAFnlD7eLfC8C32/1q96EQKBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pIFDfV5y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2350B606BA87
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2350B606BA87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pIFDfV5y
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4ad4072943dso343976fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:23:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794586994; cv=none;
        d=google.com; s=arc-20260327;
        b=NMIH2TC4A2ZrXJGe7sCCCgpVpXfHWz8w5CFn35ET4tE5IfTNbUZXgXRd4q0RlnPgWc
         Khgd+iR844MWgPE5MykLZbu+6iUPKkcIp7HbdY9ggDulyYqWgB5Y5MJKMIlxF35GltsJ
         scT1Do017AM5jJWS0vMnNRr+XDtWrV1T5KdI7/ZXmdOjx5iDCOxn/l/0s7X3MzmIPH0W
         6GvC0tJLmdqn7eyKcqRbvQVcyDLnXfD1YOBf/jETeRMUXYBWCC5q/6bPu8G0RcjbW35O
         dg9pf7XEhWph8WNCIP32KBsweblmc0O8qUe8yIlo9x8bc6GAvwTJ562WOOBKBXoMcBBt
         G8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CJTYIzmEgvGVR2zpUCC/cFO0VF8PI0DwXdborWCtJ4Q=;
        fh=LuWhLG2IDukOVFJ7J4dioTunxxo8REnV08+qFQKyRY4=;
        b=dz1G0Z2U2XAsh365DaOhmNaR0il2EGUVg2qijdfYswke4HNArecczoEZofhreB2t1G
         u63rWxP6gesDDWQdyPtb5AC9a+ioD9677YFLwYC912k7KQQ3XusErFEg3+hKyHr9eA1w
         60sfD1oWrEUuFimvysTHR04leFnN7YCLD41EZ6qHCGiwAzcqOmnc4zfz6KGd+Hv0JAkg
         B0P6+uyirgS+G7DieO14kb36yS/CImoYSUewl50kslOABJnA0lhC0UmH+ypyMVPSXe4z
         mneEc+FhttI/sIVcO6pG7U6yhZ6hDl7qcu5pMnOT6qQwfeES9hGcIwXD1Qf17i/MoSD4
         T8qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586994; x=1795191794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CJTYIzmEgvGVR2zpUCC/cFO0VF8PI0DwXdborWCtJ4Q=;
        b=pIFDfV5yKQjSU77PRiyLPDwL4kx3d0fNVxmtW1rtKvaKRnjf0VQSoTNjNJYWLKJTeN
         30Bb3GpQS/sQZ3jQQ726gaIb+eF4I8RCD/weWRvXtnQmF+1T90bGC+t7cyTkuZ/6v4pq
         yq4RIeO9IKvdMJktBFnXRqH6RXSCQ6iANN/3pFbcgXhI4tSxYG1EU4TTnuyvGIM/4cBD
         93iTS14KeK15fX8tQ52Jg77pcW15IXVivTxhlCu9RAvP0nZrwGlYi+NazXIYC/UFw5S3
         EChzWgnS0cVXvYGjQPg6KtFcIbhLty9vyDlMGvfU3KJBHdVpxcPg6BlQzbzTyQckwuRv
         VbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586994; x=1795191794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJTYIzmEgvGVR2zpUCC/cFO0VF8PI0DwXdborWCtJ4Q=;
        b=CfP4FYOXz/R/oYLycBsqW48XALEmO6ZRUvzohUBn1ij/0qWpTfYT0m8gjtqHhIhyK4
         WzLhHcAMQFvszF0514u8ipqvGwtclzcueapJnOD2sD25IhDIKgV+rtvOQc6bo5t71DOO
         KjmA35g1tUJ8j+7FhsDQqtlQqWUiWG0mtTxn6JNASsh65EkF6D4RF9mtjFVJ+20HnnPt
         KTwARWCl4qWwMoVMFnJoOJa/zUwDIrbN272xSAGFkVwgxOlxTAQx3DuARVmXglyU4GQ5
         Vi5fv10XdvC5y1eMXoPaOnkjrr9kpIb3YX4PE0T5uLpsqqiYxVC0VY2tNOSPB7cqvmhU
         Xmcw==
X-Forwarded-Encrypted: i=1; AL+hErE0a2BjvNiwF4w8yT06u/9FO7y3g6RPl+ZeUsjnGfTpAcrpTpQRchBfm2oRb6Pu9ZFra4daN1vbNC1BxEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K1Av0lqmeCn3zs62y94sjY6Y/SVwGpXstRbggwesbwinua/Jy
	KHVBvKaK89Kx0SihBBb8g4pJYfDemHIrU2aFn7OikOqidmUSyxMCZpelpbOyj2iWGlLXhs46fOZ
	Uy7EpFhIbnsFsscdcDbxbfMoEKGwjdM20AMzwhk8=
X-Gm-Gg: AYBFou1mC+W2arRau3g1R+TlPSrtFttS/jAitkY+cMmvhNA+0lhCQHexCFoURKYmXfG
	3yN9B+Xt6I8YQPZ08tBfpp/g1zRvYCfLsqu0YpMDhbGL99FRcfyGK86mhLbSSbrW8Bmo6LEOzn3
	HVEqcgP4jxRcSxoDrtOCWTi28vyhtqGLdmk1rZJ4VpK0ARmBPTMP1H/OnYfJ0SKc+sSN+1VGFAi
	tb4div16n4frlAmu0gv0bb1+D5aQE2E7MooZ4zf5fSFl41eP/pMpiVtp8QANMkDdb8qLaD56Db/
	7Uyg+St72Fj6p1hrnvEdonS/r386soh5jr137C5dixNUOZu1r6FMjHT3JndRh1TXXkD1VOuayFt
	7GsCoZrzEjWLft8Tv0K+eIDH5Kx70xAbgjC428XYM5dEnu0nOZA2vJiQonQAVfyNFxkejoi1ohG
	Bylz7RBjCjEaQeltOoXuDWe3nB/+wvcPTlsclOKGcACNqCEdPZJR9Szq7EPlk=
X-Received: by 2002:a05:6808:2220:b0:56d:3258:bd23 with SMTP id
 5614622812f47-56e6562e981mr1867273b6e.65.1794586993776; Fri, 13 Nov 2026
 08:23:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112173812.18696-1-piyus@iiitd.ac.in> <20261112173812.18696-2-piyus@iiitd.ac.in>
 <CABBYNZK4akYzoWc97v8FTXc77+godNTHASn8ZnfNji=jPd2oiw@mail.gmail.com> <CADq=QSz7GMXXjsykU87=6yCcWL1QX3NVOpxjQpJD3T2KG-nssw@mail.gmail.com>
In-Reply-To: <CADq=QSz7GMXXjsykU87=6yCcWL1QX3NVOpxjQpJD3T2KG-nssw@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 13 Nov 2026 11:23:02 -0500
X-Gm-Features: AclHuK8DtyOoUdbmb6DHHh2aXLVHhhaNU2EFb3ReHs-x-vDvJi2tW9GZvx5wqys
Message-ID: <CABBYNZKeBYiJTH6m+yo5bqfpmVO6cpqLcz5ZdQ0xvw5kjnGN9Q@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: L2CAP: clear the SDU before the receive callback
To: Piyus Kedia <piyus@iiitd.ac.in>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kapil Vaswani <kapil@presceralabs.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Piyus,

On Fri, Nov 13, 2026 at 11:20=E2=80=AFAM Piyus Kedia <piyus@iiitd.ac.in> wr=
ote:
>
> Hi Luiz,
>
> Thanks for sharing this!
>
> On the double free: that free isn't new. The block this patch replaces
> already did it,
>
> failed:
>   if (err) {
>       kfree_skb(skb);
>       kfree_skb(chan->sdu);
>
> with skb NULL by then, and l2cap_reassemble_sdu() has the same block.
> So if a shared skb can reach the callback, the existing code
> double-frees in exactly the same way - this patch neither adds that
> nor fixes it. What it fixes is the use-after-free on chan->sdu.
>
> As far as we can tell, it can't be shared here: skb_share_check() only
> acts when skb->users !=3D 1, and nothing on the ACL receive path takes a
> reference - the only two skb_get() calls in net/bluetooth are req_skb
> in hci_core.c and req_rsp in hci_sync.c, both on the HCI command path,
> and
> append_skb_frag() doesn't touch skb->users. We may be wrong about
> that, and if we are, the fix belongs in recv_pkt() rather than in each
> caller - it frees the caller's skb on one drop path and leaves it on
> the others. Happy to send a patch for that separately.
>
> You're also right that "frees the skb outright" was wrong: recv_pkt()
> consumes the skb on its success paths and leaves it to the caller on
> most of the drop paths. I have a v2 ready with that sentence fixed,
> but the diff is unchanged from v1. Please let us know if you want it
> posted.

Ive sent a fix the 6lowpan, so no need to respin this, I will add the
missing Fixes tag that sashiko flagged.
