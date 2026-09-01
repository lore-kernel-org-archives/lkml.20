Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5922936CDE8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299886; cv=none; b=MfAGdMQO+KumYjR6PXCkIQaqA56wUR8roq5Ftj+y47V8C4ciT/2DhJk15nqEkLSMuq/osG3xQAy2vynjr2t64ubhgA3LhU0ouc8HMHS89BBsWwz7DU2X4AF1xEwnSmSVncAlDij4+Zglm3qhqQEXIf61M9wMZ3SUbM7nMreiRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299886; c=relaxed/simple;
	bh=S4/XYaQBmsTXcBOWBfylkSBcK+FzvN3SJbhHC6h5Bv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JHleD1jfanE0LhvYrJ+xa9PxRtv1Hi5i1vH7pUBoBYOdz14GgglMdJW87N0mKWl6sjAiVUwZLs5scYx1PpfXt2Khj+rIEz4AF/4VZH20dmnJdjHR6Q8Pmf8j8GJ5GH3ICQN379CKy6YW6Vkluz88LR1pGcxwbYL4vMvc2VsEV5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2C0zl+C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2C0zl+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63B71F000E9;
	Tue,  1 Sep 2026 21:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299883;
	bh=4vHn7/2a5h2q8YzMRqoZoSWxZ1E6OwNwylgE59DXoHE=;
	h=From:Date:Subject:To:Cc;
	b=n2C0zl+CVfjHUXYAvjBQUOEHNKAtn6eNVYyPjzcW/OU9AaCMqpJUl86YwXvRO/q+a
	 Dr9p6klW2abNC9eKPqv86hg6FZd7GvkKpXL8BkoOkf0pBYP9QtrBcBcTiiVqqwWMT7
	 P3VUMbKyBjDgig1KIRPouoo+gknwMri57wFJx+8puM6TY6o1Vk3NGmcyq7NTxr6ulT
	 Gs+bz8XDhMwL5dH8GxujIbm57/lAzQUsJFnJ+vgAyrZlR9sigXX7QCUdbRE+F/lpMI
	 DFcAv7lSUf3tl4fwz5gs+VajX9nIT2keQCfF/2zJ9uJ9YAHKS2czRJ0i5kmQy81Z7R
	 PPOYm7KadGO8w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 22:55:42 +0100
Subject: [PATCH] regmap: irq: Free the irqdomain we create
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-regmap-irq-deallocate-domain-v1-1-4bfed4aff559@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN1Jl2oC/yXMwQ6CMAwA0F8hPdtkm0rEXzEe6tZhDWzQoTEh/
 LtTj+/yViiswgXOzQrKLymSU4XdNeDvlHpGCdXgjGvNaW9RuR9pQtEZA9MwZE8LY8gjScJoO+N
 CezzE0EEtJuUo719/uf5dnrcH++V7wrZ9AO39EwOAAAAA
X-Change-ID: 20260831-regmap-irq-deallocate-domain-f1902d654fd9
To: linux-kernel@vger.kernel.org
Cc: Farhad Alemi <farhad.alemi@berkeley.edu>, 
 Thomas Gleixner <tglx@kernel.org>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S4/XYaQBmsTXcBOWBfylkSBcK+FzvN3SJbhHC6h5Bv4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql0po4j7ZfNtgjXjhiFt8eAXXOGwKayXLUd4pm
 pi3c858/0aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdKaAAKCRAk1otyXVSH
 0BMiB/9duj+PGE7JqtNeKnw6fER5POGDycpKenfQUcrxEemh2Wd6bYlG9q9fy2METOlHn0GGVCr
 p3bvqT32h11Zw8E2QpCvZSk9S/ehIZy8CS27kdFcwPc3Z5nSgo6TASp0xe661PquffILIp2Slhx
 J6mdur8mT6HKL0ruByj8V6Tp8MACOBHFNt2RFZX8frJT1VMCA1+By51h61ZV2wjnCjNbqQgg2wA
 XTPb9aNleYIEUiv8TqadGdTIvEYNv4LDhRSrQwGKRMjSHLtUprD/TAEsHoVFjO2ItfMpBKxSnPj
 bFY/O1z+HR+ILWbk+LTVDtihIpsc5mr/XACih/OvGyXqUpHc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When domain support was added to regmap-irq it was not possible to
remove domains, this was added later by 8ee99ada293b (irqdomain: Support
removal of IRQ domains.).  We did update the main removal path to free
the domain but forgot the error unwinding case during creation that is
now in regmap_add_irq_chip_fwnode() after some code motion, meaning that
errors during instantiation result in an unused irqchip being left
hanging around.  Add the missing irq_remove_domain() call where the
comment says it should be.

Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
Reported-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regmap-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 99b55b1053ee..715eb9e7aa2a 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -963,7 +963,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	return 0;
 
 err_domain:
-	/* Should really dispose of the domain but... */
+	irq_domain_remove(d->domain);
 err_mutex:
 	mutex_destroy(&d->lock);
 	lockdep_unregister_key(&d->lock_key);

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-regmap-irq-deallocate-domain-f1902d654fd9

Best regards,
--  
Mark Brown <broonie@kernel.org>

