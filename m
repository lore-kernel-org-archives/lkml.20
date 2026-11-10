Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349794;
	b=3hrHyBsZVi2oeyCCVqNzlfdOFWzpTPVRFPBeuVorOdKH4ws0GGpoXqsjbhcl38sG1GWu
	 xSXiguHG1ACuH6OGb7ig6DaxgBteONbrHH/CeKvcV1WH+f5o7S/4MetjHHPvSQDXRmo7M
	 dvmVhfgBbX5uuZwWagVMzX/FF/YkyEuiS9zPruf/plnJT+cZDiHjlH8ZQ0UKPRJyDBgpM
	 MyblvsBKzc3E7Ya9Pf53emEIPL65Mxk95HMXihWwchciLPuZA0CDtmIMuJKOqmXH4UKEB
	 TJfyaWJ83CI1phssXdH7ERx9zxjY6eslx8pGdTQvfJeoOKoUFpf3kdowcMU+VbCDTEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349794;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=VdROMlQmJbX1gHfrkVRtS1i5XA9kfJ95m7dZ9kFx1V0=;
	b=Qvvo8u+Ros1IQ8XrgV5gFN7jO2GxYi/oaFydNXoqMm+ziMBLTHRV2raCudiznz6O3pcR
	 UqtiQWc8duPRrr3b/lyTcIiVnJgTqUvOk8a53wCYxLgyJQ9AwjHwq4t5No6q4IhA04jYL
	 HDX6nPHhYNJpMgXrZih+kEJaOn6IKmoN33PiyMtR0/Fb/+sTrkxux0Zs33XzGZA8OHFTL
	 7D4V13aLc9i2CRDguo45/90xNCO5SawZDN9riqjGeVM6YWHk1TcUd03KfpJyeW+GwtsSo
	 ZtIkKkEjqFFANxoQjA/mBul1v0Jt1cNkt1Rsp6nLddn1TAg+ALs7/0oqIoq+U3Ffb4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Um8HSqo0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FD960A2601;
	Tue, 10 Nov 2026 22:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Um8HSqo0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47ECE1F008A3;
	Tue, 10 Nov 2026 22:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794349794;
	bh=VdROMlQmJbX1gHfrkVRtS1i5XA9kfJ95m7dZ9kFx1V0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Um8HSqo0e/qyCuooxYE3S43WlTBqf3p2D1B6gr/2AqyHtdbN7GKfEinvFb5SwtQF2
	 KZGCZ3JAJ/qcn2LFVxx74pcK6i6lu4ysfK5SuvAcsa87P4luukBbnRNg3AlyhYSsfj
	 Q+pjah8epaZ1ExXAITOmxKkuGphC30diBaBb8NfyWjwzVuURK5UYE2fz761TAqc6lc
	 nMt8czdCQ9gfxQFfr35doxmgpDUNRpSDD44szamLAsVAlJ1Y2ceGyUZStXgTUbwT3V
	 QZtnd0AbUw7hWhyetRJXLrf7Zrx+tOlbr/HfZ4QYfBeQ0JE8C7/oMMlaZ89Zl0SIJk
	 nxm1NwolMcXBQ==
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
Subject: Re: [PATCH v2] mm/hugetlb: allow crashkernel to reuse hugetlb CMA
 memory
From: Mike Rapoport <rppt@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, baoquan.he@linux.dev, 
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org, 
 rdunlap@infradead.org, muchun.song@linux.dev, osalvador@suse.de, 
 david@kernel.org, jbohac@suse.cz, sourabhjain@linux.ibm.com, 
 ruanjinjie@huawei.com, leitao@debian.org, linux-kernel@vger.kernel.org, 
 kexec@lists.infradead.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 kas@kernel.org, hannes@cmpxchg.org, riel@surriel.com, 
 shakeel.butt@linux.dev, zaslonko@linux.ibm.com, brads@mainlining.org, 
 kernel-team@meta.com
In-Reply-To: <20261106165142.2847916-1-usama.arif@linux.dev>
References: <20261106165142.2847916-1-usama.arif@linux.dev>
Date: Wed, 11 Nov 2026 00:29:44 +0200
Message-Id: <179434978421.425130.1365679547411253774.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 06 Nov 2026 08:51:42 -0800, Usama Arif <usama.arif@linux.dev> wrote:
> crashkernel=size,cma reserves a separate CMA pool. On systems that
> already reserve several gigabytes with hugetlb_cma= (which is common in
> the Meta fleet), the crash kernel cannot use that existing memory as
> part of its working set. With hugetlb_cma=6G, requesting another 2G
> with crashkernel=2G,cma brings the total CMA reservation to 8G, none of
> which can serve unmovable kernel allocations.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

