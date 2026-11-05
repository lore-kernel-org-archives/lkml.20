Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893066;
	b=PFAFaUqCqa6Z6ZIVDolRxESHFiOR1lOcQ4YL3fYJYMtP8uMu/huO9YGXvxkfG7Gxnz9n
	 /N63nXDdnF/yQ5CldKQufLQYf8fXpljsll7YVuJxQLl0SMl9LrTeF1Ys4rZJxHFZMizvS
	 i1g6zciQ3k0y5JyBJP+l6Sli70oYrxjegjuq251OV9Rt8IyyglG8aQ5ly5yUeHDDBcuFa
	 XTsUeEieYL0ljFLTPchnR9gu3+g6l4ihwsNDgLIPfOWf2ItbWoQR/mJCOpmncZPwcSQYd
	 Ov4Gmk0FdWvb/xYETPB9Sbfe6YQFzIghgSBqK/S6u4+lJsLr8A/3aZopMEHTRy4p6GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fet26sVrxKqTmXFV5z0zr0pfRaJkw61an1sCfVShooQ=;
	b=oJyaviDFXKC1RI7qbDW5tgU9jqZg/u50pC8KJFJqiAJQRtdxS+g3RBDtDFDW+764VgWR
	 gZ+UwMYcBWloprzjQf3otwxdjyOPWnYmmam8tZS03JpeXfi31Lxo8iaQBtxh9bbovHWL2
	 EwfxZXabbb8tjgoD+wSOQKXLxPzH0MwYA86R1fwHZY7yfUhmjsIT0uS5Qh/s+uF906jni
	 7XoNNlw0Dj/qoOrr93OocuNhYmTav3HjfXoAuiKfa3sZ1kmXOCrgQdMBRnqAixoPkwAXh
	 D+gGEiTkqifUFpQhmD7VUKAl+RkX15437SIemwiiBriLJfzZfkP0g60gScvmYnDH8ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI7FeziX;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAE606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BAE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI7FeziX
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9024615e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793893064; x=1794497864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fet26sVrxKqTmXFV5z0zr0pfRaJkw61an1sCfVShooQ=;
        b=MI7FeziX2e+PiUMoRCZ1LaVg8Ln7yDJ5UrS1YIsru6G3Vz6euXAONYeEpVryTIQrcF
         hukPnwTDZoGv0MG2l34dSNeapvlrO+NSQXuQenpe4A2lbX6LBo0Dx7oENYMZuvTOXtBc
         h3dPRN3mL5q1gHJYHQOJzI9l6uvbhyqui/Fe47QvccQEvupfXKAVC4CG+xfKQj7lKYvQ
         14CK/TzKtYYhNWrAWI+EG2hRBoIMZpjcHXY4et7icjQJFvtcBOhcuFrO1VYzwR8uWvb9
         Gm0sLXjwCX7C9J4JTm4vTwqm36Ky5zg9AN+IxYdue4DbWTQHG1PlqB3zvoxH8mbF4q74
         iI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893064; x=1794497864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fet26sVrxKqTmXFV5z0zr0pfRaJkw61an1sCfVShooQ=;
        b=uHJzr2bF9Hi+CDw9JHzcZ5tmZ0pg6yP7kisb3pYDHW9uhKQ8uu5Mg/ixkuU0UiZAXU
         Isz+RlkewR9yuIjFUQZP6hgZPjQ7jPxWn5oGMRqHkTFIJmmrR+76YFDMYvkVj80O7Rd1
         vXcY4U9ropoESEscyzCge2sNLZeY99cHDGeTx+sF+PDBrS4SgDuUrnfscCoyMYMNaGrp
         AyDLooZoLzg7B//LfR+24uGrfmO5dJFL6EBct6eO4z5pn4RyJaqznrVg7dhuPVfDzNSo
         RdKyOPM7Z6E3eZRukyaA3pQNov+r1RKlHVK2OIAHy9tkg4DCmJ6MT27DA0aOhOgt5+YS
         7hVA==
X-Forwarded-Encrypted: i=1; AKwUvBzH476D5HXAwN2NnuAfIGV1gWfTKZC23Ewe2XQx3G7fv+MIyqNYQT2TlKtE7/QZDYKdU9fk3Ge4Gd7Kwg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8usAwPrN3bYbGSm9ZTJYJpwdtFEUgmJFfKOIXJZpMdFbnzZjM+
	csWor+9E0DHDfMhfDBn0PzQ7pilSBvbccutpy/3iqhsNm3huFAEiDODw
X-Gm-Gg: AYBFou3O/ST/vwYXE1zNxGnW9rWVJ+yajlTBzrglPW9rStpd+H91J9iFArELIItv8BG
	qfmQXX36l1uju5HueFeVOuNL/zkjHI7Vnh3W2wkOrEB/Url7bpqIOQQR7ybwR048E3bzPy6666F
	GXUil9NUSf/1YF5RKg1zsHknA/4POm3ova7riMZt7o5I5+KGqhGg0X6UCmb9Xr307KNpvd5PPs8
	eWwTEnfDK2fgpVFL1eAgzlPMkRII1gCaoF2uEN6hU5CNIzO3Iij8tX6GCVC7ZpVkhpMkKHlyFIf
	JdaQRM6eVvCIRR9LLh7b1c9Cb0i4LaQU7Ayh44QVSTxqXZo6/pXg1dheU6cIJwf8tvvFNwHl4JB
	CpI3Yy/wG752q3uHAwbMJa6u90mE6M76I3fDt0RtCRSKuUf+nkd3HF2eh9Lj6krlem7SZ6okxJ4
	zi68v8BRV4CfpUfSorJkgHe3bkLdDvBlhJ3bPrB91lx+j+Nc6M3xa3eZIKJmSDxOLNdrtL5xDYq
	1ERpnNJdTaOriwZdp5T524IaerUs9CJ4yIIJNjnmaXWE8PE06xha43btxsDjhAJnIzOYE68OxWa
	guXRSJejaQ0BFubMN/9DgK6F+gZyHwSfnWRwJKcNma1VjNsv1JoV/w74k+bT7Wwld/whoJgBhzc
	S6l7gfTSM10WShC5Y35cQG/51blq6Dw==
X-Received: by 2002:a05:600d:82e2:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4b55d7d7a2amr57882865e9.10.1793893063915;
        Thu, 05 Nov 2026 07:37:43 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm79741485e9.10.2026.11.05.07.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:37:43 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Tycho Andersen <tycho@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 1/4] seccomp: wake poll waiters after failed addfd send
Date: Thu,  5 Nov 2026 16:37:34 +0100
Message-ID: <20261105153735.5368-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <autZ5kL0S5MkX_8l@tycho.pizza>
References: <20261104103736.71956-1-parri.andrea@gmail.com> <20261104103736.71956-2-parri.andrea@gmail.com> <autZ5kL0S5MkX_8l@tycho.pizza>
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

On Wed, Nov 04, 2026 at 09:19:10AM -0700, Tycho Andersen wrote:
> Hm, don't we return success or failure from
> ioctl(SECCOMP_IOCTL_NOTIF_ADDFD) via kaddfd.ret in
> seccomp_notify_addfd()?
>
> I don't really understand why this is necessary unless you're ignoring
> the return value from that call.

Right, the issuing thread gets the error and can recover directly.  The
edge-triggered example demonstrates the missing wakeup, but does not
establish that a supervisor needs it to recover.

The wakeup matters for other waiters on the listener.  A thread or
process waiting for EPOLLOUT while another one issues the request can
see no EPOLLOUT while the request is pending, and nothing wakes it when
the failure moves the notification back to SENT.  seccomp_notify_recv()
wakes EPOLLOUT on its transition to SENT, so the two addfd paths are the
odd ones out.

I don't know of a supervisor that waits for EPOLLOUT from a thread other
than the one replying, so the motivation is to report EPOLLOUT
consistently when a notification becomes SENT again, not to fix a
reported hang.  I'll revise the changelogs to make that distinction
clear, and drop the stable tags from patches 1 and 2.

Thanks,
  Andrea
