Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EDB42A173
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634932; cv=none; b=LCCGHVS98OooBN3s2nsnGGW5pTKsgNJhUC8fKhvaJ49EZby3/otln+ijI58gfuPX3GMh6Cdc79OJq+wY61yY3xz6tGzFPbrPjsljI0fz3nJt3sfbn2tSO5Wjoj/F5rlaM3WoU8nszeEs10xN6eTnRPkaRKDeF/8vSkOdhOO8V88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634932; c=relaxed/simple;
	bh=dkg1IYm5SwvVJKM3slpCRiOP0OnA2rrvfylDB0blPfM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=EIEPse9wAHirHH38UCFq5mOOoo7knCXO47Mg37sVdog5qsF0dEiZRO3B5W1H+2EWlHPjX5m2wngG6k7swTwmZgzFZpsHO9Fnobf48lZP6wmdNia1bVSIjdqWZzmXLuzTrDAyEDg/42Zej2zFgTnfMQtJ8TWUmXNQNKU9mOHcPeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYgRtlOR; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYgRtlOR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so96852366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634922; x=1790239722; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0vllss9Q3PywDs5cpoHaC4Co0g8le+yNhbk6iy+FRPs=;
        b=jYgRtlORziRfGYGsjW6FXVXTe7No6rI9Opp2jLGe/hmTlkfPKjLXs5G/gDcus52MSV
         L5wRtmUJOGse2HOz/MALqmg5p91xx2+vw8CV2WF00F6CZs5x0k9ebgBuquApcNL2lXMl
         OA1LCPWt1wwQhizm7gNmsl5ko/esFyYuf3NsfbL/gR3ImCydQSEcCE0gifWj4fxYhTq/
         fSOuPifOsvUOLqyHP5tbDik67BQF+bD/9P5wVxtL5ZGgXUUNlxF0yKjdOoidHFtyvjSN
         LOstIhhbn68PHpFk+Lr5cuByDiMp0cgJPESOUkMowWBnoREG05uqirUZVXz5GwBsswS8
         d50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634922; x=1790239722;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0vllss9Q3PywDs5cpoHaC4Co0g8le+yNhbk6iy+FRPs=;
        b=f3lUfXF6HqQAYhYOsNHaR0CtL/vVj04IkSVqmj070i1EVZFNTtjbDottQtmIfSfYnG
         fl0XYbo+n2jPswM004Fm+wuFSBwoo3LZ4JjIiGRlxAXILPlVWGtGrp3HVqI7W2ucKdnQ
         QFe+uRDd0o5DhvoOv5NNMpQQkpy4EQj7S0T6UlOEvO8PSHWTKqR5LUehqCAJ3MOro2co
         rHmPkfKCa1iKio3zc79gRPVVSMrkBclS1JMXhUa9zkSS8plZFzQykNLXje+Postuiv5e
         eitVM4woFwwK5DO+xMuMAtR/ga/DlChwYc37daHUICdtw0M5rOKd6qM61VALoVJ5zk1V
         Ka2w==
X-Forwarded-Encrypted: i=1; AKwUvBxkzV5NpSYphxrYf1Bq1ZlN2Xv+r1Ddga40jZA/RhAn4TQb8H7x7Rp56YJZ/7vMP1MjMROGnbYEpynEKMg=@vger.kernel.org
X-Gm-Message-State: AFuF++lUFwej0BlSNMP3URc1XRfgiLvdB8y67OHeNgIjfSwDeTf4yHqN
	OxCzCVKRmR/fIK3LXPvbWWn6v7HDocN4K0C2a+JVjjf0fG7npxPIMe842rqIhw==
X-Gm-Gg: AYBFou3b5A7IVx+dHAXWg4iHlBTmsqmqFO3tewP94tcOVWwiS6GU6jKRf2Un/PhTOp8
	z6BTR+CRfc0tthhhnI0/XVHF0bwQhwlsL7i/ffE3yzM67NG8f2Er9JfmYzLMN4m9z+F/nhgQHcQ
	xpaYjFKK6ADkBtUf7tn2LK1Hk//6WlfgEB1VqE8qXGM6aXP0/3cmjY+FSKFvfxt4NeOe5U4yEZ9
	lrN0iAhpd3yTtlJGY3k4xz2k7iUKxihOniKUjnBcvcbj+kWjYw+Qm2ka4veHynQ3ytH4dbGMLu/
	oo8U/SWZGEnUIA4OMZKzwut033qIDA/aU3V423BDff6hjTEclOxqUfxY+je27wjgp5IBjlZbdDN
	Speo9ijvBpbfCEDBu+8Bqoh4O5g9MRyL/WOTYI2AEpJDI1psjVgG5hjEtupjlnJ/SVuvZ7oyxyE
	dfVHFAENW0MLVazc4+/mjLh/VGC68uFR1KRD4L44YE7lUShsCHNWfWMXzPXeNdYI2k7g3BA1cpr
	64zm9tMJ2mo4DuvvtI=
X-Received: by 2002:a17:907:c648:20b0:c29:f47d:3480 with SMTP id a640c23a62f3a-c29f47d3b02mr144827666b.11.1789634921642;
        Thu, 17 Sep 2026 01:48:41 -0700 (PDT)
Received: from imac ([150.228.9.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de45452asm258549866b.21.2026.09.17.01.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:48:41 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Taylor Bates <tmbates12@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Jiri Pirko
 <jiri@resnulli.us>,  Stanislav Fomichev <sdf@fomichev.me>,
  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] netlink: specs: fix duplicate if/then keys
 in netlink-raw schema
In-Reply-To: <20260914-ynl-robustness-v2-1-c6125003b21e@gmail.com>
Date: Thu, 17 Sep 2026 09:35:07 +0100
Message-ID: <m2ecesp96s.fsf@gmail.com>
References: <20260914-ynl-robustness-v2-1-c6125003b21e@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Taylor Bates <tmbates12@gmail.com> writes:

> Currently netlink-raw.yaml contains two if keys and two then keys in a
> single mapping that enforces a "len" for "pad" members and a "len" or
> "struct" for binary members.
>
> During validation PyYAML resolves duplicate keys last-wins, so only the
> binary rule survives. Pad has not been validated since commit
> bf08f32c8ced ("tools/net/ynl: Add support for nested structs") added
> the second if/then pair in January 2024.
>
> None of the current specs violate this rule, but this validation should
> not be parser dependent and unspecified. Strict YAML validators such as
> Red Hat's VS Code YAML extension and Adrien Verge's yamllint will
> reject the netlink-raw.yaml schema:
>
> Command:
>   $ yamllint Documentation/netlink/netlink-raw.yaml
>
> Output:
>   185:13    error    duplication of key "if" in mapping  (key-duplicates)
>   189:13    error    duplication of key "then" in mapping  (key-duplicates)
>
> The following invalid netlink family spec will pass validation in the
> current ynl tooling:
>
>   # SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>   ---
>   name: minimal-raw
>   doc: Minimal netlink-raw family for schema validation testing.
>   protocol: netlink-raw
>   protonum: 0
>
>   definitions:
>     -
>       name: test-struct
>       type: struct
>       members:
>         -
>           name: reserved
>           type: pad
>           # len intentionally omitted
>
>   attribute-sets: []
>
>   operations:
>     list: []
>
> Signed-off-by: Taylor Bates <tmbates12@gmail.com>

Good catch. We have a lint check on the specs but not the schemas. Maybe
need to add that.

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
