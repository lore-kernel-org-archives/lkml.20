Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809027;
	b=0AY4VM0JK4hidoPXi4KIYE/amokovuyz7SACdmAodBy1/DmcZGrskckDpMEp9LYvjE5c
	 tMRh10JBO9+1v8gFM7hrswr3VqckaJDbbExEJn/M0Wahx/LzJ111kFx28VFX8FXwvBN1F
	 w8dCEXGp1/MzWoTDdhL/G3dapLk7xniXaYEpV791+amhLVFGit5ZAuK6qyqvCvcd7wvTw
	 cU7UML3JY22e/uoPpq+A/7h2z8lySxjIqXthGuS1bwMSaU5AKgaXw7Ag87Wra/vWrngdn
	 HB0e/58BseeZqCnypqoTTf7LlnW5AzfQQ7UPzdmPZSmkT9pYaNOL2XqbglxMaXd+/HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809027;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=A3AytZ7ZaNVSp18p5DGuHQpWKC9sgEycNzeYgQtV80w=;
	b=1Zpp1SmELY7IdAf5jKv1OyYMGBXLD+ouqwJ1coDFqEyhmnFzPzvN/58a6uA3cU9wKEYe
	 sAa6evu7hjPpHbDGPOTBl+v2FvuUZDJsyf7St5cVbA77JGmG9qCB2HprE7Ua4gg39Zput
	 kCTb2ljrLF1ooeRxNA3d7JqohBPkkJ4WRW4Wo7bH5vZP3RDuzOm+U/S5eVQnMcY+bGSPN
	 MtYvSfe55JqHspOJK4Q73xCbIryBi71FrtV/kyjzqDGvb2Bt5AszKWm65b3P2FUx4n4Cc
	 W52fQExP90v4QvhCdicjeV+biC8bmUUOzwpZDMAzxao8sTk+LsnkZqIAfUqnqgmSkhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvaDYaS6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062C0606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvaDYaS6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B43B1F00A02;
	Wed,  4 Nov 2026 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809026;
	bh=A3AytZ7ZaNVSp18p5DGuHQpWKC9sgEycNzeYgQtV80w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CvaDYaS6roz6OuWmaTO4onmX3U9yYr0BE8m5rm0DCkpyatubDOhAxYPtRn8l204bG
	 U3kHiBPuv+/WcQaO7+eJAyO0KuE+X8tNbiikTvL/KviFjtVr/4+j+rUTd7hJORtLNc
	 rnpzVjLPAgVbBA8fHg730iXxEMVWnkhaPBnhAaespFP1EUjZRjVRNfSqJCfQi6ghMj
	 McPc2w4flIF1Z7hrZ4u9iezPCJpD7wA3fMisMeQ20ctjfkRbuPRG4Me5epuSJAv+3B
	 AhlnJUvRTh4bD6hwEnQK1Dn8gOsrcqKN0mw7ol6g368nL2/G67E2fBK921faviYcE4
	 EOVzF6E9k4egA==
Date: Wed, 4 Nov 2026 17:17:00 +0100
From: Thorsten Blum <blum@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/wii: Remove redundant 0x prefixes
Message-ID: <autafPSMB2SdfUvz@kernel.org>
References: <20261103170305.455444-3-blum@kernel.org>
 <124acf19-a676-46bb-a414-08d957d9cc7b@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <124acf19-a676-46bb-a414-08d957d9cc7b@infradead.org>

On Tue, Nov 03, 2026 at 12:22:18PM -0800, Randy Dunlap wrote:
> On 11/3/26 9:03 AM, Thorsten Blum wrote:
> > The %pa format specifier already includes the 0x prefix. Remove the
> > redundant prefixes to avoid printing 0x0x.
> > 
> > Fixes: 7b69600d4da0 ("powerpc/wii: fix resource printk format warnings")
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> There are other cases of this elsewhere in the kernel sources.
> Are you addressing those also?

Some yes:

https://lore.kernel.org/lkml/20261103213242.480649-2-blum@kernel.org/
https://lore.kernel.org/lkml/20261104155414.126812-3-blum@kernel.org/
https://lore.kernel.org/lkml/20261104160931.137174-3-blum@kernel.org/

I probably won't be touching any of the remaining ones in drivers/
anytime soon.

Thanks,
Thorsten
