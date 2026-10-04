Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0009241D22D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124760; cv=none; b=WcqbTwySKeuqB78IDpyFteFkcsUFf/8H3lj+JTOY832//FK/+hKQnKt3ia7mOk9L3b5XbNPz+7hjD13ui9u2xMq8vLvBo196xFTJwCkLID6mQkQ/SNeM14u8uHFhUw0IqbD0d+w4yv7zTCrOxebeE0fnjpCPuUOVDCa/ajwHwTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124760; c=relaxed/simple;
	bh=c+J67sV7H0tGHh+E+PgpmCiLdKxICybIqqLFNJrokbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=al3EXZLXn/9b10vUWemOML6g92IWw2g9arI06728RvP1oNI1F6xTmum/+UkwbMqEJx3HSjRUNGbBTGAC2Pjzhu9OaLQPLtRfi53izzUm6dXssKbzr3kJOI8PL0csbVgMtSveqBcrE8NWIpe1YnyZYeTIk+JFP3X+Yf5P9m+83NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpUpXCtv; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpUpXCtv"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so411003a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791124758; x=1791729558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+J67sV7H0tGHh+E+PgpmCiLdKxICybIqqLFNJrokbA=;
        b=SpUpXCtvjQP6jk9dw70vIY29bx7K2ZCTemoYQ9fedUVMvQYtsVWME2gAKgi+sGGTk4
         XCpkkUMTbYy6J2SvqgWH7XqZpfEKsr07fdQaMvecuwZCJ6rSrZfjgmbJz72PS4EWeCPu
         VHcw1T/LI5WFU2tesfT+z6f8Sr1wDeCBVzJkII5J9GOorZcAnA9D2w6/xKhxRUJ8yskq
         m4T8vKkbeAuoZTsTC4Pa+CAn5Z5EinKYfaGqSOYUVXNW9tBJgcjKZLa9WER4KouWX4A1
         EybFCvqflRy6NvOu3HR7EgIijYQRImyDyLMPwE9FZ7oO+gadn5Uy6PeYIv7zXzs9OpUL
         5taA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124758; x=1791729558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+J67sV7H0tGHh+E+PgpmCiLdKxICybIqqLFNJrokbA=;
        b=L/p0gv/jeI7xdO3j5qC1wktVPm5CF2GLb70lu2rmJ93wufC/X7Eav9aM4nH6LbPupH
         1OyfYzCw8MLwOaiQongj7Y/D3Y/1nU9ib9nGdu0iA6sPlnPUxSwzpJHbnbTdZx0iSlkt
         LzyyprivVCmHb3ytO6Eqin7Hu7pF0O27ksV5fg0dTYXb6RoYH9Yls4DHpHvp9KHhwW9Z
         AYX1lqEpRKykCwt61YNtny3Fyf3GS7wSo0IesV2UpryxBup0y1AqRYYDZyIvLfVeiJl4
         V7rsZUPnvhOhds+gm9IlMahwISg/h2DtgkqvinoP4/K2+ktsIHaBUC8XqtK7k41Z5Lew
         D+0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAxNMu2pEQre3a85lnWBm1mcFJAYnKFWHdc25f7TjlG8wYDAhzHxWOKACiCTyu/zktnA3xSNNcloWwt1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6mxuQMrTT272Gz59Zid7x2Vwyl1ixkKF5pek0lcNOu18hax8O
	3mriAQDX009Qr7h9iRzZOMpWfApVQ9cJte9cVXOQbkMo7t0bA/wsz8HI
X-Gm-Gg: AYBFou2PSbvaG3NDzhrfUCbEiwKmkCtpbgF0npiG0iagQvW3nFJeGiLsribxhLJUby6
	NIQfOEBp2NK3ZzVOZYpGd3rv3UbOeMLCgFwgGaw/f5+bK8QbT4J9xAijd6kFkYA1nvVLDneP0bs
	ZtyhFTH0/w0VRKoZdupvcbFRLBQ38wpuLVN6swiURduL16iWCR/WF0cS0DKmRLGVYDge3G7lw/Q
	iH4nCb6emnW2fKrAEOqGkWH11ijAUxIrO8fvqapqOe6tUo1mavpxC1lfe2//u5eQQKa2T5hHNvS
	fHjmVHfVMIqXZYTIZqziAxMql4CI6C0sHeIQF0gSNayH0vjxdC9GbrjcuVxAho06tCH11ZfLSVP
	I042sP3+HiPc2sgqKbEjC5glpoMKjz0sgtNOYtug7ozBoT5dKIcRNNWtKQmA4QtKtqIwRZx1vzS
	UTAayKv/1P1sklnoC2jAb/3QP43T6HwrOR2JZ+OVbxa5NZFujyDk1D8aDDu+EtFuG3RQis1w==
X-Received: by 2002:a17:90a:c49:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3a6df937606mr4060767a91.10.1791124758244;
        Sun, 04 Oct 2026 07:39:18 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45f:e6::17:34f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e497230sm6896714a91.11.2026.10.04.07.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:39:17 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] general protection fault in friio_streaming_ctrl
Date: Sun,  4 Oct 2026 21:39:14 +0700
Message-ID: <20261004143914.120601-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ac21b16.34119e79.2f92f3.0020.GAE@google.com>
References: <6ac21b16.34119e79.2f92f3.0020.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz dup: general protection fault in mxl111sf_ep6_streaming_ctrl

Same dvb-usb-v2 core race: start_feed() runs before frontend_init() and
passes a NULL adap->fe[0] to ->streaming_ctrl(). Fix:
https://lore.kernel.org/all/20260927061102.47451-1-ngocthang2710.1999@gmail.com/
