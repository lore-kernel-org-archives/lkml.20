Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B874A6CF8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529236; cv=none; b=BCB8pB6/npdJ+4EESBpeojUE/XZk05joE3hBHnDcUKgTjF3mM7bxvxWPHnT7AqLMUj2Lhw1AolOtfXy+zhkN3aSGBOZqLI8rAdxNkiFxDJTi30RHmvgJd9RFZ6Po5zqPxbztPd8c1bj7ho+TaYah+2LN6gt/Gxj0jrint/fBNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529236; c=relaxed/simple;
	bh=/Xe+uxcVw8m6hLB972fatwczF19oUIBKJu5BYu3w2v8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T8FWG76OGNtiZhYp24wvZVvViFqEX3f0c+Y7Z2KAjQov2/aVgOnN+Fqap29F+FSwkEYbXoCCKwHdggcPhtLAVwEvBJw/XMKRedFiN73K06gDzGc8fk1mIqULkNsQdKVfu6lvA3a0hiW2DiFY7WlYe4MeVqmQ3iI9qM2D+20Vrxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqAMSWCK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqAMSWCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC261F00A3E;
	Fri,  4 Sep 2026 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529234;
	bh=Qe5f+g+FV/dICLmx/be0Vfy+xV8+SKt9swqXdGmGdfI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PqAMSWCKTeEfd8f76F6i4H0wh/VWlOQdBQA55452Pyx7FyxlqeUVo3xCp1fKY+KUP
	 7L7cTPQSAX7BbxiMwRtfJmHar+O53MLiFM9B7BDgiPNm6HsNyN81o9D0SJ8tRVVWw3
	 QFsXd7ENcP6vCLGgmvhFgZbBLyuWynJYYrJQ3GVynHcu6h+bV1hg7pkBV1wQ9+BGQz
	 1EGc8VgpegDjrKqvyHmAYa/ISDFObMgKQY6EnxxKk4u/9zAYxS2ayrf0XcagGWJS7i
	 BTfJPUglVqNNss5sNaLdLEfmFjI/QlNnDDbuj9OztXlk4WuKMKSpyyG3DlPXfw+Kun
	 ODVoKNBq4uivw==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-kernel@vger.kernel.org
In-Reply-To: <20260713091206.2414400-1-mwalle@kernel.org>
References: <20260713091206.2414400-1-mwalle@kernel.org>
Subject: Re: [PATCH v2 0/8] mtd: spi-nor: Rework flash parameter
 initialization
Message-Id: <178852923271.3340372.15008856603494234277.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 13 Jul 2026 11:11:38 +0200, Michael Walle wrote:
> Try to simplify the flash initialization and get rid of the legacy
> handling. As default, all the flags of the in-kernel database are
> taken and amended with the SFDP data.
> 
> This might have the consequence that all the flashes now get a
> RDSFPD opcode which might be an unknown opcode. But that was already
> the case for any flashes which were unknown to the linux kernel. So
> far, there was not a single complaint. See patch 8 for more
> information.
> 
> [...]

Applied, thanks!

[1/8] mtd: spi-nor: spansion: s25fl256s0: remove SKIP_SFDP flag
      commit: 0132eaac40518f6ebb42131e5005efc375473e8e
[2/8] mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES flag on failure
      commit: a4cd8da7f2bda7562a7e156ee9c9e9b3ba98208e
[3/8] mtd: spi-nor: move cmd_ext_type into spi_nor_flash_parameter
      commit: e37ee8734881a7f92dbbeecf8cc129dd8a6a76b8
[4/8] mtd: spi-nor: move flags into spi_nor_flash_parameter
      commit: 0ede46b4f5b38cb43225927abbf088dd568db54e
[5/8] mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp
      commit: 69d9d7dabbebd91cd8aba4e23caabe9b34d2722c
[6/8] mtd: spi-nor: spansion: s25fs256t: move ARCFN check into .late_init
      commit: d395d4b8e76b1dfdb2f46b29c62e7f1f4850c9b2
[7/8] mtd: spi-nor: push the rollback mechanism into the sfdp module
      commit: d20029474a76a06a2a92427453c2326cc3e98dfa
[8/8] mtd: spi-nor: rework flash parameter initialization
      commit: 90a8ed3c63b905dcd375585da6f4851d88cc343d

Best regards,
-- 
Michael Walle <mwalle@kernel.org>

