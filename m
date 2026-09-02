Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA84A4988;
	Wed,  2 Sep 2026 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360926; cv=none; b=FGOapmFSHnHNv3V0h+k9b9FXITVQmPnHMYZqsKDfr9q3/EY/8VmXBe3PFIBHVcDUgDlFff3s/cU/MNFYhoqK0+me/yYZ5UX/nawrfHPgXmV2Gdk+o9d0qp/U7CufO4BtfJlzdzCuCp8KKPRZMDeIiVDmetzix+7+xs80q0QPgIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360926; c=relaxed/simple;
	bh=TTcumtG241sAhAvxoqU3CC6ZUwIbid7u9uvP3zStXAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqI1jRfGuE9x71LyFX5L7MpxYJOGAPG6vMj8aZqfjHnyaT0OLJq7Ril8IWGOyCUQxNi9jceNmE49zBbr3DSnCBHN2LRPoqDD/8sv+v1Jg1yYnKxhVHLKJNdDCc3mTlue/BUykkUhNq+6I93v0cuU69TGmj2veNRq8H8se/SjImY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sWQN5Kqj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qKU431BV; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sWQN5Kqj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qKU431BV"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hZm4B5BH9zMlGx;
	Wed, 02 Sep 2026 16:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788360922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ZIFu8XNWYmDhUWSk1i5MbEmxFLZTUZYLx9WRJxBZVE=;
	b=sWQN5KqjrQf3xkyo1FCSRTcpklHDTXUolWDSfKWsgxffHVcKh+la5Qhn08dZwUZEbCPuJ6
	Dpfrenbg0Uz0HMri/najYMIjZk0Y/lVMy1swIgIu5mbFYKhQF6HvI9n4dKGIfzs8eg0+qb
	equLo1QosGU7UB0uYU7HSGA+zzM5/pVUQx58ofHn1GSlf1fCPFqZ+XlIvYPHa8YR5pqkHS
	m4/E9feEs2Mp+GZrZ9z651Opiv8jqhLIbE5GQJ0MjFU4wXzFMTEAbRiYnV2GdoAWZNM5ka
	vP8EfJQYL/iVAbsThfONlFUelifWITMwA+bl5jIghsLvKoA7WMjslUxwaTok2Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qKU431BV;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788360921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ZIFu8XNWYmDhUWSk1i5MbEmxFLZTUZYLx9WRJxBZVE=;
	b=qKU431BVXTREaPrl4i4LHi8ldxHBYg5xeTRZSmfBNrPcAov/q3dKWrpUArZdsEbgL+eHkW
	8noD07rpZ1qq9yorR6/DTd/xL4BY9wkzMMJFA/PRwsf2+rJ63MJ52wR53+IKw1rp7io6b6
	51KlFtpIAusxoKLLiJwchHWaOfJNpewYA8gPolvPTjDz+f901m6k+n7cOLsbCihPqCD7Ne
	aOG0ZDo0QjgA8t2I7mPNavQNP+LA/H1Tjc33xjXCfsxNP/bh9+gaXzWbnJBMqUknvAKq7p
	wl9gtSiWFYcCCqxu4bmDM5kL7jaz8OsgD20m8RMAQtYrHlt1sUar087zHvlyLw==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs: porting.rst: add bracket
Date: Wed,  2 Sep 2026 16:54:28 +0200
Message-ID: <20260902145428.704582-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3d0e5717a1d04e2bd30
X-MBO-RS-META: kmh49fxirpffk3mxpuq6mcz1w5b6dc46
X-Rspamd-Queue-Id: 4hZm4B5BH9zMlGx

Add missing '(' to function in prose.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/filesystems/porting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index 60880eb0c..810657082 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -673,7 +673,7 @@ watch out, since that shortcut is no longer valid.
 they used to - they just take it exclusive.  However, ->lookup() may be
 called with parent locked shared.  Its instances must not
 
-	* use d_instantiate) and d_rehash() separately - use d_add() or
+	* use d_instantiate() and d_rehash() separately - use d_add() or
 	  d_splice_alias() instead.
 	* use d_rehash() alone - call d_add(new_dentry, NULL) instead.
 	* in the unlikely case when (read-only) access to filesystem
-- 
2.54.0

