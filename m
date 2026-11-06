Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964747;
	b=pbbcNAKdtEkby6o4Bt8dYqD9EuDmIlsoxxIxd0eTaYVpV2Kvv6fe3QMy4ZsECfC9Mfdq
	 qbpDAoQZ8UaCiUMlNfJ7MTMGY4UZPcnRSleauLoH8hkj3EwEVXUpgG0H1se0z1c+LLwHC
	 43XUTvRyEoZqe2MfRwSV9Rxbh2APcUXigCO28lCt7iP/JBOhYXV3g9YWEAEcTfBlJrnBJ
	 CgdJXcquRloYFSW9+ivlz/cq4wzB6zIiMcCyNd8v+gZnIZP9NfXOS2fJsTuc7BzcdpU7r
	 5KBSMlElRhCw7iziexcve3MRPNFwV4ocB6tJ0XjZOSMmH5b0NPDV/9ofeHnqqyFzeiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
	b=y+k7Q2+EnAVON6ZEubsSwPXVOHDAwJz4nrC4d7RmLLkU9Tq0yYcVGwtm8/mEUu53Y8Zx
	 0oYrw9lLWbqGEcqYuTDStNpe3shO0L1e4BTIaUrozVdj4f4KxdWxTxUedtt+BBUTjDNuN
	 gE4JZNHG5GevcaeIlBIWn1gg/2cLvJjun2fwyFoNFDg5Gt4cX4gAQdCqJL6Ql/GOkR9/k
	 AmN1VY4wQFYc9Ez5WCSE/31HaU7eMvrjoM4JX7ibrIWRTGRj+x9E1STTHfp7ZOWCjNx5p
	 QdACoK2Wyu22WzGObJ9u1zaaqECvyy+/Xw8HVpx2gpI04OR60fUxuiI4b2LkMzlzEkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYw8675j;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35BC60A5BDE
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35BC60A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYw8675j
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0d0f38abdso66910a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964746; x=1794569546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
        b=cYw8675jjiaAp4gtHA7RdAPN+6rUJwlHh9vyrWNCLUCX9FgU02XlaitwwjyzmUklnj
         M+/ew/HzmzCfuxKdfeRnaQKG2THFM9r4ZWikjc/V7O0r24LfYIdf6uqQmWLuFN72Idir
         QM4XM/89aijuzwyF4R9/h+JmGh0ipVzIJbIfSIZ3OzkyN03cn12cFzPQ9ZO2CCyZt9TK
         gPpJWao7wlor6Oo8YT+L0RiC/pPZ13wIAyJ7N+jf4qgHyTtUMbVasdqQe93YBtWsbnXn
         coexb4gwO7GDEoUaQ2f3IVG/fyO17saHHec0itKfDz6cfxwvZggASpnFFvLifMyvgb1a
         A6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964746; x=1794569546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
        b=V01hLd99k9Ik2S6BqbUbN+JJIMFVBf8angNh/icOtzoF0pFLQKqXnSDgfEhUszjq5N
         FSqsW2ZRZWMQfGwOVVuqRh88f9zS0tWlAqsM2bzTX6RpB9aJt8IqldBtAsCElgDKFZlJ
         ZN4rU8zZI1HS3YTvc+txDhvTcUdfXtJC8yScL7oZF+/r1nJHl6UDosWSIWSx8WohcdYl
         fvgNEAtPsBSbUYRA4phmXCo5d9wJUZTmtbRoDmm3yF7tY303yUwIsVUYAfKQScAdNmMp
         MnUv22bnmfSIcZIa1cLQjcz4wEdm5oe2i8Tiq5q63H9099f1dvvhBLs09H/+exJ+6uX5
         lOhQ==
X-Forwarded-Encrypted: i=1; AL+hErHx7mY88FSBS8MHVHtsquh7Y0vR1+OnFn5HOTY/Jq/xLxA72zg+EelnC5uX1ILA6JbnjLeYRVqnHGNjNH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R/egig4e+/re/KCKf9HN/WbcnbaWxQMU0ovFW9nYT8WKO+2ob
	3fQnv+P9xuztUl/WUh6mvTlOSoOD4DGDMR+Z9/U7wAOCT6dG1Gwp3XiV
X-Gm-Gg: AYBFou0a13xQL9HC5tHBT9d2YkufKtlCVyMgX/jIp1CPDPJ6CK+x3SBtzF/x+BnRlHB
	h7ryR4PPBWLx4IWkyF1q/zs4tMTinGzAz2F+1T0ojYLBTtKsWyU8GSHP9h3E/B/7fS0UJtnHvb2
	6nEUYdRqiQbQGzjxDuy54vIIpyCjF9mutBpR+tJxl6dqqie3t4jLddTI6xjt7Qtq/NYWijuZiC6
	+9UPAhClNArIBLUF3t14OSzKm4PdHxfpyZ5vu8B0W8p8BVNE+ef3IIexHAZjVFgSr1Ct4DlXE+h
	vWysN2cNMd+MvO+5WKKG00i+JbCy81vKfjfb1yu6jmPZN+rsek1dZf7ddumPLgGzs3VhzJDRTSa
	0iA8Byup6lPWSLpkgc9XbpUQf8CjAXL8UZ8MiBE22UYg/2CkNzboLwWZJataWhhJOJgsTQckKo+
	ApcNkaGuD6ZH/BHnp1wc3z+CIP+Re+1XGgFKKTto1CELp2jyV7kGyNcbObIXCa+ly3aQAoUvkRI
	uR6ByMXyrFU+hM1fZiijGigcFiQ09ct83CAivD269YFEMSJnrdfWCArxJRaNz+7rEAfmtvSPTz4
	max0OSylaUuizCFoKWpGBSPxe/74t7QNKZzaGJW6DhBXS8WPjJLUoTmRATn8CfzjK3ZE7MDrb5x
	0J1pZsNZzbGEAiELvxZD103yeKvVEYWrEyB/vQwUF29sdfw==
X-Received: by 2002:a17:90b:518c:b0:3b0:9984:18c6 with SMTP id 98e67ed59e1d1-3b0db6e1fafmr3508549a91.3.1793964746325;
        Fri, 06 Nov 2026 03:32:26 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:25 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 11/25] docs/zh_TW: process: sync development-process.rst with the English original
Date: Fri,  6 Nov 2026 19:31:26 +0800
Message-ID: <20261106113142.706783-12-chenyou910331@gmail.com>
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

The translation carried no "update to commit" marker.
commit 2b7703e15a55 ("docs: use toctree :caption: and move
introduction") moved the introductory paragraph above the table of
contents, but the zh_TW file now has that paragraph twice: once above
the toctree, as in the English text, and a second, older copy left below
it in simplified-style characters (軟件, 裏, 瞭解).  A comparison
against the current English text brings it in line with the full current
original:

- drop the stale copy of the introduction below the toctree
- retranslate the introduction and the title with zh_TW terminology
  (內核→核心, 文檔→文件, 社區→社群, 編程→程式設計), and rephrase "in a
  way which is accessible to" instead of the literal "可以訪問"
- wrap the :Original: line and the introduction to keep them within
  80 columns, as in 8.Conclusion.rst

update to commit 2b7703e15a55 ("docs: use toctree :caption: and move
introduction")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/development-process.rst            | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/development-process.rst b/Documentation/translations/zh_TW/process/development-process.rst
index 1d22aa0d3711..906e635cf830 100644
--- a/Documentation/translations/zh_TW/process/development-process.rst
+++ b/Documentation/translations/zh_TW/process/development-process.rst
@@ -2,14 +2,18 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
+:Original: :ref:`Documentation/process/development-process.rst
+           <development_process_main>`
 
 .. _tw_development_process_main:
 
-內核開發過程指南
+核心開發過程指南
 ================
 
-本文檔的目的是幫助開發人員（及其經理）以最小的挫折感與開發社區合作。它試圖記錄這個社區如何以一種不熟悉Linux內核開發（或者實際上是自由軟體開發）的人可以訪問的方式工作。雖然這裡有一些技術資料，但這是一個面向過程的討論，不需要深入了解內核編程就可以理解。
+本文件的目的是幫助開發人員（及其經理）以最少的挫折與開發社群合作。它試圖以
+一種讓不熟悉 Linux 核心開發（或者說，一般的自由軟體開發）的人也能理解的方式，
+記錄這個社群的運作方式。雖然這裡有一些技術內容，但這基本上是一份以流程為主的
+討論，不需要對核心程式設計有深入了解也能讀懂。
 
 .. toctree::
    :caption: 內容
@@ -24,5 +28,3 @@
    6.Followthrough
    7.AdvancedTopics
    8.Conclusion
-
-本文檔的目的是幫助開發人員（及其經理）以最小的挫折感與開發社區合作。它試圖記錄這個社區如何以一種不熟悉Linux內核開發（或者實際上是自由軟件開發）的人可以訪問的方式工作。雖然這裏有一些技術資料，但這是一個面向過程的討論，不需要深入瞭解內核編程就可以理解。
-- 
2.43.0

