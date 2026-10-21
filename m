Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579191;
	b=5Ugw0pi/5TfRp54WTwPI/ik6AcHAJfpIX5IrlVerUD2Fi8m8N7LB5bwV7QJf/UaJreQB
	 cDZaYaPMpkGNOXfob/QjubBP0BUXUaVJw3Fcn1wMklKuTanNglkU9t4j35I+A2b4WJMWZ
	 zI/1suEPYXqUYJKA4MiRFWnYkYsxtftflG3p+NWsrf8bhg2Sr+Ves3jK5EIAWXAhshfXQ
	 CiF6Y0KFdJbqPKljcNrUnBAl6j3tpPsFDkEqvgrV8C+oDcS2ZqTDAkIg4NQp7+R+c1JcB
	 D5yvTsx6iVSFxS54bjpPwRYQbnt5Zkm8Wy/xTfEyMIV0+BnsmQnWL+hqL8zWGt6QpiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579191;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=+bOtnolbvwVEQRpUVruT+es6N5ry2WqIDrMbY/v3IyM=;
	b=J8nak9qR680VRZ4YGAi2K7Cegai3Cq5k12SPJlwr6BdxG+Hn+lxi6cqFFkc4tsTBHmIM
	 P8Z4Fh3F5zdyX51HFWxqgMbk9PrB8EhGXjEkKJQR1xZWuVAz9IZk92OuxuQYUZliQxIwe
	 BbIvsFVVbuT1NPyHARo75rCF08zkE52DW9+C+uhlM5koTVT3c+mxRrmKCkZ3IICrg10TD
	 arjTP+FYB3ABiv+cvSmAYgCypnkwqyUSE4X9iczHUs+HQBimZn79QCVF2UwTVozjJguEy
	 BqzfKuPgCaFQQgQfL+Q9q6Lr6xpVsKTqrbev7HjZvvPjpvSSdqGW3NafcV0LEQUNitQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJQaTsSy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B5B606A31B;
	Wed, 21 Oct 2026 10:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJQaTsSy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9C31F000CD;
	Wed, 21 Oct 2026 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792579191;
	bh=+bOtnolbvwVEQRpUVruT+es6N5ry2WqIDrMbY/v3IyM=;
	h=From:To:Cc:Subject:Date;
	b=fJQaTsSyt9df4Xgc8Pd0Yg8BDyYlDgqHHjcXJ3R/LC2QnijYgm9gk7iqOb3Qj2uVI
	 Qa3L60+vS/uE385w5jwTA4UCvY8fqvIWAD5VBm6n7cK12BMT12JU0t7YXNgN0ZJW8w
	 wa36Ta84FBczOqqvAgqZuYro83piAikdrvUYkLAWka6xJQQl6nYLnrobuJ3HfJKs3X
	 guKilkLheLdScFv53PbdbZtd1tLCSO7WEdRfP5q8GL9zX52GowNdYjXUmz0U2K8yMN
	 QA3zwD0W+G4rmh3719QULHfJx5Er0U6gg5suhbk26Q1YblT4zdRh0M0ZFoJkei2Z6e
	 dCAMvfDuZILIg==
From: Thorsten Blum <blum@kernel.org>
To: Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: caiaq: Use strscpy() in snd_usb_caiaq_input_init()
Date: Wed, 21 Oct 2026 12:39:29 +0200
Message-ID: <20261021103928.131918-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=blum@kernel.org; h=from:subject; bh=jdhGb25BjbTTHlUy8yl/61MD6kBd49iazqi2HnxGTt0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk3piWUqcdI96UfES04uTtJbKPy9OtCR3JTS/3lPNhsD 9TNmNLeUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABO5GMrIMN0vjnNGX/mclv65 7i7nVU3+hP43lqsWOVEy4/qVI1V9fgz/FJb5/Hmz29R5H+8zm9ZNPdaWyRvDdATuvN++/ejGl/s XswMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

To prepare for removing strlcat() from the kernel [1], use strscpy()
instead with the length returned by usb_make_path() as the append
offset.

No functional change.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/usb/caiaq/input.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index 8d924330c54c..e2aa09d3de61 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -605,13 +605,15 @@ int snd_usb_caiaq_input_init(struct snd_usb_caiaqdev *cdev)
 	struct usb_device *usb_dev = cdev->chip.dev;
 	struct input_dev *input;
 	int i, ret = 0;
+	int len;
 
 	input = input_allocate_device();
 	if (!input)
 		return -ENOMEM;
 
-	usb_make_path(usb_dev, cdev->phys, sizeof(cdev->phys));
-	strlcat(cdev->phys, "/input0", sizeof(cdev->phys));
+	len = usb_make_path(usb_dev, cdev->phys, sizeof(cdev->phys));
+	if (len >= 0)
+		strscpy(cdev->phys + len, "/input0", sizeof(cdev->phys) - len);
 
 	input->name = cdev->product_name;
 	input->phys = cdev->phys;
