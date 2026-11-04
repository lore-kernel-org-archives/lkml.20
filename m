Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793807737;
	b=AjRoqY+CLzdEEXTYmvC3f9+OQoGi9XriM+BOP9SWXRLK0CmI0cmIw/kD8ctiHM5DBYe7
	 qJz+oP1K2+kQQNDBrxRRmBnoz1N1N+z3EiAn9JboDyVzXHTbWE1Uew9YOuvSgdkpROBvC
	 darb40FBhP8tmrFjVm6O4O0b64I80zqk59ImnTWoy7Mi4Ni8zRZFdNcwlXiHHYgvg+6bi
	 ToZOjZxjplBHPZYgCmbFALrWcxIoLCQcH0lIr4y4w6jcpqwfX9Us6o/l0jq+LFFsQ1tZl
	 uWPjh3BeRMsT1TmoEz68wX2Fei/+UMHKMTuGedr3+Qn7CxhnOMXBoR9EGsKup9HmvhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uG3FhY5enp6KhprejgTETmEojafa/AG4GsoBAEaegu8=;
	b=jR2Q/OVeG1ANyUA1brX4gTaL9DDQbBFButLky7Qk4GPffcymI/JK/oAGbyDlN3XPubV1
	 tl7tBN7jZ9hWo2Li0EhJlZqsbp2saPe7sjzk8ntsxcP2xqDJc6D+lt3KEUp+1Pa9CfN1P
	 OKHQI2wv4HjGvwGBj8sha8rTlck+lG0uGDlIqQSLOj+g4YPvwprhKDTVONWvPD3BOuJsA
	 gANhw+dzZ3i0VwXfGQd92hSL9YmFGdqb6X7pcxNA39hgLx/7IZnxHNi4z5nSWwwHAECGg
	 j5eMir1YPcyFIFZvF4j1jJ6lbz+Cf5yFGY2p5O9j0IUaCaE2IkR7i/9ThTe28xVRlHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HLT/oMFj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7DA606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD7DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLT/oMFj
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6798af41644so760290d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793807736; cv=none;
        d=google.com; s=arc-20260327;
        b=Uvm5Tf4prsCyRS+kRuAkadibrJ/BjNC/w7sP23rFv7321UY7d03JhyTJEde9wCSZSy
         SCj/PhKNP9wFrByf3GRUR+HsIPulLjFtD9a1BgqcdAJ+eHbwl/1YEMA7lOPefOq3UhdL
         0r50AbmoGVT3FXpDw3qfdGN+lh9ByvgVAJiNcLdXfJO2dYIOVl0mX7NKrkHy4j2DFxZC
         b/9Ws1wbbWDNEiyfMns0sBy+9eiQWoMkdC6tiiFCkjFx15LgBvh4y9inoQLrLz7NVmbC
         0N2K3m4AZ/sCBXYGEbp9AkLHkZ3ZkTBQK6cuAEv10p7yE3c3O6H3LNBUXkse/qDplggf
         KDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=uG3FhY5enp6KhprejgTETmEojafa/AG4GsoBAEaegu8=;
        fh=4q9kPUleeQxFRrJO9YY8J3jqyQKSEd3h0ZU7a4qiyiQ=;
        b=KRKgk0sazEUrGeoGxQKbXF7oAStLPJdhk0o29SWfR7+SUUDFNUXrsaBAYcCTyX/PJ+
         YHHrOBrBogJbu1u7LoSjaSblMSo6DETKXRHC139VczHeXOt/F+nuOPYBmjcIcbddGgm2
         U5oHLldxi/x+VoHo2TKWnNZc8zFOeFBgvNfQ7h05UF5fcL9p0P2nhvDOk3cqVfM0YKtf
         +pUYlPKULWXYMyIPzy3WACxjOJ5qIrcoIdwIuJjMS+4xvEsiL4akxsDjgmB/7OZV67zX
         yb8LpbxY3ORyfmc3B520QBsnSgcCHukVxPjTTYmWqvbgj1X6NWr7nyD9WhW+ZCsv8ETH
         6jHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807736; x=1794412536; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uG3FhY5enp6KhprejgTETmEojafa/AG4GsoBAEaegu8=;
        b=HLT/oMFjNGn4sY4S1S6uyAgmI1YB1fhCB7y1bRIGt1mRPXVSqdOWn6nOsWxaZwATQ4
         WaRZarq/X7uzK46tSanVCHdLruxy/issjw0t2hGZQmG4UB9JUIMxd/G6rOUwsxiAp3jT
         aN/3DUlpvxX/vd8PDJSwMe8sdYmbLU3tSjwZ02yq8INCcGHuB5gCErKTl7qaGZdIw2cW
         ZCzsck0MUXIZoU24yaeKiVNjtea8fl+k+dXyhv1PrvJDyd3mPPcKsxoea5hf7o0ik++Y
         ubhJ8b10cQOH5BB6BNq4Q9bel1ViexgBv2yEvPh2xy8Y1iHVKGjg/G6iZD+OUrFxqw35
         nJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807736; x=1794412536;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uG3FhY5enp6KhprejgTETmEojafa/AG4GsoBAEaegu8=;
        b=UK+0e8AkTABrSfJ4l1kJAs1yiI9zbDsvRDujdbYsNQfZUJliNatK6PZ9M19ZwsXrsD
         fQGdlp7jJxNRS2oNj46ZaTsR2PORd/DBoy+4QmSghIBTuC/3zOrN7e1PwV5Tn70iWR3B
         12qaIxCVJ7AmGA3CIqSYKBGnUeo7Pxx1U2mEYwwQ1zINalRATCrb/HIzweFvUHuYzdcw
         j8zxOMqJFY5+SFZdQTjxkGntS+XdXFY3vZ3CYaj5i42hiHVAykSN62CpuFouva7Uecwg
         AlLyphMAObeftCbTH0yzzfpnx6Bf7IA5i0XyaVjmriPgN48Qmb8Cj8NWK6J7aDnypepi
         emLA==
X-Forwarded-Encrypted: i=1; AKwUvBzNfSxKcQzkl5Q0p+nFFvPS/7MzyWcw3fo5FyCuWl5IoK1Cgz2wC58blnvZH/TdFgG5XJ04WiZIQD/vU7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nu/vjQWuEWiNIjZ08i3gy3tRI/5bo0siarSyUmfXajHQacrre
	RE+pwlkZ6Kvejsne4em4bGn144bN7C8BdPvbkfntlBg2wfAvZEvmfG8cR+TDi+yvQyIND5eEcl3
	iScrHcEKf7yAXuZUXWgPurJPy7KAlI14=
X-Gm-Gg: AYBFou1J1kGhz9tEOwY6ABauepHBY7cye+njGVVR3GuzHVqRIKzkzbreWn1wiRqwfh/
	Oy0lrdyFWjCwbB/xJ8jtG7fEhyAjtBH5ZxcPPO1f1C0rJHLJ6+LDtu8xDrELM+JcLZJi+/Md0Ov
	Gv8nfaHPNUQxV1PeK0miG2BL8TsI8rmtRP9pbYhMRKJORJ3MmtjRKBSdQC22RO9qwzVvoTb6PgR
	vC5fQd2AdRg3u8oW/u87eOoJnVktFlE9A+0HixgixIeGBqud3LMd0MG5xhcL1y7wCgiAm1K2fCr
	WKuyysq6+TCnW9XofpokUYA3wZtWhcozTEIbaar0TPGJPjyqJ02zbvhML7SAGT+G+r698y26hff
	DyTuGLfuZdFitMX4V0vhcHRAstJCrJ8BrUkkw
X-Received: by 2002:a05:690e:4089:b0:67b:e9d5:89bd with SMTP id
 956f58d0204a3-67be9d58bddmr2433777d50.78.1793807735629; Wed, 04 Nov 2026
 07:55:35 -0800 (PST)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 09:55:34 -0600
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 09:55:34 -0600
In-Reply-To: <179377433748.488859.18424652819498691331@kernel.org>
References: <20261104063245.23402-1-0xbeac@gmail.com> <179377433748.488859.18424652819498691331@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: BeaCox <0xbeac@gmail.com>
Date: Wed, 4 Nov 2026 09:55:34 -0600
X-Gm-Features: AclHuK-d5MDjuPFIkWxVxOzfz5M0wSMntlCEi4c7058mPNhkapkJn4VyKormY0Q
Message-ID: <CAF2udye3be+BUfJoMoVwM2GC+REtfKn36dxuyCs4NW5eBLAE7Q@mail.gmail.com>
Subject: Re: [PATCH net 0/3] net: ethernet: disable async work before teardown
To: netdev-bot+sinfo@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The issues were found by manual code inspection while auditing
Ethernet remove paths for async work that can outlive the netdev (the
same teardown pattern as a missing cancel/disable_work_sync before
free_netdev). They were not hit in production and are not from syzbot.

Testing is as described in the cover letter: KASAN on QEMU/KVM
(x86-64, 2 vCPUs). There is no physical atl1 / enc28j60 / xgmac
hardware in the test setup; platform/SPI teardown was exercised with
test devices, and the atl1 probe path was not exercised.

If a later revision is needed for other reasons I will fold this into
the commit messages.

Thanks,
BeaCox

On Wed, Nov 4, 2026 at 6:38 AM netdev-bot+sinfo@kernel.org wrote:

> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
