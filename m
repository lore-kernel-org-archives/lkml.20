Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34553D16F0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792038855; cv=none; b=mPFKrsDLP/duZoULvusEWB5+90FUhqpJkhX4EuFbVFXkDRz4qAF4+Gu6c+ZoRphXD4GTPy3N07VhSyfgVyRdZNVr9N1HjZdTmt+xx58iur55n2x7BglaHBh3ETL+nvB2JgxpaTu4UElqdZYkXZuwwCKuiPOFJoULl8OV9406b4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792038855; c=relaxed/simple;
	bh=tyD77QsF1TpQDhIMjdBhY/MqpYw4DT/Qu2z80DaAtcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyZHwFR2NGkyVb7xf32pJsv45SsHODVxkQQA/CwjL1AXdSjOf/+fcu2iNk19r9+7O5bpKm1KBso+Thc0/bL3ysYY03wnU99pg6S3ZH1qjukawtSi7QijB+jNQOZUFMpIprKVSsr4/x3ex2bYmK76qwaIlsIGMLKSDWe6nDuio04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dhsEw5MK; arc=none smtp.client-ip=91.218.175.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dhsEw5MK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tyD77QsF1TpQDhIMjdBhY/MqpYw4DT/Qu2z80DaAtcI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792038850; v=1; x=1792643650;
 b=dhsEw5MKBBoGzTz2w+QQH1VHDCAyl4zXmQkATTHI09MQO24gtw3YEC2O5JR/3Z85P5ul1FUU
 H/KNCWTprdhB/RgHdWFZ1ul/Da31iu5WJNnNlh9NOxBkrjErN4CuSZB3UP/iU5tQqS1U+L7G8v1
 9IBheFIT97GPLhkjcIVWP8lg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b288e4c6ce06f05c;
	Thu, 15 Oct 2026 04:34:10 +0000
X-Mizu-Trace-ID: b288e4c6ce06f05c
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	jannh@google.com
Subject: Re: [PATCH v5 1/9] mm/khugepaged: drop redundant mm_struct pin in madvise_collapse()
Date: Thu, 15 Oct 2026 12:34:04 +0800
Message-ID: <20261015043404.57470-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261014171145.3292736-2-kas@kernel.org>
References: <20261014171145.3292736-2-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 14, 2026 at 06:11:34PM +0100, Kiryl Shutsemau (Meta) wrote:
>madvise_collapse() holds an mmgrab() reference across its work. It is
>redundant. Every caller already holds mm_users:
>
> - madvise(2) works on current->mm, which lives as long as the task is in
>   the syscall;
> - process_madvise(2) reaches a remote mm through mm_access(), which takes
>   an mm_users reference and holds it until the syscall returns;
> - io_uring passes current->mm;
> - DAMON takes one with get_task_mm() and drops it after the call.
>
>Drop the mmgrab()/mmdrop() pair.
>
>Assisted-by: LLM
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
