Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E71CAA6D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791001179; cv=none; b=KRz51j4JA4PSSA9eRvAB8LhTsxc1wYpL5v8O4h+2L9Sci+5ZYczE+x21XJk0r9HKPm3gKoyN85snBEKBlZiz7AbVwGz47+ZuLAWSwqWA+P7lB38R0YA+GQjyzw78wA/0MKusU8hESdbnXL/lgiaxIQTjuGFBXSTzWtCYvHyxgXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791001179; c=relaxed/simple;
	bh=DsplKi1Uiyu0yuMCqeZCzrK5XxacKXcgJmCBFbBifk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7Naa3H0gPLf6wUUkN+3zi1s5UGAUtQ8+FtwcqWuD/aY3kBn7uWva6U1tpMjdoa6MDRjanH2mcIzNNGGBmCy8eps3m3qmxCjm6cISI478+uaTuq6SgrtaGJWtSARwHAQy9H+zrFu2Ly4s+BtqpT+fOGit+9B0QAmZPgH3iFAHQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=khErUw62; arc=none smtp.client-ip=91.218.175.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="khErUw62"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DsplKi1Uiyu0yuMCqeZCzrK5XxacKXcgJmCBFbBifk0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791001174; v=1; x=1791605974;
 b=khErUw62ahv3aNr/gKeZWXiBn4Vp8Lgyp7nUoM9EOH/uZL/TzujKoYLPGIN/dH8SJ1dtV2u0
 TGbMpbPiVcs66oCXp5QRTI4mFTpoEjxy5N/N6nusglnU43bvLTQfJfhPScCyNTsTPYTItymBzP7
 GWcEEckfU8XNHHcrj580viBUFGXw6SJTmcehoKBjBAIJJc18ejCMC1yLsfQld4hK1JMZYsE5TB8
 lA4NzxRxSCiDako960Y45s5WsSG4zFzicfSfMfg30aTVPZoVJ85f1X/oYDBsgh22A3+OxDLsmKB
 ee78WJvmJTeeD/Fgd6xyqtZeVq0XQTBijY6swM4+uRZ0A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e06294bbecdb007b;
	Sat, 03 Oct 2026 04:19:34 +0000
X-Mizu-Trace-ID: e06294bbecdb007b
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 12:19:30 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] docs/zh_TW: move gdb-kernel-debugging to
 process/debugging/
Message-ID: <asCCUliodZDQs8dw@wyuan.org>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-4-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929131020.266120-4-chenyou910331@gmail.com>

On 2026-09-29 21:10:17 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> The English original moved from dev-tools/ to process/debugging/ in
> commit d5af79c05e93 ("Documentation: move dev-tools debugging files to
> process/debugging/"), but the translation stayed behind.
> checktransupdate.py locates the English original from the translation's
> path, so it currently reports:
> 
>   Cannot find the origin path for
>   Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
> 
> Move it to match the English layout, and fix the relative path of the
> disclaimer include, which is now one level deeper.  zh_TW has no
> process/debugging/ directory yet, so add an index.rst translated from
> the English one, listing the guides not translated yet under TODOList,
> and link it from process/index.rst in place of its TODOList entry.
> 
> The baseline needs a caveat.  The translation lacks
> commit 6b219431037b ("docs/scripts/gdb: add necessary make scripts_gdb
> step"), which went in before the move, but checktransupdate.py does not
> follow renames and cannot report a change made at the old path.  Use the
> move commit, the oldest baseline the tool can see, and record the
> missing change here instead.  The tool will list
> commit 09e1d93a421f ("scripts/gdb: update documentation for
> lx_per_cpu"), which already edited this translation, together with the
> one later change it really lacks, commit 7f7f468548ce ("Documentation:
> Provide hints on how to debug Python GDB scripts").
> 
> For the new index.rst the tool will also list
> commit a592a36e4937 ("Documentation: use a source-read extension for the
> index link boilerplate"); that change only removes the index-link
> boilerplate, which this translation does not carry.

I actually think the script is getting in the way a bit. Its output is
only meant to serve as a reference, not something that forces us to
constantly worry about how the script behaves. For example, when the
script cannot detect renames, wouldn't it be simpler to just update the
translation as usual? But anyway,

> update to commit d5af79c05e93 ("Documentation: move dev-tools debugging
> files to process/debugging/")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> ---
>  .../translations/zh_TW/dev-tools/index.rst    |  1 -
>  .../debugging}/gdb-kernel-debugging.rst       |  2 +-
>  .../zh_TW/process/debugging/index.rst         | 70 +++++++++++++++++++
>  .../translations/zh_TW/process/index.rst      |  2 +-
>  4 files changed, 72 insertions(+), 3 deletions(-)
>  rename Documentation/translations/zh_TW/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (99%)
>  create mode 100644 Documentation/translations/zh_TW/process/debugging/index.rst
> 
> diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Documentation/translations/zh_TW/dev-tools/index.rst
> index 915449762d1a..fafebd092a3d 100644
> --- a/Documentation/translations/zh_TW/dev-tools/index.rst
> +++ b/Documentation/translations/zh_TW/dev-tools/index.rst
> @@ -26,7 +26,6 @@ Documentation/translations/zh_TW/dev-tools/testing-overview.rst
>     sparse
>     gcov
>     kasan
> -   gdb-kernel-debugging
>  
>  Todolist:
>  
> diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
> similarity index 99%
> rename from Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
> rename to Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
> index 8faa87f26c6a..a9ca1156fea6 100644
> --- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
> +++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
> @@ -1,6 +1,6 @@
>  .. highlight:: none
>  
> -.. include:: ../disclaimer-zh_TW.rst
> +.. include:: ../../disclaimer-zh_TW.rst
>  
>  :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
>  
> diff --git a/Documentation/translations/zh_TW/process/debugging/index.rst b/Documentation/translations/zh_TW/process/debugging/index.rst
> new file mode 100644
> index 000000000000..4440aa6a97e2
> --- /dev/null
> +++ b/Documentation/translations/zh_TW/process/debugging/index.rst
> @@ -0,0 +1,70 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../../disclaimer-zh_TW.rst
> +
> +:Original: Documentation/process/debugging/index.rst
> +
> +============================
> +給Linux核心開發者的除錯建議
> +============================
> +
> +一般指南
> +--------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   gdb-kernel-debugging
> +
> +TODOList:
> +
> +* driver_development_debugging_guide
> +* kgdb
> +* userspace_debugging_guide
> +
> +特定子系統指南
> +--------------
> +
> +TODOList:
> +
> +* media_specific_debugging_guide
> +
> +一般除錯建議
> +============
> +
> +視問題而定，可用來追蹤問題、甚至用來確認問題是否真的存在的工具也各不相同。
> +
> +第一步，你必須先弄清楚要除錯的是哪一類問題。根據答案的不同，你的方法與
> +工具選擇也可能有所不同。
> +
> +我是否需要在存取受限的情況下除錯？
> +----------------------------------
> +
> +你對機器的存取是否受到限制，或是無法中斷正在進行的執行？
> +
> +在這種情況下，你的除錯能力取決於發行版所提供的核心內建的除錯支援。
> +Documentation/process/debugging/userspace_debugging_guide.rst 簡要介紹了在
> +這種情況下可用的各種除錯工具。在大多數情況下，你可以查看/boot目錄中的
> +設定檔，來確認你的核心具備哪些功能。
> +
> +我是否擁有系統的root存取權限？
> +------------------------------
> +
> +你能否輕易地替換有問題的模組，或安裝新的核心？
> +
> +若是如此，你可用的工具就多得多，相關工具請參見
> +Documentation/process/debugging/driver_development_debugging_guide.rst 。
> +
> +時序是否是影響因素？
> +--------------------
> +
> +重要的是弄清楚你要除錯的問題是穩定重現（也就是給定一組輸入時，總是得到
> +相同的錯誤輸出），還是時有時無。如果問題時有時無，可能有某種時序因素在
> +作用。如果在程式碼中插入延遲確實會改變其行為，那麼時序很可能就是其中一個
> +因素。
> +
> +當時序確實會改變程式碼的執行結果時，用簡單的printk()來除錯可能行不通；
> +類似的替代方案是使用trace_printk()，它會把除錯訊息記錄到追蹤檔案，而不是
> +核心日誌。
> +
> +**Copyright** ©2024 : Collabora
> diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
> index de99156324df..bd638264bbe4 100644
> --- a/Documentation/translations/zh_TW/process/index.rst
> +++ b/Documentation/translations/zh_TW/process/index.rst
> @@ -88,12 +88,12 @@ TODOList:
>  .. toctree::
>     :maxdepth: 1
>  
> +   debugging/index
>     security-bugs
>     embargoed-hardware-issues
>  
>  TODOList:
>  
> -* debugging/index
>  * handling-regressions
>  * threat-model
>  * cve
> -- 
> 2.43.0
> 
