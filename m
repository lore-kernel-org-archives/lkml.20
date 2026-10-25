Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792944721;
	b=wH4WndpvKbf9TI8nk6SaeexRhCiuVq9L8+PSr3PQYizpfD/ABJzsv22SSXE1Xw/5Da4T
	 HeCMeoA2DXLwjGH3u+WmjtZUy3+ZJ8cM/Ho3f0lMOsRFQvRcYfes1D118GNVVIhVk9U2J
	 DUUjzsTbUN7qAwNsOYoCFEOden6sbXoPtZ9przgCXrDE2hk2OoqbV4zm1h1qV0FGFDdYG
	 hVDxHhCFBBOgN2rsfu6lr0rGL8Egn3xJYqN8XSoKHQ3V0G1QJp/fbT32LeCqaQHSZRaVh
	 HAR/JAko+nN0QLYP5jJzUrSdmvGvBLmGyL6Ad/GsDR/51lt01nqSBqCBCXv/MKiP4IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792944721;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3qHYIACovtvOeJ4K2p7CfI3lM4K/KvTD7BAaFAqsnwI=;
	b=Ekg/qV15yGJfoCASjytDDa3BTdtarjvlzpe+GYGF8GNzysag89PYJjgxmi3u20xFsy52
	 ZETDh5i1mcBteSB7RxcIsmsugnSck+2JL2W8P0z1pfoJiG0plHpjV5IXOkmLG80ecwLdX
	 r6ueHkH0M0OLfunESc38pP/zDNWzqwluD36MWGNVD2CPeAMwmbdZuF0PTK0DQye7qG1eV
	 6vKPUYhhyQghGGrMY8rIZphZt7ffEj8BmW6LbH0zPyIgFTeVIMqRMYE0ZO5hMD7Jy6qTz
	 Po5qVX58z/+cM4i/Q5ip4golMpUerBe68oy7IWN8jbaXGbKYVwfVVj1QlVfYyi5K3Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=95.215.58.114
Received: from mta1.migadu.com (out-114.mta1.migadu.com [95.215.58.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBCD606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBCD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xWgLrq+Joj1M41FB4ngSQdiTkdUU+/22Ih161kTj9c8=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792944718; v=1; x=1793549518;
 b=HsHBleXZzLsyus6Bs33DyGWLABBfgnTTcXZQ3dd/rk2qybNYGdFooRyIhcOt023kcEgSjZZB
 yhxUp/+9ivjDTh/ZzzC0shpEoV1e7ZLjfHhARO9Ij3FznWsnSOvNKMZmwywg8D+B++/b84uQ/b+
 CeNK8HDR+UjtX8DLIxAvOMZi+XSjUeRinV8WZFU8nf6kkAjwOmenGukZ1968u8/UBC2TIkVcJZM
 h3umerajuulsw1W64+0/TJyVqm/gfrpE3mNHtxV4h1czYHOM7BnnieCQV/OzFrNcJbxtPW81AVK
 v+7keiK7sSPNJXeIMH5wTVeqAYwn2EUO9c/2uukhPJBiA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca94744a38bb403f;
	Sun, 25 Oct 2026 16:11:58 +0000
X-Mizu-Trace-ID: ca94744a38bb403f
X-Migadu-Flow: FLOW_OUT
Date: Mon, 26 Oct 2026 00:11:51 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: dzm91@hust.edu.cn, jani.nikula@linux.intel.com, alexs@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	si.yanteng@linux.dev, chenyou910331@gmail.com,
	federico.vaga@vaga.pv.it, akiyks@gmail.com,
	carlos.bilbao@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
Message-ID: <at4qR9ZsRJX9l07w@wyuan.org>
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com>
 <atQ_mXYNqs4tnDpW@wyuan.org>
 <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn>
 <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
 <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
 <CAMAsx6fk=k1aXT3gvyZ4k8hG9KN+YCmvEc42LGdmm3Y+p2J1_g@mail.gmail.com>
 <8ff98b43-248e-4568-a5fc-6f84f9cdbe33@hust.edu.cn>
 <CAMAsx6fha-ZKkiph+nG14hbNduGs=G3qRjHNUNxLSktTTQY+gA@mail.gmail.com>
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
In-Reply-To: <CAMAsx6fha-ZKkiph+nG14hbNduGs=G3qRjHNUNxLSktTTQY+gA@mail.gmail.com>

Daniel Pereira <danielmaraboo@gmail.com> writes:

> (Resending to the list: my previous reply went only to Dongliang.)
> 
> On Sun, Oct 25, 2026 at 11:22 +0800, Dongliang Mu wrote:
> > Good job. I will quickly verify them and send a patch to move them.
> 
> Thanks. To avoid overlap, could you confirm which languages your patch
> covers? I understand zh_CN, and that zh_TW is already handled by
> Chen-Yu's series. That leaves:
> 
> - sp_SP: process/magic-number.rst and wrappers/memory-barriers.rst;
> - the .txt files in ja_JP and ko_KR (stable_api_nonsense.txt and
> stable_kernel_rules.txt), which I think are for their maintainers
> to convert or drop.
> 
> > It seems the original English documentation moves fast. I would
> > write a script or skill to check this relationship maybe daily or
> > weekly.
> 
> A periodic check like that would be useful, especially once the guide
> states the path mirroring as a rule.
> 
> For v3 of the guide, this is what I plan, based on the discussion so
> far:
> 
> - state the path mirroring as a rule for translations of English
> documents, and exempt documents that exist only in a translation,
> such as a glossary or a language-specific how-to (Chen-Yu);
> - describe ":Original:" as optional, and not needed when the path
> mirrors the original, instead of showing it in the header example
> (Jani, Weijie, Dongliang);
> - drop the generic parts of the sections on writing documentation
> and sending patches, and link to doc-guide/sphinx.rst and
> process/submitting-patches.rst instead, keeping only the points
> specific to translations (Federico).

Thanks for your effort above, looks good to me in general.

> Federico, I did not see an answer to my last message about this last
> point. Is keeping those short translation-specific notes fine with you?

Yup, I agree with Federico that for general guidelines, new contributors
should refer to the more authoritative ones. (unless there are some
translation-specific parts needs to be stressed) This way, if these
authoritatice ones change, we don't need to bother to sync them.

However, contrary to this, I would like to know if it is necessary for
us to promote b4 a little bit more here. (b4 is already mentioned in
SubmittingPatches.)

I'm not sure how many times such situations have occurred: new
contributors send patches with duplicate title lines and messy threads,
making it difficult to search through them on lore archive; there was a
thread breakage due to a problem with their email server..

These are the problems that the new faces on the list are likely to
encounter, but B4 (b4 prep) can simplify this process for new
contributors. [example trimmed for brevity]

And yes, once these procedures are familiarized with, everyone can work
according to their own preferences. However, just like how Konstantin
said: "if you're just starting out, and you don't already have a
workflow, hopefully this(b4) gives a good workflow for you to try and
follow."

Comments are appreciated. Thanks!
