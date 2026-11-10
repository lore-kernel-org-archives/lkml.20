Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312656;
	b=wtHYxU0qiAq3Y+Gyd13ptaYz0TzQhE9qHEwWjBAWBkJGZF8FmHSYLay4QhRGZqDhpNym
	 /IawnwPzTOVfMdKcbtv+Sdo7k8kz7zT4mne3mhE4kAh8khsadsGs8jZrt2cUqEqcIYHYu
	 Vly/ohGPXJDylBT1AMcNvBxbt/MOd/y/c2dWs9btPqobljn1RbONSXtWFQCXiBMfPjpA0
	 0NRcrBH1qyaxr8le7utkPdKbK7k28D3KMv5XCFRrYPdGnEStZUSTCLHUeJ3QIMn+4kAU/
	 X3dduTYfELDblqixo0vduLqjumxBKpkhjD2yBb8t/uQhO33IISuttcpV2uymhaoa3lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312656;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kySWq79D8+4JcJHqDpdMqOzDpgJqrKwfdWIwwZ4/JFk=;
	b=j9pjY7C9Q1KxH86c4sLgGAMlgPmCGTp+qmfXy4T7uAtuS0jGnY73LkNWULMXirRlEVaI
	 eegjCsXdddpKWAG1i0KlgyTHjM0qrU7WINpHT+DS9pXe0+LNMwygzzveLTUvpqZv/7KBK
	 QzIIkbLlWgBKp4OIjcyDQsgDWEwRpb9W9IimSd2ev0qUtYllEDt1vM9P+FqSlcCfd3Gu9
	 LLjplKHXLQWaqd/wT+WMMkbx4jtO9nKNvgpYH72Px+kbFwARNTgMtG5zjCT3K2+uo54Mf
	 6NoHuoDWHPRXfczNvOQGhQpgF5E1SKA459m5IilbvuhY8d3OZ9ExV/onKRtFGpPcmwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XwbbEAHM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FFC606A945
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XwbbEAHM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3D31F0089F;
	Tue, 10 Nov 2026 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312656;
	bh=kySWq79D8+4JcJHqDpdMqOzDpgJqrKwfdWIwwZ4/JFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XwbbEAHMpst6vdv+xbbm4PBRNBPJ3+Gvj7oP17KXu17XrsFeXboo3H0vTaUaZF+ox
	 5EZiUbdKVJ27+lEnHMmnv9ujd5ArTOqaPqsc8n1P0fQQu9piB/JTHPxs/m6sUL0OWl
	 ATkcQoL63OZjDX9qQS6ExJdtndMB6D12jf7RNMm6IRZyEwRjwYcwv59RoGpZIJhTHL
	 rHuTpEndQci+y3BpuXW0zdAu2uI7LuC/Tv1u9k/e+SGl7s7AXTVNETVIzV5hfsWvlr
	 UX+NZVu9kqbQyy9O2tyNv/tMxIoRJ5+T0fDlVf626BGvOl8rqkQyo3EPCNKZytcXW5
	 xffGpJJ/SECzQ==
Date: Tue, 10 Nov 2026 12:10:51 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: n3rd <18670333770@163.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>, 
	"security@kernel.org" <security@kernel.org>
Subject: Re: [SECURITY] mm: mremap/remap_file_pages skip fsnotify pre-content
 hook
Message-ID: <avMHhOHuRrvVqWPr@gremlin>
References: <4f296d67.bbe3e.1a1c54655f8.Coremail.18670333770@163.com>
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
In-Reply-To: <4f296d67.bbe3e.1a1c54655f8.Coremail.18670333770@163.com>

Stop spamming the mailing list with your unfiltered AI slop.

You've sent reports for stuff already fixed. You're reporting non-security
reports as security reports.

You're not even bothering to format your emails properly.

And what you're sending is an unreadable mess.

We have no interest in this, please just stop. Thanks.

--
Cheers, Lorenzo
