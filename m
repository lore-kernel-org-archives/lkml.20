Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964758;
	b=H9Gl5iHaU4eV8YV8ncalsMZKgo5w6POeUo+Gvz20HXL0YQHxynpdPCLA9/HMxgioVNOv
	 9VZEe63sdmR/Em4hL4maqCh0eBMIzzNUqVTKLol/izlDSYMRs8ndKaaOSrx7f1SHq9YlM
	 7gzXeXX0S6V6pLF3RhGRtWJZwLr33pfbD1t+v9h9nDdR2qfqPIoBXb1SnCVHMMXvCvaZR
	 Xe9N130c8gf1HbWp9niASstW/p9OoJEItXcWNKnvUrqi80d1nmhc3AII9FfrARJ024MvB
	 3nyCnCJe7n67PE3kGBqF5o65MYSGwGOn20bjxwE/1avaWNEiU4JgqyHZJTWvgmNXV9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xWFVohln4eeSo5RlKr33gLvCy/2Hvt/Ikr1NBWJFOgw=;
	b=2+R1EnInrJES8wCqw0x1V85W1rq+cSSSJbmqhmrKXOhz1HrgY2sjzJ2DYECtMMLLwmCy
	 nlWQi9lcApIAIfPiRSuHmKnVF3zxL1PIYPtfpuGG1bjjZigdDTsYcHe4xChjEFmAnqjfT
	 KKrflzTdspK1S7QJdBQpL4SQu71qO5cZ4h2ICe9PZPeAocvbxhTeH+0QyZN62uQjmKAox
	 fioz3G5ZjzZ3r1yzcpPdRfpEzAbNs0C8wV+Oh/Dmd8h/xWpu1PcAnjpbBcnycPGQk2BaA
	 WXDlGZzyodT2qFddKJfSyExpLZXpQHKS8ebNDn16fFxHkltqQxIut+tQ3tWL55eeBCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xi00ilF5;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A3606A906
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6A3606A906
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xi00ilF5
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0b8b5d28cso90400a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964757; x=1794569557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWFVohln4eeSo5RlKr33gLvCy/2Hvt/Ikr1NBWJFOgw=;
        b=Xi00ilF527rpVQ8LKj8jKK+yfyEoflym2vuXH/ZqmRZDkSr1zt00pt3sC1zVp3yJV7
         q2f0nkmbTjvZozxTbsZbbW0xD57zUjDSk/k+aoA61xXA06K2MIlnI/cIvjMxvnrz4utm
         CXJTW7e35ZjSKSaggdUuejXxsfVNIAisqSzoARJBmPHAaiKByrOMMyWDJwfH0LWSVbAh
         69xYKNekkD/6oEsWRUnopjz1DssH+7k4VbilkAgpkcz2L2O69wtlgGmeezEv/ba18vea
         e23KjKoWj6yhAE+rG5d5WRZ7JjbGz7hQk6St1aQre/9rSgARuTowDoQ5Ch39BqtOnavv
         R9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964757; x=1794569557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWFVohln4eeSo5RlKr33gLvCy/2Hvt/Ikr1NBWJFOgw=;
        b=1KSephlqbUbmOlstIEWb9q3bFEJ12LN4f8jfmsIfi16XBsLMg/8yB6ovYyDt64WlW2
         pTjt2ePChEeLk6KqzVZgaepkbDr/L4bL3n60vEoMnO3KeUXESv7Ka2N8UlqaB5+CuujG
         AjA6zrMzxaPcUeA6JMuURWTDUoa3TS3IU8pCFtovgn6Y+20cC1e82qM7DHWJ5oKugrK1
         I2ONe+FNgWcYDX1PRicpgE0XDvBPFW/+zaxYOt1POe1QijwbH2DWKwSBF7qp4GFGS2rs
         C6xSVujtu6ZwLIk7jjOEEJMNzm+uVj4pGYYlF2hP5y/oHisqItn150GmlzdU0UA3xQj5
         CGmA==
X-Forwarded-Encrypted: i=1; AL+hErGFgeCR08YYU8tilXIFSEKiAz2IOtdZan1kaOZ0jga58fbN9nNtzWHiu/YrhINxH6w0MRHyGUcZOP9mPmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y4pVVBL9QiFHqRy8jJf9l9/xUVp7Nr0jlRRow/VkUchvHVFXZ
	tlu81KvKA8Kz4NKG6XD8x9Dmw9d4tu9d0YXcqTNHriINS1ncFwudbQWC
X-Gm-Gg: AYBFou3ERuoqqGFaTz3AzuoK0AsqkhvWQT7E27/Mdt+9sFFBYr5jKuHvJJz4iYjytkj
	yhYR6Sn/KVtr/Ftprp6gSsB2ynxGIP5NX48a3f8ZW9mgJmkNmmyUZ9tWbEFG0Wsq44obA+SwdfC
	9ecNRIHR2UP6E+XMAoFYPXl0Rkgtbtfn0KzV3hoTWV6y1Ikh2v3FKBXaIetO8BL5kuyqSG6vgZD
	iET8qNRPCAvPJJuKPjVMkwoc1uI9UHACOnIhu7tFrSZpjwI6vy768VQB8Y4rXeNMW+p5J/F0zB0
	2NEfJM/VgCMYkO3zW3/wFkwKvKU7wiLuD2nndxXMMsPv4ODsLhaJoe6K3CxM7Pm82MIsy4BvXaq
	x2hbANRa0B1gzK/3zuFMd/4TCtI63Ugh2B2scGT/BV+bafKGrXcwsjii+Ker32svMvWbmdYUpok
	f+zM1QOu7P3b/zth25gqIDWN/YN8tSPocJXHEZUCuo4Q2fQbAXhwaClbdxBCgzLrZub21ItNggK
	TW4+wzraiVOoSDteNCYnVGi3e4UDwUJALLhtbpN/UmBHc4JnlxGKa1/jO6xN26tccsKhwbhgeoC
	Kh2kbiRDTyWlKZZe0acZRJBdOA1n4e15HoI3ctNzsFJnhC2KhgBgyAMhlCgkEdJfeBQgNxmCRug
	iGK0Asr+rKHa5H4Ax6QBNLL+/sg==
X-Received: by 2002:a17:90b:4c8f:b0:3b0:9e2f:cfc5 with SMTP id 98e67ed59e1d1-3b0db60cd3dmr3615027a91.1.1793964756800;
        Fri, 06 Nov 2026 03:32:36 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:36 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 14/25] docs/zh_TW: process: sync kernel-enforcement-statement.rst with the English original
Date: Fri,  6 Nov 2026 19:31:29 +0800
Message-ID: <20261106113142.706783-15-chenyou910331@gmail.com>
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

The translation carries no "update to commit" marker.  A comparison
against the current English text shows the content is complete: the
signer list matches all 109 names, including the later additions such as
Arnaldo Carvalho de Melo, Kees Cook and Luis R. Rodriguez.  But the file
still begins its label line with the byte order mark that
commit 9e255e2b9afe ("Documentation: drop optional BOMs") removed from
the original, and the prose was converted from zh_CN:

- drop the byte order mark, as in the original
- retranslate sentences whose meaning had drifted: the additional
  permissions apply "with respect to any non-defensive assertion of
  rights under the license" (rendered as "as any non-defensive
  assertion"), and the uncertainty to eliminate is "about our
  expectations regarding compliance or enforcement" (rendered as our
  own uncertainty about regulatory compliance)
- rewrite the two quoted GPL-3.0 provisions so that the conditions
  read in order, without the duplicated "reinstated permanently" in
  (b), and use 版權持有人 for "copyright holder" throughout
- localize terminology (內核→核心, 社區→社群, 用戶→使用者, 項目→專案,
  分發→散布, 爲→為), and translate "Except where noted below" as
  such instead of "except as mentioned below"
- wrap the :Original: line to stay within 80 columns and drop the
  blank line at the end of the file

update to commit 9e255e2b9afe ("Documentation: drop optional BOMs")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../process/kernel-enforcement-statement.rst  | 59 ++++++++++---------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
index d54d20529294..9a518ce322c2 100644
--- a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
@@ -1,45 +1,49 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-﻿.. _tw_process_statement_kernel:
+.. _tw_process_statement_kernel:
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
+:Original: :ref:`Documentation/process/kernel-enforcement-statement.rst
+           <process_statement_kernel>`
 
-Linux 內核執行聲明
+Linux 核心執行聲明
 ------------------
 
-作爲Linux內核的開發人員，我們對如何使用我們的軟體以及如何實施軟體許可證有著
-濃厚的興趣。遵守GPL-2.0的互惠共享義務對我們軟體和社區的長期可持續性至關重要。
+作為Linux核心的開發人員，我們對我們的軟體如何被使用，以及我們軟體的許可證
+如何被執行，有著濃厚的興趣。遵守GPL-2.0的互惠共享義務，對我們軟體和社群的
+長期永續發展至關重要。
 
-雖然有權強制執行對我們社區的貢獻中的單獨版權權益，但我們有共同的利益，即確保
-個人強制執行行動的方式有利於我們的社區，不會對我們軟體生態系統的健康和增長
-產生意外的負面影響。爲了阻止無益的執法行動，我們同意代表我們自己和我們版權
-利益的任何繼承人對Linux內核用戶作出以下符合我們開發社區最大利益的承諾:
+雖然對貢獻給我們社群的內容中各自獨立的版權權益，確實有權強制執行，但我們
+共同關心的是，確保個別的執行行動以有利於我們社群的方式進行，而不會對我們
+軟體生態系統的健康與成長造成意料之外的負面影響。為了遏止無益的執行行動，
+我們同意代表我們自己以及我們版權權益的任何繼受者，向Linux核心的使用者作出
+以下承諾，這符合我們開發社群的最大利益：
 
-    儘管有GPL-2.0的終止條款，我們同意，採用以下GPL-3.0條款作爲我們許可證下的
-    附加許可，作爲任何對許可證下權利的非防禦性主張，這符合我們開發社區的最佳
-    利益。
+    儘管有GPL-2.0的終止條款，我們同意，對於依本許可證所提出的任何非防禦性
+    權利主張，採用以下GPL-3.0條款作為我們許可證下的額外許可，這符合我們開發
+    社群的最大利益。
 
-        但是，如果您停止所有違反本許可證的行爲，則您從特定版權持有人處獲得的
-        許可證將被恢復：（a）暫時恢復，除非版權持有人明確並最終終止您的許可證；
-        以及（b）永久恢復, 如果版權持有人未能在你終止違反後60天內以合理方式
-        通知您違反本許可證的行爲，則永久恢復您的許可證。
+        但是，如果您停止所有違反本許可證的行為，則您從特定版權持有人處
+        獲得的授權將會恢復：（a）暫時恢復，除非且直到該版權持有人明確並
+        最終終止您的授權；以及（b）永久恢復，如果該版權持有人未能在您
+        停止違反後60天內，以某種合理方式通知您違反的情事。
 
-        此外，如果版權所有者以某種合理的方式通知您違反了本許可，這是您第一次
-        從該版權所有者處收到違反本許可的通知（對於任何作品），並且您在收到通知
-        後的30天內糾正違規行爲。則您從特定版權所有者處獲得的許可將永久恢復.
+        此外，如果版權持有人以某種合理方式通知您違反的情事，而這是您
+        第一次從該版權持有人處收到違反本許可證的通知（就任何作品而言），
+        並且您在收到通知後30天內糾正違反行為，則您從該特定版權持有人處
+        獲得的授權將永久恢復。
 
-我們提供這些保證的目的是鼓勵更多地使用該軟體。我們希望公司和個人使用、修改和
-分發此軟體。我們希望以公開和透明的方式與用戶合作，以消除我們對法規遵從性或強制
-執行的任何不確定性，這些不確定性可能會限制我們軟體的採用。我們將法律行動視爲
-最後手段，只有在其他社區努力未能解決這一問題時才採取行動。
+我們提供這些保證的目的是鼓勵更多人使用該軟體。我們希望公司和個人使用、修改和
+散布此軟體。我們希望以公開和透明的方式與使用者合作，消除外界對我們在遵循或
+執行許可證方面之期望的任何不確定性，以免這些不確定性限制我們軟體的採用。
+我們將法律行動視為最後手段，只有在社群的其他努力未能解決問題時才會採取。
 
-最後，一旦一個不合規問題得到解決，我們希望用戶會感到歡迎，加入我們爲之努力的
-這個項目。共同努力，我們會更強大。
+最後，一旦不合規的問題得到解決，我們希望該使用者會感到受歡迎，加入我們在這個
+專案上的努力。攜手合作，我們會更強大。
 
-除了下面提到的以外，我們只爲自己說話，而不是爲今天、過去或將來可能爲之工作的
-任何公司說話。
+除下文另有註明者外，我們僅代表自己發言，而非代表我們目前、過去或將來可能任職
+的任何公司。
 
   - Laura Abbott
   - Bjorn Andersson (Linaro)
@@ -150,4 +154,3 @@ Linux 內核執行聲明
   - Wei Yongjun
   - Lv Zheng
   - Marc Zyngier (Arm Ltd)
-
-- 
2.43.0

