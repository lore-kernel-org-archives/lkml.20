Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D96A3C5DD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774712; cv=none; b=pDYa5Vup8GkCp32EWTGDhX+PFHmUmAwKnHkB5ddDWsnLSx6aDD+BLfcaAOc4ygEMaVLcCWfXEf9A5B/oJneboGCAhIZ2PYbqj3Lc+9n0PN2CudDa0cMMo6kQ7KC4UHgYK8u6w5773rlfRyPf3Nmt8TyIqG7qxubzhtt3JRPJcH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774712; c=relaxed/simple;
	bh=IEyCsBsVSwIqhPWSmr79dEU7ej538Sv/hLVY3DGEtxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMb7n22GzqD1/kJJZcJ/Ix7Uikn7kMVjsfvgZxA9PYDSNJTujNtBcVp92d3TSVytwgBlhEGzvPZhASC8+pk/q4FICpUFJXYNf7IYWUc9iKJ2bjyw3qkuUTLX9Mx19R/KtS0Oiu5U5CbRNjsk+WH7co7rsTcD3WOCt9K/ux+7v8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKpV+ffu; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKpV+ffu"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so3419947a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774704; x=1789379504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NuRDS27i5Np0POtdxR7TxWtwB4SFITDFQVIRdqIJzqo=;
        b=gKpV+ffuY1srLKj4mECxg6FBBdseA2QmvFdbHr/w+LoUwUaQXXBxL9Ysrm0fqoEK3H
         rVoOWzDJb5vZ4uTPNbzyZsoXmOVjY+GUnYzUVRZSN8U6sPuNReJlU2viEuXOtGFmavvZ
         gZjjQTeDK5jzKq63O7T5BZArTrxbLXXC+ghdvBAPa/Zo4VEZmRCjGLzZ8Hl7oRcVC8RI
         PMlTgjhpzlrre9X9j5h5jx3DHz/SFI2HYunPI4dmZomq0zPXhkGU4CyOMqXYVyo8gbcV
         UbB5KpHoH4Mp5VMbA+JCYvTCzfIBsO7IHW3SL2qlQHB24BCzUHg44Ih8fpDn9mKR3VOP
         Ch9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774704; x=1789379504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NuRDS27i5Np0POtdxR7TxWtwB4SFITDFQVIRdqIJzqo=;
        b=d5ryEDCLlqJLYdOM7rn3/f9aL3495HrCwuQX/d7hQbCUjKQKThj3SHo0V3zIq30Kl3
         /LZC+IfgL39Za7StSo7xh5nNFVlAvpVu6k/DE39xAHSJUL6Y/WozZ1BPGYk88U6neulA
         tE0FEfg+ZTYma1cm12zE1HrnQiKojQMQC7rD3k05kZ2vlclbhnI7a//+rFDto+sAgIM3
         eIkNtXCRIjwVQ/Fl3/fQBoMNv1XNEwRl6cQPqquV3jr7Icfp2FfLUiM7uwwlMcfYXkFr
         vy9kxjD7kORaPktZ09c4J6BW2VsLPYd1G5GjQkA7p+dnXvKGZ+eKOPhNqlA5k6vmhrR6
         z8lw==
X-Forwarded-Encrypted: i=1; AKwUvBzJH3GVhpS/q5rlRwMPB09fG1QYxvGasul0P7GGbWrtwb/JfNjRaNO4INs5W4plGmXnkP4qcpAc7Zu0Jqo=@vger.kernel.org
X-Gm-Message-State: AFuF++n/a8LfnCDaubnbxm60+s5SQdGeuKIB0SGO1n2o+TQlCBOg0Z0k
	bUZGFrrhpjbaMvDYFGS/zMvzct4Rn1reociDorYX8UUXoyYvFe6PrMok
X-Gm-Gg: AYBFou0Reo8fzGErwCeDbVLTK/5qVlBCMzxxuX6Jl/K+LCiiYR/S2IV5PCabLwW4Qln
	0UPsIo9xRVRTf8voN/IlRmyidRY2KPwPKV9so85YiOS4MCs16CryBnmqpN5BwF8vxQRaPmYICSC
	34eYVzCVmgbIYWYGlKa0FjlsqAmjuCJuUd5KKYgrfogrstXmkyyTqwlpJBT+ZMGn1BnGC/Am3K1
	ttlo/4rpm+DofmPnwgYaCUnT3zkg0cfGv9hYP5VY3l9pU38sVGZYeH+PWLsLxbyO/LUSnnre3Fg
	aPeAbgCyfq49f72tmhe48JXt2Tm0RReulvMbPWrFTL+v/3tMyfP+ndTx5Mclu+L23IRrc4AbSCi
	g/m4zotUU8JMw/P6dWjr9UXgDQGNOUY+LuCG4e+ntZ4JVATBIz7RKeAs6hholUrsPESgLxcsO1L
	G3zW1Z/qTHgdWFpkBNsMTl9ZwiN8ebhyDRd/RHRFOBHrFmQTVrMYJDaLNii0jGKJhzeyS79x2Se
	93OH7i59kyV3t07gvowA8Hm
X-Received: by 2002:a17:90a:51c6:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39b29ca41d5mr20436117a91.17.1788774703600;
        Mon, 07 Sep 2026 02:51:43 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm30049167eec.1.2026.09.07.02.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:51:43 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wpan-next v2 1/2] ieee802154: at86rf230: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 15:21:31 +0530
Message-ID: <20260907095132.21244-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907095132.21244-1-hemanth.selam@gmail.com>
References: <20260907095132.21244-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in comments, found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt. Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to wpan-next and use a subject prefix naming the
    component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto wpan-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907064346.3288-1-hemanth.selam@gmail.com/

 drivers/net/ieee802154/at86rf230.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/at86rf230.c b/drivers/net/ieee802154/at86rf230.c
index 6156cf379916..f1adca942e3d 100644
--- a/drivers/net/ieee802154/at86rf230.c
+++ b/drivers/net/ieee802154/at86rf230.c
@@ -1370,7 +1370,7 @@ static int at86rf230_hw_init(struct at86rf230_local *lp, u8 xtal_trim)
 	 *	  but this is different on each board setup. You need to fine
 	 *	  tuning this value via CTRIM.
 	 * CTRIM = variable capacitor setting. Resolution is 0.3 pF range is
-	 *	   0 pF upto 4.5 pF.
+	 *	   0 pF up to 4.5 pF.
 	 *
 	 * Examples:
 	 * atben transceiver:
