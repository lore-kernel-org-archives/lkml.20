Received: from mta0.migadu.com (out-237.mta0.migadu.com [91.218.175.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DB647F796
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961490; cv=none; b=V2yxNfbneNPWHj16k/SoFdYLqKdwViNF5iAORR7vWHYVQ6+3OXLjI2Jy41hsIIyLZjWXYkcLux+BEAUAmXV3dS67Sgb0h7dUrsU8I5+w26viNGl9IL7hGWkUYaKzthLxqbF4bYBfJKCA36/Iokdl/9yU7rUWZXtQeWAvzWep0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961490; c=relaxed/simple;
	bh=8GDWX4gLrjHiDtzRdrpL1LzQZH2vrwI26JE157EUf8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pf0OzNxkt8cFZ31MMFJ2C+tnXBL3mE6y97+0qlbKIKaexmbPrQkEQiz/rw8gZ1l+q6hYnixtKqOfaupZ85ls/ZU38UQtc6mgIiSw11e5rm28SAn/sFDfKDJvi+a754n5u+ba+G9/FHWJfsIrG7iceTPSzdZIq/mXA4lTQbsZHiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WnbSFYgY; arc=none smtp.client-ip=91.218.175.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WnbSFYgY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8GDWX4gLrjHiDtzRdrpL1LzQZH2vrwI26JE157EUf8Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791961483; v=1; x=1792566283;
 b=WnbSFYgYiG2mqhvHzKfWbcRePYVHFagBon+kwcs+YRoZZp6QfdvK9Xm3i6LMyWXlD/QRucb0
 dI9lFLLyvJZAG/Kg9VdjIZ7DMur5S/6+wNSkzBqLOj5t+OO7jgtqIP+FGTfG0yccVMz3OHq19K6
 3vjGwux0oJzqNwshoKtnJmCI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1af0e71b0a06effa;
	Wed, 14 Oct 2026 07:04:43 +0000
X-Mizu-Trace-ID: 1af0e71b0a06effa
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Wed, 14 Oct 2026 15:04:29 +0800
Subject: [PATCH 2/3] tools/mm: remove Page Index field from show_page_info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-show_page_info-v1-2-7a68aee0114a@linux.dev>
References: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
In-Reply-To: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.17-dev-39d60

Pages don't have indexes, folios have indexes. Remove the
__folio_index field access.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 tools/mm/show_page_info.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/mm/show_page_info.py b/tools/mm/show_page_info.py
index 9cfb5cac05a3..1fbef3889e91 100644
--- a/tools/mm/show_page_info.py
+++ b/tools/mm/show_page_info.py
@@ -92,7 +92,6 @@ def show_page_state(page, addr, mm, pid, task):
             "Page Virtual": hex(page_to_virt(page).value_()),
             "Page Refcount": page._refcount.counter.value_(),
             "Page Mapcount": page._mapcount.counter.value_(),
-            "Page Index": hex(page.__folio_index.value_()),
             "Page Memcg Data": hex(page.memcg_data.value_()),
         }
 

-- 
2.43.0

