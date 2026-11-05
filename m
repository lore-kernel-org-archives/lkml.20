Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892435;
	b=4JTbNAifGQtFXUBq+0XlCYXgZzba0fYMgVVmSTHf++z/Gjr7x1oQU4g5EkF1B/Z4/VQv
	 u6bs6SZvCwc3F8p2loJHcr54Fqfw7nWHSWeYoqUDo7ecVWkmolLYpT8QjxrkBZXnzRoU1
	 61QB7xxDNgAeUGzHWkUhlF0Le2ovSwe1bFc39NNYALrNBMg6dMVNln+muY7kcANq8v+CU
	 RZfg9RJUhL8QX08iZTwWBQv6boW2dfbVrSO3bC+6AGZ+/WtTOYr+EEQAvlbwtxS9soutm
	 LYbBWFcJr/nPdaFTwAXQJGjznVTZHTL8U7vMSusF3ssTdnmxVL0ZBMzr4DiZsc4KWHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2ansoqDUpGjBC5xJnIjBsV3PFVQvwHONv8Li7jiJVoU=;
	b=cRqsVMp23phvBJtK48ilgyLhFurd1dvutoUOAiyjPzAwsDTWDWPULn3fHKJ0i3WJFCor
	 u55ldisWSzd3VNZnlXWfqTqmL07J7p3+njBiqQZe5yYNwEHu/4gnkU8DsptmpKUIfVDie
	 nPsYWzdfZhPTmoI5iTY3R5TPU6/nLbGDqOAUA/aGDr4QcovqcO1rH+PzsoS0zL83oL1nQ
	 1rNrx9ISpro9gUxdoh1Ut2N2Ngk2W8OLCqv6DkI8B+yqYzzGLh0TEdNYOJ7gewZZzn0Wj
	 BeZb9HSsay9csBaGY8Zf9OE/8W2hFM8VY10Ks6jFfCzYYPkDrqJ3O6agdpNHCpUm6JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=QfObJ7a0;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16533606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16533606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=QfObJ7a0
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f1e5d7450so199512385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892433; x=1794497233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ansoqDUpGjBC5xJnIjBsV3PFVQvwHONv8Li7jiJVoU=;
        b=QfObJ7a0G0zPB+wR2boS2HKagKATPMK0b3y64QcnoLsJWbdS2ikVBze5uU1RUjqobE
         mIwEAooueJ7AkdkqRBg7/jToz/SjyKKvMO32JqOsaGcXrpKr3mEtgApmOL25F9xuivpq
         KLgEvARdmfBUILJzCyLltfZV9Q20jgNkNUS+wKaamkkDQMNB3KcewZMWXW343RyQl/9M
         /+jp1JRRmVsFg+YgffcDtgwF+hVECWB2aYzM9cCjglnScyloWIoX1sBj14hAezxt0s8d
         gywOHtqJfALJmbJlsQWAi0M6nU1a1gbNB3XOM/IH0QOpDT1lBFI3NYNHRWZKK3w6leAA
         DnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892433; x=1794497233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ansoqDUpGjBC5xJnIjBsV3PFVQvwHONv8Li7jiJVoU=;
        b=tH9+qM87x62zC/CrBzdr3tVSRV2blvB/ocl+xsJAciyOpUK72hHHjjDe1XnBCAICoA
         WU9sdzYCDQgNrgLyQ03R7zwukFFikmTuB9fnD9kTg3JgxAVZu91eVlbAcDOBLm+9P+/E
         MxiUmCzr3YafxcaB9jU2OfU4X7tSaYa1hmjqA8y/D/tkHu46dYfd06ack7+sS3vmAzT5
         HL1e+A8TbzVojxtUU92Vw4n1HktBIWEM0SGnWhNHIoHKixwc6/mc1OraX4Q37WArn/MW
         CKouv5uUU4NlstaQYHiqGhCTQcGZ3qm0WPgZ4AQc0tB58fyUSe50DmfWonuFYMr32H1L
         TWwA==
X-Forwarded-Encrypted: i=1; AKwUvByoIgMG87fEe+wM0V+ixPzkrjFQicpay7dQIASJRJgoW4rmaFjPorVIzjN+7WHV6bXAHboMaKJNiGWvUqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xKpMiLGg7xBkLbdn6bJqLO7t5Lao4NXMkYtuS6ITYGVUUStd5
	T5xkfoXGSL5dOGjFm1Fdyn0y83KK+5PivOFbL6wu95Qps3hkFQ3Z0ptST8+L6eYL9cM=
X-Gm-Gg: AYBFou1T5XTh6/xgcdTtgXZ5Uw9rlk+NT61FL2gAtDXt71jQdp7mm4nfajEaT+WIswi
	++fBRv0Xpzht6q59+aQ0UsKFG2bZfOypyeK7/O2NT6hDvEh222KlfhGiCnOrg/AQem8ZtV3pMnK
	HYBUOi/AapW8/1OEixJPSA0IznUX/tc388OQnuTZYFsjI6UsTmXinpC6y5ro/TulTgbGHWjC594
	i5pOl5r9XVmtVdfoqw4DEViABrQV2nkW7mBmkGFqLXMttPIo0KM6VWGol9aN72JewkDh5BdHWnY
	pBKDuInJxeeZxZuK8paLrz18qGp0KQrbu+EA5rmLYF9AKn/I/xTRPx8AuJDTbtvKoz9Zdx95uBf
	G2cgB7Gu0ZH8EjwjFrFVU8KAtF0Z173YDUrN/rwGiYEcwIT4l3nsPrt9Brh/k+USfDaeWFsy4md
	tC+3SGDGRIbT/1E1pNyQlee4l1rraIMXvlIlA6VZZVlzS+aYJPvwVU0Xh8HDE1yaSx1fdHW0WXV
	xc+hXPFUf5JPZlpUunvLpjtyppnbDsvRAK0ABEdL5oNygIQGvV+TlP8zi/QaoozTrViSFbVYPU8
	GloRJClczWIafIuSYNkfuvxdBA8gTXOsyrws0+6IIAGFyQ==
X-Received: by 2002:a05:620a:3183:b0:93f:26e7:844 with SMTP id af79cd13be357-944217942dfmr3186410985a.55.1793892432949;
        Thu, 05 Nov 2026 07:27:12 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d479a81asm484462885a.14.2026.11.05.07.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:27:11 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:05 +0000
Subject: [PATCH RFC v3 73/90] cells: add the "net" slot
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
Message-Id: <20261105-b4-cells-v3-73-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=3462;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ey37mzHZblXCf7M1GK29NesPtmaon7wfyZ1vlYLZpTw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHmZlb6aDHIeF8hCBPjo3yYotvS5ZOLdyibpa6kLs+3Vgtq5xlhcWPqk1V9Uj0Wa+MnfUiqVJah
 JdCggQBe2Zws=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The network of a cell is set up from the outside and handed to the cell,
like its mount tree.

A capability over a network namespace has to be held in the user namespace
that owns it, and that is never the user namespace of the cell. So no task
of the cell can configure the network, not even its root user. Compare
unshare(CLONE_NEWUSER | CLONE_NEWNET), which gives any caller
CAP_NET_ADMIN over a network stack, and with it access to a large amount
of code that was written for root. A cell does not get that.

There are two ways to fill the slot:

  - CELL_SET_FD with the key "net" gives the cell an existing network
    namespace, set up however the builder wants. It requires CAP_SYS_ADMIN
    over the user namespace that owns the network namespace, as for the
    "root" slot.
  - CELL_SET_STRING with the value "new" creates a network namespace for
    the cell. It is owned by the user namespace that the cell was created
    in, so the builder can set it up. Until then it only contains a
    loopback device that is down.

For now a cell whose slot is left empty also gets such a new namespace.
The next patch changes that.

A later patch adds a slot that lets the cell make selected changes to its
network.

A network namespace that is shared between cells can carry identities from
one to the other. Only unix sockets know about cells. The builder has to
take that into account.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cell/slots.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/kernel/cell/slots.c b/kernel/cell/slots.c
index a96d2f262aa1..75855f2ee020 100644
--- a/kernel/cell/slots.c
+++ b/kernel/cell/slots.c
@@ -93,6 +93,36 @@ static int cell_make_net(struct cell *cell)
 	return 0;
 }
 
+/* "new": one that is made for the cell, for whoever builds the cell to set up. */
+static int cell_set_net_string(struct cell *cell, const char *val)
+{
+	if (strcmp(val, "new"))
+		return -EINVAL;
+	if (cell->net)
+		return -EBUSY;
+	return cell_make_net(cell);
+}
+
+/*
+ * A network namespace to share. A file descriptor on one is no authority over
+ * it, so it takes CAP_SYS_ADMIN over its owner. That is half of what setns()
+ * asks for. The other half is about the namespaces of the caller, which do not
+ * change here. It goes on belonging to whoever it belongs to.
+ */
+static int cell_set_net(struct cell *cell, struct file *file)
+{
+	struct ns_common *ns = cell_ns_from_file(file, CLONE_NEWNET);
+
+	if (IS_ERR(ns))
+		return PTR_ERR(ns);
+	if (cell->net)
+		return -EBUSY;
+	if (!ns_capable(to_net_ns(ns)->user_ns, CAP_SYS_ADMIN))
+		return -EPERM;
+	cell->net = get_net(to_net_ns(ns));
+	return 0;
+}
+
 static int cell_set_ids_binary(struct cell *cell, const void __user *uvalue,
 			       size_t len)
 {
@@ -131,6 +161,8 @@ static int cell_set_string(struct cell *cell, const char *key, const char *val)
 {
 	if (!strcmp(key, "hostname"))
 		return cell_set_hostname(cell, val);
+	if (!strcmp(key, "net"))
+		return cell_set_net_string(cell, val);
 	return -EINVAL;
 }
 
@@ -150,6 +182,8 @@ static int cell_set_fd(struct cell *cell, const char *key, struct file *file)
 		return cell_set_budget(cell, file);
 	if (!strcmp(key, "root"))
 		return cell_set_root(cell, file);
+	if (!strcmp(key, "net"))
+		return cell_set_net(cell, file);
 	return -EINVAL;
 }
 

-- 
2.55.0

