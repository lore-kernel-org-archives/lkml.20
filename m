Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98474B8262
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845984; cv=none; b=Wgeurw/rujL9hkVF7DeDH4RWGvss4V8+hvMXXgP54Z7Rbq8lmJ8Gc7e9uWOjqErWPRKm1FJIEBXL/gGV87rn0Qo4NvRZwWSSlFIT57UCozrUGOnm0SGcQiyzSkp7cPnUN4317ypQQS9I8cq20uF+zNuuoGjZtXSD+KrTlA3uYpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845984; c=relaxed/simple;
	bh=MXE62c1+6sda7wiEzBoDUuML2EWV3+F9Ld5776mPsl4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=K1+wx1OCmasU/n51BplOEO2yz86lhJS/+vPheIAW9zyaxdO9eAmxPgD63W7zpTIi2db3ZEfx/W79BduoK1E2NYwPuve8oXUKYkoMpKB1qBpmXKp4+Qe/XMNM+U8FxrVY5Wse1be1YQZXguOCthFq3W+4R8oj5NZowWrqsAcvzmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=idhuDO50; arc=none smtp.client-ip=91.218.175.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="idhuDO50"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MXE62c1+6sda7wiEzBoDUuML2EWV3+F9Ld5776mPsl4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790845978; v=1; x=1791450778;
 b=idhuDO50gR9mWDeuzKphKPEN/PcOw6pyZFRTxaMtxWWCBlPVwWXQpbNFkltIDkQl4GuilKYW
 OGrKkZ/pDQWgfQyNZii9yiivfxbPoPLD6K4m354aMB8sP3Aou1aMqzstNxU02ztjKVhV1rTJiYK
 UKZDmLBp1SXOkO6lyztaRiYg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id faa0d8be43e3ed7e;
	Thu, 01 Oct 2026 09:12:58 +0000
X-Mizu-Trace-ID: faa0d8be43e3ed7e
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 1/1] x86/mm: fix spurious warning on __add_pages() failure
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261001081555.35485-1-lance.yang@linux.dev>
Date: Thu, 1 Oct 2026 17:12:37 +0800
Cc: dave.hansen@linux.intel.com,
 luto@kernel.org,
 peterz@infradead.org,
 tglx@kernel.org,
 mingo@redhat.com,
 bp@alien8.de,
 x86@kernel.org,
 hpa@zytor.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 david@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0683ED1-1E2B-4FA5-A045-4D984ACB2762@linux.dev>
References: <20261001081555.35485-1-lance.yang@linux.dev>
To: Lance Yang <lance.yang@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 1, 2026, at 16:15, Lance Yang <lance.yang@linux.dev> wrote:
>=20
> __add_pages() can fail if we run out of memory. The caller already
> handles that, so we shouldn't WARN_ON_ONCE() just because an =
allocation
> failed.
>=20
> Let's return the error instead, and only update the end-of-memory
> variables after __add_pages() succeeds.
>=20
> Fixes: 10f22dde556d ("x86: arch/x86/mm/init_64.c printk fixes")
> Reported-by: David Hildenbrand <david@kernel.org>
> Link: =
https://lore.kernel.org/all/d4fac8af-fd71-47a2-bfe9-3c6559b92209@kernel.or=
g/
> Suggested-by: Muchun Song <muchun.song@linux.dev>
> Link: =
https://lore.kernel.org/all/203892F4-B04A-4F69-A1B3-DC1619176C67@linux.dev=
/
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

I noticed that __add_pages() already reports invalid parameters where
appropriate, while errors such as -ENOMEM can legitimately occur and
are propagated to the caller. Therefore, the additional
WARN_ON_ONCE(ret) in add_pages() seems unnecessary to me.

The change looks reasonable.

Acked-by: Muchun Song <muchun.song@linux.dev>


