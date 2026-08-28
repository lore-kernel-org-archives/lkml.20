Received: from mta1.migadu.com (out-158.mta1.migadu.com [95.215.58.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9C73812C2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922578; cv=none; b=YgCiVUoiu3xWP2bKWCdIFAsSIwd0yVo7O/jUP5xKjMgqWDxIeWcBEtdNTw3DcJfAFnlMyw5iCenqARfyNwSpplPiWwoW9UGmODB58RydPWCvsi/RZrEFOb1BbpTnDxAXm/y/FjoGXeFMlXk6UYTZHcqsRYP/KK8GNQRWzL+t3m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922578; c=relaxed/simple;
	bh=7Ajbzjj2AKFat2xyqRunplCt/lLNL3Ud/x2dLApOItE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoLXo61CgxFO41Mlu6ocpQbLJcbaIjWPkrchPQTUvWpkrcMRB9fYicrHJTAjxN9JNiKYdxEk+pdtlPI2VvdJGPTQviepFw9jdeqJmI/hOh0BMbygIuHMntbaOV8uUoytORAm9hBwu2C3AFl4oTEr0wqATsl/i+bN9W1dWGAEicw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=nfaeTn28; arc=none smtp.client-ip=95.215.58.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="nfaeTn28"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7Ajbzjj2AKFat2xyqRunplCt/lLNL3Ud/x2dLApOItE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787922573; v=1; x=1788527373;
 b=nfaeTn28epLyF82T+JBS6+N5DSFlT8CjZoGQD7xyZbfxmfXh+BqH9mxjc6KhEvN1EEyTcQE/
 /KkvbHOixtbaL3Ssu+AF9nybtptcKuRDK05fo0gO3ScSE9WDM9wsrvHZy9M0+OUDteCEP0aLgwv
 CTxdDx94lwkUdSHV/1wxBg8DbewC8Iy+ZIvMYURyRXxyf7lVuw7acPfR//ucLn+RGYiAuJ8zwFu
 bD3jzJlB7mhtHdpjtcxohZvo7MO0jvDIvRWt6+IQgWeoiFF/7DUidsgfE3c+5diszzPcs0ZDma9
 0qY3nhnhi2fo3LZ41traJtQkaJbkfIQD7noY+d5mD856g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a4483ccbc7d78e00;
	Fri, 28 Aug 2026 13:09:33 +0000
X-Mizu-Trace-ID: a4483ccbc7d78e00
X-Migadu-Flow: FLOW_OUT
Date: Fri, 28 Aug 2026 21:09:23 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/patch-acceptance.rst
 translation
Message-ID: <apGIgyn-iJ534D9S@wyuan.org>
References: <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>

Hi Yukai,

On Fri, Aug 28, 2026 at 02:18:16PM +0800, Yukai Wu wrote:
> Update Documentation/arch/riscv/patch-acceptance.rst translation.
> 
> Update the translation through commit ed843ae947f8
> ("docs: move riscv under arch")
> 
> Signed-off-by: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
> ---
>  .../zh_CN/arch/riscv/patch-acceptance.rst     | 46 ++++++++++++++-----
>  1 file changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> index c8eb230ca8ee..a48e6e575a67 100644
> --- a/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> @@ -15,19 +15,41 @@ arch/riscv 开发者维护指南
>  
>  概述
>  ----
> -RISC-V指令集体系结构是公开开发的：
> +RISC-V 指令集体系结构是公开开发的：
>  正在进行的草案可供所有人查看和测试实现。新模块或者扩展草案可能会在开发过程中发
> -生更改---有时以不兼容的方式对以前的草案进行更改。这种灵活性可能会给RISC-V Linux
> -维护者带来挑战。Linux开发过程更喜欢经过良好检查和测试的代码，而不是试验代码。我
> -们希望推广同样的规则到即将被内核合并的RISC-V相关代码。
> +生更改 --- 有时以不兼容的方式对以前的草案进行更改。这种灵活性可能会给 RISC-V
> +Linux 维护者带来挑战。Linux 维护者不赞成频繁的变更，且 Linux 开发过程更喜欢经过
> +良好检查和测试的代码，而不是试验代码。我们希望推广同样的规则到即将被内核合并的
> +RISC-V 相关代码。

> +补丁跟踪系统
> +------------
> +
> +RISC-V 有一个补丁跟踪系统实例，可以在那里查看补丁的状态：

I suggest keeping the name "Patchwork" as is. Because we don't translate
it in most cases.

> +
> +  https://patchwork.kernel.org/project/linux-riscv/list/
> +
> +如果你的补丁不在默认视图中出现，那么 RISC-V 维护者很有可能已要求修改，或者希望
> +将其应用到另一个代码树上。
> +
> +自动化流程会在该补丁跟踪系统实例上运行，在每个补丁到达时立刻对其进行构建/测试。
> +自动化流程根据补丁是否被识别为修复，将其应用到 RISC-V `for-next` 和 `fixes` 分支
> +当前的 HEAD 上。如果均不适用，则会使用 RISC-V `master` 分支。补丁系列被应用到的具
> +体提交将标注在补丁跟踪系统上。任何检查未通过的补丁通常不会被应用，并且在大多数情
> +况下将需要重新提交。
>  
>  附加的提交检查单
>  ----------------
> -我们仅接受相关标准已经被RISC-V基金会标准为“已批准”或“已冻结”的扩展或模块的补丁。
> -（开发者当然可以维护自己的Linux内核树，其中包含所需代码扩展草案的代码。）

Original: "Frozen" or "Ratified" -- "已冻结"或"已批准"

But doen't matter much.

> -
> -此外，RISC-V规范允许爱好者创建自己的自定义扩展。这些自定义拓展不需要通过RISC-V
> -基金会的任何审核或批准。为了避免将爱好者一些特别的RISC-V拓展添加进内核代码带来
> -的维护复杂性和对性能的潜在影响，我们将只接受RISC-V基金会正式冻结或批准的的扩展

we'll only consider - 只考虑？

The change (accept -> consider) is in commit 936100d4507f
(Documentation: RISC-V: Allow patches for non-standard behavior)

Did you miss it?

> -补丁。（开发者当然可以维护自己的Linux内核树，其中包含他们想要的任何自定义扩展
> -的代码。）
> +我们仅接受针对新模块或扩展的补丁，前提是这些模块或扩展的规范被列为未来不太可能发
> +生不兼容的变更。对于来自 RISC-V 基金会的规范，这意味着“已批准”或“已冻结”，对于
> +UEFI 论坛的规范，这意味着已发布的 ECR。（开发者当然可以维护自己的 Linux 内核树，
> +其中包含他们所需的任何扩展草案的代码。）
> +
> +此外，RISC-V 规范允许实现者创建自己的自定义扩展。这些自定义扩展不需要通过 RISC-V
> +基金会的任何审核或批准流程。为了避免因添加实现者特定的 RISC-V 扩展带来的维护复杂
> +性和对性能的潜在影响，我们将只接受符合以下任一条件的扩展补丁：
> +
> +- 已由 RISC-V 基金会正式冻结或批准
> +- 已按照标准 Linux 惯例，在广泛可用的硬件中实现
> +
> +（实现者当然可以维护自己的 Linux 内核树，其中包含他们所需的任何自定义扩展的代码。）

- Reviews from community, better wait for the reply from maintainers.

Thanks.
