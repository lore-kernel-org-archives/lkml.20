Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320CD377AA7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791651065; cv=none; b=R/qVTMEsm0BGSbhXx0NAqlumtVOP4Y34wEPywJwEFv+RWAcZyEB0tM92dltApRRftz1AOuWZ1mbcWhcbyVZvk9Tf1+80ppczlP/nBbIFCCb2y4iezcxSluteZ3LiUcc/8m6YQ3IIoIG3RuK9gjzImtU7dgalQzM+8LxMUmPBZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791651065; c=relaxed/simple;
	bh=mkgVRX9YuyhUq2vsRjUuGhTE9wKrEeana7ye+Aj7TLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xkx0K8V3Jo2A+kxZ76v+8DT3rK1pbQzrS9NnPc292leYpt9ynxsWwdgxI4bhVNxGUhk9awu5GRvdmXi5/26Gx7zlOrK8nHgboRzzTWH6FQ+bBBmLMAbtaZa6Qn2d7AUgo2u2Tcdxr7hGMDAFAbHkOzJhc496k6rd1rfO22wJ8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNR5HjXd; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNR5HjXd"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dc1508191so69669f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791651062; x=1792255862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EeIjRVizR1PJsy6PguhlaW7zpk67FRvd3p6xP3V+QY=;
        b=oNR5HjXdJRqD22pGWlU03tfBMRuK90f8VFpsiWRTtvxqe8v/FcGxucckRE3fuP6Zu7
         0KhDq0gFGNnAFbpaI4Gr0hLWTjlEB5anKkZZj/SGger1Y3b7l5zQW6LxrOpmcTx6WaR0
         AC3CNVG3xngVwGbJ513L75ZNh6mS72CKKco0/SRFFLSy8yH6gOwTmINC0gzIfAIbPPSr
         vSxvFk2B/5bH4Obvxd3OiQDq84qUXMZihNgbEDBuJIqmtXA2p92Nb1336Q04I6L7UT0C
         yYEVxUvtdP/DPvYFZeEdXjxf9ca1Ejkov7E9MBMYHShBvVdGwiMP+ETf/Ap0UoS0Z++/
         HWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791651062; x=1792255862;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EeIjRVizR1PJsy6PguhlaW7zpk67FRvd3p6xP3V+QY=;
        b=fhUecVS92XiTY3vzQy1ikGVNcgq0Fz/pl9IXq1TJypJ32UdmEDgAD96CJH9I4DDt4O
         J/hd+o1uHdE46+kF7dexpWsEnA8JnHtecNOe2i3Fj17gTzujf+Fs/z0yAgFDXNGcw8fK
         3ARgc7jHkLMrDD6aROAXQliZSoQilKdsZv7TBOPqHfL8ACw198tWjlbSjQdDhZe08ZPW
         akuxCO23KavNtfr1nS3iuEeO6v0FSX8GXEcTqSw67OIid+De1dEY3LMFSAv8M4maCWOB
         fC1vcF7pved1BrcSxt0Gu1jJmcZC90+vecOh4Y2zOx3oMwVsAChUvA3lGqA47NpqKtmV
         S3MQ==
X-Forwarded-Encrypted: i=1; AKwUvBylGDvnHGYZYx6827MNBDiDAH59ai/k/uuIqW4yZiaTfQ/FHbAuWlEDgBplSOlc2kR6h6+HLKxsl1aFCXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJClh8boakfNgN3s4hZO9yZcrPBY67aSwY+RrlLfVbaGmpsMAdb
	/CSywIN9casmO+6KR4C3V0Voz3uIkPcq5vw5q8Z94HlpwLD6RKnkKUIx
X-Gm-Gg: AYBFou38JbxOI1wy9zXohzZQtdy5b1mDU4iV4jFp7EDYlAwsKe8UVDYUQMUtpVjb/iF
	NRWRV5kyyp6j5RTiFARhNpdYxaJOrBJf1JTHrXHrwiuBUsDV7Kr4uhuZIhjsA5BNxN5zIZTwY4Z
	P4CavMsJQqRAzUUnhtpinCDO32ZExGtkiOR2swXa9Rfmyg5LuUsCX47E/dJVF95wI0U6PDRXO3R
	H/VTyV/IqMgQce9a63lbr53qi3t2XfjQGn0bQluHcnMX4hWWoPYtdZVS90O546dEDpwl7HVLKJi
	EXfTwE0+sCC1NRhEtnEmo1oBFe++ISUl0UrKgshpkzpIIZ1MDcgFzYdbmKg0udKEEjYHqT8K8D8
	EUdVu7LC3GuDpxwDY8fM2+z56+a570V1mJM6iNNuBA+b37bquPrVsLKL5+TGpVujFpH4gRKaYIF
	Ur0cthQOafLU39WJxt9EXC9BIHNqqhrAqeT6r1RJ2CF55uXG0vJnZYneSq9CPEy6CexaM1IZlSh
	pj27gForpnipbSzzRZLBUNWuucYD5NHtRcOTmc9ELdGUNx2eVnk4c/FFB1QqMh1EP8oVzH0VqCU
	W9M4iuCmabrr7U/qkLWePysO3OrfVo0WyL2QAXUuR/Ws1lw9QoF4CVC/fvT0tjQegOGsYR40tsU
	WZe/PQfo3i2g1UFpJ3Io=
X-Received: by 2002:a5d:5f92:0:b0:48c:4dba:5612 with SMTP id ffacd0b85a97d-48dbad3077cmr8429506f8f.5.1791651062011;
        Sat, 10 Oct 2026 09:51:02 -0700 (PDT)
Received: from ?IPV6:2a02:3100:5eef:f0fc:594b:8efc:4396:6984? (dynamic-2a02-3100-5eef-f0fc-594b-8efc-4396-6984.310.pool.telefonica.de. [2a02:3100:5eef:f0fc:594b:8efc:4396:6984])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dba033a0fsm8412327f8f.14.2026.10.10.09.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 09:51:01 -0700 (PDT)
Message-ID: <4b70af58-559c-4e6f-98fd-3b1da3c01998@gmail.com>
Date: Sat, 10 Oct 2026 18:51:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v7 2/4] net: hsr: preserve submission order without a
 forwarding lock
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com,
 syzbot+fbf74291c3b7e753b481@syzkaller.appspotmail.com
References: <20261009201324.17-1-xiexinet@gmail.com>
 <20261009201324.17-3-xiexinet@gmail.com>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20261009201324.17-3-xiexinet@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

One integration note for net-next:

This series targets net. Contest reports conflicts in three files.
We handled the differences in those files as follows in our
net-next integration:

- In send_hsr_supervision_frame() and handle_std_frame(), net-next
  already uses WRITE_ONCE() for hsr->sequence_nr. Remove the old
  numbering blocks as this patch does, and keep the new consumer-side
  numbering and WRITE_ONCE() updates. The supervision builder keeps
  the zero sequence placeholder.

- In hsr_fill_info(), net-next already has READ_ONCE() and the updated
  RCU handling. Omit only this patch's redundant sequence-read hunk
  and keep the net-next RCU handling unchanged.

This resolution was included in the previously built and reviewed
integration series based on net-next cfb7793d1bc0. I also confirmed
that net/hsr is byte-for-byte identical in
net-next-2026-10-10--00-00, so the same resolution applies to these
conflicts. I have not rebuilt the series on that snapshot.

-- 
Xin
