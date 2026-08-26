Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266AB43B6C1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751699; cv=none; b=CwO89FQ4PTFG3HqPz3T79qZ4RWOqDm1+/760gEXoPJ2ixAAGJ7GZRAw1XSNbTawF0Hwwsx/bkw7+oqXTSKA7o0YBA4PlVjCjNlM4w4Ng+p+clCDiUAUMTT720mKYb6e0jc6S9yf1pH8ZiR1bfYE+fsZcLD9wZR3z+EkcxySldDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751699; c=relaxed/simple;
	bh=mh2sDx9tHI3lqWQ00j/9gw5h20DWnmis6sQucWaHgW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4WoIR23/mxS+rXePyzX1AmnBDtpMVKL+gCIsHJ/JP9bYgQBtIAzaZKnoDujKUmTRXIcyPjfO0kj3UL6wz79Ni/zolvnshjKm3v1M7WCNHaeMYiGC2lJ/co+4+OQR1y4Xh/X8SuEZDVyrqC2F39eQYhmCUmnER/3xmMEy0ZtuX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXREOzUh; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXREOzUh"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1084253a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787751694; x=1788356494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqzQBp0nrSAFCfyclJraR8i8GHOdK8ExujsnsKkIJkk=;
        b=RXREOzUhE/tx9jqP0SQG/QAVAzcr7ArJx4yj9wyS+z7oAkxc0fNgC7pZzZJyo/iqf0
         UYBmpsca+J57NMeAP/tWbTpUYiKmn9AmNOGFT6eDaZy15KyiXXFNQi+itpfSvmOpQMvn
         nwWNCGS5R8pJGaAPtUbz234gfTL0WS7KITlJ9hQQj/U8aq6Wtoequ/M4VtdK/ZivGeTO
         Arko8Ch1C2OgBHTlzb1gi/6Xm510a/VGPWz9AROVjGdMePOWOfQ2EQSxaWwHTtEu7gBR
         L9aJaTiJt1YXoY37z2JRmL+AH4Msdv1qMMj7w/NHzAOL/WI+PK0GfhZWlotxxNLWrVpl
         wMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751694; x=1788356494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqzQBp0nrSAFCfyclJraR8i8GHOdK8ExujsnsKkIJkk=;
        b=Z/XeME+Zq03DLeaqLcy8CYmo14Hwu9GbtO5Nt0VtXa4bhBG0NAWRosAjOnF61NF54s
         gKW9JvUF11Qeyl/L6vNfEq4PXrITwX85m0B9HD021VZjW1Yk483pTdto1Mwil+2OtvBt
         v/A9bNYMx/sD7MQuc9TFCcl7w33FLPGcfT3jotFiIf7A4eNLyGUFdCuI8gbRGY8+3Vqy
         aDwzLm32tH7bgzHjW4z2a8qcw8afyL3wb9Doj91CE2gqMarJvghBVBMgmji9prHUihme
         xA4T3vDjPN1/221RMNnXqvWbQVUKjm/QVFy4Xra2CCkuzJneZfso2uFdGqibx/0/L5mU
         Mi4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp/f824nfOkRaKoFZAvF5TTk0FR6tXwXhb/QFlnWIXLUOM2c0Rf309dcB2TtbbVXuw1p+5RWtwKsfJM6OM=@vger.kernel.org
X-Gm-Message-State: AFuF++ktvM9d1VuQOxoBGWZmshVMKTmes7k8E6CO3YxeBG0x6z5pWdDH
	sfHk/heJKKGArqujE+GOybmhj1fFLsRgPdLIldaUbkoDPpnw3gN45aYH
X-Gm-Gg: AR+sD12ka5i4Om4oDWlk7dShEvfS3II0eYaDRXvOMfpIdWvUMTSxuGjqhJtxecJteDs
	2w0LsdhJfmvVTa3CyEJM5HjwadytLhww8D3y1QDzS2z1IyeOCJBvjbNL4QiDijJmoZxi+iHTbOu
	PXdB5zs3aqHZC+bDoUv9IL8o0rAiTyLvuCwPDKBsXBVXxCPKqW5tMdKr3vxgeBqrAECg0d7E21Q
	/L+4rChot/LCNXP5RY1GvWCXl2j/UjpPCQIEcoNaCGoInw3rmP3HT4OmT3LwH5gygKihWR2ASN7
	wx6oW6w7I0hoTum9iF9826DZf0uEYu0mTyvcAdyzTbjgZPlyicyXp5KRi704BwdzcHDyEj1lWzt
	IhZ8xMnHgk/8ICH/lKGicJNwQfskPCck9hd869gaouxaK/9TtFPBsOnP0vIsBvqMOaAhO8Wi2CO
	Mx+xiR5j/boElbdxW+2mFHkJ21uy+AO/aixFCRT+yHqLH8eHnkDkCXANncwatSWjVksnl6zNziG
	LbPiJIp30DlfqKcmfBO5X/Q
X-Received: by 2002:a17:90b:3d81:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-3966d3d1262mr8939100a91.3.1787751693501;
        Wed, 26 Aug 2026 06:41:33 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d69065sm8906472a91.13.2026.08.26.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:41:32 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com,
	daehojeong@google.com
Subject: [PATCH 0/2] f2fs: fix device alias state across remount
Date: Wed, 26 Aug 2026 21:41:24 +0800
Message-ID: <20260826134126.3729507-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split device-alias remount handling into two changes.  The first records a
stable device-to-inode mapping so a custom alias name can be reserved again
after release and remount.  The second uses that mapping to keep released
alias devices out of pinned allocation, both immediately and after remount.

The f2fs-tools layout and mkfs update will be sent separately because it
applies to a different repository.

Wenjie Qi (2):
  f2fs: persist device alias inode across remount
  f2fs: keep released alias devices out of pinned allocation

 fs/f2fs/file.c          | 100 ++++++++++++++++++++++++++++++++++------
 fs/f2fs/super.c         |  48 +++++++++++++++++++
 include/linux/f2fs_fs.h |   3 +-
 3 files changed, 136 insertions(+), 15 deletions(-)

-- 
2.43.0
