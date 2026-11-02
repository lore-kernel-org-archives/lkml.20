Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635260;
	b=gziGFH6rj2BSiZx3sryrBjb2+5lE0o5OZnLQhQXaaIxpqjtGrThNJ72Sg4ZvpF3lriDT
	 IDkPcAs6pU6y2MOzT82zU84ijJyfC4R2PiLUPKg6PA2zOhgzc6khNmT7KYclqkXunXSP6
	 HE/AKfJTqm/uNO72bElV3Neap5MqAGftzSPTMzhb4VDq1msf2gBEZq/PNZiLs+YJbb8rz
	 F3D7zg6nlQcig2Y+UVLppR4UpoY6K9RSUzQW0Znig3xW3bxpRBvZd0AWr2Gt9ABNM/ttw
	 T7G/F/ChTXj/JHph6hMq1+anlcfYudkvZsrLsFEp0xjYaiCZqO2ZQnqIaJ8q2G22miQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635260;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=z5QV5L82RZqkGo+Xib9FWyLYFkdUwf8EpOyH+r/MAgo=;
	b=JfJFGw9cWLPbf5uHIIO3j8FD3Vx0gZhgLiUz2Bb0S+7QVUG5JfDcpwlJIpmGBZwL7Jjg
	 mZ8IPohUNlOriFnZrkAYyNnQjeZ6JUVsA1aEoCgKqt9udsaxvxK5bFce9Y+6yehN5ZFXC
	 mefIIZ8b+QipUN57wqGbdpPmC3jEZAmcIRB2A5R/oX3fPj12B4M/iot7mDJS2C5KLXDet
	 su4vMjfi50BWKlYVOM0CpPcVkAM1eR7qxcXXmLNI/5SHy0/qqgSM64GkDhv8IuT4PzBCY
	 LqRCCCVeRzs9ig7uh/PpgHvnSGCsRj3F9pYnq4wqncoteERPv1SvNuXGj5AnV9TaKSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxpNYZVX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A36F6075A6B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxpNYZVX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6191F00A17;
	Mon,  2 Nov 2026 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793635259;
	bh=z5QV5L82RZqkGo+Xib9FWyLYFkdUwf8EpOyH+r/MAgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dxpNYZVXFwTg3hLOetLtIPkToDdxt20OIH95SmHIWXk87RGsjxBRTiTtfvaXr+dRB
	 5rZWe9iD/P+ckHcsv54YbopzM3/b1bdUDSJxNLvrjQB+HKz7H5GkqVyVOWc8uXp8yi
	 EoHjKgmQ4r4EpITAHyehb70TLFbNyiRjJVjZTDWt2W2JVb75uxbIgX2h+yF/+Q6zKz
	 iQXYd39rk4112lkHswYJmKhf56LDP9K271/Ak6NQOC0tgy1q/lYIm99bwOUDjuqiln
	 46+zKOqSjAHxGhKid06PxTR1oYed9ldY8QsagopSsCeXXrJA25l4vzZxhtCp5HWSck
	 tZHTP09deXsBA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH 2/2] reset: Fix circular locking dependency in reset_controller_unregister()
Date: Mon,  2 Nov 2026 23:58:40 +0800
Message-ID: <20261102155840.20376-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102155840.20376-1-tzungbi@kernel.org>
References: <20261102155840.20376-1-tzungbi@kernel.org>
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

reset_control_acquire() and reset_control_put_internal() acquire
`rcdev->lock` inside the `rstc->srcu` read-side critical section
(`rstc->srcu` -> `rcdev->lock`).

However, reset_controller_unregister() holds `rcdev->lock` while calling
synchronize_srcu(&rstc->srcu) (`rcdev->lock` -> `rstc->srcu`), causing a
lockdep circular locking dependency warning and a potential ABBA
deadlock.

Run synchronize_srcu() outside `rcdev->lock`.

Fixes: 44a0acb2caca ("reset: protect struct reset_controller_dev with its own mutex")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Test:
With "[PATCH v2] reset: Add KUnit test cases"[1] applied:
$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_RESET_CONTROLLER=y \
        --kconfig_add CONFIG_RESET_KUNIT_TEST=y \
        --kconfig_add CONFIG_PROVE_LOCKING=y \
        --kconfig_add CONFIG_DEBUG_KERNEL=y \
        --kconfig_add CONFIG_KASAN=y \
        --arch=x86_64 \
        --raw_output=all \
        reset_test

[1] https://lore.kernel.org/all/20261102155207.19252-1-tzungbi@kernel.org
---
 drivers/reset/core.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 1f6d7ef48a67..a36a4d6ff445 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -179,6 +179,7 @@ static void reset_controller_remove(struct reset_controller_dev *rcdev,
 void reset_controller_unregister(struct reset_controller_dev *rcdev)
 {
 	struct reset_control *rstc, *pos;
+	LIST_HEAD(reset_control_head);
 
 	scoped_guard(mutex, &reset_list_mutex)
 		list_del(&rcdev->list);
@@ -195,12 +196,22 @@ void reset_controller_unregister(struct reset_controller_dev *rcdev)
 		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
 			kref_get(&rstc->refcnt);
 			rcu_assign_pointer(rstc->rcdev, NULL);
-			synchronize_srcu(&rstc->srcu);
 			reset_controller_remove(rcdev, rstc);
-			reset_control_put_internal(rstc);
+			list_add(&rstc->list, &reset_control_head);
 		}
 	}
 
+	/*
+	 * Run synchronize_srcu() outside rcdev->lock to avoid a circular
+	 * locking dependency with paths that acquire rcdev->lock inside
+	 * the rstc->srcu read-side critical section.
+	 */
+	list_for_each_entry_safe(rstc, pos, &reset_control_head, list) {
+		list_del(&rstc->list);
+		synchronize_srcu(&rstc->srcu);
+		reset_control_put_internal(rstc);
+	}
+
 	mutex_destroy(&rcdev->lock);
 }
 EXPORT_SYMBOL_GPL(reset_controller_unregister);
-- 
2.53.0

