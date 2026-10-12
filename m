Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420431D72E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810652; cv=none; b=aajI03gKbJCD1AGMRlaSngkKNz69/xDlSNu3siQGnIBGSa19Vd81ew/74y+mm+EPd0aZ1lD69dKQhFlX+mP74MXIGlDDQjwQ9WiFLo6AsGUO+uT80AKNZKWOh6snsikVh+UjqvUng2cjGun+o0hdWtrFe+fdHBHh9EUU4LtXeIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810652; c=relaxed/simple;
	bh=0zGqnxcTw8CSsdEVAfPNEs6gV6x59mhwkpkLaQyL3mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tk2U5UFq8ODBiPMVHtcdH9rq/CkBOHxLC3TEDl9cK12q5BeY/hVuRo3QER8/dhQyWkT6rlovNTIQvpIe4QrOGCpk4YRwcJ3CvIv5lAtESCTeNhSFarzGdUIkR7khHv5cgQMJAPFLNQzDl5UpWcBfr5YFBrLUSvB49miL3vVsN6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PERdxdZo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PERdxdZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0D71F0089B;
	Mon, 12 Oct 2026 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791810651;
	bh=NijKU7/kVCJxWzHrMYJ3511ChXRKoGphfZ0JzSxjyOM=;
	h=From:To:Cc:Subject:Date;
	b=PERdxdZopzvTvLjZheKeNiyCLTVyz38C33lnLDKawIJ5O7t6p/ZC7yJxW2j/YMWeS
	 kBCknngQPDqCphiVKCPWq1j97cBJAM4xMH13oBTkS5r5rfFbKFugg6DgfsUC4aQCL7
	 n9bbHO5LemGWkIUrXZ4USHqa/rtLjYcsgUntrS6zq01lt9o8ciEdUmwDfe1GnqXZzH
	 ptGFG+IM5swTt9I4cxkTj1QBGhgtQVZSoAO8aPaPoTE4T4oJQdssig/jcV2aVLsCnX
	 XpCw2BTEE/ikc80+aq6Ee6ztxkCQyXr54tmLhPY53Uf7qDQRsyyOSVyLMJbVQ5L5Pq
	 lCgAnEl6NHzMA==
From: Thorsten Blum <blum@kernel.org>
To: William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>
Cc: Thorsten Blum <blum@kernel.org>,
	speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] accessibility: speakup: Use isdigit() in handle_goto()
Date: Mon, 12 Oct 2026 15:08:05 +0200
Message-ID: <20261012130805.345080-4-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=778; i=blum@kernel.org; h=from:subject; bh=0zGqnxcTw8CSsdEVAfPNEs6gV6x59mhwkpkLaQyL3mg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlnbm+NaVGxjI5xuZZ5PXqn9bNd0Tz60SsOSCXNXOD7z /ZvUlpbRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzEypjhr2jZlssbNe/qROi7 /eT59qNWffHz/+u3d+wPFF7OF3W2/SzD/2LBJKM6N+HUgNNts7/cSLf6tnNyDP/+HttLsZaf1B4 dZwAA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use isdigit() to replace the open-coded implementation.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/accessibility/speakup/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accessibility/speakup/main.c b/drivers/accessibility/speakup/main.c
index e9b7c2761f6f..a7c14531f2ce 100644
--- a/drivers/accessibility/speakup/main.c
+++ b/drivers/accessibility/speakup/main.c
@@ -1980,7 +1980,7 @@ static int handle_goto(struct vc_data *vc, u_char type, u_char ch, u16 key)
 	maxlen = (*goto_buf >= '0') ? 3 : 4;
 	if ((ch == '+' || ch == '-') && num == 1)
 		return 1;
-	if (ch >= '0' && ch <= '9' && num < maxlen)
+	if (isdigit(ch) && num < maxlen)
 		return 1;
 	if (num < maxlen - 1 || num > maxlen)
 		goto oops;
