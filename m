Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197578;
	b=pmKnaUHTjM30KJ0Mcx3iRrUybfIQC+EvE0dEoUnN4MIOjZjRVcEaojAWAtwSvhIzmftp
	 POXyUkRt4zw13cGoVxc3nRalhM34Zsrzx8yuQwW7h5p/Hkjfc1Xh0JazMX76hIGpC77Ka
	 hr8B2Ry5h8JQna5xNfL5xflnUp56Gn4P6KqxT3NzphRGJyRnFBPwT+9CZeoDrRdsaV9b/
	 UWFMb8AZzF0UXwebMtMI68GiZ4DYl3+PF8kV6idQVG5dwM6iVSujV5vOG1+l9ecYT/YtK
	 3OKlrPsvoiaFfN4EvGZzMig6+rjAQkpBavxTA9Bt0ZdurmXepXXgVCTlLZhbZaWmnwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XHACMsSAavXNCTYF61tcz53pn8tWaNJeak5X4+vyN4g=;
	b=EKg5mgW2sZ2xcK37/E3+HJrWumpoyBrfbnzto0FjpxAsrt9vkSlpYk8a0m/+AJhj9Nsr
	 2Y9W3ju4S+/6aQLifk3RzA5L7eBJkNZnGPpAuOKISwYw1+98wABq8+/B9D/YGyYUmBCym
	 K4bWQi4a7u9HsU32nSoJSmZTzoi3dc6FwYaQ6zI5gYSUYpVrzbm2iCrOoqX6V0J8YoaBA
	 gEIaAvU444X1AyVFHtpLkInRfBAOmUren8ISt5BaEHb/WQnzfXOrN2ruSMReQlqYanbWj
	 uI4z0bRv0oAp/JtZKrJYpc0pathtqYC3Zkf689i2gAliiz1k33KnAVTrovOqT2i5A0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kEUfj3hM;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AAB606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kEUfj3hM
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36ff9c9da34so785482eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197577; x=1794802377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHACMsSAavXNCTYF61tcz53pn8tWaNJeak5X4+vyN4g=;
        b=kEUfj3hMbyOglEEgRkZ8/ck8CtNf6IqJSNE6oowOo4iIIVUAzibjUoqVXBcemjVvUl
         T9N/3MejNPKSIScL5fn9igWA8OETQi+yhq5xZWEA3E6BcPKB3MAt9NFcwUAnSTRnAfD3
         ffzgPL4ku0YNoxtwTEGy4djqCs79x434ZlQTqr1HR8DaPDQqr9z+nzqwG4qEYlVNwG8r
         g2DmGvw+pngqPCs4wGTExck8dq9Ua903eD2j6QEhIVd4g6WQhj31U7jE5sKBeZvV+Jgm
         QuA5cgIWHHClWeZCixAJqon8cMg0SHL1YtdmIPmtZFVlCCGIGr8YwKKszOAFUxAgTQ33
         E3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197577; x=1794802377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHACMsSAavXNCTYF61tcz53pn8tWaNJeak5X4+vyN4g=;
        b=U4/23qv+s8hg374mvudq5IyZ3eDIsEU1pZ2Y78f5I9opcHetpgkgN3/2CBpDs2cGcK
         yGZ9CTJ1Ijvdw5FXSfPjL9RKqsEOgehIqY0DHuS++6GZBHFigd7mhLOOb/bgpwGwqjp9
         8Fc8UXLORbUMf6v3LtCi4JX3tZ84hKCDDb0JqnYDI7VuZVik0I8ffEZafrdbtHYrqhCb
         BX7uSfFtBFHO1TRHn3H5kMPWoPkh/2QxbSB98wHKhcYdjqUTRzu1+jxm6+mae/Qbc7Sb
         LmYROD4w5wf/GfYT6kgUa2LwDDix6pAPGn4lD++MOkXTi2bJpTb1Hgtjfn8TVqT4uKzY
         GcAQ==
X-Gm-Message-State: APuU4Z9ErKxjmO2sgrkPKg57tegiItwFQkJGkJiOI0omw/C/+jo5tYav
	5bptoc6dMpn6bCzbE7LFpC7H70fh5Y9QE7IOe2Xwgy6idv5h1z4RcHGwB0wvPg==
X-Gm-Gg: AYBFou0AEx0tp1G7BtLIeAY4IUhqatsDkNIw/l1RgPH4/KlgDkSI6DIs2yD1ICfG745
	82P7rqTMfYOUmdDxWL0G7j7UjbH/ugBAKg5bdBRgzVeLWoAtgGHq80C3DluGXwnD6QzPxNb7L08
	jg1YwLkqoKxz03NTGf31YDqvukpgGw7GK7HOcpJpsO/Hw4oLg2MA7wYaPPB+8d9CeTV43D3imLn
	8+EAnfu8Jlsgh7T2E3d58xN2DxC4QO8be46MM/6R+aRFFxL4DTDUCdTQ41QWUKUvg0B/cMga3EG
	jbfetFkxSS/zM9RSOszHqczdb6v/1k9O1JZkSJKBQvIySrW30c/b78tN0/WihVgou9Uth8BmWtl
	rxJdkV97n2Aj/NjJEDKz+f7/4GmNUN3K7cBMOFuBnk5WT9ggn3LRqdOapWh9zkPlP/fpNXNxzU1
	wZbrnmC9ZIit/1wOTLb/dmtlQeA2m15ifvGt6m08KI2fawQ9AGuvffwHwd0nWF5SmmCKy+aP4G2
	VX1GnJBfZhrEvN9QneBY8nMnsYgcMuhauO+bBXU9660C409qMU0lpK/1hh+0uZ4dVd6jOhhnSTn
	fMQbhYeLD5nxOmdE0+Y4TrHw1YLoZlXfoR/wyppLSaHogFJr/fdQ
X-Received: by 2002:a05:7022:2390:b0:1b2:42eb:7e11 with SMTP id a92af1059eb24-1b39feada2dmr6518688c88.26.1794197577159;
        Sun, 08 Nov 2026 20:12:57 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm11506527c88.10.2026.11.08.20.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:12:56 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] debugobjects: Fix NULL pointer dereference in kmem_alloc_batch()
Date: Mon,  9 Nov 2026 13:12:09 +0900
Message-ID: <20261109041215.11280-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

During boot, kmem_alloc_batch() is called while obj_cache is still NULL.
If kmem_cache_zalloc() fails there, free_object_list() calls
kmem_cache_free() with obj_cache, which causes a NULL pointer dereference.

Patch 1 fixes it by passing the cache to free_object_list().

Patch 2 uses free_object_list() in the boot error path instead of open
coding the loop.

Sang-Heon Jeon (2):
  debugobjects: Fix NULL pointer dereference in kmem_alloc_batch()
  debugobjects: Use free_object_list() in the boot error path

 lib/debugobjects.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)


base-commit: 9f74092fda91ef93c2b07585785c1dc83cd7971f
-- 
2.53.0

