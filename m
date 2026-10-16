Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03EC3B440F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180607; cv=none; b=s2xtrDLj17QaHJohYbTicAxudTM9ICF7ZlwL8BTht2e6k6MMCcxysKdh3PyJi4775sfQU7l4oOkUHtpqCUEgztR2wjhd+wxVimrOZazTW2GL9TTCD9Jhs3Z/eoEtRXSCEjenxQp5+8hqAacTr6/5sTV6MaB7Ea+gZzbUEyFdk5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180607; c=relaxed/simple;
	bh=DQBMScUdmHcykm0n5oqrLLDh/B7YIhxcY4rdkjrT32U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8ifztAUrvW3uCO/X2b+Ps93eF+ly4AVMatIlkpXCiN0iMz8mXWefHNuWzM4GDUJqB0C0pnS6eX+Upurtj+Fn5r6VpoMjvWH8DE9o5nQoCzKANqVIkYag8WCPOgseubZ1yGJ3Rqfx6Lgu8IstoNfPkovI1eZUqJdZNyEp7JGSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dq23REe1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dq23REe1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e00eee27dso126258f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792180605; x=1792785405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OO/5rzJUY2TjghANA+R9YBb35gGjSiidWbv54AUaO6s=;
        b=dq23REe1zaxlUcQIrX1RKEXDb4e1JwwCnfSspeZFUahiN46YXkJdteqj/Oiwd9STv6
         owBEBoVmWtGq8VH/DjsKNnkdN8F3iChNBLJxQG932i265Q2f9yxZ6CqAVcrT6RuK8VBf
         k+ED8G1WpJnBO99OI1WSZqMDBnhJpywBSLfseuFAJPn3UDxKoh8wRuaJoKr+jnBitgEm
         odIbYONrLI8EJHeODLYwASjhcAUhLyY6Bt4gPwWbm4havAWX125f/i8WaDO+fgY/slp+
         Fal+5l2ZSb2gL5IzDRyn2bsG1YEhMVFiaOj2I0pTPTRRlwnpA8n+V4w3tCTVQNI39uJr
         GD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180605; x=1792785405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OO/5rzJUY2TjghANA+R9YBb35gGjSiidWbv54AUaO6s=;
        b=ywopLde20ms0OAsN4N+jDzNBvWsB7J9uyFVdUCAydpVkdxXCCgJ0sgBLLLpLTl4z41
         ITD7dDVTz19aRTFJ/gm9nxsrqkqdki0RTGVM7W3Ma6l7sMoIt+S9eMs53ItsPpgvITBj
         V8LCCWSEEWwTe7Z5YxZRwsrpzYxj04unWqoyExqwulVnP1bZijJRJn9PvrrUma85PhBX
         MJNYUkjyQAX1vOs1bP0mzz0LXvbzzlC0dwykgwkB49iPYZmIoWKLTgmksZWSgKrN9wbk
         f9WxcjF/layY2p1TpDMdsjlZqfZ6Vh2cHnkaqeYhqfxvVK28WEKKtbAQnlOAhVdffQ3E
         j+Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxkcHnv/IaVwdCgw8usGa1Y6Iul7Zu2FtlVthXzonvqSkYegbkOhIYlRQPNWLeZE6DkfzOT9algitvf9K8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGQsjZzJpxw6TaacuhDasuTnr58SmbNmk0eBcqciENH0DC7xT4
	srYdnuwo+90QF2v5tC+jpe7jAzKzB+AWfc7wfqfSmCZD3FZ1rGC1n49g
X-Gm-Gg: AYBFou2lu1yU+KmvQ8nzMaffP17V44Z8camLy800kS4LlXeBJWrBKUhTXhpT7a4f4/C
	GNTdSrt1wwr8wRA2AK+kYFxWWffVbahiE0JfX6qWODhE7H+uMts016AIxV0Dit3cWpJqM1D2/Cl
	G2C4ibHVpfeYfqMl/RK2UUXQ8FUhHDMsijKoeIeBrv1tzRdqdK4mm/wrnn8np/IaJDaJRCT+KRv
	MtPWEsD6bWmy9Xv3ZdnLjFW5/I6ov2+f/aWHftlgtWT+ecNXf2nUZ6JvyDhpq6/c/L2rQz4M1zI
	Aqglm+5StR0r57/Qf48WjnfLQ9hydmSrXC4daoyZDiQP1qx5UwHrtGXF9OBjPc5K2JySiWTGmki
	JcSQQRItxURjEf7SW8MvYS2JqEi8mHcHMKt43aiqRIbFo40f6IcIYp28xtdwFW+wSHUTK86enTz
	Hpm4LNx9J71VUdZUk0h2xS7VXwWkIUd/qiP9tlJwHBwR4esslVpTf5mgXmW8a+iJoe8lGghNun6
	rQcAVSLf9JTnWfroiDRwgAIlIKDllTbWxCTZ+Y0
X-Received: by 2002:a05:600c:19ca:b0:4a1:ac66:5ffe with SMTP id 5b1f17b1804b1-4a1d75fce82mr17267625e9.15.1792180604768;
        Fri, 16 Oct 2026 12:56:44 -0700 (PDT)
Received: from ubuntuARM.. ([187.14.227.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm201874285e9.11.2026.10.16.12.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:56:44 -0700 (PDT)
From: Jeremy Dean Clifton <gservice341@gmail.com>
To: syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco
Date: Fri, 16 Oct 2026 14:57:01 +0000
Message-ID: <20261016145701.105414-1-gservice341@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <694c9ee9.050a0220.35954c.0030.GAE@google.com>
References: <694c9ee9.050a0220.35954c.0030.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1726,8 +1726,15 @@
 		}
 
 		cancel_delayed_work(&conn->disc_work);
-		queue_delayed_work(conn->hdev->workqueue,
-				   &conn->disc_work, timeo);
+
+		/* Pairs with synchronize_rcu() in hci_dev_close_sync(): don't
+		 * queue disc_work while hdev->workqueue is being drained.
+		 */
+		rcu_read_lock();
+		if (!hci_dev_test_flag(conn->hdev, HCI_CMD_DRAIN_WORKQUEUE))
+			queue_delayed_work(conn->hdev->workqueue,
+					   &conn->disc_work, timeo);
+		rcu_read_unlock();
 	}
 }
 
