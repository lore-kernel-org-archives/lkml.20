Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038C83D3CE6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578473; cv=none; b=fLgLX2LjjhJHliucKdCgVFgz3hN4LUp6RRhQk5QZFEiOl3BziMWMjpymHA75unTLeS+tOsFUOLvwgukzotQkxsR8QoYGzgtjD1TYF+t+aP4TMyUGw93m4Rp21GOew8OIaZ7Ah1Na1oU7uIKpDw9tbuhg9jYNRCEFz6MhueBshbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578473; c=relaxed/simple;
	bh=kdjyHRSIuo6AaP3CxoJy2I2uitv1KnUbvJMCb1u7VXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j3ZPUCLiANSj96rL2pgjYAqAniLwPzCujbo6WRw5cKaW08XdeHXBN7EXlFIJ6F9g3vp2Q29vGPZKhm9GVZJKiLN7xQa17aqHYoao5McCpgW5K6O1FN6cY5QXwaLw0ycZtD/ujOVMr8bOfFiY9ZqDfEgJxbFBJS869i0O4NIrTGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9ividgi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9ividgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDB11F000FF;
	Fri,  9 Oct 2026 20:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791578472;
	bh=dtwC9CXJly+CcF9ksjU2Oxl/SgqlNJdHppwI7tS0WQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R9ividgij+OVceiV18k/xtyYOEOd6A1oD+fojTAerK0S3Alk9CPACSugq58brvf6l
	 7jdzlGZKGL6DKbnFTHc0W8Q4SoXCEH+ADF+5/kThENlJ5jMr6djZnKF9A0Mqta2BaA
	 /t0D/7xGCHnUERa3Q4NFEFp1VET6nV/HrG+XEq3hMw/RKCx9CbhWHt6CuMAYCUH3nZ
	 Jpx7CGEV6XikbsYZtMf+tXg7t8RNWxjbsAnSd/1fTRH9xXyKfPXuaaTmmIoIqqclhk
	 yd3z6mNUiOUm9UaSByTHMM6ODTjJan0aI3oAwtcYIBTI3nue8W7dL4ZauILirnus4w
	 i0UEscWYNwbug==
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Glass <sjg@chromium.org>, Ting-Han Hou <ue081723@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
References: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Ignore schema checks when
 decomposing DTBs
Message-Id: <179157846311.778396.11816417974301350236.b4-ty@b4>
Date: Fri, 09 Oct 2026 22:41:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=745; i=nathan@kernel.org;
 h=from:subject:message-id; bh=kdjyHRSIuo6AaP3CxoJy2I2uitv1KnUbvJMCb1u7VXU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFknA5NbphZNmLvhZaqk9CUT9trjFQdfnfl0nifauJn7B
 k/Pna6KjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRLU8YGdb6yid0Jt046xNv
 83HeVPlVCjMFYu/W+78/+uqLfZOlhCkjwxR9r/lvuV1U1xnvztf1Wt2U5Ff0bfPGNu80M2eh9sl
 CjAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Tue, 06 Oct 2026 08:19:54 -0700, Ting-Han Hou wrote:
> scripts/make_fit: Ignore schema checks when decomposing DTBs

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] scripts/make_fit: Ignore schema checks when decomposing DTBs
      https://git.kernel.org/kbuild/c/3bf2237f59af8

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


