Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964724;
	b=Buwd2I4DnKKWAWZ5AlrN+NLjdN9Pn+EO2uAFVfhoDq5cXAnFR12lAwHGZp8wPGgAVdkh
	 +CDNUuwPi8iF7Ge37lhBQzipmaibHShfdAFt8KKBhnilgDKkeT8Yy19y3On9bWqihSZGL
	 NC5RYNJ4nY2cIK1qnhrqw8AEHZXCFIFIyJZCpsXY2sakkveSf3WNusPP8KzG1NaR2Z/Nr
	 qSW5/N/zmtQ7NS0GMp/i0wJCA5d4B0XQHGMzKjG/W/8l50mVFLVaUbYtDK0FfsR9m7sLR
	 fnGwDg9LG37EBU+wLKfvfYPZmSKWbAGbWceByuA/AH8AV22WXoWkMDFin+IRM/RXFBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9zKioK+H0t25OCAPt3srfDnFwL2++yBC8rqOvIErU7A=;
	b=tHSRlzNhfruoSS5E1RuAdkBNCem+ElmVgVs2MAPLa6Wb+n8OvcFPI7zta7loL12VVuA3
	 cZVr0DYNZej8aG1j4gjzNL0MvsKZYXN0WJVSbPvAb3WrPPgDLvS9uKgayiSnyCdF1UEC7
	 dSZ1leMVdEGjJvfwkan5Cw5dJDcDaB8IOSbD6Y0neTJ+eg77aHvu5x6SN2++4wU9zZ72q
	 pQe5UYqHjI/TqtpUuyB02gfzN18DYVjxZoliKdhTGaw9Ghs50+ArtNABf6MYdIWjOZ1mL
	 BXaoSZ+De9K2dk06a6lA1j1oEk97eKZp0bUz8yX60Uqs/UlZE82mrj5Z+VJVL+s5aqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeFxAx+g;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B516082BDF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B516082BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeFxAx+g
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adb9cbb0c3so55401a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964723; x=1794569523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9zKioK+H0t25OCAPt3srfDnFwL2++yBC8rqOvIErU7A=;
        b=DeFxAx+gOfgckx9zps4fVS3XSjwI1hXy5LyWI84oDLFJ9Z39WeJVVO6efqS36CR2uZ
         w323az7I3taAN78/XAOjuHT0QCUdeJ4LA5yWW9MN50VuCVsCCleDVtkWBIFIj88fGqE6
         5kHDu2qZOA/E0nQYH+whZzUFs8MemeJ0vxddMBzyHa6CciCDMtHVXlNSQEGyGphu4lG4
         5NUOL+WIF+5Nzd/WFcr7hpND2Iq1ZhDM9Ne2di7LBeWdL4mdROXDmdBx7koXZYZTCH3B
         d3+AcM8SQh20q5x93maUoTjCgd5pE2Xe9zPg7/QBAYaG+xHQySDWEhMeUsp5T+1Ae1Ad
         Alcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964723; x=1794569523;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zKioK+H0t25OCAPt3srfDnFwL2++yBC8rqOvIErU7A=;
        b=ohJ3SjkIkImqQ5jQ4Kiw6OUyQZpVYD9hESL1Om7OHffGAJVd8/fNmLvUmSQrU5WDsq
         +samRL3n4E5J4cSLRUVFWjtZi7ATo4maxYA9CEqawpPi0kqtMUk7Fdl1VqNKlLzTqaB1
         jlHXF+XX9VeeirQW6PGYW+aUn26DjZeUa4hIe9M72+yiEZl2JcBrvHhgDpPT8ifwXu2i
         vlREH/REga8d86MpfCEt/Tj4OCNaM41bPC6toN5IjPsa/Nj9c3EI7bpN9sv62WGxOpgH
         6WLNwZwYc5oBsbrxrZX+cS/PpnUTl81FBkGpEpYh8Xv49kdfwmDUbmdzHr9lUHTxvu3g
         UGrw==
X-Forwarded-Encrypted: i=1; AL+hErFgVpBvsFCxqFgxkbcBkYJeQipQeiPQzWSWNvz9G7hUVy63xlkjeCytoLbmJ+Nnwdz6qMl3FjZ9UmukyMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WJ+w1u+xNnuB4mM4uWqMtb4ijINdNEJC80AHioyltm8TlgthR
	7NBdjx9Diho9Z/4G27WXXFY1v5nNHDCK3hjvTbu9PmU1mkyyGqMN79r7
X-Gm-Gg: AYBFou2EdtRwHO1UuDgB4DKuD+ous7P9j+qgjeaexf2Q1GWh0oFo+IM8jh6Jz3zPONe
	3+2uh1pdnDQnQ5zOBynGwt3qzCH6iJmMhpNmffEknkSllikzI3xFlN3XcX8j+qQpWwGv7DZ8+DX
	4pzTwTCAfw0wusBisjtP16Z0w5KumHR+ds6q74b0FhhweZBCeUpdaj+0Mgq2rqVEUQEQg6w0iew
	G5BCe+LpzyDDFBDl7nsf2ACn5tGV1np4746V0Lw8QDG/qaXRYzVvbrOLKdWcLmdiIytQsypt/JE
	K0mzzKHiHH2eEjqZUTjqiKdD7LMpQldX41gV0O0faXkEnX1Lwx1x4g6BwdUxyRsk/twhWCqihAX
	qeoUH8R/aIyVyRQzSsRSms2DfdvYAvulOJz9u3qNYQMat0gq4hCdEsTe7to606NI/daAbPOYOCg
	BIoNiOGTgPIaCJslVKtiuE0Z5vSwS9ioP0L1x6Xp2a6NmEFAYj6IU9iABFEvYUlwNloy2Q/xqY6
	/OKQt1qyYJhAm3wL5ceC49e6X14hAGNTnQLH2FVPLJ366GGbF9rlg8BU0AARrPuPxIW3rDA3pvo
	PVYDo0SikgSH84O1hOD0WFPyc670Dz2VfqTQ6KLDQ0RCgKdSrJLgU7rwNf1C5bDG3Zf6w+kuMip
	4rSmRAqSdvrcbjj8u2/Hx9Cx7
X-Received: by 2002:a17:90b:2c86:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3b0db6f90d0mr3461733a91.4.1793964722968;
        Fri, 06 Nov 2026 03:32:02 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:02 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 04/25] docs/zh_TW: process: sync 5.Posting.rst with the English original
Date: Fri,  6 Nov 2026 19:31:19 +0800
Message-ID: <20261106113142.706783-5-chenyou910331@gmail.com>
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

The translation claims to be up to date with commit 0a83293322fd ("doc:
development-process: add notice on testing"), but a section-by-section
comparison against the current English text shows it still carried
wording from an older original and mistranslated a number of sentences.
Bring it in line with the full current original:

- drop the "since "Co-developed-by:" denotes authorship" clause that is
  no longer in the original, and fix the order it gave: a
  "Signed-off-by:" must follow each "Co-developed-by:", not the other
  way round
- add the missing reference to the reviewer's statement under
  "Reviewed-by:"
- use gender-neutral wording for "Signed-off-by:", following the English
- capitalize Git and Quilt when they name the tools, and fix the
  "git bisct" and "coilt" typos
- retranslate sentences whose meaning had drifted (reasonable detail,
  half-baked patches, reasonable configuration combinations, the
  employer "likely" owning the work, branching off at an arbitrary spot,
  the summary line, adding the From line when in doubt, gratuitous
  white-space changes, erring on the side of too many copies, copying
  the original poster, and mail threading, which was rendered as
  execution threads)
- replace mainland terms with Taiwanese usage (代碼, 激活, 響應, 嵌套,
  分銷商, 專案 for "items", ...)
- show English paths in the :ref: links to submitting-patches.rst,
  submit-checklist.rst and email-clients.rst, as the other synced files
  do, which keeps the lines within 80 columns
- replace the en dash in --chain-reply-to and the full-width colon
  after Cc, and expand tabs in the literal blocks

update to commit fdd100ee60a0 ("docs: process: use gender-neutral
pronouns")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/5.Posting.rst  | 141 +++++++++---------
 1 file changed, 71 insertions(+), 70 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/5.Posting.rst b/Documentation/translations/zh_TW/process/5.Posting.rst
index d54b16364474..51af92e18802 100644
--- a/Documentation/translations/zh_TW/process/5.Posting.rst
+++ b/Documentation/translations/zh_TW/process/5.Posting.rst
@@ -11,31 +11,31 @@
 
 您的工作遲早會準備好提交給社群進行審查，並最終包含到主線核心中。毫不稀奇，
 核心開發社群已經發展出一套用於發布補丁的約定和過程；遵循這些約定和過程將使
-參與其中的每個人的生活更加輕鬆。本文件試圖描述這些約定的部分細節；更多資訊
-也可在以下文件中找到
-:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+參與其中的每個人的生活更加輕鬆。本文件試圖以相當程度的細節描述這些期望；更多
+資訊也可在以下文件中找到
+:ref:`Documentation/process/submitting-patches.rst <tw_submittingpatches>`
 和
-:ref:`Documentation/translations/zh_TW/process/submit-checklist.rst <tw_submitchecklist>`。
+:ref:`Documentation/process/submit-checklist.rst <tw_submitchecklist>`。
 
 何時寄送
 --------
 
 在補丁完全“準備好”之前，避免發布補丁是一種持續的誘惑。對於簡單的補丁，這
 不是問題。但是如果正在完成的工作很複雜，那麼在工作完成之前從社群獲得反饋就
-可以獲得很多好處。因此，您應該考慮發布正在進行的工作，甚至維護一個可用的Git
+可以獲得很多好處。因此，您應該考慮發布正在進行的工作，甚至公開一個可用的Git
 樹，以便感興趣的開發人員可以隨時趕上您的工作。
 
 當發布中有尚未準備好被包含的程式碼，最好在發布中說明。還應提及任何有待完成的
-主要工作和任何已知問題。很少有人會願意看那些被認為是半生不熟的補丁，但是
-那些願意的人會帶著他們的點子來一起幫助你把工作推向正確的方向。
+主要工作和任何已知問題。願意看那些已知是半成品的補丁的人會比較少，但是那些
+願意看的人，會抱著能幫助你把工作推向正確方向的想法而來。
 
 建立補丁之前
 ------------
 
 在考慮將補丁發送到開發社群之前，有許多事情應該做。包括：
 
- - 儘可能地測試程式碼。利用核心的除錯工具，確保核心使用了所有可能的設定選
-   項組合進行建置，使用交叉編譯器為不同的架構進行建置等。添加測試，最好使
+ - 儘可能地測試程式碼。利用核心的除錯工具，確保核心在所有合理的設定選項組合
+   下都能建置，使用交叉編譯器為不同的架構進行建置等。添加測試，最好使
    用現有的測試框架（如KUnit），並將其作為補丁系列中單獨的一員（關於補丁系
    列，見下一節）。注意，對某些子系統而言這可能是強制性的。例如，函式庫函
    式（位於lib/下）幾乎在所有地方被廣泛使用，應當有適當的測試。
@@ -45,20 +45,20 @@
  - 您的更改是否具有效能影響？如果是這樣，您應該執行基準測試來顯示您的變更的
    影響（或好處）；結果的摘要應該包含在補丁中。
 
- - 確保您有權發布程式碼。如果這項工作是為僱主完成的，僱主對這項工作具有所
-   有權，並且必須同意根據GPL對其進行發布。
+ - 確保您有權發布程式碼。如果這項工作是為僱主完成的，僱主很可能對這項工作擁
+   有權利，並且必須同意根據GPL對其進行發布。
 
 一般來說，在發布程式碼之前進行一些額外的思考，幾乎總是能在短時間內得到回報。
 
 補丁準備
 --------
 
-準備補丁發布的工作量可能很驚人，但在此嘗試節省時間通常是不明智的，即使在短期
-內亦然。
+準備補丁發布的工作量可能很驚人，但再說一次，在此嘗試節省時間通常是不明智的，
+即使在短期內亦然。
 
 必須針對核心的特定版本準備補丁。一般來說，補丁應該基於Linus的Git樹中的當前
 主線。當以主線為基礎時，請從一個衆所周知的發布點開始——如穩定版本或 -rc
-版本發布點——而不是在一個任意的主線分支點。
+版本發布點——而不是從主線上任意一點分支出去。
 
 也可能需要針對-mm、linux-next或子系統樹產生版本，以便於更廣泛的測試和審查。
 根據補丁的區域以及其他地方的情況，針對其他樹建立的補丁可能需要大量的工作來
@@ -66,7 +66,7 @@
 
 只有最簡單的更改才應格式化為單個補丁；其他所有更改都應作為一系列邏輯更改進行。
 分割補丁是一門藝術；一些開發人員花了很長時間來弄清楚如何按照社群期望的方式來
-分割。不過，這些經驗法則也許有幫助：
+分割。不過，有一些經驗法則會很有幫助：
 
  - 您發布的補丁系列幾乎肯定不會是開發過程中版本控制系統中的一系列更改。相反，
    需要對您所做更改的最終形式加以考慮，然後以有意義的方式進行拆分。開發人員對
@@ -78,12 +78,12 @@
    檢查並驗證它所做的事情的更改。
 
  - 換種方式重申上述準則，也就是說：不要在同一補丁中混合不同類型的更改。如果
-   一個補丁修復了一個關鍵的安全漏洞，又重新排列了一些結構，還重新格式化了代
-   碼，那麼它很有可能會被忽略，從而導致重要的修復丟失。
+   一個補丁修復了一個關鍵的安全漏洞，又重新排列了一些結構，還重新格式化了程
+   式碼，那麼它很有可能會被忽略，從而導致重要的修復丟失。
 
  - 每個補丁都應該能建立一個可以正確地建置和執行的核心；如果補丁系列在中間被
    斷開，那麼結果仍應是一個正常工作的核心。部分應用一系列補丁是使用
-   “git bisct”工具查找回歸的一個常見場景；如果結果是一個損壞的核心，那麼將使
+   “git bisect”工具查找迴歸的一個常見場景；如果結果是一個損壞的核心，那麼將使
    那些從事追蹤問題的高尚工作的開發人員和使用者的生活更加艱難。
 
  - 不要過分分割。一位開發人員曾經將一組針對單一檔案的編輯分成500個單獨的補丁
@@ -93,7 +93,7 @@
  - 用一系列補丁添加一個全新的基礎設施，但是該設施在系列中的最後一個補丁啟用
    整個變更之前不能使用，這看起來很誘人。如果可能的話，應該避免這種誘惑；
    如果這個系列增加了迴歸，那麼二分法將指出最後一個補丁是導致問題的補丁，
-   即使真正的bug在其他地方。只要有可能，添加新程式碼的補丁程式應該立即激活該
+   即使真正的bug在其他地方。只要有可能，添加新程式碼的補丁應該立即啟用該
    程式碼。
 
 建立完美補丁系列的工作可能是一個令人沮喪的過程，在完成“真正的工作”之後需要
@@ -106,11 +106,11 @@
 需要被格式化成一條訊息，以快速而清晰地將其目的傳達到世界其他地方。為此，
 每個補丁將由以下部分組成：
 
- - 可選的“From”行，表明補丁作者。只有當你透過電子郵件發送別人的補丁時，這一行
-   才是必須的，但是為防止疑問加上它也不會有什麼壞處。
+ - 可選的“From”行，表明補丁作者。只有當你透過電子郵件轉發別人的補丁時，這一行
+   才是必須的，但是在不確定時加上它也不會有什麼壞處。
 
  - 一行描述，說明補丁的作用。對於在沒有其他上下文的情況下看到該訊息的讀者
-   來說，該訊息應足以確定修補程式的範圍；此行將顯示在“short form（簡短格式）”
+   來說，該訊息應足以確定補丁的範圍；此行將顯示在“short form（簡短格式）”
    變更日誌中。此訊息通常需要先加上子系統名稱前綴，然後是補丁的目的。例如：
 
    ::
@@ -123,46 +123,47 @@
  - 一個或多個標記行，至少有一個由補丁作者的 Signed-off-by 簽名。標記將在下面
    詳細描述。
 
-上面的專案一起構成補丁的變更日誌。寫一則好的變更日誌是一門至關重要但常常被
+以上各項一起構成補丁的變更日誌。寫一則好的變更日誌是一門至關重要但常常被
 忽視的藝術；值得花一點時間來討論這個問題。當你編寫變更日誌時，你應該記住有
 很多不同的人會讀你的話。其中包括子系統維護人員和審查人員，他們需要決定是否
-應該合併補丁，分銷商和其他維護人員試圖決定是否應該將補丁反向移植到其他核心，
-缺陷搜尋人員想知道補丁是否導致他們正在追查的問題，以及想知道核心如何變化的
-使用者等等。一個好的變更日誌以最直接和最簡潔的方式向所有這些人傳達所需的資訊。
-
-在結尾，總結行應該描述變更的影響和動機，以及在一行約束條件下可能發生的變化。
-然後，詳細的描述可以詳述這些主題，並提供任何需要的附加資訊。如果補丁修復了
-一個缺陷，請引用引入該缺陷的提交（如果可能，請在引用提交時同時提供其 id 和
-標題）。如果某個問題與特定的日誌或編譯器輸出相關聯，請包含該輸出以幫助其他
-人搜索同一問題的解決方案。如果更改是為了支援以後補丁中的其他更改，那麼應當
-說明。如果更改了內部API，請詳細說明這些更改以及其他開發人員應該如何響應。
-一般來說，你越把自己放在每個閱讀你變更日誌的人的位置上，變更日誌（和核心
-作為一個整體）就越好。
-
-不需要說，變更日誌是將變更提交到版本控制系統時使用的文字。接下來將是：
+應該合併補丁，發行版廠商和其他維護人員試圖決定是否應該將補丁反向移植到其他
+核心，缺陷搜尋人員想知道補丁是否導致他們正在追查的問題，以及想知道核心如何
+變化的使用者等等。一個好的變更日誌以最直接和最簡潔的方式向所有這些人傳達所需
+的資訊。
+
+為此，摘要行應該在一行的限制下，儘可能描述清楚變更的影響和動機。然後，詳細
+的描述可以詳述這些主題，並提供任何需要的附加資訊。如果補丁修復了一個缺陷，
+請儘可能引用引入該缺陷的提交（並請在引用提交時同時提供其commit ID和標題）。
+如果某個問題與特定的日誌或編譯器輸出相關聯，請包含該輸出以幫助其他人搜索同
+一問題的解決方案。如果更改是為了支援以後補丁中的其他更改，那麼應當說明。如
+果更改了內部API，請詳細說明這些更改以及其他開發人員應該如何回應。一般來說，
+你越把自己放在每個閱讀你變更日誌的人的位置上，變更日誌（和核心作為一個整體）
+就越好。
+
+不用說，變更日誌就應該是將變更提交到版本控制系統時使用的文字。接下來將是：
 
  - 補丁本身，採用統一的（“-u”）補丁格式。使用“-p”選項來diff將使函式名與
-   更改相關聯，從而使結果補丁更容易被其他人讀取。
+   更改相關聯，從而使結果補丁更容易被其他人閱讀。
 
 前面已簡要提到的標籤（tag）用於提供補丁如何產生的線索。
-:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+:ref:`Documentation/process/submitting-patches.rst <tw_submittingpatches>`
 文件中對它們進行了詳細描述；下面是一個簡短的總結。
 
 有一種標籤用於引用引入了本補丁所修復問題的較早提交::
 
-	Fixes: 1f2e3d4c5b6a ("The first line of the commit specified by the first 12 characters of its SHA-1 ID")
+        Fixes: 1f2e3d4c5b6a ("The first line of the commit specified by the first 12 characters of its SHA-1 ID")
 
 另一種標籤用於連結帶有額外背景或細節的網頁，例如導致此補丁的較早討論，或
 一份由此補丁實作的規格文件::
 
-	Link: https://example.com/somewhere.html  optional-other-stuff
+        Link: https://example.com/somewhere.html  optional-other-stuff
 
 依照企鵝老大（Chief Penguin）的指導，只有當Link:標籤指向的有用資訊無法在
 提交本身中找到時，才應該把它加到提交中。
 
 如果URL指向此補丁所修復的公開缺陷報告，請改用“Closes:”標籤::
 
-	Closes: https://example.com/issues/1234  optional-other-stuff
+        Closes: https://example.com/issues/1234  optional-other-stuff
 
 一些缺陷追蹤系統能夠在帶有此類標籤的提交被套用時自動關閉問題。一些監控
 郵件列表的機器人也會追蹤這類標籤並採取相應動作。私有缺陷追蹤系統和無效
@@ -170,28 +171,29 @@
 
 另一種標籤用於記錄誰參與了補丁的開發。它們每個都使用如下格式::
 
-	tag: Full Name <email address>  optional-other-stuff
+        tag: Full Name <email address>  optional-other-stuff
 
 常用的標籤有：
 
- - Signed-off-by: 這是一個開發人員的證明，證明他或她有權提交補丁以包含到核
-   心中。這表明同意開發者來源認證協議，其全文見
-   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
-   如果沒有合適的簽字，則不能合併到主線中。
+ - Signed-off-by: 這是一個開發人員的證明，證明自己有權提交補丁以包含到核心
+   中。這表明同意開發者來源認證協議，其全文見
+   :ref:`Documentation/process/submitting-patches.rst <tw_submittingpatches>`
+   沒有適當簽署的程式碼不能合併到主線中。
 
- - Co-developed-by: 聲明補丁是由多個開發人員共同建立的；當幾個人在一個補丁
-   上工作時，它用於給出共同作者（除了 From: 所給出的作者之外）。由於
-   Co-developed-by: 表示作者身份，所以每個共同開發人，必須緊跟在相關合作作
-   者的Signed-off-by之後。具體內容和範例見以下文件
-   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+ - Co-developed-by: 聲明補丁是由多個開發人員共同建立的；當多人共同處理一個
+   補丁時，它用於標示共同作者（除了 From: 標籤所標示的作者之外）。每個
+   Co-developed-by: 之後都必須緊跟著相應共同作者的 Signed-off-by:。具體內容
+   和範例見
+   :ref:`Documentation/process/submitting-patches.rst <tw_submittingpatches>`。
 
  - Acked-by: 表示另一個開發人員（通常是相關程式碼的維護人員）同意補丁適合包含
    在核心中。
 
  - Tested-by: 聲明某人已經測試了補丁並確認它可以工作。
 
- - Reviewed-by: 表示某開發人員已經審查了補丁的正確性；有關詳細資訊，請參閱
-   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+ - Reviewed-by: 表示某開發人員已經審查了補丁的正確性；更多細節請參閱
+   :ref:`Documentation/process/submitting-patches.rst <tw_submittingpatches>`
+   中的審查者聲明。
 
  - Reported-by: 指定報告此補丁修復的問題的使用者；此標籤用於向測試我們的
    程式碼並在發現問題時告知我們的人們（他們常常沒有得到應有的重視）表示
@@ -202,7 +204,7 @@
  - Suggested-by: 標籤表明補丁的想法是由被指名者建議的，確保其想法獲得
    讚譽。希望這能激勵他們在未來繼續幫助我們。
 
- - Cc：指定某人收到了補丁的副本，並有機會對此發表評論。
+ - Cc: 指定某人收到了補丁的副本，並有機會對此發表評論。
 
 在補丁中添加上述標籤時要小心：除了Cc:、Reported-by:和Suggested-by:之外，
 所有標籤都需要被指名者的明確許可。對於這三個標籤，如果根據lore存檔或提交
@@ -216,15 +218,15 @@
 
 在寄送補丁之前，您還需要注意以下幾點：
 
- - 您確定您的郵件發送程式不會損壞補丁嗎？被郵件客戶端更改空白或修飾了行的補丁
-   無法被另一端接受，並且通常不會進行任何詳細檢查。如果有任何疑問，先把補丁寄
-   給你自己，讓你自己確定它是完好無損的。
+ - 您確定您的郵件發送程式不會損壞補丁嗎？被郵件客戶端任意更動空白或自動換行
+   的補丁在另一端將無法套用，並且通常不會有人仔細檢查。如果有任何疑問，先把
+   補丁寄給你自己，讓你自己確定它是完好無損的。
 
-   :ref:`Documentation/translations/zh_TW/process/email-clients.rst <tw_email_clients>`
+   :ref:`Documentation/process/email-clients.rst <tw_email_clients>`
    提供了一些有用的提示，可以讓特定的郵件客戶端正常發送補丁。
 
- - 你確定你的補丁沒有荒唐的錯誤嗎？您應該始終透過scripts/checkpatch.pl檢查
-   補丁程式，並解決它提出的問題。請記住，checkpatch.pl，雖然體現了對核心補丁
+ - 你確定你的補丁沒有愚蠢的錯誤嗎？您應該始終透過scripts/checkpatch.pl檢查
+   補丁，並解決它提出的問題。請記住，checkpatch.pl，雖然體現了對核心補丁
    應該是什麼樣的大量思考，但它並不比您聰明。如果修復checkpatch.pl給的問題會
    使程式碼變得更糟，請不要這樣做。
 
@@ -232,20 +234,20 @@
 引用補丁的部分。相反，只需將補丁直接放到您的訊息中。
 
 寄出補丁時，重要的是將副本發送給任何可能感興趣的人。與其他一些專案不同，核心
-鼓勵人們甚至錯誤地發送過多的副本；不要假定相關人員會看到您在郵件列表中的發布。
+鼓勵人們寧可發送過多的副本；不要假定相關人員會看到您在郵件列表中的發布。
 尤其是，副本應發送至：
 
  - 受影響子系統的維護人員。如前所述，MAINTAINERS檔案是查找這些人員的首選地方。
 
  - 其他在同一領域工作的開發人員，尤其是那些現在可能在那裡工作的開發人員。使用
-   git查看還有誰修改了您正在處理的檔案，這很有幫助。
+   Git查看還有誰修改了您正在處理的檔案，這很有幫助。
 
- - 如果您對某錯誤報告或功能請求做出響應，也可以抄送原始發送人。
+ - 如果您是在回應某個錯誤報告或功能請求，也應抄送原始發文者。
 
  - 將副本發送到相關郵件列表，或者若無相關列表，則發送到linux-kernel列表。
 
  - 如果您正在修復一個缺陷，請考慮該修復是否應進入下一個穩定更新。如果是這樣，
-   補丁副本也應發到stable@vger.kernel.org 。另外，在補丁本身的標籤中添加一個
+   補丁副本也應發到 stable@vger.kernel.org 。另外，在補丁本身的標籤中添加一個
    “Cc: stable@vger.kernel.org”；這將使穩定版團隊在修復進入主線時收到通知。
 
 當為一個補丁選擇接收者時，最好清楚你認為誰最終會接受這個補丁並將其合併。雖然
@@ -257,7 +259,7 @@
 
 ::
 
-	[PATCH nn/mm] subsys: one-line description of the patch
+        [PATCH nn/mm] subsys: one-line description of the patch
 
 其中“nn”是補丁的序號，“mm”是系列中補丁的總數，“subsys”是受影響子系統的
 名稱。當然，一個單獨的補丁可以省略nn/mm。
@@ -267,7 +269,6 @@
 因此，請確保補丁本身具有完整的變更日誌資訊。
 
 一般來說，多部分補丁的第二部分和後續部分應作為對第一部分的回覆發送，以便它們
-在接收端都連接在一起。像git和coilt這樣的工具有命令，可以透過適當的執行緒發送
-一組補丁。但是，如果您有一長串補丁，並正使用git，請不要使用–-chain-reply-to
-選項，以避免建立過深的嵌套。
-
+在接收端都串在同一個討論串中。像Git和Quilt這樣的工具有命令，可以用正確的討論
+串結構寄出一組補丁。但是，如果您有一長串補丁，並正使用Git，請不要使用
+--chain-reply-to選項，以避免建立過深的巢狀結構。
-- 
2.43.0

