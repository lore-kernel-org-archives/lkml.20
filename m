Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101053;
	b=tzSP9Xk3Xyub6AlhPv9+hzAYhsme87vdGy1/PgnjMtU2yilUe26w8poOF+bkUBeNc3dQ
	 jP76NkMeY6VOePfyCVK6+rNJNWrKKICKTF6ad4OPVypsXjkADz+KVdJO+geWyJwFjIxk5
	 uGl3pT8F4bq8Jqiws/0NUzGixwuvho6G/NT+VBY5Z4BQ1pbOpTIw4+3XeETATNClyNvpm
	 5qylzBwkjGRYBLs4lCPd4XkEP7W2fEn5vW/eshBsVwu0H+JyvlGJ90Vl3yoxq/FMR297k
	 7c8yi0NPkDMBcKDwC19fZqlyUd5x0vtPMVHRwWohcS3/jh8tDLCfnrK4osYHbW3geNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101053;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=fn5ThZiF6ft5mX8IvfFLPlbW1jtEJri8lE0VlMGkxOQ=;
	b=ipFd3flw9N7ECrtm/S2/AWRgvpMBAogtn1HFmAjtOaYv5k/uDLBrP/wqHlLMR7uDUXQ9
	 ryS5OUuEVMwaxwq9fesIlxTajXm9oXXNcDyZHGTy6Kh2Shp6Rp0YVIXik/dLYBloymm6N
	 aGcOzQ0JN24D8nTUXMXNDHjvqW0QmMNzKADw4SSOKreURm/gUEoquxL1VsV4FMFkbdXDG
	 iCgaKXInBF4ZzBXk0e6unccvMYWwvWztxWqD/WYfSRsW8BraQWZcnxcJnk0oROkhXmWFF
	 TJ7UuDxdvw46k24cHuBwQMbGdfftbHK4VI/qh8C0MCQXtPHfJmQzReJr9iw/55wQhmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=pICaod68;
	arc=none smtp.remote-ip=91.218.175.41
Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DB0606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2DB0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=pICaod68
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1MaGHK86bjq0DWIARKF4RMLr+S8+S1AD+k2k65hcz9k=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793101050; v=1; x=1793705850;
 b=pICaod68HfVfX8i54WH1wJjjOzPJbfFCM5xHdCmFHTsmj2BBWeWPijNfuELJaYbY19ZhD+iX
 j/Ac7YxZEA7i8n58Q2Z5SlfTEpjYrxFw4AvwNzP/n+bjnvNLx1P2EkZyFOAkTaGyZkcT8xZJg9S
 F+e4ghOYzI+Wr4P2vcqyepBk9kfYKq8Fwt5+AmHsbqzk4eyrPfziRtx+ebFtv8BMukVQZSDAr0c
 hIfT2vNjCsisE8AbnUxchU9oDQuH2hELldmWrv2ClVUcguo3kQeApDdo8g54Iv+z9Fem2Q9TuiL
 qY6rRIird5nKzvxRfKuQMrRcNuPhS4ufZHJMhg5k+rh3Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 816eb86f856db832;
	Tue, 27 Oct 2026 11:37:29 +0000
X-Mizu-Trace-ID: 816eb86f856db832
X-Migadu-Flow: FLOW_OUT
Date: Tue, 27 Oct 2026 19:37:25 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: Re: [PATCH 2/9] docs/zh_CN: update admin-guide/README.rst translation
Message-ID: <auCM9YrxbpXvdRv9@wyuan.org>
References: <20261027102552.3801595-1-dzm91@hust.edu.cn>
 <20261027102552.3801595-3-dzm91@hust.edu.cn>
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
In-Reply-To: <20261027102552.3801595-3-dzm91@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> update Documentation/admin-guide/README.rst Chinese translation
> 
> Refresh the kernel installation guidance and correct the defconfig and
> LSMOD descriptions. Add a label to the translated applying-patches guide
> so the README can link to it.
> 
> Update the translation through commit 8913632998fc
> ("Documentation: Fix typos and grammatical errors")
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  .../translations/zh_CN/admin-guide/README.rst | 89 +++++++++++--------
>  .../zh_CN/process/applying-patches.rst        |  2 +
>  2 files changed, 53 insertions(+), 38 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
> index ee6dd3782f4a..050f671f8acb 100644
> --- a/Documentation/translations/zh_CN/admin-guide/README.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/README.rst
> @@ -1,11 +1,12 @@
>  .. include:: ../disclaimer-zh_CN.rst
>  
> -:Original: Documentation/admin-guide/README.rst
>  
>  :译者:
>  
>   吴想成 Wu XiangCheng <bobwxc@email.cn>
>  
> +.. _readme_zh:
> +

Hi Dongliang, good evening ;-)

I remember that Jon emphasized that top-level labels should not be
added in this thread:

  https://lore.kernel.org/linux-doc/87tsqytxrn.fsf@trenco.lwn.net/

And I remembered that my patch (apply-patches.rst) was rendered
correctly just using a plain path. (so I didn't add that label)
But I'll check it again now.

Also, v3 of this series is pending, if I remember correctly. In general
I think it's not bad. So feel free to take a look when having spare
time.

v3: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/

Therefore +cc Jiandong.

Thanks!
