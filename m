Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B636E44CAF9;
	Wed,  9 Sep 2026 07:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940243; cv=none; b=Kpyx9nuvUE/3trk27IN1u3jwrfbRfxGVFM0gltuAcD5/NeKRN3tUNQaI8CmjkwsIMQ3GZyNjcDB5ZM50qrSbx5b3yI/prk9Y/5uxz3H78oQaVi9yjFNiNBXqXz8gSf2LVKT8cg2OuZJMytfG9g41djWaF+pvbZCh2i7WUG9hKXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940243; c=relaxed/simple;
	bh=SOBCqv5yP8tlp8Nw/rzUxjWDe8VSfwdPjX+kWI/Ds7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FU3srpHHcwP7D6MSOSltF2OIHd/bwO9LzQPHk1CYCpzoGmcwijNtCrQGwtxxsNPZCmMSWOlM9GVAi5XPEYq7/35YE/1KMx5nC1ci578H9spYBkKjKFERqaZThU7BV+29tXoXpnEsqZjCSeHoefJN3Qy1xMS08H80+pqYOlSK2nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icwfvbXq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icwfvbXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1B51F00A3A;
	Wed,  9 Sep 2026 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940242;
	bh=o66q8DA9SJs5JpLZoD2PezP37n/9lfG1QISEwEg9soA=;
	h=From:To:Cc:Subject:Date;
	b=icwfvbXqh2951d9IURKua3PGdK+b4y6iHrh8LIdfWo6QrbuvfsFmx/olXa2CmPW2q
	 xTeW2X0i7SeEYakJQ0vV5jgyuZtOMm4kqqJQGqt3b2KJn4tMIzM7N77W5BM3LK7PaR
	 sY6BjakqT8XUXmkIbd7NLyxt0jlad5uU21wW98hinD82alGwne38h0MgHC6PAtFZyC
	 gxH8naZGGGxNqnNCtOeALQnOGFaXOyaa07FQNCczKoUo5vIOyogTl1E7crl796iHqA
	 A1cEFb06rdmLUmI0vH0Xzn65disQgx7A2JZVqopJwh9P/hjyrI8ToAv+UqP3pQzL4I
	 QJUH2LobLCkuQ==
From: Thorsten Blum <blum@kernel.org>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] media: i2c: isl7998x: Inline i2c_check_functionality() check
Date: Wed,  9 Sep 2026 09:50:33 +0200
Message-ID: <20260909075032.409159-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=874; i=blum@kernel.org; h=from:subject; bh=SOBCqv5yP8tlp8Nw/rzUxjWDe8VSfwdPjX+kWI/Ds7I=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkL+U9sXM60xNw/WEZI9ExC6YKLAeFc7KuNJ00XO/3Gp ks1fBZHRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExEzJ2R4djjjsOrNj297uh6 xTo2e9mScmWD52qbnbseyms2htrVGjEy3FHWee73PdxBJLux/ruaWKrsp5p2a/Y1nAEiF8W+8Kr xAAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Inline the i2c_check_functionality() check, since the function returns a
boolean status rather than an error code.

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/media/i2c/isl7998x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index a77538d2343c..8244d4296a02 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1460,8 +1460,7 @@ static int isl7998x_probe(struct i2c_client *client)
 	int nr_inputs;
 	int ret;
 
-	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
-	if (!ret) {
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
 		dev_warn(&adapter->dev,
 			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
 		return -EIO;
