Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C3831F99E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037490; cv=none; b=eRqaPLIoQTPpvw9lL8mbDVMm7EUazkjp75o94t82mRZZ+YGOKbBha88A32covjTa/4YBADNQGHXmP2jBdTSYeF+mVfSecYqVsgRU/lnk9KZDM9LylPGU7O4eKqyMO0ZXwaW8akoBRaXSMSNpshVKf56izqyoUVvOkl3l3LJP/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037490; c=relaxed/simple;
	bh=xtUfDTogkvswBHYd+l0SxFxD1eU2IzxbiBtqrmpreT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uW14YkNDmJxBcOKk1lpCBN4sjjc+SA22XY10qmikP3quQhLWCkpVbLasyCgFu+QZW3PMJkWC2kOZUb0zsIiZhhLJj8sYx8sdv8Oh7hj6qj1KKgmw61Wwf7SbTNYt+9EMyVUMtiuFkEABq1QOAKcHgLle7Akey0y1JRXQClagg7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfxCRyjZ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfxCRyjZ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc147d86bebso466330a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037489; x=1790642289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vK9yWKbLePV+PhIzuB8+Y294NhkTxfEqJ9/AYRPGsHs=;
        b=KfxCRyjZajsnFb9ivUs+xhCuHmKO/PGGnrxIivzb74I51zUSN3Bsri+kgG5o+3O7Qs
         X6diPDceo5NOq5qK1r5EsEQQXeeIyyPyAyqbmIkKWX93BkqDJFTHvROJaKfL5Ma9/IBs
         qPtjGdjKcP7xbvcPE9YcZfTYlfZMYIpLzYaCeCJiqRUumZ84a1a/f3jGHRW4caQdATWY
         JHztINCz/tSOkX+ZYh7zEdOE9m7kae4QsQSsRNeN+Zgjp0TpH3PmiWuyX6MjcLJ+4de8
         QN4oUBihX98sKCf6oLzwaKRKKXhw0X6cPcRlDWTMOzjUFM67dvXpzg03OpBg4lRUXTj+
         wKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037489; x=1790642289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vK9yWKbLePV+PhIzuB8+Y294NhkTxfEqJ9/AYRPGsHs=;
        b=YRnoZ8NB6IfTVr5SOQp9OZjheTF1Ur2+PGKmMak8hUQQ589k/KfTbzJwz+so1DF3w/
         pVYAaRnCtxJiTnUt3CJ8q5GoNB06QUdthMsI68AbRf/RVhJxMtb+YecDuZDhWno+YTjX
         j7W1muaWV0L+wFVLhJSJel8XgYio2t4cBG+n/7sfz0RDTcjriUke6ylEG7nKjx+XtLU9
         0vqJi0JcX+2vTSUMVFNAL7vYimcE5d7qxJ5ssQK8vRtt2/9lBogWVhMaqmwNZFJf9ycQ
         9LRmeyAGjLJyddeSMG8UMBf+VJwKfpwUcd1LEyG4P9SyxCpsDfZx3W2FOGqBG8wRBkvx
         qEQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTJ1Y3ulcd1YfnOwpf8FrYVrly6JWA0j0tF5AcQw4QdsKXJp7HZeouqVNG3xK/0OUO4JfUcdgZnm+eG6s=@vger.kernel.org
X-Gm-Message-State: AFuF++mdbX2CNQQiAZk0PJUpp6VvfZNxZOXXSWvNvDLkff12x9P7vnOx
	ZcGq/ncw6iwyq+4lVKsZa871VUUMmZi7q6w0kpwM4YunfQtcArGUXzs=
X-Gm-Gg: AYBFou0GoG71kel7hrL2BiUre/G6hh4shvR0ayWGwK5Ltwg7vucKu3r6JwYZeeZIW92
	W9G29bfe0+/NrbFCJjfb7AYT546aX1VITvFlc7AezNx/KIpKbsWGRd2RLyq7OS6ISQyuGwzyYgQ
	mBwZ57HmNvwy1Q2mw36Bp8V1yT/BtjC+M0pnNy9JxtLzvG8hPOlJzrUS8jQWcxZpx25wZEe1700
	SkIlkFmGbhKGDRpKkOPxj2pxO+DWxiym0OlmOoVrfda7yi5l+ZPd9vhVy/j5qcZFzJllX6e6sBe
	D4Lr8u/HRPh1v0fPvZeaY+1u8+X9Lpzx0iWFKtpE9apZ16ew86rPod2fc5AW8cDmdSoaqiwn0lT
	lmV2H7QEzNfB2EyIdHdWhZI42UScIGxTUC2lP1G9iX0544+RpKNvbNqHKDJ0JABffyrD4CTG2lz
	zMZHFe5pV7QHp2YaZXqTphSCnU7fdqbx0BGZ1vJGRY+mPb3+/AfbL/RgI8DoCiov4SxSpHI4m/A
	85ozF6aSZGzOEeFI6dYuCe4
X-Received: by 2002:a05:6a21:e8c:b0:3d3:aed2:6f21 with SMTP id adf61e73a8af0-3dde01c1bfcmr1241002637.21.1790037488713;
        Mon, 21 Sep 2026 17:38:08 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:38b7:a3:b37e:ac86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a18ddbsm15551a12.7.2026.09.21.17.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:38:07 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: vdonnefort@google.com
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v1] ring-buffer: Fix the sub-buffer array base in rb_meta_subbuf_idx()
Date: Tue, 22 Sep 2026 09:38:02 +0900
Message-ID: <20260922003802.1270847-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arDlCou_U1nV9Zqq@google.com>
References: <20260918071507.1019251-1-donggeunyoo.kernel@gmail.com> <arDlCou_U1nV9Zqq@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 09:04:26AM +0100, Vincent Donnefort wrote:
> Looking at the delta between rb_meta_subbuf_idx() and rb_range_align_subbuf, it
> seems it's just the former didn't include that struct ring_buffer_cpu_meta
> isn't?

Right -- the sizeof(struct ring_buffer_cpu_meta) term was missing.

> That is quite long commit description just to say that :)

Fair enough.  I will keep them shorter.

Thanks for the review.

Donggeun
