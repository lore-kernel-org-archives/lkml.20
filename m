Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FBF4E8E0B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559682; cv=none; b=QsUeQPBEDpbhHED/492SF5BPgsfDB37gB68rXqNxXmdomtUZqUJuWU+KpTaEHI10yx2jBi9KgLoCt07nICX0LADKL+GCrhPqQbW+b/1OXyMYpQkjFfiyxu3B4LId7+MCzeBkZMyT8IcBJhuK0VLwg58nwEnBnTgsj2ctLgixY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559682; c=relaxed/simple;
	bh=2EX4hirlw9GDe7zMXtF/QaKw+JHHU2TnANrsVXhvyms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MnpXv9wvewYTY70izimxpv8fBp+JO1J0RffFW25W+luC38VmBOFhh0OM3yXSlpLwVeuWpig2j+YSLu4H9eENIMnF/G1aDgZSjiwLR0473HMpKuRq0b2ZjQ3IGU34xRJROQpVZFpnLk/coQG8qrmEpXqHldsBX9E+nPjC8uwH7jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Ld2dt5dC; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Ld2dt5dC"
Received: from localhost.localdomain (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id E280120B7168;
	Fri,  9 Oct 2026 08:27:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E280120B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791559677;
	bh=Or2R5FsKHtILV0vQgW34Mr2KBe8FFbF5QhFvotfglJ0=;
	h=From:To:Cc:Subject:Date:From;
	b=Ld2dt5dCkAcbrXAsZ7+FvuboI0ctRB+ej+IjneTajFaKBqV/JNYVZ23sT8s6wPkXM
	 BaZThYi3MytPLsFxby5si7lb+HLKTDiW6loLQXItOFj8WgG/sN7hA8G8stSDIwjXKE
	 q4Wa/0MJIhu7IcXxWBY4eXqWFtoVviV/ymwV9W8Q=
From: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Cen Zhang <cenzhang@linux.microsoft.com>,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: fix misuse of kernel-doc comment
Date: Fri,  9 Oct 2026 11:27:43 -0400
Message-ID: <20261009152743.39401-1-cenzhang@linux.microsoft.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above struct octeon_ethernet starts with /** but its
current content does not follow kernel-doc syntax.

Use /* instead of /** to keep the existing description as a regular
block comment.

Signed-off-by: Cen Zhang (Microsoft) <cenzhang@linux.microsoft.com>
---
 drivers/staging/octeon/octeon-ethernet.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/octeon-ethernet.h b/drivers/staging/octeon/octeon-ethernet.h
index 0ac430db1e6e..de27fae47931 100644
--- a/drivers/staging/octeon/octeon-ethernet.h
+++ b/drivers/staging/octeon/octeon-ethernet.h
@@ -43,7 +43,7 @@
 
 #endif
 
-/**
+/*
  * This is the definition of the Ethernet driver's private
  * driver state stored in netdev_priv(dev).
  */
-- 
2.55.0

