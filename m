Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241546;
	b=sUfdU1WkRTkGs9nDj86pLntz8GDGOUK6b8e4YSyPxe2+b45RRghVvef8ufuY5xsN/M4Z
	 ugUu+xVAfL6FBy0eGGY228lQohCbpjKa511eIXVzgMe2Xpvb5BH8ih5kXLFVh/ZkN/KHU
	 145+XtKbxv4Z8yeZVd9qUOn0483qqW8V2ii/GWCGqgSVCrRSaVpzyz+0xZy0oF2zcc84o
	 l0CCwoxIR0/s49JzqjhsVNCV066Zhr0eYpULBL1tkKVRnKwpW7j+W+ou2exGiQisRr4aW
	 iqfssoyjWL5vEvgg/1jrm2/+xMJdBRQ0QQ2IMfvrJsvBHTW7nbEV83wctppEVFMu2Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241546;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=h7JqRM/WAUMvknHLuK+rC4LpbPo9sRlW0z+hSyPDqtQ=;
	b=tt8L9D8zE7OksbDTWu6BjnDXshnqLyneKN7L7fQJl919JXGgy8lFhHuQd02uIdhz28j+
	 BHiA2/h/n9tDryolNWqaREmtWqADRfoLUiCjEoSnrCretC+tzZEradiRLr9MRIce2XGgC
	 vLoUi2nrOIiKSIrQ6awAHpctFcTe2+EiUbyM8ec0IfZVD9cnBZLKo2LkVmCf1W3V71uJ8
	 pVh37JIEB6AV+AAoaGzt46X0HBw2L+PVqgB9mY1Apg3IRazDpmtEnHme9shQDMyTykGSe
	 vHxctf+6Idw8HYHghzX/qD/LVnY7YR5B/x+ZkbgWpoxRLippYEbOvHHu7pnfi2xez/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Iqz04U4w;
	arc=none smtp.remote-ip=91.218.175.95
Received: from mta0.migadu.com (out-95.mta0.migadu.com [91.218.175.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CF606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD0CF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Iqz04U4w
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G4at0pYPBgFGyMAOQOR2PXetOVVmgTh29uZoFDV2iCw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794241542; v=1; x=1794846342;
 b=Iqz04U4w0oyKnuxpmq/NUvJQT11TRPzdTjI98UnOiD3RBhzQSr4+rKfSKrM+KwvYtrIj/3MK
 Di3lWe6b1lBv4xmMsV3zxhwYAbXvJxnmqomnBGZFj0ac14qEl9dunPfyhS2W899kyHkDIoxmM9u
 lnVWl95mrumwGybjIM2HosIvCN7bFtagw9Ls+lI2NLv7ZVQQDD5uvnEHcTA6hVnM7HPRaHXf9rx
 OiefME8Y9jqPrdUKCXdB4OMHoA6WOami1Tnuh0Jh3dHGld4cTxf6b1lhV4Cao8yVs0Jvkssf/On
 5Sho13pv2QMzWjDhtm1yO6xBsC0v0Jcnr9h9dG3CyPWcA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9ca96bdb019e8efb;
	Mon, 09 Nov 2026 16:25:33 +0000
X-Mizu-Trace-ID: 9ca96bdb019e8efb
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 00:25:25 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] docs/zh_TW: process: add translations of 13
 documents
Message-ID: <avHz9XbEDqHatA85@wyuan.org>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
 <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
 <bab86e6c-bbda-4ad0-bd88-5ace76946eb0@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bab86e6c-bbda-4ad0-bd88-5ace76946eb0@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> On 11/7/26 8:44 PM, Dongliang Mu wrote:
> > 
> > On 11/6/26 7:35 PM, Chen-Yu Yeh wrote:
> > > I previously promised Jon that if no contributors stepped forward
> > > within two months, the maintainers would have to produce some results
> > > ourselves.
> > > 
> > > This series adds zh_TW translations for 13 process/ documents that had
> > > no Traditional Chinese version, and moves each one from the TODOList
> > > into the toctree of process/index.rst.
> 
> Hi Weijie and Chen-Yu,
> 
> I´m also working on updating the zh_CN translations. My plan is to first
> resolve all references using |:ref:| tags or direct document paths.

Very much appreciated to hear that!

> I´ll proceed as follows:
> 
> 1. Update references directly for content already translated and merged
>    into the tree.

Definitely agreed.

> 2. Add missing translations where referenced content has none, then
>    update the corresponding references.

Yup, for zh_CN I 100% support, because its current coverage area is
already quite extensive. And it's as exciting as adding the final piece
to a jigsaw puzzle.

But for zh_TW, The current coverage rate is low, compared with zh_CN.
Therefore I'm worried that extending to multiple directories in an
impractical attempt to achieve self-reference might lead to subsequent
maintenance problems, just like the situation before Chen-Yu took over.

(However, we need to confirm which directory contains the referenced
English files we intend to expand. If after careful consideration, we
decide to include them, of course we can do so.)

So, just like my previous reply to Chen-Yu, I suggest that we first
complete the existing goals, and then carefully consider and discuss the
issue of expansion.

> After the current translation are self-referenced, I will continue to add
> more translation. In the current stage, it would be more important to fix
> all severe issues in the translation other than adding more translation. To
> be honest, it is easier to leverage LLM to add more translation.

Yes.

> This is just my approach for enriching the zh_CN translation work - I´m not
> suggesting you need to follow it.

Very much appreciated, thanks for your suggestion!
