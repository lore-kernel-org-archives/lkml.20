Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651509;
	b=gNESXKgWB++Cicaejz549I9BDk8hL0ylHFd2ffrNZ4FYsqifgBQylw8OjKcEFPm2tQl7
	 2j/WQCDv8+krcKPPd4Ta8r9JxDOLtYAEV07y0edkPxwT5l5VkUjiLBh/aayorD7b9xjbK
	 7FOwoqm/ewVjMo0pAqGayv0WJxKIrYLATBgKCH+KB5wKSevcefYoTL6mqG770eHyoUaMC
	 QfcNPOAwJZT7q3EYS4B4PNjLVI2CaToc5X/J56guyeE9pXdXKMJI6ciyq0/0eNmHN6X4f
	 s52gyIpr416SXuf3q3LgO7xHL0LZ4mYnw0Y4/Ws66YXVf3qoQywjnDoGZICt6otVzzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
	b=m171b0o6njbqNlbCmTS4b4RqbBN7l58Y5gZq60MmjWZiwhvVnjRb07RWG9Aws8DB1bQd
	 EKnvV9gNSDjUvrdZ/Xu+VlGR3g1i/Z4nhHr1MaNP/uz7DeGbmTq+uqQ5oZt9ixY1izrE5
	 bUEojUGnGbgu5RK80ylvAlPCFjUfLwMDRuXDMDdCD7DBM7DFi2DeIBHRZBI+xuVkR6zBp
	 xOUIgl7hOuhQ7i/IDTHurCjlO19DBARvOUe8blvvv9fks2OyXyjcnQohK1TCOxodK9KlS
	 lRCj0W1umE6DsR216ztKvXJkOjJdIQR5/ZA7XUuLZca8sZqIZghEDZ9GwuVYUxNxrMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAJQnj1J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F1E606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F1E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAJQnj1J
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2126a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651507; cv=none;
        d=google.com; s=arc-20260327;
        b=H/+np81nZeGHNr6pEuTzezNAolRf8wpwaNGTwwD4FVLDqwAozsI2MJGacEHGh714uw
         qZzCMAa77QYdgK9QW4dkn32hrqjMgR4arN7tGhtg12E1WvrzkV28qUPQ5DaTD3bx1c9s
         psFlTM/7LXiLpwsgIvRyY/zqkrKk14RMSPyqYvnTQFyUY6ne1o2IRu3cdx2XZLECRkQD
         NNqtYaws0XpRq9N3fhVCoCWRauGwn7LhWs6DHd8kPMecIqTnDYELf50K2/mEJSZrlAe7
         l17zgY6p2XYD3Mw5Qg0d45P8sMDCvkukZFl9q8TAyYJ2YahHaETGKeanNCVvEq++cxr+
         ABIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
        fh=e7hHRvcOT7SnmC0POe8RyliO5+6joy7PIemYyz+7ZGc=;
        b=F93unONCcGlzFS8ZCFeg5O0rpk0W6MyRm5YZf0U333Ic7LPdh+AYlpCgETqeQwbhqm
         oRoqU21AVEc8sHLPitd4PZGa/IsHG72cDjBCdGbMaJo3EWKqq3kEFQo65/YdP4Xl0uwL
         6vY4KeftHrE1GqJoROk2pwXY8T0zhq61olot1CHFNFIwy2CdX11HLUjJTe45LqhglEgN
         3hLZyhIlGR82EFrQxqa7hF0qGMx3iWA6eAK88vX6IFFVQBt77lP8zhqiGthFqseSO/L3
         6I+qw1dCwxVwhsj+nfxhthZeBZPAGmGV1qpnIUpXfjDG9vx4NPme8qtEZ7Qz2vi7nHZz
         VXGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651507; x=1794256307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
        b=AAJQnj1Ja11T23MVaTLcNycS+cUJrfMpwhSGmHetEgU0YRe4eRGM44pV2rGMMTbVSC
         vTj97Qw6X9pHx3UO3B/YV+Tt5TuvUx76pgo1Ha0VR/atoIse9D55YKYrUSVdYIMNktQW
         /KDFXZfnQ75dvbLD1S2Zsl3r6zjQhaBhJujHDe0GxmQcpzi4mVizJHSC8QnkB9ok0m+h
         uRGb22Jpp7sCGuFp/73CyZ9+yx1sxgJ412AnHSmAuh3TMXnpxkmncKRT254C1vRiFohY
         kQv7YfInJwo0rwgXpcvgCKtx4fLX/FS3PYMpYb+ZM8G4lbfc0fqQEEicCYIsiXPtDUkX
         8eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651507; x=1794256307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
        b=VPTuEZk9m7ML0k0pZ12T7aFoJXzjA57L4Eqlp9sXmVIaWuAp14E7tdB5Z3hWHpYAih
         6ot7ZFyswP9PZvVSpb680VdTiXo9BXpMp2LPbLxvIinOFSosdgTHBkHz/L7BA99RzWRJ
         Cnc9MD/KkRcKsQwxmXczPo9Lth7t+CqisMlWSBxkY9QnZJx7G0bQVo0i1xMLXbbX6VE8
         PT/U5X5vKoFdwnoiDu8gSp24U2ONlwgwJgd4qwfSPcaKRmVgeKD5os3lJ3644vSXbnUq
         yVO+MjGgINovP6GR51QQdm1+/OiyeDa5I7yapcOfs55ZI4OfOdamr1lSPoFszLdM3CaF
         6GnA==
X-Forwarded-Encrypted: i=1; AKwUvByzpxpEjAATCkDgMfDt0r+m5eGmCqVqGI7hLiY5RLj+TrnDLsp0p+GY97XoV/1ctXEa2SBOnn5DMvJz07A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TMAz3OEG9G2860tTG3CrBlVN9vke+jwgdzlm6Q4E2FtQj32+s
	an5I2tfv3f1I43LCvJrvXuin7uUETMt1C708Gd1blv5J3D7J8j19RBCMMbss1cLVRtbba8Hgjtv
	rZv0wF66G0vIgZXOnCK2JaCAEkmxqllXRLF/Rnqwl
X-Gm-Gg: AYBFou3j/XDByUQ66hqTd4XA/9gD5yxwnhHf89ikPjVkdz2ZSJLnyx7i7wPDHqS+aEI
	EGVWP5YczoU3f6pX7Bktf4Ga04mkaxYPVaUj7lBnt532Yb6WfJl4mqJwWBbZ4oQUOm24TtN00Sw
	D2iOup8l8L6HEeeWiYhs/lgK/nbZcnAHKk8VfqYMlZHfaW7i2bTLxC+5IAEzJlqkpT4e7Cplqhe
	hv9RxB8Vt3RfOTt+zc+nGk9EgJf0rHqRo/N4zmdpDwoRPjqBIKjjlgP03/NLCTV1VBS082kKoEe
	FAGu+aptrJY55pBkyS/GTO1nlHFygwMZLA8PF0zVfP4A3pdaVKkgxDViqrJ7er51rxcdPj6kN91
	LMRXfsjXKIQ1PLQqiiQZlXXKMksImBKzhoUp8WVqH7YysmaBQDzb3OZM8K92dtOtb69w=
X-Received: by 2002:aa7:d794:0:b0:6b4:2188:97d0 with SMTP id
 4fb4d7f45d1cf-6b539d22220mr5389a12.6.1793651506561; Mon, 02 Nov 2026 12:31:46
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-6-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-6-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:31:35 -0800
X-Gm-Features: AclHuK-pAzMpwpW_Jh3vV_sTtL85J3_WyWyUrIfAoS4gpBHVCa9xsaWfoYFzl4A
Message-ID: <CAHS8izM49sjB7QMv6eD_vws3D-JvR=vi9U=g5_tb-t70hJ=MWw@mail.gmail.com>
Subject: Re: [PATCH net-next 5/7] bnxt_en: limit netmem TX frags to 32KB
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> The TX BD length field is 16 bits wide. Limit netmem TX frags to the
> largest power of 2 which fits, which keeps 4K aligned frags 4K aligned.
>
> With 64K pages this already applies to PAGE_SIZE net_iovs, whose 64KB
> frags would otherwise wrap the BD length to 0 with BIG TCP.
>
> Tested on a 50Gb/s NIC: devmem TX from a 2MB hugepage-backed udmabuf
> runs at line rate with 2-3 frags per 64KB skb, none above 32KB.
>
> kperf output (sender side, 1 flow):
>
>   client: =3D=3D Source <sender>
>   client:   Tx 46.358 Gbps (174483046400 bytes in 30110590 usec)
>   client:   Rx  0.000 Gbps (0 bytes in 30110590 usec)
>   client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
>   client:           729   153 599     48    0 13893632 3147
>   client:   net CPU 71: usr: 0.03% sys: 0.06% idle:67.62% iow: 0.00% irq:=
 1.12% sirq:31.14%
>   client:   app CPU 72: usr: 0.16% sys: 6.01% idle:90.66% iow: 0.00% irq:=
 0.83% sirq: 2.32%
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Acked-by: Mina Almasry <almasrymina@google.com>


--=20
Thanks,
Mina
