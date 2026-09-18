Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AFF2135B8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698704; cv=none; b=NirVLOK5Wg88577eKvPlVElPW7y7LLo23mh3OwcV3xfFRF0qHIfJwZo+qkY7SEfyfmmURXbX9t3D2sBAwTVGObVHAY3Ltl6+BaBnbQ0oooUiHobBBHCWsYlrKZDvsQzjzy5TAwMIxXeLOnbP0BTrlfS/C/EL5AZLhjY+fOhLhIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698704; c=relaxed/simple;
	bh=ippT9YiL1FFDQpieR1TZ/9+GoZaxHH81p39UiCModXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+k0EtnX8AQSwzmXCLoQMm8OUvg0VXQgU4xvrc5fyQWbKRjDZSxA0i6X+TFj/+Q+nnaUVf4gGSarSYDVEiHBh7I22QqbxAej1uEXdMPWmHowHjS6FhQIIf4TpHIcbLNevO+ttH4EEN5KhV7wBWn+0l1h/xQfSCJV6naoIW78deY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSB1Wta7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSB1Wta7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EE61F000FF;
	Fri, 18 Sep 2026 02:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789698695;
	bh=XliY23/0AK+b/F4nmqsY5oKyNRuUkycysRCvuehdnhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OSB1Wta7SjTqCXufn6cISCnqIIR9y7c0SBu2UsNrnWsnBZ4VtusSsfysx0WGm858h
	 NQIHuv9hIOGLzDbR3UL3i5RUVV2F+hmKPHNen5L+U2QxiOC7rcUkomtMZTaaJWvy1r
	 wflNHwJHXxaSP4wNEPP/v23vsD6hD0n5OmudRpcRBj0fYyv23luqXKL6jzPanWo7+f
	 hI6ZP6hnopSzQ2A3EWsdJsz5MqC3rJeAh7IQadk2Ic1CizeqACZWyIWkuEWg4EmJaw
	 sRi69bzXOsGV4FH7ApUcyYfm5WRMB3Ub/06KU/dm/rFrrIrGAcfTHh+pdHHu5Ov+ep
	 uF6tmSrJmxL6w==
From: SeongJae Park <sj@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: SeongJae Park <sj@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org
Subject: Re: [PATCH slab/for-next-fixes] MAINTAINERS: update slab.git URL
Date: Thu, 17 Sep 2026 19:31:33 -0700
Message-ID: <20260918023133.13375-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917-maint-slab-git-v1-1-d21a5210aec9@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 16:38:37 +0200 "Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:

> The slab.git tree has been moved to a new URL as part of the mm-next
> integration. Reflect this in MAINTAINERS as well. The old URL will stay
> around with historical branches and tags.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
