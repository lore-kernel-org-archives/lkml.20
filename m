Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793421013;
	b=siKzEXsgidZoLeoPfX1hhu+/ctqq3j/2IACsR09S4NB4l5LFZs+4BgqEDcotnbXwGdVA
	 GlR0rheLBNRdzdDJcMo2OwJVBQuCHhk7Ft8Rw/8jsfkgGoa6yqlXILgiqenQirl7/p6X3
	 luNJUCsWrneubLb7jP0/yoUhxmmgOr8xSS2ceD1aRnxiGR27vxqlNP9h9cRa+U0lLxX2K
	 R9T1WYyRD+UdLCIFjEqYFXGr7bgdlzRhAEsvVFs+h61A3rXFxfRTD3CE6YOe2TBV0V8Nq
	 WKH/CIH+zFOVaMyi0tvDNfT5b7xvbObs5TUv7VAOkdkQTpI0f1ozXSDhPlr9g8+eJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=m5/Ndcp11Lvo9IThfTM7Ay2nyWfQ5Iy+XXxswX99Bsk=;
	b=LgaZ7mEsYrbvOLNJBMyhEFdZpN9PRdsQ9TMe/uei/QWufhrsfgkH1mXybN1Toop9VCW+
	 Ok4w0PE/Sh/+IXv3hdL4VNRWgSuAJge9is+x1OF6J0PyHJCPcPhqk9293nV45+HAaiyQF
	 TUv7DnASBkzuZvEb3ke9H/B2436UIbkLEjRaCEPN88ohD9B2eRWJEPpQ9JwYMEkC4joQe
	 DYCMF2NIZDIdUDtXiRGWHGS4uexaaPdcyz9wqM+L29edlSI6Z02FO4tSdwG/LY6eWSXCN
	 hnI2rfMW7lSVSStbnyg23+Af4NvUDczZ5ssuHSZZPFCx/hTSsa4f5ulen+VSzJMwcDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thingy.jp;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=f5hFm+bm;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21F606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D21F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=f5hFm+bm
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so2609516eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1793421011; x=1794025811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m5/Ndcp11Lvo9IThfTM7Ay2nyWfQ5Iy+XXxswX99Bsk=;
        b=f5hFm+bmZrZxzK2FTjfQtJILaR0cNWxeII735MGt6kW/5jhmThDmxNRF+TKqk+sXt+
         m++8l615hWXeGDtkISvefdrvdcMJxZAg7+u3WIf6rSrK6OmaKJg1CJqwZpHfmBcMNelU
         CeoZQ2Q2IXBaJgusFQg1IdLfncykGb+aDWKW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793421011; x=1794025811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5/Ndcp11Lvo9IThfTM7Ay2nyWfQ5Iy+XXxswX99Bsk=;
        b=poffqk4DqZT6LfQPDs35b3L4FxxFRwc+oRCKgQb0zFnO7Gs0M5SOn0zfign8Gx3SOk
         NMj5C2t4O1lxMWMnBZ13b7T7mqD18ySsa0kmgBzL8CLjfkiVfEMf4w3N4aE8eatvN+RF
         5MO69w6Jbx+K6ZTd1IMnC11dr994vmu7Z7Pe196dGv26GIUG37QttsKo39O+RfMBFykC
         KLsldHSrf7NwvD9KRBaTHx/DC18WWfhC5N+NrVabMQM2iNjdW6Pjd8o9ZsFxq65obQ89
         K8O51BXcOHC6PN6XOmhcEY2Ol6wSctvlhdaLflE1A9FBcpJAlhBjeCLm3EkZvb727I0X
         1wrA==
X-Gm-Message-State: AFq9FYIBEsGT62P4prtKFnD36gLPO+zyJvewwbBLTMRSqkLq7gOIjBrD
	4SuKA7w4SFljAgA/T5qq4tqb3ovZYRQQyxK4mB9AaycAwlafj5lucHzuuDDIEj8ZizM=
X-Gm-Gg: AYBFou2fEwfEsYUV6ZB/f8DAHrhV9Ja0NZ6Gvi6MRKy4Pa6mgIkpxd0xarlj9C7Pj6u
	1oXcg6rpvb8YmIZ8HmkDSUmRZQ/bj4NUFcncdzMurt5HypH+ExbEETgPtW3HdOPY4e1EcZC4lfg
	P2oietCCjcAuP73yk17AJT/T5z5Bwc7v9oDXYAk+yycEI1T6Yn/pTfUQetS3iwEvSZQw3CwgEa0
	jjvcw7cg9ZR/YljiJEKxkygDZ8aekc3TLM3Dzj8B6iItVamb0xMsPG7K9WpXRA7DGn0fSnXd+CZ
	9a5FDYAQ2Dq6SAscMcjGU5zOzgZWBVR4ryDBfWLKONZCCUAwX/A7j1E9AWKxk4mYAdzbS1PscPG
	+yQiOtgqn+YqoeYSCXgS5/8aXWUC2qJ5YYH4BukQFTfdBOaEpGBjVUUrmb3bwteIhWYIU/YOWh5
	DpQmCnAhrcdn4qTFco0FGYk8IiHZktSYBLyfzt++9tyT5k881Twxary+sagiZLb+m8e3JCNyIK2
	Cy5TcXt/UckiqLUhkN8RxYHcc8yR0BsdYmxjrTJHtzAXC94QzKsXGa/7EogSAP9KrnNutcGJ1nA
	ViFvl7Q6/pte6GG43u1MSlmD1qN7x4wEfAK8PEj5c9Lp38bffAUCM4DJRl7llGdwF7sMPUo95et
	EDbeC24YABagGS63aMg==
X-Received: by 2002:a05:693c:42cd:b0:34d:755b:d60b with SMTP id 5a478bee46e88-36a42435386mr5544189eec.34.1793421010916;
        Fri, 30 Oct 2026 21:30:10 -0700 (PDT)
Received: from kinako.work.home.arpa (p1795186-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.151.186])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm16603361eec.16.2026.10.30.21.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:30:10 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v3 0/3] nolibc: Add dirfd()
Date: Sat, 31 Oct 2026 13:29:57 +0900
Message-ID: <20261031043000.145709-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
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

Add dirfd() to convert a DIR back to an fd for functions like fstatat()
that take an fd.

Change log:
v3 - Split the internal helper into its own commit.
   - test: just stat one child instead of all of them
   - According to POSIX (https://man7.org/linux/man-pages/man3/dirfd.3.html) errno
     should be EINVAL on failure, so closedir() is now untouched as it is setting EBADF.
     This makes the diff a little cleaner too.
   - Replace i with fd in some places so isn't confused with -1.
   - Due to all of the changes I didn't add trailers from v2.
v2 - Fix the name of the dirfd helper, I debated over removing the helper
     as suggested by Thomas but it seems right to have the logic in a single
     place.
     Add test a basic test to make sure dirfd() actually does convert back
     to the expected fd and using dirfd() with fstatat().

Daniel Palmer (3):
  tools/nolibc: Add internal __nolibc_dirfd() helper
  tools/nolibc: Add dirfd()
  selftests/nolibc: Add test for dirfd()

 tools/include/nolibc/dirent.h                | 37 ++++++++++++++----
 tools/testing/selftests/nolibc/nolibc-test.c | 40 ++++++++++++++++++++
 2 files changed, 70 insertions(+), 7 deletions(-)

-- 
2.53.0

