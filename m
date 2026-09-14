Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7B8331200;
	Mon, 14 Sep 2026 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372116; cv=none; b=KYT3GWEXdMjVeaNeDPgWt6sOSN7ZPDZyMOmvUtRYrUMmDT/2hPcXWyiDN0htRyjYCxEf9ilLiZ3eLRk3ufw/njH1947VX4dNUUQy8+LTcNsC0DvQ+2o/FVhsVw9PCmmVWq4vkyt+DC5zzeGcxyKCoL4mBnM6oNi+3fWYst5EYig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372116; c=relaxed/simple;
	bh=YfuMSvPm7Ojv2hg68TI1n1MFVESUOCydGcmYZcjhrak=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=C8d+BGIhsXhCeTI+wqU8pDoK3DimSj9MIgO1DiDQSgS72xBJIAG5QZtpwFQ60yLUk04mBQxD4ybiiZZ1Eeg5F9pLzjeRLuk1+UeEg/YBcpjqHcOeTIgJijhriTgewivLyLRGY/+boyEvTtfwg5gAXFmsqT+ebB5veOqlmtQAuns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfXpuBAZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfXpuBAZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC0B1F00898;
	Mon, 14 Sep 2026 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789372114;
	bh=mxlnDynYYTzpX8hgcfRULDUhaAGoaZuLLRZriqsKtRU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QfXpuBAZsOXfWUwnFNXpOGxWqTSDLO01wvC3N/7vd1dC5Gkv5rxpsOtkrm1v1qk5s
	 YHqpigsAv1/f1RUg9nkHwCoPA998l9XsxL/MKCNTb39E0XXM/uqpp94Ow0df3DIB1W
	 z289LU+/hLhnvCvJF6VcF4PnQCkhx47CxeNF8r5v+dddAXlSgk7p51PmTm5esbd/iM
	 /v8B066Wo4MFfdbYYdhyVAkVqcWRm0TP0bmoLME1E/FGklu/ZO3znAv1zeUOInFU7c
	 B+oPdfCDuqtuviwkhFX2E3MyhcvWqYa8MgoD1gGHOeSkW2iBnqeYU6E81/KVuv7Vor
	 3iWrdauituXWQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 07/11] mm/sparse-vmemmap: move vmemmap optimization
 helpers to a public header
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260911050228.58884-8-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
 <20260911050228.58884-8-songmuchun@bytedance.com>
Date: Mon, 14 Sep 2026 10:48:14 +0300
Message-Id: <178937209457.4188640.17073524319809876525.b4-review@b4>
X-Mailer: b4 0.17-dev

On Fri, 11 Sep 2026 13:02:24 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> The vmemmap optimization helpers currently live in mm/sparse.h,
> which is an internal MM header. That works for MM code, but
> prevents powerpc from using the same interfaces without including a
> private header.
> 
> Move the declarations and inline helpers to
> include/linux/vmemmap-optimization.h. This is a preparatory change for
> powerpc, which has its own vmemmap optimization implementation and needs
> to use the common vmemmap optimization interfaces from architecture code.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

