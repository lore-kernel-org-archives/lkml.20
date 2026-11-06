Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964791;
	b=jBodyj97srYdOY0CQdN0ItrN7WJAWiTohavkTFfGMrPPFLONlu8ERsgJn1IPZ6a+aBdT
	 XpjoCBrigCNQQFA2h0iKsdlPfgVk0igTJgt1mA048gfa6Qw2IOF3HdbZiw1T9BLHS4Ghl
	 IV86/aesW8TGkwjx7il4OhPHFHwLMXJdQSpodnmHPWH7Ld3ZG02snsKj3sxD0f0wGDBRZ
	 iNuqtiWSjSPnRQ6vhFex9wJrIinzauX3yRPbzemgWIA8Slex5iG9T/Znm+ZHF97zrb1Q1
	 dtLaH49K0siES0w8tREyth/Io0XEOzv+W/gYcYnBrOFGEDU5Og4TCtNRti2SacJDI4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hCmyRgBNPoUT5seicaavjjK6JIguP1Xyj5MJMPT1yUE=;
	b=IiURbJ6pXs+9IhhP8nbCvrtl75RGHJ5h6tsyF5GHvf3n5s9lvsxXQWk+80GbGSj961QR
	 DVJwXBW/uhkoa2XPDafbbkoCaqc3Qg590F7wHyv2ckEuoYxPZe39lhDUry05XntRY3hKg
	 0+HM0DCt3fVXzE/uNOfyUyyzDwhMXM7jzDlxaZEnmuu8cWyRJn378WalC5oyhMNXjfuAT
	 dCqf5KuFGC4BFFkRpFHRLtryZAL2bmR+e2LmZFsETbVAb6p18QtDmLEg3aarmZ/RnDhtj
	 HoxRFn28ud4yjhB1JtGo7GuIge50q0xurbke430DnYn5I8JIfvmvUYPByxVhxj3xOtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlK89jxT;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424B6070969
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2424B6070969
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlK89jxT
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acb1224533so45087a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964790; x=1794569590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hCmyRgBNPoUT5seicaavjjK6JIguP1Xyj5MJMPT1yUE=;
        b=BlK89jxT8wkmoLpzxIneWVeEdkgU1UsyrgRGk09yoULYWogYUFl1g0f428Nu2hZ2mq
         kGQiDT5YI2MKIu8TokO1yzIy0b/pj3Qvck78XPEuwuugQEP3IWx8pDKVRLzmnvGxz2VE
         2QOOECC168J5f+PbEXfqd9gIVdpPtdjPRKNz7UdLll3LEEE0HUGoNODSZ2UncO6/6S6X
         VkmHWEj8bOrQ/wjrPxBV4PNof/LBQZ2A1x5hf7UovRUIbZLNWQcBF+vF+6t9mYUT0DU/
         g0E9gFXVibrJvDL4cVIlZgUVStt5QSbQKKsXbSxJKzLVUEwUkQhoajAqaxcCXtje2PUb
         P2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964790; x=1794569590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCmyRgBNPoUT5seicaavjjK6JIguP1Xyj5MJMPT1yUE=;
        b=JGV9GfoXgYCB477QjPlw5HFmwscCrSat6GQAxWZ339sEljQranD36sKdqp7JnXfAo8
         8QvljfuhAv+tfOiuffwxV3PC/NznFuZ3AL/jfwgQQpwMoqDPRup+HM518xqvEV2cp96T
         RmJjjSUlbDOkYq5zqbk6spydOW3mKbpTrUxVWJ6q+MDkyHwBeZHCkJQYo25nxCczUcod
         FIzj0dAwaxwwIzlooHsbOU6ifcqXQ6Svng8R00a/RPRUsQpDJWz8yfIJNzCRlj5BoB+p
         y5WAeFzhJDqZIYWNvwOzFFbJ4930dGJjSFy5K8CBeYJ6rwGU+2ymZ+X9TTyOaYMo3OKu
         NDkA==
X-Forwarded-Encrypted: i=1; AL+hErGR3Atakj+w1DLZTdF2xJWKZi5iHASv/6vyreSLB6F0Xn3edmV/E1mf5bZGGkJWJz6w7A/CAJ7yWMOT8r4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z9lMqMIwUV5Essj3YIWSxiIlrPnBp7mUr7eij4K+jse+cQC/K
	nns8yDfbHYfVGn7HWe0O+XV2yYJE0v6SbNSzQ0p+SKEXi7mp0O+yWrtY
X-Gm-Gg: AYBFou2+BNdqF0OoFgogGWHaOTFQxXJ+dCC93eoS5PfD6UxsekKGWTBymOPrvpeAb75
	n2KaBmJ72uP1uRdJH6IFjVNBk2vod5hjimYKWjyzKtrNQjMOUDv255YkeDs7k0/6vX0bIALtZ69
	xcTRNTqnMx2lJGn3xbF7Zqqhk1x0P4ax0Myj2u1BHe3F3ODf4imeBMCMa4qPPNdPR+82ISH5g1g
	8XXPfeEYDcaxqZkTFXhKbY4ehgkaYCvUGHFVTIA9PpMqodLZUiAPo/+1xq158ZZBOP9F61xa63C
	argr3g1S6DKO0mT+oBGLjpOUw2aXlPt76Yjo/SPPWpLZ88MoQ9G2rKbsAEHugJt0kfSaCYY/5fF
	DiZeI7zIWpfuSP29r8SSJ7Rondkya61+thS33HBHGxSLG8c0d4E/elhQxmzVD6u3/Mk5FSqH+7G
	FeJ313WF5quBFAo+gUg8GH61gNW7W7Cz4UzVJUfu0Zmdv4AfuVEfhpCD4BSiZjujMtRubDM81PU
	IWZQBhIa2L9v3UqubLnsbjy8uUVvWmTPAH6+HP6/rcg5ijChNMJwk8yEGrf3W5Lzd4blwr1iVgV
	sktQtief1O69Fpqp2XoSP8QBcc//mpcBfupxMPrPOpaRPGrnWV2sqgRJkr2mVYI/iY+5CbinFqa
	utZWZorsm6KLneTaCfQwGUbTN
X-Received: by 2002:a17:90b:264d:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b0db61aefcmr3386083a91.1.1793964790265;
        Fri, 06 Nov 2026 03:33:10 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:33:09 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 24/25] docs/zh_TW: process: sync submit-checklist.rst with the English original
Date: Fri,  6 Nov 2026 19:31:39 +0800
Message-ID: <20261106113142.706783-25-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113142.706783-1-chenyou910331@gmail.com>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The translation carries no "update to commit" marker.  It was converted
from zh_CN and, apart from a few later spot fixes (CONFIG_SLUB_DEBUG,
the abi.rst reference), still follows the flat 24-item list from before
2021.  Bring it in line with the current English text:

- regroup the items into the "Review your code", "Review Kconfig
  changes", "Provide documentation", "Check your code with tools",
  "Build your code" and "Test your code" sections, following
  commit 5969fbf30274 ("docs: submit-checklist: structure by category")
  and commit 47c67ec1e8ef ("docs: submit-checklist: use subheadings")
- fold the ppc64 item into the cross-compile item and replace it with
  the word size and endianness note from commit 2783096fb1dd ("docs:
  submit-checklist: Expand on build tests against different word sizes")
- test against the latest linux-next tag instead of the -mm patchset,
  turn the checkstack note block into a sentence, and drop the htmldocs
  sentence from the kernel-doc item, as in commit 5969fbf30274 ("docs:
  submit-checklist: structure by category")
- use KCFLAGS instead of EXTRA-CFLAGS, following
  commit 163ba35ff371 ("doc: use KCFLAGS instead of EXTRA_CFLAGS to pass
  flags from command line")
- drop the sparse.rst pointer that the original does not have

Also fix the opening paragraph, which said the checklist is provided
in submitting-patches.rst rather than going beyond it, link
submitting-patches.rst and coding-style.rst through their zh_TW labels
and kernel-doc through the label used by the original, and retranslate
the text with Taiwanese terminology (內核→核心, 補丁→修補程式,
代碼→程式碼, 內存→記憶體, 構建→建置, 接口→介面, 菜單→選單, 默認→預設,
堆棧→堆疊, 字節→位元組, 體系結構→架構, ...).

update to commit 5a63f0369bda ("docs/.../submit-checklist: Use
Documentation/admin-guide/abi.rst for cross-ref of README")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/submit-checklist.rst        | 159 ++++++++++--------
 1 file changed, 91 insertions(+), 68 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index 452fecc7c425..7c25b99288f2 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -6,105 +6,128 @@
 
 .. _tw_submitchecklist:
 
-Linux內核補丁提交檢查單
-~~~~~~~~~~~~~~~~~~~~~~~
+================================
+Linux 核心修補程式提交檢查清單
+================================
 
-如果開發人員希望看到他們的內核補丁提交更快地被接受，那麼他們應該做一些基本
-的事情。
+以下是開發者若希望自己提交的核心修補程式能更快被接受，應該做到的一些基本
+事項。
 
-這些都是在 Documentation/translations/zh_CN/process/submitting-patches.rst
-和其他有關提交Linux內核補丁的文檔中提供的。
+這些事項是在
+:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst
+<tw_submittingpatches>`
+及其他關於提交 Linux 核心修補程式的文件所提供的內容之外，還要額外做到的。
 
-1) 如果使用工具，則包括定義/聲明該工具的文件。不要依賴其他頭文件來引入您使用
-   的頭文件。
+審查你的程式碼
+==============
 
-2) 乾淨的編譯：
+1) 如果你使用了某項功能，就 #include 定義／宣告該功能的檔案。不要依賴其他
+   標頭檔幫你引入你所用到的標頭檔。
 
-   a) 使用合適的 ``CONFIG`` 選項 ``=y``、``=m`` 和 ``=n`` 。沒有 ``gcc``
-      警告/錯誤，沒有鏈接器警告/錯誤。
+2) 依照
+   :ref:`Documentation/translations/zh_TW/process/coding-style.rst
+   <tw_codingstyle>`
+   所述，檢查你的修補程式是否符合一般的程式碼風格。
 
-   b) 通過 ``allnoconfig`` 、 ``allmodconfig``
+3) 所有記憶體屏障（例如 ``barrier()``、``rmb()``、``wmb()``）都需要在原始碼
+   中加上註解，說明它們所做事情的邏輯及原因。
 
-   c) 使用 ``O=builddir`` 時可以成功編譯
+審查 Kconfig 變更
+=================
 
-   d) 任何 Documentation/ 下的變更都能成功構建且不引入新警告/錯誤。
-      用 ``make htmldocs`` 或 ``make pdfdocs`` 檢驗構建情況並修復問題。
+1) 任何新增或修改的 ``CONFIG`` 選項都不應弄亂設定選單，且預設應為關閉，
+   除非符合 ``Documentation/kbuild/kconfig-language.rst`` 中
+   Menu attributes: default value 一節所記載的例外條件。
 
-3) 通過使用本地交叉編譯工具或其他一些構建設施在多個CPU體系結構上構建。
+2) 所有新的 ``Kconfig`` 選項都有說明文字。
 
-4) PPC64是一種很好的交叉編譯檢查體系結構，因爲它傾向於對64位的數使用無符號
-   長整型。
+3) 已針對相關的 ``Kconfig`` 組合仔細審查過。這一點很難單靠測試做對，
+   在這裡多動腦是值得的。
 
-5) 按 Documentation/translations/zh_CN/process/coding-style.rst 所述檢查您的
-   補丁是否爲常規樣式。在提交之前使用補丁樣式檢查器 ``scripts/checkpatch.pl``
-   檢查是否有輕微的衝突。您應該能夠處理您的補丁中存在的所有
-   違規行爲。
+提供文件
+========
 
-6) 任何新的或修改過的 ``CONFIG`` 選項都不應搞亂配置菜單，並默認爲關閉，除非
-   它們符合 ``Documentation/kbuild/kconfig-language.rst`` 菜單屬性：默認值中
-   記錄的例外條件。
+1) 加入 :ref:`kernel-doc <kernel_doc>` 來為全域核心 API 撰寫文件。
+   （static 函式不需要，但寫了也可以。）
 
-7) 所有新的 ``kconfig`` 選項都有幫助文本。
+2) 所有新的 ``/proc`` 項目都在 ``Documentation/`` 下有文件記載。
 
-8) 已仔細審查了相關的 ``Kconfig`` 組合。這很難用測試來糾正——腦力在這裏是有
-   回報的。
+3) 所有新的核心開機參數都記載於
+   ``Documentation/admin-guide/kernel-parameters.rst``。
 
-9) 通過 sparse 清查。
-   （參見 Documentation/translations/zh_CN/dev-tools/sparse.rst ）
+4) 所有新的模組參數都用 ``MODULE_PARM_DESC()`` 記載。
 
-10) 使用 ``make checkstack`` 並修復他們發現的任何問題。
+5) 所有新的使用者空間介面都記載於 ``Documentation/ABI/``。
+   詳情請參閱 Documentation/admin-guide/abi.rst
+   （或 ``Documentation/ABI/README``）。
+   更改使用者空間介面的修補程式應該副本（CC）給
+   linux-api@vger.kernel.org\ 。
 
-    .. note::
+6) 如果修補程式新增了任何 ioctl，也要更新
+   ``Documentation/userspace-api/ioctl/ioctl-number.rst``。
 
-        ``checkstack`` 並不會明確指出問題，但是任何一個在堆棧上使用超過512
-        字節的函數都可以進行更改。
+使用工具檢查你的程式碼
+======================
 
-11) 包括 :ref:`kernel-doc <kernel_doc_zh>` 內核文檔以記錄全局內核API。（靜態
-    函數不需要，但也可以。）使用 ``make htmldocs`` 或 ``make pdfdocs`` 檢查
-    :ref:`kernel-doc <kernel_doc_zh>` 並修復任何問題。
+1) 提交前先用修補程式風格檢查器（``scripts/checkpatch.pl``）檢查有無輕微的
+   違規。對於修補程式中仍留下的每一項違規，你都應該能說明理由。
 
-12) 通過以下選項同時啓用的測試： ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
-    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
-    ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
-    ``CONFIG_PROVE_RCU`` 和 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 。
+2) 用 sparse 檢查時乾淨無誤。
 
-13) 在 ``CONFIG_SMP``, ``CONFIG_PREEMPT`` 開啓和關閉的情況下都進行構建和運行
-    時測試。
+3) 使用 ``make checkstack`` 並修正它找到的任何問題。
+   請注意 ``checkstack`` 不會明確指出問題，但任何在堆疊上使用超過 512 位元組
+   的函式，都是應該修改的候選對象。
 
-14) 所有代碼路徑都已在啓用所有死鎖檢測（lockdep）功能的情況下運行。
+建置你的程式碼
+==============
 
-15) 所有新的 ``/proc`` 條目都記錄在 ``Documentation/``
+1) 乾淨地建置：
 
-16) 所有新的內核引導參數都記錄在
-    Documentation/admin-guide/kernel-parameters.rst 中。
+  a) 使用適用或修改過的 ``CONFIG`` 選項 ``=y``、``=m`` 與 ``=n``。
+     沒有 ``gcc`` 警告／錯誤，也沒有連結器警告／錯誤。
 
-17) 所有新的模塊參數都記錄在 ``MODULE_PARM_DESC()``
+  b) 通過 ``allnoconfig``、``allmodconfig``
 
-18) 所有新的用戶空間接口都記錄在 ``Documentation/ABI/`` 中。有關詳細信息，
-    請參閱 Documentation/admin-guide/abi.rst (或 ``Documentation/ABI/README``)。
-    更改用戶空間接口的補丁應該抄送 linux-api@vger.kernel.org\ 。
+  c) 使用 ``O=builddir`` 時可以成功建置
 
-19) 已通過至少注入slab和page分配失敗進行檢查。請參閱 ``Documentation/fault-injection/`` 。
-    如果新代碼是實質性的，那麼添加子系統特定的故障注入可能是合適的。
+  d) Documentation/ 下的任何變更都能成功建置，且不產生新的警告／錯誤。
+     使用 ``make htmldocs`` 或 ``make pdfdocs`` 檢查建置結果，並修正任何
+     問題。
 
-20) 新添加的代碼已經用 ``gcc -W`` 編譯（使用 ``make EXTRA-CFLAGS=-W`` ）。這
-    將產生大量噪聲，但對於查找諸如“警告：有符號和無符號之間的比較”之類的錯誤
-    很有用。
+2) 使用本機的交叉編譯工具或其他建置環境（build farm），在多種 CPU 架構上
+   建置。
+   請注意，針對不同字組大小（32 位元與 64 位元）及不同位元組順序（big-endian
+   與 little-endian）的架構進行測試，能有效找出各種可攜性問題；這些問題源自
+   對可表示的數值範圍、資料對齊或位元組順序等的錯誤假設。
 
-21) 在它被合併到-mm補丁集中之後進行測試，以確保它仍然與所有其他排隊的補丁以
-    及VM、VFS和其他子系統中的各種更改一起工作。
+3) 新加入的程式碼已用 ``gcc -W`` 編譯過（使用 ``make KCFLAGS=-W``）。這會
+   產生大量雜訊，但很適合用來找出像「warning: comparison between signed and
+   unsigned」這類的錯誤。
 
-22) 所有內存屏障（例如 ``barrier()``, ``rmb()``, ``wmb()`` ）都需要源代碼注
-    釋來解釋它們正在執行的操作及其原因的邏輯。
+4) 如果你修改的原始碼依賴或使用了與下列 ``Kconfig`` 符號相關的任何核心 API
+   或功能，就要在停用相關 ``Kconfig`` 符號及／或設為 ``=m`` （如果有此選項）
+   的情況下，測試多種建置組合〔不必同時全部停用，只要各種／隨機的組合即可〕：
 
-23) 如果補丁添加了任何ioctl，那麼也要更新
-    ``Documentation/userspace-api/ioctl/ioctl-number.rst`` 。
+   ``CONFIG_SMP``, ``CONFIG_SYSFS``, ``CONFIG_PROC_FS``, ``CONFIG_INPUT``,
+   ``CONFIG_PCI``, ``CONFIG_BLOCK``, ``CONFIG_PM``, ``CONFIG_MAGIC_SYSRQ``,
+   ``CONFIG_NET``, ``CONFIG_INET=n`` （但後者需搭配 ``CONFIG_NET=y``）。
 
-24) 如果修改後的源代碼依賴或使用與以下 ``Kconfig`` 符號相關的任何內核API或
-    功能，則在禁用相關 ``Kconfig`` 符號和/或 ``=m`` （如果該選項可用）的情況
-    下測試以下多個構建[並非所有這些都同時存在，只是它們的各種/隨機組合]：
+測試你的程式碼
+==============
 
-    ``CONFIG_SMP``, ``CONFIG_SYSFS``, ``CONFIG_PROC_FS``, ``CONFIG_INPUT``,
-    ``CONFIG_PCI``, ``CONFIG_BLOCK``, ``CONFIG_PM``, ``CONFIG_MAGIC_SYSRQ``,
-    ``CONFIG_NET``, ``CONFIG_INET=n`` （但是最後一個需要 ``CONFIG_NET=y`` ）。
+1) 已在同時啟用 ``CONFIG_PREEMPT``、``CONFIG_DEBUG_PREEMPT``、
+   ``CONFIG_SLUB_DEBUG``、``CONFIG_DEBUG_PAGEALLOC``、``CONFIG_DEBUG_MUTEXES``、
+   ``CONFIG_DEBUG_SPINLOCK``、``CONFIG_DEBUG_ATOMIC_SLEEP``、
+   ``CONFIG_PROVE_RCU`` 與 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 的情況下測試過。
 
+2) 已在啟用與不啟用 ``CONFIG_SMP`` 及 ``CONFIG_PREEMPT.`` 的情況下，進行過
+   建置與執行期測試。
+
+3) 所有程式碼路徑都已在啟用所有 lockdep 功能的情況下執行過。
+
+4) 已至少透過注入 slab 與分頁配置失敗進行過檢查。請參閱
+   ``Documentation/fault-injection/``。
+   如果新程式碼的份量很大，加入子系統專屬的故障注入可能也是適當的。
+
+5) 已用 linux-next 最新的標籤測試過，確保它仍能與所有其他排隊中的修補程式，
+   以及 VM、VFS 和其他子系統的各種變更一起正常運作。
-- 
2.43.0

