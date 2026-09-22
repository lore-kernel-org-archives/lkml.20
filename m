Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E714E1C6A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066237; cv=none; b=ikdnAvA9RfQ20/ZoYLiUnZocE0zaP5InzY+j/3+pVKUVE0RtlKM+RtNHnTG3q43p6fOX4J8o1aJmmeWq8jyJLBMq8MNZnnG0WXSOq/Q5pW/0h6QrI9/Y1U0r8Qvx68Erjv0TITPyJAC2Jnsoft+gjtb8MEKE9f/T5LLu5a2Z/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066237; c=relaxed/simple;
	bh=GALzv8l8n/aVQfNBGJe15SMcuiPArEJnaF6GRgvKe30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p9NK0wiTvr3L0kLkhYjiw7UqyshX5KFLhOVwIjiDBpNU90u8nouEbZtKf5f1uTBeSuqQcWaEDAIhq+Uev0JpZ4xLqbswDivmBLGyj11dEzPYiEf65qd13JX4SqU5iyI/N6DR6YuCsEd12c8PX0R/RUg0ZhYmxKOEDQg3Q126sX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cro20hvR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cro20hvR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D208AC2BCB8;
	Tue, 22 Sep 2026 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790066236;
	bh=GALzv8l8n/aVQfNBGJe15SMcuiPArEJnaF6GRgvKe30=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cro20hvR5uvGG5j9k566Lw+TJpgtbNm6MYDMdAXz+MwAy8Yw4CVfVX+M5SrYeMHaL
	 vk++U9D3RWThS6axCI9vn1pB8AKC4Q5FrswPjzBiVkLaeVeMt8uJiNKtwGAs1Cxepi
	 5yHowzWX+CXUY5Fg1zoocyfkrSABEIc9plIGejMzZ7xFSDP16dnhuHLIcku7jtZec3
	 7Q3cYXVMHGYBb035p8imevPQN1+FBveZpYW8bw97k/vmvSuW5+sRsXWLK7mxu6fxbi
	 G5CgR/e50G+8hGS8HMww6N1oVWr/w3Jlvh7q1XF+wfUnj0za+5GYeuNeBKGrxwkqfQ
	 kAB9YMlE+fxwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08D4C982FF;
	Tue, 22 Sep 2026 08:37:16 +0000 (UTC)
From: Chen Linxuan via B4 Relay <devnull+me.black-desk.cn@kernel.org>
Date: Tue, 22 Sep 2026 16:37:10 +0800
Subject: [PATCH] mailmap: add entry for Chen Linxuan
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-update-mailmap-v1-1-7247626a14c7@black-desk.cn>
X-B4-Tracking: v=1; b=H4sIADU+smoC/yXMQQ7CIBBA0as0s5YEh8aoVzEuBpjqGEECrTEh3
 L3ULt/i/wqFs3CB61Ah81eKfGLH8TCAe1J8sBLfDajxpC+IakmeZlaB5B0oKYN6NNafzUQMPUq
 ZJ/n9h7f77rLYF7t5u0BrK89Sp2JyAAAA
X-Change-ID: 20260922-update-mailmap-32043bd83fae
To: linux-kernel@vger.kernel.org
Cc: Chen Linxuan <me@black-desk.cn>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=me@black-desk.cn;
 s=20260831; h=from:subject:message-id;
 bh=iftiRyPZlxwFYFM3Ehh7elqQAiovq5fz7GTzLwH/4qA=;
 b=owEBbQKS/ZANAwAKAXYe5hQ5ma6LAcsmYgBqsj459HBqDgd/qFdkcHsdKpoHWIJ1XFYfD66vI
 YtA4b7j8UuJAjMEAAEKAB0WIQTO1VElAk6xdvy0ZVp2HuYUOZmuiwUCarI+OQAKCRB2HuYUOZmu
 i1bAEAD3W6e+BCEoGOMGH1U8639uOTyfrRcum9+Eo8/NUr+MIamuJjdC7WokbGdAp6s3aboGzbD
 vawomEzCkcFNujmqxvmb04qiHxg+BxgIf20MH9jzkWKFm+cPx+c/GTT0uXEAL7qyR7p+aC8G/yp
 qWC4sfW9cN4gmqyyi80lHYxMK7Ty4jzpuqpHkTR/ATzNiXSV0oJ0N1FQDlEH7mNFStttit2hz0q
 EeIA2g5KN8nf5EgTNMi0cx0E2SxemmLWDd7xxTtYACqubqcIJUH51qVX9it17I9Yxl8GnDEdZD3
 TGUF3rFTQ6izwJ+Yz7LuiweQQyvJAoDNooUJh1RLge/RU7WwenzMsHl1yN95EAcwKUAymCy9nQ3
 Y9X/w7dW9D2Me8wTtDR5GMa9ROSNTQdssJnNUD8PR+yHvqtJ2BAbBdfCEHX11KOvy9oztBo21YJ
 0W04MTzqActFybPC1/jJMIxKGgZ0PNx+xfX8blJUbGR76Y32kLKy8jWXz3D28KNktsiWOtn7HwP
 pdNb446zNU6J5lX8luGd9t/mSSMmejmmEQ2u3gcyHwcukC3zJQTQ0NcUwleo6/KjuueVfnjDecj
 og09M/zNWlUjoedfvUC2BM+U+2F9X3UMkrP9BWrHvpqSMyElhHfnJEZxieSwYrQLf3d6wXpQZL9
 GI60YkYffLFuGKQ==
X-Developer-Key: i=me@black-desk.cn; a=openpgp;
 fpr=D818ACDD385CAE92D4BAC01A6269794D24791D21
X-Endpoint-Received: by B4 Relay for me@black-desk.cn/20260831 with
 auth_id=991
X-Original-From: Chen Linxuan <me@black-desk.cn>
Reply-To: me@black-desk.cn

From: Chen Linxuan <me@black-desk.cn>

I can not access to my old email account any more.

Signed-off-by: Chen Linxuan <me@black-desk.cn>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 1f5540bc33f1..9beb83453167 100644
--- a/.mailmap
+++ b/.mailmap
@@ -195,6 +195,7 @@ Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>
 Chao Yu <chao@kernel.org> <chao2.yu@samsung.com>
 Chao Yu <chao@kernel.org> <yuchao0@huawei.com>
 Charlie Jenkins <thecharlesjenkins@gmail.com> <charlie@rivosinc.com>
+Chen Linxuan <me@black-desk.cn> <chenlinxuan@chinaunicom.cn>
 Chen-Yu Tsai <wens@kernel.org> <wens@csie.org>
 Chester Lin <chester62515@gmail.com> <clin@suse.com>
 Chris Chiu <chris.chiu@canonical.com> <chiu@endlessm.com>

---
base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
change-id: 20260922-update-mailmap-32043bd83fae

Best regards,
--  
Chen Linxuan <me@black-desk.cn>


