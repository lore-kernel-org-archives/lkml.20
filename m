Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858122;
	b=f7g6XPNVlsgAsBfyR3AQVjoNMEtDWx/7reC2yiFM0LpmfTNtnruuF59RGL9F2EAS5AKI
	 m4NkWYJ/K/q+QA62djBOXekdfOOOluOT4pZKIvbgKbGNyMVPNixL0TA8KzMfqYM5Ns0Xi
	 axrSoLEAjwbFW1YCUycYFGBiaWVGEvIPm7p1Scayq909fdhbjL6S9w7aidfeR6s9Qt+nN
	 tI4o5TcBIeW32/R6dlzlg5k5zn1jXFlFZROwoXzE5lsCNMGirUoxRdHXlLn3PQhGQFPpg
	 YfoY2XXX6vam8A1f6rqaNf8hnXtRuk7wvdlmirHFgymbsEcifbSQXrZR08qiiEdqjoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858122;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EuLgKYBpwSCcbF29NNjWh5pO2MiL+34iKZg4VF29tUY=;
	b=0U5GRzBWeYYhM5+EjCUMmeLvCBOcbQ6lawdLnTJjb+Kt+mkLCjzuOLQFes+uean6t3m9
	 V3cVDufgC3T58MJEPFDjqv6D7LwMZqCkSXbIN2ImgMuZdEUJ1ivmltrwnnLbVLRZAkq8y
	 S1sSEX4VV9g6Kkk0lXao8niKzXADh+KlsC9IyKYCZ0Y9w1ktMXZQabTlZQ5JZ2VhyI5UX
	 sp6gRTC9a49gA1CuaT6/d1fGo8FkToqlO5VGMYB/C9V1rjx+/iOXj444MYKAgS6sN5VDC
	 vJISHYMyHswltatgAjTpRb7RSPZt/pSN67kbHew5dJx5gq763Jt27Obe7UGZB+Btpxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=HrLAWExd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380A606A31C;
	Mon, 16 Nov 2026 19:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=HrLAWExd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F3D1F000C4;
	Mon, 16 Nov 2026 19:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794858122;
	bh=EuLgKYBpwSCcbF29NNjWh5pO2MiL+34iKZg4VF29tUY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HrLAWExdLLcKuwcZbFriLGLkv2FjqQdKOFZgQKNpgK1KaZhRv4grZhA3fPyeGxebs
	 TXcV+QM/ny4IZeo+7EcZQTApRCeuh+yK8z2FDWw/JIvXTc/Fgrxm3XSpqkJSUsyaUV
	 Bl6amWiNfgH+/kSOIXfS6rSSgsxWsh5e9WPmSNko=
Date: Mon, 16 Nov 2026 11:42:01 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, David
 Hildenbrand <david@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the kexec tree with the mm tree
Message-Id: <20261116114201.71afd94ec31717433939e1fe@linux-foundation.org>
In-Reply-To: <avtYxJJhIzPVDYVv@sirena.org.uk>
References: <avtYxJJhIzPVDYVv@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 19:25:56 +0000 Mark Brown <broonie@kernel.org> wrote:

> Today's linux-next merge of the kexec tree got a conflict in:
> 
>   kernel/crash_reserve.c
> 
> between commit:
> 
>   ed27d3cb114dd ("mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory")
> 
> from the mm tree and commit:
> 
>   941aef93e9e1d ("kdump: Give crashkernel CMA areas unique names")
> 
> from the kexec tree.

OK, thanks.  I'll send Usama's "mm/hugetlb: allow crashkernel to reuse
hugetlb CMA memory" to kexec people then I shall forget all about it ;)
