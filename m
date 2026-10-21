Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561240;
	b=qeMi4P3WtSLz5+/wpGDkYUi+uP6uFty2hq6IFOWZ2854MFAgH37FK5PZba3Utf5DdKFP
	 ycHxs5HY5UnEkF/7tHHKWp1ztoV5RAzqoDhwVhyi8ZfepAhxCIeSXbsshkS0GqoijyLZP
	 GHkriRVIinkwJF09TQ/wg+fw61KVRQ1BGILijmIcFWQ3Spf2oFULa0EHgazFhNmRr7Vn6
	 dRdvHjSY+l3IFkXkYHVP6GNxe6u8VgFtupcp2rTVWbgsfANnYRzMxmM/soflEigRQsWrq
	 2UUJrXBIajWue0urQ1G20TKamPh6HmRJlfJ+l/uNA39IdP10U2K/818ksE1cdu1jA3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561240;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MXiUGp1caAHyyuVtstCR/2L4nYD+n3m1gvu2wPtLXMI=;
	b=zMvFRGtA84a1SA4EPWVWRQa4sOuPsF7MLejzfAFp/myxREo7F7BSlLAWEe4McvXs4wkK
	 lunVXzIoX224NPo72obGik2DlbuRILMJBSJGJJr3p9nYRtDDUkiiu4sIKI8Ay9foNdRac
	 F+8nlETSsa9QU8mh45PukAdQcAvIR0Lm+UG5lCxO/JTkhokJXp7qb5CHVKp04MNNkTPzD
	 7kbZqf/DdsNlGeuzpXvUo4JiilYIfKSgbLroQbscltyeTegnozvCaSQ+Ma8WvM2KUYdzE
	 z85xU5ZFlZBjIL/xOv5XE06bfdurX8gR3D8t46AR8JX4gQIzedCuQEmsWzZJtwqPtkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C+vG9SFB;
	arc=none smtp.remote-ip=95.215.58.68
Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA2A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA2A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C+vG9SFB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MXiUGp1caAHyyuVtstCR/2L4nYD+n3m1gvu2wPtLXMI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792561237; v=1; x=1793166037;
 b=C+vG9SFBdBQyzmPAziKyxgOkVqVFMKpFAz91RKnVqhXiTWdcCNqsz48DU9VR4qp/m0yzSUQV
 Ukar89XaW1+7SLsXgAbtzL1jRmim1TE67erPvFkI9qwWgjmSW5einQc4C9m+YgKG5Gw8xPPaM06
 EGYG7YWYbrPWjGGM4uejPjW4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d2fc8a9e32f8bec1;
	Wed, 21 Oct 2026 05:40:35 +0000
X-Mizu-Trace-ID: d2fc8a9e32f8bec1
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	osalvador@suse.de,
	maddy@linux.ibm.com,
	corbet@lwn.net,
	muchun.song@linux.dev,
	lance.yang@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	qi.zheng@linux.dev,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] powerpc/mm: map shared vmemmap tail pages as read-only
Date: Wed, 21 Oct 2026 13:40:29 +0800
Message-ID: <20261021054029.98875-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261019090830.1917657-3-songmuchun@bytedance.com>
References: <20261019090830.1917657-3-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Mon, Oct 19, 2026 at 05:08:28PM +0800, Muchun Song wrote:
>PowerPC radix uses an architecture-specific vmemmap population path for
>shared tail mappings, so it does not inherit the read-only protection added
>to the common path.
>
>Protect these mappings as well so illegal writes fault instead of
>corrupting metadata shared by multiple tail pages.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Nothing jumped out at me, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
