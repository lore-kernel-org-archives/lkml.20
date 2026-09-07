Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF59D409273
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768753; cv=none; b=nx3/yZ0eYCq3g+m3/u9IpU92GrTqtxkrSri3cbjc4kRON6AJIHtp4lYvuYSadAPYfpIugYJWB9OSiP838nZQq+y9kD4P2Wr4Tyx5Fjd15LZb42ks+5rH7qDlkPu6ir+zCrbz2+vm6ONTTgQhMVipfy1vufgMhHf+iuK2CQ8V9XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768753; c=relaxed/simple;
	bh=3DpXbIfal60znQihoTzW2Tp3q9D9M0PZ3qy0geTQM0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxkVKDQo+GC1NAneA64lTBvKsbgEePh4rQ4bAare4OxRXOZMaIlupSPyZN9HPT1SkoMaoeOjIEdUYo59Ki3HYdo6gCESYoyQ2XdubRcGFgK7Xp058UbBlM5rkPgatgl0tEu69LM0DKCwpgS3BbV38yaiyujB/GSWbBNEC/oHLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnQZUClD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnQZUClD"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso2331930b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788768751; x=1789373551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=971x3L1jLFO50aCCes3jvxmvwdkEiKwHi793ZZpvAwA=;
        b=DnQZUClDG+STAKi2HTSLrDEXSMtoZjFRetEAcCyXgKgIgAJQP0J/xE0re155nXd9XV
         7CFpmyqtOBHHtSIB+zCTPxzrgqPLQV+4ziGrlje+73VfQarvb1m2KJMeaeEx4+KSrJJs
         o0yhQOR0tiW8gVef+uCwa0VrdzZHAnzQgChMbF9cAc/sDQlKpg0K4e/qZrpqFn8hG/5A
         2rf6RI0szykyjTw0iWW1S6WOvKbszG1OmXQERezXuf5dFlFt/SHv/pZLvOyp7jdOpPuh
         BraBWPqceHYoOqQDhuZZ3p1J6a2e/HAjCFhOW+zR679uVZxBTxNq24d/1357kOUBua83
         a53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768751; x=1789373551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=971x3L1jLFO50aCCes3jvxmvwdkEiKwHi793ZZpvAwA=;
        b=fBza74mMLliJyAMvCEFUVtWONqrsy+oMpUeFNWPzThK+pllgF7YxdV0elYwIQVxldJ
         NG7uOqi09jIo5oUttrMsFAJYzEVl8pFwKLRdTkPX4teQ9EIP9kv7WurctnIpKlu/lJce
         NTWU+Rciqe3kmvIEVwh5pBD+oXv6o8Z+j76RXLua4dCbZ6Og1kmJKgJql31kD1PTsuM6
         mcuMUReUvmttdD8VjFfnWQSXPy/AUQTIaL312YMomLQaqedHQ2SmNQneEUEa/+9TnmHb
         SkH31z70HHwL0a7NrVZBD8hg4HBRMTv4mhiYk/iyEE/LIGQyt2ik1Yj7q6PpZi1lYLJG
         G2hA==
X-Forwarded-Encrypted: i=1; AKwUvBwINhMdvIAPzhQNog/KxhxTEt9kLtWrruPECM8riTwBXwqbRahE3QQHJGVhJYGNi97vvtVcn1ba97SeKhY=@vger.kernel.org
X-Gm-Message-State: AFuF++kT0mOx1Z2ZTG7tdWs9OEYEBvreCaXizS8JlD5QUqsj5MCMZGGF
	pjN2gtLJ4UzAAhQzQJWp8jRDcNJN6rMP0OLMhin3EIBxtCBI2znuB+bpzxXnNt3itVtIUw==
X-Gm-Gg: AYBFou00HFV1qc/oBrRhO1Bk9OEJII1jWC1ldFpqKkSLVEbRi+VR4VS+CjaEqifQJTw
	20wALS33z4UDPoOPyV+HQSaxR4IB34L1qUTTkW5j5dNFty2BEeIV+ujusdkISG2+MsZTUshB25g
	buxMdCoIW1QFR8QalF2n+nkv2Xa5D5htE49JXJAnbIegSb6JDIiiW/LE6VZI9Bz2I8C6ZjP29By
	4o328wvS9dwApxlY+4m31aPOy/WATgVvgIDjCpA5mORta71mlB3wvDLORMbQNHp1pP7SNHtfnjm
	8q7U8M8mYGyq6q8/1Lj5zx30TkekE1h6U86AtWTg5PEOokryQxuzGmBwcRE4NZE6qfXYGfPmJ8G
	2A7wSkKKWlzKyvazwMKc6vldjQL88ZvDfLHwSKLrwR7vs272KMjAjN5ePY795Idlq4R4YaaRU1X
	jWEn8rFK5UTC3C0W7nX+RrEvWCJlz1uff3XruktgfYPRrEY9wdCoTUlMzbSD9joDVCbmn4EgncH
	6v0JaFRr8oFN7aXfVhWUP8+d6yQFUv5FjOAafYjj4JjlxtiDur1ElkQqQM/d7fH2qIjCnGAQwQm
	1ZZVlYE=
X-Received: by 2002:a05:6a20:e607:b0:3d3:adbf:777f with SMTP id adf61e73a8af0-3da3a16a54cmr35721717637.20.1788768750876;
        Mon, 07 Sep 2026 01:12:30 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45a6abb12sm3535544a12.16.2026.09.07.01.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:12:30 -0700 (PDT)
From: Wei Jie LAW <98lawweijie@gmail.com>
To: ribalda@chromium.org
Cc: 98lawweijie@gmail.com,
	guennadi.liakhovetski@linux.intel.com,
	hansg@kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: uvcvideo: Fix NULL deref on events for uninitialized controls
Date: Mon,  7 Sep 2026 16:12:22 +0800
Message-ID: <20260907081222.2541314-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCtypCfEoZbRvdT7EoJdd2G8yOVcvxBoS5LcE60UjFQx2g@mail.gmail.com>
References: <CANiDSCtypCfEoZbRvdT7EoJdd2G8yOVcvxBoS5LcE60UjFQx2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 7 Sept 2026 at 09:00:35, Ricardo Ribalda <ribalda@chromium.org> wrote:
> 
> Could you provide more info on how you reproduced the error?

The device I used is a Facedancer UVC gadget in a QEMU VM running
v6.12.105 + KASAN. It has:

  - a Video Control interface with an Extension Unit: id 3, one control
    declared in bmControls, GUID not matching any known mapping,
  - a status interrupt IN endpoint.

The crash is fully device-driven; from the host side the only
thing needed is a process that keeps the video device open -- any
camera application will do (no ioctl, and no privileges beyond normal
camera access: the opener can be any active desktop user).

Userspace never sends UVCIOC_CTRL_MAP / UVCIOC_CTRL_QUERY for that GUID,
so the XU control stays exactly as uvc_ctrl_init_chain() kzalloc'ed it
(XUs are initialized lazily by uvc_ctrl_init_ctrl(), which skips them).
Something then opens /dev/videoN, which arms the status URB, and the
device sends this 16-byte control change event:

  bStatusType  = 1 (control)
  bOriginator  = 3 (the XU)
  bEvent       = 0
  bSelector    = 0
  bAttribute   = 0 (VALUE_CHANGE)
  bValue[11]

The worker dies before it can resubmit the status URB, so one open()
gives one oops and the endpoint goes quiet; closing and reopening the
node repeats it. The oops does not depend on KASAN -- it is a plain NULL
walk on any kernel.

> nit: I would not add the comment.

Sure! Will remove the comments in a V2 patch, which I will submit later
along with the [2/2] patch request since it's a duplicate of yours.

Regards,
Wei Jie
