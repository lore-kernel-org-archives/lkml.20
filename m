Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DBA35CB7C;
	Sun, 13 Sep 2026 23:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341796; cv=none; b=bXSGdlw2yivvMDjxXaeoX8KZaJXjmFJayiqtkH+IM0St/1IsYx4Zc/Fwkj1KLNuuFZMaHIoeUNa715lUXqLnYxBkCrn9dElpUPCN9XboYbvmIPYcaz48i+JGvq3o0PVW0Th3td4jAD4cV4ClxmUPHGAHzJreO1ZXAbtYxc4DaKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341796; c=relaxed/simple;
	bh=3LgRdcDBtuvRVn6jv+Fj093ma+ZGtOjE8hhZGZOE5yM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sBaGFfofhndjzCEAmSEKI6EVyOtGV6ebCv883vgjzNPYVeZIPce4KlBAAmmBZZPGaV7sJaeR3f2S0ymN89fnGazXYrgHgnOh0u/H8POrXf4irTV9MluRvzE7g/wxyUksoaTQVQIDqg2DrZkvns+oFPeIFU1qcry3R+Zput1z734=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4h37L6a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4h37L6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741C91F000FF;
	Sun, 13 Sep 2026 23:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789341794;
	bh=p7Jh7SO9wd9t9gNYIvv1yX3UJ7ftW6owHjp7R3BD+Cw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I4h37L6ajEGf9JvIQHt8zhJCHUc5x/Y8BGvp7He1J2RrwNKDXDKycJFW1VT6z0EWy
	 AMi4vjpUQIULb+2KRJ7AnoayVhBomW9ce2vxIKwhK1JiUcJxFZAGpDK0iQsM+qAGLq
	 JvbCu+b3Mfu3IQT63MUFAomhtNlf0WY2+najnkTUiOXt40riwzbeNo+ZvUPcIjm6VO
	 TsqKIyzJEO6P4ylpM6kWPbXuXSadAvWJ1rn4Yuok7zeGUSRXGpug7f6yaFQbajQ7TF
	 ViN94j1TC7tgEmhNhEMwdWA+6IA7gWy8TJi7FOsUG3Gr17ODWw74vTe1d+cP/wez1x
	 8dyLcdPPFnqpA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260910121047.1592541-1-rf@opensource.cirrus.com>
References: <20260910121047.1592541-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Firmware search progress log should not
 look like an error
Message-Id: <178934177639.1239410.17559554473351119253.b4-ty@b4>
Date: Mon, 14 Sep 2026 00:22:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3LgRdcDBtuvRVn6jv+Fj093ma+ZGtOjE8hhZGZOE5yM=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqzlBrHyTgU57x8GSXqtXJ8ZwRu655ZItuWZ6CoNroj/O
 /4K+Gp1MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQAT6VvN/j+Is1fHS8Hv/w2r
 U2VxjsVq+qVzbsdN9tgfpnF9peKPN/5v1tvPPuggaHj2gHL3a6NHHpEzWWwuuB6yeJnkZKD2ySh
 Hx/DcXeXXWr8to3cq6requATpVghGy86IZLIK5n+mK7dxkdaD89u4Nr/8sG59//EKEbVNtTHO/A
 63zwnF6+7cxzV30r4EGaFGC8UnvIUXmX7sVS+zLlopkemyyn2DrJrs+QdK2Qcizpsa6u2Pza4Sd
 vyaK2rPGnf13sE+Aabww1lmq97XuAqfSft94tantFOMFjs0j9bNLBBdIzdp7dHA169v3Zdk54/b
 tLx0vqRirv8Kp73lTyOe/Y/MnRdd+JupWm3GxmvSp5l7AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 10 Sep 2026 13:10:46 +0100, Richard Fitzgerald wrote:
> ASoC: wm_adsp: Firmware search progress log should not look like an error

Applied to

   local tree v7.3-rc3

Thanks!

[1/1] ASoC: wm_adsp: Firmware search progress log should not look like an error
      commit: 77495d22e8a4dcfcbf404de2dd51f8279b782bb8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

