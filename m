Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD2A4D9F97
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396458; cv=pass; b=l9GyKT1pQK3Ck5XYdFlh8WGtg1dgKSrVWJ/cYmV6qteOFeWHMzID6Zpa5Jrjqy8lEP0JfLQPd5IbEuXZZNj2AF45/g0AEfvEDFN9GcIR9F7oGDpUCkse3JfjOGx4knpDRfi2Xe5G9U3g/zpjHlNQU6xq88pM6geEIOTPitjG9uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396458; c=relaxed/simple;
	bh=L7Qw7BUJ1VimfFbY8Sn93Ko7KHTCveBYAFOoFIF3XJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpSML7viu9zHKCalIbU/hhWd7ExSsskBnMA7ICaJtCOKYimKcBWYUj2mmZWGbS7jcT7U9ykH3stJiWLcPOjhohHcTmL7X7fP9ZAr0v/8CDtz8FbHh3uSDYSPgXSP/dGpf3G7tK2xhJK/mJ5J85nq2wsFzm0piJdkeANOzy3zycw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z81olt6W; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z81olt6W"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-487048857f6so1794089f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791396455; cv=none;
        d=google.com; s=arc-20260327;
        b=OfyP8qlA5b2MmYQgfQ9azi5CPXdyHavtUBm8+xNMqJxVv8y+odcgNi/lr74duv6E9E
         OA99Rha2pXmiLamThYEGnRmgU3KEjw5KlIsWZc0Te0mKEwm25Rqf8Eg0+Mqv2UwfYZEj
         H4pHa+tPjGirXyrcDQN3eQUqV8rKrPVGVRt0XNEhGBGYfosymKt1Qt8e5p8CBIAtjS1Y
         L7b4+kcLijVCb+w/veK4X7Is8+ckJ0bCeqA7lJ9Pyna+9Xnc6FhG4Vx8Ytt1bLA44NDX
         ZL4HqpywndxTydqE0iZWh17Lv4gyvjjdoNK6O131hgOiicRTbh7wvj7H8f0Ufvq5kvaF
         Jx/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L7Qw7BUJ1VimfFbY8Sn93Ko7KHTCveBYAFOoFIF3XJc=;
        fh=qdjUPqhQ1/+b0ZTv8VFwWq+Qlg76C2OhHlrb90J3l+0=;
        b=sc28US50avL4TAFKoqb7fzY15DhbvYh5JBtcxFe3PIsYNYPy/ZHV6hlH0AK93P+yFz
         CFLAg622V99yNkMJMWyVNhS/RC3Yvrzs3EHyfLDzYlVAEpyI6ngAG8pp3rMmqyoeRj5W
         22x1Zpud/g7F5YE88CDrJ0E8kRxotuA0uzhhqa99sDTgTN+GEvyaCIz6ZmMDgwq3GuPx
         KdEUvlMNyTc2kghQMhULmlTANY2u+kCHl7xmtXJAIQ9oJLpmTt9rALUti02ylVRhxmyc
         k7wNl6vXBoWb1wpl1za3nMoy/mTEZecqHBvuaoq4ZIrt9/M3jB9hzy0OUtli9gFyADCq
         ULgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791396455; x=1792001255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L7Qw7BUJ1VimfFbY8Sn93Ko7KHTCveBYAFOoFIF3XJc=;
        b=Z81olt6WwsaUy4Pj7lM0m9mtwN9m1K10WWJh2uSDI7d3M/a15jhGzsoAfBfXWNkrV+
         YxcQlSFYA3BBKy7b0PLPuiNFiHaOg85XIRRMdgROnNSty/0rQr/8B0OYpd3jtHSMKrbk
         oXSdIor6kGoBGm525WPNfhve633f8CaqwhbndXzIYkvEvTDREnHPJvAjOC+Jh1mEZ5mo
         WNJ8JKWAAqJnIfpOR7/hETxUU83sPSfsHt70kq6AF+XfoW1oHQMovH6zU1FhadJ6zF7Y
         PL5y+5XC6F1pF1SMsz8RrD41csn+Dg3B+fYbzq7qdCYaaCs4j6/mXi0TGC3NDhKXYibX
         gMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396455; x=1792001255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7Qw7BUJ1VimfFbY8Sn93Ko7KHTCveBYAFOoFIF3XJc=;
        b=zQRxxpchq/awPhi3xCzo5qrFblqiX3jsryVhnlsog6ZzLUqlE5wfuCyVSklTxlZBWO
         a4POE/SViG06pT4rfqQVaXVLJdmUDqvEpC0DtaSpwer/2Cg3Pyl0G15mkD5ntLfAb75Y
         0rXDhOZ5goyGK2lXgFqdLl7en5MoUE4UmQanpmBC2Dmxs/4eyxjCt42B2+aI8UcgWi0Z
         xXjKLQT8s8r7egaI1fEaklYcLElARrb4cJqE9nkW/VSDB9BHJAzs4BXKF6rmR9WD3IP0
         I2P8112T3irHaG6LZOlHAfOH3q7Nz1rpXXYmTmD8xJ5cJqNU2VRsf+aiW79n2xDtB+jc
         yXFg==
X-Forwarded-Encrypted: i=1; AKwUvBx5LphBEt20O4buctdwZPuPs4HC/JCOIgsqKIGDwfnbHn9UGjop1MWQafTCLXXRqmzo8rgHwhaJKYNsQnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9H+9b37VxDFikAdcwoIqr9kwJ6N+UOnM2Bpmuqm07THBYEYKC
	BeB5MANSOWaP8QEFOOe62wei3Yq6OuI53CQ44BOiZ/lWEx+PAXxyNzd3340fy+B0T4fXGnLvX+Z
	zicTfJZrcTWRAAP1AHTwC15dY/l9jymJanVbYjeQ=
X-Gm-Gg: AYBFou3hG0bbZadXTrOJc+8jTpZx4WOZHP6hXsBkyAP2NYNs09p1jQ+53In2q4Zc6x3
	6/cqPeE+mH5MfYn5rw7e76WyCEzPeoQLHGNEbN1aOjDfG4Gtty7xhNCZPSPvgCHiXf+vOEEGYdf
	ipC2uIjYytkLx7MJX7pTWFGNoD6Yu9eP+6PkO6lvofJoJyG9R9lAzhaj/F8518t2cIADAAkP3h+
	GIP7fnD3QWckYnhd4FAUaObRsNafT4QH8AnBAXpidNxrXKDv6Qe86tjy4GCPfVr451Zsi3MAvnR
	Ag/MaHErGxbutJYi2gk5wwrmumHlblS6NEaVzXqUuhxDFdb1+TkrEWN9MDkz/QjgIVIe507wMhw
	iq7j41WqHLB1pevfzfzr2P+l/pbH1aYc6/+ZLjWS4GroEVWVDkan0EA==
X-Received: by 2002:a05:6000:4552:b0:48b:68:592e with SMTP id
 ffacd0b85a97d-48c726ed2femr4094458f8f.4.1791396454825; Wed, 07 Oct 2026
 11:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007111611.2086-1-syauqicode@gmail.com>
In-Reply-To: <20261007111611.2086-1-syauqicode@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 7 Oct 2026 20:07:23 +0200
X-Gm-Features: AclHuK83fJ3voPI9vV8BU4O6NHyfYbWWNtcgnngue0EPEkR2NkI5EqrFbTxaoe0
Message-ID: <CANDhNCq4G5VwNDBj5ZbZpWCQwmmgUTgBrMYdHPbK=s3NqKNLnA@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: skip raw_skew when adjtimex fails
To: Daniel Syauqi <syauqicode@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Shuah Khan <shuah@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 1:16=E2=80=AFPM Daniel Syauqi <syauqicode@gmail.com>=
 wrote:
>
> raw_skew reads frequency and offset data from adjtimex() without checking
> whether either query succeeded. If a sandbox blocks the syscall, the
> test can use uninitialized data and wait two minutes before producing a
> misleading result.
>
> Skip on either failure and report the syscall error. Preserve errno
> across the newline printed after the second query.
>
> Fixes: 51f91cbdf545 ("selftests/timers: Add clock skew estimation test fr=
om timetest suite")
> Assisted-by: LLM Codex
> Signed-off-by: Daniel Syauqi <syauqicode@gmail.com>

Looks reasonable to me.
Acked-by: John Stultz <jstultz@google.com>
