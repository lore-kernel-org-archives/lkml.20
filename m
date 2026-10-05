Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC7A4A4853
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211369; cv=none; b=Z+ZqesdrqNbmjIIGsnitdwjBgE9HApllat7VjPmfV5LMRrn/67q+JKrhkuqjKFuJhKHsCKfgMdT9Hi/pylhTTm+A8Pxk87ShgOmhjH2aQYuqIbf+kO4O4hTr81c1qrR/mkC+bDe72KunYgHuZocQaOQvx+QkT2M+Z/xW2yJXCjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211369; c=relaxed/simple;
	bh=I+VMziVza2uwKu/H/BBZhFCvPqZ9uw075TZ4mZkkwXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYNHIaYCqn49NWPHuzckoLYaVnUgB+4dHHWrw0P0PruScedLzJejFZM7zPYerL+iHJMVX/IbZhJafuWNQz3pqbqG9yQudYYWcWs5Q5TOAYKaOG+cM39zHxJnKTeWISfEh5CUBWZr15mQdi+1RMf2qtPqeRxWagv0NnyzhJrHTIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRtr4cw9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRtr4cw9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso11318105e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791211359; x=1791816159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+VMziVza2uwKu/H/BBZhFCvPqZ9uw075TZ4mZkkwXA=;
        b=ZRtr4cw9NiUKdajOn9s34/CBxNZw+nlytDqYPPgQYCWVaGGLWrB7kdbc3QZ9RGhSYj
         W+NkOzJI3bj/VR/w796if8aRJZIoWRRsaVz27YEFe1LTPEZRtEgeC3eNJK5WrmyhhIzi
         cPf6/NNMjdH4l2p1VujusJeaynpUCf6LEJBhDOe5PKcCzvCtWxk4V9iEnjmeKURm5X1c
         mHE/uyxS74DOmvLhKqhySjvkjf4+tL2EqMeaoXM7MzA9WBzn7f4GSX6mosmnjMmnQUDl
         zSkcDhNQUTCciNC25pUa9YMwPYvEQktTJ7nIUDyyK+y6VuUbWpj4TcUqWTdsN7YuM6xj
         k+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211359; x=1791816159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+VMziVza2uwKu/H/BBZhFCvPqZ9uw075TZ4mZkkwXA=;
        b=pN4W5OIwgQYPXeJjlUC4hVDKo9sGwfvIEvMVj9gwSIHZZabQLxKXWhUU/weGJKgvjs
         ldATyShN6oxtVdcPK73oRNdqwa4kZGVCAQ0WJTZT9DZPhndpZGFzgLfMW1fRYjIXba6M
         90iE4X5cNdl0tRf2ykKr6gF1INaP6VCS8Q9npf+VRsw9cFHw+oXH9v+18SGB3yXFtkbV
         oyuQ7CBOneLa8IiCdVOPq53mNQiEg2/t6MbQhhhZvN0HCPnwnvV+tn8jyWEE2n4EcmP2
         T7ACD/KKWKQXwMYUieIa3cOGPjfj4SVtNhpmIdyZjzTZ/fZZSbpAv0kYAYLtwrBCIGWa
         aR5w==
X-Forwarded-Encrypted: i=1; AKwUvBx/XJR912lxDB8t67YwUn0kWS+56fGG7vbaqOhFcp78jt7wYzZcgb4+Oo6StzcTQ6NL+qnYOCWh+QMsNpM=@vger.kernel.org
X-Gm-Message-State: AFuF++lesM4EV5F5aaj8P05kFi5+pNp1hlRNgUGOtdIkCWmxl0Ih7wbr
	kvGrv9YHsXhKaNoU3lmslVa7qo3GsL7B++Wb2lY8ABE7m8d23l8q89c8
X-Gm-Gg: AYBFou2mKsbETOp7ccAxF/PVSPOhsakWQKhyhL/OwT8Qafgg57eMv7ENT9vg5ovf0zo
	7xA0+XycgZARFJ0ae/kYiaBFZO/5ENGf2aOops0OAw7dj2/SnwUT19oCFbpvgY9LzVtJEfZh3nM
	WZRoCDcvrbD1kGArPRrz5mS6GGJyS6Qy1drQgPrJoAUwwnTLx2zNp+pfdDQchlSkgjfOqF42o8i
	/YZ0ni29i8XzdxDNAKvs0wZxbaUGc3vG+mAvrJjaNWg0condWOEedmOZrvQag0SkpXTMzMJpX/g
	IiMW58vHrzMrH8JDd8wdZjOHrdnklk1aMKrlcidjWsiJ4YQdylN8z2IFzcR5Qmy5gvBCDTOk7/p
	wGJaeYV168uT7N50SIaNOlybe8K2oNxG7MKjWuV4TQK9GcmbpO81C9tLvgDY8PGRO2s9k8IOMKn
	H2W4fDO7LZt4aWrVY4/d+cGCJEmHSeFQmnoiWRyOWfvk8Cgskvu1XworPSpMR39FYdwjlPdGH3q
	+Ms
X-Received: by 2002:a05:600c:1d07:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-4a168068ef8mr122155045e9.0.1791211359246;
        Mon, 05 Oct 2026 07:42:39 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02752aeb3sm359490185e9.0.2026.10.05.07.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:42:38 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 0/2] wifi: rtw88: channel switch in AP mode
Date: Mon,  5 Oct 2026 16:42:37 +0200
Message-ID: <20261005144237.132627-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005143313.129670-1-mehmet.fide@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series went out twice within two minutes, a slip in my send script;
the two copies are identical. Please take the second one,
<20261005143523.130287-1-mehmet.fide@gmail.com>, and ignore this thread.
Sorry for the noise.

Mehmet
