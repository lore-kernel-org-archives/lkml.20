Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339759;
	b=CUPPIQxjTXfk3DW1HsilEpjA8+LhZVVktK+bnzuZFU/pLvYTzgzMmDWNE/OvvrTQsBdr
	 4SduMSLvDFgaNL3yt/YBzYS6G7LmNib5LHLGoIi02MJjUw779hf5IVS3r/BMcICNdQj40
	 2oHGWXm8eNno83277Lsu+17GfUoY/ITXoeAzBecotu8jlpVNK8rVuqLtAlr5lyxhAXwFI
	 P5+YGZ+s/jTaXjav+yLFUfYpZndBlElYlArOP1/FlxkAMuM3bliBU6dMLWGXc032P3UXY
	 X+RHvPlhahQ4+bYPGV+BY3ETAo7diAxtsASfejYa4ICQEnLnzxaIU8UtjYRFt1wxprQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339759;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=JB4w5iKs0uTWzvduE6vCEDd3nDp5w9Z/E3NlDHP92VY=;
	b=YRPv6fLICs9odWurxS6X6M/LbaiKRHzJw4nsEi3NjFaqC1Hz9wS4bUrR6IZ08redzFcD
	 eI+ca7yAdF+CAZdUdia8qqqK20BkZKwqc/2K6NhA7+bcEbCh5tfeVP8S8WN3zUtwmxCba
	 +mVYm2QyiryLNWs8iPFIn0dTJ24gNxTZ5YgoTtM/UIW96v4vKiXlN5NVDlGnwWvO1zino
	 TcknsnuRo60xLWKH5WnSbdit2m1+bye1zggHfVxwH/3Vb20kCe4B49FdBD7IQW5dTNsZq
	 WTpenqDosQOWuwGEdlylN6K2BxyuVkr4CDyFXaq64r4D2Z9prjxiUH9m4cMhvMhjvRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Y2UD38d6;
	arc=none smtp.remote-ip=91.218.175.9
Received: from mta0.migadu.com (out-9.mta0.migadu.com [91.218.175.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE55606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE55606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Y2UD38d6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=05MkXZXmd7DVwxS5cDbQdhQy0M9UpJJ2/qxpcf+hr2M=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793339757; v=1; x=1793944557;
 b=Y2UD38d60424krOGGmSy2PimOiAgyZfCTN/HH8Y9YMOL0H0mT4NW9jTI9aTf7FgMzafLeQp4
 hRJ1sNNR24TkDOqltg+opVbGjF+qTnLCf9lcNcwnKsXpYcS87/Jq7r9v8CmINZqmMJC2nbCX4u1
 srLJukK30Uwz5CWrawE8ViPgAllfi7IG2539mfMdLvlCeYDZ6Z1S++4+MQcs570PyujmRYaxwmL
 Qeft/4gQGdBR2o9adFA7FotRCaeqmlPx0bpFc3blP2ZFIoEpGjNQ40V3Ro1DqRmFyp7rFsBiMoL
 Gjd3rRyODX/bhy8kq9ZzC0ll6H05okiHnVEa2VPPANzWg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd2cb36ca1253cfa;
	Fri, 30 Oct 2026 05:55:56 +0000
X-Mizu-Trace-ID: cd2cb36ca1253cfa
X-Migadu-Flow: FLOW_OUT
Date: Fri, 30 Oct 2026 13:55:48 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] docs/zh_CN: align translation paths and update
 guides
Message-ID: <auQxZCR9bzuSn54T@wyuan.org>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
 <auGucr4smrSp9g5l@wyuan.org>
 <0ecb719c-5e0a-400c-b1b3-da2923c40bb4@hust.edu.cn>
 <auQPB6S1VAFOLuhs@wyuan.org>
 <b95c5ea9-cb4b-4535-8eb0-0318357aa11a@hust.edu.cn>
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
In-Reply-To: <b95c5ea9-cb4b-4535-8eb0-0318357aa11a@hust.edu.cn>

On Fri, Oct 30, 2026 at 01:49:11PM +0800, Dongliang Mu wrote:
> 
> On 10/30/26 11:29 AM, Weijie Yuan wrote:
> > Dongliang Mu <dzm91@hust.edu.cn> writes:
> > 
> > > On 10/28/26 4:12 PM, Weijie Yuan wrote:
> > > > On Wed, Oct 28, 2026 at 11:41:25AM +0800, Dongliang Mu wrote:
> > > > > Several Chinese translations are no longer at the same relative paths as
> > > > > their English originals, and some Original fields are stale. This series
> > > > > moves the translations to matching paths, adjusts their indexes, and
> > > > > removes stale Original fields. It also updates selected translations to
> > > > > newer English commits.
> > > > > 
> > > > > v1->v2:
> > > > > - Drop the unused top-level readme_zh label from the translated
> > > > >     admin-guide README.
> > > > Hmm, so why still keeping these labels here?
> > > > 
> > > > [2/9] .. _zh_applying_patches:
> > > This is necessary and used by another location.
> > $ git grep -n -F -- 'zh_applying_patches' Documentation/
> > Documentation/translations/zh_CN/admin-guide/README.rst:82:   :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <zh_applying_patches>`。
> > Documentation/translations/zh_CN/process/applying-patches.rst:11:.. _zh_applying_patches:
> > 
> > Seems that it is only used in your patchset? Because I didn't create
> > this label when I made this translation.
> 
> 
> Yes. It originates from the English documentation. To make the translation
> have the same style, I create a similar top level label in our translation.

Ah yeah, makes sense. I also choose to do it this way in
<auQwssHcQiM09SDd@wyuan.org>, for consistency with the English one.

Thanks!
