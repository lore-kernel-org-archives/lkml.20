Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285345;
	b=UF5Jx3GT1BZNanaCOIuCssD8NStMZUOgz2L1Rqawztfn5n2m4PDeB/1J1/nudSKOf0/q
	 kv2Rt3rcELuUP85XuQhec1NOzl2KqQp2wUctSNrN9GBWDHxxuDz1TVj5szVd5Qb9BnstR
	 daQPaX0Jg72HTpVk7jHkR+8xXffmaBDODWbPF/34P/3A2Borjsmcp+ENmRxdxiUHsSe+r
	 SL1DXtXpFej6GoeUvBI0j4F1uZ9tAc267TSYME56Vff7b+ghGkzissBlNDhpYSrd6Bt7m
	 FCId9mYGwxGb46CW8dI7BcpI6dOFfqFInu9PS8fvt2+V4wUb8WnE3zWX25rpl2iPolA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=11yI6X7RNJHkj59+rMm7KEGQ4tLy1r9EmEZe830OAuk=;
	b=vHhhgeU2cjYBPbsOGNeOTK5d/OVbR7rq+EcQsKWwa+tRPjiQ9dEeuiJz5KddqiHWo/1K
	 iusVxsAA65lvSXCF78SyE4RjV++IS/onRdNSa7ZA4VIfAq4Lhmbc8RfOxsW1EypaFlMId
	 lwPbzH97SA80OKL8WAsrYBZZx4P8D7YxrrisQUQJx5YCXOwjv/NQAnOlN3FdpopmAuIKA
	 VPPUQuw4wjcWz4/9Qcu6Vf561cYmfFiJyOmiC4x6fPf6DaDtIw/9xWYZVESjnS9wtNGf9
	 Dxt38KmAr+xB8E+LmH1qKPul0zvQGwVCkl9YJSajLjaVEvZYcrnnQvvGjP0U3xIumtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TeGZj1R;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA3B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA3B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TeGZj1R
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so24624165e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285343; x=1793890143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11yI6X7RNJHkj59+rMm7KEGQ4tLy1r9EmEZe830OAuk=;
        b=0TeGZj1RI2pN5ABAf4mEdDDeNwNE7CrId/GUs9l/thGCPn1vFl28WjdxxCcyeimOI6
         8+z3KRqsr8f7VU+qYRmOMTypLTMPdAoJwdVWhgUM1KiotqdCnmTeglgTYWBYoYd9DvKl
         191H31PcMqXhntcOO2497/3eGiPerhVU/liztQ0LUbify1L9H98xjU2vdE3m1rgenuT/
         nzSNN3RtRc2vTN4MkoXvjxsUo625Di8BQN0z71E/Zzma9SMsyHdx9MLRKpdiXttoVtru
         y5Xqf7y/mDIkJYVMmMQgy6OCMyh9I6dwFkdR4aR6t2g6e/xCHDBBdkbPThZ1IYAUWebg
         Nt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285343; x=1793890143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=11yI6X7RNJHkj59+rMm7KEGQ4tLy1r9EmEZe830OAuk=;
        b=KLsL+VVXJ9KB78ontIKemkPn391qOtsZm0dSJwBTsWDFHoNih4f4ZmlJ0PoA4nUOL2
         ujH8nElTkXMPKBN2hxQw0OpGcihZYRmLlKhe9l2IHGV1kQ0nQLzgaT1UqkG5zqZWLwm+
         RdhTguJsP//NfOy5cywIVmu/du94zL6H91IJMwA/9Y7RYCUVg8n9mEZE1AmF7JrZoWPz
         ZYdBwwhnmGI6dny9svDVSOkSx4rFzJKM3KqvHBHH5yu9kcsfC3EY8f3W7GyBKlxwd8rB
         uFoK818x+XF1vXzvJXnSzmCcVghdDwPRNQl7sQlQhuarZCFk95gMTAPlIqM4iEIqGtgo
         ooUA==
X-Forwarded-Encrypted: i=1; AKwUvBzy0UjRqdre6D8+hBMfVI8aANSehKHetkxRbboJdOnxLpkDqFIz8w8tgPIyW/pyGxQvuT71uWsMtgb9Vs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsrDjRGzoqfXvkLUWreIBKbnt3LJ/Yl7D9XSi5kEaLbxX4awe3
	oiXEbuVsE4MwU7sRGPjJ3g3zzTKd43T4rUXI3igdractZlpNTRmKv8qF
X-Gm-Gg: AYBFou2kxpzmGpTaiaUhg6+kKw6aRzDNjNpxa1zXMLOtpsWkZlaLWSW7ycntrQwluAF
	0h9bqRA21QxaUN7rX0XexHNDstjNSymUStMxlQzfO7xW+LyaSH67yaOTL8ZrhnriFJjK30tqBcy
	3dr5tj7T9P67qNDalngJQFBtY4ZaZKA7JPXGnxxLfgMzV8hJBsMW5Ds74Ips4+FH7FK84Jn0Ju8
	N/D+X/pm16SX+85XH4Tzjui4ujPnPvNWXGuXuCUsv4CfkCuv0uSDB8u8yOOiUJvEvGKGVjO6037
	RoJtCWnuHgIXaItbnHbAuobeu0o6ApTEgUixTsbniB/anoCOHzwYlD+phgltZTl4PdURwfVkx+s
	D6Q7e5wIb976//gi7xXz/Tx9Fkvs9Zq4NBww6nWSIkFjaPWnjTyQanHERggLOoXbozSid12fPI8
	90JrN0wPL2CCJQQysGlD7zmz/7q+NyFKrOmG3+s275VxHh94mHIyj3+p2N3D/a2Fhqrz+OS7Nyw
	WMQGxoY9FfmH+V/oxhciZkeJWX1ulCsr6eoA96o2urnj1g5uBhfpfSVF60IlHOAGBzgdRxLlURf
	5gkQQjRTO/qdLaaj1PdntZSZCcTLciqOTDqUk/uehliOKR7nYV2jJjES8AzWvV0U+EE7Nimk4JC
	hgSEX
X-Received: by 2002:a05:600c:1d1a:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4a966c4111amr126768575e9.17.1793285343088;
        Thu, 29 Oct 2026 07:49:03 -0700 (PDT)
Received: from andreayoga.localdomain ([151.57.246.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm66634665e9.2.2026.10.29.07.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:49:02 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -rcu/dev 0/4] hazptrtorture: Fix shutdown hang and catch slot owner race
Date: Thu, 29 Oct 2026 15:48:53 +0100
Message-ID: <20261029144855.213308-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAN_Opa8OyyuveYo7VyfQb4rDtUmw_m-25OSXSqwpzfOnGqwEpQ@mail.gmail.com>
References: <20261027163811.2470569-1-parri.andrea@gmail.com> <CAN_Opa8OyyuveYo7VyfQb4rDtUmw_m-25OSXSqwpzfOnGqwEpQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 29, 2026 at 05:58:27PM +0800, KunWu Chan wrote:
> I ran into both issues independently while developing new shared-scan
> hazptr series and its torture-test scenarios.

Thank you for testing these, and for the arm64 data points!

[...]

> Paul's concern about `torture_must_stop()` is valid: `fullstop` can make the
> drainer exit before the readers have stopped, so its exit-time flush is not
> necessarily final. The reader-exit approach looks worth testing against both
> the forced-slowpath case and the PREEMPT scenario Andrea reported.

do_pending does leave its loop then, but v1's for_each_possible_cpu()
pass comes after torture_kthread_stopping(), which returns only once
hazptr_torture_cleanup() stops do_pending, after the readers.  Either
way, I have been testing Paul's suggestion of a pass after each
reader's loop, without v1's pass in do_pending.

[...]

> These tests independently reproduced both issues in my setup. I'll check the
> final cleanup approach against the forced-slowpath scenario as the
> series settles.

That would be very helpful, thank you.

Thanks,
  Andrea
