Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635257;
	b=rs4yWw1by8+LjPIhI5D9BE3aaEPjVJWBrAe8Aw4RInBN4brzUAZdHKWXPSKUmEgSa4DE
	 jFrX1tM44vERCJ5EHk7W/YMiceINzLmjCvq7HKomlTzZgW/38cdukPyHLA9CZIcp0YOUS
	 InVPfRiWtdrFmNiPW+92zZ+drY13B9Zu8MjjAbjCMZxChvf/uyIRYmovCnVhwsKzI/QLk
	 WlSlZ9Na6+h1ANMdRFZvZMSWYZAooE8PTFSCW/wado9afPXvk7sj6kd0qGJxMEXwQHqZj
	 DUYh3hnN5PK1jw1qse7JRjKYD1IBJMLAqw9cPcqjwyfl0gyRStC9lO3MmnemBr8ZUbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635257;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IgmL7KoazEO+N5k/G7mhejGu6n1VTdMXQbMqN8Tkwz0=;
	b=TQd8JcI+QzyCyc5/MyiEyJibOUTrsN1ZE7XJ79VeguOlTnkbrDxX/Ns5yIPScHInJm6p
	 JsXOOgyy0qzuMvsP21ScUtOl3wQKEY3BOFAgWSRJCs5g/Lz7ip2Zo44SjuuJsohueEyol
	 jzCRroHhUMMrb39q6x/3RbwubSY9MaQsb7r0bILnpT/YHH3cSdIxyhnPvGqaZO+OhwydV
	 PkAiB3oM7epk8vUe8TaiCK4Xabh5eOMpZjLiZgKesCa+5ofqaDatFvcz8J9Yn77s2gl03
	 /9wrnVbiBkafapQUaS6E5ez10tY+8ijsIjZ0SDSSCibJxezPqjdRbW5LYNeFBUC7uHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cb1qf98L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959E4606F229
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cb1qf98L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502F21F00A1B;
	Mon,  2 Nov 2026 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793635257;
	bh=IgmL7KoazEO+N5k/G7mhejGu6n1VTdMXQbMqN8Tkwz0=;
	h=From:To:Cc:Subject:Date;
	b=cb1qf98LXFUKmpBroetL6jIOCgsLPPcJ6pOUY9rv8xIiTTh25eghUEePHQyUQKv5p
	 txV9diATe67KB4ikwod3l2Ib8KzzJcsarOivKkoxqm0C92H/CyT91/SE3QTjQVZYuj
	 f1NzjE/nAFdncgW7kq1WkjmAJLHKLyKjJN7WchwnYS5cjWaVmRcJrFabrj4qWOgtZG
	 2i5UHObJMlVnr0JVxQe79mfiuaLvzie+Y0VDT2SbatQj5sHrWfYmMqAMehEIi+kd12
	 Lmc/3M7BObP2DJyVfa7TfXyR+7B3oYrruMWtrQkRvjzlfv0kY9LpMeq9+sQlQigl5E
	 exx8nXww5ZPdw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH 0/2] reset: Fix issues reported by Sashiko
Date: Mon,  2 Nov 2026 23:58:38 +0800
Message-ID: <20261102155840.20376-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two issues in the reset controller unregistration path
reported by Sashiko:

- Patch 1 fixes a reset_control leak when reset_control_put() is called
  after reset_controller_unregister().
- Patch 2 fixes a circular locking dependency between `rcdev->lock` and
  `rstc->srcu` in reset_controller_unregister().

Tzung-Bi Shih (2):
  reset: Fix reset_control leak when put after controller unregister
  reset: Fix circular locking dependency in
    reset_controller_unregister()

 drivers/reset/core.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

-- 
2.53.0

