Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660349B1E6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407820; cv=pass; b=YJp7RxLBp1k5cgmXa5qqoI2/mM3yEapPuM+QTtcynV7KV7ax8w0zJDdgbIFvCMujWhsf5lb9fW2jNjnP4osm75JXGLh2hGkrBgiY7x61fTmdqT5G41bWt+C13ton7YM6JehKivcA22DYjATJIj+QlAjxbLdst0WxXchITHM09aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407820; c=relaxed/simple;
	bh=G8OXot6V51BBfVoTQkyM7CkQn7BJdVq/SOYBCWzt0II=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXsNix1T8YinPagqT9GHVwiDMjC/UOMCINYvw/eizeQYZieijjhxdA25pcTjxMFSRaBQdRrEl5MDP13jtQO/+jN3nvy9O1oki2rhcs6k2lsSR8nFgWwhULmhPc8kIQfh3NKJ0bEvceZrrvSU7bt0/y1tPmYN+ykuOGCe/j1qxtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2gHHyYV; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2gHHyYV"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4eb63f0aso8746227b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789407806; cv=none;
        d=google.com; s=arc-20260327;
        b=b4gYNBBMb9wknR92by3ExPSCTfztBw1+ROwT6CwGk5ufNr6oNjzuKvFDe9okMFP9XF
         UPYnuoTP/SS2wKukcZjfP3e2JTtglE2duYgOkcDOjn+dHVUm29gfsHsARrMNuhek9cS8
         e/zdsXsodM4NesCCIK7sRqukkcbQaYVfjibzGXJWfE06Cdqw0rjOUXNexgpRm35RM8q+
         bgpQJmsIOl7GdiV0jau+ZpBit2W1F6kHmB7805CAm4anenvGa6SCDaTTT3ARgCxtJL4Z
         JWAnA62OrPBYgjPvl22ivjV2oPVri82mdGz79DsOhIYk+2oGxfxPZwSELd6ws7XZItdi
         4YzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=G8OXot6V51BBfVoTQkyM7CkQn7BJdVq/SOYBCWzt0II=;
        fh=AS05oL4QEhSMxRnT0oLyhYTFdttJ1p+i3+gPIHPa7Q8=;
        b=drplmPrVqVhHh4TRcmjHbsDsdifCZYLhFvzuLL/G10++Sy3QQ7X+ZtJCo0iHbiksOd
         QyE+/SMBHXbxm1oU/3l8fuRYhav1WC3ifz31TtX0jWcQavmOgaKhgvtc9Z/ju+gNAFju
         +xA1UZxuw+gQoTEGYk7hvSFIWniVLmxdsydjMjlPSkbuNJGEGY/YVR1ZDB1cZkPrTzDz
         mUTPbITp6l/JeXgoi2NSxSk8ADOmhgGqYtd9ErOKUXdhGKF4eL+WjFmmjLsWQNpUp9aO
         Wf1G0pz1qReZ7sixqiokQtYgZnYdM1gPu73A/KJnPMMC5A5ZXIgDfPtq8wTwAulk+M7q
         5aQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789407806; x=1790012606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G8OXot6V51BBfVoTQkyM7CkQn7BJdVq/SOYBCWzt0II=;
        b=W2gHHyYVK/InfvtNjaXPw6qW0DaGH7gIF1TqM01JnY4P+pLAqohaoHCElqKoWuIgr0
         69SCSkcfnL4PaZxq1PR8xfpxjGVwBHp0I17X6X96MZPZeOZguQm+GVP5/uO6n6FuM9Hp
         G6RpD1bKgWUJlEz31VCjLGkbU9mhaJLYcwUmJ0o9PhMaJBY8bEoolobgAk1CeWLjWjnk
         OGHs9AzMfuaIaabmTaHvDGJnTlJJh61g3F+2QvHZmhbysxbUF4fYL1/Pn4Y7lmlLAdCh
         j7SOVXRn1EEuPF3pM7UaQU3AVS29G7TWgrrEtnK25ZVszTThPnSN7JiJOozQOKU1p6gs
         JQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407806; x=1790012606;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G8OXot6V51BBfVoTQkyM7CkQn7BJdVq/SOYBCWzt0II=;
        b=bNVkPfxyXJj242e2IjIYgxbz/iqG3Drmuxxpk3ODlHidyesVcfbLz4RgcvJs5mOD5B
         i31iwZTiyI7en1YtmIQwCb9rFy1/V4AsiBSiBbgsaSmEPwSDHlgqvLXMuJDXD121qCDw
         /dLEdPu7tfCp2IyhFtryUQBAtfUYU3KXdkBx7NAdlcQPy6nTXboiyyZSN8B6nM4SnJOP
         xWAQyUUEoZQoUTcAQfU3rMcNK8N3QEgHZmECrp14IeXoZBtpn+/3ft/lOaDlVnu9kuA3
         82NO90IBqCB3eglbjzWvNhlcks/BWJLcC9+c6gbcg4efDG213gHRhaRvlE2smtgZw/Rl
         YBGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWfVyLXQHh38aXb7CncpFCufFlNxKVMGF3kh31NR1bgzWYXbiJkNZt0RNV68IQksmjtovdm7PKtVYJf1o=@vger.kernel.org
X-Gm-Message-State: AFuF++kr+4s2U1ReHhRNJFXcKwS0o3BroLveVL4qyII+3ErzRArtjgmA
	XR+huGCrlWTxS4h2sZT7xJEre5deeW6oiyv2Tsr/z7Iz8xmLevTVtIi6hfkv0a+f5UJYFOcGx54
	vnhbagVoNcGFeNgt/p2XuFCP82lBPB+M=
X-Gm-Gg: AYBFou0a8lnWr0ljpjM7bZ6OEXnuLLa2EgK+FbhTXHH35FNrbtWlusMOCOBwlqfxjA8
	C4fHMSjRyWZtWCIVg/GXyXDoWV0DAC/wWowYfWFh6mNyvRJ6vaDK/pc9TtwHRkisxMoKbZ3NCyu
	fi5KLj4hTnbM8PyVZdecVum5DK+PUI8IU8vnrqyKKP0rLeq5rLe6Y4UoUfsNsfbuvDEyb0dPUgc
	ZuNgwgpruNOz5NtFb4TXsjzo2PbhiJBX7mI8+gCYKWyc+LiMvKHFQtm7lgatsP6tsjwTc6Ct08e
	mH2202xLtnvbvOB3feaTRX34oPltksO95Ef1aDsXdRGjbkfoQaUfWQcgHePuAnVdasjvpuG/uh1
	CHWHBXJb2ezXdGuj03CKE2Ani9KC8FLr2pkaS3UH8BqJIdQsb5rPiP2jOZLi/AAkSn6jRVr8yLp
	rZ6im0wYI5R3auisHXtEI=
X-Received: by 2002:a05:690c:85:b0:884:b55c:aa1 with SMTP id
 00721157ae682-88f166ae40emr969597b3.1.1789407801180; Mon, 14 Sep 2026
 10:43:21 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 12:43:20 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 12:43:20 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Mon, 14 Sep 2026 12:43:20 -0500
X-Gm-Features: AcwNN1V5ejE6a2Z-mtul4yB0acJd4gEEhzVSi-sicYMYWvTtFUs3wuDZkve5fw8
Message-ID: <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: shuah@kernel.org, skhan@linuxfoundation.org, valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

Friendly ping on v7, sent September 7. The code remains identical to
v6; v7 only corrected the Assisted-by trailer format. Please let me
know if any further changes or native Linux/USB-IP testing would help
move this forward.

Thanks,
Jason
