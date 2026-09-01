Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24048124E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280695; cv=pass; b=CSSH6pmwpbVEfAA0JzmgdClpK5p6O2etkfNXV2QToKD0t2EMNYIVkDcYU2Bg9Ys6+1J0AyyU8izNtaxXXToLQgaEa9unE+qsTbS7zRmDAvZoP/897OACior7NTPnwCufBWEPw1ZhQP/5KO0kM2i+miU6y3hfVkECJNgtQy1Bu7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280695; c=relaxed/simple;
	bh=JNwhP61TrUAZkMFjU8FA0D+Ek1IKBmlx28Ukz6BRrvY=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A60SaB7LtCqTsBwtIJ1Lme1WeGrnZnvKXbn3MiwXkQA07QAGotq/6piOtMSu7QOe/3PMWnemjx081VeRAoBMTWKYjaBTsXuFbsbB1HMnDy9/LYmGkn8nplqS20XAh4s2eGQI5dQ+ECraR8TZjYN6wsRQOWO6ftABkzjwWZTn+Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqiXgQe2; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqiXgQe2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so11400a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280692; cv=none;
        d=google.com; s=arc-20260327;
        b=pSoBQE/lIRJp8/6jzWbtieV/uzmYnRNnH4Ck2ztxWGZsSeK4VoDh/bh/gzQgiIlcTd
         bu2AEVlYqhqE5XjtXyP+VHg1YEAVX7Mrk4V6iF7+HvnTspp+PqZS3wjoVBuf82+2Nd6a
         oWH1DZtLNJhSlMp9cCNmyBW57G1d51SoF1KAV6gHUrVqmDc+wTfSyxPVUOCAp8GV0VlH
         4dTJeuHxy/ePkoNEzpFQyrnZHcoXj6ayZXpUVQT1EOrZH4jqTn8dEMJ+s1eE1rhOdNbF
         dI7E9x8dk4F2pfCL8nBLsEGvaPSbFPWB9usbzB9cq4B59J6pWTTeDuJrwusaOBj4i1tH
         3U+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=JNwhP61TrUAZkMFjU8FA0D+Ek1IKBmlx28Ukz6BRrvY=;
        fh=AQrd0V6OBmQkwgDgMqgaAomyLUWtagmBuFZk7emTrR0=;
        b=GM6C5bAXZP2PSe52V6vjpCrGptEk1xJ7iKlH25D9/h75o/6oC6QGfY/XtaxvwO7joH
         RFgJa4Muzh++N3UEsCT1e6TsQlgX7UJeQAfWTZN/L/9itpQsPLII+IRp279HkQJqQyVN
         klbwEjPdZYDk/9xjCVd7XQEAr0CHGO2m/rBb604q7BaxKF1Zr+Kjj9XbhodWIjrsQW6u
         PH/o+gGhXRyUn9GbHu/zMOqJs2s21h45hku7NOjYIBvorHXLrVl5swm9SNCcd0hR/WCg
         0vpW7LjLUdc/kVXF7+CwGd7351wCgyixQw1HXMkrTxsDl2l84TL9GV1nCT0Djh+GKB9n
         eD8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280692; x=1788885492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JNwhP61TrUAZkMFjU8FA0D+Ek1IKBmlx28Ukz6BRrvY=;
        b=FqiXgQe21LbN/R9GHzxWmGoCtFdq7/bu/zv4NnxpZj1VqlZ+TmiYzOp4pBpl/Jla6W
         DAgOSJS6Snkp757C+sF5PTZHryxYaoMn1hl5NDLPXdN5tV+9G6xSSZrDmZTWG0GH36VR
         2FvWWCz/b12rOpF1niPnwZKaIcJ/Nzv9BYeGPX1jCv6lnn4gHh8mVcGVJX8HSF8+DyCr
         lBgP760XzebyxKnaXLiJ72ASosqPw+W2DW7q0hQSQpgxh1VQuHGd4G+FpdXBHIN45aVC
         xv+JHYuB4B0U7jac11xoOyOguhkOZ5QufUCHwDHuxRjq4Pw/astwOr9WX6fae8ClNeAz
         8/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280692; x=1788885492;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JNwhP61TrUAZkMFjU8FA0D+Ek1IKBmlx28Ukz6BRrvY=;
        b=YdBOHjwxS2U2qwZpBTjVemJqF1SZsKcNBT+pRX3SLLDZG6jRhPFw4MNXT2965bFrRw
         mwjzVgOIjORvo1vqxy1CTo+2Lv4ZNeUKEjOnH2iUvwmvf+f63lsN0br1rjyBNZhktDqM
         qxQduZpxXWyYqrKZuQfBWWEC/0dWCoQEJEEj3mc6OQy8+bq3gvF7CgenLYfT7UDSRnEK
         slUo3mcX+cHXI3OrlZg1QaZ244Qwm/e0aj7N4sqlleD3KgBkUPkIreZ7EqS0Nw1/04aG
         032o7axkaWGA+GVe5lgTpPXgk9rQNvEXgSUDxa6K9qsvCFlzl5RYL0q9QAAbN7xsKtaX
         7wLg==
X-Forwarded-Encrypted: i=1; AKwUvByb8iUNQ0Iq1Sgp6U+ViH4r7hp7kwmQMunN37Iz+jjD8bh1w4VDcstNAgmxHJIsRTGKlFhe6v0izYrni1c=@vger.kernel.org
X-Gm-Message-State: AFuF++nrC0s61EoyDPsgYcnf7Ke8mY8zU13JjttTLILGaokps1/MJa1i
	8SUgo4W+76iO/9MTlvOXe/TxEUykC6isyeaE26OXTA2NE6nVC4LAvFegp5ZlX4kZfE4DJs/QBGY
	4DSGyAQf0y3Apt9CkNsDFvPbZlaY0Eh8=
X-Gm-Gg: AYBFou0zV9oireL/b1THY2rUMOF8H5AAWNvbHZxY+FEeuOgux12lD/nf5yu9m6Ex8qe
	9YrDoAOPhtdicE758B/rQgIS8zEk1rnkhOl2CfBbpkKDLizNWHe686/OhWw9eaInQuL6Fgm+Sog
	R/sPzaQpKvxV+XgHU6bRBCl0st28P0WsyoBJ1iY0ByRXjTQk0Blc2mfwyG7+9+wXpGkFTfeGaR0
	4W79M9eYvs75Mlb1RdCPmp4ylfR4C8O3iXLhwDGGTn8B3M1aqh9MjDcy+RwIv5QHlzqBl+WqeZQ
	xqvWWI+4lzDZZku4UDWT4sBXYSiLDPcHx5R8qoXl0jxsdePmjSX4SLP2zHQN4zPdv7CAGA/RW0e
	mDA==
X-Received: by 2002:a05:6402:428e:b0:6a6:5e8c:f3a7 with SMTP id
 4fb4d7f45d1cf-6a66a5b8ac4mr5103966a12.3.1788280691618; Tue, 01 Sep 2026
 09:38:11 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:10 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:10 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACOAw_zvPTBFiHwyL5XHwmtxEE2nusoxRtBhYU9jfiRS1fO3KA@mail.gmail.com>
References: <cover.1788213716.git.zhangxp1998@gmail.com> <a21bc0d17ce657d0ccd86fd398785b946fa268d6.1788213716.git.zhangxp1998@gmail.com>
 <CACOAw_zvPTBFiHwyL5XHwmtxEE2nusoxRtBhYU9jfiRS1fO3KA@mail.gmail.com>
Date: Tue, 1 Sep 2026 09:38:10 -0700
X-Gm-Features: AcwNN1Wo52nyRIzba3WUWMLzKWdkKBUw8H6j_cq9ZI6VboRLN9QuuO4YUl8YAww
Message-ID: <CAH=xXfGXzN4-Ft9GBUL__VPRJROLTSjBS6ZN91iR7NNOtNgXhg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 06/11] f2fs: describe {i, d, id}node block
 layout dynamically
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Agreed. I have replaced the shared-header macro with
F2FS_DEF_ADDRS_PER_INODE(blocksize), while the kernel-side cached
lookup is now DEF_ADDRS_PER_INODE(sbi), matching the other geometry
macros.

Thanks,
Kelvin
