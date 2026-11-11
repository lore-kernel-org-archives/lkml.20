Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402494;
	b=EDeSOGtF6V1Mmdd8LLwLa+vxGYThtfy40TSD0KBbF9+Efsll/9S3KZYkm6RGBqb9Y8NR
	 nkyikLRrRbr1YxhNLJLdiF5lrrF1jw7WpAkpQTQNDZvOWu28lkbeYQhWTBxNM2jwc1whH
	 KxKTvaXWFY4Vw6FbPUflu5e7vHA/DbOulPFImwU0bDL4ghRFTGn21DmXrZenNxAmhVs1Z
	 A7Yg2u7I8Kan5R/tp6Lw3oQVhQZLMM3CvzuOcCVyOuA3fa47rTtTTQ0UdO3t9SKoXfyeD
	 /NjwS4FysVoM6kDFrO8rRVhgPtnJYJW5VbtPgH3Dboivke00svpjvVxOLJ/mDU0RJQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402494;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Wtrfbq/84me6zE0MLJLp9C9DU+2mrh90EBu5d7XMXiE=;
	b=Cav/WjQBOSUqI1ZfFHxLVnuBWL2JjAlbJbyQPF7pKSH33vMj86jdfRrOskYT7kRiYFIM
	 DIkiuAlgJUDMK1ILFI0rL7XUDo7EGEtCdR1BLGal7y+eqblHXxeocIpuVy/p0JO5MgeML
	 XvGpTGKbI1B8+HU4I77DS7wNWMJarD8I9cUDlERw8lRgXpGBXlleBlZbrq0F6H3dd0awI
	 wwj8topR580wp58WH/y3jA9B/eM8ELQP+sHo4rINn60xeKglXAUP6MzfT8hSnZJ7Wqbah
	 jQfmnF6J1218yuQmQbp704zhnFWv5GGTrv6PpTKgkhpRmz4JFiELg4DcX5EYJb89V1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=bPQjkCfL;
	arc=none smtp.remote-ip=91.218.175.48
Received: from mta0.migadu.com (out-48.mta0.migadu.com [91.218.175.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF65606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CF65606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=bPQjkCfL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y+v35VGrajEnkWTTuGT43BHyWx5tYjdNmcmIwZSW2U4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794402490; v=1; x=1795007290;
 b=bPQjkCfL2gaihAApHVLj+D81uJgf9oYkSogxugQQddOmHy73p5EIUYqminHTGE0bBxrrcp3/
 /XZVk6bqYIXkF8OmiKx9KuGrsxRedTgPNeZ7O29JLgs4jYaj+GQ+MbUGDxE29EPAICfS1d2/f4r
 wImA8+ffZHJzXLBMHHgl3mdnVsyP47++MR4+7H0cAeb84S9JeQ1KUJWUrh+VvbIUTXDy6HRnt1r
 9752pZ+h7Uk3DfZS33bO+NxLcnYt2b+ko7BtBGGxzG1z+YcfmkgPEgx0CswBpsdhgTUqRGdWzx1
 Fim9Pv6gGPd1gfjxdRrJVOM0syhA4mVwKJkSqmK0tKi2Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f46c230d271e9823;
	Wed, 11 Nov 2026 13:08:10 +0000
X-Mizu-Trace-ID: f46c230d271e9823
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 21:08:06 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/25] docs/zh_TW: process: sync 1.Intro.rst with the
 English original
Message-ID: <avRotoTK1Gt9MzAX@wyuan.org>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-2-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106113142.706783-2-chenyou910331@gmail.com>

On Fri, Nov 06, 2026 at 07:31:16PM +0800, Chen-Yu Yeh wrote:
> Re-check the whole translation against the current English text.  The
> only English change since the last sync,
> commit 4a0be1a25d98 ("Documentation: process: Capitalize Git, Quilt, and
> Mercurial consistently"), capitalizes "Git", which the translation
> already does.
> 
> While at it, fix a few translation errors:
> 
>  - "language" in "with, optionally, language allowing distribution
>    under later versions of the GPL" means license wording, not a
>    (natural) language; translate it as 條文.

Good.

>  - "false economy" was translated literally as 在經濟上是錯誤的;
>    use 因小失大 to convey the idiom.

Good.

>  - Restructure the broken sentence about code that cannot be
>    contributed.
>  - Add the missing "too" (也) in the embedded systems paragraph.
> 
> update to commit 4a0be1a25d98 ("Documentation: process: Capitalize
> Git, Quilt, and Mercurial consistently")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> ---
>  .../translations/zh_TW/process/1.Intro.rst       | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
> index 65c5ae095504..d246de92bec9 100644
> --- a/Documentation/translations/zh_TW/process/1.Intro.rst
> +++ b/Documentation/translations/zh_TW/process/1.Intro.rst
> @@ -95,8 +95,8 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
>  有些公司和開發人員偶爾會想，為什麼他們要費心學習如何與核心社群合作，並將程
>  式碼放入主線核心（“主線”是由Linus Torvalds維護的核心，Linux發行商將其用作
>  基礎）。在短期內，貢獻程式碼看起來像是一種可以避免的開銷；維護獨立程式碼並
> -直接支援使用者似乎更容易。事實上，保持程式碼獨立（“樹外”）是在經濟上是錯誤
> -的。
> +直接支援使用者似乎更容易。事實上，保持程式碼獨立（「樹外」）看似省事，其實是
> +因小失大。
>  
>  為了說明樹外程式碼成本，下面給出核心開發過程的一些相關方面；本文稍後將更詳細地
>  討論其中的大部分內容。請考慮：
> @@ -161,15 +161,15 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
>  尤其是嵌入式系統的製造商，可能會傾向於忽視本節中所說的大部分內容；因為他們
>  相信自己正在商用一種使用凍結核心版本的獨立產品，在發布後不需要再進行開發。
>  這個論點忽略了廣泛的程式碼審查的價值以及允許使用者向產品添加功能的價值。但這些
> -產品的商業壽命有限，之後必須發布新版本的產品。在這一點上，程式碼在主線上並得到
> -良好維護的供應商將能夠更好地佔位，以使新產品快速上市。
> +產品的商業壽命也是有限的，之後必須發布新版本的產品。在這一點上，程式碼在主線
> +上並得到良好維護的供應商將能夠更好地佔位，以使新產品快速上市。
>  
>  許可
>  ----
>  
>  程式碼是根據一些許可證提供給Linux核心的，但是所有程式碼都必須與GNU通用公共許可
>  證（GPLv2）的版本2相容，該版本是覆蓋整個核心分發的許可證。在實踐中，這意味
> -著所有程式碼貢獻都由GPLv2（可選地，語言允許在更高版本的GPL下分發）或3子句BSD
> +著所有程式碼貢獻都由GPLv2（可選地附帶允許在更高版本的GPL下分發的條文）或3子句BSD

I'm wondering where the term "三子句 BSD" originated from? Sounds like
machine-translated to me.

I checked that wikipedia (tw) calls it "三句版 BSD". And wikipedia(cn)
calls it "三句版 BSD" Or more specific: 三句版 BSD 授權條款 三條款 BSD 授權條款

But whatever, I am not familiar with BSD licenses at all.

Thanks.

>  許可（New BSD License，譯者注）覆蓋。任何不包含在相容許可證中的貢獻都不會
>  被接受到核心中。
>  
> @@ -182,9 +182,9 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
>  
>  所有貢獻給核心的程式碼都必須是合法的自由軟體。因此，不接受身分不明或匿名的
>  貢獻者的程式碼。所有貢獻者都需要在他們的程式碼上“sign off（簽發）”，聲明程
> -式碼可以在GPL下與核心一起分發。無法提供未被其所有者許可為自由軟體的程式碼，
> -或可能為核心造成版權相關問題的程式碼（例如，由缺乏適當保護的反向工程工作派
> -生的程式碼）不能被接受。
> +式碼可以在GPL下與核心一起分發。未被其所有者許可為自由軟體的程式碼，或可能
> +為核心造成版權相關問題的程式碼（例如，由缺乏適當保護的反向工程工作派生的程
> +式碼）都不能被貢獻。
>  
>  有關版權問題的提問在Linux開發郵件列表中很常見。這樣的問題通常會得到不少答
>  案，但請記住，回答這些問題的人不是律師，不能提供法律諮詢。如果您有關於
