Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E711857EDA7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177551; cv=none; b=ZbrmBgyxiv4vSxboW2poedzyJ7gXo8fQrpKqW605xTgDN9DNCo+HuhcLOVWjfcPRCseBhMuZ6INZrfGae1lj+nHg1T7iJTQPvk2wYhwHq6eIrHL1fZM+S6nvzv9QRwVVlBryWI1bA09fdJZZATP2gLYEw0vtdHrxETkuysOUqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177551; c=relaxed/simple;
	bh=mSR3f1gDPChfk7NMnvIsHTprfuzaYszs1yxvY+OqOhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnsHqoRd+pK4W/5cUo0cAKCLz8sM4kwJjhddTCZ953U0ZjRtgpsE7BYVjipKI0B1BDqXdCWmmU4iUuXKGkrcIofQcGGeOb2Ab3Nd6gLadJ5jJFT67okYsGWLbYlsZAvc52RC7ZbKuU/Lhkxr6/JWo+BdGBQb36VMDCQ40+ZNrTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAgeQI72; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAgeQI72"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f9bso5685955ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177541; x=1790782341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eizHbalFVOzT+I6Ooa3gggOLwA/JPAGjR3GiwZpUvKw=;
        b=AAgeQI726MkCk/oA1+gl/roZwc7xD+ivXB8ZSA7SS/+SvqCDzWUk+7PwsKc+KDS3OK
         +0nYdCrpyZFv3k60oBV09l33TyDItkH9bXLOmnU6MGEx9EIlsu39VgJfJZ2Yr0l/tarp
         RpeMwy/S5449U4QNmnHtlGHrauKlDPqlp9uJJIzZw5G5bZMUEBc+FuveLTU43f7Bj9yT
         xaHb2Cg4YDs2xOHwc28sVnK7g6qfuj1tx81JcfiTkz5jRZWwX9FganBAzow3Xb600PSx
         dLdg9TuheoP3R2o3B7YmotS22lwRt7Bfyo2A3qF8WmUbntKq+tMVRJN75xh/QJDWy/jC
         V/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177541; x=1790782341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eizHbalFVOzT+I6Ooa3gggOLwA/JPAGjR3GiwZpUvKw=;
        b=i+ENkLm8WCrNE5vtIGcheYP/1TMPhU+DdW1IX8F4u4g6tQRc4bHqDSyZA7YSJDg+pK
         dgmjtde7QgJCS4T3KrApqlzS65t4QUawGE305m+IxHI/+UbbW//vBtohILtgAfyKO6eE
         U6yVJEMfIOfjVbuNcIQG9gGBuCrUuCeGAGIP4pi9Dswf8vJTK4x3farokdJcbJgICv0l
         wRTswW8VRprpKBS+RxtIFuEm/cj+R7/nt7rk2hCr8mOiomwkLDPfydkkrAbSattcWjva
         Dxit1m+wryxFZ2i14n/DgX+lr9+qDud4NmLxu1iU+pwcjnmND1aB9Vq0hjoVQXZkXbII
         No1w==
X-Forwarded-Encrypted: i=1; AKwUvBziib3ducZxoc/MciM8RGB87jnM2mjBfZqxGsyv0c3GnWURRGYKu2mbONIOTcpT3NxXod9gnetwo+ojFpg=@vger.kernel.org
X-Gm-Message-State: AFuF++mpUJ1w6zH982Sy1LWxGbxDfQuY/RwK+56yiFZ5J08zhku2leUe
	OFss7K7hBOVtfnYBzW+kz0QcpzWpj944n5xsNnA/O1wrKPaVIfMAOEyh
X-Gm-Gg: AYBFou0SnydVaM7Hzg58rxs+JnhiA9u5KO/IPs2n1quP1Tes4M9cvSfC7MZr+q7t55p
	lrSc1JvbD8Z/VLk9POFd3iroHWoNUYv9NzLBEbvXd0/x78cjZ8gPg6QBDpsb3XFbuA4PQ9JxZz5
	FcuA1pROjA0THZd+XdlQkHq7FF88jCMFFoPqlemNBC//m1s++Sw8abgPPIGBpYdSL8epiVKdpm6
	Q/r32VLAiYTTymTuXjbIyD2ONuOyJQ2IvVyvWYP319c1jg/tsU1cGrypzxmJCa8Av8XsfvV/ENj
	pPgSjfdszCDRkHli23QlZO6/jXFBcINTY7pGE+RmccLRoCAlh4uGbBAOmG/wOi6zbJRunFoQDpe
	qYOcwn2tsT25sDwUPNTcf+C9GOhyD1aj/WEVpPGI6JEG5ips7NvQcd2GarIzVoEp9vK7YPWpJOt
	Zx5UQlgY/Ez57kvP0by7cSwaJBF7GR4ipuGrLw4VoiS/Xi3+g/Ctid21B8AiGHqCAfI/4CROpPk
	hqJ/k9RmHRjQ6uIXJ9yQ8Lst4bO9+hOfDm58JmSFCuyAfFCqTBpZCv/RbsPgLgy2bsavhp16dro
	3uq6Wa2Zd5iXcmJ/Mjh1ayat91vJMEF6ZQNUGwcbOi1WkA9Nv9qnhDwxR8/sStc=
X-Received: by 2002:a17:903:2f85:b0:2df:5b0a:33da with SMTP id d9443c01a7336-2df69dc8cebmr24623855ad.34.1790177540475;
        Wed, 23 Sep 2026 08:32:20 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a69f7sm13139835ad.16.2026.09.23.08.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:32:20 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>,
	chenyichong@uniontech.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] isofs: validate directory records in isofs_read_level3_size()
Date: Wed, 23 Sep 2026 23:32:17 +0800
Message-ID: <20260923153217.777351-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cpadce3biub2f3lv5mnuegqpd5wwip3n67oe4xy3jujserdzfk@ynipz43pmoul>
References: <20260922140137.1768064-1-matthias.goergens@gmail.com> <20260922140137.1768064-2-matthias.goergens@gmail.com> <cpadce3biub2f3lv5mnuegqpd5wwip3n67oe4xy3jujserdzfk@ynipz43pmoul>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jan,

Thanks for looking at it.

I don't see how it can trigger there, but I'm probably missing
something, so here is my reasoning.  With 1/2 alone, offset is always
below bufsize at the top of the loop: a record that ends exactly at the
end of the block takes the existing "offset >= bufsize" branch further
down, which leaves offset & (bufsize - 1) == 0 and bumps block, so the
next iteration starts at offset 0 of the next block.  And
isofs_dir_record_valid() accepts a record that ends exactly at bufsize:
its test "len > bufsize - offset" is false when len equals the room
left.

I also tried it, running fs/isofs in a userspace harness on level 3
images where a record of a multi-extent file ends exactly at the end of
a block, including xorrisofs -iso-level 3 output with a sparse 8 GiB
file.  Neither 1/2 alone nor 1/2+2/2 rejects the directory, and the file
sizes come out right; a record whose length runs past the block is
rejected.

If you have a reproducer, or just a hint at the case you have in mind,
I'd be really happy to look at it.

Even if the code might be technically correct, it's confusing.  1/2 only
works because of a branch further down that 2/2 then deletes, so I'll
send a v2 that squashes the two: move on to the next block first, then
check the record, as you suggest, with the straddle code gone.  The end
result is the same code as after 2/2.

Matthias
