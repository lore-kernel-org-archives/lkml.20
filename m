Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964988;
	b=O+RhuuOQBGwYguTja8XKNiTXz52b942DXeGzGM5ODiVZVoqSSc4bJLy8r5wKBJN73SiW
	 MNzvRp+EJJQ9nHgd+plKbW+uNHrJf6dE/NRsRBnBflF1EeGSVqQadOP1DfCof4jz6Y6tN
	 HXVnZwsMHJBHXEst/+vxA8ZAYn3Wi+XBdjmE6T9jD9+e2jo38KQ93I1f31RQuMtx3qCNM
	 TDH+VUlVUFodt9XU2+5rCg2aKyr1CFTfS7Co++RYLSpuYfeqGbrKdtoazZfo8ix79CWgB
	 jL5fZL7VKcdXCVWvxK52LcPsrRb6LqAFoyxwtypkFIfxGpgCOcAh+6GdUJ5yzfXYDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ONbYayK2MPTgQEPAKtmB/OnwdZJFKK2un5QHf4Zu1aA=;
	b=AQ//WcleBcedUA2d2i4cSN4532R6Af7nlHvZZJUY90IflEuWgHW0eEwCzyZtErnkMzrD
	 6HkOstDwImJhk0F78pVtawZUhxEaUYwR3gfGopWMY7qK2NKMFE03exVIV7d7EG4jH6b1x
	 RUGyg+5t94ZRiollmMQGWun7fYpIQF2zfezemksTk40gO2wef5itRF42GrgxneRBv7IZ/
	 o4fO18MG4aW/GzIuaWt9yT4b5FYTdiTRFBmQ2md+UlIsBVM0K0AT1eaX5IIntuAF6OF84
	 BubenoBai7PAs9k+GxQ5oPzjF5WWv4yKiDjY4fN0fXj1fApS8QFYC8sSguiiy5hs4nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3ZYdqOJ;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351560A5BE1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3351560A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3ZYdqOJ
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so473725ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964987; x=1794569787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ONbYayK2MPTgQEPAKtmB/OnwdZJFKK2un5QHf4Zu1aA=;
        b=I3ZYdqOJVnbF1Q48yau0p7KtYEgkaDMAFHMbyikgP4Et5//dK/sZEMOJzKXqKDxsww
         xJ+clnYTMDUc6tPR7OtaemK4VZ3BzZzBFWotA4QbsUY5idFQnNFR1xZzhmHiyjH+w4BS
         82qz7c4wt4H82deGCcXPnGZRwFBngQUB6CRGIy/PhTtn6dqgOuzaIH3KSgXJl2tM1PiX
         Xi12NHyTwp2JTAYNKrf+xYaGN7Y/u0F63dyiYB+68XGsOGm2a4mafuHpB5OTGnPQXeFy
         UoxEWgn1wi7nQ7cSDdf5GkipuDDUYe7eaS4aVJF2Pn1DMF8jWjuSDmW07JKxcC7ED1VP
         T55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964987; x=1794569787;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONbYayK2MPTgQEPAKtmB/OnwdZJFKK2un5QHf4Zu1aA=;
        b=Ps/umQ+tnImTis4V+6+dkOK+H/iU8W0kwcDq07ft80YSLXU3m2u36XoNHrXpqp9dU7
         DKP8tdDo0Ws+SoDpRDlotFuEx75gIlRDk1W06ExKGh2wr+LPN5m5LbiGK/uHYLSullr9
         QIcwy0kdBzitZiri56WLETG64cQmkM3PtTGBf7hH0h1mWBTTRSuzMaaVa6ELdGewReVC
         dvVsll3yJ3wI5s+dkegdc/4wVQc+NBTB3om6y9cBST3DJN0yfxWztZTnHpn/HIbc+QwT
         snoXnVPoUTGJrhPH0yngV6/6dJ9iNNVojcnRBeiWTwkU4M0KK5XKoRsnj8SoJv3bvQ7E
         pP8A==
X-Forwarded-Encrypted: i=1; AL+hErGzjH3WUZJup1ShCWgiyN86nTw3D+DAnqzI10smppIvoo5RM5dsFMZVYbynYxC2tz1MA9f+Mq/Voy6w/ho=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vApoZUONoVb0DC4vtnl4pa+ia8K6lhCY4RJfZwufC4rAoeRB8
	bkmdcFn6yPZ3Ho+DhXNKsFLLf8YKtF3b9mvLlCrlr1MYgDuvh1WS2g2Q
X-Gm-Gg: AYBFou0PFM7IAwfMDlaz05f71LLTTBXnUBK4zjI04RCJRolQtvupP/wOGerzxaGphfm
	fEZ2Z7+x8JZz0wXW1HkdyNgrgAquE39QmOQuremHdWTsSVmJrVd3a88aFwKn+wWuX3rz7JdV30h
	p5PFTItsYheLJMWX/c1ySHKw2zBZf6ZY8cON/2DjYTWOHeDTxiIucM5tZX+s5Cd4SgQz97vSPhq
	uFfDo8xJUbIJED5OxJNt8ddO6EXl/j7T5xdWuL1qQ1dfpkKBwr32BgUeA5hsdUiWbmC5abUC+QF
	6nL9jyR8RGIBEbFFvO8uu2yoUokw6KKpPTXMekqhOeVi/42w0HWJ+UGaKNGEjINhDFKzZ5cC9Mw
	e/ykAMT0h0j+d+WeiytY2ynGi4exufhTzBBqJox2h3Nb09yPMQm8bGznMaKdHZGzMX8JXZJnors
	vilYJ836cx9dPL4st1wyyK2OifbeGACETSX0ysPZdywSKSApyWchMPl8/tXxI+O/gHnPZhKdsN8
	dagpsJNukJ4g39l+BXVHXvUmkXpezIYJ2v/WgOqkPukqfQ8YKHolL+M5rtscVAHphAZm44QahbO
	xT2liLwKYUz73EN2nbMyBQ5WaVILc5Gtjx0qCWO0kp8lO2PWOi7j/sJ7B7cabrhxIskuNhVlR2y
	qUeOQu6pTQXDxtsZrvD/wf5glGrV3GRH1shy0UsgZ0J6nKw==
X-Received: by 2002:a17:90b:264d:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b0db61aefcmr3399320a91.1.1793964987543;
        Fri, 06 Nov 2026 03:36:27 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:36:27 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 09/13] docs/zh_TW: process: add maintainer-handbooks.rst translation
Date: Fri,  6 Nov 2026 19:35:40 +0800
Message-ID: <20261106113545.708896-10-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113545.708896-1-chenyou910331@gmail.com>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
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

Translate Documentation/process/maintainer-handbooks.rst into
Traditional Chinese from the current English text.  The
maintainers-profile-toc directive is kept as is, as in the it_IT and
pt_BR translations, so the list of subsystem profiles is generated
from MAINTAINERS.  There is no zh_CN translation of this file to
consult.

List the new file in the toctree of process/index.rst, under
"Maintainer information" as in the English index, and drop it from the
TODOList.

update to commit bda185c30593 ("docs: maintainers_include: Only show
main entry for profiles")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/index.rst      |  6 +++++-
 .../zh_TW/process/maintainer-handbooks.rst    | 20 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-handbooks.rst

diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 8c558bbf30e4..a4ae46350636 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -103,9 +103,13 @@ TODOList:
 
 如何找到會接受你補丁的人。
 
+.. toctree::
+   :maxdepth: 1
+
+   maintainer-handbooks
+
 TODOList:
 
-* maintainer-handbooks
 * maintainers
 
 其他材料
diff --git a/Documentation/translations/zh_TW/process/maintainer-handbooks.rst b/Documentation/translations/zh_TW/process/maintainer-handbooks.rst
new file mode 100644
index 000000000000..502cbd69251c
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/maintainer-handbooks.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/maintainer-handbooks.rst
+
+子系統與維護者樹特定的開發流程說明
+==================================
+
+本文件的目的是提供子系統特定的資訊，作為一般開發流程手冊
+:ref:`Documentation/process <development_process_main>` 的補充。
+
+對開發者而言，下面列出了所有已知的子系統特定指南。如果你要貢獻的子系統
+沒有在這裡列出指南，可以就
+Documentation/maintainer/maintainer-entry-profile.rst 中提出的問題尋求釐清。
+
+對維護者而言，如果投稿經常忽略某些特定的提交標準，可以考慮把額外的要求與
+期望寫成文件。請參閱 Documentation/maintainer/maintainer-entry-profile.rst。
+
+.. maintainers-profile-toc::
-- 
2.43.0

