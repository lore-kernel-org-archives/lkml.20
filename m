Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0CD476CC6;
	Tue,  1 Sep 2026 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256949; cv=none; b=SIjgvgRy3dF4iZ9T7eVCtrad3P5ke3TdtC1rlimxUEYWDBoMzKNUW/En6zHUxNmJOqFfuY7KEFG6FL19QDoX7ggyuB2e3ALT16mMcLulXuiLLEcjGFS2lyjHnZpGo1TBSEvI1htarr6Q4/pniym8ebwLjzGZ7k1lb6rvMVNw590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256949; c=relaxed/simple;
	bh=mFW6EG0QKV8rudZyb7bA+aTUR22PtK2i6WIV+YFeLaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBqDKNx9gVv/MdqZTPTgczdLz8vwzIKytjIGqvQp6hqxa0H7Klhn+72Yr1Ikj/chPmA6gfMZSLGp0b8e6Eljx3QAFB/EZ2QmRSwNsXs/tJUNtqwkzoA/PA0oFEhpzRND9Y/zZ++Qj7zG7qB5xb43O56CtMwfLYACX0sRLVsB5Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PyoKdoTh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PyoKdoTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5034A1F000E9;
	Tue,  1 Sep 2026 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788256947;
	bh=7XkUKpEwnoNhsgI/b6XMMglzKhtcBfBvsR5QefBJW10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PyoKdoTh80XCGcqm/8rhAg5c8417bAqnLLrzKzkzoFM8s/pyuuivAsiUDIa6qTzey
	 bZgrmfYe5CY0Bh2aYzRUrUhIWUSe7PIUp9quec0Lt4muQVxVbuTdjRCvpRMIB/yKla
	 x4pD5u/siHxjbMvEfCHyo95gBUkl5ovMkBz7eNKE=
Date: Tue, 1 Sep 2026 12:02:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mohit D Patel <mdp.cs3544@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hans de Goede <hansg@kernel.org>, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: rename dot11AuthAlgrthm to
 dot11_auth_algrthm
Message-ID: <2026090105-churn-storage-0efc@gregkh>
References: <cf384fae-ad2b-4b50-8a4e-9b7a6041bda8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf384fae-ad2b-4b50-8a4e-9b7a6041bda8@gmail.com>

On Wed, Aug 12, 2026 at 09:26:13PM -0400, Mohit D Patel wrote:
> Rename dot11AuthAlgrthm to dot11_auth_algrthm to match kernel
> coding style. Flagged by checkpatch --strict as CamelCase.
> No functional change.
> 
> Signed-off-by: Mohit D Patel <mdp.cs3544@gmail.com>
> ---
> This is my very humble first attempt at contributing to the Linux kernel. I
> look forward to getting feedback on it and for the opportunity to help out more
> in the future.

This doesn't apply against the latest tree.  Please rebase against
staging-testing and resend.

thanks,

greg k-h
