Received: from mta1.migadu.com (out-8.mta1.migadu.com [95.215.58.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615023B8BBF
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788017542; cv=none; b=L+tH8rdXu68Sk2wC0nzdrHOqcpi04BV0aoLcGbloDAh38FjPA8YH5MMw2GGg2As2wGq6zLnszI360zLT2jqZvyU5dy8Mzil5mX7g38zro+PUWQ6m+WQ+8Fzdy9k0/wzfUqC5/qSDK/KDmg4Gsy+Xixj09APYT6uSGOVdlJWigWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788017542; c=relaxed/simple;
	bh=rVDiljO1F/6NW9J+RzyY5uFSv7wjCnJUzm58AOKLow4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wp6TDC2eU7i3HGjFw3W0eXeRU3E393XDvd96pCr/3EsKGlMhKgO2/BVGVf8kUcnxfkX4zU1l0IjbAAf9LweGWMzjuuc7uYG3yGSi/CYlxqkBSGxkbhGsUzXWbQLkWO3KNAz3udEr4VF9FOvigJZelvU2zoSvSjf01rXyxkWXDRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=IAiGhBJV; arc=none smtp.client-ip=95.215.58.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="IAiGhBJV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rVDiljO1F/6NW9J+RzyY5uFSv7wjCnJUzm58AOKLow4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788017536; v=1; x=1788622336;
 b=IAiGhBJV3ErO51HVBRJFLsS8+hV8bglKXR/gQMNrCWIXzS1wPrQBtvO5rXPHawySit5P0ht2
 alwtPClTtQEKSI+z9CC7W6mJrQ3i0TT7n6tXH87LupeVrCEzZhyMRDBP6uALftDaCsnB5U0khy5
 TxQYp3C9DUoU561WFe7quXgMWmyxD/wcWEDi+fT38p6TedHw8QHInleV1keouByW1PmP9xb6Ix4
 vemyBxO3gvM1qcgmldaeh2L8fzPrF6pG8YNobiQq9A25cnVxIQfWoU48mNXgPWIPyNxt0o8P03B
 NG6DMIr1YnIAwLvzt4qs2GFBFTbIVuhxNixC+F7WPHhOA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b9416c6ab96456f8;
	Sat, 29 Aug 2026 15:32:06 +0000
X-Mizu-Trace-ID: b9416c6ab96456f8
X-Migadu-Flow: FLOW_OUT
Date: Sat, 29 Aug 2026 23:32:02 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Message-ID: <apL7ctZhcN5t77Yu@wyuan.org>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>

Hi, it's me again ;-)

On Sat, Aug 29, 2026 at 12:15:10PM +0800, Yukai Wu wrote:
> Update Documentation/arch/riscv/vm-layout.rst translation.
> 
> Update the translation through commit 954260ff5a46
> ("Revert "RISC-V: mm: Document mmap changes"")

Somehow I guess you didn't get the actual meaning behind this "Update xxx
through commit...".

Correct me if I'm wrong. If you write this line in your commit message.
Then it means if we apply this patch of yours. The Chinese documentation
of this file should be already _completely_ synchronized.

However, the current translation of this file is missing this part:

RISC-V Linux Kernel SV57
------------------------

... which is not translated/synchronized in your patch.


Note that I'm not blaming on you for this. But I feel this is a point
that a newcomer might find confusing, including me and Chen-Yu a couple
of weeks ago, if did not read the script.

Our current how-to.rst only asks to write this line in the commit
message but does not explain the results or the actual work behind it.

[...]
	Update the translation through commit b080e52110ea
	("docs: update self-protection __ro_after_init status")
	# 请执行 git log --oneline <您翻译的英文文档路径>，并替换上述内容

	So when a newcomer comes and just does what this asks, without
	considering whether his/her/its translation is completely
	synchronized or not, our script would be kind of inaccurate. ?

Maybe we can add a description or a hint like:

If your current changes make the translation completely in line with the
English version, then please add this line after your descriptions and
before a blank line and your sign-off:

Update the translation through commit e83c5163316f
(Initial revision of "git", the information manager from hell)

..then follows a template commit message


Any ideas?

(Should I cc the original authors of the script?)

Thanks.
