Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF5E371D1D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487357; cv=none; b=UeuQtzsbhuRI849m3orJJ9bF33s/T8Q3OTKweCO25XIiQZ5IHkDVOnk+AFhAlAqOP1AxmH6E4mh5JxMKJr1hygwA+pgf/OLxQ09JJUBF3+vMfheQF22WCybRfnBLkPgFcAi5xMbBpIV7ZTb/F1oXaxtWoSD27EDjYToOXEfyvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487357; c=relaxed/simple;
	bh=IRNjWwtblHZPXQUHIILNxBFlUGdwG1SijAjpODgt3N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNXf92HjitbviiU0k8NwFyCCHDf//W+7EGk6FkWY2N/OpM1WUVoITFLTXwItJF/5DNCLDJXpHs0gb6BkNPtl7htBOKM2/ONQiYqVLdA46Fyx1COr3iv5qnLA3QU2tcGwSfnoQWYzlKjz5V3O+oj7bJdx0vxx4/HHQ7W7dqxHNZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KN00xSxh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN00xSxh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49954b88fffso3606775e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788487351; x=1789092151; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhTHYmKHEO3PH5BDNgKld+lAussDPjnOrykc+7iGYw8=;
        b=KN00xSxhBx9nvetx8ma3hNmaYriA6SsUVApjjzyp4/1lFESJXWGR1piFY6ybChHPE1
         xFpLgWw5PnRtH3Tu/Je+cEwcs/2W2n3AB3mQZ075LENwBv4kO4lTbFehbyB1ivsYbPw/
         tq9Q9orLuQmulvd91Jb6kxK5SIsaxlI4sJIPkutUSEjtPKqSZ8QahQ278V11ELS7y0DA
         8BZ6qLC9WxXeStwvq48q78i5VcVmplOVDDpZXVHm67c/X+92PfPf1tL1T8oYNxWknCRc
         tlXMDR/S1Fr6BE+S+kM99qQ/UnWsk8XaQ3usCENL03DI0ave5W+y6bmvyuZ9FrQfM/lC
         Eyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788487351; x=1789092151;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hhTHYmKHEO3PH5BDNgKld+lAussDPjnOrykc+7iGYw8=;
        b=Jw5IHcqW8ylG34vdCvoXzdxSVDgq/1hIbfrCeDGpD/xxnk89rLKFs9a+xcaiTVssL+
         trnrlGl8raF0PVnvHfTzJqEMpT89EB82nSQSZgNP9tX0jUDjusDr4ymfMsGfQepBLgBs
         LyhLFDO2RZ2CAVFAQ6Mfs/4G5BmSBAvEmvILhZiyf9Bqza3BTi0Rvlr3r8Ns4C0tVC01
         mb2VW60KK6ZCXxfBz6VK0RnwlNur2BWi7L6hKmzmgCxIrEcaLXytaKzPY1CTzfGbsVvf
         nXPRqwN4WthH5w+VUoEfuZRJZ5RIL3P+9QHiu5T0orvZ3/VYquyePzMq52PhkAXqVICA
         coDg==
X-Forwarded-Encrypted: i=1; AKwUvByNiciLHB1y7q0fUwKP22Er28MIliuQhB0dMS1HIE231LzO9G3CETYFx75kHADk55wWQPsiE44N3NfXCZc=@vger.kernel.org
X-Gm-Message-State: AFuF++mTDJWk3XJsoxYBK7zWW1LZ3Uk+fex4z0gt+srmowAG0sux+5Zq
	6bT9pf8Q1HCbS4svWPgti9BLu7wm4CzWuyr0Z8hFboC4/Wp8SNAznHZ+
X-Gm-Gg: AYBFou1Q+LQ6zlRFBCYUJEsFrKOK3HnMvnJZFVxlHy2eP8lOBzcb6A5HUGhhQeXltfx
	Jux92M0Tg/PGcx3OgBeE9QLCS7fltx7t+1L/mBaRxfj7DXp8zbSwipREjlaxnB/J5vXBAu5Ns2a
	bPTeOqkgL0A3htXydjgILe09Lf8bh3x9V8ItrOQlwOLrAHqvrA8D3bBKE+a91ZssXe3Xu8AZqdu
	eDaxgieh1IbNxfdBXO9tqCzTIab3lIjP44Ro66pYR840XXUL3MZtABVquZagyzGmYS++ceyqomt
	nxxuCRrlv6gWdILlaAPq3QptApp23VMN9zoqxUoK3OUzqol9Sf4Usvp0qLSmK05hdhnyrEa/WEe
	XfU1XqdtCUjGOUbLIpSzz4pMlEIGQrDzo+HZ+odVi886lkZ3nj8ydpFTR8Js1O4xwST5UJYSG44
	A3oLTGJXJQIp7upauQYMnbLuAqkdWb3X/ZRSTPXNM1jJ3g7y8cUEQBd2inY7Q=
X-Received: by 2002:a05:600c:1549:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49cf81f47e6mr30791955e9.6.1788487351136;
        Thu, 03 Sep 2026 19:02:31 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm115941975e9.4.2026.09.03.19.02.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2026 19:02:30 -0700 (PDT)
Date: Fri, 4 Sep 2026 02:02:29 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, david@kernel.org, ljs@kernel.org,
	riel@surriel.com, liam@infradead.org, vbabka@kernel.org,
	harry@kernel.org, jannh@google.com, willy@infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	lance.yang@linux.dev, Kiryl Shutsemau <kas@kernel.org>,
	Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH] mm/page_vma_mapped: guard check_pmd() with
 CONFIG_TRANSPARENT_HUGEPAGE
Message-ID: <20260904020229.etsxwqw74ug7c7hs@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260624082359.2869-1-richard.weiyang@gmail.com>
 <20260902200220.408ae7e8a28d3af4e82fd060@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902200220.408ae7e8a28d3af4e82fd060@linux-foundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Sep 02, 2026 at 08:02:20PM -0700, Andrew Morton wrote:
>On Wed, 24 Jun 2026 08:23:59 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> The kernel test robot reported a build failure on the parisc architecture
>> when expanding HPAGE_PMD_NR in check_pmd().
>> 
>>    mm/page_vma_mapped.c:142:13: note: in expansion of macro 'HPAGE_PMD_NR'
>>      if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
>>                 ^~~~~~~~~~~~
>> 
>> The config [1] in report link shows neither TRANSPARENT_HUGEPAGE nor
>> HUGETLB_PAGE is defined. Then trigger the BUILD_BUG.
>> 
>> Fix it by define check_pmd() under CONFIG_TRANSPARENT_HUGEPAGE.
>> 
>> [1]: https://download.01.org/0day-ci/archive/20260624/202606240042.ffPsEXVc-lkp@intel.com/config
>> 
>> Fixes: 2aff7a4755be ("mm: Convert page_vma_mapped_walk to work on PFNs")
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202606240042.ffPsEXVc-lkp@intel.com/
>>
>> ...
>>
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -136,6 +136,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>  	return true;
>>  }
>>  
>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  /* Returns true if the two ranges overlap.  Careful to not overflow. */
>>  static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>>  {
>> @@ -145,6 +146,12 @@ static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>>  		return false;
>>  	return true;
>>  }
>> +#else
>> +static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>> +{
>> +	return false;
>> +}
>> +#endif
>>  
>>  static void step_forward(struct page_vma_mapped_walk *pvmw, unsigned long size)
>>  {
>
>lgtm, thanks.
>
>You provoked Sashiko into talking about memory corruption and kernel
>panics in page_vma_mapped.c.  Usual stuff.
>
>	https://sashiko.dev/#/patchset/20260624082359.2869-1-richard.weiyang@gmail.com
>

Hi, Andrew

IIUC, the issue reported by Sashiko is fixed by 

  commit f84ca9b1888d ("mm/page_vma_mapped: fix device-private PMD handling")

>I'll cc likely suspects but boy do we need a way of being more
>organized about this.

The build error fixed here is introduced by v3 [1], in which check_pmd() is
invoked outside a conditional "if".

Then v4 [2] and v5 [3] call check_pmd() in a conditional "if" and at last
David fix this with IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE).

Do you suggest still conditionally define check_pmd()? I may not follow your
point.

Have a good day.

[1]: https://lore.kernel.org/all/20260622130651.23359-1-richard.weiyang@gmail.com/
[2]: https://lore.kernel.org/all/20260624065353.1622-1-richard.weiyang@gmail.com/T/#u
[3]: https://lore.kernel.org/linux-mm/20260630021540.17297-1-richard.weiyang@gmail.com/

-- 
Wei Yang
Help you, Help me
