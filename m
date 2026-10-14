Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ACA4B95DD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966108; cv=none; b=pvYze+clrOf8WqQa8zSRvHmUrEQIOqE5NJuq/kwo5J2QjUNCA9NxKxdtZ+pa3X+/ZUDBciuPGflgAoCzFeoQQHg/Z7EK07Ma0srCR0ye6bknCZVcMn1ievZnqWHRONztHJkk4Ox1oCeymQ13mzvFzGCdQye2RQo6XpUBxeS2iS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966108; c=relaxed/simple;
	bh=Kr5unUAIa8oGF/KMjvc5axYUClGvH/WWrJ3jkSuUH/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfYs/NX3nTC2iAjaGBuI7g1yiUZd8wpDLC1/SQE8QzpKN5T4kmag1QVPBlbXe8JvZ8axTkTOeHH9w90oWkqdEIbW07zT9QKphtU6kvjUZdq4Q8t2TIb+E9Nbp4sWADVkGhROZq+rUCrV7QEStFllzlDmtQFOmMul1PT788UuTuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dh0gJk+W; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh0gJk+W"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so5028778a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966106; x=1792570906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIqmRCanzliCsFC9PxOalwGQeOVpZnyyz4eVInI9kOU=;
        b=dh0gJk+WQD3IXT9ih4Hubr/C9FIj88IqvBaS4Et1eat8Nm/tS9XFx/mDuTbg3GvtHy
         TjWWSW1r2TtQypyu51jBUQfRZBtHUcbvWfKXJ3tAMnsK56DPJxz/m7ufzyFS1Drl0tOD
         O83PBMY5uWCuo+v5gcZdm16Lq0u7xLW2qJ1k9JYYh03p2CTvgZgmC8hcLBol7uQzlDPY
         tYIXu9E2v9IN316Bu8hZ3RtRL1/8VOWpte+UxxnTyM6VG99G1UakKlmkEfB7/O1Qb0Cz
         I+DJoT+wOar7Y++XDG2VAo+zyGp+whbvnx93QHVFkYo61vlKP1g1iiKkImHrZfLWXvda
         gCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966106; x=1792570906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIqmRCanzliCsFC9PxOalwGQeOVpZnyyz4eVInI9kOU=;
        b=M3S6xP3mageV+76RXlYDA3pZcOAI6LAemrXX+nkUMN8NJiuY/FbaEYoOF7AIwopRvP
         ZOHxP/xsoA5jX0eAH3YIJ+ET1Da9XF0KBa7Dv/II1cPpJvt6hYywEMDCDl7hcY3M9TxK
         wWKj4wLnDGJbfFAkr7FJgWMM9foOCysoIYH1b1x1kyCZOz69jZ0JdIgBJGY2256fVlmB
         ZTDgcnjzXWiiAv13AHO23KpHhosav8KJVtR3b3GqwaPzAKEdSDEaNNd+Q83DVGD2hLcF
         9k+zAhNz+AdZnYrYi03yzw2InTNoJ4VN5T9nDCHDTwxhqYj9pzSirSqWz35P/bOPIfIZ
         0vIw==
X-Gm-Message-State: AFq9FYKFFqPGDqIaYIH2KhEhQqS2/fh03VkSjdwI1oKygegXGfBN/qY3
	Y161msEpoXmPHyRDDBfc1K3FLWUBN8Zclr9Y+eom7S3seOIFXa+QWlUv
X-Gm-Gg: AYBFou2t5jOCr8GyGmFBk6Dz7c8TplCFV//O3SvVybuHp6ozhNG6UE56TdOvS13vzcy
	a8BXZO4RMHNvNDhJYwWTcn7BD/bzVhP8iT2ja6HAnHQ/IznWlRXYP77srBynxcY9HiQreCkQLax
	LoE8LCQbUHsEZzFTt9Vjh/r+KglBF45NThKK9dskqMEgXYRbxpsn8aZvhVnolDKQXnllv9CP1SX
	OkHwHk5CCgC4nAvPILsnNMVUlCO7CXITPoWVOrsKtRbpgDdhomdoc0JQQQcRc/btHMZq9fTwwVv
	14g/ovyoCxUJ/0ghdNSW5KkNxelnIZtow9pB1eAisNhBD70I1so/yRfqAmXMZDKbCb8c2TDz8qY
	rWuKZdq10SJT1RkE/OQ5uJ7cTdllelqDm2AbpyumvJjHr8bnkpIlbowa4Xr/HLuLGXAR1OKaKak
	V/Z0Xs1Eot/LHTovA9oxdWVM5Yizn5pbrKmbWdifcZOn+HcYRFpRwf/TlBAvprklOQ5hKJSM/RX
	YhSXp1T28f/VmUbAX4oyQJsHGGEhqjDU5k/c9QiKhLJRHSqB8cfS096r/GJQ6j91ub1g3EbqsHQ
	BQyhN+og86/+jAtYmCOJq6IePklHv/X/S1KycQUMOxtjuvlRb/VxvexMWqwI0NQlUigu4rRzjsq
	bO4Iw2FjyKas9bv3wa5fREdM4wcBMLpnQLQ==
X-Received: by 2002:a05:6402:360d:b0:6b2:3b5:d078 with SMTP id 4fb4d7f45d1cf-6b203b5d161mr1539046a12.30.1791966105408;
        Wed, 14 Oct 2026 01:21:45 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388545csm831488a12.22.2026.10.14.01.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:21:45 -0700 (PDT)
Message-ID: <213005bd-d502-4843-8b04-71fbd8ee2685@gmail.com>
Date: Wed, 14 Oct 2026 10:21:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fat: skip rename rollback on buffers with failed I/O
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com
References: <6aa82300.a211d2ce.1a5198.0295.GAE@google.com>
 <20260929090029.742579-1-krystianmkaniewski@gmail.com>
 <87ld8j4161.fsf@mail.parknet.co.jp>
 <1f18819d20c92960b8b2d6ccc8bc4506d346150e.1790779353.git.krystianmkaniewski@gmail.com>
 <87bj90m6dq.fsf@mail.parknet.co.jp>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <87bj90m6dq.fsf@mail.parknet.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/26 20:36, OGAWA Hirofumi wrote:
> Krystian Kaniewski <krystianmkaniewski@gmail.com> writes:
> 
> Is this trying to revert as many as possible even if partial? If so, it
> would not help actually, and complex. Maybe we can give up whole if
> partially revert?
> 
> Thanks.

Yes, v2 tried to roll back every part that did not share the buffer with
the failed write. I agree that this may only produce a partial rollback
once the rename has progressed past a failed ".." update or old-entry
removal, and the alias tracking makes the error path too complex.

I have reworked this for v3. After either of those failures, the code now
gives up the on-disk rollback entirely, restores only the in-memory state,
reports filesystem corruption through fat_fs_error(), and returns the
original error.

The remaining on-disk recovery is limited to an earlier inode-position
write failure, before any ".." update or old-entry removal. At that point
a complete rollback is still possible by rereading the retained new-entry
buffer or reacquiring the entry buffer through inode writeback. For
RENAME_EXCHANGE, both position restorations are attempted because stopping
after the first failed restoration can leave both names pointing to the
same inode.

Thanks for the suggestion. I have tried to address it in v3 and will send
the revised patch shortly.
-- 
Krystian Kaniewski
