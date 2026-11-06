Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964714;
	b=aEAZsZ9pS9Y2di74b6BOGKDuCUkoG7kkEdq7COPhLYFkjdezBker9+Q5u1ItuKXAd13/
	 BQb2JrDQZKAtmIgVzMzRvVs+eh8pWlMfFFNiD77mCF+A6vYu2pqwliklESRbgvZ/yHqK0
	 jiJzqbrSa8y3w88hWwaAdfExqzPyi3MVbwug4m6zEOFRCZGVH2LkWBNFrRE50q/QxX5OX
	 7vCBK7U9E3hc+NQZO9fhgTJL6nk/694EUJFDCMUXJpd8++LXYhIFLvgYsF2oinFdtITge
	 AuYG24eXehkAsVNqujO+Sd0za/W2SwJbrbdl03lzluODlqoGBQS+PMupO9lEPdLGO0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KwdFJ0fFzeoyOnbWKF3lTSyNsRtow0OTFl3DyKZAgLk=;
	b=tvghqIKb8boW0ePEPqG3pEAkE7znO/t0Nes+pRi8zf3cvCySj6FodZoMAULIY9lfD/A5
	 gj7zDxazebe/yVNVdpC1SXWCzw2g5hJgQ9EHVQOEMtsi3sB4+LHrSUyXJ7bdToiFj/HK1
	 lyxxktfWjVqYrSlqKxat5qDk2IGORyOuMwhhbAEl9a0cRgPjyOQ7PYhMYm3HBzp0JFrHR
	 4Z3r02QeEjPpkioUCeEr+8TU6hiBhi9F07UxCWSdQwS48kaC5dcVb46hwozO7JA/pJ/Gk
	 ozz4jd94se00nX6LfppF3WOmMNI5Pn53xUFbNRsab71UClWZgY882me6n2ONX2m9vag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YMxbSN4y;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50AB606D831
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A50AB606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YMxbSN4y
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso106540a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964713; x=1794569513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KwdFJ0fFzeoyOnbWKF3lTSyNsRtow0OTFl3DyKZAgLk=;
        b=YMxbSN4yuis0w6bzUjyGhaZ7WA3ji0+nInOXizSeeJC5RlLVcX6lmcPifuiclhhChy
         k57khVbLcjW+0GhY/NyI9LQxdROK19oSopUlu93wfM/Y9cN1ej8PVHiFX7NFnBw7Xoyf
         VhJjVdJfJAsUzc2H1ArcPSTjImYi92Obl8qYCs8sCmSHPL5eFKloUZmpuveN2F3VYvRr
         gv8Z8AlAqWW7pu/pZYIM9TFtrkNIaCy6Ku+D2cALmqfRjUX7ZCU87MZWCcmJ20oIKjai
         2H/fc0IYL0mDU2FQV5qDkkbsjEZQjB6ihU2HjOkoB40YMTzqoKfNqNQfGKQ+fNGa7Cm0
         E0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964713; x=1794569513;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KwdFJ0fFzeoyOnbWKF3lTSyNsRtow0OTFl3DyKZAgLk=;
        b=K7lvsJ7oTPQuYvyGH2jn4ggcgUrhi8SY1s/FVidiO4ODG6WCbYntVM+AiDheSbxdSZ
         i1LPYQgroXPR2yoQOVdkHhTedYuu5YkNhqLp4Lx29K2zOgnhKRc5oJqTw22r8cnAZNPF
         Kw3vKTdKEvYW9ceHIVMXw8SYpHej34RqW0isIvS/W3nhuLz3ISNSvSA7fSlsgf6jaLwx
         GhFIZjIpDsPMLdttPsfViQpP4/08LNpozlOdmvfbJ6fmLZiyDaeLXv9wMxVMcn++duuc
         8h9z93cBEUD2JweKJinxwipUMkiJnFjm2yA6w/CKEVrIxhurnyFbaqHrJSLUQfc+NOgl
         Q7mw==
X-Forwarded-Encrypted: i=1; AL+hErEWVZFwi+Nix/061hR5AobHVjQtV0/rE1mBwC2FId4QlPTbLOJTy3r1xaL7fIq6wz9S+5RZB/ExEuhgfmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NRb05KixO6X4+CWvozVjOOlghIUC25SmyBSh0/jWZpE20v6l4
	hQGv8C5+ZyjWWiipYZCqwLLujiuHQ+edsbKOu/b4161qaA9RMmw7jDFL
X-Gm-Gg: AYBFou27oOGle0DD5qruYMZyn+1g+nk0vLZsM163ba2PWlXQMrXX60WJn9br9Pu8+bm
	NHIlNHq94nCpFquEt6YA4qTsMAePYRhfurUE8Ss+ng6VRO5NdNb5U6EfDXfqQos7HbYsMhhNZAi
	M1eUFQrbCjOcvB0LNdg+XDKJ2+qZvkrwysZ9EppekljbQQIYUVdj0ed3lM5lu0sI85Yf1jYZTtC
	+AtCQIdTtiKe8F/30Gc4/02Q3Yr+UDxHemAdA3/rbh7Fyl006GCD768n9xRoek6GPmrGahn8S/9
	je346nF6SVptt1wizRCKKpRb21/xZOEUrmWlOI9guGS7njzUyIDD04U+SuU0fZMsV+ap+mTvePS
	W0euloiWD1FMSvHnZRddGfqe2M0nxpwwDhNqFmxM7HrsN0fPKpC7jEu2gKbwGyNPidap58G82dq
	KCts6w/Aof76xzQmnAGo+HUueYZyxsxKjpoi99Mg8oAGXPDBhwX/69gsJZd34edjD8hv7edCq35
	p4uaEF/h4zoEmcfSQDZH8LDNnETfMEDCP1GQ0eeb1kA2qZ7wQuTv6uQn2ePbIfSyRwKHna/Tl/m
	3QRX8Xom+Sk5nJPlrYS7wSvDNxDTTdtLm4R7GhKsxiotk8oHGazscMGVqHwDSLgYEG1xvfwKWLJ
	rNBH+MduhZXWmyjZ9pgocrLVK4gVOxMYK6oprBxFWtLL+BQ==
X-Received: by 2002:a17:90b:224e:b0:3a8:1759:2217 with SMTP id 98e67ed59e1d1-3b0db62ffb8mr3297042a91.2.1793964712998;
        Fri, 06 Nov 2026 03:31:52 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:31:52 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 01/25] docs/zh_TW: process: sync 1.Intro.rst with the English original
Date: Fri,  6 Nov 2026 19:31:16 +0800
Message-ID: <20261106113142.706783-2-chenyou910331@gmail.com>
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

Re-check the whole translation against the current English text.  The
only English change since the last sync,
commit 4a0be1a25d98 ("Documentation: process: Capitalize Git, Quilt, and
Mercurial consistently"), capitalizes "Git", which the translation
already does.

While at it, fix a few translation errors:

 - "language" in "with, optionally, language allowing distribution
   under later versions of the GPL" means license wording, not a
   (natural) language; translate it as 條文.
 - "false economy" was translated literally as 在經濟上是錯誤的;
   use 因小失大 to convey the idiom.
 - Restructure the broken sentence about code that cannot be
   contributed.
 - Add the missing "too" (也) in the embedded systems paragraph.

update to commit 4a0be1a25d98 ("Documentation: process: Capitalize
Git, Quilt, and Mercurial consistently")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/1.Intro.rst       | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
index 65c5ae095504..d246de92bec9 100644
--- a/Documentation/translations/zh_TW/process/1.Intro.rst
+++ b/Documentation/translations/zh_TW/process/1.Intro.rst
@@ -95,8 +95,8 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 有些公司和開發人員偶爾會想，為什麼他們要費心學習如何與核心社群合作，並將程
 式碼放入主線核心（“主線”是由Linus Torvalds維護的核心，Linux發行商將其用作
 基礎）。在短期內，貢獻程式碼看起來像是一種可以避免的開銷；維護獨立程式碼並
-直接支援使用者似乎更容易。事實上，保持程式碼獨立（“樹外”）是在經濟上是錯誤
-的。
+直接支援使用者似乎更容易。事實上，保持程式碼獨立（「樹外」）看似省事，其實是
+因小失大。
 
 為了說明樹外程式碼成本，下面給出核心開發過程的一些相關方面；本文稍後將更詳細地
 討論其中的大部分內容。請考慮：
@@ -161,15 +161,15 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 尤其是嵌入式系統的製造商，可能會傾向於忽視本節中所說的大部分內容；因為他們
 相信自己正在商用一種使用凍結核心版本的獨立產品，在發布後不需要再進行開發。
 這個論點忽略了廣泛的程式碼審查的價值以及允許使用者向產品添加功能的價值。但這些
-產品的商業壽命有限，之後必須發布新版本的產品。在這一點上，程式碼在主線上並得到
-良好維護的供應商將能夠更好地佔位，以使新產品快速上市。
+產品的商業壽命也是有限的，之後必須發布新版本的產品。在這一點上，程式碼在主線
+上並得到良好維護的供應商將能夠更好地佔位，以使新產品快速上市。
 
 許可
 ----
 
 程式碼是根據一些許可證提供給Linux核心的，但是所有程式碼都必須與GNU通用公共許可
 證（GPLv2）的版本2相容，該版本是覆蓋整個核心分發的許可證。在實踐中，這意味
-著所有程式碼貢獻都由GPLv2（可選地，語言允許在更高版本的GPL下分發）或3子句BSD
+著所有程式碼貢獻都由GPLv2（可選地附帶允許在更高版本的GPL下分發的條文）或3子句BSD
 許可（New BSD License，譯者注）覆蓋。任何不包含在相容許可證中的貢獻都不會
 被接受到核心中。
 
@@ -182,9 +182,9 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 
 所有貢獻給核心的程式碼都必須是合法的自由軟體。因此，不接受身分不明或匿名的
 貢獻者的程式碼。所有貢獻者都需要在他們的程式碼上“sign off（簽發）”，聲明程
-式碼可以在GPL下與核心一起分發。無法提供未被其所有者許可為自由軟體的程式碼，
-或可能為核心造成版權相關問題的程式碼（例如，由缺乏適當保護的反向工程工作派
-生的程式碼）不能被接受。
+式碼可以在GPL下與核心一起分發。未被其所有者許可為自由軟體的程式碼，或可能
+為核心造成版權相關問題的程式碼（例如，由缺乏適當保護的反向工程工作派生的程
+式碼）都不能被貢獻。
 
 有關版權問題的提問在Linux開發郵件列表中很常見。這樣的問題通常會得到不少答
 案，但請記住，回答這些問題的人不是律師，不能提供法律諮詢。如果您有關於
-- 
2.43.0

