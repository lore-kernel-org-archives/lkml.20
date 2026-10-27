Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129892;
	b=lmpvYe9c6Yz3/BLb+8a5qZC1ot84VFVokRUUKSE8E1fDH8WZNghz88G9Yb2kTeBZPpJf
	 I0uAMeVgsLaviDbFYaOMNNyoIo1wMfhfkeRMIs23xv0jCORhVgq8DfwMZt0TEJHW2CZQR
	 mxdx3cHQXqtzCJyqfVoUVlMcJxxK017lO7BRkzJErklFubSAk81Hf0s7WrxPKfAXgQcqI
	 SGlnkwFe2Pm0C4fk87CxjMKRx+haUPPjsvOPy3XyiZn/8TAHA/6Limw8CdkW9qhDAgDnO
	 WKAQhBdL/EUvVTKoX2lcDwfORgRmQ75SZw4FZt0aMMgi8kD4xPJ9D9u6qGYw3+aMWqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=AoGn9VEZ3I8Ld7dNYqrh8Oigb3Q3zSaylzK9qrRu+PM=;
	b=4WiWBljyhebIXmbfwIfGrAEuIbUF0R93iuKtwkeY5pfZe/meUkf/0EYL14PbiztHmqyk
	 2jFGWzcPsItUP/sJ6JJKvHpfvKOB2Zrh2L4GkJebctSaQB00AgOKaXwQImB2eCrV1fm2c
	 rQWYZoD4PxGG1iJKdNfLGDEBmw8gA4k26Ip8PPGJTgXSUzZUCnyfL80E7Lft6QGjeIVKK
	 FhQiUvHysTDNS8KqpkL1agouIp67ZprDoGdphkqzFLxY8pKOI252xb1UgnIqk1s7sAr+y
	 63Z9y9/zo7EKK/c3TrDwsteDy1WqvFXmPRiC4HliQ5L183x4EkgQCd/xgw+MzGFJ6KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Q62RCPUn;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25190606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25190606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Q62RCPUn
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c414e5d282eso26691066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793129885; x=1793734685; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AoGn9VEZ3I8Ld7dNYqrh8Oigb3Q3zSaylzK9qrRu+PM=;
        b=Q62RCPUnV4BTCTB/VEZDPth0/eDOGV+2DbB+rwnAq00Er9d0WiTUOmo52xTRwqLfBV
         8ybCdnY8085WTtUwWrWpufTibmSqT0JFTgolMCl912J1Zzj/GMVjMR960Pvlrj690xsz
         qB+dHNF0Abad0Ff+va4Zgh4Si4ZsBgnUfAwZz1fjhVj2YrL6Wq6YxdEMNUdhXhS6scKG
         GQiAhO21/G68Ca+/LjLdqqxa5Birf80FTPrjig/1R35308OJG8B25tVWURAo/130aM8z
         xl+tpCDpUmn9ss2ocgdoAgewATF9MyNbb834ULQLlUFbDoMciHANtGG9WpwrLj7kuc9G
         z7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793129885; x=1793734685;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AoGn9VEZ3I8Ld7dNYqrh8Oigb3Q3zSaylzK9qrRu+PM=;
        b=AjvQ+vOgQUJrtTlvbWOMPspcONcGb14/izBVzk4rVZpzt/kNKqXHw5WTPISh8Fyem/
         M0UBI8gk956TKhXpfXPS9h2J+81CqTcowcBJK2rqcFumtHzUd6fxouu/mCMWRd9TLEYa
         Y8WNRyLUKrRjZLOKeCrXOtcWHfLMtLniPgP+w6G9KXYU2xYndwKxVXgt2q5n3sQYkuHo
         ipPuEG0nN1PDANDg+TYvTJp9FeXxSY/0yiTevap6C4fpnaLZ86aJ81tXvdMxIbiL36nU
         PG9BW0XSB3YWuQoh7JZGeXMfvmsGCK///tNjL/XHwFk8oqsakOOBIWfKtBHhSxAVG0H1
         6XqA==
X-Forwarded-Encrypted: i=1; AKwUvBzXUnhN3MqPzQ21DUVh3bUhoDlXf/Y5NOTmyNpolcSpZsvFhrE0mdh6ICuGnyN1U7KfxuqbHcrmoIJk05k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLne6BUHJZlNHVXJAmOR6iKHAfXkLXPUEl/jlWGiP5k5cIFFsHO
	kGPlFrGZIdZ0YoUmeW5quWd9CXNsvzdJVUb3FrRHyOlxU94JESX8dHsXT4VAH6n3Oxw=
X-Gm-Gg: AYBFou1fA875AcL2XFYIvv2tai2M73Tp74LsHcUwZ6tDokfcuAeMoDXO7gGt4zfHcRJ
	BTgc2Zv9QeIXv0/Qn9LdN/uxBesNHIwh2djEmDMxJwo0TDjIzLQZiMXNwn1VoSZBLfaxqZr7c3u
	6oFQ3jS9zzfgcnSn9g6YH/LjRtq7fxHR4a7BV3L9VAqFLgSoUWmhukWTx71Hih/7EcIPY9Vw7ze
	MItSSWNkdPRVosDCBkFippzavmKW/oAXdGNFvfCfGXqni9kv5ap1yRBGxTWE995HMm4JaeM7coM
	kVHOEKA/NqnfjveyziKZxnynxywgI2qEIsinOlbZTT0+eLnNNlNsNbPoR6V4b1q5eKxBvMLODaC
	tQGCAqLUQ64+yGPkgzF2SpUCWnoG0zbCWtfMwQySuH7Qzx1BuWeYLGSHKoKAD12lkj8W1JEviF4
	Pk20EaEJcXc4Hio4qmvuY/uGKvxQywZ7AU/ki94b259GuGwWURYVm0QKI8xZc+h8t90TNo0V3nv
	rBqsDMlcJ477IoL/7cMOEtfUS4pd03mFQFDvGOM2wjlNA==
X-Received: by 2002:a17:907:7f9e:b0:c46:645f:cedc with SMTP id a640c23a62f3a-c49be054a4cmr17194666b.46.1793129885192;
        Tue, 27 Oct 2026 12:38:05 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:7::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964601f2sm455107a12.37.2026.10.27.12.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:38:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/6] mm/page_alloc: don't undo another isolation in
 alloc_contig_range
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, "Gregory Price (Meta)" <gourry@gourry.net>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, 
 kernel-team@meta.com, akpm@linux-foundation.org, vbabka@kernel.org, 
 surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
 hannes@cmpxchg.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com, 
 ljs@kernel.org, liam@infradead.org, rppt@kernel.org, osalvador@suse.de, 
 muchun.song@linux.dev, iamjoonsoo.kim@lge.com, anshuman.khandual@arm.com, 
 stable@vger.kernel.org
In-Reply-To: <8a841fb1-8e71-40c6-91d4-3252a0a1a368@kernel.org>
References: <20261027042204.3741307-1-gourry@gourry.net>
 <20261027042204.3741307-5-gourry@gourry.net>
 <a4fc92b5-7d99-49f4-94ac-89fdee699042@kernel.org>
 <179310997463.2232644.3260379218896917308.b4-reply@b4>
 <6f5aaf2b-894c-4306-a0b2-e56f815d0a89@kernel.org>
 <A4D82AB8-F33A-465C-AE69-933B746E4885@nvidia.com>
 <8a841fb1-8e71-40c6-91d4-3252a0a1a368@kernel.org>
Date: Tue, 27 Oct 2026 12:38:02 -0700
Message-Id: <179312988283.676746.1330276872732304961.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 19:58 +0100, David Hildenbrand (Arm) wrote:
> On 10/27/26 19:53, Zi Yan wrote:
> > On 27 Oct 2026, at 10:13, David Hildenbrand (Arm) wrote:
> > 
> >> Maybe. But if it's just us core people we can just talk on IRC etc (like Zi did
> >> two days ago when he was about to post something that I already had on my queue).
> > 
> > One idea is that maybe Sashiko is able to identify patches fixing
> > the same issue and does some grouping or tagging on the website.
> > Or send an email about it with a lore link.
> 
> I think that's too late. For us core devs we just need to sync on "has someone
> already a fix for that or is it worth cleaning the AI shite up and sending it out".
> 

It might be worth just having a maintainer Fixes:-only review branch
that automates pulling these things in and responding to conflicts.

I've been working on some b4 workbench automation to make triaging the
list a little more sustainable. It's getting there, but it needs time.

~Gregory

-- 
Gregory Price <gourry@gourry.net>
