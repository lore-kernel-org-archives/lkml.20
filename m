Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6713F6C59
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814494; cv=none; b=PzZbv7WTsgGMbMDgpv3hXpHBJJcD5YcqpfimqS3g94cfjPvQCwW+JKy2lF9JbgkQ23SkqyZBA1g7ldD699d1OirsWZuqKI0jFQ+HNw+NIIY4ZHQvmPdenH8A7KqQGYPpoy7yLPE4y/ZckrHBSgtcrDX3WHc/xDZIP6vPN9Nsr7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814494; c=relaxed/simple;
	bh=Gys3WzWdLtuvmle5dtTIppXoUEEmGA5cXZxMxR3XyjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j66uKorbzUVDgsIiZ+ty9BZ/uuJq1PavrSScTF6q5kOoBG0kEAfT70B3VXxOg3bJ6Aae/184gna6KuGKe6H9VtGxGBSf7qlgzgidcqlV9rp9qDlEZrQ26VMFPX8WMxpT44pxbVgvCeclU3+TsGWXzxYzKzXY6+vEqfM3Hb/2X9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4FETxB0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4FETxB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D451F00A3D;
	Mon,  7 Sep 2026 20:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788814493;
	bh=FgoYoVZdcP9kjl2wNHg9gnlsTZhvaykO0axbADxgLJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z4FETxB0RgG54eaNNPhjCZ7ewA2helATk7xF4l4Ulxg1+f6KPsttv+y5GMJlao3Cv
	 IwQtVkNSyB8wYkQUCibA7FJqcy+7Fp+qwjfBtKt22/akKKh0+53IA4BlRehlJrWxF2
	 /j8x7W01gEM5cqb2DaECFoO4UdXHuKCPReXftDbQLfSuoQxLxXnhPyZzf5Ig4bKSDf
	 hXr6IWcl2iTJOtpf8QkJQt0VR6q/79OSjPbj4EOoh5xjhT1eXqCO7Y7lu3CYP6Pfml
	 CZohrRzSSNPcTfasUyJLKNgTvRyX2yVX0kbSSGgGdFeS0GaOHDMC+yF/+bsVCzia2l
	 gN4lhThYKK9WA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] bus: fsl-mc: fix repeated word 'for' in comment
Date: Mon,  7 Sep 2026 22:54:36 +0200
Message-ID: <178881446327.32908.13049803708638296590.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260904124540.7652-3-hemanth.selam@gmail.com>
References: <20260904124540.7652-1-hemanth.selam@gmail.com> <20260904124540.7652-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=397; i=chleroy@kernel.org; h=from:subject:message-id; bh=kKWlvlmIFd+90igX+YxUUgDgdw4Cabj9IAKtxaYDjek=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTNV5my/lfYVy/FnxwSn/p2agbNO/l8yRSF1VlKNecMN kovtPQ411HKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAm8teOkeHalh+Ftb4CL02l TndrVlVp5ESGMmbfmsejtzto/dWkKWqMDBNc5ltX9O7WOtErrOE398Ql6eUtk+U+PJ/LdOTK4xu xnuwA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Fri, 04 Sep 2026 18:15:36 +0530, Hemanth Selam wrote:
> Drop the second 'for', reported by checkpatch.pl as a possible repeated
> word.  Only touches a comment, no code changes.
> 
> 

Applied, thanks!

[2/3] bus: fsl-mc: fix repeated word 'for' in comment
      commit: bada60f2d98c7cf252b1f8214e5b6ec96c429588

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
