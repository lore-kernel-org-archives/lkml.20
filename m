Received: from mta1.migadu.com (out-107.mta1.migadu.com [95.215.58.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BFA2EBDE9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792294823; cv=none; b=L7owUQRDDq4JBWMjgYS+gG4yY5tvZEstzvtk2wpWzCmY3vgYrHWNBoY1FeGGVHQXKlA5Fo+qQq9mi+LMWeyiU+p+EcPs0WoXD5Ax7VpwBj0hUbA7/BWevqvOYWH2zqRPM+ddAMssMoD6ft/vY+7RponbEiTtdGRt7+2VU2lKcuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792294823; c=relaxed/simple;
	bh=6O+om/N5nsSX+OZd+gHsZmbTWkyBWjGNtLKULO0LteU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4GZ77sZ8GNVgx4Cf224Xoog5ioraZmQ65NVvQvxhrP8TOUUYcbx6Ugk6D0hf7EvHM9fZl4UtHV1zsxNC/wuTs2ibZZhCyZsxnD42ERcVr1SFFiZKc50Fw6+vBivhFVj/mZn0gqnyaxX1VtJwl4SQrlL78iN1KQoPMS0o/bbrHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=oFpUEel4; arc=none smtp.client-ip=95.215.58.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="oFpUEel4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6O+om/N5nsSX+OZd+gHsZmbTWkyBWjGNtLKULO0LteU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792294816; v=1; x=1792899616;
 b=oFpUEel4qGe7ViwHLLCYmlxgRMlDQf+fbbYA/Uj4DoT+VW9Q6hVM6wZ6FbWig8vy8lU1DGow
 zMjB3eDbzd2699oeCsGi18EFD176yH6oNhDT+UpopPZQVZWUFtOeCGhwLL658hRktyGbJyroRB1
 l8VKmmeQnuw7LMuX65jUocuLhlGNa69qByl30l5aScCjeGsgz+9UkEtGu8J0H4iVKW60iLHsR+R
 aYGOWuZ3p+gIbvd/rRh9vjZOmouK8F8sx/r+WuapzgpKVt8Dh2fHhp6Sue4wQTU12EXaTF0Tuqm
 AnnwWajt+Odbh55H/65i8rGzsDIl1unhggyDwBUIeHygw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e0b0a0b21c66541c;
	Sun, 18 Oct 2026 03:40:14 +0000
X-Mizu-Trace-ID: e0b0a0b21c66541c
X-Migadu-Flow: FLOW_OUT
Date: Sun, 18 Oct 2026 11:40:09 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
Message-ID: <atQ_mXYNqs4tnDpW@wyuan.org>
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015125644.12908-2-danielmaraboo@gmail.com>

+cc Jani Nikula

On 2026-10-15 09:56:42 -0300, Daniel Pereira <danielmaraboo@gmail.com> wrote:

> The documentation has seven translations, but nothing in the English
> documentation explains how to contribute to them.  The only guide that
> exists, Documentation/translations/zh_CN/how-to.rst, is written in
> Chinese and covers the zh_CN translation only.
> 
> As a result, the same problems come up over and over in the review of
> translation patches: labels and citations copied from the original,
> which are global in Sphinx and collide with the English ones; partial
> builds with SPHINXDIRS that hide those collisions; lines over 80
> columns; translations not added to any toctree; missing commit
> descriptions, tags separated by blank lines, HTML email rejected by the
> lists, and the documentation maintainer left out of the recipients.
> 
> Add Documentation/doc-guide/translations.rst, a guide that covers the
> whole workflow of a translation: choosing what to translate, the layout
> of a translated document (path, header, labels, citations,
> cross-references, what must not be translated), translation quality and
> terminology, adding the document to the build, checking it with a full
> htmldocs build, checkpatch and checktransupdate.py, preparing and
> sending the patch, the review process, keeping translations up to date
> and starting a new translation.  The commit message format it suggests
> is the one already recognized by tools/docs/checktransupdate.py.
> 
> Link the guide from the doc-guide index and from the translations
> index.
> 
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
> Changes in v2:
> - Drop the Assisted-by references from the AI tools section, the tags
>   example and the checklist (Weijie Yuan).
> - Use a plain path in the ":Original:" example and drop ":Translator:"
>   from it (Weijie Yuan).
> 
> v1: https://lore.kernel.org/linux-doc/20261013003702.5824-2-danielmaraboo@gmail.com/
> 
>  Documentation/doc-guide/index.rst        |   1 +
>  Documentation/doc-guide/translations.rst | 694 +++++++++++++++++++++++
>  Documentation/translations/index.rst     |   3 +
>  3 files changed, 698 insertions(+)
>  create mode 100644 Documentation/doc-guide/translations.rst

[...]

> +Anatomy of a translated document
> +================================
> +
> +Location and file name
> +----------------------
> +
> +A translation mirrors the path of its original under the language
> +directory, and keeps the same file name::
> +
> +  Documentation/process/howto.rst
> +  Documentation/translations/<lang>/process/howto.rst
> +
> +Do not translate file or directory names.  The documentation build uses
> +this mapping to add, at the top of every page, links to the same page in
> +the other languages; it only works if the paths match.
> +
> +The file header
> +---------------
> +
> +Start the file with the same SPDX license identifier as the original.
> +Most translations then indicate, in some form, which document was
> +translated and include the language's disclaimer.  For example, the
> +Italian translation uses::
> +
> +  .. include:: ../disclaimer-ita.rst
> +
> +  :Original: Documentation/core-api/symbol-namespaces.rst
> +
> +A plain path is enough in the ``:Original:`` field: the documentation
> +build turns ``Documentation/...`` paths into links automatically.

Oh, btw. There's a comment about ":Original:" from Jani [1]:

| I'm wondering, are these :Original: fields useful anymore since the
| translations extension adds the button to switch between languages?
| 
| The pretty much hard-coded expectation is that the English version at
| path/to/foo.rst is the original, and its translations are at
| translations/xx_YY/path/to/foo.rst.
| 
| I.e. neither the HTML nor the RST benefit from it, and it's just
| repetition.

Perhaps we could have a bit of discussion here?

Thanks.

[1] https://lore.kernel.org/linux-doc/c719c6756f345c6c39db483654578ef09de1948f@intel.com/

