Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219893AEF56
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674292; cv=none; b=GNoSHUbQsOumj+lsaw8z/mp5lHzAiakHEpXoI5oZiEuRe2iT2VjGdSQ7qHwvhhpE+sgTPZW/d7pooIvx+eerf2W8VLLxO5jFNbYLvVTXEq6dnr04Zv7A6HASpyqNgGiChHuzvCb/UGiwYn+GwbRx0S01plWS9KhLV/Fc/gASq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674292; c=relaxed/simple;
	bh=hUrOZ52DDstARIDO01aRn/uvMq2nL0l0cd1Scv1pds8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=nd03D8D9/tGZ94mdW59b/Y20ubhCC2zwGURXo0yyn7hlK6/f6SSXm/9veObt7yHVWe+CwJ14nfrWqcau4HFm0od5kGFr22yQFGpJXpQP2JtTFIJs6HPEpviXkdwsZXss4Nduy4Kt8vhzh4Dx9uzuKiMfDcsL/fQbHJ/njAox7AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=CCbFAu3A; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="CCbFAu3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790674283; bh=rP1Kjv8k98xwAfYx7eMTbq7vYEhGH14gXrZgLKEr/R4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CCbFAu3AtcCWm8ZoP77iu6jMtJDHagKwWF6dkHdEL6SiYshY1Dnz4BYjH9J0k5NIp
	 C4z6Zbdw4oqc9gc0M/TKeLFGRnmoIxYvcUKp8mZhVpKieOrZgn46Saay2O3FCcl4i5
	 3mI7c6vCQT9hllI/xW9neVSCMuh0R9XnZjSeB2mY=
Received: from lzk-B860M-AORUS-PRO-WIFI7 ([2409:8a28:a83:5ba1:514f:5353:e14b:594e])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 7899AE10; Tue, 29 Sep 2026 17:30:09 +0800
X-QQ-mid: xmsmtpt1790674209td0i7yvm2
Message-ID: <tencent_736FFBB76DA2EA0BF5E60B9BCFAAE9692707@qq.com>
X-QQ-XMAILINFO: NwU6Bou9okj/siVb1eHQhL+Vspf7kVKi/MRFyz3JXUqc7UvJIWn92IwBYZKOlZ
	 vriojD8PB13ppx8glRZC0ssNjXyPj/+KlsHJn50UEGxhYy3Wgz883kRXY+bIOavBkypbHqFwuLsZ
	 Yn/G8E2MhepRLEKjzA7A4ZD/d2hw8hvr3C/Ok56voS3MpjvfaBfQx12ab9oBFVNq0dgWhta/rH5G
	 o84eR/z5t9mvWXSfCX43vHCqxnmYTWCA2WhPU7N2wcvuHeGo50sAeByxfTWkbY5hhOLhA+QiLnhq
	 xh8szW5ddQJTAMkTzz81xIlVAfw4435of7BruPztSOjAU47Sz0I8iJUCVH0jO1i7QaVezh6HTpuN
	 BHbqAKgRvUL1AFjrJ5mbsekDd5Ed9kN66SHD7DzwWqi4zLvWbqilf/q4B80IJDgLkz5rmFQiO6r0
	 cZdLtO6lOlNksuoNFpRIFq9qwnUMtlRVs9FYGXozZDnp5YhGn/aBvKgUaMk+BwXJcUyKsjoMRumx
	 jesC51ki41DsmwdUGe+SKfM6KqN4EjZay880cl+FTbnqA/LvwG2rzCADij+Q1tCgejPGE95XEocM
	 itc4HLpqT8HQ7buRSDjqyDslryCJLZaPZSnnNgodM1BcanQ/i1EXBBpUL6XVP+gbF2CMLFgKycQS
	 GJJXuZfM2tRcZsfaAfcJnHp3AhGkTIRxBrr2HiqpJ57PJPidYJ02WKmmud6uV3EadcmU3pIF0+OO
	 dDpAmSIaSNjyq+ELUIw3LWwGjVpobwFyQRctooFL9EcrlvjAx37tV+sJDY1ajT2JSSrmPvXJxaUZ
	 4awGWdjyo5p5bltlCLgONS2IG/hiYz/9m4KMZDDUVhGxmZX6Cj0hk+25Jn6YUoKcgYlcz7WNYrTc
	 RDCCn6rbYLvC8KMUfWmp8OByp060MK8kf9jQY2g/6bDdsSN/85MM18Vgp8mGI9H/qz9SPgzf1/wL
	 FWPO+g/p1BnE7dTjXvk/CWRl2YvLAaKO5IDwry1Z53zhNdG1AqH/eJhmBTKXSnvVaxTFaW1NvgVf
	 X+WXqLPha1UxuzIY3I2IMr2Y9fJo35HES7ZcFsXMh6EpY3lfIK3+UgCa8nYljO8hC8xtsDu4/LI/
	 /WGBp5f2CVofzjGHlBu0iB3m6M550LCLoHen/PKDHNKgBpkCu/69aJeYQwBb9fnCnjE/cQ6yp6AN
	 VcChw=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Zongkun Lei <leizongkun@qq.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Zongkun Lei <leizongkun@qq.com>,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kairui Song <kasong@tencent.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Hugh Dickins <hughd@google.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] mm: swap support for hugetlb folios
Date: Tue, 29 Sep 2026 17:30:04 +0800
X-OQ-MSGID: <20260929093007.555388-1-leizongkun@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <art0PItp9LoUXIcd@gremlin>
References: <tencent_501F9D3CED07B66BAA97D5352FB63EE1A709@qq.com> <art0PItp9LoUXIcd@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 09:18:51 +0100, Lorenzo Stoakes wrote:
> What David said - hugetlb is in freeze so we're unfortunately not
> interested in such a big change.

Understood -- my mistake was misreading the subsystem's direction:
from earlier list discussions I had concluded that keeping hugetlb's
reservation semantics intact was the bar, and designed the series
around that; I see now that the actual position is a broader feature
freeze.  Thank you both for the straight answer.

> Also you somehow sent the cover letter and the patches separately.

My apologies for the mess.  My SMTP provider (QQ) rewrites the
Message-ID header of outgoing mail but leaves In-Reply-To untouched,
so the patches reference a cover Message-ID that never reached the
list.

> ... triggered an AI detector script ...

Fair, and thank you for raising it openly.  Full disclosure: I used
an LLM to help organise and polish the English of the cover letter
and the per-patch commit messages.  It also reviewed the code, and
some fixes found during those reviews were applied with its help.
That said, I understand every line of the final code and can defend
all of it in as much detail as anyone wants.  Going forward, any
submission from me will carry the disclosure tag that
Documentation/process/coding-assistants.html requires.

> ... we expect you to do smaller work before moving on to larger
> changes ...

Point taken, and it is fair.  I will look for smaller mm work to
build that track record -- pointers to a good entry point are
welcome.

Thanks for the detailed reply, and for pointing me in the right
direction.

Zongkun

