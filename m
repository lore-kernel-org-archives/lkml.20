Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680268;
	b=jGDnX+BRT4U5FcErxW8slWx1uZkNY7DPgjVNRa7M51wrKL0opfvpZzog86C956HcWaJM
	 XfzPwNkFZY5+MEiIgdE+ZJSCv/joH14U2bCiVr+rJHyBNrC0Mutb4DoOWBg4xU8VlB2cg
	 LCxheEx89BxS4ZgRDTLF0tkSA6HNOozhnle8OLEMo2MaU2cZj+yi9NJioD4Vq5Qa9wlIA
	 8mE3GzMdcB7YCvBd1psIYWNXx4mlbk5CZobcozJEF18Y3dwkZCIiXjS+JHIMBF+dZCBfs
	 nCcHA0ocw1DJBUxiBEYFB8G3j9l4WtaVDwhLfUIu//nAnhyPoSY/xnWcLKKoA1F63Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680268;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=TyZ0uphw6I1FTp55NGWewHGVl8XurKOpP8OmDv4LdFk=;
	b=Y7UuAdUw3PBI5fIEimyFwdf4tetvwxpGYiG1gn5fyr/Ttw/zJFoRNOFz5VzWmQMPPKX5
	 7w7ZQgosDxCSUwFDl/IwNrDavcPjGtPAp5fSMFtsf3yuaaGoq11nzHVtBUssJfDeDa3Bv
	 Tivv74w7p/DV3ficvCJ+je/XXT/BtDf2bIKU2a5bEVugUUixzRDP3rZPq8k7OBJSxG5Vk
	 G1diNTYnFXBY/c7q1fB+NACkfrIHtUuGMl8a6e7OhfYSqI3SM8+xvCHdgI5c6e3tPejQz
	 kI6a6pZW2tHsilaqeumCg5Ro64dOWAHkU98kZUiVEIMf2JTHTqbYrYt6XGXX7WdqjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6236C606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6236C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jJbHD5pvjz4yjjB;
	Tue, 03 Nov 2026 12:31:04 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 6A34V0Lc027414;
	Tue, 3 Nov 2026 12:31:00 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 3 Nov 2026 12:31:01 +0800 (CST)
X-Zmail-TransId: 2afa6ae9638519a-2eb80
X-Mailer: Zmail v1.0
Message-ID: <20261103123101983X-GcpSVEUXPi6IfXYLzKA@zte.com.cn>
In-Reply-To: <9ff68e0a-18b4-fb7f-238c-105e5b247a9d@huawei.com>
References: 20261102214934411GPsnXXiPDuCvO4pgPeTgU@zte.com.cn,9ff68e0a-18b4-fb7f-238c-105e5b247a9d@huawei.com
Date: Tue, 3 Nov 2026 12:31:01 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <chengzhihao1@huawei.com>
Cc: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAyLzVdIHViaWZzOiByZWplY3QgeGF0dHIgaW5vZGVzIHdob3NlIHNpemUgZG9lcyBub3QgbWF0Y2ggdGhlIHZhbHVl?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A34V0Lc027414
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 03 Nov 2026 12:31:04 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE96388.000/4jJbHD5pvjz4yjjB

> Above two ui->xattr check could be merged like:
> if (ui->xattr) {
>    if (!S_ISREG(inode->i_mode))
>      return 5;
>
>    if (inode->i_size != ui->data_len)
>      return 6;
> }

Agreed, that is cleaner.  v2 folds the size check into the existing
ui->xattr block, with the mode check first, and keeps error codes 5 and 6.

Thanks,
Shao
