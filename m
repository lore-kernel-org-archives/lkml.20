Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198792;
	b=xueNsd7USuP/4q9bYhbx+wWFcqaZsHz1XeGIvM6L77sxUBg+yzApCzKJJSLSAn0LVy/q
	 MVvxFmjQ+QzLvN9JTqLklAlu7bUX30A76L6iNyuKebkDWjLE+5LlxSLZc/QWAP7HZi+T1
	 3veMXHzd6BBxFKGV9KJpErRzjSZg8zP1EgCW0g6NtR/h83XX/6wbUETWcJiazqayMWk7n
	 JoYAXtfN376NL3SP5cAZKoqi3U0KnhUcAvslKlWfZKW1EJt81YCIPge1ZH1WJ3FygR6u7
	 tg+NMOZOJu0dvXg2zONBafuBvifj05M87offOAbkVH/exXO7XMh4sVEzE4SIAtUW4WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198792;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/BmiWFD+AIfcKHrCYW2fJHXVTBL4UVTz8KwvZjgPr3A=;
	b=Pknj0fhNwNzytJoagGdyWL5jkJrPPuEf23eizkN9mocwbGTvawOqNvDBNaT7BBnJv4Q4
	 5Onzn3uNhjlLPt/QavPJ9OSjjWU0x0GcpaS0Nw4qICNLnYqauWWPu6RxEJ+Shf9xJV874
	 Yo3LBpkjIWqQ28/R3p4YdRFdIAWHjYIX3fuh812YqA1d2wCDGyeJyz9nCVe1ILdEma6pr
	 HczU5ZCqzIwTZYYmWbLVLuaR09VnNwf95YQaWbvk6THs3gOzo91l7nAsrER5ZF6MvWgYv
	 Xe10qhTAoTD1zpHDnPuQzTwoTlooTHmjn9YSWaxn/HjjxxeJVjcRUGT2oKTVDEdYC1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqSt6JSp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EA2606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqSt6JSp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4741F01825;
	Wed, 28 Oct 2026 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198791;
	bh=/BmiWFD+AIfcKHrCYW2fJHXVTBL4UVTz8KwvZjgPr3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MqSt6JSpwGVWhxl0hOVTwcwqyqfM7zbgydUleSZjs/v3QY8wthj63Nc/1A+eqgKMd
	 j4c2OtHgHkCvUrO3y64hfl64zYscEyYw2YkTKhELSenR+WECUg62ZoAGdE9Y7EXVvM
	 CXNwSaDrjQ7NVKXl7p5bW171soHKRYJ1FG1U0nV5p73fMU/3JXd/+w0xPGlSd2jhW1
	 QKGCOL8VjxYnbm2ZuSTiNdqMIMsy+pYOcRy/o9oQegNdWE+R+K3yanqgz48ILRj/qz
	 SLQBZcZq37wYHgRkPknekebTDKy0vKW+wKYZhpb4ppTaBV03/7uxn+POQwIlAk7biS
	 +nR+3p7SCCi6A==
Date: Wed, 28 Oct 2026 15:46:23 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Frank van der Linden <fvdl@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Chris Down <chris@chrisdown.name>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH 1/3] mm/hugetlb_cma: fix incorrect hugetlb_cma_size
 assignment on malformed input
Message-ID: <auIKvwTBF1-jeThh@localhost.localdomain>
References: <20261028113319.38544-1-kaitao.cheng@linux.dev>
 <20261028113319.38544-2-kaitao.cheng@linux.dev>
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
In-Reply-To: <20261028113319.38544-2-kaitao.cheng@linux.dev>

On Wed, Oct 28, 2026 at 07:33:17PM +0800, Kaitao Cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> When hugetlb_cma contains a global size after node-specific entries,
> cmdline_parse_hugetlb_cma() enters the global branch and reparses the
> original parameter string. For hugetlb_cma=1:2G,4G, this interprets the
> initial node ID as a one-byte global size and clears the 2 GiB reservation
> recorded for node 1.
> 
> Global and node-specific formats cannot be mixed. Return -EINVAL when a
> global entry follows a node-specific entry, before updating any settings.
> This preserves the valid prefix, so the example retains node 1's 2 GiB
> reservation and reports the malformed option.
> 
> Fixes: 38e719ab2673 ("hugetlb: support node specified when using cma for gigantic hugepages")
> Closes: https://sashiko.dev/#/bug/linux-10f40d3e-3feb-4622-9da8-1fedecb2d0e2
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
>  mm/hugetlb_cma.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
> index 95fd2d190f0d..8e6b20341fc4 100644
> --- a/mm/hugetlb_cma.c
> +++ b/mm/hugetlb_cma.c
> @@ -167,6 +167,9 @@ static int __init cmdline_parse_hugetlb_cma(char *p)
>  		} else {
>  			char *next;
>  
> +			if (s != p)
> +				return -EINVAL;
> +
>  			tmp = memparse(p, &next);
>  			if (*next == '%') {
>  				if (tmp > 100) {
> -- 
> 2.53.0
> 

-- 
Oscar Salvador
SUSE Labs
