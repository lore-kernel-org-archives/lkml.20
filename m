Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863367;
	b=QaNZxGI+VQniE8uSEqHiMG0C3TjGKWUxJ/JfibY8tlxLXCZrm7854v0evazN3Q4ycu3p
	 e09ej2SKUfJQ9E8P0RxKOFDEN/xACL+JB7NsrrWVdcMYRn3dRn7KneACZ/Ni77SWsoQE8
	 /ujwU1rVMrXCfga330MQGfMLPK500rPqtRN1+NySJbfsM56ETTNa6TK6Zvp6ioR/ugMPU
	 3GGN5WhdH6iUwyxRECfvY6YuE8ZJsxv39VoOegHyFSXbbUZfJS751vr+TfzjWzYeDt6MQ
	 AaM9eiWJ56pFmYAjDOUsla3D+ikGtEierXSAbgPpGj9bV7veWc6rmkkE0UJN8BtHsAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/lMdxSYl0oDvZ3U6+DpzTx/kdROHaXy8vo8WHiex83Y=;
	b=pABGTt8lqQgT7+uI93WaT2K405kgPtYZKHGBva2nXB7GL1N1hg9gWlDm4ty1niRDND8G
	 08VBCLkq7jrwsD3ioZNX2hjPxNLBcxIDA6yC+bUX3OG4/B/Md1mRG97zzigpStnPCa6ot
	 e5h4L2bkIVDrGZOMgEc23okbU8VLrYu+32W3bGRdGJU/Q2yOyuu8eQ3xOjTDwiGNwSzvc
	 E34rFlMTXorBIggJcZnWvLteW1VG7gDHp9m9+orIzBZqGM/Zp/bPRh/sU5jIV/OAmYg+t
	 wSo75I2wd2anFy872Vbq/VPadYkAxeN6PrzWFXaP1i8/JbRlJAtqVNkB6tJeGogOCmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rx4GGI1g;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A5D606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A5D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rx4GGI1g
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so14617925e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863366; x=1795468166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lMdxSYl0oDvZ3U6+DpzTx/kdROHaXy8vo8WHiex83Y=;
        b=rx4GGI1gfhh/JrX38oW6mpA4IA+8BbUGemp4vzxzHldpCgcOJxiBOlrLfNxIhfFIaK
         76fa3vJcT92wxoiPXy/YNcy0HfLJH8tXnmuCmlrxqxhxxFsjBruiIzBwZRKeDJQ66a31
         6rqjOEUNO/tM7EYOjZxzZIWI6ghmvSx7u2uywQDxt9SPDhIAgjjpg1+ZgAHOCVPI6KEq
         yFrydTeb/o5uIv5OitXsZ5NaYjSUtsoYGCRjOxNUVmenRspvtFPx5d9Kl044W/yXfCW/
         OrOi/aR9By7gQsrGDMziqlXurYZZwSqh3l9qiKvuo+hEBdcBEyHRjtD4xlcKVMz4Sjxx
         F5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863366; x=1795468166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lMdxSYl0oDvZ3U6+DpzTx/kdROHaXy8vo8WHiex83Y=;
        b=gV5lfKHoqQy88QfR2Y8rCsRrEL6FF04GqKMSf3jKi/fNC5OuXzEKyBpnlxyTMQNGiz
         6z3VS3ypCHhgwbCW5rJ1hOz1xQmLKdK7qE9TtPJrqzgc6e6XpZP4ZzafjLe6ftlP0KUF
         IJIhUzh1ZUn6aq8SrMfV3T2YB6dO/EXspBdFOx+ogxQ/+0PG6rMHycHWO9JKRpxUZK+V
         COXWc57vCDB/FfkNQLdQsNfiBj3Bcr7Y7Gun7y/I9s2go01eR0PEUjljGZExNjPm98kj
         JagpgpAHWXHo9nYxEucsDEKGrju4A4oZ2iylqWeYRABupOk84cztqoz82paVOrBrlcXB
         X2YA==
X-Forwarded-Encrypted: i=1; AL+hErEboEw8JQKi5Ku2sTGwhaYdA5CJhajqet4NwBtLlQ9Z8sQIvtmBSH3X6k2pLPhSWTeILpviopNeFUub3XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qIc0RqsOs3FQ5btwVWsjo8vRr1cB13NCK5VvKgEQ09U7m+Ild
	PhET7yPTvm/m7+irgOQw0Qt5zQOjkmLp1nC4sQ+CTYgWhObK6G/34uDL
X-Gm-Gg: AYBFou3NdEILP9s7Aw2zhGCO9XW6N1IEAPTDsd57hwRiJ42zu8hXYbyfg2fthkn01mM
	vMiMZged/oBXX6KFosKD1zPKh9/va75sKOC9zEmeYMyajKz8XZ5ML62IKW5KSlzvjP2bwC0Nms9
	GydRq/Yb+g6nwSB82wV8XP5/Rfy+D/LIPF0ZlHw40b0v9B0Bf0IgxNdN+EpMX0IoUoCkJj1IaB7
	Xw2x44ZJohjHTM4o7qlLiCAZ7hISvskwPsgueb7dib+jbpwAzpam22etQHDjPTnLDNUCAUVlHS3
	NBmLAXR/4/9vxa6vxOR5oGlefUQtfZ/S6Hu8G1gZ+9mSMXXXpIkj+dPZlYOyrCdrw+oLYQf689s
	XJjEcoOUUZfUzRlxfMz8UlmEZQZvWfILvqteWkGhDJB8oDcVu9t/9xGiZQco7DVh1PMfpcpVnSi
	pmL30qxCa0yC55zRiPvsiw1b3LyT74UpNjRdv06t2n/D/q8T2A9Bsdhx5etsTmvIasevAuIZw+j
	0kHDoakmLnmBe8dc2CQKx72wHWX/KBdzvgFBn/bp+PcxYYfKfwGp2GwLj0+TDPzWdNYxgVK7c8u
	svBw/E9aKS5ozaGTMgw87qNJxMjBAX616TZiUfsb9WG0fsx+EIIdsZteDdIeXbpN336Tn5CRLQB
	fSNeO1dfgvammb/ip3CZ87tAd2t95/frAk5HmvNin47AzX6RaRKsSGCWYmk+i5AafD7Pi+0F7go
	JVVYAt8njm74M=
X-Received: by 2002:a05:600c:8b82:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb681476a8mr151777855e9.25.1794863365568;
        Mon, 16 Nov 2026 13:09:25 -0800 (PST)
Received: from archlinux.tailbe3ea7.ts.net ([95.173.233.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm24575765e9.10.2026.11.16.13.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:25 -0800 (PST)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	patches@opensource.cirrus.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: cs40l50 - fix OWT upload length
Date: Tue, 17 Nov 2026 00:09:17 +0300
Message-ID: <20261116210918.1940242-1-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261031095438.3070451-1-ismailtarim7@gmail.com>
References: <20261031095438.3070451-1-ismailtarim7@gmail.com>
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

Hi Dmitry,

Gentle ping on this two-patch series. Patch 1 fixes an out-of-bounds
read in cs40l50_upload_owt(), where regmap_bulk_write() gets a byte
count instead of a register count. Patch 2 fixes a work item leak in
the stop worker.

I can rebase or resend if that helps.

Thanks,
Ismail
