Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866358;
	b=Euqwsvsu8vSCvip5cRl1uxfIPFhquTYeaqP9ndB5Rb/96smuUJHscNhRRAWuL2sXepbF
	 EQHg26+u+D0QM0GqS7lUv6MjKcN5yIeLuWKza/zCjC4nC0fyYCJ7KW6rD+wQsMZLCdTzW
	 Gde4FTb5HZhA8jIbuw2USP6uwhPJU8MOygKdLsWWpUBr9afI8l47kFzVjlP+i/OPCj/j+
	 P59wgNmxpiO1dADXq1ZV7UDnmPXxenW6/rWYP7uwR40NzqYt6ClrOi4BW2JMPe5fw+vKm
	 wbc8JyX+jHjBZ6DwFLx1sjEoX8MkqgV24CF2mYQsR4w6DHDfOrQmfdcp1XlBDKG2G6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zBAw8dUpXWrrifwZKQf8BbOPDmksqO35VTEdiKGvRdg=;
	b=Z2BPasQ8xlsqcQ5S6VCknVWZnL4ZOEUUcVE2jqF/O6BYOiwEqAnusZZ47fvS4AGBZPgk
	 J8akH4yrilV1JBaDLzhMt7H493DWWpU3LFS/We9/F6gny5xL8g+AO2qoG/8bpsCuJxK0a
	 bncKwyHoEB4haRGHUTyTuB1A52Yo5/EAB3moVZKgxJmi07uMkQ/Ltx1uworRKEHFxroKw
	 d9NHCcNO8YmReHeftxVon6gcgF6Nl2XJUgxJWoyqx/Xr2PhiiUGIB7EOCNr3yylBSVAue
	 RyMONFKRAuugkFOgV75PzA5uwUZdfm5dHaZ7RfmXh+EJdPmL46j3ggo8wzqNaVOXu4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jYBaJrwu;
	arc=none smtp.remote-ip=209.85.217.72
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4B8606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jYBaJrwu
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2ecff433dso3217052137.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794866357; x=1795471157; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBAw8dUpXWrrifwZKQf8BbOPDmksqO35VTEdiKGvRdg=;
        b=jYBaJrwuepVTUU6d1yi/dQxjFzIul4hpcJ76pIc9G/Uvuj/jiqT8o5nw2IKaZbwlAT
         5wl3G96Q9o8GtygjXozKV6gMl5B35cr/8+X3jn//cJhsfqwMPbliu8KMD5q19bBb5eii
         mlmx/rqwoQkpBKmiCuPaEs9beGGbj2C+HQWJ5T18qLKrCx27b7KGHYNlmvoHtDcXBmK6
         h6+cidKqWqPba6q8UN2+ZL54aHEyX6zoYIWzrpN5Gk/fzxXcBZggURN07wYCR4syz9Ta
         VcgtnUviwzccehGi6WRw5m1NnsFb8UWGPsINCcYFWJjDwkjIg1zCdvGg8EFf9cdW3DGg
         NjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866357; x=1795471157;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBAw8dUpXWrrifwZKQf8BbOPDmksqO35VTEdiKGvRdg=;
        b=N2sNBT35LD7BA2F7ghq4AWJ5DcqBlLb4aKSjVzbboq5R02ihWf6IzNYEetUHiQ7Lg6
         JGwUYKrWqBAFxAYN7U7cR+eQNcg1jg8mpMLxPl3QIc3jB3U7GpcAK+xc57PHJyRr69EX
         uvYhROQV9jpxk2I+qY5BeE47uSYHjjQerHmXrWbREYa400xVloOwhWtl7nMAoG5ROwRs
         Il6o4UFSy4yiUwH0hpgdpR7nhs76wWIonvUNXhJwxcRVHa7tB34GtC5ykuYKFNqQmYUa
         /9dRmToOTqPP3crL9tD9LCkQ/F7vzbbMAfnTVN0DUiKddefyr+vj/Yla23qrX9UALWfz
         HmSg==
X-Forwarded-Encrypted: i=1; AL+hErHa0NsPazVfqGOUW7Q7qrDl1nCpgkgUE4fzjrXFHWgi774xPt0ySXOGOqlBAj77wulVDEmAf0MWMTVLbp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YJpcbKz1CEZ40IZS33w/YYZmvR3P36uMYo37q30t7xdfD/GfJ
	noJ74dv/T64vI5tzbLt/Nrz9IiScdwy+brF74HqVl76oO2BcSHTbr7Mfpq5EngKwjzHOrh33Xfv
	lbYAkt0PFM1fc7/pbCFe4v0xZeA==
X-Received: from vsrf7.prod.google.com ([2002:a67:fd07:0:b0:7bd:f662:422f])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:548e:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d64d6ed863mr4498585137.7.1794866357091;
 Mon, 16 Nov 2026 13:59:17 -0800 (PST)
Date: Mon, 16 Nov 2026 21:58:56 +0000
In-Reply-To: <AS2PR07MB912321354BBBB27BEC882C11A37C2@AS2PR07MB9123.eurprd07.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com>
 <20261114161248.3428695-3-thaisonphan@google.com> <AS2PR07MB912321354BBBB27BEC882C11A37C2@AS2PR07MB9123.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116215856.813379-1-thaisonphan@google.com>
Subject: Re: [PATCH net 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
Cc: Thaison Phan <thaisonphan@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, "Olivier Tilmans (Nokia)" <olivier.tilmans@nokia.com>, 
	Simon Horman <horms@kernel.org>, Stan Iliev <stani@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 02:16:40PM +0000, Chia-Yu Chang (Nokia) wrote:
> Thanks for the fix, the only change I propose is to clarify the above message into:
> 
> "For AccECN connections where the listener marks ECT on the SYN-ACK, leaving
> syn_ect_snt as 0 causes tcp_accecn_third_ack() to see a mismatch between the
> expected Not-ECT and the peer's reflected ECT in the ACE field, erroneously
> flagging TCP_ACCECN_ACE_FAIL_RECV in accecn_fail_mode.
> Refer to Table 4 of RFC 9768 for more details."
> 
> Because RFC3168 ECN does not use this syn_ect_snt.

Thanks for reviewing. That wording is clearer and more precise.

I sent out v2 [1] yesterday before seeing your note, so once the 24-hour
repost window passes I will send a v3 incorporating your clarification
(assuming v2 hasn't already been picked up by then).

[1] https://lore.kernel.org/netdev/20261116023709.132684-1-thaisonphan@google.com/
