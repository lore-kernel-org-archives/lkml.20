Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794606427;
	b=Tebvw8eZLPqjH12gfoVFAmSBf4a0fn55ahdlosOQRecrAEbgNmL16wc9OmlvdBP7UxGl
	 lW4JbFgfekROg55E+1hU7sZf7lpiYgbq6dVDzWGiX43vMpELuj/f+xsy3fvJ0XZSuCWw6
	 7HZClXQtwZWjJnPGacFDkvtsz8BfsCP3iJcsNWA3nIFSgQm16PMNvQ+R8y85LwXGlrFcU
	 f0KuekIcI2aTnh6CZT2Q8ojAjjhXJf4xJEd2EYLQA7bcqlsNXWrdStpBcCh0Nf+KKSihK
	 PjIVRA5r+zoYpGLXX88ffE52T3oEOTHAfhfNYiIMp2HVfI8uV9yoTP7HSOMfH5opPdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DBuZUW5YrwkUb17SSDsBVeP5Pci0JiCkYJrKClP/tTg=;
	b=woTTppahZFQZyHR0nuuCxCmMwyqWQCb/8Tykvt1szhwld+nxSWc8/u8UQG1swGZWjLDW
	 1lgCnr3LidKenzHm+PdihJAWjOANS26BLQK6viaR6OaMnOlghbMeysrv0yip+qrWQaU91
	 fsaps6WKQYbcjPnfsEmaCRbuUcR9iXS+sPJE65I0uXNMAzxatSoqiGFv4iplbxX+mXht1
	 BtvGQQr4dQtxxW2HOZxBy6TuHJG+EQVo0dVpzHgBiUrzUE38/wve7aYkWSI7dSCkZ/CV+
	 Jrf0sd8k9XQxL66X0iCTwvW4lxZip46JXLBiQM10HWBXbZ8ZvqkpntYfOpMx6B/Pr0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubuyyXyz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8240B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8240B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubuyyXyz
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cdc606b47so319376666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:47:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794606426; cv=none;
        d=google.com; s=arc-20260327;
        b=RY1ZRKhrtdCH7XL1FCpoKdIsHr85kNNXcvrPKVBnb+9Pz4c36T+FqOMy7/RSyNiPU6
         cAMFRqDDPnlkCUsM29ZJ1hEYjjFdqRh6reAmMHO2HoJOo/PgnyaZ5lDO5IEUPW9LzQuc
         CuptF3amkJwjufMj5gVG/Dg5hFfa3+ob5tSxfesraVpADLGJS70+rJaguKw9iiM6fFYS
         o6uTv+oPxBUYL2i50tdwZsKlsz2vmuwfHqrn+ElU1FUtwNroZu5/Rp+XUZqrKKtk5VA+
         mjs0nGHbCI7n3Fqag5kfSz0mYNzx0Fhd05qCRXmyVYhV87PXbBgCC/Be/f/It9hysVVd
         2UDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DBuZUW5YrwkUb17SSDsBVeP5Pci0JiCkYJrKClP/tTg=;
        fh=a82/0UrZorQ+Rd0GoQD7IPrp0Ibej04gZ+ic4SMgQ1I=;
        b=X0jjDW9bhSZEBAqSeNKmvGK1luWywIGaEZRRjTgVjv4NjyELclr2YdVA7p88+KOhiq
         kUYaCB32jh34tyvHbGViTUuWdHwDSbHEaC/4WZUcm/Xtc4Dx6wY1k9ehCt7eoaLL9oFu
         8ttPLnkMpxbg8CnS26r4RsOo7oTOPoxkwb/hk9QrXYnoP2tSAW0uehYBNjdOh+X24gBf
         IQpdn4dYp1XM1yYJHb7U4WEiw57sR0698JEYy2jY1QEeLgdTOHkkRny5VQjbEknnCr6N
         uAGdjnqZc3bALddt+4BQQWbKefkCBuhv7eLKTUv+3bIviiT2Cw9TRzWT4bgBvXkjZFig
         Kr5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606426; x=1795211226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DBuZUW5YrwkUb17SSDsBVeP5Pci0JiCkYJrKClP/tTg=;
        b=ubuyyXyzT5OSCtWB96K99IEVqPlYAj8LrV4DLIV4rQi///6Ohl/keT3A/do/aE9s6k
         RHJjZWpR9mgWSGLTEn7aprq+/bGawopLISvapkhz3gK7/rHLxS1cdawsRkZBZjGJFrv7
         ZRbyj+l2rZa98O0uPI6mHieSONdNuGM+cCr7VOr26YaUOr5zPAogwWe4MIAJwQDtICCf
         lEiqTMS/6HA4skjiKJBRl37EgVl5OoVATkUG53wOVY3mrNQ7NMyHLhfZRjrC0zRz0kmf
         xgWo4+x9LFZfomJWLW98R2dSMvnuMuqNnOZfUmiAbNfCOev5wE1slKTbMsEsPQheZFaZ
         HFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606426; x=1795211226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBuZUW5YrwkUb17SSDsBVeP5Pci0JiCkYJrKClP/tTg=;
        b=QgTXfFE9oaDRSk4U22nWXuiq5r4HxWHCDGUy7sYZzHaf4snAQQuELAgMahUuSk8lH6
         4uc/jIWl8lyH/xg5dVcl39atfh2JMzRsJZlxdXHgxQdiQ6vfITvq9xaz0yoApY0gikZa
         yOWJerLxAHGcYQszlgbK3E8AmBTS6SnkLnW3JeAjmTPAmYo4any8izceOGS9oBfpL5Fc
         jVr0KChyW77bTkoLI9Z3ohpS2YD00ALK7x7bSfmOaOXvf7AeOV8chpVRikdY+FjfYM7B
         N0Vm1EbOgFu1ukKQBi9lA5xUtJt0U7njchhOaYXLOFO85QSLrSRVICshAKJdVpwu6P+q
         yrGw==
X-Forwarded-Encrypted: i=1; AL+hErFcoO4X45NCC46UWnwcuNS6rDYqEPxf4fk6Yb+NeNXHJ0Fsi+ghrwneVsSR5osF4hTTqY13n13QdYP018Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qTsyk0MOW5i4/xyBJHrhQU0e9dP/EBw8Mi1L9QRfVYmhGgIDY
	6TnbgqGxfr4Y6aGw20LHW57Fs4xiv3g9B0x6tSVVaVeuMXAn/x3XDByRE1qjDHwYWxNZK0sUqbH
	V13QZXN3sVl3sed0e1Zl/TaZBGZd1mYY=
X-Gm-Gg: AYBFou2KZsSD8S+HB0Ee6Pn/yZRTynZ5FDNCtk4pTwlIJvI6iWJsGdbYUzNhCQ20Qpf
	zI+kDnAWvOzOuglOwvi6cTmFkKkgJu8xQpUjcJ4bL2BxMQ85juMEF5pDLA5lSM9PdLkMKj3qTMd
	iSV4JvrqZHTL/K2T7qMvursRK2kEWA/xw1J9AC7b/C/HyH0RDsJckFLF+zbw68WlrdkCqKv4VjH
	uEGepudKi+C6VXZuXG2KvEd1+iMIgFgI2hHwvTKM+OczzsV8GIw+XFP8K+57V9LxOMiQfwnWy0a
	hUErKk390NUkl9hfJJsfUG0CdTapLuy/f6g7OjBKE5koPOrrWouYuHc7HWQB/Oz/dz1Pks2D+Xy
	NsXuODKD4lBdqeJW8+GNct0wM0RvU0zTYZKwL28c3pA8XpOHQtgXwfNxOvM5zeUl0GKvZXw==
X-Received: by 2002:a17:906:9c93:b0:c50:5186:a428 with SMTP id
 a640c23a62f3a-c50963b3380mr372754466b.27.1794606425739; Fri, 13 Nov 2026
 13:47:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-swap-thp-split-v1-0-dfa8d4fa448d@tencent.com> <0cff8050-24ef-47ff-b107-70a5acdea631@kernel.org>
In-Reply-To: <0cff8050-24ef-47ff-b107-70a5acdea631@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 14 Nov 2026 05:46:29 +0800
X-Gm-Features: AclHuK_GcWwYOTlOcpKzfkqKUnw8cGanu3KfVChnEYhbBRBs1s-nvvOrFv0vtzA
Message-ID: <CAMgjq7BcmSN=0cLAzrpPatjWP_iyD+FgAMcvVcCpebStWYprGw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/8] mm/huge_memory: clean up and speed up large folio splitting
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 5:41=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/13/26 22:26, Kairui Song via B4 Relay wrote:
> > Hi all,
> >
> > This series slghtly cleans up the large folio split path and reduces
> > its overhead: uniformly splitting PMD sized file folios to order 0
> > is over 20% faster.
>
> I expect (well, and I have) some fixes in that area, so we better hold th=
is off
> for the next week.

Yeah, that is totally understandable. I mainly wanted to gather
feedback on the two xarray / folio helpers at the moment, in case
anyone has concerns about that approach. I can also help review or
test the upcoming fixes.
