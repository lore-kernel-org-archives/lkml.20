Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B77FB67E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759576; cv=none; b=o3a49jF1ycyhj0cDPHUYaxzTs6sDhRNnfzr6PfP/6iNQiEyvyEzQgB9Te7TwrJna9YMPeI1DOBuuzBIDRSqqAX9SoJHE+tLmaueEjOzSlztkfWfc3MnDwjeHIxzs0A/F4/YdCNgQkOoqhDH+iPSXbVLaOc0ym1Dnm6H0kbBpYcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759576; c=relaxed/simple;
	bh=a0Bcu+lT36QX4vk+ppmH/K5l9MrLihLpvh9X6ygca7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eI/VuzQH09x9EAlIm5z+WbPsY0kHvk5P0wUh2202szAnyeLc41FWC7YD+0bGEOTarsQWfodq1CYx1jSitd4/PfZXflhRwKNyDCUI+Tw6l9DG6lTkm3GzND2t+S+Hlr6kqWptes58YB8kpW2KWbPMXAinZ+Ysqnd4dwO038pk6cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdEzqXEw; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdEzqXEw"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so4193597a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759575; x=1789364375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KRD5YcVDqWb/QziR/ykVQXiAyMnu27xu7XUdKE8PQd8=;
        b=PdEzqXEwRM/hAEaOCwHn256bf+PS6ABMieCtTu+fSepAvMQgPf2pQjeJKk2nnCZ20M
         FXiWzMmVn+Er2ZUDj4ecBNojNjUPY2RleJM/rxGd7VXWJm3XuiTm0yoVIQrhimrGD7ko
         WuEsu3tXeZEmkqADz+TlF8bv0hldU4iE2zNF2jwENaiyrOBWzCS7l+kVIO9qBpZ59/U5
         ArmyQIccPJ8Ro9djhjGpYMBDtwZ/Itf9Ugmi8d2HLlWlDzhKWkufs6TavOi2F3SrQhTZ
         UcNqbQmx4/Ip8i9M/Bsss2mH8tPMlzStYzlQDkXu3HM9Wo7NH69ROH5nDvDYXCE29fcu
         n/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759575; x=1789364375;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRD5YcVDqWb/QziR/ykVQXiAyMnu27xu7XUdKE8PQd8=;
        b=bGJdKFPexVOgvw1ycPRemA4WlwRHG5nG8DDvtOeYvJ6gmxYzNZcSV2IL2VWkaYCAXP
         r3IwIUW8GJrFdW13rXBXOeMh7UNBExmT6CCwI+7myYoppqbcPoY28x4ppMwXh9lM691g
         asry3BCDsWcAh6Atm6RPT9O01uRMZ5LAC7Q1OrHzu1bp/flSY+B/Qsn4zoqzWTCHfCR7
         w7+ZpgSjqMOjn2y25S9ZAtlKJ6IJq3IbsrKklTO7tqlyTsrphakS/VBSwI5/ZwKfwe9e
         8wKapPr0gzs3UgdpQ2mdePSnp2GRjehOK9yMVzQjcPJrkhjSS9gjsQh7Vf/A1zJw0JXD
         +J7A==
X-Forwarded-Encrypted: i=1; AKwUvBxHrvloQHRFhpg541t4vvt8bAlGpskaj0TAbGKgSVPk1VKIC9/geb/Xdngoi7wSfgW+jXkk6vMKvPZ5MVA=@vger.kernel.org
X-Gm-Message-State: AFuF++kE5g22BMNPWwhAoLsMkvRDKElXkQwtYJy5t/9gLC0ho1SVN0D7
	Aj5pkBKW/PHIjt5lzyMRgLagfuHqJjCBuJQI1eu0LHp4O9ZftHSKWBqv
X-Gm-Gg: AYBFou37vZEm1tudFUdH/kZCO79/7kb2Cm6INp6UEJdDHSxQsq83R+u6UDKdNmTd8cG
	hgBRn5b9SIOTIsLeHkwpmS28LLe7mPQdv/OwOGjMCV27BXsMBuBG4U8SifXYhk1kvAkRP6kNCv8
	aLjks6WnPADP4H2pOF8W4mqlbB6rjLZDL0rcNvWI42ZGOAgwEu1tdpG3GzGlUhuGAD0meaI5Yfk
	yGznydZAR/ON6CdhwZQUUAupobYvMeb7HxApV9C7253qq2EW29zoUAxSgoBled3J0FCv9L3IgnE
	pRigQPnC57M1XsKwGxF9+69ugGAMzrx9JhRobEQi5waeOOd2ox7ry04JP32qDh5lxx7Em5EY5eC
	0po2pv3gYZ6SVm+aTNQCxKQC+74YUu1HxMiU3JOo+IkfwCD/QBWoEDEGbfLMP+F+5fnuk0YYI0B
	DLl/XDCpi5GnhV5wAfYs7uM60HyXcIOYXTvuAx8dwfNVKsytnJKuZ4Ei7Sg9UaxsXOZFsFYs1oZ
	l30CX0dxjXe+1OA4JSCnkBqIw==
X-Received: by 2002:a17:90b:4c8b:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39b260f4180mr31653630a91.9.1788759574591;
        Sun, 06 Sep 2026 22:39:34 -0700 (PDT)
Received: from [192.168.2.166] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm25786766a91.12.2026.09.06.22.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:39:34 -0700 (PDT)
Message-ID: <15c96f0d-3b6e-4cd2-9d48-9b7a639cf3d5@gmail.com>
Date: Mon, 7 Sep 2026 13:39:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] docs/zh_CN: translate process/applying-patches.rst
 into Chinese
To: Weijie Yuan <wy@wyuan.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260817-apply-patches-v3-0-45e3bd2b1ccc@wyuan.org>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260817-apply-patches-v3-0-45e3bd2b1ccc@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, thanks!

On 2026/8/17 01:47, Weijie Yuan wrote:
> This series adds a Simplified Chinese translation of
> Documentation/process/applying-patches.rst.
> 
> The first patch adds the translation and includes it in the zh_CN process
> toctree.  Its :Original: field uses the original document path directly;
> no translation-specific reference label is introduced.
> 
> _Changes in v3_
> 
> The second patch updates existing zh_CN references to point to the new
> translation.  In ordinary paragraphs, the absolute Documentation/...rst
> path is used and is handled by automarkup.  The entry in process/howto.rst
> is a definition-list term, which automarkup does not process.  It therefore
> uses the named :doc: form as the minimal explicit-link exception, without
> reintroducing a cn_applying_patches label and using :ref:.
> 
> RFC:
> 
> I considered the two competing preferences for cross-references. Jon
> recommends using a plain absolute Documentation/...rst path, while
> another view (I found the discussion in 2021, so I added your email
> addresses, thanks.) is to avoid :doc: markup where automarkup can create
> the link automatically.  I follow both rules where they apply: the plain
> path is used in normal paragraphs.  However, this particular entry is a
> definition-list term, which automarkup does not process, so the plain
> path is rendered as text rather than a link.  The named :doc: form is
> therefore used only for this narrow exception, without adding a
> translation-specific label. (Seems to be a workaround)
> 
> I would welcome guidance on one stylistic point.  (Since I missed
> previous discussions)  The surrounding entries in this definition list
> use :ref:, while this new entry uses the named :doc: form because it
> links to a whole document without a translation-specific label. Does
> this look out of place here?  If so, I am happy to follow the preferred
> cross-reference style.
> 
> [Words are polished by LLM, but I think it's what I want to say]
> 
> Thanks!
> 
> Sorry Mauro, I don't know which address you'll prefer, so I add both.
> 
> ---
> Changes in v3:
> - Deal with the ref style, see above
> - Link to v2:https://patch.msgid.link/20260815-apply-patches-v2-0-3fdd873d31cc@wyuan.org
> 
> Changes in v2:
> - Merge first two patches into one.
> - Remove self-ref (.. _cn.rst) and changes ref style from 'ref' to
>    direct file name
> - Link to v1:https://patch.msgid.link/cover.1784289654.git.wy@wyuan.org
> 
> To: Mauro Carvalho Chehab<mchehab+huawei@kernel.org>
> To: Mauro Carvalho Chehab<mchehab@kernel.org>
> To: Nícolas F. R. A. Prado<nfraprado@collabora.com>
> To: Alex Shi<alexs@kernel.org>
> To: Yanteng Si<si.yanteng@linux.dev>
> To: Dongliang Mu<dzm91@hust.edu.cn>
> To: Jonathan Corbet<corbet@lwn.net>
> To: Shuah Khan<skhan@linuxfoundation.org>
> Cc:linux-doc@vger.kernel.org
> Cc:linux-kernel@vger.kernel.org
> 
> ---
> Weijie Yuan (2):
>        docs/zh_CN: add process/applying-patches Chinese translation
>        docs/zh_CN: link to Chinese applying-patches translation
> 
>   .../translations/zh_CN/admin-guide/README.rst      |   2 +-
>   .../zh_CN/process/applying-patches.rst             | 390 +++++++++++++++++++++
>   Documentation/translations/zh_CN/process/howto.rst |   2 +-
>   Documentation/translations/zh_CN/process/index.rst |   2 +-
>   4 files changed, 393 insertions(+), 3 deletions(-)
> 
> Range-diff versus v2:
> 
> 1:  596ec00ba7c5 = 1:  13da5addcb90 docs/zh_CN: add process/applying-patches Chinese translation
> 2:  b3a9c4893250 ! 2:  7c156c1d41b7 docs/zh_CN: link to Chinese applying-patches translation
>      @@ Documentation/translations/zh_CN/admin-guide/README.rst: Linux内核6.x版本 <h
>           并且希望跳转到6.0.3，那么在应用6.0.3补丁之前，必须首先撤销6.0.2补丁
>           （即patch -R）。更多关于这方面的内容，请阅读
>       -   :ref:`Documentation/process/applying-patches.rst <applying_patches>` 。
>      -+   :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <cn_applying_patches>` 。
>      ++   Documentation/translations/zh_CN/process/applying-patches.rst 。
>        
>           或者，脚本 patch-kernel 可以用来自动化这个过程。它能确定当前内核版本并
>           应用找到的所有补丁::
>      @@ Documentation/translations/zh_CN/process/howto.rst: Linux内核代码中包含
>            的内容，可以查看这些文档。
>        
>       -  :ref:`Documentation/process/applying-patches.rst <applying_patches>`
>      -+  :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <cn_applying_patches>`
>      ++  :doc:`Documentation/translations/zh_CN/process/applying-patches.rst <applying-patches>`
>            关于补丁是什么以及如何将它打在不同内核开发分支上的好介绍
>        
>        内核还拥有大量从代码自动生成或者从 ReStructuredText(ReST) 标记生成的文档，
> 
> ---
> base-commit: 1a0364f09c1311dad5ad1ccba7e169a412f6b547
> change-id: 20260815-apply-patches-601ad9b42f27
> 

