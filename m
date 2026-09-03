Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8D4A8A27;
	Thu,  3 Sep 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440739; cv=none; b=sVkZ7wcTR4NS/kvGxNH2myWVALzZzrNKslxPI8e3A3a2Mnu8Zs3Gtjk2RBtSEOKHNCPoVFrKBn3ajXKqzFxHijQ9yOcD6jTosLHQDuemS5+3xcRDj0xQZvuwB3du1u/SoXherYgrFcC/9QkMX8QwwUYWDads2o4rj3mS2e/tFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440739; c=relaxed/simple;
	bh=0vl9FB+kjih2VuomkQ9vBWPHvv1wo8h1RqpuPTWjA2o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ASOLDjHnOTw/lEAhetN6+Uj3VF08poPCofdNbbb11NjtXkE6rr5W5bOV5d2BsVx3ihFoXWFcaB9iFWAQS8Doxtape+Fvkj9DqvLUXt+EJAuhyEqWNQAUyWvgdVsY1Uhk4JPEAz1sNVwqdrQWDUwtz9qv0IhkFOdcsq3NAy0L4IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=I6byXRFO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="I6byXRFO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4CA7D408D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788440724; bh=Ri99RnR3lTWhl+hn2Yk0ksLghgMmFBeXXT4SDf6YodE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I6byXRFOCo2HjSbU6l2QAhvnQeJvaHQkGz0LJZ64KUtDhJRqJMcgfPH0kOSAScVSV
	 kcwYLzexF/dlV4WGtCwy74ahS9Y/acvl39jZyImCA1K1Oau99AQ8J6ax1UJRYddLXJ
	 2dOA14s4kE/YeZ+lEeka/eH6aRzuHomYr/+Jev4sYJBuvtGi1IwMKdkmbrLwyA/LPS
	 BXJV1GWKVi/t1d9/TMiX0N4JEQCrsZm6diJSY+uZ12caOmLEC6s9bzx4Kbed3o0UEn
	 4V2hayIqs5Xix91QaN7lDdWjX6t/f+qkXVhGuAtADNS52F2HsfhHq5W5DSBGkHLnf6
	 WmXdO4effSlDw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4CA7D408D3;
	Thu,  3 Sep 2026 13:05:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: admin-guide: Fix bracket
In-Reply-To: <20260903063257.711435-2-manuelebnerli@mailbox.org>
References: <2e2333a9-dc4b-49e5-a09a-47fa502e0e22@infradead.org>
 <20260903063257.711435-2-manuelebnerli@mailbox.org>
Date: Thu, 03 Sep 2026 07:05:23 -0600
Message-ID: <87v78m7aek.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Add missing ')' and remove ';'.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 5b318d17a..5f4a056e4 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -438,7 +438,7 @@ zone[i]'s protection[j] is calculated by following expression::
>      = (total sums of managed_pages from zone[i+1] to zone[j] on the node)
>        / lowmem_reserve_ratio[i];
>    (i = j):
> -     (should not be protected. = 0;
> +     (should not be protected. = 0)
>    (i > j):

1) Reposts should be in a separate thread, not replies

2) Put a version number on new posts

3) Say *why* there is a new version - what changed?

4) If all that changed is adding a tag, you do not need to post a new
   version; the tooling handles that just fine.

Thanks,

jon
