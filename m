Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E3374E74
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846413; cv=none; b=hRp7QwFnq4VYi6dwzdFKMewPX4zU1NImHKXoOL4Cdwat8AMV24wOSQSR+DzyTHtKZb0zl6s2c4LpBAbDJSRTzVlA36WmSI8/dnsOF1JHSg82WY3qQZ6yYC5pIixPPFxJZNu9BsRP7djausUeGGzO4PBqOvo1FjgTAQ0l0oB1Ktg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846413; c=relaxed/simple;
	bh=EuhR7rnrXb0BdM/v3vGX5RjwAhgOZzPzZOkDquDHEHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/hOuWQpOU+stgknOu4D566BjQCbwEMgw9mw+H3/DVpNjEsTfPZOuAIT2EaUbac1bZGtl++P90dFJfCCxa7dFzI5SDW0zuuPNO62i8oGEnT1YT3UGtg2AztdaIkvxzvPXfQg41uci8Fygo01s219nzGols9hB/TopyqBTMsRgYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6hjR4/5; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6hjR4/5"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3479676a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846411; x=1789451211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+9kcEfU+zg9dMswCCCtsz8ghn2YtDfgBRBD9i8GdfQ=;
        b=T6hjR4/5O+GCrB/PY+p0heo7CJveR3odWnN0odsVmiJOwt9yt7zkEGThHBHp8wJtIO
         aFZNNPjuF2KEkLBXFDq3IrcH2I+ZnLCSAr6o1jzo2GAXJUJNMAmCKmPVYazKnSsY3sqY
         xCMwTLODKZRLxuPs9QG9cB56kANcraqXD53kq/FQycqo4DHDYvAouKpSV0fsilyX/OUW
         2MwBR/B/wHjDR9bvF0bNIxmkjkFqNvixl4IB1Vwzz1MHkfKCzypJLXIanjOIe3GyLxY/
         30OEyzMK1TUTHecc5ahwfAR6KNv58nSJ1h+4Vc6be2k0bm417NUuUhnvtXeuI628fykn
         1fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846411; x=1789451211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+9kcEfU+zg9dMswCCCtsz8ghn2YtDfgBRBD9i8GdfQ=;
        b=q019nghxKIaSOQ86ERrQGojWdZyR1r03EafgllBklSNe8jWJXd5HXteFNZItSHymOL
         ESmRVgzh3OoKvPYwOLDTN//Tvc3HjKK8X5c5Z5kPtRpBAcgL8JDRb6ch7HCXZ9SqM2Ds
         Zhgbcme8CAwyLcIDsXAaNCXeWOpmTXuPsx2Vp3v56Qw/Yy/05Ke5ALAMBHtHDpBHzxf/
         51aLmyBHys4gYWkm7LHlOmH4UzrHUWKo4SzN6fL3HLKNykKbnN3E63KuMfb+kIpn46Kb
         0CNrGBgVqRZWmqkMvB0bO/VEbkJXCNaSw6wEmQc7UNNwsfHHqRLPP9UNt9nsySCbm8Se
         cSqg==
X-Forwarded-Encrypted: i=1; AKwUvBzRfagAsFNGQYPrBEvekJCjBO09eYRCQqdUKY9iC35aVbsMqr9tLxjHvIuVPlnL2NgzyOkR6pUdTMrq+Rk=@vger.kernel.org
X-Gm-Message-State: AFuF++lJbOBWy24zzYqWVPV3tjCIn4WJvUcjThiEdaEP+j7VUZym9lnk
	O29mu7fL/CDvkhjjB5JiNrGxXaUTZxEQBJW5M8ZKVUK4EkdBnGcuiebB
X-Gm-Gg: AYBFou0OZAWzE+GNegfZJvHD/qb9GcgbLJ7aFwWdkh+n2FULQgL6lxWWStt5sZCZQqK
	pv2KIrdztq6T0ai1ra/W8qbCO7eb/3tCMCRbEa5XdRdj5NDwrkL+wH2bcJ9jeSmT3m+r4x3YR0A
	+E9uP6wHlHPID9ESwGyfnlt5EK7ThxdTbGVUqY3TiDCnz2JM6aTLSAxmftezFyLQaUi36pIctyM
	8nUgTdCupXCmGf5FVkknvYKyZU0moWXFm53sDVhD8r2/XvdZP9SKHKGa1cbfwmPs8hgjuW3ElNd
	AerUhyZnE/S57ZxdTTxz9WnFBk0pOG29/QuUUJ6q6yCe9zEW7ats34lOJ87mzi8qYRmKetb8s9P
	CjnI/TRZdgXjdL24CqOT+mC4OasYwPdx0A5cpoH5KGxQsHQfQO9r5lBQvucwOgDWGBxxRTk4ge8
	i7tEIg1we8kysEPTgvwbifbJ3E0iea7FUhYSfMmpUQvWDxB1hdJ4TuWcIYkSfPQEEXT+QWlPHgo
	E+5i3+4sf1MywpeLqm3RHoT
X-Received: by 2002:a05:6a21:2d05:b0:3cc:f9a0:3ada with SMTP id adf61e73a8af0-3da215a6cc6mr32295410637.16.1788846411208;
        Mon, 07 Sep 2026 22:46:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm2053384c88.7.2026.09.07.22.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:46:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH iwl-next v2 0/4] intel: fix typos in comments
Date: Tue,  8 Sep 2026 11:16:43 +0530
Message-ID: <20260908054643.11460-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <45869dba-955b-425c-88b5-a9793ab2717a@infradead.org>
References: <45869dba-955b-425c-88b5-a9793ab2717a@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 10:27:00AM -0700, Randy Dunlap wrote:
> How did you choose iwl-next as the target tree?
>
> The closest match to that in the MAINTAINERS file is this:
> INTEL WIRELESS WIFI LINK (iwlwifi)
[...]
> but the patches don't touch any of the Intel wifi drivers.
>
> I expect that you want net-next there, but I could just be confuzed.

Sorry, the prefix is a confusing one.  Here "iwl" is Intel Wired LAN, not
iwlwifi.  It is the prefix the Intel ethernet maintainers use for their
next-queue tree, the one in MAINTAINERS under INTEL ETHERNET DRIVERS:

  L: intel-wired-lan@lists.osuosl.org (moderated for non-subscribers)
  T: git git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git

Intel's own developers tag patches for that tree the same way; recent
examples on the list are the ice, idpf, ixd and libie series, all
[PATCH iwl-next].  Since these four patches only touch
drivers/net/ethernet/intel/ and its documentation, they go through that
tree rather than straight to net-next.

So I think iwl-next is right here, but Tony and Przemek should correct me
if they would rather have them another way.

Thanks for looking.

Hemanth
