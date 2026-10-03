Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F630D3E0
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041125; cv=none; b=AlMU7m/i0esyyGTeSsVCNzeTgJjW3E4r/i1orK0R0um6Be9uZ7oO81lB7bSOAbTQvY2IgDON+gPrBBlnTP4e3h/y5JBOetat7JXV9W/CP9HhtywcVI7T/xauhTHb5NvoyAbuMmpoXmGALPP3TUd7D4sVGjke6bXEdDB0Wgd3HY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041125; c=relaxed/simple;
	bh=a2/7eKXHNC4+YxVXoVix7IlX5juixyccr/KiVke1MS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hjy4zHsfSms8dbc0FBEN2Xn95ndDvLCaNnG1pd1m5JqUBCWXe2DdCQorYQekrw5zIJ9t7VJJY0B9n74MJmsrgTcVb8VyMBqLi2vxDeVIQWJud2I5J+uxzJqfQgfgi0eZ/CfbMlF82m+9HdoOac2qr4cUYUEEgXmFCGzdAR2HhJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RijQrBJU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RijQrBJU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2160B1F0089C;
	Sat,  3 Oct 2026 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041124;
	bh=Bwb0uQvjF5uOv/mdqqLowm/S3PGsxAPSbHv05csY3hQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RijQrBJUFx3FnIsikmoyrSHdF8f5DD698drgXSSHZnVsiJFCiYREfBWRQC6L+buSg
	 9BB1ibxHFOknW1KXzOTK8WZB06tYVIuKyzDM5m7g4yYBQdfjgssXA8SmuK4Rkb2ygS
	 38SQKDA2SRsQiV+hMqJzI55kwEWdHnypYw2nJJYLZ8z2MjIx/96MZ4mr+dfQp3eKKt
	 4Xi4a+mkVwf06VcQ2O8b6jYfISlQNWgKkwpjNQddHCI8Ph7P9k/IpvAdizeRKVRn6v
	 y/fYh42PXXLsNPaI4Dwu9Dbjs1KYh3luxxMMuFVN3QOvN49J69RzCZt8QnujZleUCk
	 9+Xl1+WBBPcRw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260907062518.12810-1-hemanth.selam@gmail.com>
References: <20260907062518.12810-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] phy: fix typos in comments
Message-Id: <179104112277.223537.1284926343224482532.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 17:25:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 07 Sep 2026 11:55:18 +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> 

Applied, thanks!

[1/1] phy: fix typos in comments
      commit: f1d07d242b4c25a259276cc2b136f49c68ee71ab

Best regards,
-- 
~Vinod


