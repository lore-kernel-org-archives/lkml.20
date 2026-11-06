Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986265;
	b=oLAV2LoqDmm7zgtaHRscCSsgfOCzXkHs+yEUEpRgRtcyE+eaCFY5AfbhkQdXl6UhLEUc
	 jaZoC7Redb3SKeM5ymOGIsz8kFz2U6qC5kE11sm9eoKEA3tZNmIr2nQlDmBIBVkRiIWLf
	 55wmWEAknFyLnlrq3GEHGRmDluk8TI3Kw+81qkqH22yOx8rmjPJ1QiHvSPFqe86+jZ/F1
	 Ef5vZ3mfcfk3GwWPAJ0kpackviByfZFHQFg/ZUPZCbx+ivvAvqh4qovVkXM62k7ugj95z
	 iuPrHJFKyMmGCLVBXi6oCbcdsJK0e4ig1WCLhsnFYKX3SNFyURlg+UOu99Fmpvc+ZFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1w1A0YYt3j2Y59sUP3f8dMzSN3FtGYjMk3VwQ7eTNTM=;
	b=qRrkZQ4bmQrOo2khE+9S//p/24br55teIeaDGRlg8ZrDAABCNyyxy9jBGGHDJ0nzDvyF
	 0pYuw7zuRdHz9A9Yn+DS1iaVrIgUoV+zgRMxZDGNrg61r5JtLHeRboDb+cUD/5iWE/+l/
	 EeVAMi+Ry2zNW3ZJPKzAMyghNBykBwspr6aSFwTIckJdCR4NKMmFoOitkB+gYqtP+JOZM
	 /tG5Jvxg6aHrWUnDSVEKGNidT0+1OF/5MSyT4jqLlC4zez32JKJQBFVXcuuYgiNCBAb4s
	 Zlp7nSejFr1mbhkafYY7QLl2wMfCaGnOL16TOWwmHYTZQEZG6LELz4X6LmWfTCpV7pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtiRUZBh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC92606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FC92606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtiRUZBh
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c3fd91337baso165381866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:31:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793986263; cv=none;
        d=google.com; s=arc-20260327;
        b=gKXFbaNMeGKjGXj17gP8Z7rO3+HdhfD1cac2zfKm5BiCsDloj2Ip6IUg5hxZQF8ZBI
         aByMJui8/uLGKyxuInQLiJuLKl3wlksUPNhiiHPYhUHxxih7DFIZhszFPmHRLuddd73H
         tT+B0US9MZCumajbd7O+nGTfhgv7XQFn76VqEpVqJAhsyje8leO9St+UigBV8KHeIHs7
         PtuzGZwqEs+550ZbcdMQREawhoZWp9fuVDKvcBvX+CfsC0A1BLU72VZp+n33QFwnSo8U
         ykRvB7Oixn52JJitZdbyR61Nx2CwGS39Y62oO5j8XrIX3Fh1y4UVBe7D673mPRmXGITD
         OptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1w1A0YYt3j2Y59sUP3f8dMzSN3FtGYjMk3VwQ7eTNTM=;
        fh=o2KO8mnDulTfOZAjanDUQCGGYkOoNoS//91mAvJF4hE=;
        b=l/PBriHDAwL5/5p0SxrQb24ysF7B2lOgq8Qni06t1xnVJr+famv9WeQpKMOqbSOzfi
         p0ZbbnW8M+tPXsJ2k+o0NnAL9TK5xtjziKTNEYFjlwZKIj7PyeABggR4h3gOhO/06iEW
         3tZWjcac7nNFa3dtX/iuBPSeA9UfE6SEnJKtDMscMKdS3FmCUDwRxwNDrdhSL7PxmyEI
         zYlHgqOPwvDtUmqz9IT/YIPk9YgKIXH8Fn6atInpsElKU5bTTREi7MkKbLzpyuja1hhD
         soLftGQRZtDS8cu7Q1WTYDxEotmMHDFtoRNkLYXD/Pp6PZbyYTj8uMF1D8HzSS5zdIsJ
         Vapg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986263; x=1794591063; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1w1A0YYt3j2Y59sUP3f8dMzSN3FtGYjMk3VwQ7eTNTM=;
        b=JtiRUZBhEq8rmrwDGWUH05kEYwS9S1QWv5x6NGd1Yzw8iNIdfcCYtxnRcszo1dxFdb
         q9tHslx3a7wF+S+pycyeM5qMvxra2vnxMuCMifQxMzKfvOS33pDGc5B2inDfVPwG91Ea
         yX2GvcB44x5AkED0PFIfUWHjlES+iy7WV8zsymJhe21BKNOgiDGk2iPm0cj7t1K8rpBI
         /3MzSFoqAPqzL2YWEoBu42pFkvgiFirPvw4Vo4ZCJoWsEHhDVOoD6/3kS2Ug51KZbUof
         l4SHuZf/v89UFIpPXvtrGAg9zNT+Ws3FCL3AfD4d9SiLnJS6ydMU7UuE6FcThOwvtH+R
         GrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986263; x=1794591063;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1w1A0YYt3j2Y59sUP3f8dMzSN3FtGYjMk3VwQ7eTNTM=;
        b=EPW2Lu/EUhAfr9/hdY4oIqI2PA5uxDbA04s3bNH7AUPJFxQPCw3CRKfJMmSHyezZ/Z
         rSo84tJhRl7JxN65HX3/VTZhEfO+hS1UQEP6ZqfxMldCRalt4jj2w+crExSk5vo/tMbK
         LnylWdev89Rqnw8QyAnETCLPHt9hW/4ubo5vIqxJW2eXx+jYscs6XdgfKtuExGTk8bn2
         XfFkOW2GDMOggH28bRuqgho8sm+jfYCLpRtnI3ZWYmTmDYv6QXFb7laPXM6BhGLE+5Mi
         j3QXLAd9g68OrO+06Uk5PZlNiy3WoIYA3QJ6ICeC5WIevV9MwxrxS2BdguByy+dddAwI
         MKDw==
X-Forwarded-Encrypted: i=1; AKwUvByiO6erupoF831t/o7hj49Z2ZhMyqN+17EIXPcWu1hN0pGuZcJlogH0us/zfiYpkRldsE4TNPnGj5nXWgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eStKqEW2uuVHklnn0ICBW/xJ880uhPfN4f5ZwFxZn5zV02sqR
	Zm1o6alVbCi1GutGY9jRByevbnnaMAVfhRA7SZyQjZroDzIht4Hmtda393Rayj9FQgVHp1zNCXJ
	/Bf1l2yAp+EQ5uLEgBwS9Q3hY0v+X0MY=
X-Gm-Gg: AYBFou1YPP/s7yNerZ9YCsjj/sxi/ZnZLLFgj1j8nloXO+7wCB3UTY0nA+USRmzzlNA
	SAdqrclkIadqThusON36tLMmh1CL1Fnkgr7XxM8gFp7IvHes7hzVlQB3ytnjlENnNuVcjQNjqtd
	u2gsSjLNx26rOSRyl9k7Lupmqit1djKxB8uzTm3w5VXMR3ifJZvxD6vKkZvzW2rgj0braIAFLdo
	bnJgrqHeN7V5QnDmsYRDApkMZUvsRQERhSDr5JunHLRVLOIMPJ6VqXijro6raL++giPLt54sJPc
	V7KFq1iLOfT+CfG73s0a8LERVAMs5ksUacug4lHDhEihUiP/zm1cLLx7ycxXdI+m3JlfuJhPR0g
	Pf5o/XABMDFzE2VatGddUp+ujO7lXtIKXqh1revCrkNyxVWh2fljgE37vujKCy3JWvUdgAyuzjf
	FNDmCvMfS1d36YhDJb0NHrMKBjp0uyy4gqeRsJ2v8=
X-Received: by 2002:a17:907:c491:b0:c2e:378c:8ce3 with SMTP id
 a640c23a62f3a-c4d34d0b0ecmr280928366b.32.1793986262869; Fri, 06 Nov 2026
 09:31:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105165055.362-1-drifabdelmalekmohamedsaid@gmail.com> <au4DDpKhquR7oXwZ@gmail.com>
In-Reply-To: <au4DDpKhquR7oXwZ@gmail.com>
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Fri, 6 Nov 2026 18:30:52 +0100
X-Gm-Features: AclHuK-I33fF8kfr0S1lbJN3JaH7H-mWL2RbJZGACBIaUUN__y3k2Wl4NUj4pS8
Message-ID: <CA+xk8n8apsFgcWfzLtWrtL2wU2R0Rn31hU68oQ_PRJK+=dBc9w@mail.gmail.com>
Subject: Re: [PATCH v3] configfs: fix slab-UAF Write in config_item_put
To: Breno Leitao <leitao@debian.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com, 
	Ran Hongyun <ranhongyun1@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hello Breno,
> refcount_t: addition on 0; use-after-free.
>WARNING: lib/refcount.c:34 at refcount_warn_saturate+0x76/0xd0, CPU#1: ln/172

So i think this is caused because i removed the null assignment on
parent_item, so it catches
what parent_item pointed to when refcount was 0 but before the free,
and this is actually my mistake, i sent a syztest with the old
parent_item = NULL after the put,
and that is actually important here, because it protects uaf in
out_put and out_put_target,
so we either move the if (IS_DEADDIR(dir)) check after
configfs_get_config_item and omit
parent_item = NULL on the 1st lock, or we keep it as is.
Should i send v4 or you can apply this directly (if good enough)

Cordially,
