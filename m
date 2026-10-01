Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C04EF14B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853928; cv=none; b=qVg0dN0pjhseRg8uv0JezbhMvt4+TPfzbL4I+PvyhP+a8SJ8zHuAT4WLGRjq0A+DZtJSd97AZrmigdB7dc+S2KSFIGNUBSyKzs9GPWXPQGUGbqdhpsOs1WzR7LiiHwKrLdSzUNya+uChG9X1yrrYGlfnBjKiUN5AYH7xikBOaAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853928; c=relaxed/simple;
	bh=NVPVnzit2/uGIGdxSpxQwWe1ivfTnMdq3apCPukstrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GEcvudkFxsqoGbl9ZWx/nUi1j2pG9v6G0UtPOnU2uDHniNZRkpusWtEZs7WzY9CW1uj2krUIJ5LT6cz6f8bekcCa1Pl5XgqM3sKYkzOwjqH86cD3ECx8PKOSkGZAXQgOtKg8IDOOlhV3A5TFPidl5VwzwLdQET4k6nsnFGAMczI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX6rLOsa; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SX6rLOsa"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso2276269a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790853926; x=1791458726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//gf7bI0yTCYHEFPmzcRJoGvW3+pX9ivwTK6Ov0SZY8=;
        b=SX6rLOsaFSk8F1KPSUBvgfhGozgfAKOehEzBLcaThUGLW+YlZveswcrnyD4tzHlaA7
         LqEjMY9WqiyjyzfFSNIE70h6xATKhclVRWvb7bbxhgvrAGVKZmIoG0TiygMET/T1dl8D
         XNzwenCFP+ZUvclIE/H6PH702lSAVd9ALAMCcV1N66WPb84mmS7kQm0gZpyIyhXD9ZRT
         KA1bX/aO7JAikiw98yxQFuwy6IpxprT7Ou7w4TKfRF5e2XHr+FcBVyyW7d0qqsQ0K9U2
         ItV8ziAb5QjqVqjwhcExaZX4MuvTKdTjbxPlTSLUdJ21Gz+J3uDnehjDZZTp6+4s04G5
         9EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853926; x=1791458726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=//gf7bI0yTCYHEFPmzcRJoGvW3+pX9ivwTK6Ov0SZY8=;
        b=tVf0xOsKFmHs9V0XPd9XOgmmrDs/n9jFythlmAEHXapxtkVauiZnNJ7pxjwgjWLver
         EuSWj679G0nixEetFHRH+HZu5l57tYvJc+xD7JZByPHgdP1JJPjsaGWkmDlcPpeGczL5
         EUMxs0s1Qmdb+I7U59lzO13ZrVL1Qipu0jkcEiHQQd9GKP+jDr/7jjA8apffr1VqATZP
         +gBjE+CXuHGqcewNlaLdBxu7VFc3JjQbJNO0fJch8dA1qclcOWSiEcPE8iN2IPB2MlUV
         6Eg3cLvKB8hH5Hv2+Mt+4/vuGub1hqA2RnPu7UXs6Xs5Plo2yZ1bXJzJZSurwTSFfNTC
         FyLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWrMuEJS/7uur6uIuOFQ4abox5SqO8NXm8CmMHGknc7T1aqt7Sg/Mq8cWKJLcmxVif/hocMSgfaYxP2fg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp/FigDdkSJXNV4T2wm873s8EYl3MpLX+XWAORzFSa5idzx8TA
	2p2vXmkDkfp6hSe2w6iDgEehQnlTgN0qGx9AgkpkApE9/pfQB2g8IDtL
X-Gm-Gg: AYBFou2QRPVS7SdxC5rv96agwBBHBrJ/EOM2nnyOo3bp0WPUh/sQn3eHblzPQxvx2pL
	UE9sPkJwyCrxOtyZ4IjmB7q445hz+5WmOQGnGbmSXnZQrk7ipDxf249WdfpJ+Au+6wDrftS4cyd
	UIFfmgAKa/GtQs3KCAzSBl0HY6C+xtvGZrknuXYW9r/YZPr7GGaOsPWt9akqFmQTtQlrFJ9RyRw
	zZ/Rkj2vnjZHozNE9MDLd8KIPtczTgr1tw00JgHMpbB8cu8DJhVWQJcNzWL9wqGNag68EtN/C0R
	ObSVAwsdEwAmFOsbIYEpSrZ3K9EOKmG7uRl+rvFe1IzpFCHLZjWnz89KdDKlen85PS00w1jvhz+
	pHBJgoEeCdDqWvcPm2r5yGAtC8JL9LcN8vmnJ5qkhZfne7CaM1RNCtWZZRh1uJGfgYynUaf/PVo
	oq2mZNZHq7x1Qh/BNjjytY9AsiUU74YtrDuPZuB1khlQV01WMfe73XNd+uXC2g33tQz8Lp0cmEE
	CWv4NtTVM4kXoZpGRfzOecjxuKH+MrYnERzRrSDBKh6I4axs3GQ/n6kHOIw3G9jfbuc86GVV9CV
	dNeewr81oCMkbwfjTDu+cVZAMiEFg4btB7V5ucVEypmFlUmlguKI/O37ndk=
X-Received: by 2002:a17:90a:c10f:b0:3a5:a5:8509 with SMTP id 98e67ed59e1d1-3a500a5875fmr1338694a91.24.1790853925603;
        Thu, 01 Oct 2026 04:25:25 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44018c1sm4092571a91.8.2026.10.01.04.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:25:25 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: name the gregkh/tty tty-next branch
Date: Thu,  1 Oct 2026 19:25:22 +0800
Message-ID: <20261001112522.3822619-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2026092800-clustered-unlighted-a54a@gregkh>
References: <20260928105940.2186243-1-matthias.goergens@gmail.com> <2026092800-clustered-unlighted-a54a@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

> Hint, -linus is for bugfixes "now" and -next is for the next release.
> So why pick just one for this entry?  50% of the chance of getting it
> right?

Fair point: one branch cannot describe a tree with both, so please drop
this one, and sorry for the noise.

The motivation was Sashiko, which used to review against the default
branch of the tree in T:.  Since 28 September it skips a default branch
that mainline already contains and uses linux-next instead, which has
both tty-linus and tty-next.  That makes the patch unnecessary.

Thanks,
Matthias
