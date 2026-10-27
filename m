Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135389;
	b=2pFnE3OTI2W5rIqaikmYhvEV7SIKS350qN4d/DmZ5ggGCsM34bEtC3gWPeqgy0CmEYAr
	 idX6nSBKooNOaIVLSt7AEYynkPIV8nVevBTgMxS+d2mqFWH3tH5OhOlPXXfaGQvprm/IE
	 rjCvuoVYHTuDcdBDqiWDx8npHTcLKxa2DvJgwlPbNfsB+TlW5v8MUFdOUnqVia1kVPIMT
	 J6SsyysV5kjmF4aZpTFLdJO/nLdXaR3j+30iIRJf3V5L1CHK9ydWdbdZiAL326RmnTjmg
	 eF6w3Q4gSEgBmnO4RL+SBwYQa0bCt2b5WCN05PWXB57Cr8lq1C4MchL06QQOkg5fZQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=JKFrLSjwDHREmSvEFmSCml+HwjIVnw6Jy3aXf6F/H+Y=;
	b=WFuo+J1Ru5K+b05HOp0QKHXpJhqrubgmG/QGN6AjxtJ9Hd9VKXVomIflHD14nZokUYu5
	 m9nG3kQ1GWaKNBcsTvEw8wopt93fdU4dCVWNpWHN9FrcKL91zAz+7rKxauxNH+nmn/t03
	 O0xKN3OocmgIDQaapaTdD0qUptWXzTYJX2itHbJBDd+V7quFRpCo44MFitZXZm6/m+z09
	 p6/O5001r+YFyGkXNXZd/VQzPW/+Kl8JzdEMff36Kuxqurue/EvceX6oTvFJineY55y0N
	 Y1r/otMdskfhwztEttaxKechDs5axPJ++TLGEdA9RVV0OVKAdNO6/qfLzfZqvyzR/Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=n6hOQTUU;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91056606A335
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91056606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=n6hOQTUU
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91b8306b9f8so4935476d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793135388; x=1793740188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKFrLSjwDHREmSvEFmSCml+HwjIVnw6Jy3aXf6F/H+Y=;
        b=n6hOQTUUqngfoaAVe+wP7OipaQREpIZUTmr+9ABQ9A+RccYPbJ0xQON28EvRuyVBqt
         r9HM2iZE5cGg3PPNbG9WI93phORSXncFRdrjqv+ei/9HVJWZHrloHKm4dVwJcpKUsKIZ
         1pKz0CoBUEo0w1+Bv4ggVwqXdAraxzEKTXRBNPzZwya47RBli+DIhmUMFp4Ur5xfJGEB
         DVacZ4aD4hdYD/qdT08/V59jlYOFpWLjCJ5MJCxwT0+od31pmaugcsv9ZAAyt0DtpK6/
         FP7MKuzv8SSpxsigqar6AIaK6iqcvukWr6ltLO/guLJuuQgKnfFpDgSU6h1AfRjjYQvv
         B6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135388; x=1793740188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKFrLSjwDHREmSvEFmSCml+HwjIVnw6Jy3aXf6F/H+Y=;
        b=uqhm+gHngyr2/0Ye4cZjq9Sus9xAOyGGI4TwX/8FMBx9NDVk/yXi8MU3pOFhRtXep/
         sKmqKNidsEnBOgDyjK/g8XG0Qgnynfot2DbPjJjuPuWbxbVg2z8xd+5Oc7oDEOgTemWJ
         ojj7kPWA9Cc2MsRg7wyQSzs6/QzxPN3LNRjo4yIKMHgq9LdqM3hALRmue/4tifSX5WeV
         8xKpKtQWZRx1wGLu/Fg+no+j7EVIYK9CBAzp//LsTDQhPhe3rhkB6LCSvH/aYKu0qksD
         pqs5fEz3NkbnMPVQeJbPzQ8oHYmCmQJHVh4U4CN/pXj59VK1vz07KZgXuC9P1MN9xBi/
         TAcg==
X-Forwarded-Encrypted: i=1; AKwUvBwXY5qpKGnjEHLpWmkrTeVBC1avGUD3XC3ANJr1vZ4UXFVciwidMNOpCJ2VMWYc83lz4lLU/a3A0tnY5ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQKUMzHLFv2D0KM0sbSOIuP1DgNpPv9N7xtyXQhrKjliQAA4yk
	Lxcm4eoWvuzbc+P/PXCFCXn5tMW2crMqEDldRU5a8phwbskTUdyLgopb9lZ3/FPJnbM=
X-Gm-Gg: AYBFou2X2GAA1DQn/U56FiBndqQw7vQKMltTLlyI6NseURAl6GHDoD9XIIUrLbJrs0F
	AIv8WQfluyV86gHDyQ5e04bzkvUV9Xo1NutvkqLmuisF0v72N1+Lq2ZjkeC1WFLm9MRflaKBxA7
	nVuWR1ZYx9zWiM2mVYde4jOr2V4qNw5eU6aotqiyYMZY/fjKKNqDl1zZKtxXh5X4zmQYWdmBAdr
	PdSkV/JLyWxJDwlAIKfKfmAs1a7bwhuRSzQFJS088LvPx40ofA5FRNQw85RuKuCfZ4i4/8lLxwW
	a83YImtZIFejhNy9mpcoCosGQ1X8bI6ssznuXHhAWYnUwbXso4zBvR6haBve2KLwBidK2vo/iDl
	gzAXxRd6zuEgyBFj1dxCCprLfq1h71V3WBXVad1epewWkzNNxXJviCO3ZXsNe5oi97+ezoVg9Yc
	3oQ5IneYdls8D6ToVGsz8Jlss49cwws2CBaiGg4or5nCbVdf6t+aNx40I5wXBR+VZOpwzbTPx4l
	B/lRKBvkE7NVvldef7yKklMASJK7E0dZjNff99CjtyBqMo8MsEXEynV+Twtk/5btsHTvnzt
X-Received: by 2002:a05:6214:8611:b0:91c:772d:fd7d with SMTP id 6a1803df08f44-91c7cf8f9b1mr5253166d6.26.1793135388396;
        Tue, 27 Oct 2026 14:09:48 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c8c2b3sm113364796d6.31.2026.10.27.14.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:09:47 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 21:09:28 +0000
Subject: [PATCH 02/10] ext4: set SB_I_OVL_USE_SYNC_FS if there is a journal
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-b4-ovl-containerized-sync-v1-2-802e512379a6@toxicpanda.com>
References: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
In-Reply-To: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Theodore Ts'o <tytso@mit.edu>, Carlos Maiolino <cem@kernel.org>, 
 David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793135381; l=855;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=aO8AZhSXBs2aP15NSjU103SL3h8/eCNuFcd5jsKb2vQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLYucfR36lRP85t2sKZ2ZLaJ9rWkQsjCap0MbdXMa/mnYx1Aa41Uw40CeY2ykt+WukwlWz8EyZD
 bupKVdGj8SQg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

With a journal every change of metadata is part of a transaction, and
ext4_sync_fs() commits the running one.  ext4_write_inode() has nothing to
add to that, it only forces a commit as well.

Without a journal the flag stays clear.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/ext4/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 3ace06b4f9e3..037e274dca8a 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5542,6 +5542,7 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 		err = ext4_load_and_init_journal(sb, es, ctx);
 		if (err)
 			goto failed_mount3a;
+		sb->s_iflags |= SB_I_OVL_USE_SYNC_FS;
 		if (bdev_read_only(sb->s_bdev))
 		    needs_recovery = 0;
 	} else if (test_opt(sb, NOLOAD) && !sb_rdonly(sb) &&

-- 
2.55.0

