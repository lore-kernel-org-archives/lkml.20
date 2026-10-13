Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FAB516147;
	Tue, 13 Oct 2026 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902869; cv=none; b=fToStU6cPK06zs7A2hKGLcRqQx+YCyjgcYNm+mWO+55vXEBPEkthpmDuodyP4l/eDAbP1kqUJ8Ps6KEqAfl4axN2Zvu+N/5k+yXL6u28eTobva3YsHlku8FuaFBQayp2sC8EnHMPuC7Ikj8/JdP6LNHDwuPi5216YU2zxlOz0lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902869; c=relaxed/simple;
	bh=1C8apn9neRC0SCWDM19pG5A1PRdaunbQl6T7NLwPIns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnLd/wz4geo4VWSvvfYPtJToHB7zplhJNNuTF+6Dohpl5FTVSfeZowLUUpQdvinS6MaG3VMBXNWDExiZcCJQi6+4V8vrNnw5aPc005SaO5/VyfScDJ0Z9dPmEw4KAG6Zvh5naknzykqfI6LZy99DEkLpdG7hOQwXjuJ296Wpi8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B230CHXY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B230CHXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A181F000FF;
	Tue, 13 Oct 2026 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791902868;
	bh=XQjV9R4YK4o+krAFe00TSqM9w2aXTDAZXig7Z7r7AXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B230CHXYftuO+Chi9CVLZoq7Q1BKh0EH+Ne26kR8Vo00/D3mSTAdsK20zR5g9OyH9
	 XRGIg0k9uCtepYqigMcL3CIId+tuN4m3DgoAZmznU2VxdvZsPys3s6yIh1f67w84dq
	 WECj9DK2wzSOJeCTk2W6x8wi+qRLma0sBLJxNbozUBUGXvxIALD3gbH8u13jsPiBIo
	 679OLFJEZ4+9o4RO8L9K9i9/gkJOhXfL7HPCER3rhMOI/RMY0FYx3f+eQelfU466KY
	 XmWxZdK9etPq9p87qplAkTC9OeA74bVwRPVuHVV4jTBIWhrqbuXVApCcNjQ0RS/b4J
	 bgNu/axlo2LqA==
Message-ID: <0dbd9197-3fce-431c-9874-926f03f662f8@kernel.org>
Date: Tue, 13 Oct 2026 16:47:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: remove Assisted-by references
To: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Daniel Pereira <danielmaraboo@gmail.com>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Linus Torvalds
 <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Jeff Layton <jlayton@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Brian Foster <bfoster@redhat.com>, Carlos Maiolino <cem@kernel.org>,
 David Disseldorp <ddiss@suse.de>, Jani Nikula <jani.nikula@intel.com>,
 Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013121501.3738437-1-sashal@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261013121501.3738437-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 14:15, Sasha Levin wrote:
> Commit 78d979db6cef ("docs: add AI Coding Assistants documentation") asked
> contributors to add an Assisted-by tag to patches developed with help from an
> LLM, and commit 816d9992d9ed ("coding-assistants: simplify attribution") later
> reduced the tag to "Assisted-by: LLM".
> 
> A proposal to drop the tag was turned down in July [1]. The main argument for
> keeping it was that maintainers wanted a signal that a patch was LLM-assisted,
> so that they could review it accordingly.
> 
> The tag came up again at the 2026 Maintainers Summit [2]. Roughly 10% of the
> 18,533 non-merge commits in 7.3 through -rc7 carry an Assisted-by tag, while
> actual LLM use is far more widespread. Some contributors do not know about the
> rule, others leave the tag off on purpose, and few maintainers ask about it. As
> a result, the tag does not provide the signal it was kept for: its absence says
> nothing about how a patch was made, and for developers who use these tools for
> almost everything, its presence says little more. The choice was between
> finding a way to enforce the requirement and dropping it, and there was a
> strong, though not unanimous, consensus in the room to drop it. Greg
> Kroah-Hartman, who argued for keeping the tag in July, supports removing it now
> [3].
> 
> Maintainers do still want to know how a patch was created, but the view at the
> Summit was that this belongs in the cover letter, where it can describe how the
> tools were used, rather than in the changelog.
> Documentation/process/generated-content.rst already asks contributors to be
> transparent about tool use and is not changed here. The rules on the DCO and on
> the submitter's responsibility for the patch stay as they are.
> 
> Remove the Assisted-by sections from coding-assistants.rst,
> submitting-patches.rst, and the Italian, Brazilian Portuguese and Traditional
> Chinese translations, and drop the handling of the tag from checkpatch.
> 
> [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
> [2] https://lwn.net/Articles/1099594/
> [3] https://lore.kernel.org/all/2026101327-cupid-legal-6cf6@gregkh/
> 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
