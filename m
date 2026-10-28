Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174679;
	b=oZDgyg16QSGzgNRCK/VuLMoO3Qk9DfQbGh6L63a/P7Y+gBtfOBY8Py0DlkR9JyCRK/id
	 b0Za5VraGR8FJp/UGSMV5CRVRf3gDS9/H3IKcpA+u4kNVC/5JGTCX1NKh2gTLFzwl57dc
	 SEC2CX4dDnG9AnhfEFXYaLCGxBRT4MU8y9eG7FfELlGlIYf3mr00EpFgNFQvqKINtdVDX
	 epWxiObdt1mL8ThcAtcWrD7nAATSNa54eECUkHYfM0EZNDhlHCStF2ULllk+BDzNboTTM
	 5iUS5ZdwkiR4WCb78UK+CLhiVt7ZduFQoO4Zkdq+1ZERopuhzYkQeMzXvVIXxnZA5BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174679;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=r40AGc2HV5Phw46UNoMLkUuwsJc6KtksK+EPVQ4gjzA=;
	b=Ikz25XBVPSL91lLyuGQ5ke+EsyMiICLTDxNp7qaBOY5qiZu9ZtRWKfL9NT7X+bd2rnAs
	 qSuG/LRnvE/U/0WkLla/FrdwskL5cW8wkUHqUKdLmsaM58hCcgGdxbc9TlheRla0bKf7Y
	 F33R1Ib5nTW6aKvefjSNqcS8gtJ63TLI5X2kVAjxzRX5m+UJnY7vDKCjHC4lg+goSgqrq
	 DbZxNoRtfkoQ7KuTAPIV0dPbrUd3W1W/888/mgZv7LFZ9+DCbhP1f0Z0a3yO81sCkK2vf
	 yTVaHzK+j3o7lFgi3zpcPfY9txO3BeZHe+dZU6TbVZjbitM7fRN/RoHlDjj5z5pLiUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="dr/OfbPA";
	arc=none smtp.remote-ip=91.218.175.174
Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B54606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B54606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=dr/OfbPA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u1Y8KdRrWAv9eIpRyra/9RFWCZ/RbIdOt3vtgFGgx2Y=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793174676; v=1; x=1793779476;
 b=dr/OfbPAQ8JFAyMgt4wx8iOppKu8QXoQYok1zfHQKnC2KJdPHT98zZezeTh85WitWMNPcRHl
 1zrVNBu4LGxfyQZS8Lolj9Z+bcqyTJQP1ORI7Lpgy4Tx9ZOo0nzFFxTJGeZNAuOq7gZ4iKEqX54
 MSb/7x5IETI9Casb/kCwXkIZL8Cv4tkMtCh6SUwcoH9FC/7kUCkM6OEnkDrAX0yr61YY8r1o/B/
 4Z5tEO/tErqD9uYYwrhT8C+LgLgWClA3O1S/hI4Au8U80L24tpOgiLwy2U2zxryD0Uocyb7Q3L8
 K4QeybYK74FAnUoXCZrntnJNjUtAPe+hdPplAzIMTy5Zg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 935c37095ecf4d61;
	Wed, 28 Oct 2026 08:04:36 +0000
X-Mizu-Trace-ID: 935c37095ecf4d61
X-Migadu-Flow: FLOW_OUT
Date: Wed, 28 Oct 2026 16:04:27 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] docs/zh_CN: reorganize process debugging guides
Message-ID: <auGsi1N37Ptp7Kqg@wyuan.org>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
 <20261028034134.4144660-5-dzm91@hust.edu.cn>
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
In-Reply-To: <20261028034134.4144660-5-dzm91@hust.edu.cn>

On Wed, Oct 28, 2026 at 11:41:29AM +0800, Dongliang Mu wrote:
> Move the GDB debugging translation into process/debugging. Update the
> process and development tools indexes to match the current English
> structure.
> 
> Synchronize the process index with upstream revision a03ef333fbd6.
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  .../translations/zh_CN/dev-tools/index.rst    |  37 +++---
>  .../debugging}/gdb-kernel-debugging.rst       |  15 ++-
>  .../zh_CN/process/debugging/index.rst         |  62 ++++++++++
>  .../translations/zh_CN/process/index.rst      | 111 +++++++++++-------
>  4 files changed, 160 insertions(+), 65 deletions(-)
>  rename Documentation/translations/zh_CN/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (93%)
>  create mode 100644 Documentation/translations/zh_CN/process/debugging/index.rst

[...]

>  ============
>  内核开发工具
>  ============
>  
> -本文档是有关内核开发工具文档的合集。
> -目前这些文档已经整理在一起，不需要再花费额外的精力。
> -欢迎任何补丁。
> +本文档收集了用于内核开发的工具文档。目前这些文档只是汇集在一起，尚未充分整理成一份连贯的指南；欢迎提交补丁！
>  
> -有关测试专用工具的简要概述，参见
> -Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> +测试工具的简要概述见 ``Documentation/dev-tools/testing-overview.rst``。
> +
> +调试专用工具见 ``Documentation/process/debugging/index.rst``。
>  
>  .. toctree::
>     :caption: 目录
> @@ -21,21 +19,26 @@ Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>     testing-overview
>     sparse
>     kcov
> -   kcsan
> -   kmsan
>     gcov
>     kasan
> +   kmsan
>     ubsan
>     kmemleak
> -   gdb-kernel-debugging
> +   kcsan
>  
>  Todolist:
>  
> - - checkpatch
> - - coccinelle
> - - kfence
> - - kgdb
> - - kselftest
> - - kunit/index
> - - ktap
> - - checkuapi
> +* checkpatch
> +* clang-format
> +* coccinelle
> +* context-analysis
> +* lkmm/index
> +* kfence
> +* kselftest
> +* kunit/index
> +* ktap
> +* checkuapi
> +* gpio-sloppy-logic-analyzer
> +* autofdo
> +* propeller
> +* container

+ cc Chen-Yu

My b4 review agent scanner says..

| OpenAI Codex <codex@openai.com>:
| 
| The move leaves Documentation/translations/zh_TW/admin-guide/README.rst
| (line 289) pointing readers to the deleted
| Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst.
| Please update that reference too, either to the new zh_CN path or to the
| existing zh_TW/process/debugging/gdb-kernel-debugging.rst translation,
| so readers can still locate the debugging guide.

Seems to be a good finding :-)

Thanks.
