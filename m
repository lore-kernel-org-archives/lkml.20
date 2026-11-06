Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964789;
	b=3Yy+CDT9OB3t1wH2cZAXGiHK0Y/CRDNwIadYkSACvvoXtCig+aA+CqSvXvgxQISCz/W6
	 1GCtWDoLTSPs0OkfzTkBuRVNHCenO1WVzDwKJulvEBpD5cMLQ3HRUgHMhk7jbCFLm5c1e
	 e+hEUTNJ1JUbYH8FMLOAI+fMnMDgsS3qr23NBNFhjkLBT5/TdK8lel1mraVOJtGvr0Boa
	 BYGcAG1FGEy8kykUM581u7XZSzRjv11WbN8R5ZJMXjkmoOPyKHPkhDMcoZxGQ7JtxPtau
	 PIu1YL9xmRqm17eBF021E87sqRBRshs4oojVg81G5rhUcXq87jzkrj4AXofttCvAj2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rfQ4cTE+eoZbY55pgsRZ/8CqV2xYReraBWYYC65CKhc=;
	b=c2pjYq3aDp4sBVp7blq2U1VZ7/vJPzhugoF3YJfjdlTIHGzQ6xCERoSwnuz4vwgUcBAU
	 +tPBlVG9aZdXmCAi7qHLEEAQVpuYJzqCfl6lYdKOUyX+LO5GkYMoMNJhlUuyr8CfaiPae
	 cLkXBCxnpXzhaIHfnC24ZLBW1dKoDp8k086HVvu6TW91JoHAGUTL0hNxVKfLQiOlw9jhd
	 /UNWra90uUD1SYzRSb2UJehxFjpXxuYPL4YX0p8JmQ3eOXpx59xZyZhaCMlMH3ovk8Gd2
	 zMgxEwB1yviBuPUuVC7L4FNNL5uUSFTR/RjIsN8v0gZUYl6+jA3yYIe4vsc2DM7NNZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlgpsLv5;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C46E607094F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C46E607094F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlgpsLv5
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso91125a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964787; x=1794569587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rfQ4cTE+eoZbY55pgsRZ/8CqV2xYReraBWYYC65CKhc=;
        b=wlgpsLv56ZyPAToLiRul2BjQtZ5v4LzSy4a7UluT7uoGFUfr0PlHuWMgzbKggUANiN
         akkk3FJ3hm2V4TCB8KUf0t8KMig8HKWcQXEb7rOooKPiP4czM6CCqych2156MdSgL0aY
         tq57Na2W+Fm3uzi7xhhm79D44rcTb2ERRf2oMjWL/db04PJ9DJolmgXXkQLj7OE4JeuC
         C0k5FSDAMJVq6gqX/g1sOE8K/Z6U4pxMvweSuKesRjphungcGSxof0xByst3ZDAfdjQJ
         /uzE2egD5WeBx2L2btNsuZ+zXqhCHPKI8BLipNQqQpvaapaGoNKpGY9Wn9PbrVbzlksm
         b/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964787; x=1794569587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfQ4cTE+eoZbY55pgsRZ/8CqV2xYReraBWYYC65CKhc=;
        b=MdGwcVOJX74bN4ldhtl62GTAsjE69v0rweIb3Xu7QQWYrvp38LpR7/O0rzHsbHmM4d
         YUu7uvNsYrzTJJoDpj96ounqF34oFnTtsGnCJoJX6II2TvmzLC3QhwUtnHeUN3/QrdPn
         grC+sAjnI3SB8Vev31TtoKKGfjZYqciPa1slziFKfmb+CTA3z9r8SxGu8m35tfxrNyI8
         PTGdSwm8Mjg0qytBW2paEwTmmiXFxNT1aGhlgfNAzs4Gk+JgUjw5VjYY7J3Gx4f16iBU
         b09ZkzsGySpxUL7V4eot4dcQahTXXQF13yUpKIpmchSSc+xZnsUS8ZIkkcaiuV+2oUCm
         CafQ==
X-Forwarded-Encrypted: i=1; AL+hErEoPV6vI7U2jIiXwihvSf57TFjlKlok/sRAQg5STa9kTSdaqeP3XWUnAOeYDx0jIa5rI42PHi8zhcNXgNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ryjqv+2xulmW78u2mi0EXDcnqN5LQKpaPwAFjmUZb9MR8Cn5A
	ZyIMkcY8ktgswC4bpZfywzlOQX7IovDywCDt//6nlkhkeONju+gQAnqf
X-Gm-Gg: AYBFou2UgWxpB0LrKvEGHgIJOH7bevJg/97lTaLMVOklenhD3mC4almMnRDPrX2hHGw
	S12MMf0WlbIxY9R4ni8SeckSFLfFyyK9H6MKzZWZPiW60bnnYI1NfdPiELXFu5GTIDMuRd5qW1V
	A7jDFqupeqd4q9lEnwWOSny2rJHATFZ06XWsi6jx6chwkNIOu6meGjXu8GjPsEQDXOZanU6dBHm
	exL9Z9sbiS2PM2c4XsBwMeVU52pIXYwPY12yS37HHYC6WFtL+fshN/RocOStEm/+9TZ/C/9o32M
	aRny3kGy78D3bvRUOT1Uxlj+QXMO5ezsjbiFojULD3Mi+im9U4BmxxFkgu5MizCX343cmkR+K/2
	L2hoKzSzkH9fu9Vg6ifkm6W/9hcwHACdwD5liA2BzVF2K1E3gKMYtaJeETAzOITHR1NxSxha4BC
	9hbGq//QASbK+5biKLnHHyeXzgRKwwnxfOQIsRPsFwNu3cyCdKg4tXjrqQdv6WvaJg3T2kS1juo
	04gddOJ/UWrdzCmxCf7CZ9pMGXf5q+TiZSj22HPAjNZUdbkJee+1rQwuxHoTrxR4MzxKij1Op3a
	fzxbks8pm3AtvhJ+s1HZa3Q0VO0swGqWMGzYKtykCPtd3YjWNisiybGosyaGUwOBeqfhPnceOyK
	nvRYVl1Kwx3rY+LZbx5RiK2wl
X-Received: by 2002:a17:90a:d883:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3b0db70872bmr4039086a91.6.1793964787116;
        Fri, 06 Nov 2026 03:33:07 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:33:06 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 23/25] docs/zh_TW: process: sync stable-api-nonsense.rst with the English original
Date: Fri,  6 Nov 2026 19:31:38 +0800
Message-ID: <20261106113142.706783-24-chenyou910331@gmail.com>
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

The translation carries no "update to commit" marker, and a comparison
against the current English text shows it still follows the original
2016 version:

- drop the "<insert link to leech comment from Andrew and Linus here>"
  placeholder removed by commit 1d2375f048b7 ("doc:process: remove note
  from 'stable api nonsense'")
- say "drivers released under a GPL-compatible license" instead of
  "GPL released drivers", following commit 8f7e6d134bda ("doc: process:
  GPL -> GPL-compatible")
- add the subtitle, restore the note block and the emphasis of the
  introduction, and split the merged paragraphs of "Stable Kernel Source
  Interfaces" and "What to do" as in the original
- use a transition instead of the "感謝" section title that the original
  does not have

Also retranslate the whole text from the English: the old text
paraphrased several sentences loosely (the "much more volatile" topic
rendered as an endless one, structure padding, a single build multiplied
by the number of distributions and releases, Greg's "you will go insane
over time") and used mainland terminology throughout (內核→核心,
代碼→程式碼, 操作系統→作業系統, 內存→記憶體, 數據→資料, 體系結構→架構,
二進制→二進位, 分配→配置, 死鎖→死結, ...).

update to commit 8f7e6d134bda ("doc: process: GPL -> GPL-compatible")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/stable-api-nonsense.rst     | 243 +++++++++---------
 1 file changed, 127 insertions(+), 116 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
index 94748429c182..25adea1146c2 100644
--- a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
+++ b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
@@ -7,143 +7,154 @@
 :Original: :ref:`Documentation/process/stable-api-nonsense.rst
            <stable_api_nonsense>`
 
-Linux 內核驅動介面
-==================
+Linux 核心驅動程式介面
+========================
 
-寫作本文檔的目的，是爲了解釋爲什麼Linux既沒有二進制內核介面，也沒有穩定
-的內核介面。這裏所說的內核介面，是指內核裏的介面，而不是內核和用戶空間
-的介面。內核到用戶空間的介面，是提供給應用程序使用的系統調用，系統調用
-在歷史上幾乎沒有過變化，將來也不會有變化。我有一些老應用程序是在0.9版本
-或者更早版本的內核上編譯的，在使用2.6版本內核的Linux發佈上依然用得很好
-。用戶和應用程序作者可以將這個介面看成是穩定的。
+（你所有的問題在這裡都有解答，而且還不只這些）
 
+本文試圖解釋為什麼 Linux **既沒有二進位核心介面，也沒有穩定的核心介面**。
 
-執行綱要
---------
+.. note::
+
+  請注意，本文描述的是 **核心內部** 的介面，而不是核心與使用者空間之間
+  的介面。
+
+  核心與使用者空間之間的介面，是應用程式所使用的介面，也就是系統呼叫
+  （syscall）介面。這個介面長久以來都 **非常** 穩定，也不會被破壞。我有
+  一些在 0.9 之前某個版本的核心上建置的舊程式，到現在依然可以在最新的
+  2.6 核心版本上正常執行。使用者和應用程式開發者可以放心地把這個介面當成
+  穩定的介面。
 
-你也許以爲自己想要穩定的內核介面，但是你不清楚你要的實際上不是它。你需
-要的其實是穩定的驅動程序，而你只有將驅動程序放到公版內核的源代碼樹裏，
-纔有可能達到這個目的。而且這樣做還有很多其它好處，正是因爲這些好處使得
-Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選擇Linux的原因。
+
+摘要
+----
+你以為自己想要穩定的核心介面，但其實你並不想要，只是你自己還不知道而已。
+你真正想要的是一個能穩定執行的驅動程式，而只有當你的驅動程式在核心主線
+樹裡，你才能得到這一點。驅動程式放進核心主線樹，你還會得到很多其他好處，
+正是這些好處讓 Linux 成為如此強壯、穩定、成熟的作業系統，而這也是你當初
+選擇使用它的原因。
 
 
-入門
------
+前言
+----
 
-只有那些寫驅動程序的“怪人”纔會擔心內核介面的改變，對廣大用戶來說，既
-看不到內核介面，也不需要去關心它。
+只有少數想要撰寫核心驅動程式的人，才需要擔心核心內部介面的改變。世界上
+大多數的人既看不到這個介面，也完全不在乎它。
 
-首先，我不打算討論關於任何非GPL許可的內核驅動的法律問題，這些非GPL許可
-的驅動程序包括不公開源代碼，隱藏源代碼，二進制或者是用源代碼包裝，或者
-是其它任何形式的不能以GPL許可公開源代碼的驅動程序。如果有法律問題，請諮
-詢律師，我只是一個程序員，所以我只打算探討技術問題（不是小看法律問題，
-法律問題很實際，並且需要一直關注）。
+首先，我 **不會** 討論任何關於封閉原始碼、隱藏原始碼、二進位 blob、原始碼
+包裝器（source wrapper），或其他任何用來描述未以 GPL 釋出原始碼的核心
+驅動程式的用語所牽涉的法律問題。如果你有任何法律問題，請諮詢律師。我是
+程式設計師，所以在這裡只會描述技術問題（這並不是要輕忽法律問題，法律問題
+是真實存在的，你也必須時時留意）。
 
-既然只談技術問題，我們就有了下面兩個主題：二進制內核介面和穩定的內核源
-代碼介面。這兩個問題是互相關聯的，讓我們先解決掉二進制介面的問題。
+所以，這裡有兩個主要的主題：二進位核心介面，以及穩定的核心原始碼介面。
+這兩者互相依賴，不過我們先討論二進位的部分，把它解決掉。
 
 
-二進制內核介面
+二進位核心介面
 --------------
-假如我們有一個穩定的內核源代碼介面，那麼自然而然的，我們就擁有了穩定的
-二進制介面，是這樣的嗎？錯。讓我們看看關於Linux內核的幾點事實：
+假設核心有穩定的原始碼介面，那麼自然也會有穩定的二進位介面，對吧？錯。
+請考慮以下關於 Linux 核心的事實：
 
-    - 取決於所用的C編譯器的版本，不同的內核數據結構裏的結構體的對齊方
-      式會有差別，代碼中不同函數的表現形式也不一樣（函數是不是被inline
-      編譯取決於編譯器行爲）。不同的函數的表現形式並不重要，但是數據
-      結構內部的對齊方式很關鍵。
+  - 取決於你使用的 C 編譯器版本，不同的核心資料結構會有不同的結構對齊
+    方式，而且可能以不同的方式包含不同的函式（函式是否被 inline）。個別
+    函式的組織方式並沒有那麼重要，但資料結構填充（padding）的差異就非常
+    重要。
 
-    - 取決於內核的配置選項，不同的選項會讓內核的很多東西發生改變：
+  - 取決於你選擇的核心建置選項，核心可能會有各式各樣不同的假設：
 
-      - 同一個結構體可能包含不同的成員變量
-      - 有的函數可能根本不會被實現（比如編譯的時候沒有選擇SMP支持
-        一些鎖函數就會被定義成空函數）。
-      - 內核使用的內存會以不同的方式對齊，這取決於不同的內核配置選
-        項。
+      - 不同的結構可能包含不同的欄位
+      - 有些函式可能根本不會被實作（例如在非 SMP 的建置中，有些鎖會被
+        編譯成什麼都沒有）。
+      - 核心內的記憶體可能會以不同的方式對齊，這取決於建置選項。
 
-    - Linux可以在很多的不同體系結構的處理器上運行。在某個體系結構上編
-      譯好的二進制驅動程序，不可能在另外一個體繫結構上正確的運行。
+  - Linux 可以在許多不同的處理器架構上執行。某個架構的二進位驅動程式，
+    不可能在另一個架構上正確執行。
 
-對於一個特定的內核，滿足這些條件並不難，使用同一個C編譯器和同樣的內核配
-置選項來編譯驅動程序模塊就可以了。這對於給一個特定Linux發佈的特定版本提
-供驅動程序，是完全可以滿足需求的。但是如果你要給不同發佈的不同版本都發
-佈一個驅動程序，就需要在每個發佈上用不同的內核設置參數都編譯一次內核，
-這簡直跟噩夢一樣。而且還要注意到，每個Linux發佈還提供不同的Linux內核，
-這些內核都針對不同的硬件類型進行了優化（有很多種不同的處理器，還有不同
-的內核設置選項）。所以每發佈一次驅動程序，都需要提供很多不同版本的內核
-模塊。
+其中有許多問題，只要針對確切的核心設定，使用與建置核心時完全相同的 C
+編譯器來編譯你的模組，就可以解決。如果你只想為某個特定 Linux 發行版的
+某個特定版本提供模組，這樣就足夠了。但是把這一次建置，乘上不同 Linux
+發行版的數量，再乘上每個發行版所支援的不同版本數量，很快你就會陷入不同
+版本、不同建置選項的惡夢。還要注意，每個 Linux 發行版的版本都包含多個
+不同的核心，各自針對不同的硬體類型調校（不同的處理器類型和不同的選項），
+所以就算只針對單一版本，你也需要建立多個版本的模組。
 
-相信我，如果你真的要採取這種發佈方式，一定會慢慢瘋掉，我很久以前就有過
-深刻的教訓...
+相信我，如果你試圖支援這種發布方式，久了一定會發瘋，我很久以前就吃過這
+個苦頭了……
 
 
-穩定的內核源代碼介面
+穩定的核心原始碼介面
 --------------------
 
-如果有人不將他的內核驅動程序，放入公版內核的源代碼樹，而又想讓驅動程序
-一直保持在最新的內核中可用，那麼這個話題將會變得沒完沒了。
-內核開發是持續而且快節奏的，從來都不會慢下來。內核開發人員在當前介面中
-找到bug，或者找到更好的實現方式。一旦發現這些，他們就很快會去修改當前的
-介面。修改介面意味着，函數名可能會改變，結構體可能被擴充或者刪減，函數
-的參數也可能發生改變。一旦介面被修改，內核中使用這些介面的地方需要同時
-修正，這樣才能保證所有的東西繼續工作。
-
-舉一個例子，內核的USB驅動程序介面在USB子系統的整個生命週期中，至少經歷
-了三次重寫。這些重寫解決以下問題：
-
-    - 把數據流從同步模式改成非同步模式，這個改動減少了一些驅動程序的
-      複雜度，提高了所有USB驅動程序的吞吐率，這樣幾乎所有的USB設備都
-      能以最大速率工作了。
-    - 修改了USB核心代碼中爲USB驅動分配數據包內存的方式，所有的驅動都
-      需要提供更多的參數給USB核心，以修正了很多已經被記錄在案的死鎖。
-
-這和一些封閉源代碼的操作系統形成鮮明的對比，在那些操作系統上，不得不額
-外的維護舊的USB介面。這導致了一個可能性，新的開發者依然會不小心使用舊的
-介面，以不恰當的方式編寫代碼，進而影響到操作系統的穩定性。
-在上面的例子中，所有的開發者都同意這些重要的改動，在這樣的情況下修改代
-價很低。如果Linux保持一個穩定的內核源代碼介面，那麼就得創建一個新的介面
-；舊的，有問題的介面必須一直維護，給Linux USB開發者帶來額外的工作。既然
-所有的Linux USB驅動的作者都是利用自己的時間工作，那麼要求他們去做毫無意
-義的免費額外工作，是不可能的。
-安全問題對Linux來說十分重要。一個安全問題被發現，就會在短時間內得到修
-正。在很多情況下，這將導致Linux內核中的一些介面被重寫，以從根本上避免安
-全問題。一旦介面被重寫，所有使用這些介面的驅動程序，必須同時得到修正，
-以確定安全問題已經得到修復並且不可能在未來還有同樣的安全問題。如果內核
-內部介面不允許改變，那麼就不可能修復這樣的安全問題，也不可能確認這樣的
-安全問題以後不會發生。
-開發者一直在清理內核介面。如果一個介面沒有人在使用了，它就會被刪除。這
-樣可以確保內核儘可能的小，而且所有潛在的介面都會得到儘可能完整的測試
-（沒有人使用的介面是不可能得到良好的測試的）。
-
-
-要做什麼
+如果你去問那些試圖讓不在核心主線樹裡的 Linux 核心驅動程式長期保持更新
+的人，這是個「火藥味」重得多的話題。
+
+Linux 核心的開發是持續且快速的，從來不會停下來放慢腳步。因此，核心開發者
+會在現有的介面中發現 bug，或是想出更好的做法。一旦如此，他們就會修改現有
+的介面，讓它運作得更好。這時函式名稱可能會改變，結構可能會變大或縮小，
+函式的參數也可能被重新設計。一旦發生這種情況，核心中所有使用這個介面的
+地方都會同時被修正，確保一切都能繼續正常運作。
+
+舉個具體的例子，核心內部的 USB 介面在這個子系統的生命週期中，至少經歷過
+三次不同的重寫。這些重寫是為了解決許多不同的問題：
+
+  - 把資料串流從同步模型改成非同步模型。這降低了許多驅動程式的複雜度，
+    並提高了所有 USB 驅動程式的傳輸量，讓我們現在幾乎可以讓所有 USB 裝置
+    以它們可能的最高速度運作。
+  - 改變了 USB 驅動程式從 USB 核心配置資料封包的方式，所有驅動程式現在都
+    需要提供更多資訊給 USB 核心，以修正許多已記錄在案的死結。
+
+這和許多封閉原始碼的作業系統形成鮮明對比，它們必須長期維護舊的 USB 介面。
+這讓新的開發者有可能不小心使用舊介面，以不恰當的方式做事，導致作業系統的
+穩定性受損。
+
+在這兩個例子中，所有開發者都同意這些是必要的重要改動，而這些改動也都以
+相對很小的代價完成了。如果 Linux 必須確保保留穩定的原始碼介面，那就得
+建立一個新介面，而舊的、有問題的介面也必須長期維護，給 USB 開發者帶來
+額外的工作。既然所有 Linux USB 開發者都是用自己的時間在工作，要求程式設計
+師無償地做毫無收穫的額外工作，是不可能的。
+
+安全性問題對 Linux 來說也非常重要。一旦發現安全性問題，它會在很短的時間
+內被修正。有好幾次，這導致核心內部介面被重寫，以防止安全性問題發生。
+一旦發生這種情況，所有使用這些介面的驅動程式也會同時被修正，確保安全性
+問題已經被修正，而且未來不會意外地再次出現。如果核心內部介面不允許改變，
+就不可能修正這類安全性問題，也無法確保它不會再次發生。
+
+核心介面會隨著時間被清理。如果某個現有介面沒有人在使用，它就會被刪除。
+這確保了核心盡可能地小，並且所有可能的介面都盡可能地得到測試（沒有人使用
+的介面幾乎不可能測試其正確性）。
+
+
+該怎麼做
 --------
 
-如果你寫了一個Linux內核驅動，但是它還不在Linux源代碼樹裏，作爲一個開發
-者，你應該怎麼做？爲每個發佈的每個版本提供一個二進制驅動，那簡直是一個
-噩夢，要跟上永遠處於變化之中的內核介面，也是一件辛苦活。
-很簡單，讓你的驅動進入內核源代碼樹（要記得我們在談論的是以GPL許可發行
-的驅動，如果你的代碼不符合GPL，那麼祝你好運，你只能自己解決這個問題了，
-你這個吸血鬼<把Andrew和Linus對吸血鬼的定義鏈接到這裏>）。當你的代碼加入
-公版內核源代碼樹之後，如果一個內核介面改變，你的驅動會直接被修改介面的
-那個人修改。保證你的驅動永遠都可以編譯通過，並且一直工作，你幾乎不需要
-做什麼事情。
-
-把驅動放到內核源代碼樹裏會有很多的好處：
-
-    - 驅動的質量會提升，而維護成本（對原始作者來說）會下降。
-    - 其他人會給驅動添加新特性。
-    - 其他人會找到驅動中的bug並修復。
-    - 其他人會在驅動中找到性能優化的機會。
-    - 當外部的介面的改變需要修改驅動程序的時候，其他人會修改驅動程序
-    - 不需要聯繫任何發行商，這個驅動會自動的隨着所有的Linux發佈一起發
-      布。
-
-和別的操作系統相比，Linux爲更多不同的設備提供現成的驅動，而且能在更多不
-同體繫結構的處理器上支持這些設備。這個經過考驗的開發模式，必然是錯不了
-的 :)
-
-感謝
-----
-感謝 Randy Dunlap, Andrew Morton, David Brownell, Hanna Linder,
-Robert Love, and Nishanth Aravamudan 對於本文檔早期版本的評審和建議。
+那麼，如果你有一個不在核心主線樹裡的 Linux 核心驅動程式，身為開發者的你
+該怎麼做？為每個發行版的每個不同核心版本釋出二進位驅動程式是一場惡夢，
+而要跟上不斷變動的核心介面也是件苦差事。
+
+很簡單，讓你的核心驅動程式進入核心主線樹（記住，我們這裡談的是以與 GPL
+相容的授權釋出的驅動程式；如果你的程式碼不屬於這一類，那就祝你好運，你
+只能靠自己了，你這個吸血鬼）。如果你的驅動程式在核心樹裡，當核心介面改變
+時，它會由當初做出這項核心修改的人負責修正。這確保了你的驅動程式隨時都能
+建置，並且長期正常運作，而你幾乎不需要付出什麼心力。
+
+把驅動程式放進核心主線樹裡，會帶來以下非常好的附帶效果：
+
+  - 驅動程式的品質會提升，而（原始開發者的）維護成本會下降。
+  - 其他開發者會為你的驅動程式加入新功能。
+  - 其他人會找出並修正你的驅動程式中的 bug。
+  - 其他人會在你的驅動程式中找到調校效能的機會。
+  - 當外部介面的改變需要修改驅動程式時，其他人會幫你更新驅動程式。
+  - 驅動程式會自動隨著所有 Linux 發行版一起發布，不需要去請求發行版
+    加入它。
+
+Linux「開箱即用」所支援的裝置比其他任何作業系統都多，而且能在比其他任何
+作業系統更多的處理器架構上支援這些裝置，這種經過驗證的開發模式一定有它
+做對的地方 :)
+
+
+
+------
+
+感謝 Randy Dunlap、Andrew Morton、David Brownell、Hanna Linder、
+Robert Love 和 Nishanth Aravamudan 對本文早期草稿的審閱與意見。
-- 
2.43.0

