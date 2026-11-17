Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931429;
	b=13tCnRUEJrSxkalsnoiLUlLxUWHKI4tqCI8onb1yAlkq0KkYwXL4hinz5nHaq6ETjHME
	 JkQ797iJ+oXNcEcW6DNqVaf8NSfnbv6bo/QblqczaoXIvNi0MD8RjAfLfA5hDAKfx85y2
	 ssaNvvMNnmlh2/fLaiUgNjw6wtyQtqxzdmZT80MnbBr6lor+5pb1HLxLRrX1nO+IcW2q8
	 7gvbcdUvOW9hoVQwjGwHDARRBiXD5KJO6onEX7imRg1+r5sCCv+3PeamEiGewbwev1rd5
	 HD6ik50XL3HeEf/sDC3obIqksizkJJLQt50QisPYuqjOhoY0pTvvxIZo3QFlQamcrQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931429;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=f5NhCbiOwpUVyAw0NbAZpRDhi3y+XrkNm9sS0jCP4WI=;
	b=LoJdQpyZ8IHcscht6BGQsG0SVhkXt58BNIAHY0VuJ3DYIgZDpIR769o8fqKCfNmNeUro
	 qFKedLyT2L9yUyaYPqxKItGhC4fUxWGmzEBzve0xbaWDWoRpa/CIAznX651j97HW776Yp
	 sVmH9S4ffUjx2k7hMYH03dYQGLgkgRTsjPCo2yFBUeN4PnzvucQ71Jeu+vdsY8CfrgQpJ
	 S7WCs/u2tonBlUBEI4OX4AXUZxrgFLVCEvLucvjJmy7VUzQ4vJDTPmzARzPOeb8F5p1df
	 LT+2P1iZUODkwUjmZmEWcC87FYE/QziLoergvmdLTAyl9CcyeWBcJVGIXLFF4PE6TaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KfnWjvp/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE0606A336;
	Tue, 17 Nov 2026 16:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfnWjvp/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E14F1F000C6;
	Tue, 17 Nov 2026 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794931429;
	bh=f5NhCbiOwpUVyAw0NbAZpRDhi3y+XrkNm9sS0jCP4WI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KfnWjvp/JBBzItBfehN5HCN/5pyjtWboURtvBkhxSP1HYUiFiS7P79Z0Bj/KSAhUm
	 qFS1c7oWisS5/abLgTbgehcsSKH1lTj+S2+0cypSat77AjVmVespO4pYrktKtkqB5v
	 GOvKDemvg4fBVNk0hkNjyB9unN96oNXy9dB8aA8BhuUN2wWACNXNqW6U5bsfgu71km
	 PAhsShbs3LHqbozqY0v1lHvLfa12qDF5n6YbDydBsajCvwn0ddn6oNEbZXxbGwWQKs
	 ZzXdwsjY7azIT7lsokaRh3WtpyAo1LkPepYLG+GwkYoeRlC0nvWyTiOBELPyu+06Gt
	 yTVJtTDkqSNmA==
From: Sasha Levin <sashal@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Willy Tarreau <w@1wt.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their user-visible impact
Date: Tue, 17 Nov 2026 11:03:47 -0500
Message-ID: <20261117160347.1871652-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117152721.GC162713@unreal>
References: <20261116200515.352387-1-sashal@kernel.org> <20261117092723.GA124972@unreal> <avxtxScVa9KvUH_K@laps> <20261117152721.GC162713@unreal>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 05:27:21PM +0200, Leon Romanovsky wrote:
>On Tue, Nov 17, 2026 at 10:07:49AM -0500, Sasha Levin wrote:
>> On Tue, Nov 17, 2026 at 11:27:23AM +0200, Leon Romanovsky wrote:
>> > Since you're already making changes in that area, could you add a sentence
>> > asking reporters to provide the full dmesg stack trace?
>>
>> In this doc, we already ask them not to [1] :)
>
>This is really bad. You assumed they would trim the logs correctly, and I,
>as the recipient was expected to trust that they were accurate. They are not.
>
>They trim everything, which makes these logs useless to me. As I said, they
>include AI-generated reports, cases with reproductions that are impossible
>with upstream code, and reports for completely out-of-tree code. Everything
>like that was visible in original dump stack and it is lost now.

That section came in with

  78f101a1b258 ("Documentation/submitting-patches: Add blurb about backtraces in commit messages")

and the tip handbook points at it, so adding Borislav.

Borislav, see above. Leon gets fixes for tool-found bugs with the
backtrace cut down to two or three lines, the way "Backtraces in commit
messages" asks for, and can't vet the report from what's left.

--
Thanks,
Sasha
