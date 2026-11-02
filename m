Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606843;
	b=0h5eGCbexOtCvwj9evjIGSK/2CJe7zoq8UXhMRRlLEINgaGDcGR4xyc94Ci0kWcVjqqK
	 GNe/DISwNOyecLFbn46tbEfMdQYR9gJ7Lpp46Fsdw/S+Xq3gfVXQxVQLwZFXImgvk7Ema
	 4MuNAV4KGaNxGtOAQth4Qn4XqqUM4hwLyZF2rhfTh0Atg104lDmmRgfYDIP5BH7IhWyda
	 DMaOYQ2CSsqWqIYPfNtqTFDWtNw6oSVxobMdRqvVY2KCwQB/m1k5Tlc3n3UOPPLTxb0OL
	 Yn24Pa3pNAy628s3OIEapaFu67rFbKO60FKzGYvlpvtrs2qPUZ+/G1M8WOdHJJLnnwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606843;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nQjXmqGK5AW9/D5/P6wpNA06FJUe5Tp5fUtCfZHHY/g=;
	b=j9q1+oAYl7gru/a61PXoqVJiCl4saqb9JcudHJK90MaIqG1dduFZ8QB+cLiI4r4ALUTl
	 GRNIlQ5x44YiEtLSXDMlnpZpIhGQ8gTib7MQr5ucq+Q/DZMEx7J9RQe5Bm67RelyvaPpU
	 TK8xLrhvZ4cVc2fSXNVfeeQVk0dADGN5zWC6GANAlwwCHAl88vB0m9/9XGxGwi7RpeqB7
	 UrscPW00oh3+MSsKTc8b6JqfX7usVWQ3BUBeUZVXL7r/Bc4DExmJZfjP6hiqsG/Hx6/aw
	 RUO8ThjMeGc8qZovfELwGjqR92cxYGa0EiTN6bZK6MgecIgvYlrMlLiGlpMq5oWqgIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	arc=none smtp.remote-ip=61.135.153.141
Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5874F606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5874F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793606838;
	bh=nQjXmqGK5AW9/D5/P6wpNA06FJUe5Tp5fUtCfZHHY/g=;
	h=From:Subject:Date:Message-ID;
	b=LJMyLkeNkn2L7RCTB5wWEIAzMFIBtsRKbC6R3nZz9nZPMlsLCmoOhbyAAiZCunqbU
	 mecMJLcWQQDiKjxI/NyRX+hSB30RHhUZyjDURsdW4NY1BOm5ah8k8Hp6wvuuizxJOE
	 a4TmZ9zpDynj20pz43oUgsp419UZQzDTuC3SBPe8=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6AE844AF00005DF0; Mon, 2 Nov 2026 16:07:14 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7342496816423
X-SMAIL-UIID: D4500AC0174D403298AA3D7845CD29A4-20261102-160714-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+c8564fc0a96e3ecbe4d4@syzkaller.appspotmail.com
Cc: agk@redhat.com,
	bmarzins@redhat.com,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mpatocka@redhat.com,
	snitzer@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [dm?] WARNING: zero-size vmalloc in cache_ctr
Date: Mon,  2 Nov 2026 16:07:11 +0800
Message-ID: <20261102080711.418538-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ae61f5d.61c4c7f9.11e392.001b.GAE@google.com>
References: <6ae61f5d.61c4c7f9.11e392.001b.GAE@google.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

Introduced by commit a2f0a98b13db ("dm cache: drop redundant origin size check").
Reverts it can fix this issue.

BR,
Edward
