Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960128;
	b=hOBfc1QVjxWdh1tXBtSoBAHeNwujGJ/ksCyKlJFpu3gJqyvDeOmGJxHGxFgS0RQglgZ+
	 gogp6Cwg/dKSo6LVExQ+DNN2Mpb3SGRZde3e6bTffD9gMXYGa1a/WIq9ukr+dE4uTiMmU
	 O0/U3OM2pBpdIHhGnWOVxYYpY/R/NllX++9m40vHbOp1KcOcFYhkH4iqKXxmU/9uuuoiu
	 vpRra+Ut4ghfM5570dVZ7fAzN28jmmSClFIS4rCBV+ilxFDxj/6iJp5Z8Om1bdHYj4Bre
	 A6iMxWrtC2jKTSlcUHr3KsG3qGWe99Or62F4dNt6b9FRgzF6XADgbM7yl2kJW7czlPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960128;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o3QpwVadsToTTIZHjTnSYVeCQ+y/jH63pDopLFhMY7s=;
	b=R3WmilhCa5JHu2V6bIAOHTP39pKZvzKBhnpiSQDanSS+Q63LMo+o56fzW+Oe2ZqnKoB8
	 uPgzZ2PizdICWf0pu647tX2tPRbD6WNlEY47p8KkaPHRRYKHRoYqnbzfS2gRNzhwUzQ1b
	 gEvahsUX3/yWVHAlL9hChYZWxfbFSaqhF3I21OhkZCNlntcGiu+sTK/GQMge1pSqJ4+4k
	 2TEwpYusugdvkN0xf8DJCKwSrrJnY8AdCb/PEYH7kIqwUMgzMq5GWLrbPOB0AfgUnkv8U
	 E0L33Z75tywPu0GrWGvE6EHH4EEPwleazVxGtTFOCaUcOnuQlYDLoMN36RbsJOKRzdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jH0j22qT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C01606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jH0j22qT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1DC1F031E6
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792960127;
	bh=o3QpwVadsToTTIZHjTnSYVeCQ+y/jH63pDopLFhMY7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jH0j22qT/1qvUBwPfTArCbUdeNnDHQ9mp6FCgByI8BQKavsqMGHM5KI3F5frbeiFk
	 YrW+tRElBeGayIXKkAtZ6cYOqVjfhqIbg0v0c1GiAMX79ibWWGIpFLgzVMvc4NRTm4
	 hpv0ARywxo9vw8/lX130RJWjNoWewWoa8MKyV0NYCECeb3aaWWdLTG7nbyh2xEp+P/
	 aNa86ScP9UKnw3SEm8188ffsExwm5MaOi9FugVxpjbwRyrxZCK1zcan0CT8EDrMwu7
	 4Om6/EAFxquJWWwU/K3lnSc1a/RzHacMynWbSroxUnk2fjYJn848qQbtRf2bWOjr10
	 yJ5vB630xcr5w==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f2493c28bso198595885a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjAzzB65AHaPNjWTETsEWWg3bckNiqOPoTZzRDJv6s1Y1auHs5r8ge3DlF/gNeikGDS9E2Bqwa6MDaIyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0L82KIXuuFWUQw/Uj5pp7+jOzd3SN3Ob2Sm72C9huGmbOujw2
	nMWP3NpMQlLlIfXVgcjaWwePPsaltUH7i5sAa1FSWDyKqyzi2PamADlqFcA1hwHluFCyshmib2A
	ciclpRsvQr/V8bNj0ffq537eGh2coN3g=
X-Received: by 2002:a05:620a:3914:b0:93f:6c76:215 with SMTP id
 af79cd13be357-940ef97c118mr729100685a.50.1792960126963; Sun, 25 Oct 2026
 13:28:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev> <20261025-b4-ksm_fixv2-v2-1-8b61ad0491f1@linux.dev>
In-Reply-To: <20261025-b4-ksm_fixv2-v2-1-8b61ad0491f1@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 26 Oct 2026 04:28:36 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zUVpBJazRxc1CzN6u5XvpUaGnaf-_7JMz-rGK_ZTYMtw@mail.gmail.com>
X-Gm-Features: AclHuK88apne2qjXZS1-h2NsEBqpBIFkZPWsGITw6I6ajwe4FfnoOYhR2bwtZ_s
Message-ID: <CAGsJ_4zUVpBJazRxc1CzN6u5XvpUaGnaf-_7JMz-rGK_ZTYMtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm/huge_memory.c: skip zero-page remapping when
 underused THP shrinker is disabled
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 1:40=E2=80=AFAM Nico Pache (Red Hat)
<nico.pache@linux.dev> wrote:
>
> The zero-page remapping in __folio_split() was added to support the
> underused THP shrinker. When the shrinker is disabled via
> shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_thp
> to avoid scanning subpages for zero content unnecessarily.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when s=
plitting isolated thp")
> Signed-off-by: Nico Pache <nico.pache@linux.dev>

is b1f202060afe a correct fixes tag? as
commit b1f202060afe has no even "split_underused_thp" there.

it was introduced by 81d3ff3c6f7 ("mm: add sysfs entry to disable
splitting underused THPs").
