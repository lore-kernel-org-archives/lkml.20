Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519800;
	b=0ff8SV43hqhiomo9BJAfYNNM5zOgq1W9p7LN4f9zVNCwu8QUGnwFBI1xpukLcEV2AeXJ
	 GqZbvI78W5uJsc2lnbr7qCl149mQNd8liNvJM1WQrTaf64+JdkiRIKRoE4/JmWNnBl3Nw
	 L75kGR7ZZtqn8K8doeNMbutB5amEsE4Tkl3Pmd7LYEB7ZSiMcep9e34ciHg2FivfTyGne
	 XlNdm931nb1ieVSaMHZBXU36TznOkUiyly+k7sSzU7gyLk+afwrPLg4glBvzuepQXbCQ/
	 Qb6nMCg6k0rWEilQDjfCLqITfZr0D7XDt9DY7sWAmTISl38hDZjzL7VxAVhgipBPdRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3d20zwRz5YNuFbeVdw1xQneB3kQbFqU3BiherwQ14Wk=;
	b=itX0YNU9XSJwzvXAzZ8TH/IbZZ7DDGvM1JfIRN7+uN8E2UONQGQgMbQQIzpN6yRmum7K
	 TR++4mUJAeRAVigNMecHSzAovUGmOcli7ltrh6uKxCcmVtPMRXIArsSlmYU/+6lAFxv1F
	 iVJ9SE5pBeKlNTAilifvSdEZpQar0ooKKA5Q+SxC8rbn7thcuK9i4FqoMbTrsQS8ZCvVb
	 ey63cX6syFdVcYdFGiYgQrK85Xmp6Gal2mvww9Robyu3g1Ycir+77nU0TsGkfAcSDX0cm
	 6Ywc7wELUZrnNHjf2r+qyH7F8em5LuqaBQKZV1R/wTHuMoaRkdST+ND2T0gJ1j5z76w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKmvyu4Q;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9192606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9192606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKmvyu4Q
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so128617eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519799; x=1795124599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3d20zwRz5YNuFbeVdw1xQneB3kQbFqU3BiherwQ14Wk=;
        b=oKmvyu4QFSp9GgArHeORF7kzbbdhD4WnxKDuqTGPgo+Aqa7PKJSwxYu6xiDJG5H7VA
         xyVmIZiFSe+oykFMrwB8dqCVzei/d3iXqkHV2ocqri+pc4CvcrfUvIK7OKUsid/I3Dcp
         GJSphqURDBQNr9Yhpliam8vCNBzEqGp7BbKPs0RS0MSD7Y2QgJnetX27LouCHhMIklRO
         uF8owoyPkN36hOErj/pFfWPTOz7414Ly6m7Uh+12xdawnDneM6jPa630i5Pvz4FuDgH2
         c5IsnwlPPdOT5Gt6feJMqIjYXspw8Ismna7gIFescNvNidpHE3+/odBbqG8JIASyKQeH
         EGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519799; x=1795124599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3d20zwRz5YNuFbeVdw1xQneB3kQbFqU3BiherwQ14Wk=;
        b=qq/BGmf8403tFJaguDZtn61OssKngvvfKo2ns+mfrdln7LkbtsdZSmpVY1IQ7dTMWe
         po97wkpmQALRKyPFqaAq5afjG4410nIdmE+8f3uLgdPBD4Ur/3nN3HkJCFqnmMoDNHIP
         HcuL56dCWk2fqLYzjfuaBTFStDY4Z22WtKqUvaaQU/acY8bD5QYypLynNAT0CCfmXnQk
         UeZaC7fYnKSlln5x6qotmfphIjUf4zWvm/P/ZKGfSeVFgQKYUCI9B+Vd7zAyoik7l1kH
         6IpoMhrvQSlcR4MjhsHtSnrOi3ccEjsYd9gS90btZgAGgYl/Em5TynktChg12PqN2VGt
         GdQg==
X-Forwarded-Encrypted: i=1; AL+hErEwFAj+5Az1z2kFD6DVz4+8GaSWrIgIur9Tk1mQ7fFvsMutQ7g/++Q/LqZbwVXaUoPb+dBHPoLrMGobqn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TEbbqx6yJ63b5AAcH5SZF0vpQYVochiHeN11gh783kihw1tzG
	tCBn6ty78z3As6dCZCt67eKlmwcZmN3/Cl9HeNWR/Ox41XmjVHgQoIEq
X-Gm-Gg: AYBFou3g6u1MjS59Fjd1QYFl//9Ti6qp1nPNUiO2ehFswRrEcWsM+kK5XBNwxhrBH3Q
	9x3uAcUYBkS9J1rOdHUkZXVerDYIfYkvKDJCWzbilpOt4MvE9TKby0uiqwDtUGU162Cqo4AVrhK
	6sT2LdBuvpfSjG6SKCZCA/PJWENPTRaSxEROHvFuHXqGluEb1Exspraj35jQYf4wcn5VNBv0vqh
	CaBVQG27MhEGSIydYuSAzTOeTshAjMqAEHXqvGMHbhHXeBQzHibriw4WbPUuLTJ0bCkdYvBbQv9
	CJPFCRI4JkXJ9KgyfsRWVohDMDmBYT7bXg/91zaUK29zhJeD/Hzs55wF7am6f2k6iAaoLRyRCMi
	b9kqW/nLvvoAGTEoL2Ce5JG0gpaVpQspDs/Di99popx18LpNc0uO62wl5RKfkogTvxZvTeJnuP4
	dq27tYls0FuA4+I6MfCPy+GHOY5ub7mBvz4HSjFvCbEeWr3osmom9/1uf7eod5bLefG2CyImOMu
	UUTjmrMg/mcyadde8awdsDKDw8kop/Csk/P5WCLWS07RqvF8i4D/3cDMo/UPPK/3WLcHyuZac2N
	n4sISv6/FhCXefq19LKZ9D00L3jMgGVZZ3DKIQnE4d2Us0BilIukcGQTuPaOEXN7rCj5SCPYONw
	HDcc0O8GLKdFI6uJ1tLBrcng71xoLipD9EfTCig==
X-Received: by 2002:a05:693c:829b:10b0:370:ff2:f78d with SMTP id 5a478bee46e88-37965ca7d77mr461383eec.8.1794519798639;
        Thu, 12 Nov 2026 13:43:18 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm1194466eec.27.2026.11.12.13.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:43:18 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 0/4] f2fs: require write permission for ioctls that change per-file state
Date: Thu, 12 Nov 2026 21:42:59 +0000
Message-ID: <20261112214303.16198-1-dennylin0707@gmail.com>
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

F2FS_IOC_SET_PIN_FILE, F2FS_IOC_RELEASE_COMPRESS_BLOCKS,
F2FS_IOC_RESERVE_COMPRESS_BLOCKS and F2FS_IOC_IO_PRIO change the state
of the inode behind the file descriptor without checking who the
caller is, so any user who can open a file read-only can change that
state. Each patch requires write permission on the inode in one of
these ioctls.

inode_permission() does not depend on how the file was opened, so
f2fs_io can keep using read-only file descriptors and does not need to
change. It does refuse write access to immutable files, so these ioctls
now fail on immutable files as well.

Changes since v1:
- Check write permission with inode_permission() instead of
  inode_owner_or_capable(), as suggested by Chao Yu.
- Split into one patch per ioctl.

v1: https://lore.kernel.org/all/20261108045722.12091-1-dennylin0707@gmail.com/

Hungyu Lin (4):
  f2fs: require write permission for F2FS_IOC_SET_PIN_FILE
  f2fs: require write permission for F2FS_IOC_RELEASE_COMPRESS_BLOCKS
  f2fs: require write permission for F2FS_IOC_RESERVE_COMPRESS_BLOCKS
  f2fs: require write permission for F2FS_IOC_IO_PRIO

 fs/f2fs/file.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

