Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D8625B0BD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261581; cv=none; b=AZJjBGhMC6mKRFIv35J8YCK6W5pn1hdgXBeOn8AxQ6z0+FMvTDeU8wyGctK5+4Z+xBqEOrYYFigmNDH/ludSJfuhJuh0nETAxrygoSDZ5GXLKBVoEpI4C0VKp0yw+i+UzoNgRi72CcEMlyNcJFmaVP3/TpLzHDBy5593V4DrmtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261581; c=relaxed/simple;
	bh=5JD7+ZPhDwA00jru4odz0jKm6WnDEO3jxLkH4Krzsik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DQZMJhcxBxEE9uGltFYffVfBYszxFs0EvuE4SXebB9wa40UN3hd8uwdexRdEUhwYIIOBLuPvck5tTNXeCgEoFyD1f9dMqfnp7Oxkvyj+wbmJFUEs0C5iR/WTINwR342QXRaHmYM551L/u5i3NDRq3YKlUaoCo4Nr6cexA0COxpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZVqtdpO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZVqtdpO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a01933b584so2181595e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261578; x=1791866378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMg3LguqBid646gbp/lD4TVtZRPBVzY1g5dVVWP8Yvw=;
        b=QZVqtdpO62s7Z8VPmCKj0xhXjWmuw0lLl+yHvNFWdkE6aGUeS7Ash46ZsEjvuDfWh9
         EKMa4mvorycXvhM+1RgCV5fP0HJJ6WS0pCCA1uU8B4gsLktwlHlcChCFz9zzU+cb3jSx
         6gyHcV1DNX0wpsX03GNgnqUclc7qh/cXIWWyQ6JHxpHXdeEQx0uIZaFQ64Ci85TFkB19
         x8vOxvl0DFR0asZe44Dof0/KFVn0Iduk+XMVO8J7o1B4p4xvaDVP78WHO32mf+LeJnpm
         MA0VeDllfA+/rkOR+L2Q/1JddN/b04GWOJn1BWOKDaeysK1Fl4s7baTkPsyKJx1qg+i0
         o0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261578; x=1791866378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMg3LguqBid646gbp/lD4TVtZRPBVzY1g5dVVWP8Yvw=;
        b=Ux9vyenE2ll+5sLjkQ+l/FFYVCHdQYkgSfjlcX3UEYf6wz1dtXq2G85diLV7ZB91gI
         2oIL9iGRDHk705vtpl5vQzAFw+F/YcWAAuOmIQmw4KZaOZf0uPZMFa89O5O7C71SpwVk
         gOzQRGol1v12gHks/Nukl+UKwiMtQ/w8JF2Tg8FO0U6P1OHeDYcwpOuTkHNX1VTm6Hfm
         ediYO0EroIwyVlPHu7z0e2bOiPNxF0S6qFUaw2hXTXjmugroM2sX72zYQM5AjdyIuyXB
         PYjB/U4dt158e1b7yz8zz/S+ZWAEXtv8PDkAM9WsfMY3ROmXJRcLv3LMlDIMbwxr+1z4
         C4AA==
X-Forwarded-Encrypted: i=1; AKwUvByRQ8ojpAk+I7JOctD7BKRAPl+dfQ1GiMVUJ9bc8+P5TA1TLi3RvuoeZ7xciJ5HWCxPW5OIdLNTvqsDbg8=@vger.kernel.org
X-Gm-Message-State: AFuF++m7qiaZHucxhsflMuvx09gyROj69A9I892jIyiQLY8dW+3TAJv3
	HfdyNonuazgOOoZb0c57RMnYkl8Mbf6cjhunRh2OcetuzLJmUi5K+KrM
X-Gm-Gg: AYBFou3w0D/gU4hC/oDMvc6YJ3I11IXI/ou2MyQr2YrirZBzjTyJp0eU/RUQtGGahPG
	SEfpE6Hw6dHbmIfa1dMMXBJh3AZybdzxNuKj0V/SseDMmVGw3t4ZRbRmFjcFLBoMXQkgxGyglGd
	vA2F1/jJ4o1KuPfsJdBQdqg29Dw/sz59f2xNkxXqbNfragGGZIJypWG/VE3yUAqYaANKsqiUkhv
	0QEJvgtz+R60PG/kPX/sI0wYpxIawbv8gXC9s7HmJ5/I4zfElWH7r9VMxqZbxbmq+ok4Cg3rzSY
	S7W1JkON5hpDMQlLCIfd1fVc+NZoP4cVugDC9naTmYnOS/t4QVw4KaQ+7YFoca/5Z1zVA+hZdPE
	BMerAhrrtpVzbevPjAxP5SMDQKkyqz+3Dh5Z7I/n5KrZNQ3J3ih8xDnDbhOQMgXSPqGpZB0b1fU
	XSTRVdK8WQU6ViTN6nVAOenGaOXWI1aiq1WWSy8mcjyLh3oSKfo/JyQfKu91MV1zuJq2L2RyYWY
	vhcsBsQj7izV9g1lj2WrTtBmLbQBpA5q6SGPQqxv4Wkj2x/+cMYLrsjjcZ6qDBJEUdBQWMXMm4U
	rhv+eQUiyhL26BuP1f7UVUS+Gm1Cp/ugYtI=
X-Received: by 2002:a05:600c:848d:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a17b53c11emr3202545e9.13.1791261577688;
        Mon, 05 Oct 2026 21:39:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm62744995e9.14.2026.10.05.21.39.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:39:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ntfs: fix two kmap_local bugs on 32-bit kernels
Date: Tue,  6 Oct 2026 06:38:07 +0200
Message-Id: <20261006043810.5393-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two kmap_local bugs in the mount path of fs/ntfs. Both only show on
32-bit kernels with HIGHMEM, where kmap_local_folio() hands out fixmap
slots from a per task stack of 16 entries. multi_v7_defconfig enables
both NTFS_FS and HIGHMEM, so the stock 32-bit ARM configuration is
affected.

Patch 1: check_mft_mirror() unmaps pointers that were advanced past the
end of the page. On 32-bit ARM this clears the wrong fixmap entry and
the mount dies with a BUG a few calls later. syzkaller found it on a
multi_v7_defconfig kernel. A fresh mkntfs volume reproduces it on the
first mount.

Patch 2: ntfs_check_logfile() maps the same page once per loop
iteration and unmaps it once, so a mount leaves three entries on the
stack of the mounting task. After one mount the CPU it ran on can no
longer be taken offline. A process that mounts ntfs volumes five times
hits the BUG_ON() in kmap_local_idx_push(). x86-32 also warns when
mount(2) returns.

The two fixes are independent of each other. Patch 2 was tested on top
of patch 1. Both were tested on 32-bit ARM and x86-32 in QEMU. Details
are below the --- line of each patch.

Karl Mehltretter (2):
  ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
  ntfs: fix kmap_local leak in ntfs_check_logfile()

 fs/ntfs/logfile.c | 11 ++++++-----
 fs/ntfs/super.c   | 20 +++++++++++---------
 2 files changed, 17 insertions(+), 14 deletions(-)


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.53.0

