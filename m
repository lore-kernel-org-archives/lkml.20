Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EAA4CB8A0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767391; cv=pass; b=nVLrK3FICV+QWE3BWJRCNjnyY8YkB+wZrg28TVLQsawJM2ld8SGlVddSk9nda3ztypMH8sV2WUjUAfF3v/atahxEJjqaqxeCp5U5xkYPxDGdYEEgjgzngyH1eYmu/skOgzTM/HMEaftxjcAlD139b9puYlbie5m0g3aNFG8qtpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767391; c=relaxed/simple;
	bh=ElwHOsNcwB45oWoqXfNC0o2cm25sKcOriVju/dXKb44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xqe1BWSUKAgIpLv+8IwRDdgbWweCH03E7UICz+Zidp+qTKTymKaCModBKgmZVARJk4kyvx1XTIoCLg+zzdxQEJywOBY3L8vfz6MQ1krBAstSrsBJXslcQHMKs5GavQOLZLIdf29njMXhxK+ns8PGYnH6wsLFefQBuJVOT8LTnOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A3N9u3Nm; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A3N9u3Nm"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-5332b66b660so43458951cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790767388; cv=none;
        d=google.com; s=arc-20260327;
        b=YJLbaoRlbJtvIjirve1wUjiGyR6VuxMScsOSvdp+0fZoGzc9pwH0y6A4hYJvz++kNn
         i/dxLy8qh/Lh9RqPiEGxReot8EjqlhK7Hr+y8eo6trPmlErcxuMBR1qGp2dUWTrX1NYm
         6jMpnAF3Y0O/Ac+jrd62W/ZynuQaydFPvIVlc7J+lZ1WuShjKi1OpdCTw8LoIBlammc4
         gZIO6XdReAuD7oSHnZG7IoEMbrJH1HbmfXCapyfOMqDxUFuQwm03cuSEY5+Fn2K+rmuK
         leN1CHSKEzs7efGakz972EONUasCaBcrIJFNzWSBHbYPw4da5xPm0IrL8d/dmw8Jk8aW
         VZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ElwHOsNcwB45oWoqXfNC0o2cm25sKcOriVju/dXKb44=;
        fh=L/Heqpw1Gwf9r6bNglivkljBltemTkKzTcQhZWEF2yA=;
        b=PyLFy3I4y+FL8AFr75U4vhYctheqeR2UOOoRy2x3TF21xfqaBHoNL1WuXAy9uPqyDH
         MyxCL0eSxnV8yE6HTfDtrQ6yaKbB+NADQnWOAXU2IDkSj3OUxNInAPviPnBCi9YTe0A+
         grAvJxajYlNX2QH2NUkv2APgTezF6nB0x/r1ku/KShKQgukKTguz47ci4lMnE8gVGPUe
         JecpsOaWv0+YOI7Z8ww3gdWqNgmSokLfvoJ+dz4P+993zaI8w4Iko8w5hb7UxX2/5Rik
         KSatSGGqpXK3X9IcwKaStiw5Cua1GLWUVVpu/3Vm6LKf3oFHNRkR0v0U3KvlA0hKsUnu
         BcTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790767388; x=1791372188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ElwHOsNcwB45oWoqXfNC0o2cm25sKcOriVju/dXKb44=;
        b=A3N9u3Nmpsqwki5My6pIKweIWQVdWd087ScRmPPLkuTE9iJ4hbE7O5b4zR9pPAilcy
         DMiUnU/lwAQgW4EU8ojnLkpmh49Cc+i/YGjPrT3LFIV5nf2ksVA9MrbLJjnKMeMwUprL
         82o98kTRrORTkXidTQjxFU8tCrd/ORBfxcWfddWEk50+PyJro1ABQyM5Zlvb07vX9Rme
         L+7KZWXesVLw5wxVn8w1rByG1Re1NDjy2ESYRuBwJzEzb+GW2Kq9OeoFrazgcy6p15xW
         Kj2QkTxYQPanwVrnVhiKfSoUdjTJ/bGlwlWJWw8XCWu0q+3LoB4l6KS4MpJX/XllJB/o
         u77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767388; x=1791372188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElwHOsNcwB45oWoqXfNC0o2cm25sKcOriVju/dXKb44=;
        b=cqun9u7JuS3UQJJcfhWDHDLL9AOgoesW/icJrk8HP9yxz2wQYUZ58APk+/MBm3gxgT
         AqwpfRuDcva62Wo7aTc7ewyM9zyKWBGofKVVx4LbGyNfOQ0s0iYamf0Tb0iPwjJ3c7kS
         DpZMyEnLX6cu8yk2qpCiF3Z3xFNASZThyNptH94E6uIP/2phRXtDvYAQVBqSjiKFQsUU
         a2R4QdnsBDxiW4F7aH/WbvF6e1HKqHb9yZqKaH2GeLU7ypatLPfjlnT1ynQM01q4HXK3
         wZEUMEnWa5BZBmpNzknMsSK4hN4jxdzk8qq9CrUpDfQIm/QZwUESsAv22T4XOpUD0CKV
         5UcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzq8OGJRvvCGuleZzyLx+JwvVUuWKQ/JBS0mYHRX7XqgRlhajEBDt6XkwP4X6JONgvt/O9uGOcmhnoOwmM=@vger.kernel.org
X-Gm-Message-State: AFuF++ks8uFc8PhNQUlC8bQ1GuxKiw5TmsmFCGtJKIxtb/u+wXgaXe9Q
	fhOdTyfqWa2e7hVOWKtQ2d6iIfuUxrZTGD7GXk7bdZKNY8eSIJ6hRXMN3jrqNDmDhi1a0UzofXg
	/a+oYEK8nQtt6mBLNry8Rw0kZdvfdbOae5Tj21Ydk
X-Gm-Gg: AYBFou14bqi0AdyLrqr4ljpwuyiqKqQWYV+nZAMbO8pOgXlO1DqHbpbiaUQ7G9jDCU4
	UImiIo/ZCQt49b1EPDyRUb/WujIfdiAll+YK9d5msB/6gPjlanxkori0QsqAfIp9lYG3z4M7z9P
	3c4aYtuXPMt7wtKqYi2khvS+dsBU1c4c7/lvE0cU4QMHvYzjdDe6YUJxWIQNLKz0/fL3LpEjLo4
	1jVlayUeBGrDBfg9ZLNa3NQC43iAJcdigIPhZeME2yHZj5CbXBgn2Uy1y6+5NK1FNZOTtSm7kcj
	2mWTeoAxm7lMarJrQE70Xf0Ysge/eCtQVqObR1NuSZk+LUn0ACWv+QSK065lKoHPk6H/9gyHfX/
	8W2vmtqiOYYa2zqTlFtCblwhDaea75/Jd2ElQipnPUE08HZswnyaEwbFXBv/aZ9ZTMweJ+w==
X-Received: by 2002:a05:622a:985:b0:533:2f98:5b88 with SMTP id
 d75a77b69052e-53374486cd4mr18747241cf.47.1790767387434; Wed, 30 Sep 2026
 04:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930100937.206377-1-jiayuan.chen@linux.dev> <20260930100937.206377-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260930100937.206377-2-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 30 Sep 2026 13:22:55 +0200
X-Gm-Features: AclHuK9iE5smdUIZek35Un6MFlxcK_vBsG0IniGW9BaVsFvbFSgOUVfq9WTNkRQ
Message-ID: <CANn89iLJ0Ao6csvTJgkJVWP9Xhgpa+j33-c-2smz4tcnBu+=dw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] tcp_bic: fix divide by zero on max_increment
 == 0
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, VEGA <vega@nebusec.ai>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stephen Hemminger <stephen@networkplumber.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:10=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
>
> max_increment is how many packets cwnd can grow per RTT, so 0 makes
> no sense, and bictcp_update() divides by it.
>
> Reject values below 1 when the parameter is written.
>
> Fixes: 83803034f423 ("[TCP]: Add TCP BIC congestion control module.")
> Reported-by: VEGA <vega@nebusec.ai>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
