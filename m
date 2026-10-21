Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590406;
	b=e13nh+dGGhdmteNHg5xFr3XCyesqokw/+ylmszJO4e+i+vzjcttPLbQ34TZZNYmcQdXA
	 6izUn1iR5ZDnen3Y+4wjnHHSkmbyrcrtK3gsPe0Xa8xZPa/IR1AKKQSOQlNHV9fMSyO2k
	 I+fNsm7ckTBVAFEMpkhCiTcZN2ctTWzlAHHm6qExiRErFAhdNsKgrPtN+4bOEChtuYrFZ
	 oa93LHBAh8VrRZ/dBfWcklO0y8TA1BC996nBJvaW6CjFQoa2mGIAhpTRzbNy78XnrnM58
	 78BJYYsoO5seXx9qE0h0eDvJ/KQbf55+ymTpgHTHXQCuLh0pMSXwg3XQyaOgBZjLeag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590406;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=I6/6Uh41IoFFgszk2IKERpMB2eQaR/juRRrRaVzRT8U=;
	b=bgHDhwqIdAxFEiaPtvCzsGjYqKVq6GoHp4HdZuYNp36o9Q8Qrb0YmYISaRto6qQZ9+4b
	 omplV14t8zUox0ly8TCgNHzK1p76RysoeMWpqKc3sd2i3xk0YiyQHZrAwwgNNviLhuumb
	 G2DAnGs38x5wofR0czON34ZNk6BI4xzPAsOpqXzAcWABW4N75esrpzfgXmzjVFBPh17Ew
	 EkJfLINAf7OKzU3AFh98055fEtWf5BeB2372ysKlX8nQzyLtParKptvPwFtFwSSKhOUy/
	 RkiHBZBsxRW9efjPQxJ5fO2JBbry/1a0EFI1g2tg42iivCj8mq2xC6kzrUtcZZz4xwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F/AOx3/J";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55A3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F/AOx3/J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2D71F000C4;
	Wed, 21 Oct 2026 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590405;
	bh=I6/6Uh41IoFFgszk2IKERpMB2eQaR/juRRrRaVzRT8U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=F/AOx3/Jog33ScxCxlq+5+4HxMoV4Z08KC2K1rBxWvZe+v2xOVWr/8TPVo3MTWTVO
	 4KUuChie2CH+0+tUU5SRJKYv07zGoNvVMc8RMzkuTQGR6x+XwLGI7HB2UX0eRTwFQi
	 xAv/CKZKENTse/QbXZeP2dsjh0HBp3qwApo5bJ5ccD0YwxdIf2AR0jW/m2igSKIXA9
	 NLrNTCnd5oAdOwMp1PZtToZcSLH7RaQOz31f+tsNqKsW+oa9v88IvR1vP8NXbWibJ2
	 pcjvYcKLVdGbjItpFZTse03buxHlBlExzHwrNMzTtWioK1jxySn43Mx/su3V59illP
	 3vxDVcQpBb5+A==
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>, Avi Weiss <thnkslprpt@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Eric W . Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261020181101.1605736-1-thnkslprpt@gmail.com>
References: <20261020181101.1605736-1-thnkslprpt@gmail.com>
Subject: Re: [PATCH] signal: skip blocked signals in
 dequeue_synchronous_signal()
Message-Id: <20261021-montag-zugnummer-hellt-6b4a39703efe@brauner>
Date: Wed, 21 Oct 2026 15:46:42 +0200
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
X-Mailer: b4 0.17-dev-3d1b8

On Tue, 20 Oct 2026 21:11:01 +0300, Avi Weiss wrote:
> dequeue_synchronous_signal() checks whether an unblocked
> synchronous signal is pending, but its queue scan can select a
> different blocked entry with a positive si_code. This can deliver
> a signal while it is still blocked.
> 
> Check the blocked mask for each queued entry. Forced faults
> are unblocked when necessary by force_sig_info_to_task(), and the
> existing pending bookkeeping is unchanged.
> 
> [...]

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] signal: skip blocked signals in dequeue_synchronous_signal()
      https://git.kernel.org/vfs/vfs/c/2e835d0af134

