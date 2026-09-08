Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180DF577E2D;
	Tue,  8 Sep 2026 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882865; cv=none; b=KAZoFyD1nGM7Q632IjOz2/Y+tMNT081Joh3pE7VXC+eB+KZ64ODKK8zWdXl+E892ltzv2m2e7k3wsFr1RkGmG6xbSyBs3v1yb4IdIaaZ8ThtwZ/DOMHchkTP46EjrVOmhZQ4rxuMt+TKINUX5NqiA2KbPLqJhn839/5nX48aQk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882865; c=relaxed/simple;
	bh=cNSLxQpumDpMN+2t5KQ0IZFyQ4Xu8kpWd341l0+fKzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8JgGn8Ur8PGc0M0LSWwRbdE7cXK4Kgn4aasO2PHtJRMYlKewoiEDQVKvMELRM3ibOg+bwnUQxzG+e2+5NwvUTO+ztE4i7HDsVmIIbXdo0GrkpK4xyZ+hvtbbuBs9fkDPmqp5cAxteW+Xu66T84U05sRpw3PQGR4Gi3pwQmc56w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=WkUwr8gb; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=rAy5tmtO; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="WkUwr8gb";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="rAy5tmtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882856; bh=cNSLxQpumDpMN+2t5KQ0IZFyQ4Xu8kpWd341l0+fKzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WkUwr8gbTrH5dXmcMpYdXga4SxYluNSwPERieLro9faePljXYt+owdBbvxvI6fLd5
	 twA1xogk+wvzB1b7CgaBKABWZpCj9gSHyuX+VszpGae3cg/ySjVSx/GsbUm0hUGuj2
	 wlNoObCn0VZhRhiXR9Xm6Q8hwL3xnwXNfBL1eAfyAfHxdaP+QWVuVXX5HmSFoF1dFn
	 kav5zTMAJYVOU2lKQ8ZDkv2QsnwJarSdi5J4NTK8Kdxhj2zocynpCRSbC+qYLoI+Lf
	 bBQnNlLL5LPzkcyJWchJCZB+PJL6rUNawnJvHiKsrTo3RPA/YfvTtMw9oFhxbqI/3S
	 9tp9vGMaeJGYg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 3C9764144E; Tue, 08 Sep 2026 16:54:16 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882855; bh=cNSLxQpumDpMN+2t5KQ0IZFyQ4Xu8kpWd341l0+fKzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rAy5tmtOL798yTVXr9l97BcyQiKLOz5ah5vM/PcIDgiJXUU3ILkeFQVAGMeVqMndx
	 KxSklbNmr7ewjo+MqIhFu0YGXFlbUr4CKpSwSMVijujt6yKNt3tbEx9WyyTKSun+iQ
	 ooC15dz66JXu2ScIrXngi2YF+mU7Nd5ewWmMHO0sZDffo8bU7/q1+yfXBaqqy16VFl
	 r8tPbUSSWLTl+tTEmEixfIm/LCYOlUUfHppShMSIiYFWh0ZZlglusL9TaScBJ9l4LH
	 XG1t7AzNM1pIcvOTTP3KJsA5GIU4X/ZozvckR3kQ/K2n8xhhB49NNN+LILf4nlAB0D
	 4FGlPGq3XrTkA==
Received: from maru.home (host86-150-50-53.range86-150.btcentralplus.com [86.150.50.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id AF1A44146D;
	Tue, 08 Sep 2026 16:54:15 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/19] media: mceusb: Remove unused field
Date: Tue,  8 Sep 2026 16:52:02 +0100
Message-ID: <3394132ed4e888bca0b0d99de4d60738f090250f.1788882189.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788882189.git.sean@mess.org>
References: <cover.1788882189.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Never assigned or read.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mceusb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 39ba7f6a2549..356a54f91d05 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -484,7 +484,6 @@ struct mceusb_dev {
 	u8 cmd, rem;		/* Remaining IR data bytes in packet */
 
 	struct {
-		u32 connected:1;
 		u32 tx_mask_normal:1;
 		u32 microsoft_gen1:1;
 		u32 no_tx:1;
-- 
2.55.0

