Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964777;
	b=DyykYB1AbtnhaN0qMj61FS9rYTrDm4rQvr0vcK7k1sPvuzv2umJYzdlociinJ059SeV5
	 5lIhbT9lnt2RqMuHHKUz+8hLpOe/Q+IXk/MB0XEOJDxI629xT2H5rntN/unTv6/WNogJ7
	 R/yrWOtK0XYwDNqrJ2tEQXgwlOCvvgmXMGYUaF6VgX5GPw9fL0IbVe24Tcc7pVMYOEL/S
	 S5x2fajfRt8RkDCzZ5Vxt+PT/CBVH/yn9glORGRL6//HNX9HvqngCPkBamYJX3fRr0MTq
	 iw6P3yHMdQErB++lIGEmcjkPkK4veX4mSn5aNoUNVd6bUfZC7O9BdAkV78QOTs5nW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kcFMQO+FBcVuHeumCnVoJcr0qU6tZBnQo15lGq6qnZs=;
	b=34fQgpyNOCNyvTNlHZswWfckmthORuN0RVbZYLnxNh19la05uFuheP7xwvtlmFoUYbQw
	 6Vvmaz85rlOzzMixyr62Kp3uIIHDnoAEkMADqCGM/kNYI/4Pqqc0k6Y439pVYJa63XpMV
	 QDs7awNq6zg6vhoR7lfZgJixLIVhZuFXa8YTRJTxN+FLNpJX8VXw8ZPoCClch3YSGH7sh
	 Zs/j3+NsrQ275gqlXC5/DeDb9YNeM397VDRLrfRABTJUyM5SDgp/j/a7xXPejCnFKJ9zF
	 HERJ9ZYMvRG4BAQPKXHnRQVxQVM9RIhuF/JM0BYFoRcFsk+hOIP5NhEMN1OZnBf4n/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=latyjXoP;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28C606EEA0
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F28C606EEA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=latyjXoP
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0b6cae44aso106893a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964776; x=1794569576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kcFMQO+FBcVuHeumCnVoJcr0qU6tZBnQo15lGq6qnZs=;
        b=latyjXoPPCiGMcBk3hbGBZdfACEAs9bPTh4gRIFN+CsNaY+RU2YgUYyI2o5AGWXHVC
         rhXmUyhCLz0fPJM4HI4T+dGGNicRWk8TrVlEgYkBByKSQa2DwjglqiO9PdUL2lV5Az/B
         ZbbCyfb9FGpzVa2p9zEcDTW/s/yJ877KJAZuhbyUZes9EigtJEI5fvGtsxDQvHh6P1TY
         cf4yzlLHqWNFMHsJnPXGmR2hruI563f+r8FzftUzT1pg+wQtwLPAqhUYfgaMyM2rqUmC
         dTuZgmDCFMdIeiFt7pHRQQnWB4J2gFbpCvF5weJ6BeCv8o2ZcNrCTdlESGWqCqWhLtqa
         Vptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964776; x=1794569576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcFMQO+FBcVuHeumCnVoJcr0qU6tZBnQo15lGq6qnZs=;
        b=J5DVnCKqhi6Vhi7aMkLlRoXpbMzUNRQwObTxnvmW0GHrb4wttESC3xTtzOiqpqFLWD
         OUNtahmRxaxPZ10J9B1kcQWGq9RWDxUNpdDqnTuzMzIf7V8fbOoxKkEON3vt1BaG9REj
         6L5To03fqJ8ltpNF2YEDWu+s6NLRZ0dZbDyod52JlrfDZEiwTb1Ne3jlYThgrOFRQN5K
         j9KHV0dyUOV0So6glgW0tjHJrFR50/XQO2lvqZto3Q/vxtL7RNQPjzFV6jEsVTlJrvzm
         ADUjM9FuAmGzQnCmslOMhbPtSSpvDwzi7l+Yy9RETEOIA3iTz+Dmr+U4clxrKckvTFWt
         t8GQ==
X-Forwarded-Encrypted: i=1; AL+hErGWbk+82drtwXDjw+bFSHB2502a3R9v2ZnucjSryVpYfPX371IiNWyGuY4G37IdmOWLk1SF+A17NI6eGLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k2rTlOPGJB/sIiV4OIrYD/PqWdaHg0LWeGB7ctsHDFwy+E1T0
	L6q9kXF3Os21SvsjX63MfeKBIHCpmlTdYBdZ4V5SgxqbXbpKCsS4naAf
X-Gm-Gg: AYBFou01qixUdIeQ16DCMPKLQ3ZGKFLdSUigvpxnLNU4XhVhwxQcBGhjE7y5MiUGY2A
	ZYy694RyE9q/8CdcAQytp2mOQhqpvesZ6/pFT/yh88QK3FojR/8DM2jhGDz4+Fyx0+XVKWoMClz
	2wOLOfJnGVHkNyy68NRc9op/yLS2HscWcnWPe6xcVGJqvlJjp05xDb6OyFGsM6RqTPxHdgXBpgy
	is5a9ttTV4de1kpQsOkcyAZd4Iq7RtuIIyXSkjSt1K7PNw4NZl8GEieE1wB60OBDxTI77iQ4tEp
	9+OhoCopwapvBmz+5qmk+RTNhDE5GnTDArpGSK4OM+o2+OJlvcypuHhmx5f5EJdS6IRe2NLwUky
	Cda98xW1juXsLf8ywvn02EkofRInQmE16cRdtDUbNWAG6t3A0cp/xgEw32KNjJ3BY2epddBdWlA
	Vqa0FzjGctnVq9uu3mD8+CXJAggq3ll6IcYD6cWx04b0sQ7xlJk9RehIDzeu2xua+NHbqFyhPbi
	6BJGz+Um8KZZbWXh1tN6r4zg5R7njvBqqxXQVpiJUurccG5w33jrQt+CVTHeFKtrup0WKzbqNZy
	t33Kp30CNZxnRd2YEowNKB4L5PN17CHDS+F2q8lUozU2Rnpr56FX+lX2Kp5uPK1DzoiRqQ1Bgl9
	TeAwa0tzuGctKrzg+D3S/UMoklQ==
X-Received: by 2002:a17:90b:2c90:b0:3ac:9e76:aa96 with SMTP id 98e67ed59e1d1-3b0db6e269amr3107057a91.3.1793964775749;
        Fri, 06 Nov 2026 03:32:55 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:55 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 20/25] docs/zh_TW: process: sync embargoed-hardware-issues.rst with the English original
Date: Fri,  6 Nov 2026 19:31:35 +0800
Message-ID: <20261106113142.706783-21-chenyou910331@gmail.com>
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

The translation is marked "update to commit cead34ac1ce1 ("MAINTAINERS:
update ndesaulniers")", but a comparison against the current English
text shows it never picked up parts of two earlier changes:

- from commit 39fef15b5f2d ("Documentation:
  embargoed-hardware-issues.rst: Clarify prenotifaction"): the team only
  develops fixes, the security officers help coordinate a fix, and the
  incident list is used for coordination of fixes
- from commit a2e4bdca2c36 ("Documentation:
  embargoed-hardware-issues.rst: minor cleanups and fixes"): the
  coordinated release paragraph, including the "no pre-notification
  process" sentence, the "acknowledges or resolves an objection"
  wording, "potential experts" in the subscription paragraph and
  "subscription to incident-specific lists"
- capitalize Git as in commit 4a0be1a25d98 ("Documentation: process:
  Capitalize Git, Quilt, and Mercurial consistently")

Also retranslate sentences whose meaning had drifted: "listed entity"
(rendered as a publicly listed company), "involved developers"
(rendered as vendors), "well-connected" (rendered as easy to contact),
the response team validating the subscription request, and the emails
rather than the list being signed.  Fix the 證書籤名 typo and localize
a few terms (通信→通訊, 行業→產業, 連接→連線, 客戶端→用戶端, 聯繫方式→聯絡方式).

update to commit 4a0be1a25d98 ("Documentation: process: Capitalize Git,
Quilt, and Mercurial consistently")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../process/embargoed-hardware-issues.rst     | 51 ++++++++++---------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
index f5096b9de1a8..612f32c2b72f 100644
--- a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
+++ b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
@@ -24,15 +24,15 @@
 
 Linux核心硬體安全小組獨立於普通的Linux核心安全小組。
 
-該小組只負責協調被限制的硬體安全問題。Linux核心中純軟體安全漏洞的報告不由
+該小組只負責為被限制的硬體安全問題開發修復。Linux 核心中純軟體安全漏洞的報告不由
 該小組處理，報告者將被引導至常規Linux核心安全小組(
 :ref:`Documentation/admin-guide/<securitybugs>`)聯繫。
 
 可以透過電子郵件 <hardware-security@kernel.org> 與小組聯繫。這是一份私密的安全
-官名單，他們將幫助您根據我們的文件化流程協調問題。
+官名單，他們將幫助您根據我們的文件化流程協調修復。
 
 郵件列表是加密的，發送到列表的電子郵件可以透過PGP或S/MIME加密，並且必須使
-用報告者的PGP密鑰或S/MIME證書籤名。該列表的PGP密鑰和S/MIME證書可從以下URL
+用報告者的PGP密鑰或S/MIME證書簽名。該列表的PGP密鑰和S/MIME證書可從以下URL
 獲得：
 
   - PGP: https://www.kernel.org/static/files/hardware-security.asc
@@ -80,29 +80,29 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 硬體安全小組確定開發人員（領域專家），他們將組成特定問題的初始響應小組。最初
 的響應小組可以引入更多的開發人員（領域專家）以最佳的技術方式解決這個問題。
 
-所有相關開發商承諾遵守限制規定，並對收到的資訊保密。違反承諾將導致立即從當前
+所有相關開發人員承諾遵守限制規定，並對收到的資訊保密。違反承諾將導致立即從當前
 問題中排除，並從所有相關郵件列表中刪除。此外，硬體安全小組還將把違反者排除在
 未來的問題之外。這一後果的影響在我們社群是一種非常有效的威懾。如果發生違規
 情況，硬體安全小組將立即通知相關方。如果您或任何人發現潛在的違規行為，請立即
-向硬體安全人員報告。
+向硬體安全官報告。
 
 流程
 ^^^^
 
 由於Linux核心開發的全球分散式特性，面對面的會議幾乎不可能解決硬體安全問題。
 由於時區和其他因素，電話會議很難協調，只能在絕對必要時使用。加密電子郵件已被
-證明是解決此類問題的最有效和最安全的通信方法。
+證明是解決此類問題的最有效和最安全的通訊方法。
 
 開始披露
 """"""""
 
-披露首先按照上述聯繫方式一節，透過電子郵件聯繫Linux核心硬體安全小組。此
+披露首先按照上述聯絡方式一節，透過電子郵件聯繫Linux核心硬體安全小組。此
 初始聯繫應包含問題的描述和任何已知受影響晶片的列表。如果您的組織製造或分發
 受影響的硬體，我們建議您也考慮哪些其他硬體可能會受到影響。披露方有責任及時
 聯繫受影響的晶片供應商。
 
 硬體安全小組將提供一個特定於事件的加密郵件列表，用於與報告者進行初步討論、
-進一步披露和協調。
+進一步披露和協調修復。
 
 硬體安全小組將向披露方提供一份開發人員（領域專家）名單，在與開發人員確認他們
 將遵守本諒解備忘錄和文件化流程後，應首先告知開發人員有關該問題的資訊。這些開發
@@ -114,12 +114,12 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 
 披露方應提供已經或應該被告知該問題的所有其他實體的聯繫人名單。這有幾個目的:
 
-  - 披露的實體列表允許跨行業通信，例如其他作業系統供應商、硬體供應商等。
+  - 披露的實體列表允許跨產業通訊，例如其他作業系統供應商、硬體供應商等。
 
   - 可聯繫已披露的實體，指定應參與緩解措施開發的專家。
 
-  - 如果需要處理某一問題的專家受僱於某一上市實體或某一上市實體的成員，則響應
-    小組可要求該實體披露該專家。這確保專家也是實體反應小組的一部分。
+  - 如果需要處理某一問題的專家受僱於某一列出的實體或某一列出的實體的成員，則
+    響應小組可要求該實體披露該專家。這確保專家也是該實體響應小組的一部分。
 
 披露
 """"
@@ -138,8 +138,9 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 問題開發緩解措施。
 
 郵件列表的操作方式與正常的Linux開發相同。發布、討論和審查修補程式，如果同意，
-則應用於非公共git儲存庫，參與開發人員只能透過安全連接存取該儲存庫。儲存庫包含
-針對主線核心的主開發分支，並根據需要為穩定的核心版本提供向後移植分支。
+則套用到非公開的 Git 儲存庫，參與開發人員只能透過安全連線存取該儲存庫。
+儲存庫包含針對主線核心的主開發分支，並根據需要為穩定的核心版本提供向後
+移植分支。
 
 最初的響應小組將根據需要從Linux核心開發人員社群中確定更多的專家。任何相關
 方都可以建議增補專家，每位專家都須符合上述相同的要求。
@@ -152,7 +153,7 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 如果披露方有令人信服的理由提出異議，則必須在五個工作日內提出異議，並立即與事件
 小組解決。如果披露方在五個工作日內未作出回應，則視為默許。
 
-在確認或解決異議後，專家由事件小組披露，並進入開發過程。
+在事件小組確認或解決異議後，專家即被披露，並進入開發過程。
 
 列表參與者不得在私有郵件列表之外交流該問題。列表參與者在處理補丁時不得使用
 任何共享資源（例如僱主的建置農場、CI系統等）。
@@ -182,8 +183,8 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 協調發布
 """"""""
 
-有關各方將協商限制結束的日期和時間。此時，準備好的緩解措施整合到相關的核心樹中
-併發布。
+有關各方將協商限制結束的日期和時間。屆時，準備好的緩解措施將發布到相關的
+核心樹中。沒有任何預先通知流程：緩解措施會公開發布，所有人同時取得。
 
 雖然我們理解硬體安全問題需要協調限制時間，但限制時間應限制在所有有關各方制定、
 測試和準備緩解措施所需的最短時間內。人為地延長限制時間以滿足會議討論日期或其他
@@ -229,12 +230,12 @@ CVE分配
   ============= ========================================================
 
 如果要將您的組織添加到專使名單中，請與硬體安全小組聯繫。被提名的專使必須完全
-理解和支援我們的過程，並且在Linux核心社群中很容易聯繫。
+理解和支援我們的過程，並且最好在 Linux 核心社群中有良好的人脈。
 
 加密郵件列表
 ------------
 
-我們使用加密郵件列表進行通信。這些列表的工作原理是，發送到列表的電子郵件使用
+我們使用加密郵件列表進行通訊。這些列表的工作原理是，發送到列表的電子郵件使用
 列表的PGP密鑰或列表的S/MIME證書進行加密。郵件列表軟體對電子郵件進行解密，並
 使用訂閱者的PGP密鑰或S/MIME證書為每個訂閱者分別對其進行重新加密。有關郵件列表
 軟體和用於確保列表安全和資料保護的設定的詳細資訊，請見：
@@ -249,16 +250,16 @@ S/MIME證書透過特定列表發送的電子郵件傳遞給訂閱者。
 訂閱事件特定列表
 ^^^^^^^^^^^^^^^^
 
-訂閱由響應小組處理。希望參與通信的披露方將潛在訂戶的列表發送給響應組，以便
-響應組可以驗證訂閱請求。
+事件特定列表的訂閱由響應小組處理。希望參與通訊的披露方將潛在專家的列表
+發送給響應小組，以便響應小組可以驗證訂閱請求。
 
 每個訂戶都需要透過電子郵件向響應小組發送訂閱請求。電子郵件必須使用訂閱者
-的PGP密鑰或S/MIME證書籤名。如果使用PGP密鑰，則必須從公鑰伺服器獲得該密鑰，
+的PGP密鑰或S/MIME證書簽名。如果使用PGP密鑰，則必須從公鑰伺服器獲得該密鑰，
 並且理想情況下該密鑰連接到Linux核心的PGP信任網。另請參見:
 https://www.kernel.org/signature.html.
 
-響應小組驗證訂閱者，並將訂閱者添加到列表中。訂閱後，訂閱者將收到來自郵件列
-表的電子郵件，該郵件列表使用列表的PGP密鑰或列表的S/MIME證書籤名。訂閱者的
-電子郵件客戶端可以從簽名中提取PGP密鑰或S/MIME證書，以便訂閱者可以向列表發
-送加密電子郵件。
+響應小組確認訂閱請求有效後，將訂閱者添加到列表中。訂閱後，訂閱者將收到
+來自郵件列表的電子郵件，這些郵件使用列表的PGP密鑰或列表的S/MIME證書簽名。
+訂閱者的電子郵件用戶端可以從簽名中提取PGP密鑰或S/MIME證書，以便訂閱者可以
+向列表發送加密電子郵件。
 
-- 
2.43.0

