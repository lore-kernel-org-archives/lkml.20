Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874666;
	b=OY87w9jHbREfRS74xiM+CGRz/paivweJVQmBjawyYDkDfGmICHt86794uWg0EVoeo1C0
	 3LpXgLebdhNuZxCwM6NFhOcluVFoxT16vCGUEV5JAx3i+4DpqZRm8JjpHlpGZIAhE6mR+
	 7WqJvkX+TfaBYHtczMCTDwWLeuAGGNf1RXlQKW6Vhm5vQ/5ch5tO5fZqUoT1v6NUKDjZ4
	 TSeevMGgecZvrknlk3IWT0sVsrcm0h2YoZCLTzqUrQB1AiO9CjKyJpNTU/+M7S43iqe9t
	 uUFbA3yAwQxzUMBOelcHeY2lVaf+mwsraF0nisIldV4H3aMzsbfCiNDC7vl0W+dlhcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mZCjeYoVLTXgPtFhooWOdAgqkSbxaoBgREf6dkUm8L0=;
	b=X7oSlfVeVJQ5CELvO1aK2yoS5My6TO618IHQ67u7WA8vDLzcmoKzDZhh74s17UoJz4OZ
	 r87rFi8e39G9sivjiXlwzxUSu8Ufv03omWlphMQ/o1deZwzPzf0291/Ogb80lytMwaad2
	 xdWOoVnVpDXToyD4I5nyawV4cEwCf1salVoyZJGNqU9xmkKhMFspxtxe6/FInk/tkmqM9
	 ldWqrogJm66ES16k52mib5fqAvGkhmR6leC4hF249INYO22hofP8lRgzHlBzt0YEeSNCk
	 9oUStWknBivqLLXwUerc52zv7zhWey76CZ4FBNllFLZt57P0N5EEVkN/n0RqMNOWMSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bP1+urcu;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE772606A8A1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE772606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bP1+urcu
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b1535be329so3014988a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794874656; x=1795479456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZCjeYoVLTXgPtFhooWOdAgqkSbxaoBgREf6dkUm8L0=;
        b=bP1+urcuvG16SgYF1OlKCcQwtL5AF2QgxhzyAilER2O/2K10dUgzTXa2OCmKoNV+oR
         WshNzaqsm8e87NiYj95klrjEPXi07MY0D7RS6hFSkKfj4s321WH0gOOkTIR427iLvMjP
         DPFfvlDSsAOaWbYKSoUnrLZcjBnC1rocwA20a9NoDnI6K3v3cusl7Hj7SS2YyLqLnB6B
         fC8Cmlw/fMS9X0nzccc1Fs391BgFFh46sagagHoFRIHIDQ0Ycnd0fu4/7kgzBM8e0Qwd
         TBN4a4UdNCRqVMOzg1bhktc8KOeFfiAv/Cr/FzXg61GfZenrNe61OMsNR+lZ6ctWo5v9
         1R6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874656; x=1795479456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZCjeYoVLTXgPtFhooWOdAgqkSbxaoBgREf6dkUm8L0=;
        b=OTURteenTzOVOx0lEg3wLybnNbkMLh7nbKMxEkZ02Z6tEHljru/5/g8LAjeQe0SRRJ
         MRtKKw/HERM5cmbXNLY+XI1OhmpPcoxascct6sR7n6rv/ysy1rxdUF0URDr3ZmAeqJSo
         HD0nulnqdmV5j1KiF3GRgFfiYaZr3UU1wZx056mwCpsLXzPDthDecQZpAATopni3Iuu4
         8xe9BPTBV1/qEvAoLCO5UiSZw+MfVm9k10LF1ta9siC/mjEAvgDTxY3QZQ7JmEnit3ve
         v+tSKGQaAtj2R3z+oxdfQ4IfXOrC4e4SVudofxAJkbS7nKUivtdNBoL4LeyDdjEO2Aul
         j1/w==
X-Forwarded-Encrypted: i=1; AL+hErFzTH3hKJZhELycoMQXiLYQyfyf4agxCA9loqr0bZfQe2BuDG5ocWjuk3f1mAj9AlYGf1pg3gF69Yt/aq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IorSYDfTK/ZDto2WFGUHRe8KoKtU5FV1PIqkp72nF8/llJslE
	XEM3ZnzSwa0kvL7O/DBI7EvKff3o0AzbntP9tCcg1xngzm+EU/1RlvEe
X-Gm-Gg: AZFdTZc6btR0kbq3JJsvyu6LKjru+jc4VZQKj+QkiyUVQm8wNuwn3lH1VqfcbgTqGgm
	+Vc3JAPPUP8NHRXiyNF6heHS1FgwUjbAIeIcdLDBt2YwkBLk/NWbQliUvoo5UCsLngPuO1UhTbE
	Iq8cvJ1sZHOUaQJCN6g1YAKPn6ZgZBVFS0FvY9Jad0R6UnlepwnJpGT80EI1eTqWp0UB8vuH/MA
	8cKTY3Yae6HMd63Y/Ppzxfl9xWlOK47IkReRQUvGlRUGDHiLrzzkPHM84yVUFwNhpn+kO0gU84U
	4AovO3ZNBv7pfiwjZPV+WgZXws4TbnKstc75Wouox69PjdS2QXZ9qkiWpMZjDNPyosmHsDRQRiC
	OjX6z7zbpsGoqMvy6CdVUVB5dN3QaOE5ZiS7u2fy0kUMYeJB0WmT8+o1D65IKQB0Pi9Pn7HLDTl
	dN2q1qKp3gwFPUAAFS//NHQmbQkyx+1VrJrzLaZI8ge3oZU/tqrSdp2WhmUuHQhaXUojt74BRSH
	guNQ4XpRspWjgmMAUehHGLJ0e+P8oV8AudAsWW3DEBcw5JN1DQPZt7hdxyvmKOcj7mFXdsETPAX
	dlYRwQtNPY2kq+CAj3xk0j2+CRAOJm156MLMU+T41dPOULOEuOGYxu/X8wewEveJP+X0nZU1Yh2
	M1aGBrfnjEBVRmnsBxxhZoyiB2f3A58dWKqw3mIt9vs/o2RHHgM/IdBgYGAVBwk87Oz5MuYltwu
	dmJcBZcQp1FZXKB3weZNF4obYyqTwDcwRl45gfly8I
X-Received: by 2002:a17:90b:5585:b0:3b0:9e2f:cfc3 with SMTP id 98e67ed59e1d1-3b1b0a0ddf5mr11086246a91.32.1794874655997;
        Mon, 16 Nov 2026 16:17:35 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe77179sm1194081a91.11.2026.11.16.16.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:17:35 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Allen Pais <apais@microsoft.com>,
	Rachel Menge <rachelmenge@linux.microsoft.com>,
	Hardik Garg <hargar@linux.microsoft.com>,
	Adam Kim <adamkim@microsoft.com>,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] smb: client: fix unmount busy dentry/inode races on openFileList
Date: Tue, 17 Nov 2026 00:17:31 +0000
Message-ID: <20261117001733.192399-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes two unmount races in cifs_kill_sb() where background
paths walk tcon->openFileList while wait_var_event() is waiting on
cifs_sb->outstanding_rreq and take new cifsFileInfo references that
outlive the wait, causing busy dentry/inode warnings and panics in
generic_shutdown_super():

- Patch 1 counts queued oplock/lease breaks in cifs_sb->outstanding_rreq
  from cifs_queue_oplock_break() until cifs_oplock_break() completes.
- Patch 2 counts persistent handle reopens in cifs_sb->outstanding_rreq
  in cifs_reopen_persistent_handles() until cifsFileInfo_put() drops the
  handle reference.

Siddharth Chintamaneni (2):
  smb: client: fix busy dentry and inode on unmount from late oplock
    break
  smb: client: fix busy dentry on unmount from persistent handle reopen

 fs/smb/client/cifsfs.c | 10 +++++-----
 fs/smb/client/file.c   |  9 +++++++++
 fs/smb/client/misc.c   |  6 +++++-
 3 files changed, 19 insertions(+), 6 deletions(-)

-- 
2.43.0

