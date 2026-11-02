Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606608;
	b=jwFhJfYN9NIgPWmD3KtdrrHfM2SLektRB4zMSBvpPwtXJq5gQtikWKD+gX2Wz+ocvv+1
	 rJ4Imbzp6syoCb5odprko7CYu7I77NMMALIAxBnuC3nkoKhqRVPRpYk8n3HuQqT+i5koS
	 ngbEeI9EqnG09l2I89cDofs4/yPeoEDTM5oY30HIC9Sgis3XdNSCwn31KsQKZ7FikTVFH
	 k1S3QAMuR+SDW2wmgSGvyihucs5QrIzw2NDGehq11LF1wa68uBEV2rQkJruU1rW1sH6Eh
	 s5NJvJlFcVf8te7F7x+ameUzSxTYlhQui7r9S3Vc+qaRdMN5VqHmi3IKfPVIjp6l6wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BvQOBeEgeIxxBCgao9mFgc7hIEWBp8H8nOx8FsWHe/c=;
	b=UF0i2OZOm4uQQCVmF9LphlZ0HLiG/FkShXRuMKx5+hmfuciecBZNci7IRO31dg0aJnf7
	 RVv/+/+33zWe/WnD+k277yjhbQH2gcglLKUYbp5YvHXi6bil4X3ddt0c9FIRTTLE9uYXo
	 KHCKHZp+nZAcEOU1fFt1i6T1ojL6yYqlYLnZEBq3ZrXmVBJQFJRXB791WKpa6VaWbzdZH
	 aAGjTSIti2XaGkR1a06vp88v32DXdeB8tldtRa1qzWbj9wuEaR2aWAqdrFLTiKwhbmMmS
	 Q/9Jw6yE/zPMwiCU7Qynl/WUQQhnAFiT9aUjhzpv+nh+bXYyzxeioJ25wLO80XzOyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fCdIO/Q3";
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4769606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4769606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCdIO/Q3
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2eac4877accso8692005ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606607; x=1794211407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvQOBeEgeIxxBCgao9mFgc7hIEWBp8H8nOx8FsWHe/c=;
        b=fCdIO/Q3XbQoznbzfGPC7Gkxtgmi1IwWqVyGSu41G2HKlQlsagFg3Zi9N/Hnx8S23C
         k0LIPfUpkw/b9mxMKcISRJmV8vHXdyHQct3kXqdodVrHmN+/oqaxzaJfubCjAu+kZzyO
         oFQY6s8ha5yDFITo41TTbCMyje5XsRwzK+tGcMPkcrlCMSgpPfu1ksTj7uobe9hGAWjp
         165YIw0/MLBGtuUIX6Aiq2oHtb9Z/knHlpiqId8Kz2lKQ4g3QT7mlawk3xqXRE06LfmR
         VuPSpeL+GWWZMRRONzLFLFbVnR2N4eeDFXrHE5/ErAS1OnrH6ZM+8Fua5siO50J0YEoi
         qZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606607; x=1794211407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvQOBeEgeIxxBCgao9mFgc7hIEWBp8H8nOx8FsWHe/c=;
        b=w9bwWBTClogHv7BU95pygqn1XtwrTlr/9BA4uzzbr9e7CtXSsx3Tppf22NOnBIgjtP
         03PH2HoUt4Xdo23Bn5Pl6BFwCQAQ6jNGvIaeC8lj8RrhbdRXwjurZ9UpP9MNk341sI2K
         shUNB6ZVRKpB4uHnRrUh9zRDLs3iY7pYTMpHGF5VFT7SGHYq4LzlROefNG6ikCdzM8/i
         EQl2qcprsvnAAwG57IcGVNbCrxMF3xYaU4UEUC8fQODuePKLM2abIAQPj1G8UTuU3tE6
         fjFM+jpR7Iu1uCJ+tRVHFiF2n6ID0zLef2AVzgWoZsSCFREGToI6fhmLtmxuQouhHTQY
         UcnA==
X-Gm-Message-State: APuU4Z/qRuBMH1Aazt4afFu8y472FwXOdoyEllrpjm/7TgIn/t7DJWfH
	u4iji/0X100oN8kESoMTYts7uN+kWRphdhMytEG8KpP4hJ1Sc0uE4GIL
X-Gm-Gg: AYBFou12qEbZM7MAYS8rFP7mIpOARs2/iHiiR9GymSFjGv69oGS0ZXb1wQQ7tea4jJs
	w4qAVHMm7KNS2O8+7RqE8pdLHlKyujT/jF7cY5VSFdCpUOdEHiSdStzE0ssqSAZBb8XudCn4ICk
	G0mCwInOurjlYXOtCXLbd49dl89yztnTcG7j7vGJfTMo/KvgIjj6L4Lr4L3q7OAI+vnB+nF4fW6
	WrPk22eFra5r/eYO6saZpUwr6s9ncYqBjPkyRVKyYfNB0yy5aHFgNizziyBjaNlGsKJ+uVhr/63
	LhRhHw3v771nZ2mASnAxpXN/A9Szz5ASlTAxb2X8w0X3p6Stv7bpScxOvQwfKqWMRkD/t7z0GEv
	Mx3vsURqdrj9wh3/79AgNZzN5et+ATWADGjTMNTPyQgS0tMcx8ziVOj1LJGezUPP4V4c46aqKK0
	abOe18FwVLJsG/yliwxLLfvzZZOhXxEwN6uZ9pGA11Ow1pAEue4E48X3J8/GWQS4hQwTPrRj1D8
	hVxoqKVvLQM3+5Qbl51VMWHYhPZtz18qjEdZPobH9cucBGxuZdoPpHzTOktnhU7PtfDJBPAaY3n
	4IQ+3g4t8paoSshTS9dY6pFv/0w5oc7Lq0z7CTwkwKcwGsWoHxxZRvWlQM4Lxo1G2JXtzCJop3N
	IBmHWGZmTor/eeNPI8f9+Ku2qsE7qNnLTHFXv2CsHjK2WOSNxCUTSWekgbdQiU1v+iYAYuTu7nt
	GjAz24UJafpLylyw==
X-Received: by 2002:a17:902:d50e:b0:2e9:628d:e9a6 with SMTP id d9443c01a7336-2eb364f35f2mr79754005ad.57.1793606606792;
        Mon, 02 Nov 2026 00:03:26 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392ae546sm24175165ad.70.2026.11.02.00.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:03:26 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: linux-kernel@vger.kernel.org,
	syzbot+018e6f695ad9bccb182a@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fat: serialize primary and mirror updates
Date: Mon,  2 Nov 2026 16:03:22 +0800
Message-ID: <20261102080322.1466478-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87tsm25wm4.fsf@mail.parknet.co.jp>
References: <20261031033232.2490931-1-matthias.goergens@gmail.com> <87tsm25wm4.fsf@mail.parknet.co.jp>
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

OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> writes:

> What is the real issue?

Only the data race syzbot reports, "KCSAN: data-race in fat16_ent_put /
fat_mirror_bhs": fat_mirror_bhs() copies a FAT block to the backup FAT
while another task updates an entry in that block.  I have not found any
effect on disk.  fat_mirror_bhs() holds the backup buffer's lock across
the copy, and every writer mirrors the block again after its own update,
so a copy that caught an entry mid-update is replaced by that writer's
copy.  The commit message should have said so, and the patch also lacked
my Signed-off-by: it went out before it was ready, sorry.

That leaves two ways to deal with the report.  Would you prefer marking
the copy as an intended race, data_race() around the memcpy() with a
comment on why it is harmless?  Or the locking in this patch, which
holds fat_lock across fat_sync_bhs() for synchronous inodes and so
makes other allocations wait for that I/O?

Matthias
