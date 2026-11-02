Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793596605;
	b=4HvSXUk01ATyYbs03D+xDGtXv1IwCxi6k7h7bzBScXhoLgHxKSUCKvIPpQNI1biW41gw
	 cHZvqYffLK90RXJMgK34MDQwRffTULm97OANicyVi75CqvHFIlJ7ltls/KZS/Qa6+cGnG
	 lSCWQvLZXxRoJcXRG02IY2l0cUXay2WOnjheiN0tn3ubqlOTd7b2sPioqQdZyBg95fAt/
	 Y9eVzMtilG/TJYfZ+SR3rJr+qnkyjrOeGtaSaGKHM0GYDLPeUx97zYECr6BtS22kWb3l1
	 ZzR2YhL5KOv9doITPfSafP7EjhR0dssnFMuXa8ovKmIO6UwRIFl+tgLfUTyhut6L/DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793596605;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AydlHuw6fO2zY4cI253Suc41cz8zgm/O+LvMgOdMh6A=;
	b=4Hv8QmJkWqnsMh3+lo5tcQsxTC4aoXprHbWr/GmmB/SDQqZHsNAJFaE5BQVGRle2BTtL
	 51U0pzmc3tVFnNIyA1wTfbmfaeP34NrP7Jqpdmi3Tl/EdXbmQkJ3z72/h5nWaxZD8uLxI
	 FWmjeV8RSEpU+dFgHTGdonXT5tg/V2iezZ5iHzA5UKOdx9YR1fE+MfgPPuU0ReK8DMqN+
	 mNnT7wGfx6FkIk38077weeCS7RRWYCa23ax9oyjllCedH7w8u4drYFFxGy0EdBqw49Vh+
	 QFA5V5c0O7nsE3jF2b+AaRt2ZKpQEAOSzZ3/iIYXf/vGPt/y3J0xUawFnEWHvZM/1Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=dpfgAeT6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C616606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=dpfgAeT6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B2E1F00919;
	Mon,  2 Nov 2026 05:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793596604;
	bh=AydlHuw6fO2zY4cI253Suc41cz8zgm/O+LvMgOdMh6A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dpfgAeT6XwqEya62aQgDtukLCRoDokJX4+yTA6W3r5srSYYW8lNaavZshZYU9jVQq
	 9LT7W1GdOdDeW7O1/cw332G0uaw3C04X6wClEB0mF6r6Ur1Jkp1WnFAKiTyaj+Gx1M
	 /JlI0wlKndGMZQlDOONwI1O62P1BQofWB/wpHQFU=
Date: Sun, 1 Nov 2026 21:16:44 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Weilin Tong <tongweilin@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand
 <david@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] tools/mm/thpmaps: fix missing mapping names
Message-Id: <20261101211644.c63a2028bbede0f763f41f80@linux-foundation.org>
In-Reply-To: <20261027074904.3328878-4-tongweilin@linux.alibaba.com>
References: <20261027074904.3328878-1-tongweilin@linux.alibaba.com>
	<20261027074904.3328878-4-tongweilin@linux.alibaba.com>
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

On Tue, 27 Oct 2026 15:49:04 +0800 Weilin Tong <tongweilin@linux.alibaba.com> wrote:

> VMAList splits smaps lines on whitespace and only keeps the mapping
> name when there are exactly six fields. Names containing whitespace,
> including paths with a (deleted) suffix, are therefore lost.
> 
> Limit splitting to the five fixed fields and preserve the remaining
> name.
> 
> ...
>
> --- a/tools/mm/thpmaps
> +++ b/tools/mm/thpmaps
> @@ -198,7 +198,7 @@ class VMAList:
>          self.vmas = []
>          with open(f'/proc/{pid}/smaps', 'r') as file:
>              for line in file:
> -                elements = line.split()
> +                elements = line.rstrip('\n').split(maxsplit=5)
>                  if '-' in elements[0]:
>                      start, end = map(lambda x: int(x, 16), elements[0].split('-'))
>                      major, minor = map(lambda x: int(x, 16), elements[3].split(':'))

Thanks.  My pedantic reviewbot points out

: Could we also handle carriage returns and non-UTF-8 bytes in filenames?
: Both are valid filename contents.  Python's universal newline handling
: splits the former into separate records, while strict decoding raises
: UnicodeDecodeError for the latter.
: 
: I reproduced both failures with real file mappings, before and after
: this series. Opening smaps this way fixes the tested cases:
: 
:     with open(f'/proc/{pid}/smaps', 'r', newline='\n',
:               errors='surrogateescape') as file:
: 
: These are pre-existing problems, not regressions introduced here.
: They could be included in [3/3] or handled in a follow-up.

and yup, these patterns could indeed be encountered.

But let me grab the series as-is, on the grounds it's much better than
before - spaces in filenames are common whereas \r's and non-UTF8 are
not.

