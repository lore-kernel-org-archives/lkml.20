Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36A238DD3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022721; cv=none; b=Yedzn85n2AibdcXbu4dzCMgyzqfEcrJcn+ECjpeguhkYpIsApvfu/LXWPNA0Q2JTzqz558bubm9daleKDC4PZeAjxWE5ejpNNES8txGaTtq9AK09Zp6InNIqv5kaePSd712GMJFC3aKK4zEUND0wAMe84/gP914UABe4hcnRrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022721; c=relaxed/simple;
	bh=xcHW74AqXS9GUJbeObz0yQg8d/DCNMW7sZGwkQ37Va8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fn0bvImYKzK1qIC2fOAcq+3t8oL9ROOmqQ+0h8wtOy2jY9OqSk9QX2XSUwIvxXKJ/KIEXqBipLoYtKb95hE+ZElql+kL3fxuO+M8cShkFDZtDUsEb0SoPDIASXpuYqwPBEsTgPnnURcUu/vaahTfRmxF9rso9vBuFjapHH+Q4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qB51PsFb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qB51PsFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2730E1F000C4;
	Thu, 15 Oct 2026 00:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792022720;
	bh=HX0jqZ6Ei4Zd+dXuJ2rolcpkuLDQZATSc3MdY7kcrts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qB51PsFbylsxK7W8jTmiK0HxYIjGQ4CiZTFQkcBr58p8QorGxfQTvamTBqshxBnVy
	 Adr5V0xQWYRfCju9oncwQ9xM5AihJmOqdTEqMvWhbwKjGEyMJ8RryOl+kdN9rvNZ4M
	 OBlsaAXjwj/ViNxVlnx+p7ekyRd30M4ujllDYRUQ=
Date: Wed, 14 Oct 2026 17:05:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Ye Liu
 <liuye@kylinos.cn>
Subject: Re: [PATCH 0/3] tools/mm: show_page_info.py enhancements and fixes
Message-Id: <20261014170519.d07e3a5f791e16a5cb9f51b2@linux-foundation.org>
In-Reply-To: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
References: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 15:04:27 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> 
> This series improves the show_page_info.py drgn script with bug fixes
> and new features:
> 
> Patch 1 fixes memory cgroup information retrieval by updating the
> obj_cgroup type casting and handling slabobj_ext field name changes
> for compatibility with newer kernel versions.
> 
> Patch 2 removes the incorrect Page Index field display, as pages
> don't have indexes - only folios do.
> 
> Patch 3 adds VMA flags decoding and VMA name display to provide
> more detailed information about the virtual memory area containing
> the page.
> 
> These changes ensure the script works correctly with current kernel
> memory management structures and provides more comprehensive page
> state information.

Thanks for continuing to maintain this.

I'm curious.  Does this work mean that you're using this tool in
real-world situations?


Sashiko had quite a lot to say.

	https://sashiko.dev/#/patchset/20261014-show_page_info-v1-0-7a68aee0114a@linux.dev
