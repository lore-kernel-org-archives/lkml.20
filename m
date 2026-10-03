Received: from mta0.migadu.com (out-157.mta0.migadu.com [91.218.175.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9292641C6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002751; cv=none; b=arxPNNken8m3kSQwQfBm7dwYpl5a284fAssQuoQQmvIReLTdoelG93/KQv8Kg6NBy8HeAO+UEMCvBIy5ga79fuxsD20lyPspAoGCMg1MN5n3PA1a6Li63VJH6o0F+2drbHDX0wnOrlLRFk2GNQgpxlfALzO/VJc8VcKWWMHKuaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002751; c=relaxed/simple;
	bh=PqHA7PAh9JHMpXtkgXGlLykZuAEZzZGGNJLrwPYAJeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8TLH8Cytg8PEiPR2HTa43Yz2UGWhOM6dJFrh7G9sui/lmLS6NfsPWWmu9s1Vwkpb8J6QkX2etuDCM4KPrhDI6ld0apVjUrYUEVAPJApX3YebhMfNYQGtb1CwsBY8s65M6VqT0d+anY9BlWCKh/dbNEe3AcUyfoq2LY/EYKtSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=aqp5RxmX; arc=none smtp.client-ip=91.218.175.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="aqp5RxmX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PqHA7PAh9JHMpXtkgXGlLykZuAEZzZGGNJLrwPYAJeU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791002747; v=1; x=1791607547;
 b=aqp5RxmX6oNqsH8qpFXNaPWBbd4RTNevwTv98OPiw3ZjmLr3H0PInVOVRj4Y0rsG2UXb9OMg
 AySe/+6tE4x/MwFqGX3/sFEKfwadC9R3iPOfLOeqS93e44rRepz6fAQBU6qZLs5v82YAyJQwzHc
 FeWbVAQSNXhjzB/7R1dK2xKXrnwjvJNknPOk5V1WXl/EG5D+NGhZbQEBbnyuovvH9XN2WnmhpsY
 gxXtmZZ93ccdCLj4Bns+jH594+r17DR8BPYfMPBYyHzAubCc6B/bCcrkLFCItW1Ax/3L52PQQS0
 3whNvVFwFOIA9Widf53Dnh5HVeYENlc0zDZbSmO2wl3DQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de9461c6e3360cc2;
	Sat, 03 Oct 2026 04:45:47 +0000
X-Mizu-Trace-ID: de9461c6e3360cc2
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 12:45:38 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] docs/zh_TW: add a notice for translations not kept
 in sync
Message-ID: <asCIcsjSHdqF3oI-@wyuan.org>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
 <20260929131142.266819-2-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929131142.266819-2-chenyou910331@gmail.com>

On 2026-09-29 21:11:38 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> As agreed in the zh_TW scope discussion, translations that nobody keeps
> in sync with their English originals should say so in the file itself,
> rather than leave readers to find out.  Add the notice as a shared file
> included at the top of each such translation, the way
> disclaimer-zh_TW.rst already is.
> 
> The notice carries no :orphan: marker.  Included after
> disclaimer-zh_TW.rst it would not be at the start of the document, and
> Sphinx would render it as an empty "orphan" field; Sphinx does not warn
> about a file that is only ever included, so the marker is not needed.
> 
> Start with the two files in process/ that are not in sync.  process/ is
> the part of zh_TW that is kept current, but security-bugs.rst and
> debugging/gdb-kernel-debugging.rst only moved there with the recent
> relocations and have not been updated yet; they carry the notice until
> they are.  The rest of the tree follows in the next patch.
> 
> Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
> Link: https://lore.kernel.org/linux-doc/aqFPBQxq5asHzvtn@wyuan.org/
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Acked-by: Weijie Yuan <wy@wyuan.org>

> ---
>  .../zh_TW/process/debugging/gdb-kernel-debugging.rst        | 1 +
>  Documentation/translations/zh_TW/process/security-bugs.rst  | 1 +
>  Documentation/translations/zh_TW/unmaintained-zh_TW.rst     | 6 ++++++
>  3 files changed, 8 insertions(+)
>  create mode 100644 Documentation/translations/zh_TW/unmaintained-zh_TW.rst
> 
> diff --git a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
> index a9ca1156fea6..45f178c0bf59 100644
> --- a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
> +++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
> @@ -1,6 +1,7 @@
>  .. highlight:: none
>  
>  .. include:: ../../disclaimer-zh_TW.rst
> +.. include:: ../../unmaintained-zh_TW.rst
>  
>  :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
>  
> diff --git a/Documentation/translations/zh_TW/process/security-bugs.rst b/Documentation/translations/zh_TW/process/security-bugs.rst
> index 76a78746ca4e..783d7c77b5fa 100644
> --- a/Documentation/translations/zh_TW/process/security-bugs.rst
> +++ b/Documentation/translations/zh_TW/process/security-bugs.rst
> @@ -1,6 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
>  .. include:: ../disclaimer-zh_TW.rst
> +.. include:: ../unmaintained-zh_TW.rst
>  
>  :Original: :doc:`../../../process/security-bugs`
>  
> diff --git a/Documentation/translations/zh_TW/unmaintained-zh_TW.rst b/Documentation/translations/zh_TW/unmaintained-zh_TW.rst
> new file mode 100644
> index 000000000000..4b4eb63d749c
> --- /dev/null
> +++ b/Documentation/translations/zh_TW/unmaintained-zh_TW.rst
> @@ -0,0 +1,6 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. warning::
> +     本翻譯目前無人維護，沒有與英文原文保持同步，內容可能已經過時。如有
> +     出入，請以英文原文（見下方的Original欄位）為準。如果您願意協助更新本

So here means we still need the Original field.? ;)

> +     翻譯，歡迎將補丁提交給繁體中文文件的維護者（見MAINTAINERS檔案）。
