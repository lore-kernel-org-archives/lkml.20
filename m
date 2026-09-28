Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB84369D60
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560943; cv=none; b=oo35ktwG4KpfIqy//W4yr/KtzTGFG6WqzIHIbyMCmKiIMHB4B5VTuq5LsjwgWQYtATUyC3//INi16cTY+zg+gtnbr64bo5PeIYCBDRC34ZULaAeELOFBhe+ycK15xkDnbyskY6Ij+WQso58+3Aqk+V1h86zUMqcKiULu9yfZrDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560943; c=relaxed/simple;
	bh=ihHQCwHfXIBTqU3cGgDQUJLl42Sx9EJlpyZHqBbkqs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4q/KAvbMi8SD4YrQ84A7U6+3u7/hJKWhcI6zL9/I11GqvtYT2BgSbIfXlcadUqx2PgtDEiseHDXl9e0zxrQ/dc+DeTg2FMInGi5HU3NkAwsbBEnZoBsQbOGRFWkDd6qM/c2EoBLu77yXBDsoJ7z1sau5t+fGnAGcNZf6EFkAiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEqY6ykM; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEqY6ykM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1154928a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790560941; x=1791165741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIHLpa6pyR1JPLrjcI2ICfhGuunWTnStXbLN19mlT3o=;
        b=UEqY6ykMDfj+gOpPwO/ULeGtruhHOiNEq5d43TjMBsQ7B0Of+fkK1UdjxTbaNTgujE
         kwdxbwQEgMy0PHHknJatrYzyhbm+WgBiFbJsYH1soWnXTUYEMELAvLy1Isb4BSxkY3JQ
         VNGxmVRptw8UEBrTunCVsw9UazhVXoKYTbFPSJ7osET38jNOj0/EiauYKUKRlkABEatu
         899zJKg3hln92a/TG/Ixbq3XZvJhTjm5wCPLmnx2Zkuaj5xU65DUXjZyNlaWU3CH4GLE
         7te/BIGmnBij7SKPxNZLHdij4AVffStKdP2RLuD6xJPJbCv/wf+YERIHqumqRW6gCZ5n
         NdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790560941; x=1791165741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIHLpa6pyR1JPLrjcI2ICfhGuunWTnStXbLN19mlT3o=;
        b=Yzr84FwWNqSFliqa8N5B0aYg8Z+1sY0FwqJOzZO9jp9Hottw8qD3SRgH4x7QfPtkWh
         xbCe/TXcJViflgP2SudI9f5CVhX49Xj3SvCmJkUZWViU0BsJZccXxJW1EmRUikmCo/5R
         Lv3WublAJTLXFE3QYNVXQYymt0RBCfXupZ/K3hVMeKFGzgOAtSZWwgoEEcO5XRa3Zm+w
         2+juwcFDH5UEyLj5Op2cdcLpMfRdv4+/xumQu5eCeCtAjMUQNg7k1q1B9x3R2ajFrdLT
         mP6ufCYhjwMI2u++m9B5nviq23JH5XAnsXfJiWdcQxqgjnODFpdh51fY16Fxt8qDoid4
         YbOA==
X-Forwarded-Encrypted: i=1; AKwUvBy0eglfzZqqBagNwnztM27/y6yK5NOCFQ9Yyy8satPiwnytdJGKLeuEOPTACdsTV6FvZ8FGjCiqjlCNOqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV7pB2atPwZR7DjJyjuUUHQG5d3kfZ1SK95UEllwtTI8eeHAhQ
	LobcrHIzE4+OVrRV8nJo+5qc62qzh8VF3voXltZ0+1Ba5STBJtME8HKccMl9sw==
X-Gm-Gg: AYBFou2l8ZJpwBTCz4YZsLOR+OV9ulVuC9LarCft4peBH/h80UIvW1tnpF50g6m3dd0
	rYhgRe90zivw5kYJGspWkVbqG0un9kRKzNvwwzOJTgk6Cm0/W+IClR2GF+knw80kRIlmoX6iHhQ
	moz4+2X/iPESffBl/cVLU3oSWOP8cAGDH1lHVSrixS2Ha2DsOddeYFJnnmGd/t/H7WKdgXU/J88
	qjxK9RK2dF55e7EUiCpfOaExXzeilQD7YHqSe18XmkcKnKiuS6WARkS4U5e17/JPewLUFI9rTax
	DGwGUVJNU3KpikP7vSyahwIaOxYZw0ebeeT6/3pfamtyGhtTBeByWc/SUTavWG9vYpVTKSmw0sn
	cqF/ewBA9M4wbAVa9imOLNpJk3B8nVVBvF0u7LfXacutuSgiUmLKA/+lhdQAFMyezDw4YdSZQNp
	mTfljv81xsJMY7HqGreI6wzH4Uk5blprfsJ7y+LRCby+2Xnj1N/2uKr+/bz6P3mwWZ8dP0jIhYq
	3efW4K/2O8=
X-Received: by 2002:a17:90b:4fd2:b0:3a2:b0a1:456b with SMTP id 98e67ed59e1d1-3a2b0a1459bmr1351002a91.47.1790560941492;
        Sun, 27 Sep 2026 19:02:21 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e05d674dsm4631129a91.4.2026.09.27.19.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:02:21 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Kees Cook <kees@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] time/jiffies: Saturate in mult_hz() instead of wrapping
Date: Mon, 28 Sep 2026 10:02:05 +0800
Message-ID: <20260928020206.977522-3-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928020206.977522-1-zhanxusheng@xiaomi.com>
References: <20260928020206.977522-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mult_hz() converts a user-supplied seconds value to jiffies for
proc_dointvec_jiffies().  proc_int_u2k_conv_uop() rejects a result above
INT_MAX, but it inspects the product, so a product that wraps arrives as a
small value and is stored.

The input has to exceed ULONG_MAX / HZ for the product to wrap, so the
value below is specific to CONFIG_HZ=1000:

	# echo 18446744073709552 > /proc/sys/net/ipv4/tcp_keepalive_time
	# cat /proc/sys/net/ipv4/tcp_keepalive_time
	0

18446744073709551, one less, is correctly rejected.  Dozens of sysctls
use proc_dointvec_jiffies(), among them tcp_keepalive_time,
tcp_fin_timeout and the conntrack timeouts.

Bound the input in the shape clock_t_to_jiffies() already uses and leave
the INT_MAX policy to the caller.  The bound was open-coded as
"*lvalp > INT_MAX / HZ" until commit 2dc164a48e6f ("sysctl: Create
converter functions with two new macros").

Fixes: 2dc164a48e6f ("sysctl: Create converter functions with two new macros")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 kernel/time/jiffies.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/jiffies.c b/kernel/time/jiffies.c
index 80c354811538..9b3487d40cd6 100644
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -101,6 +101,8 @@ void __init register_refined_jiffies(long cycles_per_second)
 #ifdef CONFIG_SYSCTL
 static ulong mult_hz(const ulong val)
 {
+	if (val >= ULONG_MAX / HZ)
+		return ULONG_MAX;
 	return val * HZ;
 }
 
-- 
2.43.0

