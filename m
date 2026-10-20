Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.90.104.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510763;
	b=fBy0WcvJgs3XxLw1CIQkOFr+kYICvhieoTXqVY9mUlPCB72es2oeEDjk7AbafMdorFHJ
	 JQU/6HZO4YQKa65cmE2HWoGHh4nnsEuzK9M4nV4d6bEN4PPfprADpbzds35is/GQAYWw7
	 1Lh2Sa1j+pifrfPw2zBx7R2/clEv7KkujSv3PjSDgrzhZ2+JlYwqnKwH3U4sFjtkiOk/T
	 NNCjCNzVi85JCWX3zwvj1ms/YQ5Z8Eys/ok+kkvcw+knNMdSPkWODc3GwRqGb855mLOAs
	 +yYPUQoZ9z69AmViESsEJr+xGJYlUrTc82KFJz4LwWrWPlLIoudPmHI27SwMSabYRpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510763;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-Amp-Result:X-Amp-File-Uploaded:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=hW8AG2hV0n29KjgMtq8hTerS5/UiPYe5DlpQ2gjroIc=;
	b=YhYYP68u+sr+vHh3xFZl2ZSm7+zICLd8Gd8OWpEu4dLHs0HCqnAmRPA3Qn5Wcc0RsWrQ
	 WcNmres0b5/Hht08Q5rnGzhigbhVi6b4p5H1io7E+sxDJpCCCIWhP5k3gruoGWIaMg5KQ
	 UzDQI9nA0KnjnpcqBb56A9kFP5MS7XXiUOGxqfug+8VzTYc1KuuGNqeiKi7xLDHyzmMD7
	 mTOumqUi7hoAke9GAR+IfT1tnT2myw5L9+mc3rI0+2k7BVWOrKNZADS3JWUP6MgwqJwFv
	 YwqvMlhgnTLdi43ogo5QPmSDl+G8xNMlESnlX/c2tgOXqZr9i3lJYmM+bvUJvnJqGxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	arc=none smtp.remote-ip=23.90.104.147
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com [23.90.104.147])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03FE60A260A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A03FE60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1792510762; x=1824046762;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=14bpOD0CALcJBHTTmAKQeDaGQ0pZ38ju38hDe+pPRH8=;
  b=aTUzHAdNG06HOBrmTHeJR6TMA3jXzZ7kPWky820HGJ8F6O/CK/dQ8gu1
   fncBky7QZl215wRBDuGzrwutk3oZfUClZwCTNayTxV9aT+q9UwfJqXFmS
   q3rV1P6UVtMBbsuqRu9xh4ghPWz5Kp5hhMF6fqC1gwO5j9komnhORMHvX
   GkZXqYpAAIoFlHpUYoxwD2maeYkwY6pMWRfAVHXqYMYMSXRB5rdm26Jpj
   2wlo5HqUlTA5KOaoJtxKeqGCmuP6XAt8JU5ATCM0PWoQXxVuZdWdFzxEx
   3cP1h+idjd33/OSaFbzEiTa8mf7Tm8gyyy2eYwC6tj7G2Qranwk2L8wJx
   A==;
X-CSE-ConnectionGUID: HtOr2+v/StKuF4ZqYoHW1w==
X-CSE-MsgGUID: eqAANhcpQ3qUvz20PNNPGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 18:39:12 +0300
X-CSE-ConnectionGUID: OBcHHMnaR1ydp+p9Dua8Nw==
X-CSE-MsgGUID: ya/pOhRWT3ek/Nt0gSKgLQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 20 Oct 2026 18:46:48 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 20 Oct 2026 18:39:11 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 20 Oct 2026 18:38:48 +0300
Subject: [PATCH v5 1/2] irqchip/riscv-aplic: do not mark the syscore
 registered flag ro_after_init
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-aplic-async-probe-v5-1-c4861c2aafca@mobileye.com>
References: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com>
In-Reply-To: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jessica Liu <liu.xuemei1@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0

aplic_syscore_registered is marked __ro_after_init, but it is written
from aplic_probe(), which can run after init. With MSI, aplic_msi_setup()
returns -EPROBE_DEFER while the MSI parent (IMSIC) is not ready, so the
later successful probe writes the flag after it has been made read-only.
That write faults.

Drop the __ro_after_init annotation so the flag stays writable.

Fixes: b330fbfd34d7 ("irqchip/riscv-aplic: Register syscore operations only once")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index d9afb6ae98cf..5369078f3d00 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -116,7 +116,11 @@ static struct syscore aplic_syscore = {
 	.ops = &aplic_syscore_ops,
 };
 
-static bool aplic_syscore_registered __ro_after_init;
+/*
+ * Not __ro_after_init: probe can be deferred (e.g. MSI mode waiting for the
+ * IMSIC) and complete after the init memory is made read-only.
+ */
+static bool aplic_syscore_registered;
 
 static void aplic_syscore_init(void)
 {

-- 
2.43.0

