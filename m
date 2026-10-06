Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C433E3D93
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275431; cv=none; b=VlnbbEagbZ29E5NKO73IeRcLLHmUyd6zCFgR6p4kBR+H8w0dhbtY1JxDElUC+cV/xvKn9E42NF0E+ZHFQwIKisM+5ECYx4saH5wCjNUyMgmrHzWsrcvv37uNHUtrlf0Ta4cvghnOPdtVRpbD6X81uHe64TFnY0wcrTzrILGvyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275431; c=relaxed/simple;
	bh=JQPBzATG3fzzmscul+UYubtsqU+E8z0c9Nf2+dvFf00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUloeRlJLq6VUhOa5lXIdu84v0inZFsBUAqq/Y40Gq8dgdHwVzexW44n5Co0SzGGjdTt8OdStrpEOJ3j5I/5BHsHwLGCMDLgOewSRTUhBkStfvjdbmkgT9uswbot2V/Q1mUEyA55aouhgoC6GN8dHUU7Z6Pt5y49OtXnC28yeno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCHK6K7A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCHK6K7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E072D1F000FF;
	Tue,  6 Oct 2026 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791275429;
	bh=jNgA5JhOEaHAkL+bGP7Vq2ER6ijMy+gCQNVTRCnwWo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bCHK6K7A+EDlUh1Xg58uoB238Wr867aZi/aX3lgiM7WpkaHA7hHC6Si3UPv/UM0Y4
	 4a5YN/FO4FZwjN1HQcAdbNSqEhehfwfo1d6AAHV6Q8XsOsCsdK4NOdhEy69/BiYwgt
	 t3sba3uPtRumybI9KrJKzeWp/nU1DJuKaU5nKBghJ/gazmuddmH5tk12g1lJ9MgHqq
	 CUy1ztDtXIBoI4wtJUPnzZKuC9DUe5h2HTp9/pm4omonZNia/xE/Yr7khs5W81RQqt
	 pWd1v11tpZcPisygMPpzo2cz3hr7vIdy/IljUesNKrN6lu/+N7HZf7um12OmvzMX3O
	 8z2YYCh5ZEi3A==
From: Kees Cook <kees@kernel.org>
To: Andy Lutomirski <luto@amacapital.net>,
	Cong Wang <xiyou.wangcong@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH 0/2] seccomp: support O_PATH descriptors in addfd
Date: Tue,  6 Oct 2026 01:30:26 -0700
Message-ID: <179127542653.155111.18027534171328911755.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924223018.564548-1-xiyou.wangcong@gmail.com>
References: <20260924223018.564548-1-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 24 Sep 2026 15:30:15 -0700, Cong Wang wrote:
> From: Cong Wang <cwang@multikernel.io>
> 
> The Sandlock project uses seccomp user notification to broker opens. To
> maintain user-space application compatibility, it needs to return a
> genuine O_PATH descriptor when an application requests one. Currently,
> SECCOMP_IOCTL_NOTIF_ADDFD rejects the supervisor's O_PATH descriptor
> with EBADF.
> 
> [...]

Applied to for-next/seccomp, thanks!

[1/2] seccomp: allow addfd to transfer O_PATH descriptors
      https://git.kernel.org/kees/c/151671cc5d50
[2/2] selftests/seccomp: test addfd with an O_PATH descriptor
      https://git.kernel.org/kees/c/cefd42a719d9

Take care,

-- 
Kees Cook

