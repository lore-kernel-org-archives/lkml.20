Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792856347;
	b=Qf8f+2YfTNyLl0GuStu+w8MERkdGsF2yLZUxxtjjN6cE2zc7Wqyy11lJ343d29lgLy39
	 lHP38L9KERrZLvL5zpxH9jDVrpf+ugEp4yFwUG5H6XldLcPAhyWrGWyCI2C2THYFf36QL
	 wGhKPiZfbSTVJ3hdJ4DFBNkhp5d7ySUYgfGGw1ZvhSOJIUHN3LDHqNbg9Y50FYp9luaL0
	 LXnEbdJXfLHLH/ko2M1l7aX7TEQfCMe+ngI45v2E5D7gEyye/j95w/DTdz1bACgfFhMjl
	 rXro2YIwJuKCE8PNvwG32nyf2x6lmJBsZBM0Ux1BTn4YEpJIPAf3a2qp6DoRd/4HL7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vK5pr9uyYz2jsZwQQgWCPkEz3CYe2XwtN4i5/OMooOs=;
	b=uzMruoS3q78DUfv+WKPE/c82FvNyXFPqdfFaQ+twa+i5k/o0UknUjVo1h4wziZkENCig
	 xcGtG7Ax79P4CpOSHdWazovESvqqIKdJAybxXYnagaNLkB3xsm+uAt4yPjrxVf+X+dpn9
	 EtX5/W/BOGGqViIS9+MYYODrxGDqOAHy0nuqBwxNyOeORu5cK9zzuxERWuQCEToqjssyA
	 MLoPzc4jEZlv7E1d7D5rtFHMFNMdSyh+JQHwcftGz4xuhbwp+GTeCpBiGuQZFNxw+//P5
	 iQpekp+g/g5FXytvTao7/SbZAuNkiW0kBIAR4esavyJ3mkeB/prCgPpBI7tjoQDtpPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DhHBvhwd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4C606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD4C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DhHBvhwd
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-679a2b5fe87so1625198d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792856346; cv=none;
        d=google.com; s=arc-20260327;
        b=lCWjhZ+jkqrQcQ6wHRzvmbGW5wluPNYH7KGq+mVGJMUMmrUSb/pgmO5UVuUnCOB0RC
         7VoSFp7O+VI1KteDZMOPt7zenxbCiCoauNiPZIaKdFIOu5dU6DnpnbTT1cegkcWMbZWw
         2T6i/xBF8H/wkisW3w1QlSt48uYclXlOFCvahE4CrJPQUN2Irk4jZA6q1vegbpTC6uc9
         GtnWb2RpFF1ab6AVVcQHtN8G2gZlMcQOHdwhjpNY4IjHEQ0AzTZtJTiKSFSz0MbsKBsU
         Zo/A4HQiqg/pXGcy/JfBcDN/92mrvAmXUaY5Uen6HnWO5Hmfn+NKMCE06sSvE+5UNrbh
         YdPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vK5pr9uyYz2jsZwQQgWCPkEz3CYe2XwtN4i5/OMooOs=;
        fh=ysX/Qz+6cUhj61Nmf0TU2yiovgd7NyEGyyO5eOKDVNI=;
        b=dST5nq6oGZ2pkNUlQsrakS/W6a6v7CFaW54D+KKLsaKD7MYMz++YJ0q6kGvwvJDzOa
         VfiVP5UcTevPkIDLX53kR3XDnjDCfyBbQn08/5ZKuJ/cLk/IqDqBIduU6GtqGG9iYs6B
         vh4L6IM/9nZHZncmjTyaAjlNKdaxog+/nJrC6853B0E15kaf39dFQcXwFd/rnpTe5Kb7
         4jMtWP+uixgoYWqWYJ2xq1mPDNYD8GQskR4ggDqoaYDTQx8fmS+NQSTy+XBr7ns11hC1
         CpcbokpDzZtxgdEflcCOo7eSf7kHnpsdHTSas9llqlIJ70wPpFqemJIgHMsKTJ93ma6h
         S9Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856346; x=1793461146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vK5pr9uyYz2jsZwQQgWCPkEz3CYe2XwtN4i5/OMooOs=;
        b=DhHBvhwd2VBdGFg7LEvt+Ab8YuLjqGuhb7V7AnAadBRBVpAzqKcq8TvHE9lLXlK/Hr
         ruKtZgu+23KmXQy66OvqY3JniW3MgfiDipyOHprnHTb2sb0oZ1Yxh29zAstQ0okE1u3F
         VNhPOCcqtDcJulV4uniSIb/ZbXJyXXqfyoYD3UjK4+H6G39mB0kelM9R+fB8zlcU1ltO
         Ub7jg4v+GfkuqBFs2dlguA4H6hXAx3jJ0/WzmNcR7waAgZoJ8zlBuBO7asw6tKYhVMNu
         flKBLWItJJ1pwgoPD9GTKA7YzaND/uE7FToLxrdds4/44wGMgtPXB4uGG9NBssqSt3+T
         SF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856346; x=1793461146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK5pr9uyYz2jsZwQQgWCPkEz3CYe2XwtN4i5/OMooOs=;
        b=vnV6vGUAmMOODNDir2DVWFYogw4v+zvYVEjzSULfXh2HRiDB8iXMNmur4H7Nr0uLJc
         AE3SnaElmrPDpsOAWPlfZb76FC8RSklckrItE1MbFtqpwCsCPyGt1ZtvJ7rOvV3zTqCg
         cgENTVpDbATEZfhg0Yg5D+/eJaOrUHOxRrpljuIvf1195nEutZarQfKE8N0B7OCf2rmg
         2P70Iyk/htDjwHoDZ+eXPzXz9PlATjtDcfsXCBnyMFhgRgwVffWaXsqWzMAkzm4zdv+f
         er/ukGtpxpZn2iy0WQQYNRn/veK07kuQACSp9b3/Jmw82UfA4jmRdzIb927lVhRW5QMy
         anKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwykO2FMpK4wMa2JNrS6wyyTPOo9eBEg3nKln+dF7HfGwgvRAnFNF7dn1+K5UQRuJHEZ1D6bD40dxxKGRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5/kblmhQgVKr8qSNeLn36T5n+bzcuhnWl07HiPNN0XYaLqOiW
	l8kAxZdF4iCRaRefUztJF6PZ0DpP2Pn6z0PeLjhR+nVEaSZzjqX39izOoqeUvvSqTCWSYQBJ0ut
	798gMuyiJa+QkKmGypIE+i8mfe3ZtAhg=
X-Gm-Gg: AYBFou1Xgg9Ga43IfhbT7i+eO7saRsqi1GRStntI7haSX/vmM7GPK2EK4H2vF4ZCd/F
	Tzc68wGKbjywx6CHqQZKZ/gFLM0pjkE2j3CSoE76ogxbqMOdA//2x3bL1nmJcQWJXWuGo9ONhIs
	8Qj/yKl5HWg58S49bPNCnDm8JZW6zyMs6tJllsXVtqPuAD3vNmP0LQEB2rzNXKp+NwaPPfqGVWW
	h76ARCQ472XS8dd9oj588C7VyKPmJue+fsW/zFtWYNCHbNVAICEo9upMOCiFjn4cA0REbGlJYuU
	d3+xVzuyT4Xz5vr3++woEyuRzOiMek0zMlUFna/3PRjI0qFEDhcRUC7CezliODXcT0T6W60mglR
	Pq+pXbBAkZQ3ajCflDDP/kZy9BQ5GKqM43e0k670=
X-Received: by 2002:a05:690e:4193:b0:67a:3417:1747 with SMTP id
 956f58d0204a3-67a454179demr1093499d50.106.1792856345704; Sat, 24 Oct 2026
 08:39:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0012-v9-eeb9084fb29577971229@gmail.com>
 <31b48648-c157-49f1-94d5-d1b927bae1c9@linux.alibaba.com>
In-Reply-To: <31b48648-c157-49f1-94d5-d1b927bae1c9@linux.alibaba.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 24 Oct 2026 23:38:54 +0800
X-Gm-Features: AclHuK-pel6d6vEds-ViiTQ9UC2ScVH00hRCkn1-aVXEOr3Df3HDB0eQcYBlZ5E
Message-ID: <CAFRLqsWiioFrCmXjzmrFaRBNH8b_JryTgwdPrLie4AF1GbKsKw@mail.gmail.com>
Subject: Re: [PATCH v4] ocfs2: cache the mount context for dentry lock callbacks
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

Joseph Qi <joseph.qi@linux.alibaba.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8823=
=E6=97=A5=E5=91=A8=E4=BA=94 15:09=E5=86=99=E9=81=93=EF=BC=9A
>
> Don't see any difference between your v2 sent before.
> BTW, it seems v3 is also missing.
>
> Thanks,
> Joseph
>

Sorry for the confusion. I rechecked the early inode accesses you
pointed out in your v2 review:
https://lore.kernel.org/ocfs2-devel/018d8feb-2e63-4a73-ba36-10a5f94f3341@li=
nux.alibaba.com/

My understanding is that these accesses have the following lifetime
protection:

- ocfs2_dentry_iput() keeps the VFS inode reference until after
  ocfs2_dentry_lock_put() returns. Lock teardown waits for QUEUED to
  clear if the worker is already running. The rename path likewise
  keeps the source dentry/inode alive while dropping the old dentry
  lock.
- A final put from ocfs2_dentry_post_unlock() runs synchronously on
  the same downconvert thread as the worker. Recursive processing
  from ocfs2_mark_lockres_freeing() sets FREEING before entering
  ocfs2_process_blocked_lock(), so the worker is skipped.

Thus the early access does not rely on the later extra-reference
check. A zero dl_count can still coexist with a live VFS inode
reference, and MAYBE_ORPHANED still needs to be set on that path for
local orphan cleanup.

The asynchronous DLM callbacks can overlap the final post-unlock
iput(), which is the separate lifetime window addressed by caching
osb.

I incorrectly moved the orphan marking past the extra-reference
check in v3. I reverted that change in v4, whose code is identical
to v2.

Does this analysis miss any path that could drop the last inode
reference while the worker can still access it?

Best regards,
Cen Zhang
