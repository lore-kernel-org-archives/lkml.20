Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88FC3515C7;
	Thu, 24 Sep 2026 20:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281381; cv=none; b=GpL9cmXIOiuAoq51LVPWsDJkHYtn3gEIFkzBE1nq5XQIBFCkFs+YEq+8cjRAHM6prxXBLI9LTRG/WRIMa2mgbA/G3q7f9zelNHfvjfpvG5zk2yltZMHHHhRZNmv+AY3PKh6+bcN1vzuNyzGRYR/85z1ECB7zjGe2nXGi4FrdVgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281381; c=relaxed/simple;
	bh=boRxUpW25x67S2FV2atISAuJqrzadzV6HeLbDg3Lerw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItD0aSCMNiGoq7mdpwRn5SNU8Glz1MvmYLTu+4Dlo+NY02Uc+iYDxVFJ36+L7CWVjp3GVwL+G0L5BUV1LH5pgZHRK9Jn3aNmWMw8K1C8Y2OTTAezQVlCXAKXTIYzcwrwLdw8fyz6UlHPN76++tvMZc0oeAnBISNMrv+FYkREq7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Sy4abGcI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Sy4abGcI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=bvQpNq8en5RKT6K3ZHe+u0VWk0SsW+4iyMjAqoSpnrw=; b=Sy4abGcIotABKktZwnP/AYAfG8
	hagtxFUXVtqrucGBMI7cQRJEmvHIJP2Mn28g7aCsjxxcUfXFa3FqUtPh5muf8jfeSpng4p/wEZ8At
	ZfFtwrvLJF9GAg2L6QSmyly/1ImpKsT/j1cGfi7LmD9ePveftvS4RnAhO1OLMfBNux3g/YXHO490A
	jeKECDNnXeGLrdKTB33UgMsZg9/r3WGo2y4acMGWGuqI9qowymwbPH0VQDMwfDxCXbtTxOH7vy0Pe
	5tX0AZMYVBy9Fu+LTBB7vbKYhd1GXxON6eH1gFo+nG9/iPQ4dXYmbMaEdK24hdTh2c4MhKCU3CgAu
	NX83D3Xw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9py3-0000000C8HV-3AfE;
	Thu, 24 Sep 2026 20:22:55 +0000
Message-ID: <1f5285e0-a483-49d9-b230-b72f85344a03@infradead.org>
Date: Thu, 24 Sep 2026 13:22:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/kernel-doc: fix false pointer-to-function match
 for array members
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923-kerneldoc-embedded-bitmap-v1-1-f0d7fca9a0c5@oss.qualcomm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260923-kerneldoc-embedded-bitmap-v1-1-f0d7fca9a0c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[ + Mauro]

On 9/23/26 10:39 AM, Jeff Johnson wrote:
> Currently 'scripts/kernel-doc -Wall -Werror -none' produces the following
> warnings for patch [1]:
> 
> Warning: include/linux/ieee80211-uhr.h:735 struct member 'valid_tid_bmap' not described in 'ieee80211_smd_ctx'
> Warning: include/linux/ieee80211-uhr.h:735 Excess struct member 'dl.valid_tid_bmap' description in 'ieee80211_smd_ctx' (did you mean one of: 'valid_tid_bmap', 'valid_ctx_bmap')
> Warning: include/linux/ieee80211-uhr.h:735 Excess struct member 'ul.valid_tid_bmap' description in 'ieee80211_smd_ctx' (did you mean one of: 'valid_tid_bmap', 'valid_ctx_bmap')
> 
> That patch contains the following (members not part of the issue have been
> removed):
> 
> /**
>  * struct ieee80211_smd_ctx - IEEE 802.11bn SMD Roaming Context (refer
>  *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9)
>  *
>  * @valid_ctx_bmap: Bitmap indicating which context fields are valid;
>  *	bit positions defined by IEEE80211_SMD_CTX_VALID_* constants
>  * @dl: Down-link context data
>  * @dl.valid_tid_bmap: valid DL TIDs for which context is present
>  * @ul: Up-link context data
>  * @ul.valid_tid_bmap: valid UL TIDs for which context is present
>  */
> struct ieee80211_smd_ctx {
> 	DECLARE_BITMAP(valid_ctx_bmap, IEEE80211_SMD_CTX_NUM_VALID_CTX);
> 	struct {
> 		DECLARE_BITMAP(valid_tid_bmap, IEEE80211_SMD_CTX_NUM_TIDS);
> 	} dl;
> 	struct {
> 		DECLARE_BITMAP(valid_tid_bmap, IEEE80211_SMD_CTX_NUM_TIDS);
> 	} ul;
> };
> 
> rewrite_struct_members() processes each member of an embedded named
> struct/union. Before testing for a pointer-to-function declaration, it
> does not strip array notation from the member string. When DECLARE_BITMAP
> is expanded by the struct xforms to:
> 
>   unsigned long name[BITS_TO_LONGS(N)]
> 
> the subscript contains parentheses. The pointer-to-function regex
> '^([^\(]+\(\*?\s*)([\w.]*)(\s*\).*)' then greedily matches the leading
> portion up to the '(' inside the subscript, producing a garbled member
> name and losing the correct 'substruct.name' form.
> 
> Fix this by stripping array notation unconditionally before the
> pointer-to-function test, rather than only inside the else branch.
> This is safe because the array dimensions are not needed for either
> the pointer-to-function rewrite or the subsequent name extraction.
> 
> [1] https://lore.kernel.org/all/20260908-smd-v1-10-65ad4ab30fbd@oss.qualcomm.com/
> 
> Assisted-by: LLM
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index d9ad1ddc87dd..f097a13e47e2 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -738,6 +738,15 @@ class KernelDoc:
>                      for arg in content.split(';'):
>                          arg = arg.strip()
>                          #
> +                        # Remove array portions. Array members whose
> +                        # dimensions are expressed as macro calls
> +                        # (e.g. DECLARE_BITMAP expansions) contain
> +                        # parentheses inside [...] that would otherwise
> +                        # cause a false match as a pointer-to-function
> +                        # declaration.
> +                        #
> +                        arg = KernRe(r'\[.*\]').sub('', arg)
> +                        #
>                          # Look for (type)(*name)(args) - pointer to function
>                          #
>                          r = KernRe(r'^([^\(]+\(\*?\s*)([\w.]*)(\s*\).*)')
> @@ -754,10 +763,9 @@ class KernelDoc:
>                          #
>                          else:
>                              #
> -                            # Remove bitmap and array portions and spaces around commas
> +                            # Remove bitfield portions and spaces around commas
>                              #
>                              arg = KernRe(r':\s*\d+\s*').sub('', arg)
> -                            arg = KernRe(r'\[.*\]').sub('', arg)
>                              arg = KernRe(r'\s*,\s*').sub(',', arg)
>                              #
>                              # Look for a normal decl - "type name[,name...]"
> 
> ---
> base-commit: 414f2b40f7b0244ea3ec1f7411d194a6d9c89c33
> change-id: 20260923-kerneldoc-embedded-bitmap-2e363ca11863
> 
> 

-- 
~Randy

