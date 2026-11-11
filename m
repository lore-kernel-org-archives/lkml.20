Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407543;
	b=HFnr5l0OpntYDQbcwep7LAswdQgD6EBCww2LucaWYRik4dF4x2te16r8ERKkKIUFofHK
	 ZNEA26fxIJ0BpgL+7Vr+zbz3Wp0xqyYwg387U2KPoMtQPUX/92237AZAl5yBcIBRyySxY
	 cV1ZGVlOnne6+n9OtVYNCBYHjrYknANuAS1w3R5rmllKDhQI355cW8KNAeTaQXqs95ggo
	 jM5kbHwcwu4HoxVr1sCBO3esyrj6AXsidTMXFIW+sbDaNuwPlLVrTAedI7TrlMAhtPGRd
	 WdI9dV7b6f0TAWiPa+nBi12bFbspAGv7GERHw2kHRkDmEHrJoNftLih/zSRebv0H0pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407543;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=yw39txjshF04QxM2ZUCzatgd1dstHV7RQAXlNYztymc=;
	b=lCt1rYNI+uOg5+NAzXRK/deDcwoV+PuxCLiJUR4d9EmOA3hTSa/5fHHe5j2YioGlm5ST
	 rWAsMXtMH4qLy919x2/GZCUOKujq6fyTydhP0dJ/FkbQvV+vz6cYpUqs8W1wCZOma9XCu
	 QwjJfq9eZTkeG5YBP5VeWukOorF955LqPf5RBEyqXhR3VAO5tfIJBbBZ4KQsh6egXXKqW
	 Za6Mrw5U/0ZQBIQ8ymyck6IoM5Yy5l5hjiBGudbz1rhpCuPlFQ7HUw6iL9XmlT6m7ht60
	 FAjS0ZlvN+xEpuH9xYmiC7F1h6acEte1iSveLnyg7HHwAknGrVOwGUzaBYYvcUysmSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=KyauV0wn;
	arc=none smtp.remote-ip=95.215.58.223
Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8605C60A260C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8605C60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=KyauV0wn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cfDolrEDxRMXmTVkQgq0uF0qRxhtqOMDdRP/AhirgHg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794407540; v=1; x=1795012340;
 b=KyauV0wndCdlNa7fgWaYNiYenYRFCCWqm/UcxtnL0bUAljeHkGXDCcJisGyYs9//aSoQiX2X
 wyLreJWe0LMtB0acFf63+xTnIn+Zl0hMoUOdgnWGMZkUFZkzQ8NhlKQILraM7jB+Jsl8cjPsbWj
 URVVHe0Ev6r1KG29XQe+RmMtSd5zl635elNzuNNAijQNHdPCvv0m624qHjHV+0qRJLinmRyDqak
 4jbi7WaoS9V1Om1XkLloadwBFiMB0WBucboJx1YLBC/hDv+597DDLly8OSd3oWFi58YEVWS1iNP
 erugsFtoaznFXZxPEXWRu896s0v4YoynfhCX704s916BA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dacb061bc7a84b96;
	Wed, 11 Nov 2026 14:32:20 +0000
X-Mizu-Trace-ID: dacb061bc7a84b96
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 22:32:13 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/25] docs/zh_TW: process: sync 2.Process.rst with the
 English original
Message-ID: <avR8baubOL7Aoeh9@wyuan.org>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-3-chenyou910331@gmail.com>
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
In-Reply-To: <20261106113142.706783-3-chenyou910331@gmail.com>

On Fri, Nov 06, 2026 at 07:31:17PM +0800, Chen-Yu Yeh wrote:
> The last update claimed to follow commit 46298375477b ("linux-next:
> update maintainer info."), but a section-by-section comparison against
> the current English text shows it never picked up several earlier and
> later changes.  Bring it in line with the full current original:
> 
> - add the missing sentence that no upcoming release has known plans
>   for long-term support
> - rewrite the top-posting hint to recommend interleaved replies and
>   link to the corresponding section of submitting-patches.rst
> - capitalize Git and Quilt consistently, and replace "他或她" with a
>   gender-neutral wording
> - fix the 5.2.1 date in the 5.2 table, the Mercurial and Quilt URLs,
>   the LWN URL and the drivers/staging/ path
> - keep Andrew Morton's quote verbatim in its literal block and add the
>   translation after it
> - retranslate sentences whose meaning had drifted (delaying the final
>   release, "when the process works", the TODO file, distributors, how
>   well the process works without tools, bringing in-house developers up
>   to speed, linux-next as an expected snapshot)
> - fix leftover mainland terms and conversion artifacts (內核, 視頻,
>   搜索, 回復, 被髮布, 一箇)
> - expand tabs in the tables and literal blocks
> 
> update to commit fdd100ee60a0 ("docs: process: use gender-neutral
> pronouns")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Looks good for all the wordings.

But a few points.. See below.

> ---
>  .../translations/zh_TW/process/2.Process.rst  | 176 +++++++++---------
>  1 file changed, 93 insertions(+), 83 deletions(-)
> 
> diff --git a/Documentation/translations/zh_TW/process/2.Process.rst b/Documentation/translations/zh_TW/process/2.Process.rst
> index cf9bd1b1444a..72a0cc1f7652 100644
> --- a/Documentation/translations/zh_TW/process/2.Process.rst
> +++ b/Documentation/translations/zh_TW/process/2.Process.rst
> @@ -29,8 +29,8 @@ Linux核心使用一種鬆散的、基於時間的滾動發布開發模式。每
>         認為足夠大時才會遞增9（例如，Linux 5.0是繼Linux 4.20之後發布的）。
>  
>  對於每個版本的補丁合併，遵循一個相對簡單的規則。在每個開發週期的開頭，“合併
> -視窗”被開啟。這時，被認為足夠穩定（並且被開發社群接受）的程式碼被合併到主線內
> -核中。在這段時間內，新開發週期的大部分變更（以及所有主要變更）將以接近每天
> +視窗”被開啟。這時，被認為足夠穩定（並且被開發社群接受）的程式碼被合併到主線核
> +心中。在這段時間內，新開發週期的大部分變更（以及所有主要變更）將以接近每天
>  1000次變更（“補丁”或“變更集”）的速度合併。
>  
>  （順便說一句，值得注意的是，合併視窗期間整合的更改並不是憑空產生的；它們是經
> @@ -41,7 +41,7 @@ Linux核心使用一種鬆散的、基於時間的滾動發布開發模式。每
>  將被稱為9.x-rc1。-rc1 版本是一個信號，表示合併新特性的時間已經過去，穩定下一
>  個核心的時間已經到來。
>  
> -在接下來的6到10周內，只有修復問題的補丁才應該提交給主線。有時會允許更大的
> +在接下來的6到10週內，只有修復問題的補丁才應該提交給主線。有時會允許更大的
>  更改，但這種情況很少發生；試圖在合併視窗外合併新功能的開發人員往往受不到
>  友好的接待。一般來說，如果您錯過了給定特性的合併視窗，最好的做法是等待下一
>  個開發週期。（偶爾會對未支援硬體的驅動程式進行例外；如果它們不改變已有程式碼，
> @@ -53,60 +53,63 @@ Linux核心使用一種鬆散的、基於時間的滾動發布開發模式。每
>  
>  例如，這裡是5.4的開發週期進行情況（2019年）:
>  
> -	==============  ==============================
> -	九月 15         5.3 穩定版發布
> -	九月 30         5.4-rc1 合併視窗關閉
> -	十月 6          5.4-rc2
> -	十月 13         5.4-rc3
> -	十月 20         5.4-rc4
> -	十月 27         5.4-rc5
> -	十一月 3        5.4-rc6
> -	十一月 10       5.4-rc7
> -	十一月 17       5.4-rc8
> -	十一月 24       5.4 穩定版發布
> -	==============  ==============================
> +        ==============  ===============================
> +        九月 15         5.3 穩定版發布
> +        九月 30         5.4-rc1 合併視窗關閉
> +        十月 6          5.4-rc2
> +        十月 13         5.4-rc3
> +        十月 20         5.4-rc4
> +        十月 27         5.4-rc5
> +        十一月 3        5.4-rc6
> +        十一月 10       5.4-rc7
> +        十一月 17       5.4-rc8
> +        十一月 24       5.4 穩定版發布
> +        ==============  ===============================

The Enlish version uses tab here, not space.

Is this a big deal that requires a reroll?

Nice catch btw.

And..

>  開發人員如何決定何時結束開發週期並建立穩定版本？最重要的指標是以前版本的
>  迴歸列表。不歡迎出現任何錯誤，但是那些破壞了以前能工作的系統的錯誤被認為是
>  特別嚴重的。因此，導致迴歸的補丁是不受歡迎的，很可能在穩定期內刪除。
>  
>  開發人員的目標是在穩定發布之前修復所有已知的迴歸。在現實世界中，這種完美是
> -很難實作的；在這種規模的專案中，變數太多了。需要說明的是，延遲最終版本只會
> +很難實作的；在這種規模的專案中，變數太多了。到了某個時候，再延遲最終版本只會
>  使問題變得更糟；等待下一個合併視窗的更改將變多，導致下次出現更多的迴歸錯誤。
>  因此，大多數核心版本都有一些已知的迴歸錯誤，不過，希望沒有一個是嚴重的。
>  
>  一旦一個穩定的版本發布，它的持續維護工作就被移交給“穩定團隊”，目前由Greg
>  Kroah-Hartman和Sasha Levin組成。穩定團隊將使用9.x.y編號方案不定期地發布穩
> -定版本的更新。要合入更新版本，補丁必須（1）修復一個重要的缺陷，且（2）已經
> -合併到下一個開發版本主線中。核心通常會在其初始版本後的一個以上的開發週期內
> -收到穩定版更新。例如，5.2核心的歷史如下（2019年）：
> -
> -	==============  ===============================
> -        七月 7 	        5.2 穩定版發布
> -	七月 13	        5.2.1
> -	七月 21	        5.2.2
> -	七月 26	        5.2.3
> -	七月 28	        5.2.4
> -	七月 31	        5.2.5
> -	...	        ...
> -	十月 11         5.2.21
> -	==============  ===============================
> +定版本的更新。
> +
> +要合入更新版本，補丁必須（1）修復一個重要的缺陷，且（2）已經合併到下一個開
> +發版本主線中。核心通常會在其初始版本後的一個以上的開發週期內收到穩定版更新。
> +例如，5.2核心的歷史如下（2019年）：
> +
> +        ==============  ===============================
> +        七月 7          5.2 穩定版發布
> +        七月 14         5.2.1
> +        七月 21         5.2.2
> +        七月 26         5.2.3
> +        七月 28         5.2.4
> +        七月 31         5.2.5
> +        ...             ...
> +        十月 11         5.2.21
> +        ==============  ===============================

..the same?

>  
>  5.2.21是5.2版本的最終穩定更新。
>  
>  有些核心被指定為“長期”核心；它們將得到更長時間的支援。當前的長期核心
>  版本及其維護者的列表，請參考以下連結：
>  
> -	https://www.kernel.org/category/releases.html
> +        https://www.kernel.org/category/releases.html

And also, you use space here while English one is tab.

The same for all the links below, and the quoted part.

Please let me know if I'm saying it wrong, then I can blame my editor
neovim instead. ;-)

> -長期支援核心的選擇純粹是維護人員是否有需求和時間來維護該版本的問題。
> +長期支援核心的選擇純粹是維護人員是否有需求和時間來維護該版本的問題。目前
> +沒有已知的計畫要為任何即將推出的特定版本提供長期支援。
>  
>  補丁的生命週期
>  --------------
>  
> -補丁不會直接從開發人員的鍵盤進入主線核心。相反，有一個稍微複雜（如果有些非
> +補丁不會直接從開發人員的鍵盤進入主線核心。相反，有一個稍微複雜（儘管有些非
>  正式）的過程，旨在確保對每個補丁進行品質審查，並確保每個補丁實作了一個在主
> -線中需要的更改。對於小的修復，這個過程可能會很快完成，，而對於較大或有爭議
> +線中需要的更改。對於小的修復，這個過程可能會很快完成，而對於較大或有爭議

Good catch.

For the label thing, as discussed before, let's clean up after finishing
our goal. If we do care the labels here, I'm afraid that it will
probably affect our progress in these two series.

Thanks.


