Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.242
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563585;
	b=e2gUUeB7rgLflZzbpubNDr5Z2JKE+nfUNgCs8jqJT3ixBWMYno/aKC0bpfIsMh0kb/vn
	 U3peD5xKCbR4qdJxbFIFNu7zEnOG7+sSOBeIYaJRkPJIV1Sx+Sc9BVYj5YhCwHeJvyYIk
	 Fsn02a9u8Y7XlZE49JgEC8VOFJgUFd3SPEcGDDZhLvxkymWCLiD5WPzX2IdqvIUDdujce
	 mGoAZQxYx8cxPEUE2pbL2o2n2vy2CwZZQMMoc4ZCmJyhCIazMzhjgZ57s1zWotJL11aMB
	 RzfNJeOWeP8hWqOqR90KJY2vDSr/hO9CdUuUzRVCxkv0lw2jlME5mLRM1w60MqmZIZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563585;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CdowJsXk/55EEpEsAWxQxcRytgso60wJrBMLIWLRJ3s=;
	b=K9fYrKK3uJwpwOYUfnfq9Qm6/V7ty8gq+A4W729ibkS4ziLgbu5fJEQM7DAGqnt/hTfU
	 7Hdw6XBu/VUZlpthpz1bAbP8r+rEvEORFNsR1rRgP+oigkE2pepEiNG0JSHuBJbYeJ7Qx
	 5ZjDiTYinw3n0p4LovRyylAY1zd0wAxcI+0a60eeJLENGSj0rNlNKQb3LinJZ0Bz+sbFY
	 dIxtOdOHwENAoumARO4B8Fkn2rNZrvACziTkCfAq3vRX49Pn6YHQ/sl9UL/8hhOVf8OZF
	 YCloCo2GcCikm+xUJWnllHQ1pLkHQ0JiPEZJfP5ctqyVKvnU5AnFQbqpd00MBUx9vyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mVjfUS8N;
	arc=none smtp.remote-ip=95.215.58.242
Received: from mta1.migadu.com (out-242.mta1.migadu.com [95.215.58.242])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56C2606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56C2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mVjfUS8N
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CdowJsXk/55EEpEsAWxQxcRytgso60wJrBMLIWLRJ3s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794563582; v=1; x=1795168382;
 b=mVjfUS8NmV4pon9WzY71EIZ6BbrEYYF61PwHr2Z6qhbQL1+EHI0smpPWGm4wF5/hwepLIN5m
 MY0+/Wevs0pqqBfLJXq9AjpNkfVDwTSKmiluDzdH5TxGzgDczejpLl4FUKt2TX02w8DK22lTTIE
 Vf7XjrJkUp2zp8tleviGwutc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7be960e5f0abbd69;
	Fri, 13 Nov 2026 09:53:02 +0000
X-Mizu-Trace-ID: 7be960e5f0abbd69
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com
Cc: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] fs/nls: Add codepage 720 (Arabic)
Date: Fri, 13 Nov 2026 09:52:57 +0000
Message-ID: <20261113095257.2034926-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87ld72f9rf.fsf@mail.parknet.co.jp>
References: <20261108200141.383158-1-fuad.tabba@linux.dev> <20261108200141.383158-2-fuad.tabba@linux.dev> <87ld72f9rf.fsf@mail.parknet.co.jp>
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

Hi Greg, Ilpo,

On Mon, 09 Nov 2026 12:51:32 +0000, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> wrote:

[...]

> Looks good. However, maybe no maintainer in this area, so I'm not sure
> who handle...

fs/nls doesn't have a maintainer, and Ilpo took the last fixes there.
Would either of you be able to pick up this series? It adds the Arabic
code pages CP720 and CP1256.

Cheers,
/fuad
