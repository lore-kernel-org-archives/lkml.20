Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111900;
	b=yC1O1zug6PEemsVqmooTizL3bL9lP+cMMo7BEe68kOo4QsW5uxUWHP0yZvIoKsfAqwvL
	 d1fPnae9tvoYM+UMRoXfh2dRKN4zJxlDfnnOgCiLJcvSqWzGrLelDBPLU5PJe4I6A6wLQ
	 qOBGHomBHMp2/w3DVmYujZ//tItIw5YFnwBoKMjdIJFTjVS/aTogmgx/EY/yNrrX9K/r+
	 v03O2lX1Dru89GTif8YOqXbFYjyym4tE4qhYEBgcY3M1irYehTRkbuW3NGe1u/CTC5YYd
	 5doV3qhfNiHmppveUxcBaK4g9wfa+t6DumwEcuC7mVxtYms7pJPxkDzSdJcXGv3Xdnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nr2Wdm4cU+m3pqBJ2boexNpwuovYPWeiRQ6Ijfa/2ao=;
	b=IxOWQN9RAYwjnDMQzlx2O+b2dAF/tWgjL2/eBzon8xJseuvuUV5/IOLraI2zKLv+nlur
	 KC9yZCvk2LRlsA6OE312lNepos4SgOmaMb1bpgNHmfskSvLNtoFVOQcjG7Rw3ZCGRCL0a
	 pGGWMmNubzXyGtxKY2+Y7nL1XOssWgEz4uu+sdw3YiFYJdkXeODUf6T0x172hj62jjfLx
	 EH8wCUQkZOY3hSvSv8Q7nNgp+PURrfe+40id1Nd5lMn+F7OyPM25S0Y/rASx9GWmBKjOB
	 ZfMOuTlcL0fVBevAk+JM8TxzXitzyy4aO4or54kQz/wvQDlgiQp6+yYhnbL6OY82pnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=r0Tut1ve;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=xTksu3W2;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D603E606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D603E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=r0Tut1ve;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=xTksu3W2
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84LU3B2913707
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 23:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=nr2W
	dm4cU+m3pqBJ2boexNpwuovYPWeiRQ6Ijfa/2ao=; b=r0Tut1veybdZKVhIjzNS
	f/LbH4m79onai7u+naDj1RMu+HNEuFy4EW25wgHYDwUimFujDwGDDoGf6N117nf5
	uxobIRKETpZGhznp3u34Tl5TgHaqv0bnQ8Wuzu7uZkKLM/biJeU7cKhNU/33t13Q
	WN0PyPJrrTIUmjAY8gvvn1HaK9/iKxwCbfbfQuMH2BKmEpafDbP0y4AyFwysGrBM
	/p3onW7+72iw/NbhjSgF9lWLBEUhinDoL7ACcEGUSGewPnLfn9RvyFZAjUcKzz7r
	3d9LPmAppzpzs5jypgm2G/Cf0Y3WFYa+F9wr7TGDC2fzDzKBNEpmXzUYEoaeif/I
	PA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ht6ynabh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:24:57 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536720195ebso5076701cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794111897; x=1794716697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nr2Wdm4cU+m3pqBJ2boexNpwuovYPWeiRQ6Ijfa/2ao=;
        b=xTksu3W2zbddPSvYXw1KCEPKyQ8qBoo9EWhExte8YiKEgvH/b1uqj54lAPkSUtshxz
         R0nQWjqIpjdswYs1BztX33DSElMaiTU3SOLuC9DUMt3IKglPtsTtvi85lBSBRqoD7n4r
         pIe11e2KTT/0akPhVzS6SeVzTcPXY1RAuiFrwXQ/6pgfHtqq8BUP+89OHUX+G6NddL+2
         1A0+Lj6OambObz9K8O2BuQhPGgvuQWVJnKC0mGnhSeg7/S4JZqAzjFECylaVaWgZQCKZ
         E4O5SAuehNTnsWNfYBMLHvjcPujC6u3iqbDA84/Un2enK7AH6GttY6Iv333XOhaB6GTT
         bQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111897; x=1794716697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nr2Wdm4cU+m3pqBJ2boexNpwuovYPWeiRQ6Ijfa/2ao=;
        b=FH+HJcSOUXO1+A9DU2cTVHA2b2nJePr9lDtAPszPICScuKnxvQx+6d1QZiInH7C9S7
         29LC9zPp2yQsfaTb+N0ShtMhFgogVNBBa/kKj3DFqt/t/rMr4GWZuZ+I8dnJ7aAaVeKe
         tqCN4RYrioRa5U/KZxKuIqLyBA/x8G8MeJaEfi0ooimNKXTuMvtYwibazkZ4uUmJXYxB
         pq/WaN4fpTmWpkqmrgWSG9ltK3n3ZPKQPaDhY/QKlt5frrLIfMZXnqDYTnwwvjKVvPL3
         c5v6dY63e78TlSLw3IIljkzBOPStmiMOLMuLci8fCWDRaMKWz9H55MnTS9NJEQglk3sR
         hcVA==
X-Forwarded-Encrypted: i=1; AKwUvBy6LbbfVvjgDVVT8qRC4e467dHWd7JpHamL+k3ONBoDFJvhopNpyAOvRK7l55jHUN/Q+KzCnlySMhy+BAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y+NE0iF+KEOu75AaVKVjrjJGTYn5lRAS9CeXdbG4vA9Ac2+ll
	I36thwj3p/sneJfjgaBuLKYeHWLCqnIp3borOspb/uQcFUWojFSEEebE5LP0zkGTGsquLXoO1zK
	lRj2jVFMsGODyZpzAkrQGnp/GjVxaHzh00psveI712JQAon+xMqNJVDv5eECaNA==
X-Gm-Gg: AYBFou0CLNnMbgLplajySSADhnKhgLhpHgWAFz5nHzKg+qFwLwkS3deogOCCVF9GUeC
	x8FJTRW+8bPya9ma7TJa4kc/M7pSvOipg0NXhK5d4EcDX2lC7O09Ue/SlGip+h6oYcwxbiwi9Ee
	Xf2qmnYeipwX7Kiil3fKO4UAoSsOegd7GShDzYkNJdEkAtRuinRJbclIFWa/P2UqLKk2nEAtY/3
	UjoapbqWTr01WeNDoG0wzBJnElt0Yq9053xL9ZJsNo9IZdUBbJtc6qBRNpqRtSdgTKbuOIoWqzf
	v7r2e4v7PaA9RztpdHryfB4yxXPLB1xpz2UCuZu+jVYoq7PtLKJDL+4PZfUYA5HNsa0dQNz7YlM
	wzyT/4AjxCviwGGov2WT9FF7F2D7/rhxfJggIvC0CtGQk8XAi7jNYelk/sIDgpen6FVsoZPNlas
	AC/Cd4nEp4scxeFk4BNQ==
X-Received: by 2002:a05:622a:5507:b0:535:36d:dd97 with SMTP id d75a77b69052e-552a50afd9cmr5945811cf.48.1794111897267;
        Sat, 07 Nov 2026 20:24:57 -0800 (PST)
X-Received: by 2002:a05:622a:5507:b0:535:36d:dd97 with SMTP id d75a77b69052e-552a50afd9cmr5945671cf.48.1794111896856;
        Sat, 07 Nov 2026 20:24:56 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eceb56290sm10085586d6.1.2026.11.07.20.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:24:56 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 07 Nov 2026 23:24:35 -0500
Subject: [PATCH 1/2] block: fail a short atomic bounce in
 bio_iov_iter_bounce_write()
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
Message-Id: <20261107-blkdev-atomic-bounce-v1-1-f66344262096@columbia.edu>
References: <20261107-blkdev-atomic-bounce-v1-0-f66344262096@columbia.edu>
In-Reply-To: <20261107-blkdev-atomic-bounce-v1-0-f66344262096@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>
Cc: John Garry <john.garry@linux.dev>, Christoph Hellwig <hch@lst.de>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111894; l=1259;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=7TVx2/mnFenAz9IetxnT56jaB8MDSx8eh+EB+HeZVY0=;
 b=gtfq1Uu5lL/o51CiwuZdW8JnZsS7EQmgCr/CjLWHC40wFPmi8TmuWNFXBbg1XMM4G8/JGXrcj
 IRjI+Ygqmz+Ci2lYcH5eeFDgH5zKF0bslDSMzRf7bm3ZBsZZc9/7jcr
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX9HewfflVsl3p
 YuB6p6YtBRDrOK3Xyd3587JZH3b8VorJJ2Fc2pVYQLiHPccfgllSKOKr+B4eCMTjfj8+wqnQBFj
 wZVTEiWCMsJUilzHlMXZ6tpiK6pgescrtXBe0kFMtolyOm57hHiz
X-Authority-Analysis: v=2.4 cv=YqGa1IYX c=1 sm=1 tr=0 ts=6aeff999 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=zEHqqOqeF9Yo6E5rROsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bmp-5SYbGANxT6MK1Ze1l3fIGtKHu-t7
X-Proofpoint-ORIG-GUID: bmp-5SYbGANxT6MK1Ze1l3fIGtKHu-t7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX87WPxAST33sX
 iKM0KhuVz9dENYZcVCs/MAegQ3F3Fb/QGAigkGZdmwQOBdJtvSm1aFLtOmIGIbpcMh7TuQumcRA
 oQpUEjKThAA/v4KEHpUmWhgYWUlFupcuzy6yXuKqduNLImFC8A3Z2oojM6uuuG6NOK4BNxHKb6i
 rdxKM/KlN51ieZOx+JgUAl2YPH5IBCqfzC/AtO9LsQJwjFGWR1MDJuapIkT9I1gkKbr6nBjC5O3
 Oc40mQSMWHhrlYRQ/yWNiW3mJVK3PmdzmIBt/hHEc757SQqUIxf7+inDqsePC9+1ZrLZoEmfMOe
 xGDyg9ngfUJRgEguR37ytuURQy93r658QBYz7Q/hV0ISecv8DjKs7+eylZ6tLQBcKeEdeF214jp
 S6NzGzgCopy7w0WJ+jez+8OgEaexfgtRUqBpduaSKAJ/q5j2LjkJEDDohrn2/9ztCIFgT+BJLuT
 pk1XsC3IhGTywaCvbxQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11959
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=10
 clxscore=1015 lowpriorityscore=10 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

bio_iov_iter_get_pages() fails a REQ_ATOMIC bio that doesn't cover the
whole iterator, since an atomic write is submitted as a single bio, and
submitting only part of it would tear the write. In contrast,
bio_iov_iter_bounce_write() doesn't. If a folio allocation fails partway
through, it returns a short bio, which for an atomic write triggers a
WARN_ON_ONCE() in iomap_dio_bio_iter_one().

Make bio_iov_iter_bounce_write() also check that a REQ_ATOMIC bio covers
the whole iterator, and clean up and return -EINVAL if it doesn't.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/bio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/bio.c b/block/bio.c
index b0fcc69de653..61a3812520a2 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1523,6 +1523,16 @@ int bio_iov_iter_bounce_write(struct bio *bio, struct iov_iter *iter,
 		}
 	}
 
+	/*
+	 * An atomic write is submitted as a single bio, so it has to cover
+	 * the whole iterator or it would be torn.
+	 */
+	if ((bio->bi_opf & REQ_ATOMIC) && iov_iter_count(iter)) {
+		iov_iter_revert(iter, total_copied);
+		bio_free_folios(bio);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(bio_iov_iter_bounce_write);

-- 
2.39.5

