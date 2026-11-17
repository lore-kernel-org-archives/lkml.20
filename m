Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913163;
	b=VIiKtldM47stKLnu5pAkpWR7ElSlpX7c6joVsWGufFUPTKQzxkbRU4UV/D1MYcaDew1n
	 9qSC4IDcu5SKE+oNASSFy+inA+h7QtutLOgDDqYluH0aOqf6Yx9OhzKcjB5yOYPLQs6SN
	 mSFXVgEO0mkthSuV7+qDT1QgVpgrPuGlJBu2bsNHqKvesLvsGX2tCVN//9q/j7zVQhmVZ
	 lAVMOaiUKnJXXpctH2HekFDGqwB/moC0h0gF+QQC08DcCEQwYL0qb2K8Ea3DaYd3UnP19
	 POgya11CI6mawnOEvS2YBXfLjqtA55xaOtheM1PFVBw8LFesUJJrhIztCgg0aXV5RvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=AWPCuPoHCv+Zra6hIa4YWB5+e+mvMzbV0T9yKI8SxJ8=;
	b=EPBf/ywuZUV3L+8xLXgQdZe7aOQ651AIFZytKEpngjQUl0pD8SfPArSNd2dEufJ75bcI
	 WAGRhnZYZG0DwGCf3BFkSyGKzS5KIXJBp7wV090kEJOh3o36PvFg+tneBmboSTYzedmn4
	 aDlBWSQt5ogDPDeHu0zLpmvxo/pqrk68geF75y9wR7NQUHFRxDm0E8zczynD+7CvAAc96
	 /LHjJUtHjdpJYT979KHVVNCNTZEwUDnmLsPqBrYgVWW/Ub41fcNXwvkwXkS+JvMR/Cpim
	 NmFul/YsDX5MuUFZ8o0qe9Jx0fuulsDIrFibJJia/1aieyPmLKkJEUQrUxd6EpI+gDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNPcZPEE;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AAC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23AAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNPcZPEE
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-378915168c7so562432eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913162; x=1795517962; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AWPCuPoHCv+Zra6hIa4YWB5+e+mvMzbV0T9yKI8SxJ8=;
        b=UNPcZPEEsn37iNzR5BHZ42Sr3tN4VZ9Lv2Yif3EENPgZaFaLs9tqDqtEEfq53TCXCe
         3m3KoyPcPsFm2QS3KoRArF3/pTCgbHxxTXnz6NJCLtzMLAtPKFravgmUpDDnKnDaemaL
         rZhoovzvspQB9lZgRcEne0yltohXjMT88z+Q8x1eGjmN5a8mFTxw7/38YpMmPdERoiPw
         DYvbjN7Z8f+aZ4e1hsViJkjXib+XMWch8pjQYlKWAZn6A/Ne6iF6cAes/BilS+4w7EpK
         bckXAnSJJ5JlKj3fo8x1LofNXVGHguylqhbdmjHTGEVPS4RUbyqx+dq9msjuNiV7IzwT
         9a7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913162; x=1795517962;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWPCuPoHCv+Zra6hIa4YWB5+e+mvMzbV0T9yKI8SxJ8=;
        b=1LOjwSjsx7EJIUDgcgkdqS8EYqggaTeM8xMJhxPjPn8DuEILx6fWnbkEDUah+9cz+A
         WFUJmmTWAtKnTAGqUnsy2jpgfTS57Fj8LgY7Lrl1/ePdILpXfSPXU2l/yehWhh8pf9zn
         /7S9Tpywgvn0Yy7jRQNqGvYyfIapCLghVpOGHeEpUvruesP2sDPA+g1X/FiCWTKeZrx6
         mfc1wojy0cZBIRscgNahBdb4DuylhhoZUnWj1TJbmPUi4+uJTNTNxvDPVMmkyLwBVk50
         QUzS9URwmY3wC2J6QaCb14V9Sv9QVHTnfYLmQcphiXzBbIbbNQ2xRiHVga4OsGznQLuo
         iDRA==
X-Forwarded-Encrypted: i=1; AL+hErHnwY59zC+TFknSp4BA9f+X0e5ECUJfn0IdnTjAeNenWW2ZaKvYS3AsrziVuYZli5wlLb72UoqxY1cQa2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pHtCkpuhHUz9xHJTdSbG0yucBsPrhU/oYfjr9KiGJg5zOaNCp
	3a2Ie6VdkqcD3ql+IKyijJk5hEZN4HnRCuZ7p8AdnCKcoukZ9xny+laR
X-Gm-Gg: AZFdTZcAfeJDsT+66Uo1at1OHULyF0wqWQNgjFm3U4CNNH65x4Rkp1CjmNTYRJOdgbQ
	5Pgk78uZEvT4SAM5bmvaox0g37qh5ZFAHDPLNQgMHAC8NTbzJYDj4Kq4NNzHMDS0Hou1BRpfacQ
	LyTZKM3JjRPc4CmhMvlzKL8h5zdjier1w4mVoaKDbmTcDqPB/mCgQ89OzK70W7vg/IU3zKZXXmM
	UtRuIlEv6psemYGNE3mlMW8EFSryhQVwcdRjxL8RKCr+a/v0NnQqkumdOblgC+ps7udOi3sfcl9
	snRmale7hvwlVePulowWLqQMTN148XFqABmDVcFPoGmXj9pZbfnMKaTOOm835PVLU+ph+Ci9iG8
	vGLYI3vQ6zWi1iz2vKudIRV7V8F2NUL5sQLRu3mN7MBbl5UfQ/OAk1KNqcPeBy07atJYnaexHR3
	oTYFlKLiV9lMFv2jF2wnrQlnV4ljVk3LoWWb29a66WA4gajPj0pTqITRMaA+g1L4xVDSkbMO880
	B8V8w5Gyt8cI1UidwJQca5wYKYQC7gW2Df9qCrOc9d9vCeHyiGOBJM/fNzGMmyBsEkNp60zQ7oG
	KweVGxXPy1/k2mhZxd4OW1QtoeOJlCIGwZT0uyuFR/+OhS7kvC00xCzWpUYdrodBh6Y=
X-Received: by 2002:a05:693c:895c:10b0:381:6297:8f99 with SMTP id 5a478bee46e88-3816297a694mr2315523eec.2.1794913161810;
        Tue, 17 Nov 2026 02:59:21 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm44832996eec.28.2026.11.17.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:59:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 09/11] zsmalloc: embed struct zs_handle into zram
 and zswap entries
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
 Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, 
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-mm@kvack.org, Yosry Ahmed <yosry@kernel.org>
In-Reply-To: <20261111064707.2568433-10-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
 <20261111064707.2568433-10-senozhatsky@chromium.org>
Date: Tue, 17 Nov 2026 18:59:13 +0800
Message-Id: <179491315345.964041.6401768578977065454.b4-review@b4>
X-Mailer: b4 0.16.0

On Wed, 11 Nov 2026 15:46:32 +0900, Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> zsmalloc allocates an object from handle_cachep for every stored
> object, just to have a stable address which compaction and page
> migration can update when the object moves.  Both zram and zswap
> already have per-entry structures that hold the handle, so we basically
> keep a pointer to a pointer, which costs 8 bytes per stored object,
> slab alloc/free on every store and free, and one more memory load on
> every access.
> 
> [...]

Reviewed-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

-- 
Best regards,
Xueyuan

