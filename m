Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31158299929
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519680; cv=none; b=D3hkl8INHBXNH9RSi/wOz6esGL65c4cmqMeczR4qiKfZbUQyfNKY394DqmOsX6rM9ApqDoE/ofw6hxvIwak5+HXeKwloAToU9U7g475+FELqxC3ABXb124EXC0Ea2UoDfhe1oAp/2wsztE9hNCCeGPu2DyMYU4WTnkCnzQHpeH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519680; c=relaxed/simple;
	bh=3uF8oE3iT1589H8nmcJSg89Xq3PKSkKbeq/RA8nBoYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ImsMpPRA0wgpB3W5ny1i7m+Gcdgr4SajjCUr0BJVIap2cFa/1QpOZkekQsWrCiXJBV2Y5vOAe6ZzXtF4EdgTD85y7kpjE8hgbkuJYlpbAC18NbrqQsIz2uE1DFJihtxNEl3fs+HdfUUoxFDNMPx4psJIO14XBEmt2MvBnwFpZM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCIeGuXz; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCIeGuXz"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342773d94a7so1081639eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519678; x=1791124478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewTGQvK3tt2260QtNRrZ7p3X1lbZ3jh2OEzTu9yhDdE=;
        b=MCIeGuXzYflD2R3SmObpkhB4JXA3tRbr8A3nGtJSTX6Km/cqYWyvdbyW9yv5jpthDU
         V2M9yYAf9EieLPn3rvRLnb5NZWcR0UyRTsEDcue6HzqEbpXkGS3n2YGCpoYMbaEsS/iA
         /joOoPJdS7yknN8RHl0Y3Sp2IpkXPyzocegXqxRYgZPJBQ4lZhVyBUDvOCfcquBD3Tmy
         gRZbC1BOmnMah2zE9pyXJ6M3sXeCesbMIkus8IaRmZt14PzqWRWbJWWmZjGu33YP3UIS
         H3JTRLUwO4dFGeuE+uYzLNhFnT5YmlBH60ZpYVGxPNp2VPTN1Pt/KuHFQpoExj4N1HMr
         wvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519678; x=1791124478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewTGQvK3tt2260QtNRrZ7p3X1lbZ3jh2OEzTu9yhDdE=;
        b=BtDlJFfJcrao9KEUtYxt/0jo1MWZhb6T7/FddwQ9L9/g++pZ93FaOazAYMkF4mbxnl
         4kMxGJfQ94MR9zyDW3IHRUdyBrL2+4LLIp0mlfF3YjWZ/SKpL277K1EtO9INclcAmYHb
         UZXckK6ZTohzlAg7sLC6PfXmQOh3/7IyW6umufaWRGU5o7lKkqzgW5vQ7byo3NNRuo7o
         MZlo3xhg2JhbZbI72xhYq8POzX6CVtUxU4Iq6rlnD/2hNKb5+o99tZDZfZ0OLkUOEFZD
         i9iFyCnKF5N0I/fbtJ586mffPe/mghYOQmWr2bIo7jn4CuJrIkx4kKksyxz7Hidom6JP
         IB5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwY2cW4C77Ni6b2P42kdXVFUPMNCrwE7qwklPhpJm1mipPRdiAlrb3LeeX9Z+uqHb7igumXDnIZT0PEiZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHoR3xpaOBU2snApWStzmWWEQR224de6TB+1l48RIfbqkVEzh+
	DG19JxnEojkSfyBXYtzDsto7QbO9jBIUEx8kx4QQNkSbGSuoABSaH8RZIPZEcA==
X-Gm-Gg: AYBFou2uCqhNjBGF500WUWI7qHoGgxQirWBKT08aHc9bx3SZyyXkBIyX25i6kBuh3xI
	ZzFkZ/WvEg4NJ50QY6nck/O5oeYOGW1p6gWTNVxoPgsDSr5eQer+N3RWVwhTk+n+8Tas/uHFggC
	/fMyjNkiqbtQWCJM/mTJnB9XuFVlbczxlzcEuLkiIZvqGQ8ZKFMuhCklBp05Us5dxn0n5SmjKD5
	1L375eBktkQ48IXzVldTLOy6opZh99gsCKiG7i4yTq+WfZQRz6N0fuX1j+y1yeqON7IrXNxSpS8
	lYu+f/wUigWA/gzqNjvWfWXwMeeZk1QeZDcXkiQE1KSBuBoL32vj9yYtU8+qRvdouyK8vdi089Q
	4OGa4yaY/XynPCsT3maMGUI2oqcHPiOC8bpVqsmQu4KWURzi4S8kyrz/3N7mktYarrHJIY3DW3v
	GxFxFBGZjlAhISZw2DHIfadqqH/5AEdPVsSN8/CvFFzUeb2fINZ7PCz2ADHVEWJu6yGGGNzSB5n
	XmYjQ1vzTivrpFzuRI299ssIrQI3aJydyqEDQUrz8M+n34Sy5iKSUF3ghBs
X-Received: by 2002:a05:7300:a987:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-34271a8dd5emr8654973eec.21.1790519678071;
        Sun, 27 Sep 2026 07:34:38 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:34:37 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 01/12] powerpc/pseries: Drop inline from hugepage invalidate
Date: Sun, 27 Sep 2026 20:03:42 +0530
Message-Id: <a7ae0f64960ba1ef21d2a836974420f08bf0ee50.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Leave __pSeries_lpar_hugepage_invalidate() static and let the
compiler decide whether to inline it.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 6a415febc53b..94cd30e9f6e1 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1225,7 +1225,7 @@ static void hugepage_bulk_invalidate(unsigned long *slot, unsigned long *vpn,
 	}
 }
 
-static inline void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
+static void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
 						      unsigned long *vpn,
 						      int count, int psize,
 						      int ssize)
-- 
2.39.5

