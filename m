Received: from mail-dy2-f39.google.com (mail-dy2-f39.google.com [74.125.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF71FA859
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294954; cv=none; b=kEwsv6FCNkDCpL+vrDa0EHewQp+lSIWZyZD2lVGfysuOYYCTOKGO8+w4BssjuKOGWpaQG98Xr1bL7bg7gn49DcFEqCn1Rr6iTdJjJlgnFyorqcIjxqZA7AOK94ewGniOLRnpdh4JljRDZywPiNmAVgnzUyC6FYm25v5/mpLio6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294954; c=relaxed/simple;
	bh=FBdzq6aZL/72VKFVhcZnZAZC8/ESnFZSkAM++Qfd7xU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=cdvITqH1os6QH/Ud8aBHTC+VI8FH0yesgXIt2bZfFU6t+pxgo4Md/kJmpRSe3bUVwD+wiNflQlvN3rChHrJZuTQDfBarvMtN9A7zoiOxgRLHhRxBZrFUfXFyVvaQ7jEx9ca9T7okrDyNO64B0OjG+caX6xZ714BUNsrPRQ63880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=k8QhKR9y; arc=none smtp.client-ip=74.125.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="k8QhKR9y"
Received: by mail-dy2-f39.google.com with SMTP id 5a478bee46e88-341027843a5so171469eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790294951; x=1790899751; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x/1axvX4nN0CV5MjaicWKNBMunNziYiH3mIqVnl5Qs4=;
        b=k8QhKR9y5lnYM5CulctO4ALp7uoi+8GtU8fmKLoGSQwCI76549/XSEstsdos2zXhF5
         oAlp/HTgvggIAm5BFke9NNB4Oz0kY3QI+xgdImPkHk7H8O5SflbyOsL5hYBGcjw4s67w
         ul05upg6JnAmC3MtmiWDT719sopLVmxKQU01gsp73/dQVx+T2r11wZEGIEjA8ifhS3Qh
         nXjXA6Al1bl9w0RPw95t4b+0R8ExT1nai0v2LnRPZ9bBclQeC9AsTN9fb8NDGLu0PhK+
         lQlTJ64eB+YIIzW+SQGEIZW5vKb0S/EPraoZxsagHpS5yhnuqC0sHEfUsAluHM/Y521p
         i9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294951; x=1790899751;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/1axvX4nN0CV5MjaicWKNBMunNziYiH3mIqVnl5Qs4=;
        b=wEzac3QMPpMn4+XwolXnNUfUJKF59xyGHLyoWzsBVCMUxcQtHi7TyRidWCQpf9mEp6
         yWgSEjlHD6YmXlgtez4Vm9Nq/3zlF4V+7jzPwreodhpz7WjiyIMdeDYnh+O8hFjpYbwt
         wOLrNB/VgGjGhvXxAnEaNH4SPa9OICk0nGzEuyJeX4Ikz5UkWlNB5CwSWwG3WQH5K+Fl
         /cD97o7f3ldOxkuzuhfP5Xiuv5Pct9niPWj236mat3vHxZMuCoVJRH3LCB7lmDBbiZS9
         JTahES92xjVkiMI0NjebMbI6tmBGg6msNPIFbrN+8kGLJ5WP1sQzV3FfDEqufoD2FZVb
         Q8pw==
X-Forwarded-Encrypted: i=1; AKwUvBz6hbACy+1ZpS4wY9616LeaDLR3sgfPcVlHavGGPmQ5ri25AupbvJzAnsmJsa56LDfDQ1OoC3rB1aiFo+o=@vger.kernel.org
X-Gm-Message-State: AFuF++mzxOfCLonoTx6aEwAD5eii/2Yhlte2XoXrnQ1gYwYluAcsoyqt
	JtNdQUBtJmWbtCtYN1FPwA9piQ0pS91bvMs63d76PQ9v/sWWog0u7QgbrxpG2DB36xY=
X-Gm-Gg: AYBFou06zVxwXiV9OBk47u/ocfTwZ0+yZJBkaS88tcn1Py7YKSx698FmLEB5aQtTDuo
	a3CR4rklAAwYly1Gc38XbNhC9tqp6vFAqgjepjOqAUADtTEPmdbb/BLgDv3lIERqotNmWncjseL
	+5rlKpsV/bAUt15ek7+ILa9/jX8i8PKjyiRPzGMGtOkun6q/5uc55b7NlR49t7mJ+Rg/2vLKn6r
	z85JpS9V9Lk8V22tKrcBl/cZAaI155C1Gp83KU/k9I18V4OhipeCJXeV41Suu/nFlWZn4Iux3kq
	xm+EeWKGiKtpVDNOiT0b581HPW1qPYto6dh8zg+DnssUlYOOr5sqzvnRLz1qBLyNX/kCsq2RzEy
	tP4okkWgfY3GscMQhhPEpSY2JCukDe0qHQfK2ECqwEjLaz8OUY4capbxt9uR4gp2OeReT1zq6uW
	GIiPd/Gr8t26MBYRszONsnVabqXC+Uptp3TB0PQNlLfrLJwZIdR8OE6o7J1Vc9259i/4i+nWk=
X-Received: by 2002:a05:7300:8aa3:b0:340:f935:5fa with SMTP id 5a478bee46e88-340f9350b79mr1651254eec.40.1790294951369;
        Thu, 24 Sep 2026 17:09:11 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341463ec3ecsm1874059eec.31.2026.09.24.17.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 17:09:10 -0700
Message-Id: <DLNYLDZ4WO92.16A9I7PRTH3WL@nexthop.ai>
Subject: Re: [PATCH v6 1/3] i2c: xiic: preserve PEC byte length in SMBus
 block read setup
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Raviteja Narayanam"
 <raviteja.narayanam@xilinx.com>, "Wolfram Sang" <wsa@kernel.org>,
 "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>, "Shubhrajyoti Datta"
 <shubhrajyoti.datta@amd.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
 <20260923-i2c-xiic-v6-1-3a15b6397f5a@nexthop.ai>
 <arWC6PFh3YVgU1Pd@zenone.zhora.eu>
In-Reply-To: <arWC6PFh3YVgU1Pd@zenone.zhora.eu>

Hi Andi,

On Thu Sep 24, 2026 at 1:09 PM PDT, Andi Shyti wrote:
> what if rxmsg is 1? Before this could never happen because we
> were checking for rxmsg_len =3D=3D 0 or 1 and we were ending up here
> for values greater than 1.
>
> In patch 2 you fix things, but we don't want to have dependencies
> between patches.
>

Confirmed. The widened condition makes the else branch reachable with
rxmsg_len < 2, where rfd_set =3D rxmsg_len - 2 wraps the u8. Traced on
hardware against a zero-length block read, sweeping pec_len:

  pec_len:             0    1     2      3
  v6 patch 1 rfd_set:  0    0    254    254
  v7 patch 1 rfd_set:  0    0     0      1

It doesn't actually hang on my boards -- 254 lands in the 4-bit RFD
field as 14, and both slaves I have keep clocking past the end of the
block, so the FIFO still reaches 15. The programmed value is wrong
regardless.

Restoring the old "(rxmsg_len =3D=3D 1) || (rxmsg_len =3D=3D 0)" isn't righ=
t
either: pec_len isn't limited to 0 or 1, because i2c-dev sets msg->len
from caller-supplied buf[0]. At rxmsg_len =3D=3D 1, pec_len =3D=3D 2 the pa=
dded
branch would record smbus_actual_len =3D 4 while draining only 3.

So v7 moves the bounds into patch 1, where the arithmetic is introduced:

  - the guard becomes (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH), which
    is what keeps rfd_set inside the 4-bit field;
  - the else branch becomes rfd_set =3D rxmsg_len + pec_len - 2, identical
    to the old expression at pec_len =3D=3D 0 and unable to underflow, sinc=
e
    the padded branch already takes everything below MIN_LEN total.

Patch 2 is then just - 2 to - 1. Resulting tree is identical to v6.

I also finally exercised the atomic trim you asked for in v5, by routing
transfers through xiic_xfer_atomic: it fires, and block lengths 0 to 32
read back correctly on that path.

Two notes from the per-patch run. Unpatched, pmbus_core creates no mfr_*
files for these devices and every PEC block read returns -EIO; with the
series they read correctly. But patch 1 alone isn't observable
end-to-end (patch 3's -EIO masks it), and patch 2 changes nothing I can
measure on my two slaves -- its bug needs one that NACKs promptly rather
than streaming.

While I have your attention: the other xiic patch, "i2c: xiic: restore
non-managed runtime PM to fix clk WARN flood", is still unapplied. Andy
acked it on 10 Sep and the review comment it had is closed. It fixes a
regression from my own 50c63491ff26, which is in both v7.1 and v7.2, so
7.3-rcX would be a good target if it looks right to you.

  https://patch.msgid.link/20260821-i2c-xiic-restore-runtime-pm-teardown-v7=
-1-954e06765144@nexthop.ai

Unrelated, for later: smbus_block_read is only cleared in the BNB
handler, which the atomic path never reaches.

Abdurrahman

